@interface QLTextItemViewController
- (BOOL)_documentAttributesContainTextColors:(id)a3;
- (BOOL)_isContentPotentiallySuspicious:(id)a3 context:(id)a4;
- (BOOL)automaticallyUpdateScrollViewContentInset;
- (BOOL)automaticallyUpdateScrollViewContentOffset;
- (BOOL)automaticallyUpdateScrollViewIndicatorInset;
- (BOOL)canClickToToggleFullscreen;
- (BOOL)canPinchToDismiss;
- (BOOL)canSwipeToDismiss;
- (BOOL)canToggleFullScreen;
- (BOOL)isDocumentOpen;
- (BOOL)shouldAllowEditingContents;
- (BOOL)shouldEditByCreatingCopy;
- (BOOL)shouldRecognizeGestureRecognizer:(id)a3;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5;
- (UIEdgeInsets)customEdgeInsets;
- (UIPrintPageRenderer)pageRenderer;
- (UISimpleTextPrintFormatter)printFormatter;
- (UITextView)textView;
- (_TtC9QuickLook14QLTextDocument)textDocument;
- (id)_textInputShortcutsBarButtons;
- (id)availableTextSizes;
- (id)displayedDocumentURLForItem:(id)a3;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (id)registeredKeyCommands;
- (id)scrollView;
- (id)toolbarButtonsForTraitCollection:(id)a3;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (int64_t)preferredWhitePointAdaptivityStyle;
- (void)_keyboardWillAppear:(id)a3;
- (void)_keyboardWillDisappear:(id)a3;
- (void)_loadDocumentContent;
- (void)_saveDocumentContentIfNeeded;
- (void)_saveTextIfEdited:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)_saveTextIfEditedWithEditedCopy:(id)a3 shouldDismissAfterSaving:(BOOL)a4 completionHandler:(id)a5;
- (void)_setupTextViewColorsWithDocumentAttributes:(id)a3;
- (void)_setupTextViewMarginsWithDocumentAttributes:(id)a3;
- (void)_setupTextViewWithDocumentAttributes:(id)a3;
- (void)_updateConstraintConstants:(BOOL)a3;
- (void)_updateTextViewInsets;
- (void)_updateViewConstraintsFromKeyboardAppearanceInfo:(id)a3 notificationName:(id)a4;
- (void)buttonPressedWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)closeDocumentWithCompletionHandler:(id)a3;
- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5;
- (void)fontPickerViewControllerDidPickFont:(id)a3;
- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)numberOfPagesWithSize:(CGSize)a3 completionHandler:(id)a4;
- (void)openDocumentWithCompletionHandler:(id)a3;
- (void)pdfDataForPageAtIndex:(int64_t)a3 withCompletionHandler:(id)a4;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)presentColorPicker;
- (void)presentFontPicker;
- (void)presentTextSizePicker;
- (void)previewDidAppear:(BOOL)a3;
- (void)previewWillAppear:(BOOL)a3;
- (void)previewWillDisappear:(BOOL)a3;
- (void)provideCurrentPageAndVisibleRectWithCompletionHandler:(id)a3;
- (void)savePreviewEditedCopyWithCompletionHandler:(id)a3;
- (void)setAppearance:(id)a3 animated:(BOOL)a4;
- (void)setIsDocumentOpen:(BOOL)a3;
- (void)setUpDocumentWithItem:(id)a3;
- (void)setUpTextInputShortcutsBar;
- (void)setupTextView:(BOOL)a3;
- (void)textDocumentChangedRemotely:(id)a3;
- (void)textSizePickerDidCancel;
- (void)updateContentFrame;
- (void)updateSelectionAttributesWithColor:(id)a3 oldColor:(id)a4 range:(_NSRange)a5 undoable:(BOOL)a6;
- (void)updateSelectionAttributesWithFont:(id)a3 oldFont:(id)a4 range:(_NSRange)a5 undoable:(BOOL)a6;
- (void)updateTextWithColor:(id)a3 range:(_NSRange)a4 undoable:(BOOL)a5;
- (void)updateTextWithColor:(id)a3 undoable:(BOOL)a4;
- (void)updateTextWithFont:(id)a3 range:(_NSRange)a4 undoable:(BOOL)a5;
- (void)updateTextWithFont:(id)a3 undoable:(BOOL)a4;
- (void)updateTypingAttributesWithFont:(id)a3 color:(id)a4;
- (void)viewDidLoad;
@end

@implementation QLTextItemViewController

- (id)displayedDocumentURLForItem:(id)a3
{
  id v4 = a3;
  if ([(QLTextItemViewController *)self shouldEditByCreatingCopy]) {
    [v4 editedFileURL];
  }
  else {
  v5 = [v4 saveURL];
  }

  return v5;
}

- (void)openDocumentWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  if ([(QLTextItemViewController *)self isDocumentOpen])
  {
    v4[2](v4, 1);
  }
  else
  {
    v5 = [(QLTextItemViewController *)self textDocument];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __78__QLTextItemViewController_FilePresenting__openDocumentWithCompletionHandler___block_invoke;
    v6[3] = &unk_2642F5C30;
    v6[4] = self;
    v7 = v4;
    [v5 openWithCompletionHandler:v6];
  }
}

uint64_t __78__QLTextItemViewController_FilePresenting__openDocumentWithCompletionHandler___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *MEMORY[0x263F834D0];
    v6 = [v4 textDocument];
    [v3 addObserver:v4 selector:sel_textDocumentChangedRemotely_ name:v5 object:v6];

    [*(id *)(a1 + 32) _loadDocumentContent];
  }
  v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v7();
}

- (void)closeDocumentWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(QLTextItemViewController *)self _saveDocumentContentIfNeeded];
  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x263F834D0] object:0];

  id v6 = [(QLTextItemViewController *)self textDocument];
  [v6 closeWithCompletionHandler:v4];
}

