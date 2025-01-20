@interface MUISuggestionToken
+ (id)csTokensFromMailSuggestionTokens:(id)a3;
+ (id)suggestionTokenWithTitle:(id)a3;
- (BOOL)hasMultipleScopes;
- (MUISuggestionToken)initWithCSToken:(id)a3;
- (MUISuggestionToken)initWithTitle:(id)a3;
- (NSArray)scopeNames;
- (NSString)scopeName;
- (NSString)title;
- (UIImage)image;
- (_CSSuggestionToken)csToken;
- (_NSRange)replacementRange;
- (unint64_t)selectedScopeIndex;
- (void)setSelectedScopeIndex:(unint64_t)a3;
@end

@implementation MUISuggestionToken

- (MUISuggestionToken)initWithTitle:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MUISuggestionToken;
  v5 = [(MUISuggestionToken *)&v13 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v7 = [v4 stringByTrimmingCharactersInSet:v6];
    v8 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v7;

    *(_OWORD *)(v5 + 40) = xmmword_1DDF03AE0;
    v9 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = MEMORY[0x1E4F1CBF0];

    *((void *)v5 + 4) = 0;
    id v10 = objc_alloc_init(MEMORY[0x1E4F238B0]);
    v11 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v10;
  }
  return (MUISuggestionToken *)v5;
}

- (MUISuggestionToken)initWithCSToken:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MUISuggestionToken;
  v6 = [(MUISuggestionToken *)&v14 init];
  if (v6)
  {
    uint64_t v7 = [v5 displayText];
    uint64_t v8 = [v7 string];
    title = v6->_title;
    v6->_title = (NSString *)v8;

    v6->_replacementRange.location = [v5 replacementRange];
    v6->_replacementRange.length = v10;
    uint64_t v11 = [v5 scopes];
    scopeNames = v6->_scopeNames;
    v6->_scopeNames = (NSArray *)v11;

    v6->_selectedScopeIndex = [v5 selectedScope];
    objc_storeStrong((id *)&v6->_csToken, a3);
  }

  return v6;
}

+ (id)csTokensFromMailSuggestionTokens:(id)a3
{
  return (id)objc_msgSend(a3, "ef_compactMap:", &__block_literal_global_37);
}

uint64_t __55__MUISuggestionToken_csTokensFromMailSuggestionTokens___block_invoke(uint64_t a1, void *a2)
{
  return [a2 csToken];
}

+ (id)suggestionTokenWithTitle:(id)a3
{
  id v3 = a3;
  id v4 = [[MUISuggestionToken alloc] initWithTitle:v3];

  return v4;
}

- (BOOL)hasMultipleScopes
{
  v2 = [(MUISuggestionToken *)self scopeNames];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (NSString)scopeName
{
  BOOL v3 = [(MUISuggestionToken *)self scopeNames];
  unint64_t v4 = [(MUISuggestionToken *)self selectedScopeIndex];
  if (v4 >= [v3 count])
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [v3 objectAtIndexedSubscript:v4];
  }

  return (NSString *)v5;
}

- (UIImage)image
{
  v2 = (void *)MEMORY[0x1E4FB1818];
  BOOL v3 = [(MUISuggestionToken *)self csToken];
  unint64_t v4 = objc_msgSend(v2, "mui_imageFromSuggestionToken:", v3);

  return (UIImage *)v4;
}

- (_CSSuggestionToken)csToken
{
  return self->_csToken;
}

- (NSString)title
{
  return self->_title;
}

- (NSArray)scopeNames
{
  return self->_scopeNames;
}

- (unint64_t)selectedScopeIndex
{
  return self->_selectedScopeIndex;
}

- (void)setSelectedScopeIndex:(unint64_t)a3
{
  self->_selectedScopeIndex = a3;
}

- (_NSRange)replacementRange
{
  NSUInteger length = self->_replacementRange.length;
  NSUInteger location = self->_replacementRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scopeNames, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_csToken, 0);
}

@end