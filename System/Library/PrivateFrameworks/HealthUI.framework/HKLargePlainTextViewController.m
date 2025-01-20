@interface HKLargePlainTextViewController
- (BOOL)_updateMatchDisplayString:(unint64_t)a3 numMatches:(unint64_t)a4;
- (HKIncrementalSearchBar)incrementalSearchBar;
- (HKLargePlainTextViewController)initWithData:(id)a3;
- (NSData)data;
- (NSMutableArray)currentRanges;
- (NSOperationQueue)searchQueue;
- (NSString)dataAsString;
- (UIColor)currentSelectionBackground;
- (UIColor)currentSelectionForeground;
- (UIColor)normalTextViewBackground;
- (UIColor)otherSelectionBackground;
- (UIColor)otherSelectionForeground;
- (UIColor)selectedTextViewBackground;
- (UITextView)textView;
- (_IncrementalSearchOperation)currentSearch;
- (double)currentKeyboardHeight;
- (id)_selectionAttributes:(BOOL)a3;
- (id)_standardPlainTextFont;
- (id)searchBodyWithAttributes;
- (int64_t)currentSearchItem;
- (unint64_t)supportedInterfaceOrientations;
- (void)_updateCurrentSearchItem:(unint64_t)a3 hitsChanged:(BOOL)a4 resetSearch:(BOOL)a5;
- (void)addSearchResults:(IncrementalSearchResultsDefn *)a3;
- (void)cancelCurrentSearch;
- (void)endSearchResults;
- (void)finishSearchResults;
- (void)incrementalSearchOperation:(id)a3;
- (void)loadView;
- (void)resetCurrentSearchItem;
- (void)resetSearchResults;
- (void)searchBarChangeSearch:(id)a3 searchString:(id)a4;
- (void)searchBarDoneAction:(id)a3;
- (void)searchBarDownAction:(id)a3;
- (void)searchBarUpAction:(id)a3;
- (void)setCurrentKeyboardHeight:(double)a3;
- (void)setCurrentRanges:(id)a3;
- (void)setCurrentSearch:(id)a3;
- (void)setCurrentSearchItem:(int64_t)a3;
- (void)startIncrementalSearch;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HKLargePlainTextViewController

- (HKLargePlainTextViewController)initWithData:(id)a3
{
  id v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)HKLargePlainTextViewController;
  v6 = [(HKLargePlainTextViewController *)&v30 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_data, a3);
    uint64_t v8 = [[NSString alloc] initWithData:v5 encoding:4];
    dataAsString = v7->_dataAsString;
    v7->_dataAsString = (NSString *)v8;

    textView = v7->_textView;
    v7->_textView = 0;

    incrementalSearchBar = v7->_incrementalSearchBar;
    v7->_incrementalSearchBar = 0;

    v12 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    searchQueue = v7->_searchQueue;
    v7->_searchQueue = v12;

    currentSearch = v7->_currentSearch;
    v7->_currentSearch = 0;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    currentRanges = v7->_currentRanges;
    v7->_currentRanges = v15;

    v7->_currentSearchItem = 0;
    uint64_t v17 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    normalTextViewBackground = v7->_normalTextViewBackground;
    v7->_normalTextViewBackground = (UIColor *)v17;

    uint64_t v19 = [MEMORY[0x1E4FB1618] systemGray3Color];
    selectedTextViewBackground = v7->_selectedTextViewBackground;
    v7->_selectedTextViewBackground = (UIColor *)v19;

    uint64_t v21 = [MEMORY[0x1E4FB1618] systemBlackColor];
    currentSelectionForeground = v7->_currentSelectionForeground;
    v7->_currentSelectionForeground = (UIColor *)v21;

    uint64_t v23 = [MEMORY[0x1E4FB1618] systemYellowColor];
    currentSelectionBackground = v7->_currentSelectionBackground;
    v7->_currentSelectionBackground = (UIColor *)v23;

    uint64_t v25 = [MEMORY[0x1E4FB1618] labelColor];
    otherSelectionForeground = v7->_otherSelectionForeground;
    v7->_otherSelectionForeground = (UIColor *)v25;

    uint64_t v27 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    otherSelectionBackground = v7->_otherSelectionBackground;
    v7->_otherSelectionBackground = (UIColor *)v27;

    v7->_currentKeyboardHeight = 0.0;
  }

  return v7;
}

