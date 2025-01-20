@interface PDFKitTextView
- (BOOL)becomeFirstResponder;
- (BOOL)handleBackTab;
- (BOOL)handleTab;
- (BOOL)textView:(id)a3 doCommandBySelector:(SEL)a4;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (PDFKitTextView)initWithAnnotation:(id)a3 pdfPageView:(id)a4 pdfView:(id)a5;
- (id)annotation;
- (id)layer;
- (id)textView;
- (void)_adjustScrollViewForKeyboardNotification:(id)a3;
- (void)_applyScale:(double)a3 toView:(id)a4;
- (void)_commitTextFromTextView:(id)a3;
- (void)_setAlignment:(int64_t)a3;
- (void)_setAttributedString:(id)a3;
- (void)_setFont:(id)a3;
- (void)_setFontColor:(id)a3;
- (void)_setString:(id)a3;
- (void)_setup;
- (void)_setupTopLevelView;
- (void)_textWidgetDone;
- (void)_updateScaleFactor;
- (void)adjustScrollViewToAccomodateKeyboardStartingFrame:(double)a3 endingFrame:(double)a4 annotationFrame:(double)a5 withAnimationDuration:(CGFloat)a6 curve:(CGFloat)a7;
- (void)autoFillDidInsertWithExplicitInvocationMode:(BOOL)a3;
- (void)insertTextSuggestion:(id)a3 completionHandler:(id)a4;
- (void)removeFromSuperview;
- (void)setFrame:(CGRect)a3;
- (void)textViewDidChange:(id)a3;
@end

@implementation PDFKitTextView

- (PDFKitTextView)initWithAnnotation:(id)a3 pdfPageView:(id)a4 pdfView:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v32.receiver = self;
  v32.super_class = (Class)PDFKitTextView;
  v11 = [(PDFKitTextView *)&v32 init];
  if (v11)
  {
    v12 = objc_alloc_init(PDFKitTextViewPrivate);
    v13 = v11->_private;
    v11->_private = v12;

    objc_storeWeak((id *)&v11->_private->annotation, v8);
    objc_storeWeak((id *)&v11->_private->pdfPageView, v9);
    objc_storeWeak((id *)&v11->_private->pdfView, v10);
    [v8 bounds];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    v22 = objc_msgSend(objc_alloc(MEMORY[0x263F82388]), "initWithSize:", v18, v20);
    [v22 setLineFragmentPadding:0.0];
    id v23 = objc_alloc_init(MEMORY[0x263F82360]);
    [v23 addTextContainer:v22];
    id v24 = objc_alloc_init(MEMORY[0x263F82390]);
    [v24 addLayoutManager:v23];
    v25 = -[PDFTextWidgetTextView initWithFrame:textContainer:]([PDFTextWidgetTextView alloc], "initWithFrame:textContainer:", v22, v15, v17, v19, v21);
    v26 = v11->_private;
    textView = v26->textView;
    v26->textView = v25;

    [(PDFTextWidgetTextView *)v11->_private->textView setDelegate:v11];
    v28 = [MEMORY[0x263F08A00] defaultCenter];
    [v28 addObserver:v11 selector:sel__keyboardWillShow_ name:*MEMORY[0x263F83808] object:0];

    v29 = [MEMORY[0x263F08A00] defaultCenter];
    [v29 addObserver:v11 selector:sel__keyboardWillHide_ name:*MEMORY[0x263F83800] object:0];

    v30 = [MEMORY[0x263F08A00] defaultCenter];
    [v30 addObserver:v11 selector:sel__didChangeZoomFactor_ name:@"PDFTextSelectionMenuWillChangeZoomFactor" object:0];

    [(PDFKitTextView *)v11 _setup];
  }

  return v11;
}

- (id)textView
{
  return self->_private->textView;
}

- (id)layer
{
  return (id)[(PDFTextWidgetTextView *)self->_private->textView layer];
}

- (id)annotation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->annotation);

  return WeakRetained;
}

- (void)setFrame:(CGRect)a3
{
}

- (void)removeFromSuperview
{
}

