@interface IDSCKDatabase
+ (Class)__class;
+ (IDSCKDatabase)alloc;
@end

@implementation IDSCKDatabase

+ (Class)__class
{
  if (qword_1E944F4C0 != -1) {
    dispatch_once(&qword_1E944F4C0, &unk_1EEFCE298);
  }
  v2 = (void *)qword_1E944F4B8;
  return (Class)v2;
}

+ (IDSCKDatabase)alloc
{
  v4 = (objc_class *)objc_msgSend___class(a1, a2, v2, v3);
  return (IDSCKDatabase *)[v4 alloc];
}

@end