- (void)_loadDocumentContent
{
  v3 = [(QLTextItemViewController *)self textDocument];
  int v4 = [v3 hasRichContent];

  uint64_t v5 = [(QLTextItemViewController *)self textDocument];
  id v6 = v5;
  if (v4)
  {
    v7 = [v5 attributedTextContent];
    v8 = [(QLTextItemViewController *)self textView];
    [v8 setAttributedText:v7];

    v9 = [(QLTextItemViewController *)self textView];
    id v13 = v9;
    uint64_t v10 = 1;
  }
  else
  {
    v11 = [v5 textContent];
    v12 = [(QLTextItemViewController *)self textView];
    [v12 setText:v11];

    v9 = [(QLTextItemViewController *)self textView];
    id v13 = v9;
    uint64_t v10 = 0;
  }
  [v9 setAllowsEditingTextAttributes:v10];
}

- (void)_saveDocumentContentIfNeeded
{
  v3 = [(QLTextItemViewController *)self textDocument];
  id v7 = [v3 attributedTextContent];

  int v4 = [(QLTextItemViewController *)self textView];
  id v5 = [v4 attributedText];

  if (v7 != v5)
  {
    id v6 = [(QLTextItemViewController *)self textDocument];
    [v6 saveWithTextContent:v5];
  }
}

- (void)textDocumentChangedRemotely:(id)a3
{
  id v7 = [a3 object];
  id v4 = [(QLTextItemViewController *)self textDocument];
  if (v7 == v4)
  {
    id v5 = [(QLTextItemViewController *)self textDocument];
    uint64_t v6 = [v5 documentState];

    if (v6 != 2)
    {
      [(QLTextItemViewController *)self _loadDocumentContent];
    }
  }
  else
  {
  }
}

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v11 = a4;
  id v12 = a5;
  id v8 = v12;
  id v9 = v11;
  id v10 = v7;
  QLRunInMainThread();
}

void __88__QLTextItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke(id *a1)
{
  objc_msgSend(a1[4], "setupTextView:", objc_msgSend(a1[4], "_isContentPotentiallySuspicious:context:", a1[5], a1[6]));
  uint64_t v2 = [a1[5] string];
  v3 = a1[4];
  id v4 = (void *)v3[139];
  v3[139] = v2;

  *((unsigned char *)a1[4] + 1152) = 0;
  int v5 = _os_feature_enabled_impl();
  uint64_t v6 = (id *)a1[4];
  if (v5)
  {
    id v7 = [a1[6] item];
    [v6 setUpDocumentWithItem:v7];

    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __88__QLTextItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_2;
    v14[3] = &unk_2642F5D70;
    id v8 = a1[4];
    id v9 = a1[5];
    id v10 = a1[4];
    id v15 = v9;
    id v16 = v10;
    id v17 = a1[7];
    [v8 openDocumentWithCompletionHandler:v14];
  }
  else
  {
    id v11 = [v6[146] textStorage];
    [v11 setAttributedString:*((void *)a1[4] + 139)];

    id v13 = [a1[5] attributes];
    objc_msgSend(a1[4], "_setupTextViewWithDocumentAttributes:");
    id v12 = (void (**)(id, void))a1[7];
    if (v12) {
      v12[2](v12, 0);
    }
  }
}