- (void)startIncrementalSearch
{
  [(HKIncrementalSearchBar *)self->_incrementalSearchBar activateSearch:1];
  id v3 = [(HKLargePlainTextViewController *)self view];
  [v3 setNeedsLayout];
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1C60]);
  id v11 = (id)[v3 initWithArrangedSubviews:MEMORY[0x1E4F1CBF0]];
  [v11 setAxis:1];
  id v4 = objc_alloc(MEMORY[0x1E4FB1DD8]);
  id v5 = (UITextView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  textView = self->_textView;
  self->_textView = v5;

  [(UITextView *)self->_textView setEditable:0];
  v7 = [(HKLargePlainTextViewController *)self searchBodyWithAttributes];
  [(UITextView *)self->_textView setAttributedText:v7];
  [v11 addArrangedSubview:self->_textView];
  uint64_t v8 = objc_alloc_init(HKIncrementalSearchBar);
  incrementalSearchBar = self->_incrementalSearchBar;
  self->_incrementalSearchBar = v8;

  [(HKIncrementalSearchBar *)self->_incrementalSearchBar setSearchBarDelegate:self];
  LODWORD(v10) = 1148846080;
  [(HKIncrementalSearchBar *)self->_incrementalSearchBar setContentHuggingPriority:1 forAxis:v10];
  [v11 addArrangedSubview:self->_incrementalSearchBar];
  [(HKLargePlainTextViewController *)self setView:v11];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKLargePlainTextViewController;
  [(HKLargePlainTextViewController *)&v4 viewWillDisappear:a3];
  [(HKLargePlainTextViewController *)self searchBarDoneAction:self];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (id)_standardPlainTextFont
{
  return (id)[MEMORY[0x1E4FB08E0] fontWithName:@"Courier" size:12.0];
}

- (id)_selectionAttributes:(BOOL)a3
{
  BOOL v3 = a3;
  v18[3] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(HKLargePlainTextViewController *)self _standardPlainTextFont];
  v6 = (void *)v5;
  v7 = &OBJC_IVAR___HKLargePlainTextViewController__otherSelectionForeground;
  if (v3) {
    v7 = &OBJC_IVAR___HKLargePlainTextViewController__currentSelectionForeground;
  }
  uint64_t v8 = *(Class *)((char *)&self->super.super.super.super.isa + *v7);
  v9 = &OBJC_IVAR___HKLargePlainTextViewController__otherSelectionBackground;
  if (v3) {
    v9 = &OBJC_IVAR___HKLargePlainTextViewController__currentSelectionBackground;
  }
  double v10 = *(Class *)((char *)&self->super.super.super.super.isa + *v9);
  uint64_t v11 = *MEMORY[0x1E4FB0700];
  v17[0] = *MEMORY[0x1E4FB06F8];
  v17[1] = v11;
  v18[0] = v5;
  v18[1] = v8;
  v17[2] = *MEMORY[0x1E4FB06C0];
  v18[2] = v10;
  v12 = (void *)MEMORY[0x1E4F1C9E8];
  id v13 = v10;
  id v14 = v8;
  v15 = [v12 dictionaryWithObjects:v18 forKeys:v17 count:3];

  return v15;
}

- (id)searchBodyWithAttributes
{
  v23[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HKLargePlainTextViewController *)self _standardPlainTextFont];
  uint64_t v4 = *MEMORY[0x1E4FB0700];
  v22[0] = *MEMORY[0x1E4FB06F8];
  v22[1] = v4;
  v23[0] = v3;
  uint64_t v5 = [MEMORY[0x1E4FB1618] labelColor];
  v23[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];

  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:self->_dataAsString attributes:v6];
  uint64_t v8 = [(HKLargePlainTextViewController *)self _selectionAttributes:0];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v9 = self->_currentRanges;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "rangeValue", (void)v17);
        objc_msgSend(v7, "addAttributes:range:", v8, v14, v15);
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  return v7;
}

- (void)resetSearchResults
{
  [(NSMutableArray *)self->_currentRanges removeAllObjects];
  id v3 = [(HKLargePlainTextViewController *)self searchBodyWithAttributes];
  [(UITextView *)self->_textView setAttributedText:v3];
}

