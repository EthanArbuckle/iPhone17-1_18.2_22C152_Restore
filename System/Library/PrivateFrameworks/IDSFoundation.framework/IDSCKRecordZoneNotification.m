@interface IDSCKRecordZoneNotification
+ (Class)__class;
+ (id)alloc;
- (IDSCKRecordZoneID)recordZoneID;
@end

@implementation IDSCKRecordZoneNotification

+ (Class)__class
{
  if (qword_1E944F5C0 != -1) {
    dispatch_once(&qword_1E944F5C0, &unk_1EEFCE258);
  }
  v2 = (void *)qword_1E944F5B8;
  return (Class)v2;
}

+ (id)alloc
{
  v4 = (objc_class *)objc_msgSend___class(a1, a2, v2, v3);
  return [v4 alloc];
}

- (IDSCKRecordZoneID)recordZoneID
{
  return self->_recordZoneID;
}

- (void).cxx_destruct
{
}

@end