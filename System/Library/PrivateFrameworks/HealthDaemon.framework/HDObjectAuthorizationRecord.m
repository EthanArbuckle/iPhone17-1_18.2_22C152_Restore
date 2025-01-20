@interface HDObjectAuthorizationRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HDObjectAuthorizationRecord)init;
- (HDObjectAuthorizationRecord)initWithCoder:(id)a3;
- (NSUUID)objectUUID;
- (NSUUID)sessionUUID;
- (NSUUID)sourceUUID;
- (double)modificationDate;
- (id)description;
- (int64_t)status;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setModificationDate:(double)a3;
- (void)setObjectUUID:(id)a3;
- (void)setSessionUUID:(id)a3;
- (void)setSourceUUID:(id)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation HDObjectAuthorizationRecord

- (HDObjectAuthorizationRecord)init
{
  v3.receiver = self;
  v3.super_class = (Class)HDObjectAuthorizationRecord;
  result = [(HDObjectAuthorizationRecord *)&v3 init];
  if (result) {
    result->_status = 0;
  }
  return result;
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = [(NSUUID *)self->_objectUUID UUIDString];
  v5 = [(NSUUID *)self->_sourceUUID UUIDString];
  v6 = [(NSUUID *)self->_sessionUUID UUIDString];
  int64_t status = self->_status;
  v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_modificationDate];
  v9 = [v3 stringWithFormat:@"<Object: %@ Source: %@ Session: %@ Status: %ld Mod: %@>", v4, v5, v6, status, v8];

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_sourceUUID hash];
  uint64_t v4 = [(NSUUID *)self->_objectUUID hash] ^ v3;
  return v4 ^ [(NSUUID *)self->_sessionUUID hash] ^ self->_status ^ (unint64_t)self->_modificationDate;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (double *)a3;
  objc_opt_class();
  BOOL v11 = (objc_opt_isKindOfClass() & 1) != 0
     && ((sourceUUID = self->_sourceUUID, v6 = (NSUUID *)*((void *)v4 + 2), sourceUUID == v6)
      || v6 && -[NSUUID isEqual:](sourceUUID, "isEqual:"))
     && ((objectUUID = self->_objectUUID, v8 = (NSUUID *)*((void *)v4 + 1), objectUUID == v8)
      || v8 && -[NSUUID isEqual:](objectUUID, "isEqual:"))
     && ((sessionUUID = self->_sessionUUID, v10 = (NSUUID *)*((void *)v4 + 3), sessionUUID == v10)
      || v10 && -[NSUUID isEqual:](sessionUUID, "isEqual:"))
     && self->_status == *((void *)v4 + 4)
     && self->_modificationDate == v4[5];

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDObjectAuthorizationRecord)initWithCoder:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)HDObjectAuthorizationRecord;
  v5 = [(HDObjectAuthorizationRecord *)&v28 init];
  if (!v5) {
    goto LABEL_5;
  }
  [v4 decodeDoubleForKey:@"mod"];
  v5->_modificationDate = v6;
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sid"];
  sourceUUID = v5->_sourceUUID;
  v5->_sourceUUID = (NSUUID *)v7;

  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"oid"];
  objectUUID = v5->_objectUUID;
  v5->_objectUUID = (NSUUID *)v9;

  uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionid"];
  sessionUUID = v5->_sessionUUID;
  v5->_sessionUUID = (NSUUID *)v11;

  if (!v5->_sourceUUID || !v5->_objectUUID)
  {
    _HKInitializeLogging();
    v15 = (void *)*MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      v16 = v15;
      v17 = objc_opt_class();
      v19 = v5->_objectUUID;
      v18 = v5->_sourceUUID;
      *(_DWORD *)buf = 138543874;
      v30 = v17;
      __int16 v31 = 2114;
      int64_t v32 = (int64_t)v18;
      __int16 v33 = 2114;
      v34 = v19;
      id v20 = v17;
      v21 = "Decoded %{public}@ has incomplete source and object IDs: %{public}@, %{public}@";
      v22 = v16;
      uint32_t v23 = 32;
LABEL_10:
      _os_log_error_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
    }
LABEL_11:
    v14 = 0;
    goto LABEL_12;
  }
  unint64_t v13 = [v4 decodeIntegerForKey:@"stat"];
  v5->_int64_t status = v13;
  if (v13 >= 3)
  {
    _HKInitializeLogging();
    v24 = (void *)*MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      v16 = v24;
      v25 = objc_opt_class();
      int64_t status = v5->_status;
      *(_DWORD *)buf = 138543618;
      v30 = v25;
      __int16 v31 = 2048;
      int64_t v32 = status;
      id v20 = v25;
      v21 = "Decoded %{public}@ has invalid authorization status: %ld";
      v22 = v16;
      uint32_t v23 = 22;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
LABEL_5:
  v14 = v5;
LABEL_12:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  sourceUUID = self->_sourceUUID;
  id v5 = a3;
  [v5 encodeObject:sourceUUID forKey:@"sid"];
  [v5 encodeObject:self->_objectUUID forKey:@"oid"];
  [v5 encodeObject:self->_sessionUUID forKey:@"sessionid"];
  [v5 encodeInteger:self->_status forKey:@"stat"];
  [v5 encodeDouble:@"mod" forKey:self->_modificationDate];
}

- (NSUUID)objectUUID
{
  return self->_objectUUID;
}

- (void)setObjectUUID:(id)a3
{
}

- (NSUUID)sourceUUID
{
  return self->_sourceUUID;
}

- (void)setSourceUUID:(id)a3
{
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_int64_t status = a3;
}

- (double)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(double)a3
{
  self->_modificationDate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_sourceUUID, 0);

  objc_storeStrong((id *)&self->_objectUUID, 0);
}

@end