- (void)endSearchResults
{
  if ([(NSMutableArray *)self->_currentRanges count]) {
    [(UITextView *)self->_textView setBackgroundColor:self->_normalTextViewBackground];
  }
  [(HKLargePlainTextViewController *)self cancelCurrentSearch];
  [(HKLargePlainTextViewController *)self resetCurrentSearchItem];
}

- (void)finishSearchResults
{
  if (![(NSMutableArray *)self->_currentRanges count])
  {
    [(UITextView *)self->_textView setBackgroundColor:self->_normalTextViewBackground];
    [(HKLargePlainTextViewController *)self resetCurrentSearchItem];
  }
}

- (void)cancelCurrentSearch
{
  currentSearch = self->_currentSearch;
  if (currentSearch)
  {
    [(_IncrementalSearchOperation *)currentSearch cancel];
    [(HKLargePlainTextViewController *)self resetSearchResults];
    uint64_t v4 = self->_currentSearch;
    self->_currentSearch = 0;
  }
}

- (void)addSearchResults:(IncrementalSearchResultsDefn *)a3
{
  uint64_t v5 = [(NSMutableArray *)self->_currentRanges count];
  unint64_t v6 = [(NSMutableArray *)self->_currentRanges count];
  v7 = [(UITextView *)self->_textView textStorage];
  uint64_t v12 = v5;
  id v13 = v7;
  if (v6 > 0x3FF)
  {
    uint64_t v8 = 0;
  }
  else
  {
    [v7 beginEditing];
    uint64_t v8 = [(HKLargePlainTextViewController *)self _selectionAttributes:0];
  }
  if (a3->var0)
  {
    unint64_t v9 = 0;
    p_length = &a3->var1[0].length;
    do
    {
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", *(p_length - 1), *p_length, v12);
      [(NSMutableArray *)self->_currentRanges addObject:v11];
      if (v6 <= 0x3FF) {
        objc_msgSend(v13, "addAttributes:range:", v8, *(p_length - 1), *p_length);
      }

      ++v9;
      p_length += 2;
    }
    while (a3->var0 > v9);
  }
  if (v6 < 0x400) {
    [v13 endEditing];
  }
  if (v12)
  {
    [(HKLargePlainTextViewController *)self _updateCurrentSearchItem:self->_currentSearchItem hitsChanged:1 resetSearch:0];
  }
  else
  {
    [(UITextView *)self->_textView setBackgroundColor:self->_selectedTextViewBackground];
    [(HKLargePlainTextViewController *)self resetCurrentSearchItem];
  }
}

- (void)incrementalSearchOperation:(id)a3
{
  id v4 = a3;
  [(HKLargePlainTextViewController *)self cancelCurrentSearch];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__HKLargePlainTextViewController_incrementalSearchOperation___block_invoke;
  aBlock[3] = &unk_1E6D56180;
  aBlock[4] = self;
  objc_copyWeak(&v12, &location);
  uint64_t v5 = _Block_copy(aBlock);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__HKLargePlainTextViewController_incrementalSearchOperation___block_invoke_3;
  v9[3] = &unk_1E6D561A8;
  v9[4] = self;
  objc_copyWeak(&v10, &location);
  unint64_t v6 = _Block_copy(v9);
  if (v4 && [v4 length])
  {
    v7 = [[_IncrementalSearchOperation alloc] initWithSearchString:v4 searchBody:self->_dataAsString resultsBlock:v5 finishedBlock:v6];
    currentSearch = self->_currentSearch;
    self->_currentSearch = v7;

    [(NSOperationQueue *)self->_searchQueue addOperation:self->_currentSearch];
  }
  else
  {
    [(HKLargePlainTextViewController *)self finishSearchResults];
  }

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __61__HKLargePlainTextViewController_incrementalSearchOperation___block_invoke(uint64_t a1, uint64_t a2, const void *a3)
{
  if (*(void *)(*(void *)(a1 + 32) + 1016) == a2)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __61__HKLargePlainTextViewController_incrementalSearchOperation___block_invoke_2;
    v4[3] = &unk_1E6D56158;
    objc_copyWeak(&v5, (id *)(a1 + 40));
    memcpy(v6, a3, sizeof(v6));
    dispatch_async(MEMORY[0x1E4F14428], v4);
    objc_destroyWeak(&v5);
  }
}

