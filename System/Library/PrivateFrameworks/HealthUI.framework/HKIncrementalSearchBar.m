@interface HKIncrementalSearchBar
+ (BOOL)_hasUppercaseCharacters:(id)a3;
+ (id)_patternFromSearchString:(id)a3 quoteForJavascript:(BOOL)a4;
+ (id)regularExpressionFromString:(id)a3 quoteForJavascript:(BOOL)a4 caseless:(BOOL *)a5;
- (BOOL)canBecomeFirstResponder;
- (BOOL)keyboardIsUp;
- (BOOL)searchIsActive;
- (CGSize)intrinsicContentSize;
- (HKIncrementalSearchBar)init;
- (HKIncrementalSearchBarDelegate)searchBarDelegate;
- (NSString)matchDisplayText;
- (NSString)searchText;
- (_SearchBarContent)searchBarContent;
- (id)inputAccessoryView;
- (void)_lowerKeyboard;
- (void)activateSearch:(BOOL)a3;
- (void)dealloc;
- (void)doneAction:(id)a3;
- (void)searchKeyboardDidHide:(id)a3;
- (void)setDownEnabled:(BOOL)a3;
- (void)setMatchDisplayText:(id)a3;
- (void)setMatchDisplayVisible:(BOOL)a3;
- (void)setSearchBarDelegate:(id)a3;
- (void)setSearchText:(id)a3;
- (void)setUpEnabled:(BOOL)a3;
@end

@implementation HKIncrementalSearchBar

- (HKIncrementalSearchBar)init
{
  v8.receiver = self;
  v8.super_class = (Class)HKIncrementalSearchBar;
  v2 = -[HKIncrementalSearchBar initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v2)
  {
    v3 = [[_SearchBarContent alloc] initWithSearchBar:v2];
    searchBarContent = v2->_searchBarContent;
    v2->_searchBarContent = v3;

    [(HKIncrementalSearchBar *)v2 setUpEnabled:0];
    [(HKIncrementalSearchBar *)v2 setDownEnabled:0];
    [(HKIncrementalSearchBar *)v2 activateSearch:0];
    v5 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(HKIncrementalSearchBar *)v2 setBackgroundColor:v5];

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v2 selector:sel_searchKeyboardDidHide_ name:*MEMORY[0x1E4FB2BC0] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HKIncrementalSearchBar;
  [(HKIncrementalSearchBar *)&v4 dealloc];
}

- (BOOL)keyboardIsUp
{
  v2 = [(_SearchBarContent *)self->_searchBarContent searchEntry];
  char v3 = [v2 isFirstResponder];

  return v3;
}

- (BOOL)searchIsActive
{
  if ([(HKIncrementalSearchBar *)self keyboardIsUp]) {
    return 1;
  }
  return [(HKIncrementalSearchBar *)self keyboardIsDown];
}

- (void)searchKeyboardDidHide:(id)a3
{
  if (![(HKIncrementalSearchBar *)self searchIsActive])
  {
    objc_super v4 = [(_SearchBarContent *)self->_searchBarContent searchBarDelegate];

    if (v4)
    {
      id v5 = [(_SearchBarContent *)self->_searchBarContent searchBarDelegate];
      [v5 searchBarDoneAction:self];
    }
  }
}

- (CGSize)intrinsicContentSize
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)inputAccessoryView
{
  return self->_searchBarContent;
}

- (HKIncrementalSearchBarDelegate)searchBarDelegate
{
  return [(_SearchBarContent *)self->_searchBarContent searchBarDelegate];
}

- (void)setSearchBarDelegate:(id)a3
{
}

- (void)setUpEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_SearchBarContent *)self->_searchBarContent upBarButton];
  [v4 setEnabled:v3];
}

- (void)setDownEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_SearchBarContent *)self->_searchBarContent downBarButton];
  [v4 setEnabled:v3];
}

- (NSString)searchText
{
  double v2 = [(_SearchBarContent *)self->_searchBarContent searchEntry];
  BOOL v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setSearchText:(id)a3
{
  searchBarContent = self->_searchBarContent;
  id v4 = a3;
  id v5 = [(_SearchBarContent *)searchBarContent searchEntry];
  [v5 setText:v4];
}

- (void)setMatchDisplayText:(id)a3
{
  objc_storeStrong((id *)&self->_matchDisplayText, a3);
  id v5 = a3;
  id v6 = [(_SearchBarContent *)self->_searchBarContent searchEntry];
  [v6 setMatchDisplayString:v5];
}

- (void)setMatchDisplayVisible:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_SearchBarContent *)self->_searchBarContent searchEntry];
  [v4 matchDisplayVisible:v3];
}

