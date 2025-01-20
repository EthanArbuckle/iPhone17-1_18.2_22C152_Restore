@interface XRSchemaSimpleTypeElementParser
+ (id)_elementNameToClassMap;
- (NSString)identifier;
- (XRSchemaAnnotationPropertyReportingDelegate)delegate;
- (id)startElementWithName:(id)a3 attributes:(id)a4 line:(int64_t)a5 col:(int64_t)a6;
- (void)checkForAnnotationAndPatternAvailable;
- (void)finishedParsingPatternWithParser:(id)a3 patternValue:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)textParserCompletedParsing:(id)a3 elementName:(id)a4;
@end

@implementation XRSchemaSimpleTypeElementParser

+ (id)_elementNameToClassMap
{
  if (qword_2687AA290 != -1) {
    dispatch_once(&qword_2687AA290, &unk_26E7525D0);
  }
  v2 = (void *)qword_2687AA288;

  return v2;
}

- (void)checkForAnnotationAndPatternAvailable
{
  if (self->_patternParser && self->_errorMessage)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = [self v3:v4 v5:v6];
    [WeakRetained elementWithName:v8 parser:v7 key:self->_parsedRegex finishedWithError:self->_errorMessage];
  }
}

- (void)finishedParsingPatternWithParser:(id)a3 patternValue:(id)a4
{
  uint64_t v6 = (XRXMLElementParser *)a3;
  v7 = (NSString *)a4;
  patternParser = self->_patternParser;
  self->_patternParser = v6;
  v9 = v6;

  parsedRegex = self->_parsedRegex;
  self->_parsedRegex = v7;

  [self _objc_msgSend_checkForAnnotationAndPatternAvailable:v11 v12:v12 v13:v13 v14:v14];
}

- (void)textParserCompletedParsing:(id)a3 elementName:(id)a4
{
  id v19 = a3;
  if ([a4 isEqualToString:@"error-message"] && v7 && v8)
  {
    [v19 stringValueWithFormat:v9, v10, v11, v12];
    uint64_t v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    errorMessage = self->_errorMessage;
    self->_errorMessage = v13;

    [self _objc_msgSend_checkForAnnotationAndPatternAvailable:v15 v16:v17 v18:v18];
  }
}

- (id)startElementWithName:(id)a3 attributes:(id)a4 line:(int64_t)a5 col:(int64_t)a6
{
  v12.receiver = self;
  v12.super_class = (Class)XRSchemaSimpleTypeElementParser;
  uint64_t v7 = [(XRXMLElementParser *)&v12 startElementWithName:a3 attributes:a4 line:a5 col:a6];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    [v7 setDelegate:self];
  }

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
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
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_parsedRegex, 0);

  objc_storeStrong((id *)&self->_patternParser, 0);
}

@end