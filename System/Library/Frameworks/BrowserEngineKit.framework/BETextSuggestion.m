@interface BETextSuggestion
- (BETextSuggestion)initWithInputText:(id)a3;
- (NSString)inputText;
- (id)_initWithUIKitTextSuggestion:(id)a3;
- (id)_uikitTextSuggestion;
@end

@implementation BETextSuggestion

- (BETextSuggestion)initWithInputText:(id)a3
{
  v4 = [MEMORY[0x263F82D58] textSuggestionWithInputText:a3];
  v5 = [(BETextSuggestion *)self _initWithUIKitTextSuggestion:v4];

  return v5;
}

- (id)_initWithUIKitTextSuggestion:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BETextSuggestion;
  v6 = [(BETextSuggestion *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_uiSuggestion, a3);
  }

  return v7;
}

- (NSString)inputText
{
  return (NSString *)[(UITextSuggestion *)self->_uiSuggestion inputText];
}

- (id)_uikitTextSuggestion
{
  return self->_uiSuggestion;
}

- (void).cxx_destruct
{
}

@end