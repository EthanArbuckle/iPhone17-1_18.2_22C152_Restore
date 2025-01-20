@interface CKReaderViewController
+ (id)readerScrollPositionCache;
+ (id)readerViewControllerForAudioChatItem:(id)a3;
+ (id)readerViewControllerForChatItem:(id)a3;
- (BOOL)isScrollPositionRestored;
- (BOOL)shouldAutorotate;
- (CKReaderViewController)init;
- (CKReaderViewControllerDelegate)delegate;
- (NSAttributedString)text;
- (NSString)messageGUID;
- (UITextView)textView;
- (_NSRange)textRangeToRestore;
- (_NSRange)visibleRange;
- (unint64_t)supportedInterfaceOrientations;
- (void)_restoreScrollPositionIfNeeded;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setMessageGUID:(id)a3;
- (void)setScrollPositionRestored:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setTextRangeToRestore:(_NSRange)a3;
- (void)setTextView:(id)a3;
- (void)setVisibleRange:(_NSRange)a3;
- (void)updateEdgeInsets:(UIEdgeInsets)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CKReaderViewController

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CKReaderViewController;
  [(CKReaderViewController *)&v4 dealloc];
}

- (CKReaderViewController)init
{
  v12.receiver = self;
  v12.super_class = (Class)CKReaderViewController;
  v2 = [(CKReaderViewController *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v2->_scrollPositionRestored = 0;
    v2->_textRangeToRestore = (_NSRange)xmmword_18F81DC30;
    -[CKReaderViewController setPreferredContentSize:](v2, "setPreferredContentSize:", 325.0, 425.0);
    objc_super v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel_contentSizeCategoryDidChange_ name:*MEMORY[0x1E4F43788] object:0];

    v5 = (void *)MEMORY[0x1E4F42F58];
    v6 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    v7 = objc_msgSend(v5, "textViewUsingTextLayoutManager:", objc_msgSend(v6, "isTextKit2Enabled"));

    v8 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
    [v7 setBackgroundColor:v8];
    [v7 setMarginTop:0];
    [v7 setEditable:0];
    v9 = [v7 textContainer];
    v10 = +[CKUIBehavior sharedBehaviors];
    [v10 readerContentInset];
    objc_msgSend(v9, "setLineFragmentPadding:");

    [(CKReaderViewController *)v3 setTextView:v7];
  }
  return v3;
}

- (void)loadView
{
  v24.receiver = self;
  v24.super_class = (Class)CKReaderViewController;
  [(CKReaderViewController *)&v24 loadView];
  v3 = [(CKReaderViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  [(CKReaderViewController *)self preferredContentSize];
  double v9 = v8;
  double v11 = v10;
  objc_super v12 = [(CKReaderViewController *)self view];
  objc_msgSend(v12, "setBounds:", v5, v7, v9, v11);

  v13 = [(CKReaderViewController *)self view];
  v14 = +[CKUIBehavior sharedBehaviors];
  [v14 readerInsets];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  v23 = [(CKReaderViewController *)self textView];
  objc_msgSend(v23, "setBounds:", v5, v7, v9, v11);
  objc_msgSend(v23, "setContentInset:", v16, v18, v20, v22);
  [v13 bounds];
  objc_msgSend(v23, "setFrame:");
  [v23 setAutoresizingMask:18];
  [v13 addSubview:v23];
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 26;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKReaderViewController;
  [(CKReaderViewController *)&v4 viewDidAppear:a3];
  [(CKReaderViewController *)self _restoreScrollPositionIfNeeded];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKReaderViewController;
  [(CKReaderViewController *)&v5 viewWillDisappear:a3];
  objc_super v4 = [(CKReaderViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 readerViewControllerWillDismiss:self];
  }
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__CKReaderViewController_contentSizeCategoryDidChange___block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __55__CKReaderViewController_contentSizeCategoryDidChange___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) textView];
  v2 = [v1 textStorage];

  uint64_t v6 = *MEMORY[0x1E4FB06F8];
  v3 = +[CKUIBehavior sharedBehaviors];
  objc_super v4 = [v3 readerFont];
  v7[0] = v4;
  objc_super v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  objc_msgSend(v2, "addAttributes:range:", v5, 0, objc_msgSend(v2, "length"));
}

- (void)updateEdgeInsets:(UIEdgeInsets)a3
{
  double bottom = a3.bottom;
  double top = a3.top;
  uint64_t v6 = [(CKReaderViewController *)self textView];
  [v6 textContainerInset];
  double v8 = v7;
  double v10 = v9;

  id v11 = [(CKReaderViewController *)self textView];
  objc_msgSend(v11, "setTextContainerInset:", top, v8, bottom, v10);
}

