@interface IDSCKQuery
+ (Class)__class;
+ (id)alloc;
@end

@implementation IDSCKQuery

+ (Class)__class
{
  if (qword_1E944F4F0 != -1) {
    dispatch_once(&qword_1E944F4F0, &unk_1EEFCE7B8);
  }
  v2 = (void *)qword_1E944F4E8;
  return (Class)v2;
}

+ (id)alloc
{
  v4 = (objc_class *)objc_msgSend___class(a1, a2, v2, v3);
  return [v4 alloc];
}

@end