uint64_t __88__QLTextItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    v3 = [*(id *)(a1 + 32) attributes];
    [*(id *)(a1 + 40) _setupTextViewWithDocumentAttributes:v3];
    [*(id *)(a1 + 40) setUpTextInputShortcutsBar];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    int v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)setupTextView:(BOOL)a3
{
  BOOL v3 = a3;
  v32[1] = *MEMORY[0x263EF8340];
  id v5 = objc_alloc(MEMORY[0x263F82D60]);
  uint64_t v6 = (UITextView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  textView = self->_textView;
  self->_textView = v6;

  [(UITextView *)self->_textView setEditable:[(QLTextItemViewController *)self shouldAllowEditingContents]];
  [(UITextView *)self->_textView setDelegate:self];
  [(UITextView *)self->_textView setContentInsetAdjustmentBehavior:2];
  [(UITextView *)self->_textView setFindInteractionEnabled:1];
  [(UITextView *)self->_textView setKeyboardDismissMode:2];
  id v8 = [(UITextView *)self->_textView textLayoutManager];
  [v8 setLimitsLayoutForSuspiciousContents:v3];

  id v9 = [(QLTextItemViewController *)self view];
  [v9 addSubview:self->_textView];

  [(UITextView *)self->_textView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v10 = [(UITextView *)self->_textView leftAnchor];
  id v11 = [(QLTextItemViewController *)self view];
  id v12 = [v11 leftAnchor];
  id v13 = [(QLItemViewController *)self appearance];
  [v13 peripheryInsets];
  id v15 = [v10 constraintEqualToAnchor:v12 constant:v14];
  objc_msgSend(v15, "ql_activatedConstraint");
  id v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  leftConstraint = self->_leftConstraint;
  self->_leftConstraint = v16;

  v18 = [(QLTextItemViewController *)self view];
  v19 = [v18 rightAnchor];
  v20 = [(UITextView *)self->_textView rightAnchor];
  v21 = [(QLItemViewController *)self appearance];
  [v21 peripheryInsets];
  v23 = [v19 constraintEqualToAnchor:v20 constant:v22];
  objc_msgSend(v23, "ql_activatedConstraint");
  v24 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  rightConstraint = self->_rightConstraint;
  self->_rightConstraint = v24;

  v26 = [(QLTextItemViewController *)self view];
  v27 = (void *)MEMORY[0x263F08938];
  v28 = self->_textView;
  v31 = @"textView";
  v32[0] = v28;
  v29 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
  v30 = [v27 constraintsWithVisualFormat:@"V:|[textView]|" options:0 metrics:0 views:v29];
  [v26 addConstraints:v30];
}

- (UIEdgeInsets)customEdgeInsets
{
  uint64_t v2 = [(QLItemViewController *)self appearance];
  if ([v2 presentationMode] == 4)
  {
    double v4 = *MEMORY[0x263F834E8];
    double v3 = *(double *)(MEMORY[0x263F834E8] + 8);
    double v6 = *(double *)(MEMORY[0x263F834E8] + 16);
    double v5 = *(double *)(MEMORY[0x263F834E8] + 24);
  }
  else
  {
    [v2 peripheryInsets];
    double v4 = v7;
    double v3 = v8;
    double v6 = v9;
    double v5 = v10;
  }
  [v2 topInset];
  if (v4 < v11) {
    double v4 = v11;
  }
  [v2 bottomInset];
  if (v6 < v12) {
    double v6 = v12;
  }

  double v13 = v4;
  double v14 = v3;
  double v15 = v6;
  double v16 = v5;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (void)previewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (_os_feature_enabled_impl()) {
    [(QLTextItemViewController *)self openDocumentWithCompletionHandler:&__block_literal_global_2];
  }
  v5.receiver = self;
  v5.super_class = (Class)QLTextItemViewController;
  [(QLItemViewController *)&v5 previewWillAppear:v3];
}

- (void)previewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (_os_feature_enabled_impl()) {
    [(QLTextItemViewController *)self closeDocumentWithCompletionHandler:&__block_literal_global_14];
  }
  v5.receiver = self;
  v5.super_class = (Class)QLTextItemViewController;
  [(QLItemViewController *)&v5 previewWillDisappear:v3];
}

- (BOOL)_isContentPotentiallySuspicious:(id)a3 context:(id)a4
{
  v25[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = *MEMORY[0x263F1DD88];
  v25[0] = *MEMORY[0x263F1DB48];
  v25[1] = v7;
  uint64_t v8 = *MEMORY[0x263F1DC40];
  v25[2] = *MEMORY[0x263F1DD90];
  v25[3] = v8;
  double v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:4];
  double v10 = [v6 contentType];

  if (v10)
  {
    double v11 = (void *)MEMORY[0x263F1D920];
    double v12 = [v6 contentType];
    double v13 = [v11 typeWithIdentifier:v12];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v14 = v9;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v14);
          }
          if (objc_msgSend(v13, "conformsToType:", *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20))
          {
            v18 = [v5 string];
            LOBYTE(v15) = (unint64_t)[v18 length] > 0xF4240;

            goto LABEL_12;
          }
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (void)_setupTextViewWithDocumentAttributes:(id)a3
{
  id v4 = a3;
  [(QLTextItemViewController *)self _setupTextViewColorsWithDocumentAttributes:v4];
  [(QLTextItemViewController *)self _setupTextViewMarginsWithDocumentAttributes:v4];
}

- (void)_setupTextViewColorsWithDocumentAttributes:(id)a3
{
  id v10 = a3;
  id v4 = [v10 objectForKeyedSubscript:*MEMORY[0x263F814B0]];
  if (v4)
  {
    [(UITextView *)self->_textView setBackgroundColor:v4];
  }
  else
  {
    if ([(QLTextItemViewController *)self _documentAttributesContainTextColors:v10])
    {
      id v5 = [MEMORY[0x263F825C8] whiteColor];
      [(UITextView *)self->_textView setBackgroundColor:v5];
    }
    else
    {
      id v6 = [MEMORY[0x263F825C8] systemBackgroundColor];
      [(UITextView *)self->_textView setBackgroundColor:v6];

      id v5 = [(UITextView *)self->_textView textStorage];
      uint64_t v7 = *MEMORY[0x263F81500];
      uint64_t v8 = [MEMORY[0x263F825C8] labelColor];
      double v9 = [(UITextView *)self->_textView textStorage];
      objc_msgSend(v5, "addAttribute:value:range:", v7, v8, 0, objc_msgSend(v9, "length"));
    }
  }
}

- (void)_setupTextViewMarginsWithDocumentAttributes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F81530];
  id v26 = v4;
  id v6 = [v4 valueForKey:*MEMORY[0x263F81530]];

  if (v6)
  {
    uint64_t v7 = [v26 valueForKey:v5];
    [v7 UIEdgeInsetsValue];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    uint64_t v16 = *MEMORY[0x263F81538];
    id v17 = [v26 valueForKey:*MEMORY[0x263F81538]];

    if (v17)
    {
      v18 = [v26 valueForKey:v16];
      [v18 CGSizeValue];
      double v20 = v19;
      double v22 = v21;

      [(UITextView *)self->_textView frame];
      double v24 = v23 / v20;
      [(UITextView *)self->_textView frame];
      double v9 = v9 * (v25 / v22);
      double v11 = v11 * v24;
      double v13 = v13 * (v25 / v22);
      double v15 = v15 * v24;
    }
    -[UITextView setTextContainerInset:](self->_textView, "setTextContainerInset:", v9, v11, v13, v15);
  }
}

- (BOOL)_documentAttributesContainTextColors:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F814D8]];
  char v6 = [v5 isEqualToString:*MEMORY[0x263F81548]];

  if (v6)
  {
    BOOL v7 = 0;
  }
  else
  {
    uint64_t v19 = 0;
    double v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    double v8 = [(UITextView *)self->_textView textStorage];
    double v9 = [v8 string];
    unint64_t v10 = [v9 length];

    if (v10 >= 0xC350) {
      uint64_t v11 = 50000;
    }
    else {
      uint64_t v11 = v10;
    }
    double v12 = [(UITextView *)self->_textView textStorage];
    uint64_t v13 = *MEMORY[0x263F81500];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __65__QLTextItemViewController__documentAttributesContainTextColors___block_invoke;
    v18[3] = &unk_2642F5DB8;
    v18[4] = &v19;
    objc_msgSend(v12, "enumerateAttribute:inRange:options:usingBlock:", v13, 0, v11, 0x100000, v18);

    if (*((unsigned char *)v20 + 24))
    {
      BOOL v7 = 1;
    }
    else
    {
      double v14 = [(UITextView *)self->_textView textStorage];
      uint64_t v15 = *MEMORY[0x263F814A8];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __65__QLTextItemViewController__documentAttributesContainTextColors___block_invoke_2;
      v17[3] = &unk_2642F5DB8;
      v17[4] = &v19;
      objc_msgSend(v14, "enumerateAttribute:inRange:options:usingBlock:", v15, 0, v11, 0x100000, v17);

      BOOL v7 = *((unsigned char *)v20 + 24) != 0;
    }
    _Block_object_dispose(&v19, 8);
  }

  return v7;
}