- (BOOL)becomeFirstResponder
{
  int v3 = [(PDFTextWidgetTextView *)self->_private->textView becomeFirstResponder];
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
    id v5 = objc_loadWeakRetained((id *)&self->_private->annotation);
    v6 = v5;
    if (WeakRetained) {
      BOOL v7 = v5 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (!v7) {
      [WeakRetained interactWithAnnotation:v5];
    }
  }
  return v3;
}

- (void)insertTextSuggestion:(id)a3 completionHandler:(id)a4
{
  p_pdfPageView = &self->_private->pdfPageView;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_pdfPageView);
  [WeakRetained populateFormFieldsWithAutoFillSuggestion:v7 completionHandler:v6];
}

- (void)autoFillDidInsertWithExplicitInvocationMode:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 3;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->annotation);
  [WeakRetained setAutofillEntryType:v3];
}

- (void)_commitTextFromTextView:(id)a3
{
  id v40 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->annotation);
  id v5 = [WeakRetained valueForAnnotationKey:@"/FT"];
  id v6 = v5;
  if (WeakRetained && [v5 isEqualToString:@"/Tx"])
  {
    id v7 = [v40 text];
    if ([v7 length])
    {
      id v8 = [v40 endOfDocument];
      id v9 = [v40 positionFromPosition:v8 offset:-1];

      id v10 = [v40 endOfDocument];
      v11 = [v40 textRangeFromPosition:v9 toPosition:v10];

      [v40 firstRectForRange:v11];
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v20 = [v40 textInputView];
      objc_msgSend(v40, "convertRect:fromView:", v20, v13, v15, v17, v19);
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      CGFloat v28 = v27;

      [v40 bounds];
      v43.origin.x = v29;
      v43.origin.y = v30;
      v43.size.width = v31;
      v43.size.height = v32;
      v42.origin.x = v22;
      v42.origin.y = v24;
      v42.size.width = v26;
      v42.size.height = v28;
      if (!CGRectIntersectsRect(v42, v43))
      {
        uint64_t v33 = [WeakRetained widgetStringValue];

        id v7 = (void *)v33;
      }
    }
    uint64_t v34 = [v40 selectedRange];
    uint64_t v36 = v35;
    id v37 = objc_loadWeakRetained((id *)&self->_private->pdfPageView);
    [v37 setStringValue:v7 onTextWidgetAnnotation:WeakRetained withTextView:v40];

    if (v34 != [v40 selectedRange]) {
      objc_msgSend(v40, "setSelectedRange:", v34 - 1, v36);
    }
    v38 = [v40 text];
    BOOL v39 = [v38 length] != 0;

    [WeakRetained setAutofillEntryType:v39];
  }
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  p_annotation = &self->_private->annotation;
  id v7 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_annotation);
  char v9 = [WeakRetained isMultiline];

  id v10 = [MEMORY[0x263F08708] newlineCharacterSet];
  uint64_t v11 = [v7 rangeOfCharacterFromSet:v10];

  if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v9;
  }

  if (!v12) {
    [(PDFKitTextView *)self _textWidgetDone];
  }
  return v12;
}

- (void)textViewDidChange:(id)a3
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  id v5 = [v8 markedTextRange];
  id v6 = v5;
  if (v5)
  {
    int v7 = [v5 isEmpty] ^ 1;
    if (!WeakRetained) {
      goto LABEL_7;
    }
  }
  else
  {
    int v7 = 0;
    if (!WeakRetained) {
      goto LABEL_7;
    }
  }
  if ((([WeakRetained formFillingUpdatesAnnotationOnEveryTextChange] ^ 1 | v7) & 1) == 0) {
    [(PDFKitTextView *)self _commitTextFromTextView:v8];
  }
LABEL_7:
}

- (void)_textWidgetDone
{
  uint64_t v3 = self->_private;
  if (v3->textView)
  {
    -[PDFKitTextView _commitTextFromTextView:](self, "_commitTextFromTextView:");
    uint64_t v3 = self->_private;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&v3->pdfPageView);
  [WeakRetained endEditing:1];

  id v6 = objc_loadWeakRetained((id *)&self->_private->pdfView);
  id v5 = objc_loadWeakRetained((id *)&self->_private->annotation);
  [v6 removeControlForAnnotation:v5];
}

