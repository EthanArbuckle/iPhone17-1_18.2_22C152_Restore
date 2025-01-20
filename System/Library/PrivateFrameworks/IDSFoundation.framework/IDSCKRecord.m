@interface IDSCKRecord
+ (Class)__class;
+ (id)alloc;
- (IDSCKRecordID)recordID;
- (IDSCKRecordKeyValueSetting)encryptedValuesByKey;
@end

@implementation IDSCKRecord

+ (Class)__class
{
  if (qword_1E944F4D0 != -1) {
    dispatch_once(&qword_1E944F4D0, &unk_1EEFCE478);
  }
  v2 = (void *)qword_1E944F4C8;
  return (Class)v2;
}

+ (id)alloc
{
  v4 = (objc_class *)objc_msgSend___class(a1, a2, v2, v3);
  return [v4 alloc];
}

- (IDSCKRecordID)recordID
{
  return self->_recordID;
}

- (IDSCKRecordKeyValueSetting)encryptedValuesByKey
{
  return self->_encryptedValuesByKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedValuesByKey, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
}

@end