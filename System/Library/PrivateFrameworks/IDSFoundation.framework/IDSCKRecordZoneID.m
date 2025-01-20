@interface IDSCKRecordZoneID
+ (Class)__class;
+ (id)alloc;
- (NSString)ownerName;
- (NSString)zoneName;
@end

@implementation IDSCKRecordZoneID

+ (Class)__class
{
  if (qword_1E944F530 != -1) {
    dispatch_once(&qword_1E944F530, &unk_1EEFCDC98);
  }
  v2 = (void *)qword_1E944F528;
  return (Class)v2;
}

+ (id)alloc
{
  v4 = (objc_class *)objc_msgSend___class(a1, a2, v2, v3);
  return [v4 alloc];
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (NSString)ownerName
{
  return self->_ownerName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerName, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
}

@end