uint64_t __65__QLTextItemViewController__documentAttributesContainTextColors___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

uint64_t __65__QLTextItemViewController__documentAttributesContainTextColors___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)QLTextItemViewController;
  [(QLTextItemViewController *)&v7 viewDidLoad];
  BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__keyboardWillAppear_ name:*MEMORY[0x263F83808] object:0];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel__keyboardWillAppear_ name:*MEMORY[0x263F837D8] object:0];

  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel__keyboardWillDisappear_ name:*MEMORY[0x263F83800] object:0];

  char v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 addObserver:self selector:sel__keyboardWillAppear_ name:*MEMORY[0x263F837F8] object:0];
}

- (void)previewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)QLTextItemViewController;
  [(QLItemViewController *)&v6 previewDidAppear:a3];
  id v4 = [MEMORY[0x263F82670] currentDevice];
  int v5 = [v4 _isHardwareKeyboardAvailable];

  if (v5) {
    [(UITextView *)self->_textView becomeFirstResponder];
  }
}

- (id)toolbarButtonsForTraitCollection:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)QLTextItemViewController;
  BOOL v3 = [(QLItemViewController *)&v7 toolbarButtonsForTraitCollection:a3];
  id v4 = (void *)[v3 mutableCopy];

  int v5 = (void *)[objc_alloc(MEMORY[0x263F629D0]) initWithIdentifier:@"QLSearchButton"];
  [v5 setSymbolImageName:@"magnifyingglass"];
  [v5 setPlacement:0];
  [v5 setForceToNavBar:_UIBarsDesktopNavigationBarEnabled() ^ 1];
  [v5 setAccessibilityIdentifier:@"QLTextItemViewControllerBarSearchRightButtonAccessibilityIdentifier"];
  [v4 addObject:v5];

  return v4;
}

- (void)buttonPressedWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  objc_super v7 = (void (**)(void))a4;
  if ([v6 isEqualToString:@"QLSearchButton"])
  {
    double v8 = [(UITextView *)self->_textView findInteraction];
    [v8 presentFindNavigatorShowingReplace:0];

    v7[2](v7);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)QLTextItemViewController;
    [(QLItemViewController *)&v9 buttonPressedWithIdentifier:v6 completionHandler:v7];
  }
}

- (BOOL)canSwipeToDismiss
{
  return 0;
}

- (BOOL)canPinchToDismiss
{
  return 1;
}

- (id)registeredKeyCommands
{
  v4.receiver = self;
  v4.super_class = (Class)QLTextItemViewController;
  uint64_t v2 = [(QLItemViewController *)&v4 registeredKeyCommands];

  return v2;
}

- (BOOL)shouldRecognizeGestureRecognizer:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 locationInView:self->_textView];
    int v5 = -[UITextView characterRangeAtPoint:](self->_textView, "characterRangeAtPoint:");
    textView = self->_textView;
    objc_super v7 = [(UITextView *)textView beginningOfDocument];
    double v8 = [v5 start];
    uint64_t v9 = [(UITextView *)textView offsetFromPosition:v7 toPosition:v8];

    unint64_t v10 = self->_textView;
    uint64_t v11 = [(UITextView *)v10 beginningOfDocument];
    double v12 = [v5 end];
    uint64_t v13 = [(UITextView *)v10 offsetFromPosition:v11 toPosition:v12];

    if ([v5 isEmpty])
    {
      BOOL v14 = 1;
    }
    else
    {
      uint64_t v15 = [(UITextView *)self->_textView attributedText];
      uint64_t v16 = objc_msgSend(v15, "attributedSubstringFromRange:", v9, v13 - v9);

      if ([v16 length])
      {
        uint64_t v17 = [v16 attribute:*MEMORY[0x263F81520] atIndex:0 effectiveRange:0];
        BOOL v14 = v17 == 0;

        uint64_t v16 = (void *)v17;
      }
      else
      {
        BOOL v14 = 1;
      }
    }
  }
  else
  {
    BOOL v14 = 1;
  }

  return v14;
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)QLTextItemViewController;
  -[QLItemViewController setAppearance:animated:](&v6, sel_setAppearance_animated_, a3);
  [(QLTextItemViewController *)self _updateConstraintConstants:v4];
  [(QLTextItemViewController *)self updateContentFrame];
  [(QLTextItemViewController *)self _updateTextViewInsets];
}

- (id)scrollView
{
  return self->_textView;
}

- (BOOL)automaticallyUpdateScrollViewContentOffset
{
  return 1;
}

- (BOOL)automaticallyUpdateScrollViewContentInset
{
  return 1;
}

- (BOOL)automaticallyUpdateScrollViewIndicatorInset
{
  return 0;
}

- (BOOL)canToggleFullScreen
{
  [(UITextView *)self->_textView selectedRange];
  return v2 == 0;
}

- (BOOL)canClickToToggleFullscreen
{
  return 0;
}

- (UISimpleTextPrintFormatter)printFormatter
{
  printFormatter = self->_printFormatter;
  if (!printFormatter)
  {
    BOOL v4 = (UISimpleTextPrintFormatter *)[objc_alloc(MEMORY[0x263F610A0]) initWithAttributedText:self->_content];
    int v5 = self->_printFormatter;
    self->_printFormatter = v4;

    printFormatter = self->_printFormatter;
  }

  return printFormatter;
}

