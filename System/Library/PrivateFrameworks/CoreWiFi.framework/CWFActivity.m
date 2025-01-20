@interface CWFActivity
+ (BOOL)supportsSecureCoding;
+ (id)activityWithType:(int64_t)a3 reason:(id)a4;
+ (id)activityWithType:(int64_t)a3 reason:(id)a4 UUID:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToActivity:(id)a3;
- (CWFActivity)init;
- (CWFActivity)initWithCoder:(id)a3;
- (NSString)reason;
- (NSUUID)UUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)type;
- (unint64_t)hash;
- (unint64_t)timeout;
- (void)encodeWithCoder:(id)a3;
- (void)setReason:(id)a3;
- (void)setTimeout:(unint64_t)a3;
- (void)setType:(int64_t)a3;
- (void)setUUID:(id)a3;
@end

@implementation CWFActivity

- (CWFActivity)init
{
  v10.receiver = self;
  v10.super_class = (Class)CWFActivity;
  v6 = [(CWFActivity *)&v10 init];
  if (v6)
  {
    uint64_t v7 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v2, v3, v4, v5);
    UUID = v6->_UUID;
    v6->_UUID = (NSUUID *)v7;
  }
  return v6;
}

+ (id)activityWithType:(int64_t)a3 reason:(id)a4
{
  id v5 = a4;
  v6 = objc_alloc_init(CWFActivity);
  objc_msgSend_setType_(v6, v7, a3, v8, v9);
  objc_msgSend_setReason_(v6, v10, (uint64_t)v5, v11, v12);

  return v6;
}

+ (id)activityWithType:(int64_t)a3 reason:(id)a4 UUID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = objc_alloc_init(CWFActivity);
  objc_msgSend_setType_(v9, v10, a3, v11, v12);
  objc_msgSend_setReason_(v9, v13, (uint64_t)v8, v14, v15);

  if (v7) {
    objc_msgSend_setUUID_(v9, v16, (uint64_t)v7, v17, v18);
  }

  return v9;
}

- (id)description
{
  id v5 = NSString;
  int64_t type = self->_type;
  unint64_t timeout = self->_timeout;
  reason = self->_reason;
  uint64_t v9 = objc_msgSend_UUIDString(self->_UUID, a2, v2, v3, v4);
  v13 = objc_msgSend_substringToIndex_(v9, v10, 5, v11, v12);
  uint64_t v17 = objc_msgSend_stringWithFormat_(v5, v14, @"type=%ld reason=%@ timeout=%lluns uuid=%@", v15, v16, type, reason, timeout, v13);

  return v17;
}

- (BOOL)isEqualToActivity:(id)a3
{
  id v4 = a3;
  uint64_t v9 = v4;
  if (self->_UUID)
  {
    uint64_t v14 = objc_msgSend_UUID(v4, v5, v6, v7, v8);
    if (v14)
    {
      UUID = self->_UUID;
      uint64_t v16 = objc_msgSend_UUID(v9, v10, v11, v12, v13);
      if (objc_msgSend_isEqual_(UUID, v17, (uint64_t)v16, v18, v19))
      {
        int64_t type = self->_type;
        BOOL v25 = type == objc_msgSend_type(v9, v20, v21, v22, v23);
      }
      else
      {
        BOOL v25 = 0;
      }
    }
    else
    {
      BOOL v25 = 0;
    }
  }
  else
  {
    BOOL v25 = 0;
  }

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CWFActivity *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char isEqualToActivity = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToActivity = objc_msgSend_isEqualToActivity_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    char isEqualToActivity = 0;
  }

  return isEqualToActivity;
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_hash(self->_UUID, a2, v2, v3, v4);
  return objc_msgSend_hash(self->_reason, v7, v8, v9, v10) ^ v6 ^ self->_type ^ self->_timeout;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v6 = objc_msgSend_allocWithZone_(CWFActivity, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setUUID_(v11, v12, (uint64_t)self->_UUID, v13, v14);
  objc_msgSend_setReason_(v11, v15, (uint64_t)self->_reason, v16, v17);
  objc_msgSend_setType_(v11, v18, self->_type, v19, v20);
  objc_msgSend_setTimeout_(v11, v21, self->_timeout, v22, v23);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  UUID = self->_UUID;
  id v5 = a3;
  objc_msgSend_encodeObject_forKey_(v5, v6, (uint64_t)UUID, @"_UUID", v7);
  objc_msgSend_encodeObject_forKey_(v5, v8, (uint64_t)self->_reason, @"_reason", v9);
  objc_msgSend_encodeInteger_forKey_(v5, v10, self->_type, @"_type", v11);
  objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v12, self->_timeout, v13, v14);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v15, (uint64_t)v17, @"_timeout", v16);
}

- (CWFActivity)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CWFActivity;
  id v5 = [(CWFActivity *)&v28 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"_UUID", v8);
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"_reason", v13);
    reason = v5->_reason;
    v5->_reason = (NSString *)v14;

    v5->_int64_t type = objc_msgSend_decodeIntegerForKey_(v4, v16, @"_type", v17, v18);
    uint64_t v19 = objc_opt_class();
    uint64_t v22 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, @"_timeout", v21);
    v5->_unint64_t timeout = objc_msgSend_unsignedLongLongValue(v22, v23, v24, v25, v26);
  }
  return v5;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (unint64_t)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(unint64_t)a3
{
  self->_unint64_t timeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end