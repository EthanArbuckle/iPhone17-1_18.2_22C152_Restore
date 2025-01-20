@interface CDMShortcutPhrase
- (CDMShortcutPhrase)initWithSemanticValue:(id)a3;
- (CDMShortcutPhrase)initWithSemanticValue:(id)a3 baseTemplateString:(id)a4;
- (NSString)baseTemplateString;
- (NSString)semanticValue;
@end

@implementation CDMShortcutPhrase

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseTemplateString, 0);
  objc_storeStrong((id *)&self->_semanticValue, 0);
}

- (NSString)baseTemplateString
{
  return self->_baseTemplateString;
}

- (NSString)semanticValue
{
  return self->_semanticValue;
}

- (CDMShortcutPhrase)initWithSemanticValue:(id)a3 baseTemplateString:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDMShortcutPhrase;
  v9 = [(CDMShortcutPhrase *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_semanticValue, a3);
    objc_storeStrong((id *)&v10->_baseTemplateString, a4);
  }

  return v10;
}

- (CDMShortcutPhrase)initWithSemanticValue:(id)a3
{
  return [(CDMShortcutPhrase *)self initWithSemanticValue:a3 baseTemplateString:0];
}

@end