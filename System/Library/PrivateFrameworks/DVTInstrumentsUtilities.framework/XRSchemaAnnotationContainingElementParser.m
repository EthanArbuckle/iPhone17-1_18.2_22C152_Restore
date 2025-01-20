@interface XRSchemaAnnotationContainingElementParser
+ (id)_elementNameToClassMap;
- (NSString)key;
- (XRSchemaAnnotationPropertyReportingDelegate)delegate;
- (id)startElementWithName:(id)a3 attributes:(id)a4 line:(int64_t)a5 col:(int64_t)a6;
- (void)setDelegate:(id)a3;
- (void)setKey:(id)a3;
- (void)textParserCompletedParsing:(id)a3 elementName:(id)a4;
@end

@implementation XRSchemaAnnotationContainingElementParser

+ (id)_elementNameToClassMap
{
  if (qword_2687AA080 != -1) {
    dispatch_once(&qword_2687AA080, &unk_26E752490);
  }
  v2 = (void *)qword_2687AA078;

  return v2;
}

- (void)textParserCompletedParsing:(id)a3 elementName:(id)a4
{
  id v30 = a3;
  if ([a4 isEqualToString:@"error-message" withOptions:v7 range:v8])
  {
    v13 = [self delegate:v9 didReceive:v10 with:v11 with:v12];
    v18 = [self elementName:v14 withName:v15 andType:v16 andValue:v17];
    v23 = [self key:v19 value:v20 value:v21 value:v22];
    v28 = [v30 stringValueWithFormat:v24, v25, v26, v27];
    [v13 elementWithName:v29 parser:v18 key:self finishedWithError:v23];
  }
}

- (id)startElementWithName:(id)a3 attributes:(id)a4 line:(int64_t)a5 col:(int64_t)a6
{
  v12.receiver = self;
  v12.super_class = (Class)XRSchemaAnnotationContainingElementParser;
  uint64_t v7 = [(XRXMLElementParser *)&v12 startElementWithName:a3 attributes:a4 line:a5 col:a6];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v7 setDelegate:self];
  }

  return v7;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (XRSchemaAnnotationPropertyReportingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (XRSchemaAnnotationPropertyReportingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_key, 0);
}

@end