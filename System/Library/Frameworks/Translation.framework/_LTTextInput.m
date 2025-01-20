@interface _LTTextInput
- (NSString)clientIdentifier;
- (NSString)sourceText;
- (_LTTextInput)initWithSourceText:(id)a3 clientIdentifier:(id)a4;
@end

@implementation _LTTextInput

- (_LTTextInput)initWithSourceText:(id)a3 clientIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_LTTextInput;
  v8 = [(_LTTextInput *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    sourceText = v8->_sourceText;
    v8->_sourceText = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    clientIdentifier = v8->_clientIdentifier;
    v8->_clientIdentifier = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (NSString)sourceText
{
  return self->_sourceText;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);

  objc_storeStrong((id *)&self->_sourceText, 0);
}

@end