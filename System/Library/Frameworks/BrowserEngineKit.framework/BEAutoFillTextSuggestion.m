@interface BEAutoFillTextSuggestion
- (NSDictionary)contents;
- (UIAutoFillTextSuggestion)backingSuggestion;
- (id)_initWithUIKitTextSuggestion:(id)a3;
- (id)_uikitAutoFillTextSuggestion;
@end

@implementation BEAutoFillTextSuggestion

- (id)_initWithUIKitTextSuggestion:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BEAutoFillTextSuggestion;
  v6 = [(BETextSuggestion *)&v9 _initWithUIKitTextSuggestion:v5];
  v7 = v6;
  if (v6) {
    objc_storeStrong(v6 + 2, a3);
  }

  return v7;
}

- (NSDictionary)contents
{
  return (NSDictionary *)[(UIAutoFillTextSuggestion *)self->_backingSuggestion contents];
}

- (id)_uikitAutoFillTextSuggestion
{
  return self->_backingSuggestion;
}

- (UIAutoFillTextSuggestion)backingSuggestion
{
  return self->_backingSuggestion;
}

- (void).cxx_destruct
{
}

@end