- (UIPrintPageRenderer)pageRenderer
{
  pageRenderer = self->_pageRenderer;
  if (!pageRenderer)
  {
    BOOL v4 = (UIPrintPageRenderer *)objc_alloc_init(MEMORY[0x263F61098]);
    int v5 = self->_pageRenderer;
    self->_pageRenderer = v4;

    objc_super v6 = self->_pageRenderer;
    objc_super v7 = [(QLTextItemViewController *)self printFormatter];
    [(UIPrintPageRenderer *)v6 addPrintFormatter:v7 startingAtPageAtIndex:0];

    pageRenderer = self->_pageRenderer;
  }

  return pageRenderer;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5
{
  id v6 = a4;
  objc_super v7 = [(QLItemViewController *)self delegate];
  [v7 previewItemViewController:self wantsToOpenURL:v6];

  return 0;
}

- (void)updateContentFrame
{
  id v4 = [(QLTextItemViewController *)self view];
  BOOL v3 = [(UITextView *)self->_textView selectionContainerView];
  [v3 frame];
  objc_msgSend(v4, "convertRect:fromView:", self->_textView);
  -[QLItemViewController setContentFrame:](self, "setContentFrame:");
}

- (void)_updateTextViewInsets
{
  [(QLTextItemViewController *)self customEdgeInsets];
  double v4 = v3;
  if (self->_isKeyboardVisible)
  {
    -[UITextView setContentInset:](self->_textView, "setContentInset:");
    textView = self->_textView;
    double v6 = self->_keyboardBottomOffset - v4;
    double v7 = 0.0;
    double v8 = 0.0;
    double v9 = 0.0;
  }
  else
  {
    -[UITextView setContentInset:](self->_textView, "setContentInset:");
    double v7 = *MEMORY[0x263F834E8];
    double v8 = *(double *)(MEMORY[0x263F834E8] + 8);
    textView = self->_textView;
    double v6 = *(double *)(MEMORY[0x263F834E8] + 16);
    double v9 = *(double *)(MEMORY[0x263F834E8] + 24);
  }

  -[UITextView setScrollIndicatorInsets:](textView, "setScrollIndicatorInsets:", v7, v8, v6, v9);
}

- (void)numberOfPagesWithSize:(CGSize)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  QLRunInMainThreadSync();
}

void __68__QLTextItemViewController_numberOfPagesWithSize_completionHandler___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  id v4 = [*(id *)(a1 + 32) pageRenderer];
  objc_msgSend(v4, "setPrintableRect:", 0.0, 0.0, v2, v3);

  [*(id *)(*(void *)(a1 + 32) + 1184) printableRect];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  uint64_t v13 = [*(id *)(a1 + 32) pageRenderer];
  objc_msgSend(v13, "setPaperRect:", v6, v8, v10, v12);

  uint64_t v14 = *(void *)(a1 + 40);
  id v15 = [*(id *)(a1 + 32) printFormatter];
  (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v14, [v15 pageCount]);
}

- (void)pdfDataForPageAtIndex:(int64_t)a3 withCompletionHandler:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  QLRunInMainThreadSync();
}

void __72__QLTextItemViewController_pdfDataForPageAtIndex_withCompletionHandler___block_invoke(uint64_t a1)
{
  data = (NSMutableData *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:0];
  double v2 = [*(id *)(a1 + 32) pageRenderer];
  [v2 printableRect];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  v23.origin.x = v4;
  v23.origin.y = v6;
  v23.size.width = v8;
  v23.size.height = v10;
  UIGraphicsBeginPDFContextToData(data, v23, 0);
  UIGraphicsBeginPDFPage();
  double v11 = [*(id *)(a1 + 32) printFormatter];
  [v11 rectForPageAtIndex:*(void *)(a1 + 48)];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = [*(id *)(a1 + 32) printFormatter];
  objc_msgSend(v20, "drawInRect:forPageAtIndex:", *(void *)(a1 + 48), v13, v15, v17, v19);

  UIGraphicsEndPDFContext();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)provideCurrentPageAndVisibleRectWithCompletionHandler:(id)a3
{
}

- (int64_t)preferredWhitePointAdaptivityStyle
{
  return 1;
}

- (void)_keyboardWillAppear:(id)a3
{
  self->_isKeyboardVisible = 1;
  id v4 = a3;
  id v6 = [v4 userInfo];
  double v5 = [v4 name];

  [(QLTextItemViewController *)self _updateViewConstraintsFromKeyboardAppearanceInfo:v6 notificationName:v5];
}

- (void)_keyboardWillDisappear:(id)a3
{
  self->_isKeyboardVisible = 0;
  id v4 = a3;
  id v6 = [v4 userInfo];
  double v5 = [v4 name];

  [(QLTextItemViewController *)self _updateViewConstraintsFromKeyboardAppearanceInfo:v6 notificationName:v5];
}

- (void)_updateViewConstraintsFromKeyboardAppearanceInfo:(id)a3 notificationName:(id)a4
{
  uint64_t v5 = *MEMORY[0x263F837B8];
  id v6 = a3;
  double v7 = [v6 objectForKey:v5];
  [v7 CGRectValue];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = [(QLTextItemViewController *)self view];
  double v17 = [v16 window];
  double v18 = [v17 screen];
  double v19 = [v18 coordinateSpace];

  double v20 = [(QLTextItemViewController *)self view];
  uint64_t v21 = [v20 coordinateSpace];

  objc_msgSend(v19, "convertRect:toCoordinateSpace:", v21, v9, v11, v13, v15);
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  v30 = [(QLTextItemViewController *)self view];
  [v30 bounds];
  double MaxY = CGRectGetMaxY(v36);
  v37.origin.x = v23;
  v37.origin.y = v25;
  v37.size.width = v27;
  v37.size.height = v29;
  self->_keyboardBottomOffset = MaxY - CGRectGetMinY(v37);

  [(QLTextItemViewController *)self _updateTextViewInsets];
  v32 = (void *)MEMORY[0x263F82E00];
  v33 = [v6 objectForKey:*MEMORY[0x263F83780]];

  [v33 floatValue];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __94__QLTextItemViewController__updateViewConstraintsFromKeyboardAppearanceInfo_notificationName___block_invoke;
  v35[3] = &unk_2642F5430;
  v35[4] = self;
  [v32 animateWithDuration:v35 animations:v34];
}

