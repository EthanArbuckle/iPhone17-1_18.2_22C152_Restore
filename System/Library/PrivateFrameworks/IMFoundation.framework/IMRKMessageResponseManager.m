@interface IMRKMessageResponseManager
+ (Class)__class;
+ (id)alloc;
+ (id)sharedManager;
@end

@implementation IMRKMessageResponseManager

+ (Class)__class
{
  if (qword_1E92DB140 != -1) {
    dispatch_once(&qword_1E92DB140, &unk_1EE230238);
  }
  v2 = (void *)qword_1E92DB118;
  return (Class)v2;
}

+ (id)alloc
{
  v4 = (objc_class *)objc_msgSend___class(a1, a2, v2, v3);
  return [v4 alloc];
}

+ (id)sharedManager
{
  v4 = objc_msgSend___class(a1, a2, v2, v3);
  return (id)objc_msgSend_sharedManager(v4, v5, v6, v7);
}

@end