+ (id)readerViewControllerForChatItem:(id)a3
{
  id v3 = a3;
  char v4 = [v3 isCorrupt];
  if (v4) {
    [v3 fallbackCorruptText];
  }
  else {
  objc_super v5 = [v3 text];
  }
  id v6 = objc_alloc(MEMORY[0x1E4F28E48]);
  double v7 = [v5 string];
  double v8 = (void *)[v6 initWithString:v7];

  if ((v4 & 1) == 0)
  {
    uint64_t v9 = [v5 length];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __58__CKReaderViewController_readerViewControllerForChatItem___block_invoke;
    v20[3] = &unk_1E5629258;
    id v21 = v5;
    id v22 = v3;
    id v23 = v8;
    objc_msgSend(v21, "enumerateAttributesInRange:options:usingBlock:", 0, v9, 0, v20);
  }
  double v10 = [v3 message];
  id v11 = [v10 guid];

  objc_super v12 = objc_alloc_init(CKReaderViewController);
  [(CKReaderViewController *)v12 setMessageGUID:v11];
  [(CKReaderViewController *)v12 setText:v8];
  v13 = [(id)objc_opt_class() readerScrollPositionCache];
  v14 = [v13 objectForKey:v11];

  if (v14)
  {
    uint64_t v15 = [v14 rangeValue];
    -[CKReaderViewController setVisibleRange:](v12, "setVisibleRange:", v15, v16);
  }
  if (objc_opt_respondsToSelector())
  {
    double v17 = [(CKReaderViewController *)v12 navigationItem];
    double v18 = [v3 title];
    [v17 setTitle:v18];
  }

  return v12;
}

void __58__CKReaderViewController_readerViewControllerForChatItem___block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v19 = a2;
  double v7 = [v19 objectForKey:*MEMORY[0x1E4F6C188]];
  if (v7)
  {
    double v8 = [a1[4] string];
    uint64_t v9 = objc_msgSend(v8, "substringWithRange:", a3, a4);

    if ([v9 isEqualToString:*MEMORY[0x1E4F6C110]])
    {
      double v10 = +[CKMediaObjectManager sharedInstance];
      id v11 = [a1[5] message];
      objc_super v12 = [v10 mediaObjectWithTransferGUID:v7 imMessage:v11];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [v12 imageData];
        v14 = [v13 image];

        id v15 = objc_alloc_init(MEMORY[0x1E4FB0870]);
        [v15 setImage:v14];
        [v15 bounds];
        objc_msgSend(v15, "setBounds:");
        objc_msgSend(a1[6], "addAttribute:value:range:", *MEMORY[0x1E4FB06B8], v15, a3, a4);
      }
    }
  }
  uint64_t v16 = [v19 objectForKey:*MEMORY[0x1E4F6C1D0]];
  double v17 = [v16 scheme];
  int v18 = [v17 isEqualToString:@"http"];

  if (v18) {
    objc_msgSend(a1[6], "addAttribute:value:range:", *MEMORY[0x1E4FB0720], v16, a3, a4);
  }
}

+ (id)readerViewControllerForAudioChatItem:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F28E48];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [v4 audioTranscriptionText];
  double v7 = (void *)[v5 initWithString:v6];

  double v8 = [v4 message];

  uint64_t v9 = [v8 guid];

  double v10 = objc_alloc_init(CKReaderViewController);
  [(CKReaderViewController *)v10 setMessageGUID:v9];
  [(CKReaderViewController *)v10 setText:v7];
  if (v9)
  {
    id v11 = [(id)objc_opt_class() readerScrollPositionCache];
    objc_super v12 = [v11 objectForKey:v9];

    if (v12)
    {
      uint64_t v13 = [v12 rangeValue];
      -[CKReaderViewController setVisibleRange:](v10, "setVisibleRange:", v13, v14);
    }
  }
  else
  {
    objc_super v12 = IMLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[CKReaderViewController readerViewControllerForAudioChatItem:](v12);
    }
  }

  id v15 = [(CKReaderViewController *)v10 navigationItem];
  uint64_t v16 = CKFrameworkBundle();
  double v17 = [v16 localizedStringForKey:@"AUDIO_MESSAGE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v15 setTitle:v17];

  return v10;
}