- (void)_adjustScrollViewForKeyboardNotification:(id)a3
{
  id v65 = a3;
  uint64_t v4 = [(PDFTextWidgetTextView *)self->_private->textView isFirstResponder];
  id v5 = v65;
  if (v4)
  {
    id v6 = [v65 userInfo];
    int v7 = [v6 valueForKey:*MEMORY[0x263F837B0]];
    [v7 CGRectValue];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    double v16 = [v65 userInfo];
    double v17 = [v16 valueForKey:*MEMORY[0x263F837B8]];
    [v17 CGRectValue];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v64 = v24;

    double v25 = [v65 userInfo];
    CGFloat v26 = [v25 valueForKey:*MEMORY[0x263F83780]];
    [v26 floatValue];
    float v28 = v27;

    CGFloat v29 = [v65 userInfo];
    CGFloat v30 = [v29 valueForKey:*MEMORY[0x263F83778]];
    uint64_t v31 = [v30 unsignedIntegerValue];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
    id v33 = objc_loadWeakRetained((id *)&self->_private->annotation);
    uint64_t v34 = v33;
    if (v33)
    {
      double v63 = v15;
      double v35 = v28;
      [v33 bounds];
      double v37 = v36;
      double v61 = v21;
      double v62 = v19;
      double v38 = v9;
      double v40 = v39;
      double v41 = v11;
      double v43 = v42;
      double v60 = v23;
      double v44 = v13;
      double v46 = v45;
      v47 = [v34 page];
      objc_msgSend(WeakRetained, "convertRect:fromPage:", v47, v37, v40, v43, v46);
      double v49 = v48;
      double v51 = v50;
      double v53 = v52;
      double v55 = v54;

      objc_msgSend(WeakRetained, "convertRect:toView:", 0, v49, v51, v53, v55);
      -[PDFKitTextView adjustScrollViewToAccomodateKeyboardStartingFrame:endingFrame:annotationFrame:withAnimationDuration:curve:](self, "adjustScrollViewToAccomodateKeyboardStartingFrame:endingFrame:annotationFrame:withAnimationDuration:curve:", v31, v38, v41, v44, v63, v62, v61, v60, v64, v56, v57, v58, v59, *(void *)&v35);
    }

    id v5 = v65;
  }

  MEMORY[0x270F9A758](v4, v5);
}