void __94__QLTextItemViewController__updateViewConstraintsFromKeyboardAppearanceInfo_notificationName___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

- (void)setUpDocumentWithItem:(id)a3
{
  id v6 = [(QLTextItemViewController *)self displayedDocumentURLForItem:a3];
  id v4 = [[_TtC9QuickLook14QLTextDocument alloc] initWithFileURL:v6];
  textDocument = self->_textDocument;
  self->_textDocument = v4;
}

- (void)_updateConstraintConstants:(BOOL)a3
{
  BOOL v3 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__QLTextItemViewController__updateConstraintConstants___block_invoke;
  aBlock[3] = &unk_2642F5430;
  aBlock[4] = self;
  id v4 = _Block_copy(aBlock);
  uint64_t v5 = v4;
  if (v3) {
    [MEMORY[0x263F82E00] animateWithDuration:v4 animations:0.2];
  }
  else {
    (*((void (**)(void *))v4 + 2))(v4);
  }
}

void __55__QLTextItemViewController__updateConstraintConstants___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) appearance];
  [v2 peripheryInsets];
  [*(id *)(*(void *)(a1 + 32) + 1120) setConstant:v3];

  id v4 = [*(id *)(a1 + 32) appearance];
  [v4 peripheryInsets];
  [*(id *)(*(void *)(a1 + 32) + 1128) setConstant:v5];

  id v6 = [*(id *)(a1 + 32) view];
  [v6 setNeedsLayout];
}

- (BOOL)isDocumentOpen
{
  return self->_isDocumentOpen;
}

- (void)setIsDocumentOpen:(BOOL)a3
{
  self->_isDocumentOpen = a3;
}

- (_TtC9QuickLook14QLTextDocument)textDocument
{
  return self->_textDocument;
}

- (UITextView)textView
{
  return self->_textView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageRenderer, 0);
  objc_storeStrong((id *)&self->_printFormatter, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_textDocument, 0);
  objc_storeStrong((id *)&self->_rightConstraint, 0);
  objc_storeStrong((id *)&self->_leftConstraint, 0);

  objc_storeStrong((id *)&self->_content, 0);
}

- (BOOL)shouldAllowEditingContents
{
  if (_os_feature_enabled_impl() && _os_feature_enabled_impl())
  {
    id v4 = [(QLItemViewController *)self context];
    int v5 = [v4 canBeEdited];
    if (v5
      && ([(QLItemViewController *)self context],
          double v2 = objc_claimAutoreleasedReturnValue(),
          [v2 editedFileBehavior]))
    {
      BOOL v6 = 1;
    }
    else
    {
      double v7 = [(QLItemViewController *)self context];
      double v8 = [v7 item];
      BOOL v6 = [v8 editingMode] != 0;

      if (!v5)
      {
LABEL_9:

        return v6;
      }
    }

    goto LABEL_9;
  }
  return 0;
}

- (BOOL)shouldEditByCreatingCopy
{
  id v4 = [(QLItemViewController *)self context];
  int v5 = [v4 canBeEdited];
  if (v5)
  {
    double v2 = [(QLItemViewController *)self context];
    if ([v2 editedFileBehavior] == 2)
    {
      BOOL v6 = 1;
LABEL_5:

      goto LABEL_6;
    }
  }
  double v7 = [(QLItemViewController *)self context];
  double v8 = [v7 item];
  BOOL v6 = [v8 editingMode] == 2;

  if (v5) {
    goto LABEL_5;
  }
LABEL_6:

  return v6;
}

- (void)savePreviewEditedCopyWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if ([(QLTextItemViewController *)self shouldAllowEditingContents])
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __80__QLTextItemViewController_Editing__savePreviewEditedCopyWithCompletionHandler___block_invoke;
    v5[3] = &unk_2642F65E0;
    id v6 = v4;
    [(QLTextItemViewController *)self _saveTextIfEdited:1 withCompletionHandler:v5];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

uint64_t __80__QLTextItemViewController_Editing__savePreviewEditedCopyWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_saveTextIfEdited:(BOOL)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  double v7 = [(QLItemViewController *)self context];
  double v8 = [v7 item];
  double v9 = [v8 previewItemContentType];

  if (v9)
  {
    double v10 = (void *)MEMORY[0x263F1D920];
    double v11 = [(QLItemViewController *)self context];
    double v12 = [v11 item];
    double v13 = [v12 previewItemContentType];
    double v14 = [v10 typeWithIdentifier:v13];

    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __77__QLTextItemViewController_Editing___saveTextIfEdited_withCompletionHandler___block_invoke;
    v15[3] = &unk_2642F6608;
    id v16 = v6;
    objc_copyWeak(&v17, &location);
    BOOL v18 = a3;
    [(QLItemViewController *)self editedCopyToSaveChangesWithOutputType:v14 completionHandler:v15];
    objc_destroyWeak(&v17);
  }
  else
  {
    double v14 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F62938] code:0 userInfo:0];
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v14);
  }

  objc_destroyWeak(&location);
}

void __77__QLTextItemViewController_Editing___saveTextIfEdited_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = v6;
  if (!v5 || v6)
  {
    double v9 = (NSObject **)MEMORY[0x263F62940];
    double v10 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      double v10 = *v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v11 = 0;
      _os_log_impl(&dword_217F61000, v10, OS_LOG_TYPE_ERROR, "Could not create edited text because could not generate a URL to save the file. #AnyItemViewController", v11, 2u);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _saveTextIfEditedWithEditedCopy:v5 shouldDismissAfterSaving:*(unsigned __int8 *)(a1 + 48) completionHandler:*(void *)(a1 + 32)];
  }
}

