@interface QLDebugItemViewController
- (BOOL)canEnterFullScreen;
- (BOOL)canPinchToDismiss;
- (BOOL)canSwipeToDismiss;
- (id)_attributesForLogLevel:(unint64_t)a3;
- (void)_addLog:(id)a3 logLevel:(unint64_t)a4;
- (void)_encounterMethodCall:(SEL)a3;
- (void)_encounterMethodCall:(SEL)a3 animatedValue:(unint64_t)a4;
- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)previewDidAppear:(BOOL)a3;
- (void)previewDidDisappear:(BOOL)a3;
- (void)previewIsAppearingWithProgress:(double)a3;
- (void)previewWillAppear:(BOOL)a3;
- (void)previewWillDisappear:(BOOL)a3;
- (void)previewWillFinishAppearing;
- (void)setAppearance:(id)a3 animated:(BOOL)a4;
@end

@implementation QLDebugItemViewController

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void))a5;
  v11 = (NSObject **)MEMORY[0x263F62940];
  v12 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    v12 = *v11;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v44 = self;
    _os_log_impl(&dword_217F61000, v12, OS_LOG_TYPE_DEFAULT, "A Debug Item View Controller was instantiated: %p #DebugItemViewController", buf, 0xCu);
  }
  v13 = (NSMutableDictionary *)[MEMORY[0x263EFFA78] mutableCopy];
  selectorToCount = self->_selectorToCount;
  self->_selectorToCount = v13;

  v15 = (UITextView *)objc_opt_new();
  logTextView = self->_logTextView;
  self->_logTextView = v15;

  [(UITextView *)self->_logTextView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITextView *)self->_logTextView setEditable:0];
  [(UITextView *)self->_logTextView setSelectable:1];
  [(UITextView *)self->_logTextView setScrollEnabled:1];
  v17 = [(QLDebugItemViewController *)self view];
  [v17 addSubview:self->_logTextView];

  v18 = [(UITextView *)self->_logTextView topAnchor];
  v19 = [(QLDebugItemViewController *)self view];
  v20 = [v19 topAnchor];
  v21 = [(QLItemViewController *)self appearance];
  [v21 topInset];
  v22 = objc_msgSend(v18, "constraintEqualToAnchor:constant:", v20);
  objc_msgSend(v22, "ql_activatedConstraint");
  v23 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  topConstraint = self->_topConstraint;
  self->_topConstraint = v23;

  v25 = [(QLDebugItemViewController *)self view];
  v26 = [v25 bottomAnchor];
  v27 = [(UITextView *)self->_logTextView bottomAnchor];
  v28 = [(QLItemViewController *)self appearance];
  [v28 bottomInset];
  v29 = objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27);
  objc_msgSend(v29, "ql_activatedConstraint");
  v30 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  bottomConstraint = self->_bottomConstraint;
  self->_bottomConstraint = v30;

  v32 = [(QLDebugItemViewController *)self view];
  v33 = (void *)MEMORY[0x263F08938];
  v34 = self->_logTextView;
  v41 = @"textView";
  v42 = v34;
  v35 = [NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
  v36 = [v33 constraintsWithVisualFormat:@"H:|[textView]|" options:0 metrics:0 views:v35];
  [v32 addConstraints:v36];

  v37 = NSString;
  int IsExtension = _UIApplicationIsExtension();
  v39 = @"NO";
  if (IsExtension) {
    v39 = @"YES";
  }
  v40 = [v37 stringWithFormat:@"Running remote: %@", v39];
  [(QLDebugItemViewController *)self _addLog:v40 logLevel:3];

  v10[2](v10, 0);
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v19.receiver = self;
  v19.super_class = (Class)QLDebugItemViewController;
  id v7 = a3;
  [(QLItemViewController *)&v19 setAppearance:v7 animated:v4];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__QLDebugItemViewController_setAppearance_animated___block_invoke;
  aBlock[3] = &unk_2642F5430;
  aBlock[4] = self;
  id v8 = _Block_copy(aBlock);
  id v9 = v8;
  if (v4) {
    [MEMORY[0x263F82E00] animateWithDuration:v8 animations:0.2];
  }
  else {
    (*((void (**)(void *))v8 + 2))(v8);
  }
  v10 = NSString;
  v11 = NSStringFromSelector(a2);
  [v7 topInset];
  uint64_t v13 = v12;
  [v7 bottomInset];
  uint64_t v15 = v14;
  uint64_t v16 = [v7 presentationMode];

  v17 = [v10 stringWithFormat:@"%@: %f, %f, %ld", v11, v13, v15, v16];
  [(QLDebugItemViewController *)self _addLog:v17 logLevel:0];
}

void __52__QLDebugItemViewController_setAppearance_animated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) appearance];
  [v2 topInset];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1136), "setConstant:");

  v3 = [*(id *)(a1 + 32) appearance];
  [v3 bottomInset];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1144), "setConstant:");

  id v4 = [*(id *)(a1 + 32) view];
  [v4 setNeedsLayout];
}

- (BOOL)canSwipeToDismiss
{
  return 0;
}

- (BOOL)canPinchToDismiss
{
  return 0;
}

- (BOOL)canEnterFullScreen
{
  return 0;
}

