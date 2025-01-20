@interface JavaUtilResourceBundle_MissingBundle
+ (const)__metadata;
- (JavaUtilResourceBundle_MissingBundle)init;
- (id)getKeys;
- (id)handleGetObjectWithNSString:(id)a3;
@end

@implementation JavaUtilResourceBundle_MissingBundle

- (id)getKeys
{
  return 0;
}

- (id)handleGetObjectWithNSString:(id)a3
{
  return 0;
}

- (JavaUtilResourceBundle_MissingBundle)init
{
  self->super.lastLoadTime_ = 0;
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100466308;
}

@end