+ (id)readerScrollPositionCache
{
  if (readerScrollPositionCache_once != -1) {
    dispatch_once(&readerScrollPositionCache_once, &__block_literal_global_252);
  }
  v2 = (void *)readerScrollPositionCache_sReaderScrollPositionCache;

  return v2;
}

void __51__CKReaderViewController_readerScrollPositionCache__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F4BE58]) initWithMaximumCapacity:8];
  v1 = (void *)readerScrollPositionCache_sReaderScrollPositionCache;
  readerScrollPositionCache_sReaderScrollPositionCache = v0;
}

- (void)setText:(id)a3
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CKReaderViewController *)self textView];
  id v6 = (void *)[v4 mutableCopy];

  uint64_t v31 = *MEMORY[0x1E4FB06F8];
  double v7 = +[CKUIBehavior sharedBehaviors];
  double v8 = [v7 readerFont];
  v32[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
  objc_msgSend(v6, "addAttributes:range:", v9, 0, objc_msgSend(v6, "length"));

  double v10 = [MEMORY[0x1E4F428B8] labelColor];
  uint64_t v29 = *MEMORY[0x1E4FB0700];
  v30 = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  objc_msgSend(v6, "addAttributes:range:", v11, 0, objc_msgSend(v6, "length"));

  objc_super v12 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  uint64_t v13 = (void *)[v12 mutableCopy];

  [v13 setAlignment:1];
  uint64_t v14 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  uint64_t v15 = [v6 length];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  id v22 = __34__CKReaderViewController_setText___block_invoke;
  id v23 = &unk_1E562C2D8;
  id v24 = v6;
  v25 = @"\n\n";
  id v26 = v14;
  id v27 = v13;
  id v28 = v5;
  id v16 = v5;
  id v17 = v13;
  id v18 = v14;
  id v19 = v6;
  CKEnumerateSearchRange(0, v15, 2, (uint64_t)&v20);
  objc_msgSend(v16, "setAttributedText:", v19, v20, v21, v22, v23);
}

void __34__CKReaderViewController_setText___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  id v51 = [*(id *)(a1 + 32) string];
  uint64_t v8 = objc_msgSend(v51, "rangeOfString:options:range:", *MEMORY[0x1E4F6C110], 4, a2, a3);
  *a4 = v8;
  a4[1] = v9;
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = v8;
    uint64_t v11 = [*(id *)(a1 + 40) length];
    uint64_t v12 = (v10 - v11) & ~((v10 - v11) >> 63);
    uint64_t v13 = objc_msgSend(v51, "__ck_rangeOfSequenceOfCharactersFromSet:options:range:", *(void *)(a1 + 48), 4, v12, *a4 - v12);
    uint64_t v15 = v14;
    uint64_t v16 = [v51 length];
    uint64_t v17 = a4[1];
    if (v16 - 1 >= (unint64_t)(v17 + *a4)) {
      uint64_t v18 = v17 + *a4;
    }
    else {
      uint64_t v18 = v16 - 1;
    }
    unint64_t v19 = [v51 length] - v18;
    unint64_t v20 = [*(id *)(a1 + 40) length];
    if (v19 >= v20) {
      unint64_t v21 = v20;
    }
    else {
      unint64_t v21 = v19;
    }
    uint64_t v22 = objc_msgSend(v51, "__ck_rangeOfSequenceOfCharactersFromSet:options:range:", *(void *)(a1 + 48), 0, v18, v21);
    uint64_t v24 = v23;
    uint64_t v26 = *a4;
    uint64_t v25 = a4[1];
    if (v22 + v23 != [v51 length] && v25 + v26 != objc_msgSend(v51, "length"))
    {
      if (v22 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v22 = a4[1] + *a4;
      }
      objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withString:", v22, v24, *(void *)(a1 + 40));
    }
    if (v13) {
      BOOL v27 = v26 == 0;
    }
    else {
      BOOL v27 = 1;
    }
    if (!v27)
    {
      if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v13 = *a4;
      }
      objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withString:", v13, v15, *(void *)(a1 + 40));
      uint64_t v26 = [*(id *)(a1 + 40) length] + v13;
    }
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x1E4FB0738], *(void *)(a1 + 56), v26, v25);
    id v28 = [*(id *)(a1 + 32) attribute:*MEMORY[0x1E4FB06B8] atIndex:v26 effectiveRange:0];
    if (v28)
    {
      [*(id *)(a1 + 64) bounds];
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;
      double v36 = v35;
      v37 = [v28 image];
      [v37 size];
      double v39 = v38;
      double v41 = v40;

      v42 = +[CKUIBehavior sharedBehaviors];
      [v42 readerContentInset];
      double v44 = v43;

      double v45 = v34 - (v44 + v44);
      double v46 = v36 - (v44 + v44);
      if (v45 < v39 || v46 < v41)
      {
        double v48 = v45 / v39;
        if (v39 == 0.0) {
          double v48 = 0.0;
        }
        double v49 = v46 / v41;
        if (v41 == 0.0) {
          double v49 = 0.0;
        }
        double v50 = fmin(v48, v49);
        double v39 = v39 * v50;
        double v41 = v41 * v50;
      }
      objc_msgSend(v28, "setBounds:", v30, v32, v39, v41);
    }
  }
}

