@interface IDSCKSubscription
+ (Class)__class;
+ (id)alloc;
@end

@implementation IDSCKSubscription

+ (Class)__class
{
  if (qword_1E944F610 != -1) {
    dispatch_once(&qword_1E944F610, &unk_1EEFCE3F8);
  }
  v2 = (void *)qword_1E944F608;
  return (Class)v2;
}

+ (id)alloc
{
  v4 = (objc_class *)objc_msgSend___class(a1, a2, v2, v3);
  return [v4 alloc];
}

@end