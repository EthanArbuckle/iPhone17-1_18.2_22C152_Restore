@interface IDSCKRecordID
+ (Class)__class;
+ (IDSCKRecordID)alloc;
@end

@implementation IDSCKRecordID

+ (Class)__class
{
  if (qword_1E944F4E0 != -1) {
    dispatch_once(&qword_1E944F4E0, &unk_1EEFCE678);
  }
  v2 = (void *)qword_1E944F4D8;
  return (Class)v2;
}

+ (IDSCKRecordID)alloc
{
  v4 = (objc_class *)objc_msgSend___class(a1, a2, v2, v3);
  return (IDSCKRecordID *)[v4 alloc];
}

@end