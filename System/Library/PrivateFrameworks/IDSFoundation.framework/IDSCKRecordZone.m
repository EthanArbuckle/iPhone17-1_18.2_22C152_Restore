@interface IDSCKRecordZone
+ (Class)__class;
+ (id)alloc;
- (IDSCKRecordZoneID)zoneID;
@end

@implementation IDSCKRecordZone

+ (Class)__class
{
  if (qword_1E944F540 != -1) {
    dispatch_once(&qword_1E944F540, &unk_1EEFCDE78);
  }
  v2 = (void *)qword_1E944F538;
  return (Class)v2;
}

+ (id)alloc
{
  v4 = (objc_class *)objc_msgSend___class(a1, a2, v2, v3);
  return [v4 alloc];
}

- (IDSCKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (void).cxx_destruct
{
}

@end