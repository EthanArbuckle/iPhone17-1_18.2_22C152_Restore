@interface OrgXmlSaxHelpersParserFactory
+ (const)__metadata;
+ (id)__annotations;
+ (id)makeParserWithNSString:(id)a3;
@end

@implementation OrgXmlSaxHelpersParserFactory

+ (id)makeParserWithNSString:(id)a3
{
  id v3 = OrgXmlSaxHelpersNewInstance_newInstanceWithNSString_(a3);
  v4 = (void *)OrgXmlSaxParser_class_();
  if (v3 && ([v4 isInstance:v3] & 1) == 0) {
    JreThrowClassCastException();
  }
  return v3;
}

+ (id)__annotations
{
  id v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100472B40;
}

@end