@interface XRSchemaAnnotationElementParser
+ (id)_elementNameToClassMap;
- (XRSchemaAnnotationTextValuesDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)textParserCompletedParsing:(id)a3 elementName:(id)a4;
@end

@implementation XRSchemaAnnotationElementParser

+ (id)_elementNameToClassMap
{
  if (qword_2687AA118 != -1) {
    dispatch_once(&qword_2687AA118, &unk_26E752510);
  }
  v2 = (void *)qword_2687AA110;

  return v2;
}

- (void)textParserCompletedParsing:(id)a3 elementName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [self delegate:v8 didFinishLaunchingWithOptions:v9];
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  [v14 textParserCompletedParsing:v12 elementName:v7];
}

- (XRSchemaAnnotationTextValuesDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (XRSchemaAnnotationTextValuesDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end