- (NSAttributedString)text
{
  v2 = [(CKReaderViewController *)self textView];
  id v3 = [v2 attributedText];

  return (NSAttributedString *)v3;
}

- (_NSRange)visibleRange
{
  id v3 = [(CKReaderViewController *)self textView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v13 = [v12 isTextKit2Enabled];

  if (v13)
  {
    v29.origin.x = v5;
    v29.origin.y = v7;
    v29.size.width = v9;
    v29.size.height = v11;
    double MaxX = CGRectGetMaxX(v29);
    v30.origin.x = v5;
    v30.origin.y = v7;
    v30.size.width = v9;
    v30.size.height = v11;
    double MaxY = CGRectGetMaxY(v30);
    uint64_t v16 = objc_msgSend(v3, "closestPositionToPoint:", v5, v7);
    uint64_t v17 = objc_msgSend(v3, "closestPositionToPoint:", MaxX, MaxY);
    uint64_t v18 = [v3 beginningOfDocument];
    uint64_t v19 = [v3 offsetFromPosition:v18 toPosition:v16];

    uint64_t v20 = [v3 offsetFromPosition:v16 toPosition:v17];
  }
  else
  {
    unint64_t v21 = [(CKReaderViewController *)self textView];
    uint64_t v16 = [v21 layoutManager];

    uint64_t v22 = [(CKReaderViewController *)self textView];
    uint64_t v17 = [v22 textContainer];

    uint64_t v23 = objc_msgSend(v16, "glyphRangeForBoundingRect:inTextContainer:", v17, v5, v7, v9, v11);
    uint64_t v19 = objc_msgSend(v16, "characterRangeForGlyphRange:actualGlyphRange:", v23, v24, 0);
    uint64_t v20 = v25;
  }

  NSUInteger v26 = v19;
  NSUInteger v27 = v20;
  result.length = v27;
  result.location = v26;
  return result;
}

- (void)setVisibleRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  double v6 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v7 = [v6 isTextKit2Enabled];

  if (v7)
  {
    self->_textRangeToRestore.NSUInteger location = location;
    self->_textRangeToRestore.NSUInteger length = length;
  }
  else
  {
    id v8 = [(CKReaderViewController *)self textView];
    [v8 layoutIfNeeded];
  }
}

- (void)_restoreScrollPositionIfNeeded
{
  id v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isTextKit2Enabled];

  if (v4
    && [(CKReaderViewController *)self isViewLoaded]
    && ![(CKReaderViewController *)self isScrollPositionRestored]
    && self->_textRangeToRestore.length != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(CKReaderViewController *)self setScrollPositionRestored:1];
    id v5 = [(CKReaderViewController *)self textView];
    objc_msgSend(v5, "scrollRangeToVisible:", self->_textRangeToRestore.location, self->_textRangeToRestore.length);
  }
}

- (UITextView)textView
{
  id v3 = (id)[(CKReaderViewController *)self view];
  textView = self->_textView;

  return textView;
}

- (CKReaderViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKReaderViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)messageGUID
{
  return self->_messageGUID;
}

- (void)setMessageGUID:(id)a3
{
}

- (void)setTextView:(id)a3
{
}

- (BOOL)isScrollPositionRestored
{
  return self->_scrollPositionRestored;
}

- (void)setScrollPositionRestored:(BOOL)a3
{
  self->_scrollPositionRestored = a3;
}

- (_NSRange)textRangeToRestore
{
  p_textRangeToRestore = &self->_textRangeToRestore;
  NSUInteger location = self->_textRangeToRestore.location;
  NSUInteger length = p_textRangeToRestore->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setTextRangeToRestore:(_NSRange)a3
{
  self->_textRangeToRestore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_messageGUID, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

+ (void)readerViewControllerForAudioChatItem:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "Tried to open a reader view with a nil messageGUID", v1, 2u);
}

@end