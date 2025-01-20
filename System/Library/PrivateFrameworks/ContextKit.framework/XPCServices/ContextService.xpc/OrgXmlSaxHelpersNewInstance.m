@interface OrgXmlSaxHelpersNewInstance
+ (const)__metadata;
+ (id)newInstanceWithNSString:(id)a3;
@end

@implementation OrgXmlSaxHelpersNewInstance

+ (id)newInstanceWithNSString:(id)a3
{
  v3 = (void *)IOSClass_forName_(a3);
  if (!v3) {
    JreThrowNullPointerException();
  }
  return [v3 newInstance];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10045D940;
}

@end