- (void)adjustScrollViewToAccomodateKeyboardStartingFrame:(double)a3 endingFrame:(double)a4 annotationFrame:(double)a5 withAnimationDuration:(CGFloat)a6 curve:(CGFloat)a7
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 8) + 24));
  CGFloat v26 = [WeakRetained documentScrollView];
  float v27 = [v26 superview];
  [v26 frame];
  objc_msgSend(v27, "convertRect:toView:", 0);
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  CGFloat v35 = v34;

  v90.origin.double x = v29;
  v90.origin.double y = v31;
  v90.size.CGFloat width = v33;
  v90.size.double height = v35;
  double v70 = -(a7 - CGRectGetMaxY(v90));
  double v68 = *MEMORY[0x263F001A0];
  double v67 = *(double *)(MEMORY[0x263F001A0] + 8);
  CGFloat rect = *(double *)(MEMORY[0x263F001A0] + 16);
  double v69 = *(double *)(MEMORY[0x263F001A0] + 24);
  [v26 bounds];
  objc_msgSend(v26, "convertRect:toView:", 0);
  double x = v91.origin.x;
  double y = v91.origin.y;
  CGFloat width = v91.size.width;
  double height = v91.size.height;
  v96.origin.double x = a6;
  v96.origin.double y = a7;
  v96.size.CGFloat width = a8;
  v96.size.double height = a9;
  if (CGRectIntersectsRect(v91, v96))
  {
    v92.origin.double x = x;
    v92.origin.double y = y;
    v92.size.CGFloat width = width;
    v92.size.double height = height;
    v97.origin.double x = a6;
    v97.origin.double y = a7;
    v97.size.CGFloat width = a8;
    v97.size.double height = a9;
    CGRect v93 = CGRectIntersection(v92, v97);
    CGFloat rect1 = height - (CGRectGetHeight(v93) + 0.0);
    objc_msgSend(v26, "convertRect:fromView:", 0, a12, a13, a14, a15);
    double rect2a = v40;
    double v42 = v41;
    double v44 = v43;
    double v46 = v45;
    v94.origin.double y = y + 0.0;
    v94.origin.double x = x + 0.0;
    v94.size.CGFloat width = width;
    v94.size.double height = rect1;
    v98.origin.double x = a12;
    v98.origin.double y = a13;
    v98.size.CGFloat width = a14;
    v98.size.double height = a15;
    BOOL v47 = CGRectContainsRect(v94, v98);
    CGFloat v49 = v68;
    CGFloat v48 = v69;
    if (!v47) {
      CGFloat v48 = v46;
    }
    double v50 = rect;
    if (!v47) {
      double v50 = v44;
    }
    CGFloat rect = v50;
    CGFloat v51 = v67;
    if (!v47) {
      CGFloat v51 = v42;
    }
    double v52 = v70;
    if (!v47) {
      CGFloat v49 = rect2a;
    }
  }
  else
  {
    CGFloat v48 = v69;
    double v52 = v70;
    CGFloat v51 = v67;
    CGFloat v49 = v68;
  }
  [v26 contentInset];
  double v54 = v53;
  [v26 _contentScrollInset];
  double v56 = v55;
  double v58 = v57;
  double v60 = v59;
  if (v54 >= v52) {
    double v61 = 0.0;
  }
  else {
    double v61 = v52 - v54;
  }
  v95.origin.double x = v49;
  v95.origin.double y = v51;
  v95.size.CGFloat width = rect;
  v95.size.double height = v48;
  if (CGRectIsNull(v95))
  {
    if (v61 <= 0.0)
    {
      objc_msgSend(v26, "_setContentScrollInset:", v56, v58, v61, v60);
      goto LABEL_23;
    }
    dispatch_time_t v62 = dispatch_time(0, (uint64_t)(a16 * 1000000000.0));
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __124__PDFKitTextView_adjustScrollViewToAccomodateKeyboardStartingFrame_endingFrame_annotationFrame_withAnimationDuration_curve___block_invoke_2;
    block[3] = &unk_264204750;
    id v75 = v26;
    double v76 = v56;
    double v77 = v58;
    double v78 = v61;
    double v79 = v60;
    dispatch_after(v62, MEMORY[0x263EF83A0], block);
    double v63 = v75;
  }
  else
  {
    if ((unint64_t)(a11 - 1) >= 3) {
      uint64_t v64 = 4;
    }
    else {
      uint64_t v64 = ((a11 - 1) << 16) + 65540;
    }
    id v65 = (void *)MEMORY[0x263F82E00];
    v80[0] = MEMORY[0x263EF8330];
    v80[1] = 3221225472;
    v80[2] = __124__PDFKitTextView_adjustScrollViewToAccomodateKeyboardStartingFrame_endingFrame_annotationFrame_withAnimationDuration_curve___block_invoke;
    v80[3] = &unk_264204728;
    id v81 = v26;
    double v82 = v56;
    double v83 = v58;
    double v84 = v61;
    double v85 = v60;
    CGFloat v86 = v49;
    CGFloat v87 = v51;
    CGFloat v88 = rect;
    CGFloat v89 = v48;
    [v65 animateWithDuration:v64 delay:v80 options:0 animations:a16 completion:0.0];
    double v63 = v81;
  }

LABEL_23:
}

uint64_t __124__PDFKitTextView_adjustScrollViewToAccomodateKeyboardStartingFrame_endingFrame_annotationFrame_withAnimationDuration_curve___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setContentScrollInset:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v2 = *(void **)(a1 + 32);
  double v3 = *(double *)(a1 + 72);
  double v4 = *(double *)(a1 + 80);
  double v5 = *(double *)(a1 + 88);
  double v6 = *(double *)(a1 + 96);

  return objc_msgSend(v2, "scrollRectToVisible:animated:", 0, v3, v4, v5, v6);
}

