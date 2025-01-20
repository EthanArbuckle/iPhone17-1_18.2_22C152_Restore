@interface HKObjectAuthorizationRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKObjectAuthorizationRecord)init;
- (HKObjectAuthorizationRecord)initWithCoder:(id)a3;
- (HKObjectAuthorizationRecord)initWithObjectUUID:(id)a3 sourceUUID:(id)a4 sessionUUID:(id)a5 status:(int64_t)a6 modificationDate:(double)a7;
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

@implementation HKObjectAuthorizationRecord

- (HKObjectAuthorizationRecord)init
{
  v8.receiver = self;
  v8.super_class = (Class)HKObjectAuthorizationRecord;
  v2 = [(HKObjectAuthorizationRecord *)&v8 init];
  v3 = v2;
  if (v2)
  {
    objectUUID = v2->_objectUUID;
    v2->_objectUUID = 0;

    sourceUUID = v3->_sourceUUID;
    v3->_sourceUUID = 0;

    sessionUUID = v3->_sessionUUID;
    v3->_sessionUUID = 0;

    v3->_status = 0;
    v3->_modificationDate = CFAbsoluteTimeGetCurrent();
  }
  return v3;
}

- (HKObjectAuthorizationRecord)initWithObjectUUID:(id)a3 sourceUUID:(id)a4 sessionUUID:(id)a5 status:(int64_t)a6 modificationDate:(double)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v16 = [(HKObjectAuthorizationRecord *)self init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_objectUUID, a3);
    objc_storeStrong((id *)&v17->_sourceUUID, a4);
    objc_storeStrong((id *)&v17->_sessionUUID, a5);
    v17->_status = a6;
    v17->_modificationDate = a7;
  }

  return v17;
}

- (id)description
{
  v3 = NSString;
  v4 = [(NSUUID *)self->_objectUUID UUIDString];
  v5 = [(NSUUID *)self->_sourceUUID UUIDString];
  v6 = [(NSUUID *)self->_sessionUUID UUIDString];
  int64_t status = self->_status;
  objc_super v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_modificationDate];
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
     && ((objectUUID = self->_objectUUID, objc_super v8 = (NSUUID *)*((void *)v4 + 1), objectUUID == v8)
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

- (HKObjectAuthorizationRecord)initWithCoder:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HKObjectAuthorizationRecord;
  v5 = [(HKObjectAuthorizationRecord *)&v23 init];
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
    id v15 = (void *)HKLogDatabase;
    if (os_log_type_enabled((os_log_t)HKLogDatabase, OS_LOG_TYPE_ERROR))
    {
      v16 = v15;
      v17 = objc_opt_class();
      v19 = v5->_objectUUID;
      v18 = v5->_sourceUUID;
      *(_DWORD *)buf = 138543874;
      v25 = v17;
      __int16 v26 = 2114;
      v27 = v18;
      __int16 v28 = 2114;
      v29 = v19;
      id v20 = v17;
      _os_log_error_impl(&dword_19C023000, v16, OS_LOG_TYPE_ERROR, "Decoded %{public}@ has incomplete source and object IDs: %{public}@, %{public}@", buf, 0x20u);
    }
    goto LABEL_10;
  }
  unint64_t v13 = [v4 decodeIntegerForKey:@"stat"];
  v5->_int64_t status = v13;
  if (v13 >= 3)
  {
    _HKInitializeLogging();
    v21 = (void *)HKLogDatabase;
    if (os_log_type_enabled((os_log_t)HKLogDatabase, OS_LOG_TYPE_ERROR)) {
      [(HKObjectAuthorizationRecord *)v21 initWithCoder:&v5->_status];
    }
LABEL_10:
    id v14 = 0;
    goto LABEL_11;
  }
LABEL_5:
  id v14 = v5;
LABEL_11:

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

- (void)initWithCoder:(uint64_t *)a3 .cold.1(void *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  id v5 = objc_opt_class();
  uint64_t v6 = *a3;
  int v8 = 138543618;
  uint64_t v9 = v5;
  __int16 v10 = 2048;
  uint64_t v11 = v6;
  id v7 = v5;
  _os_log_error_impl(&dword_19C023000, v4, OS_LOG_TYPE_ERROR, "Decoded %{public}@ has invalid authorization status: %ld", (uint8_t *)&v8, 0x16u);
}

@end