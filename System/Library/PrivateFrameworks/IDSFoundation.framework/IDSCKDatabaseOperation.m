@interface IDSCKDatabaseOperation
+ (Class)__class;
+ (id)alloc;
@end

@implementation IDSCKDatabaseOperation

+ (Class)__class
{
  if (qword_1E944F500 != -1) {
    dispatch_once(&qword_1E944F500, &unk_1EEFCE918);
  }
  v2 = (void *)qword_1E944F4F8;
  return (Class)v2;
}

+ (id)alloc
{
  v4 = (objc_class *)objc_msgSend___class(a1, a2, v2, v3);
  return [v4 alloc];
}

@end