uint64_t __124__PDFKitTextView_adjustScrollViewToAccomodateKeyboardStartingFrame_endingFrame_annotationFrame_withAnimationDuration_curve___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setContentScrollInset:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (BOOL)textView:(id)a3 doCommandBySelector:(SEL)a4
{
  return 0;
}

- (BOOL)handleTab
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->annotation);
  id v4 = objc_loadWeakRetained((id *)&self->_private->pdfView);
  double v5 = v4;
  if (v4) {
    BOOL v6 = WeakRetained == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    char v7 = 0;
  }
  else {
    char v7 = [v4 PDFKitHandleTabInTextWidget:WeakRetained];
  }

  return v7;
}

- (BOOL)handleBackTab
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->annotation);
  id v4 = objc_loadWeakRetained((id *)&self->_private->pdfView);
  double v5 = v4;
  if (v4) {
    BOOL v6 = WeakRetained == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    char v7 = 0;
  }
  else {
    char v7 = [v4 PDFKitHandleBackTabInTextWidget:WeakRetained];
  }

  return v7;
}

- (void)_setString:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    id v4 = (id)[v4 length];
    id v5 = v6;
    if (v4)
    {
      id v4 = (id)[(PDFTextWidgetTextView *)self->_private->textView setText:v6];
      id v5 = v6;
    }
  }

  MEMORY[0x270F9A758](v4, v5);
}

- (void)_setFont:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->annotation);
  id v4 = [WeakRetained scaledFontForTextWidget];
  id v5 = v4;
  if (v4)
  {
    [v4 pointSize];
    if (v6 > 0.0) {
      [(PDFTextWidgetTextView *)self->_private->textView setFont:v5];
    }
  }
}

- (void)_setFontColor:(id)a3
{
}

- (void)_setAlignment:(int64_t)a3
{
}

