@interface XRSchemaAnnotationAppInfoElementParser
+ (id)_elementNameToClassMap;
- (void)setValue:(id)a3 forElementName:(id)a4;
@end

@implementation XRSchemaAnnotationAppInfoElementParser

+ (id)_elementNameToClassMap
{
  if (qword_2687AA040 != -1) {
    dispatch_once(&qword_2687AA040, &unk_26E752430);
  }
  v2 = (void *)qword_2687AA038;

  return v2;
}

- (void)setValue:(id)a3 forElementName:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [self->super.parent textParserCompletedParsing:v7 elementName:v9];
  }
}

@end