- (void)activateSearch:(BOOL)a3
{
  if (a3)
  {
    if (![(HKIncrementalSearchBar *)self searchIsActive])
    {
      [(HKIncrementalSearchBar *)self becomeFirstResponder];
      id v5 = [(_SearchBarContent *)self->_searchBarContent searchEntry];
      [v5 becomeFirstResponder];
    }
  }
  else
  {
    id v4 = [(_SearchBarContent *)self->_searchBarContent searchEntry];
    [v4 resignFirstResponder];

    [(HKIncrementalSearchBar *)self resignFirstResponder];
    [(HKIncrementalSearchBar *)self setUpEnabled:0];
    [(HKIncrementalSearchBar *)self setDownEnabled:0];
    [(HKIncrementalSearchBar *)self setSearchText:&stru_1F3B9CF20];
    [(HKIncrementalSearchBar *)self setMatchDisplayText:&stru_1F3B9CF20];
    [(HKIncrementalSearchBar *)self setMatchDisplayVisible:0];
  }
}

- (void)_lowerKeyboard
{
  if ([(HKIncrementalSearchBar *)self keyboardIsUp])
  {
    [(HKIncrementalSearchBar *)self becomeFirstResponder];
  }
}

- (void)doneAction:(id)a3
{
  id v4 = [(_SearchBarContent *)self->_searchBarContent searchEntry];
  [v4 resignFirstResponder];

  [(HKIncrementalSearchBar *)self resignFirstResponder];
}

+ (BOOL)_hasUppercaseCharacters:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x1E4F28B88];
  id v4 = a3;
  id v5 = [v3 uppercaseLetterCharacterSet];
  uint64_t v6 = [v4 rangeOfCharacterFromSet:v5];

  return v6 != 0x7FFFFFFFFFFFFFFFLL;
}

+ (id)_patternFromSearchString:(id)a3 quoteForJavascript:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v7 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"\\'"];
  objc_super v8 = [MEMORY[0x1E4F28FD8] escapedPatternForString:v5];
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v10 = [v8 length];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__HKIncrementalSearchBar__patternFromSearchString_quoteForJavascript___block_invoke;
  v17[3] = &unk_1E6D56910;
  v21 = &v23;
  id v11 = v6;
  id v18 = v11;
  BOOL v22 = v4;
  id v12 = v9;
  id v19 = v12;
  id v13 = v7;
  id v20 = v13;
  objc_msgSend(v8, "enumerateSubstringsInRange:options:usingBlock:", 0, v10, 2, v17);
  if (*((unsigned char *)v24 + 24))
  {
    if (v4) {
      [v12 appendString:@"\\""];
    }
    [v12 appendString:@"\\s+"];
  }
  v14 = v20;
  id v15 = v12;

  _Block_object_dispose(&v23, 8);
  return v15;
}

void __70__HKIncrementalSearchBar__patternFromSearchString_quoteForJavascript___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  id v12 = v3;
  id v5 = [v3 stringByTrimmingCharactersInSet:*(void *)(a1 + 32)];
  uint64_t v6 = [v5 length];

  if (v4)
  {
    if (v6)
    {
      if (*(unsigned char *)(a1 + 64)) {
        [*(id *)(a1 + 40) appendString:@"\\""];
      }
      [*(id *)(a1 + 40) appendString:@"\\s+"];
      [*(id *)(a1 + 40) appendString:v12];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    }
  }
  else if (v6)
  {
    id v7 = v12;
    if (*(unsigned char *)(a1 + 64)
      && ([v12 stringByTrimmingCharactersInSet:*(void *)(a1 + 48)],
          objc_super v8 = objc_claimAutoreleasedReturnValue(),
          uint64_t v9 = [v8 length],
          v8,
          id v7 = v12,
          !v9))
    {
      [*(id *)(a1 + 40) appendString:@"\\""];
      uint64_t v10 = *(void **)(a1 + 40);
      id v11 = v12;
    }
    else
    {
      uint64_t v10 = *(void **)(a1 + 40);
      id v11 = v7;
    }
    [v10 appendString:v11];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

+ (id)regularExpressionFromString:(id)a3 quoteForJavascript:(BOOL)a4 caseless:(BOOL *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  if (a5) {
    *a5 = !+[HKIncrementalSearchBar _hasUppercaseCharacters:v7];
  }
  objc_super v8 = +[HKIncrementalSearchBar _patternFromSearchString:v7 quoteForJavascript:v6];

  return v8;
}

- (NSString)matchDisplayText
{
  return self->_matchDisplayText;
}

- (_SearchBarContent)searchBarContent
{
  return self->_searchBarContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBarContent, 0);
  objc_storeStrong((id *)&self->_matchDisplayText, 0);
}

@end