- (void)_setup
{
  v76[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfPageView);
  id v4 = objc_loadWeakRetained((id *)&self->_private->annotation);
  if (!v4) {
    goto LABEL_31;
  }
  v66 = self->_private->textView;
  uint64_t v5 = [v4 widgetStringValue];
  uint64_t v6 = [v4 font];
  uint64_t v7 = [v4 fontColor];
  uint64_t v8 = [v4 alignment];
  uint64_t v9 = [v4 backgroundColor];
  double v69 = [v4 border];
  double v10 = [v4 valueForAnnotationKey:@"/MK"];
  id v68 = [v10 borderColor];

  int v11 = [v4 shouldComb];
  char v12 = [v4 isAppearanceStreamEmpty];
  [(PDFKitTextView *)self _setString:v5];
  double v70 = (void *)v6;
  [(PDFKitTextView *)self _setFont:v6];
  uint64_t v64 = (void *)v7;
  [(PDFKitTextView *)self _setFontColor:v7];
  [(PDFKitTextView *)self _setAlignment:v8];
  double v13 = self->_private;
  textView = v13->textView;
  if (v12)
  {
    if (v9)
    {
      [(PDFTextWidgetTextView *)v13->textView setBackgroundColor:v9];
    }
    else
    {
      double v17 = [MEMORY[0x263F825C8] clearColor];
      [(PDFTextWidgetTextView *)textView setBackgroundColor:v17];
    }
    if (!v69 || ([v69 lineWidth], v18 <= 0.0))
    {
      double v16 = -200.0;
      if (v11) {
        goto LABEL_16;
      }
      goto LABEL_18;
    }
    double v19 = [(PDFTextWidgetTextView *)self->_private->textView layer];
    if (v68)
    {
      objc_msgSend(v19, "setBorderColor:", objc_msgSend(v68, "CGColor"));
    }
    else
    {
      id v20 = [MEMORY[0x263F825C8] blackColor];
      objc_msgSend(v19, "setBorderColor:", objc_msgSend(v20, "CGColor"));
    }
    double v15 = [(PDFTextWidgetTextView *)self->_private->textView layer];
    [v69 lineWidth];
    objc_msgSend(v15, "setBorderWidth:");
    double v16 = -200.0;
  }
  else
  {
    double v15 = [MEMORY[0x263F825C8] clearColor];
    [(PDFTextWidgetTextView *)textView setBackgroundColor:v15];
    double v16 = 0.0;
  }

  if (v11)
  {
LABEL_16:
    [(PDFTextWidgetTextView *)self->_private->textView setAllowsEditingTextAttributes:1];
    double v21 = [(PDFTextWidgetTextView *)self->_private->textView textContainer];
    [v21 setLineBreakMode:2];

    if (v5) {
      [(PDFKitTextView *)self _setAttributedString:v5];
    }
  }
LABEL_18:
  +[PDFAnnotationDrawing textInset];
  double v23 = v22;
  double v67 = WeakRetained;
  id v65 = (void *)v5;
  uint64_t v62 = v9;
  if ([v4 isMultiline])
  {
    double v24 = self->_private->textView;
    double v25 = v23;
    double v26 = v23;
    double v27 = v23;
  }
  else
  {
    double v28 = @"Wj";
    if (v5) {
      double v28 = (__CFString *)v5;
    }
    CGFloat v29 = v28;
    objc_msgSend(v4, "bounds", v9);
    double v31 = v30;
    double v33 = v32;
    uint64_t v75 = *MEMORY[0x263F82270];
    v76[0] = v70;
    double v34 = [NSDictionary dictionaryWithObjects:v76 forKeys:&v75 count:1];
    -[__CFString boundingRectWithSize:options:attributes:context:](v29, "boundingRectWithSize:options:attributes:context:", 1, v34, 0, v31, v33);
    double v36 = v35;

    double v25 = fmax((v33 - v36) * 0.5, 0.0);
    double v24 = self->_private->textView;
    double v26 = v23;
    double v27 = v25;
  }
  -[PDFTextWidgetTextView setTextContainerInset:](v24, "setTextContainerInset:", v25, v26, v27, v23, v62);
  double v37 = self->_private->textView;
  double v38 = [v4 autoFillTextContentType];
  [(PDFTextWidgetTextView *)v37 setTextContentType:v38];

  id v39 = objc_alloc(MEMORY[0x263F824A8]);
  double v40 = [MEMORY[0x263F827E8] systemImageNamed:@"chevron.up"];
  double v41 = (void *)[v39 initWithImage:v40 style:0 target:self action:sel_handleBackTab];

  id v42 = objc_alloc(MEMORY[0x263F824A8]);
  double v43 = [MEMORY[0x263F827E8] systemImageNamed:@"chevron.down"];
  double v44 = (void *)[v42 initWithImage:v43 style:0 target:self action:sel_handleTab];

  double v45 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:5 target:0 action:0];
  id v46 = objc_alloc(MEMORY[0x263F824B8]);
  v74[0] = v41;
  v74[1] = v44;
  v74[2] = v45;
  BOOL v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:v74 count:3];
  CGFloat v48 = (void *)[v46 initWithBarButtonItems:v47 representativeItem:0];

  v73 = v48;
  CGFloat v49 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v73 count:1];
  double v50 = [(PDFTextWidgetTextView *)self->_private->textView inputAssistantItem];
  [v50 setLeadingBarButtonGroups:v49];

  if ([v4 isMultiline])
  {
    id v51 = objc_alloc(MEMORY[0x263F824A8]);
    double v52 = PDFKitLocalizedString(@"Done");
    double v53 = (void *)[v51 initWithTitle:v52 style:2 target:self action:sel__textWidgetDone];

    id v54 = objc_alloc(MEMORY[0x263F824B8]);
    v72 = v53;
    double v55 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v72 count:1];
    double v56 = (void *)[v54 initWithBarButtonItems:v55 representativeItem:0];

    v71 = v56;
    double v57 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v71 count:1];
    double v58 = [(PDFTextWidgetTextView *)self->_private->textView inputAssistantItem];
    [v58 setTrailingBarButtonGroups:v57];
  }
  else
  {
    if (!v70)
    {
      double v59 = (void *)MEMORY[0x263F82760];
      [MEMORY[0x263F82760] systemFontSize];
      double v70 = objc_msgSend(v59, "systemFontOfSize:");
    }
    [(PDFTextWidgetTextView *)self->_private->textView setScrollEnabled:0];
    [(PDFTextWidgetTextView *)self->_private->textView setReturnKeyType:9];
  }

  double v60 = [(PDFTextWidgetTextView *)self->_private->textView layer];
  [v60 setZPosition:v16];

  double v61 = [(PDFTextWidgetTextView *)self->_private->textView layer];
  [v61 setDrawsAsynchronously:1];

  [v4 setControl:self];
  id WeakRetained = v67;
  if (v67)
  {
    [(PDFKitTextView *)self _setupTopLevelView];
    [v67 addSubview:self->_private->topLevelView];
    [(PDFKitTextView *)self _updateScaleFactor];
    [(PDFKitTextView *)self becomeFirstResponder];
  }