- (void)_saveTextIfEditedWithEditedCopy:(id)a3 shouldDismissAfterSaving:(BOOL)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (_os_feature_enabled_impl())
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __112__QLTextItemViewController_Editing___saveTextIfEditedWithEditedCopy_shouldDismissAfterSaving_completionHandler___block_invoke;
    v9[3] = &unk_2642F5C30;
    id v10 = v7;
    id v11 = v8;
    [(QLTextItemViewController *)self closeDocumentWithCompletionHandler:v9];
  }
}

uint64_t __112__QLTextItemViewController_Editing___saveTextIfEditedWithEditedCopy_shouldDismissAfterSaving_completionHandler___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) bumpVersion];
    [*(id *)(a1 + 32) markAsPurgeable];
  }
  double v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (void)setUpTextInputShortcutsBar
{
  id v3 = objc_alloc(MEMORY[0x263EFF980]);
  id v4 = [(QLTextItemViewController *)self _textInputShortcutsBarButtons];
  id v18 = (id)[v3 initWithArray:v4];

  id v5 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    id v7 = [(QLTextItemViewController *)self textView];
    id v8 = [v7 inputAssistantItem];

    id v9 = objc_alloc(MEMORY[0x263F824A8]);
    id v10 = [MEMORY[0x263F827E8] systemImageNamed:@"textFormat"];
    id v11 = (void *)[v9 initWithImage:v10 style:0 target:0 action:0];

    double v12 = (void *)[objc_alloc(MEMORY[0x263F824B8]) initWithBarButtonItems:v18 representativeItem:v11];
    id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
    double v14 = [v8 trailingBarButtonGroups];
    [v13 addObjectsFromArray:v14];

    [v13 addObject:v12];
    [v8 setTrailingBarButtonGroups:v13];
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x263F82D70]);
    double v15 = [MEMORY[0x263F825C8] systemFillColor];
    [v8 setBackgroundColor:v15];

    id v16 = [MEMORY[0x263F825C8] labelColor];
    [v8 setTintColor:v16];

    id v17 = [MEMORY[0x263F824A8] flexibleSpaceItem];
    [v18 insertObject:v17 atIndex:0];

    [v8 setItems:v18];
    [v8 sizeToFit];
    id v11 = [(QLTextItemViewController *)self textView];
    [v11 setInputAccessoryView:v8];
  }
}

- (id)_textInputShortcutsBarButtons
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([(QLTextItemViewController *)self shouldAllowEditingContents])
  {
    id v4 = [(QLTextItemViewController *)self textDocument];
    int v5 = [v4 hasRichContent];

    if (v5)
    {
      uint64_t v6 = [MEMORY[0x263F827E8] systemImageNamed:@"pencil.tip"];
      id v7 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithImage:v6 style:0 target:self action:sel_presentColorPicker];
      [v7 setAccessibilityIdentifier:@"QLTextItemViewControllerBarColorPickerRightButtonAccessibilityIdentifier"];
      [v3 addObject:v7];
      id v8 = [MEMORY[0x263F827E8] systemImageNamed:@"textformat.size"];
      id v9 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithImage:v8 style:0 target:self action:sel_presentTextSizePicker];
      [v9 setAccessibilityIdentifier:@"QLTextItemViewControllerBarTextSizePickerRightButtonAccessibilityIdentifier"];
      [v3 addObject:v9];
      id v10 = [MEMORY[0x263F827E8] systemImageNamed:@"textformat"];
      id v11 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithImage:v10 style:0 target:self action:sel_presentFontPicker];
      [v11 setAccessibilityIdentifier:@"QLTextItemViewControllerBarFontPickerRightButtonAccessibilityIdentifier"];
      [v3 addObject:v11];
    }
  }

  return v3;
}

- (void)updateTextWithFont:(id)a3 undoable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v9 = [(QLTextItemViewController *)self textView];
  uint64_t v7 = [v9 selectedRange];
  -[QLTextItemViewController updateTextWithFont:range:undoable:](self, "updateTextWithFont:range:undoable:", v6, v7, v8, v4);
}

- (void)updateTextWithFont:(id)a3 range:(_NSRange)a4 undoable:(BOOL)a5
{
  BOOL v5 = a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v13 = a3;
  if (length)
  {
    id v9 = [(QLTextItemViewController *)self textView];
    id v10 = [v9 font];
    -[QLTextItemViewController updateSelectionAttributesWithFont:oldFont:range:undoable:](self, "updateSelectionAttributesWithFont:oldFont:range:undoable:", v13, v10, location, length, v5);
  }
  id v11 = [(QLTextItemViewController *)self textView];
  double v12 = [v11 textColor];
  [(QLTextItemViewController *)self updateTypingAttributesWithFont:v13 color:v12];
}

- (void)updateTextWithColor:(id)a3 undoable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v9 = [(QLTextItemViewController *)self textView];
  uint64_t v7 = [v9 selectedRange];
  -[QLTextItemViewController updateTextWithColor:range:undoable:](self, "updateTextWithColor:range:undoable:", v6, v7, v8, v4);
}

- (void)updateTextWithColor:(id)a3 range:(_NSRange)a4 undoable:(BOOL)a5
{
  BOOL v5 = a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v13 = a3;
  if (length)
  {
    id v9 = [(QLTextItemViewController *)self textView];
    id v10 = [v9 textColor];
    -[QLTextItemViewController updateSelectionAttributesWithColor:oldColor:range:undoable:](self, "updateSelectionAttributesWithColor:oldColor:range:undoable:", v13, v10, location, length, v5);
  }
  id v11 = [(QLTextItemViewController *)self textView];
  double v12 = [v11 font];
  [(QLTextItemViewController *)self updateTypingAttributesWithFont:v12 color:v13];
}

