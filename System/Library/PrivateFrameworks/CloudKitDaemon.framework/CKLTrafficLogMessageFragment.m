@interface CKLTrafficLogMessageFragment
- (CKLTrafficLogMessageFragment)initWithMessage:(id)a3;
- (NSString)dataString;
- (NSString)uuid;
- (id)description;
- (int64_t)seqNum;
- (unint64_t)type;
@end

@implementation CKLTrafficLogMessageFragment

- (CKLTrafficLogMessageFragment)initWithMessage:(id)a3
{
  id v4 = a3;
  if ((unint64_t)objc_msgSend_length(v4, v5, v6) < 0x26
    || (uint64_t v8 = objc_msgSend_rangeOfString_(v4, v7, @":"), v8 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v9 = 0;
  }
  else
  {
    uint64_t v10 = v8;
    v27.receiver = self;
    v27.super_class = (Class)CKLTrafficLogMessageFragment;
    v12 = [(CKLTrafficLogMessageFragment *)&v27 init];
    if (v12)
    {
      v13 = objc_msgSend_substringWithRange_(v4, v11, 0, 1);
      v12->_type = objc_msgSend_integerValue(v13, v14, v15);

      uint64_t v17 = objc_msgSend_substringWithRange_(v4, v16, 1, 36);
      uuid = v12->_uuid;
      v12->_uuid = (NSString *)v17;

      v20 = objc_msgSend_substringWithRange_(v4, v19, 37, v10 - 37);
      v12->_seqNum = objc_msgSend_integerValue(v20, v21, v22);

      uint64_t v24 = objc_msgSend_substringFromIndex_(v4, v23, v10 + 1);
      dataString = v12->_dataString;
      v12->_dataString = (NSString *)v24;
    }
    self = v12;
    v9 = self;
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v10 = objc_msgSend_type(self, v6, v7) - 1;
  if (v10 > 6) {
    v11 = @"Unknown type";
  }
  else {
    v11 = off_1E64F4850[v10];
  }
  uint64_t v12 = objc_msgSend_seqNum(self, v8, v9);
  uint64_t v15 = objc_msgSend_dataString(self, v13, v14);
  uint64_t v18 = objc_msgSend_length(v15, v16, v17);
  v21 = objc_msgSend_uuid(self, v19, v20);
  v23 = objc_msgSend_stringWithFormat_(v3, v22, @"<%@ %p> [Type: %@, Seq: %ld, Len: %lu, UUID: %@]", v5, self, v11, v12, v18, v21);

  return v23;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (int64_t)seqNum
{
  return self->_seqNum;
}

- (NSString)dataString
{
  return self->_dataString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataString, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end