LABEL_31:
}

- (void)_setupTopLevelView
{
  id v3 = objc_alloc(MEMORY[0x263F82B88]);
  [(PDFTextWidgetTextView *)self->_private->textView frame];
  id v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  [(UIView *)v4 setScrollEnabled:0];
  [(UIView *)v4 setShowsVerticalScrollIndicator:0];
  [(UIView *)v4 setShowsHorizontalScrollIndicator:0];
  [(UIView *)v4 addSubview:self->_private->textView];
  textView = self->_private->textView;
  [(PDFTextWidgetTextView *)textView frame];
  double v7 = v6;
  [(PDFTextWidgetTextView *)self->_private->textView frame];
  -[PDFTextWidgetTextView setFrame:](textView, "setFrame:", 0.0, 0.0, v7);
  [(PDFTextWidgetTextView *)self->_private->textView setAutoresizingMask:18];
  uint64_t v8 = self->_private;
  topLevelView = v8->topLevelView;
  v8->topLevelView = v4;
}

- (void)_setAttributedString:(id)a3
{
  v27[1] = *MEMORY[0x263EF8340];
  p_annotation = &self->_private->annotation;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_annotation);
  double v7 = [WeakRetained font];
  uint64_t v8 = [WeakRetained valueForAnnotationKey:@"/MaxLen"];
  uint64_t v9 = [v8 integerValue];

  if (!v7)
  {
    double v10 = (void *)MEMORY[0x263F82760];
    [(PDFTextWidgetTextView *)self->_private->textView frame];
    double v7 = [v10 systemFontOfSize:v11 + -2.0];
  }
  double v12 = (double)v9;
  uint64_t v26 = *MEMORY[0x263F82270];
  uint64_t v13 = v26;
  v27[0] = v7;
  double v14 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
  [v5 sizeWithAttributes:v14];
  double v16 = v15;

  double v17 = (double)(unint64_t)[v5 length];
  [WeakRetained bounds];
  double v19 = (v18 + -v16 / v17 * v12) / v12;
  uint64_t v20 = [v5 length];
  double v21 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v5];

  uint64_t v22 = *MEMORY[0x263F82288];
  double v23 = [NSNumber numberWithDouble:v19];
  objc_msgSend(v21, "addAttribute:value:range:", v22, v23, 0, v20);

  objc_msgSend(v21, "addAttribute:value:range:", *MEMORY[0x263F82290], &unk_26C52E418, 0, v20);
  objc_msgSend(v21, "addAttribute:value:range:", v13, v7, 0, v20);
  double v24 = [MEMORY[0x263F82370] defaultParagraphStyle];
  double v25 = (void *)[v24 mutableCopy];

  [v25 setLineBreakMode:2];
  objc_msgSend(v21, "addAttribute:value:range:", *MEMORY[0x263F822A8], v25, 0, v20);
  [(PDFTextWidgetTextView *)self->_private->textView setAttributedText:v21];
}

- (void)_updateScaleFactor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  [WeakRetained scaleFactor];
  double v5 = v4 * PDFScreenGetBackingScaleFactor();

  topLevelView = self->_private->topLevelView;

  [(PDFKitTextView *)self _applyScale:topLevelView toView:v5];
}

- (void)_applyScale:(double)a3 toView:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  [v6 setContentScaleFactor:a3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v7 = objc_msgSend(v6, "subviews", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [(PDFKitTextView *)self _applyScale:*(void *)(*((void *)&v12 + 1) + 8 * v11++) toView:a3];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void).cxx_destruct
{
}

@end