void __61__HKLargePlainTextViewController_incrementalSearchOperation___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  memcpy(__dst, (const void *)(a1 + 40), sizeof(__dst));
  [WeakRetained addSearchResults:__dst];
}

void __61__HKLargePlainTextViewController_incrementalSearchOperation___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (*(void *)(*(void *)(a1 + 32) + 1016) == a2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__HKLargePlainTextViewController_incrementalSearchOperation___block_invoke_4;
    block[3] = &unk_1E6D51C48;
    objc_copyWeak(&v3, (id *)(a1 + 40));
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v3);
  }
}

void __61__HKLargePlainTextViewController_incrementalSearchOperation___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained finishSearchResults];
}

- (BOOL)_updateMatchDisplayString:(unint64_t)a3 numMatches:(unint64_t)a4
{
  if (a4)
  {
    if (a4 == 1)
    {
      unint64_t v6 = HKLocalizedStringForNumberWithTemplate(&unk_1F3C226F0, 0);
      v7 = NSString;
      uint64_t v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      unint64_t v9 = [v8 localizedStringForKey:@"INCREMENTAL_SEARCH_ONE_MATCH %@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      id v10 = objc_msgSend(v7, "stringWithFormat:", v9, v6);
    }
    else
    {
      id v13 = [NSNumber numberWithUnsignedInteger:a3 + 1];
      unint64_t v6 = HKLocalizedStringForNumberWithTemplate(v13, 1);

      if (a4 > 0x3FF)
      {
        uint64_t v8 = HKLocalizedStringForNumberWithTemplate(&unk_1F3C22708, 1);
        uint64_t v15 = NSString;
        v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        unint64_t v9 = v16;
        long long v17 = @"INCREMENTAL_SEARCH_MAX_ITEM %@ %@";
      }
      else
      {
        uint64_t v14 = [NSNumber numberWithUnsignedInteger:a4];
        uint64_t v8 = HKLocalizedStringForNumberWithTemplate(v14, 1);

        uint64_t v15 = NSString;
        v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        unint64_t v9 = v16;
        long long v17 = @"INCREMENTAL_SEARCH_MATCH_ITEM %@ %@";
      }
      long long v18 = [v16 localizedStringForKey:v17 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      id v10 = objc_msgSend(v15, "stringWithFormat:", v18, v6, v8);
    }
    goto LABEL_11;
  }
  uint64_t v11 = [(HKIncrementalSearchBar *)self->_incrementalSearchBar searchText];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    unint64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v10 = [v6 localizedStringForKey:@"INCREMENTAL_SEARCH_NO_MATCHES" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
LABEL_11:

    [(HKIncrementalSearchBar *)self->_incrementalSearchBar setMatchDisplayText:v10];
    return 1;
  }
  return 0;
}

- (void)_updateCurrentSearchItem:(unint64_t)a3 hitsChanged:(BOOL)a4 resetSearch:(BOOL)a5
{
  BOOL v5 = a5;
  unint64_t v8 = [(NSMutableArray *)self->_currentRanges count];
  if (self->_currentSearchItem != a3 || v5)
  {
    id v10 = [(UITextView *)self->_textView textStorage];
    if (self->_currentSearchItem >= v8)
    {
      uint64_t v11 = 0;
    }
    else
    {
      uint64_t v11 = -[NSMutableArray objectAtIndexedSubscript:](self->_currentRanges, "objectAtIndexedSubscript:");
    }
    v26 = v11;
    uint64_t v12 = [v11 rangeValue];
    uint64_t v22 = v13;
    uint64_t v24 = v12;
    if (v8 <= a3)
    {
      uint64_t v14 = 0;
    }
    else
    {
      uint64_t v14 = [(NSMutableArray *)self->_currentRanges objectAtIndexedSubscript:a3];
    }
    uint64_t v15 = objc_msgSend(v14, "rangeValue", v22, v24);
    uint64_t v17 = v16;
    long long v18 = [(HKLargePlainTextViewController *)self _selectionAttributes:0];
    long long v19 = [(HKLargePlainTextViewController *)self _selectionAttributes:1];
    [v10 beginEditing];
    if (self->_currentSearchItem < v8) {
      objc_msgSend(v10, "setAttributes:range:", v18, v25, v23);
    }
    if (v8 <= a3)
    {
      [v10 endEditing];
    }
    else
    {
      objc_msgSend(v10, "setAttributes:range:", v19, v15, v17);
      [v10 endEditing];
      -[UITextView scrollRangeToVisible:](self->_textView, "scrollRangeToVisible:", v15, v17);
    }
  }
  if (v8) {
    BOOL v20 = a3 != 0;
  }
  else {
    BOOL v20 = 0;
  }
  [(HKIncrementalSearchBar *)self->_incrementalSearchBar setUpEnabled:v20];
  BOOL v21 = v8 - 1 > a3 && v8 != 0;
  [(HKIncrementalSearchBar *)self->_incrementalSearchBar setDownEnabled:v21];
  [(HKIncrementalSearchBar *)self->_incrementalSearchBar setMatchDisplayVisible:[(HKLargePlainTextViewController *)self _updateMatchDisplayString:a3 numMatches:v8]];
  if (v8 > a3) {
    self->_currentSearchItem = a3;
  }
}

- (void)resetCurrentSearchItem
{
}

- (void)searchBarUpAction:(id)a3
{
  int64_t currentSearchItem = self->_currentSearchItem;
  if (currentSearchItem >= 1) {
    [(HKLargePlainTextViewController *)self _updateCurrentSearchItem:currentSearchItem - 1 hitsChanged:0 resetSearch:0];
  }
}

- (void)searchBarDownAction:(id)a3
{
}

- (void)searchBarDoneAction:(id)a3
{
  [(HKIncrementalSearchBar *)self->_incrementalSearchBar activateSearch:0];
  [(HKLargePlainTextViewController *)self endSearchResults];
}

- (void)searchBarChangeSearch:(id)a3 searchString:(id)a4
{
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 976, 1);
}

- (NSString)dataAsString
{
  return self->_dataAsString;
}

- (UITextView)textView
{
  return self->_textView;
}

- (HKIncrementalSearchBar)incrementalSearchBar
{
  return self->_incrementalSearchBar;
}

- (NSOperationQueue)searchQueue
{
  return self->_searchQueue;
}

- (_IncrementalSearchOperation)currentSearch
{
  return (_IncrementalSearchOperation *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setCurrentSearch:(id)a3
{
}

- (NSMutableArray)currentRanges
{
  return self->_currentRanges;
}

- (void)setCurrentRanges:(id)a3
{
}

- (int64_t)currentSearchItem
{
  return self->_currentSearchItem;
}

- (void)setCurrentSearchItem:(int64_t)a3
{
  self->_int64_t currentSearchItem = a3;
}

- (UIColor)normalTextViewBackground
{
  return self->_normalTextViewBackground;
}

- (UIColor)selectedTextViewBackground
{
  return self->_selectedTextViewBackground;
}

- (UIColor)currentSelectionForeground
{
  return self->_currentSelectionForeground;
}

- (UIColor)currentSelectionBackground
{
  return self->_currentSelectionBackground;
}

- (UIColor)otherSelectionForeground
{
  return self->_otherSelectionForeground;
}

- (UIColor)otherSelectionBackground
{
  return self->_otherSelectionBackground;
}

- (double)currentKeyboardHeight
{
  return self->_currentKeyboardHeight;
}

- (void)setCurrentKeyboardHeight:(double)a3
{
  self->_currentKeyboardHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherSelectionBackground, 0);
  objc_storeStrong((id *)&self->_otherSelectionForeground, 0);
  objc_storeStrong((id *)&self->_currentSelectionBackground, 0);
  objc_storeStrong((id *)&self->_currentSelectionForeground, 0);
  objc_storeStrong((id *)&self->_selectedTextViewBackground, 0);
  objc_storeStrong((id *)&self->_normalTextViewBackground, 0);
  objc_storeStrong((id *)&self->_currentRanges, 0);
  objc_storeStrong((id *)&self->_currentSearch, 0);
  objc_storeStrong((id *)&self->_searchQueue, 0);
  objc_storeStrong((id *)&self->_incrementalSearchBar, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_dataAsString, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end