- (void)updateTypingAttributesWithFont:(id)a3 color:(id)a4
{
  v13[2] = *MEMORY[0x263EF8340];
  uint64_t v6 = *MEMORY[0x263F81500];
  v12[0] = *MEMORY[0x263F814F0];
  v12[1] = v6;
  v13[0] = a3;
  v13[1] = a4;
  uint64_t v7 = NSDictionary;
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 dictionaryWithObjects:v13 forKeys:v12 count:2];

  id v11 = [(QLTextItemViewController *)self textView];
  [v11 setTypingAttributes:v10];
}

- (void)updateSelectionAttributesWithFont:(id)a3 oldFont:(id)a4 range:(_NSRange)a5 undoable:(BOOL)a6
{
  BOOL v6 = a6;
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  v23[1] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  uint64_t v22 = *MEMORY[0x263F814F0];
  v23[0] = v11;
  id v13 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
  double v14 = [(QLTextItemViewController *)self textView];
  double v15 = [v14 textStorage];
  objc_msgSend(v15, "addAttributes:range:", v13, location, length);

  if (v6)
  {
    id v16 = [(QLTextItemViewController *)self textView];
    id v17 = [v16 undoManager];
    id v18 = [v17 prepareWithInvocationTarget:self];
    objc_msgSend(v18, "updateSelectionAttributesWithFont:oldFont:range:undoable:", v12, v11, location, length, 1);

    double v19 = [(QLTextItemViewController *)self textView];
    double v20 = [v19 undoManager];
    uint64_t v21 = QLLocalizedString();
    [v20 setActionName:v21];
  }
}

- (void)updateSelectionAttributesWithColor:(id)a3 oldColor:(id)a4 range:(_NSRange)a5 undoable:(BOOL)a6
{
  BOOL v6 = a6;
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  v23[1] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  uint64_t v22 = *MEMORY[0x263F81500];
  v23[0] = v11;
  id v13 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
  double v14 = [(QLTextItemViewController *)self textView];
  double v15 = [v14 textStorage];
  objc_msgSend(v15, "addAttributes:range:", v13, location, length);

  if (v6)
  {
    id v16 = [(QLTextItemViewController *)self textView];
    id v17 = [v16 undoManager];
    id v18 = [v17 prepareWithInvocationTarget:self];
    objc_msgSend(v18, "updateSelectionAttributesWithColor:oldColor:range:undoable:", v12, v11, location, length, 1);

    double v19 = [(QLTextItemViewController *)self textView];
    double v20 = [v19 undoManager];
    uint64_t v21 = QLLocalizedString();
    [v20 setActionName:v21];
  }
}

- (void)presentFontPicker
{
  id v4 = objc_alloc_init(MEMORY[0x263F82780]);
  [v4 setIncludeFaces:1];
  id v3 = (void *)[objc_alloc(MEMORY[0x263F82778]) initWithConfiguration:v4];
  [v3 setDelegate:self];
  [(QLTextItemViewController *)self presentViewController:v3 animated:1 completion:0];
}

- (void)fontPickerViewControllerDidPickFont:(id)a3
{
  id v8 = [a3 selectedFontDescriptor];
  if (v8)
  {
    id v4 = (void *)MEMORY[0x263F81708];
    BOOL v5 = [(QLTextItemViewController *)self textView];
    BOOL v6 = [v5 font];
    [v6 pointSize];
    uint64_t v7 = objc_msgSend(v4, "fontWithDescriptor:size:", v8);

    [(QLTextItemViewController *)self updateTextWithFont:v7 undoable:1];
  }
}

- (id)availableTextSizes
{
  return &unk_26C913328;
}

- (void)presentTextSizePicker
{
  v14[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F82A38]);
  id v4 = [MEMORY[0x263F825C8] secondarySystemBackgroundColor];
  [v3 setBackgroundColor:v4];

  [v3 setDataSource:self];
  [v3 setDelegate:self];
  id v5 = objc_alloc_init(MEMORY[0x263F82E10]);
  [v5 setView:v3];
  BOOL v6 = QLLocalizedString();
  uint64_t v7 = [v5 navigationItem];
  [v7 setTitle:v6];

  id v8 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_textSizePickerDidCancel];
  id v9 = [v5 navigationItem];
  [v9 setRightBarButtonItem:v8];

  id v10 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v5];
  [v10 setModalPresentationStyle:2];
  id v11 = [MEMORY[0x263F82BD0] mediumDetent];
  v14[0] = v11;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v13 = [v10 sheetPresentationController];
  [v13 setDetents:v12];

  [(QLTextItemViewController *)self presentViewController:v10 animated:1 completion:0];
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  id v4 = [(QLTextItemViewController *)self availableTextSizes];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  BOOL v6 = [(QLTextItemViewController *)self availableTextSizes];
  uint64_t v7 = [v6 objectAtIndexedSubscript:a4];
  id v8 = [v7 stringValue];

  return v8;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  uint64_t v7 = (void *)MEMORY[0x263F81708];
  id v8 = [(QLTextItemViewController *)self textView];
  id v9 = [v8 font];
  id v10 = [v9 fontDescriptor];
  id v11 = [(QLTextItemViewController *)self availableTextSizes];
  id v12 = [v11 objectAtIndexedSubscript:a4];
  [v12 floatValue];
  id v14 = [v7 fontWithDescriptor:v10 size:v13];

  [(QLTextItemViewController *)self updateTextWithFont:v14 undoable:1];
}

- (void)textSizePickerDidCancel
{
  id v2 = [(QLTextItemViewController *)self presentedViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)presentColorPicker
{
  id v5 = objc_alloc_init(MEMORY[0x263F825E0]);
  id v3 = [(QLTextItemViewController *)self textView];
  id v4 = [v3 textColor];
  [v5 setSelectedColor:v4];

  [v5 setDelegate:self];
  [(QLTextItemViewController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = [a3 selectedColor];
  [(QLTextItemViewController *)self updateTextWithColor:v7 undoable:!v5];
}

@end