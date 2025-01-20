@interface IDSCKServerChangeToken
+ (Class)__class;
+ (id)alloc;
@end

@implementation IDSCKServerChangeToken

+ (Class)__class
{
  if (qword_1E944F550 != -1) {
    dispatch_once(&qword_1E944F550, &unk_1EEFCDF78);
  }
  v2 = (void *)qword_1E944F548;
  return (Class)v2;
}

+ (id)alloc
{
  v4 = (objc_class *)objc_msgSend___class(a1, a2, v2, v3);
  return [v4 alloc];
}

@end