- (void)previewWillAppear:(BOOL)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)QLDebugItemViewController;
  [(QLItemViewController *)&v8 previewWillAppear:a3];
  [(QLDebugItemViewController *)self _encounterMethodCall:a2];
  id v9 = @"previewItemName";
  v5 = [(QLItemViewController *)self context];
  v6 = [v5 previewTitle];
  v10[0] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  QLNotifySelector(a2, v7);
}

- (void)previewIsAppearingWithProgress:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)QLDebugItemViewController;
  [(QLItemViewController *)&v5 previewIsAppearingWithProgress:a3];
  [(QLDebugItemViewController *)self _encounterMethodCall:a2];
}

- (void)previewWillFinishAppearing
{
  v4.receiver = self;
  v4.super_class = (Class)QLDebugItemViewController;
  [(QLItemViewController *)&v4 previewWillFinishAppearing];
  [(QLDebugItemViewController *)self _encounterMethodCall:a2];
}

- (void)previewDidAppear:(BOOL)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)QLDebugItemViewController;
  [(QLItemViewController *)&v8 previewDidAppear:a3];
  [(QLDebugItemViewController *)self _encounterMethodCall:a2];
  id v9 = @"previewItemName";
  objc_super v5 = [(QLItemViewController *)self context];
  v6 = [v5 previewTitle];
  v10[0] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  QLNotifySelector(a2, v7);
}

- (void)previewWillDisappear:(BOOL)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)QLDebugItemViewController;
  [(QLItemViewController *)&v8 previewWillDisappear:a3];
  [(QLDebugItemViewController *)self _encounterMethodCall:a2];
  id v9 = @"previewItemName";
  objc_super v5 = [(QLItemViewController *)self context];
  v6 = [v5 previewTitle];
  v10[0] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  QLNotifySelector(a2, v7);
}

- (void)previewDidDisappear:(BOOL)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)QLDebugItemViewController;
  [(QLItemViewController *)&v8 previewDidDisappear:a3];
  [(QLDebugItemViewController *)self _encounterMethodCall:a2];
  [(QLDebugItemViewController *)self _addLog:@"\n---\n" logLevel:3];
  id v9 = @"previewItemName";
  objc_super v5 = [(QLItemViewController *)self context];
  v6 = [v5 previewTitle];
  v10[0] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  QLNotifySelector(a2, v7);
}

- (void)_encounterMethodCall:(SEL)a3
{
}

- (void)_encounterMethodCall:(SEL)a3 animatedValue:(unint64_t)a4
{
  NSStringFromSelector(a3);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v5 = [(NSMutableDictionary *)self->_selectorToCount objectForKeyedSubscript:v11];
  v6 = v5;
  if (!v5) {
    objc_super v5 = &unk_26C9130D8;
  }
  unint64_t v7 = [v5 integerValue] + 1;
  BOOL v8 = v7 > 1;

  id v9 = [NSNumber numberWithUnsignedInteger:v7];
  [(NSMutableDictionary *)self->_selectorToCount setObject:v9 forKeyedSubscript:v11];

  v10 = [NSString stringWithFormat:@"%@ #(%ld)", v11, v7];
  [(QLDebugItemViewController *)self _addLog:v10 logLevel:2 * v8];
}

- (void)_addLog:(id)a3 logLevel:(unint64_t)a4
{
  logTextView = self->_logTextView;
  id v7 = a3;
  BOOL v8 = [(UITextView *)logTextView attributedText];
  id v13 = (id)[v8 mutableCopy];

  id v9 = [NSString stringWithFormat:@"%@\n", v7];

  id v10 = objc_alloc(MEMORY[0x263F086A0]);
  id v11 = [(QLDebugItemViewController *)self _attributesForLogLevel:a4];
  uint64_t v12 = (void *)[v10 initWithString:v9 attributes:v11];

  [v13 appendAttributedString:v12];
  [(UITextView *)self->_logTextView setAttributedText:v13];
  -[UITextView scrollRangeToVisible:](self->_logTextView, "scrollRangeToVisible:", [v13 length] - 1, 1);
}

- (id)_attributesForLogLevel:(unint64_t)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  v11[0] = *MEMORY[0x263F81500];
  switch(a3)
  {
    case 2uLL:
      objc_super v4 = [MEMORY[0x263F825C8] redColor];
      int v5 = 0;
      int v6 = 0;
      int v7 = 0;
      break;
    case 3uLL:
      objc_super v4 = [MEMORY[0x263F825C8] greenColor];
      int v5 = 0;
      int v7 = 0;
      int v6 = 1;
      break;
    case 1uLL:
      objc_super v4 = [MEMORY[0x263F825C8] yellowColor];
      int v6 = 0;
      int v7 = 0;
      int v5 = 1;
      break;
    default:
      objc_super v4 = [MEMORY[0x263F825C8] labelColor];
      int v5 = 0;
      int v6 = 0;
      int v7 = 1;
      break;
  }
  v12[0] = v4;
  v11[1] = *MEMORY[0x263F814F0];
  BOOL v8 = [MEMORY[0x263F81708] systemFontOfSize:14.0];
  v12[1] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];

  if (v7)
  {

    if (!v6)
    {
LABEL_10:
      if (!v5) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if (!v6)
  {
    goto LABEL_10;
  }

  if (v5) {
LABEL_11:
  }

LABEL_12:
  if (a3 == 2) {

  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_selectorToCount, 0);

  objc_storeStrong((id *)&self->_logTextView, 0);
}

@end