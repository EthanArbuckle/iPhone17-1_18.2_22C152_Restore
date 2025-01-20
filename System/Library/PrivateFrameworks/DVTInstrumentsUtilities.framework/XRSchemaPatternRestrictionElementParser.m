@interface XRSchemaPatternRestrictionElementParser
+ (id)_elementNameToClassMap;
- (XRSchemaRegexPatternDetectionDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation XRSchemaPatternRestrictionElementParser

+ (id)_elementNameToClassMap
{
  if (qword_2687AA090 != -1) {
    dispatch_once(&qword_2687AA090, &unk_26E7524B0);
  }
  v2 = (void *)qword_2687AA088;

  return v2;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v17 = a3;
  v9 = [v17 elementAttributes:v5, v6, v7, v8];
  v13 = [v9 valueForKeyedSubscript:v10];

  if (v13)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained finishedParsingPatternWithParser:v15 patternValue:(uint64_t)v17];
  }
}

- (XRSchemaRegexPatternDetectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (XRSchemaRegexPatternDetectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end