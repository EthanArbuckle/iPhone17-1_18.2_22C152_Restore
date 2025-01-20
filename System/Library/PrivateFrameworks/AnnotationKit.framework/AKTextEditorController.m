@interface AKTextEditorController
+ (id)textContentTypeFromCRFormContentType:(unint64_t)a3;
- (AKController)controller;
- (AKPageController)pageController;
- (AKTextAnnotationProtocol)annotation;
- (AKTextEditorController)initWithController:(id)a3;
- (BOOL)_doHandleBackTab;
- (BOOL)_doHandleTab;
- (BOOL)isEditing;
- (BOOL)isInAdjustAnnotationFrameToFitText;
- (BOOL)isInEndEditing;
- (CALayer)textViewMaskLayer;
- (CGRect)_editorFrameForTextBoundsInModel:(CGRect)a3;
- (NSTextStorage)textStorage;
- (NSUndoManager)textViewUndoManager;
- (UITextView)textView;
- (UIView)textViewContainer;
- (double)handleCompensatingScaleFactor;
- (double)modelToEditorScaleFactor;
- (double)renderingTextStorageScaleFactor;
- (id)_newScaledPaths:(id)a3 withScaleFactor:(double)a4 aboutCenter:(CGPoint)a5;
- (void)_adjustAnnotationFrameToFitText;
- (void)_adjustEditorToFitAnnotation:(id)a3 withText:(id)a4;
- (void)_beginEditingAnnotation:(id)a3 withPageController:(id)a4 selectAllText:(BOOL)a5 withPencil:(BOOL)a6;
- (void)_commitToModelWithoutEndingEditing;
- (void)_endEditing;
- (void)_firstResponderDidChange:(id)a3;
- (void)_performBlockOnMainThread:(id)a3;
- (void)_registerForFirstResponderNotifications;
- (void)_unregisterForFirstResponderNotifications;
- (void)_updateTextView:(id)a3 withFrame:(CGRect)a4 andOrientation:(int64_t)a5 additionalRotation:(double)a6;
- (void)beginEditingAnnotation:(id)a3 withPageController:(id)a4 selectAllText:(BOOL)a5;
- (void)beginEditingAnnotation:(id)a3 withPageController:(id)a4 selectAllText:(BOOL)a5 withPencil:(BOOL)a6;
- (void)commitToModelWithoutEndingEditing;
- (void)dealloc;
- (void)endEditing;
- (void)handleBackTabCommand;
- (void)handleTabCommand;
- (void)setAnnotation:(id)a3;
- (void)setController:(id)a3;
- (void)setHandleCompensatingScaleFactor:(double)a3;
- (void)setIsInAdjustAnnotationFrameToFitText:(BOOL)a3;
- (void)setIsInEndEditing:(BOOL)a3;
- (void)setModelToEditorScaleFactor:(double)a3;
- (void)setPageController:(id)a3;
- (void)setRenderingTextStorageScaleFactor:(double)a3;
- (void)setTextStorage:(id)a3;
- (void)setTextView:(id)a3;
- (void)setTextViewContainer:(id)a3;
- (void)setTextViewMaskLayer:(id)a3;
- (void)setTextViewUndoManager:(id)a3;
@end

@implementation AKTextEditorController

- (AKTextEditorController)initWithController:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKTextEditorController;
  v5 = [(AKTextEditorController *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(AKTextEditorController *)v5 setController:v4];
    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v6 selector:sel__keyboardWillHide_ name:*MEMORY[0x263F1D480] object:0];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [(AKTextEditorController *)self textView];
  [v3 setDelegate:0];

  [(AKTextEditorController *)self setTextStorage:0];
  [(AKTextEditorController *)self setTextView:0];
  [(AKTextEditorController *)self setTextViewContainer:0];
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)AKTextEditorController;
  [(AKTextEditorController *)&v5 dealloc];
}

- (void)beginEditingAnnotation:(id)a3 withPageController:(id)a4 selectAllText:(BOOL)a5
{
}

- (void)beginEditingAnnotation:(id)a3 withPageController:(id)a4 selectAllText:(BOOL)a5 withPencil:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_2376D7730;
  v14[3] = &unk_264CDBCA8;
  v14[4] = self;
  id v15 = v10;
  id v16 = v11;
  BOOL v17 = a5;
  BOOL v18 = a6;
  id v12 = v11;
  id v13 = v10;
  [(AKTextEditorController *)self _performBlockOnMainThread:v14];
}

- (void)commitToModelWithoutEndingEditing
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = sub_2376D77B4;
  v2[3] = &unk_264CDAE40;
  v2[4] = self;
  [(AKTextEditorController *)self _performBlockOnMainThread:v2];
}

- (void)endEditing
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = sub_2376D7828;
  v2[3] = &unk_264CDAE40;
  v2[4] = self;
  [(AKTextEditorController *)self _performBlockOnMainThread:v2];
}

- (void)_beginEditingAnnotation:(id)a3 withPageController:(id)a4 selectAllText:(BOOL)a5 withPencil:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  v106[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = [(AKTextEditorController *)self annotation];
  if (v12 == v10)
  {
    char v13 = [v10 isEditingText];

    if (v13) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  [(AKTextEditorController *)self _endEditing];
  v14 = [(AKTextEditorController *)self controller];
  [v14 didBeginEditingAnnotation:self];

  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  [(AKTextEditorController *)self setPageController:v11];
  [(AKTextEditorController *)self setAnnotation:v10];
  v105 = AKEditingTextAnnotationKey;
  v106[0] = v10;
  id v15 = [NSDictionary dictionaryWithObjects:v106 forKeys:&v105 count:1];
  id v16 = [MEMORY[0x263F08A00] defaultCenter];
  BOOL v17 = AKWillBeginEditingTextAnnotationNotification;
  BOOL v18 = [v11 controller];
  [v16 postNotificationName:v17 object:v18 userInfo:v15];

  [v10 setIsEditingText:1];
  [v10 setShouldUseAppearanceOverride:0];
  v19 = [v11 pageModelController];
  v20 = [v19 mutableSetValueForKey:@"selectedAnnotations"];

  v21 = [MEMORY[0x263EFFA08] setWithObject:v10];
  v95 = v20;
  [v20 setSet:v21];

  v22 = [v10 annotationText];
  BOOL v92 = v6;
  if (v6)
  {
    v23 = 0;
  }
  else
  {
    v23 = +[AKTextAnnotationAttributeHelper placeholderTextOfAnnotation:v10];
  }
  if ([v22 length])
  {
    v24 = [v22 string];
    v25 = [v23 string];
    int v86 = [v24 isEqualToString:v25];
  }
  else
  {
    id v26 = v23;

    int v86 = [v26 length] != 0;
    v22 = v26;
  }
  v94 = v23;
  if (![v22 length])
  {
    if ([v10 isMemberOfClass:objc_opt_class()])
    {
      v27 = [v10 typingAttributes];
      v28 = (void *)[v27 mutableCopy];

      v29 = [v10 strokeColor];
      [v28 setObject:v29 forKey:*MEMORY[0x263F1C240]];

      [v10 setTypingAttributes:v28];
    }
    v30 = [v10 typingAttributes];
    id v31 = +[AKTextAnnotationAttributeHelper newTextStorageOriginalFontSavvyWithString:&stru_26EA57918 attributes:v30];

    v22 = v31;
  }
  id v32 = objc_alloc_init(MEMORY[0x263F08C50]);
  [(AKTextEditorController *)self setTextViewUndoManager:v32];

  long long v101 = 0u;
  long long v102 = 0u;
  float64x2_t v100 = 0uLL;
  id v99 = 0;
  LOBYTE(v80) = 1;
  +[AKTextAnnotationRenderHelper getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:](AKTextAnnotationRenderHelper, "getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:", 0, &v101, &v100, &v99, 0, v10, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24), v11, 0, v80, v22);
  id v33 = v99;
  -[AKTextEditorController _editorFrameForTextBoundsInModel:](self, "_editorFrameForTextBoundsInModel:", v101, v102);
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  double v98 = 0.0;
  +[AKGeometryHelper effectiveDrawingBoundsForAnnotation:v10 forDisplay:1 pageControllerOrNil:v11 outScaleFactor:&v98];
  v42 = [v11 overlayView];
  v43 = [v42 akEnclosingScrollView];
  [v43 akMagnification];
  double v45 = v44;

  double v96 = v45 * v98;
  -[AKTextEditorController setModelToEditorScaleFactor:](self, "setModelToEditorScaleFactor:");
  [(AKTextEditorController *)self setHandleCompensatingScaleFactor:v45];
  [v10 originalModelBaseScaleFactor];
  [(AKTextEditorController *)self setRenderingTextStorageScaleFactor:v96 * v46];
  id v47 = -[AKTextEditorController _newScaledPaths:withScaleFactor:aboutCenter:](self, "_newScaledPaths:withScaleFactor:aboutCenter:", v33, v96, v100.f64[0] * 0.5, v100.f64[1] * 0.5);

  float64x2_t v100 = vmulq_n_f64(v100, v96);
  [(AKTextEditorController *)self renderingTextStorageScaleFactor];
  id v48 = +[AKTextAnnotationAttributeHelper newTextStorage:byApplyingScaleFactor:](AKTextAnnotationAttributeHelper, "newTextStorage:byApplyingScaleFactor:", v22);
  v49 = objc_alloc_init(AKTextLayoutManager);
  v97 = v48;
  [v48 addLayoutManager:v49];
  id v50 = objc_alloc(MEMORY[0x263F1C378]);
  v51 = (void *)[v50 initWithContainerSize:*(_OWORD *)&v100];
  v91 = v47;
  [v51 setExclusionPaths:v47];
  v90 = v49;
  [(AKTextLayoutManager *)v49 addTextContainer:v51];
  v89 = v51;
  v52 = -[AKTextView initWithFrame:textContainer:]([AKTextView alloc], "initWithFrame:textContainer:", v51, v35, v37, v39, v41);
  v53 = [v10 typingAttributes];
  [(AKTextEditorController *)self renderingTextStorageScaleFactor];
  v88 = +[AKTextAnnotationAttributeHelper typingAttributes:byApplyingScaleFactor:](AKTextAnnotationAttributeHelper, "typingAttributes:byApplyingScaleFactor:", v53);
  -[AKTextView setTypingAttributes:](v52, "setTypingAttributes:");
  if (objc_opt_respondsToSelector()) {
    -[AKTextView setMaximumNumberOfCharacters:](v52, "setMaximumNumberOfCharacters:", [v10 maximumNumberOfCharacters]);
  }
  uint64_t v54 = [v53 objectForKeyedSubscript:@"AKTextAnnotationTypingAttributesTextContentTypeKey"];
  v85 = (void *)v54;
  if (v54)
  {
    [(AKTextView *)v52 setTextContentType:v54];
    goto LABEL_23;
  }
  v55 = [v10 textContentType];

  if (v55)
  {
    v56 = [v10 textContentType];
LABEL_21:
    [(AKTextView *)v52 setTextContentType:v56];
    goto LABEL_22;
  }
  v56 = objc_msgSend((id)objc_opt_class(), "textContentTypeFromCRFormContentType:", objc_msgSend(v10, "formContentType"));
  if (v56) {
    goto LABEL_21;
  }
LABEL_22:

LABEL_23:
  [(AKTextView *)v52 setDelegate:self];
  [(AKTextView *)v52 setEditable:1];
  [(AKTextView *)v52 setSelectable:1];
  v57 = [MEMORY[0x263F1C550] clearColor];
  [(AKTextView *)v52 setBackgroundColor:v57];

  v58 = [(AKTextView *)v52 textContainer];
  [v58 setLineFragmentPadding:0.0];

  v59 = [(AKTextView *)v52 textContainer];
  [v59 setWidthTracksTextView:0];

  v60 = [(AKTextView *)v52 textContainer];
  [v60 setHeightTracksTextView:0];

  -[AKTextView setTextContainerInset:](v52, "setTextContainerInset:", *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
  [(AKTextView *)v52 setScrollEnabled:0];
  if (v92 && (objc_opt_respondsToSelector() & 1) != 0) {
    [(AKTextView *)v52 set_textInputSource:3];
  }
  int v93 = v86 | v7;
  [(AKTextEditorController *)self setTextView:v52];
  [(AKTextEditorController *)self setTextStorage:v97];
  v61 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v35, v37, v39, v41);
  [(AKTextEditorController *)self setTextViewContainer:v61];

  v62 = [v11 overlayView];
  v63 = [(AKTextEditorController *)self textViewContainer];
  [v62 addSubview:v63];

  v64 = [(AKTextEditorController *)self textViewContainer];
  [v64 addSubview:v52];

  [(AKTextView *)v52 setClipsToBounds:0];
  v65 = [(AKTextView *)v52 superview];
  [v65 setClipsToBounds:0];

  v66 = [(AKTextEditorController *)self controller];
  v67 = [v66 delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [v67 shouldAddTabControlsToTextEditorForAnnotation:v10 forAnnotationController:v66])
  {
    [(AKTextView *)v52 setKeyCommandDelegate:self];
    v83 = v53;
    v84 = v15;
    id v68 = objc_alloc(MEMORY[0x263F1C468]);
    [MEMORY[0x263F1C6B0] systemImageNamed:@"chevron.up"];
    v69 = id v87 = v11;
    v82 = (void *)[v68 initWithImage:v69 style:0 target:self action:sel_handleBackTabCommand];

    id v70 = objc_alloc(MEMORY[0x263F1C468]);
    v71 = [MEMORY[0x263F1C6B0] systemImageNamed:@"chevron.down"];
    v81 = (void *)[v70 initWithImage:v71 style:0 target:self action:sel_handleTabCommand];

    v72 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:5 target:0 action:0];
    id v73 = objc_alloc(MEMORY[0x263F1C470]);
    v104[0] = v82;
    v104[1] = v81;
    v104[2] = v72;
    v74 = [MEMORY[0x263EFF8C0] arrayWithObjects:v104 count:3];
    v75 = (void *)[v73 initWithBarButtonItems:v74 representativeItem:0];

    v103 = v75;
    v76 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v103 count:1];
    v77 = [(AKTextView *)v52 inputAssistantItem];
    [v77 setLeadingBarButtonGroups:v76];

    v53 = v83;
    id v11 = v87;

    id v15 = v84;
  }
  [(AKTextEditorController *)self _adjustEditorToFitAnnotation:v10 withText:v22];
  [(AKTextEditorController *)self _adjustAnnotationFrameToFitText];
  [MEMORY[0x263F158F8] commit];
  self->_wantsTextViewBecomeFirstResponder = 1;
  [(AKTextView *)v52 becomeFirstResponder];
  [(AKTextEditorController *)self _registerForFirstResponderNotifications];
  if (v93)
  {
    [(AKTextView *)v52 selectAll:self];
  }
  else
  {
    [(AKTextEditorController *)self textStorage];
    v79 = v78 = v53;
    -[AKTextView setSelectedRange:](v52, "setSelectedRange:", [v79 length], 0);

    v53 = v78;
  }

LABEL_33:
}

- (void)_commitToModelWithoutEndingEditing
{
  if ([(AKTextEditorController *)self isEditing])
  {
    v3 = [(AKTextEditorController *)self annotation];
    if (v3)
    {
      id v17 = v3;
      [(AKTextEditorController *)self renderingTextStorageScaleFactor];
      double v5 = 1.0 / v4;
      BOOL v6 = [(AKTextEditorController *)self textStorage];
      id v7 = +[AKTextAnnotationAttributeHelper newTextStorage:v6 byApplyingScaleFactor:v5];

      if ([v7 length]) {
        id v8 = v7;
      }
      else {
        id v8 = 0;
      }
      [v17 setAnnotationText:v8];
      objc_super v9 = [(AKTextEditorController *)self textView];
      id v10 = [v9 typingAttributes];

      if (v10)
      {
        id v11 = [(AKTextEditorController *)self textView];
        id v12 = [v11 typingAttributes];
        char v13 = [v12 objectForKey:*MEMORY[0x263F1C238]];

        if (v13)
        {
          v14 = [(AKTextEditorController *)self textView];
          id v15 = [v14 typingAttributes];
          id v16 = +[AKTextAnnotationAttributeHelper typingAttributes:v15 byApplyingScaleFactor:v5];

          [v17 setTypingAttributes:v16];
        }
      }

      v3 = v17;
    }
  }
}

- (void)_endEditing
{
  v23[1] = *MEMORY[0x263EF8340];
  self->_wantsTextViewBecomeFirstResponder = 0;
  v3 = [(AKTextEditorController *)self controller];
  [v3 didEndEditingAnnotation:self];

  [(AKTextEditorController *)self _unregisterForFirstResponderNotifications];
  if ([(AKTextEditorController *)self isEditing]
    && ![(AKTextEditorController *)self isInEndEditing])
  {
    [(AKTextEditorController *)self setIsInEndEditing:1];
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    double v4 = [(AKTextEditorController *)self annotation];
    [(AKTextEditorController *)self _commitToModelWithoutEndingEditing];
    [MEMORY[0x263F158F8] commit];
    double v5 = [(AKTextEditorController *)self textView];
    BOOL v6 = [v5 superview];
    id v7 = [v6 superview];

    if (v7)
    {
      id v8 = [(AKTextEditorController *)self textView];
      [v8 resignFirstResponder];

      objc_super v9 = [(AKTextEditorController *)self textView];
      id v10 = [v9 superview];
      [v10 removeFromSuperview];

      id v11 = [(AKTextEditorController *)self textView];
      [v11 removeFromSuperview];
    }
    [(AKTextEditorController *)self setTextView:0];
    [(AKTextEditorController *)self setTextViewUndoManager:0];
    [(AKTextEditorController *)self setTextStorage:0];
    [v4 setIsEditingText:0];
    v22 = AKEditingTextAnnotationKey;
    v23[0] = v4;
    id v12 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
    char v13 = [MEMORY[0x263F08A00] defaultCenter];
    v14 = AKDidEndEditingTextAnnotationNotification;
    id v15 = [(AKTextEditorController *)self pageController];
    id v16 = [v15 controller];
    [v13 postNotificationName:v14 object:v16 userInfo:v12];

    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    id v17 = [v4 annotationText];
    uint64_t v18 = [v17 length];

    if (!v18)
    {
      v19 = [(AKTextEditorController *)self pageController];
      objc_opt_class();
      if ((objc_opt_respondsToSelector() & 1) != 0
        && [(id)objc_opt_class() deleteAfterEditingIfEmpty])
      {
        v20 = [v19 pageModelController];
        v21 = [v20 mutableArrayValueForKey:@"annotations"];
        [v21 removeObject:v4];
      }
      else
      {
        v20 = +[AKTextAnnotationAttributeHelper placeholderTextOfAnnotation:v4];
        +[AKTextAnnotationAttributeHelper adjustBoundsOfAnnotation:v4 toFitOptionalText:v20 onPageController:v19];
      }
    }
    [(AKTextEditorController *)self setAnnotation:0];
    [(AKTextEditorController *)self setPageController:0];
    [MEMORY[0x263F158F8] commit];
    [(AKTextEditorController *)self setIsInEndEditing:0];
  }
}

+ (id)textContentTypeFromCRFormContentType:(unint64_t)a3
{
  id v3 = 0;
  switch(a3)
  {
    case 1uLL:
      break;
    case 2uLL:
      double v4 = (id *)MEMORY[0x263F1D6C8];
      goto LABEL_41;
    case 3uLL:
      double v4 = (id *)MEMORY[0x263F1D6D0];
      goto LABEL_41;
    case 4uLL:
      double v4 = (id *)MEMORY[0x263F1D6A8];
      goto LABEL_41;
    case 5uLL:
    case 0x1AuLL:
      double v4 = (id *)MEMORY[0x263F1D6C0];
      goto LABEL_41;
    case 6uLL:
      double v4 = (id *)MEMORY[0x263F1D698];
      goto LABEL_41;
    case 7uLL:
      double v4 = (id *)MEMORY[0x263F1D6D8];
      goto LABEL_41;
    case 8uLL:
      double v4 = (id *)MEMORY[0x263F1D6E8];
      goto LABEL_41;
    case 9uLL:
      double v4 = (id *)MEMORY[0x263F1D6B0];
      goto LABEL_41;
    case 0xAuLL:
      double v4 = (id *)MEMORY[0x263F1D6F8];
      goto LABEL_41;
    case 0xBuLL:
      double v4 = (id *)MEMORY[0x263F1D6B8];
      goto LABEL_41;
    case 0xCuLL:
      double v4 = (id *)MEMORY[0x263F1D6A0];
      goto LABEL_41;
    case 0xDuLL:
      double v4 = (id *)MEMORY[0x263F1D710];
      goto LABEL_41;
    case 0xEuLL:
      double v4 = (id *)MEMORY[0x263F1D718];
      goto LABEL_41;
    case 0xFuLL:
      double v4 = (id *)MEMORY[0x263F1D620];
      goto LABEL_41;
    case 0x10uLL:
      double v4 = (id *)MEMORY[0x263F1D630];
      goto LABEL_41;
    case 0x11uLL:
      double v4 = (id *)MEMORY[0x263F1D628];
      goto LABEL_41;
    case 0x12uLL:
      double v4 = (id *)MEMORY[0x263F1D720];
      goto LABEL_41;
    case 0x13uLL:
      double v4 = (id *)MEMORY[0x263F1D638];
      goto LABEL_41;
    case 0x14uLL:
      double v4 = (id *)MEMORY[0x263F1D708];
      goto LABEL_41;
    case 0x15uLL:
      double v4 = (id *)MEMORY[0x263F1D690];
      goto LABEL_41;
    case 0x16uLL:
      double v4 = (id *)MEMORY[0x263F1D758];
      goto LABEL_41;
    case 0x17uLL:
      double v4 = (id *)MEMORY[0x263F1D700];
      goto LABEL_41;
    case 0x18uLL:
      double v4 = (id *)MEMORY[0x263F1D668];
      goto LABEL_41;
    case 0x19uLL:
      double v4 = (id *)MEMORY[0x263F1D660];
      goto LABEL_41;
    case 0x1BuLL:
      double v4 = (id *)MEMORY[0x263F1D658];
      goto LABEL_41;
    case 0x1CuLL:
      double v4 = (id *)MEMORY[0x263F1D670];
      goto LABEL_41;
    case 0x1DuLL:
      double v4 = (id *)MEMORY[0x263F1D640];
      goto LABEL_41;
    case 0x1EuLL:
      double v4 = (id *)MEMORY[0x263F1D648];
      goto LABEL_41;
    case 0x1FuLL:
      double v4 = (id *)MEMORY[0x263F1D650];
      goto LABEL_41;
    case 0x20uLL:
      double v4 = (id *)MEMORY[0x263F1D678];
      goto LABEL_41;
    case 0x21uLL:
      double v4 = (id *)MEMORY[0x263F1D680];
      goto LABEL_41;
    case 0x2AuLL:
      double v4 = (id *)MEMORY[0x263F1D750];
      goto LABEL_41;
    case 0x2BuLL:
      double v4 = (id *)MEMORY[0x263F1D730];
      goto LABEL_41;
    case 0x2CuLL:
      double v4 = (id *)MEMORY[0x263F1D748];
      goto LABEL_41;
    case 0x2DuLL:
      double v4 = (id *)MEMORY[0x263F1D728];
      goto LABEL_41;
    case 0x2EuLL:
      double v4 = (id *)MEMORY[0x263F1D740];
      goto LABEL_41;
    case 0x31uLL:
      double v4 = (id *)MEMORY[0x263F1D738];
      goto LABEL_41;
    case 0x34uLL:
      double v4 = (id *)MEMORY[0x263F1D688];
LABEL_41:
      id v3 = *v4;
      break;
    default:
      NSLog(&cfstr_Crformcontentt.isa, a2, a3);
      id v3 = 0;
      break;
  }

  return v3;
}

- (BOOL)isEditing
{
  id v3 = [(AKTextEditorController *)self textView];
  if (v3)
  {
    double v4 = [(AKTextEditorController *)self textView];
    double v5 = [v4 superview];
    BOOL v6 = [v5 superview];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)handleTabCommand
{
}

- (void)handleBackTabCommand
{
}

- (void)_performBlockOnMainThread:(id)a3
{
  id v3 = (void *)MEMORY[0x263F08B88];
  block = (void (**)(void))a3;
  if ([v3 isMainThread]) {
    block[2]();
  }
  else {
    dispatch_sync(MEMORY[0x263EF83A0], block);
  }
}

- (id)_newScaledPaths:(id)a3 withScaleFactor:(double)a4 aboutCenter:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  objc_super v9 = v8;
  if (fabs(a4 + -1.0) >= 0.0005)
  {
    objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    long long v20 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v30.a = *MEMORY[0x263F000D0];
    long long v19 = *(_OWORD *)&v30.a;
    *(_OWORD *)&v30.c = v20;
    *(_OWORD *)&v30.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    long long v18 = *(_OWORD *)&v30.tx;
    CGAffineTransformMakeTranslation(&t2, -x, -y);
    *(_OWORD *)&t1.a = v19;
    *(_OWORD *)&t1.c = v20;
    *(_OWORD *)&t1.tdouble x = v18;
    CGAffineTransformConcat(&v30, &t1, &t2);
    CGAffineTransformMakeScale(&v27, a4, a4);
    CGAffineTransform v26 = v30;
    CGAffineTransformConcat(&t1, &v26, &v27);
    CGAffineTransform v30 = t1;
    CGAffineTransformMakeTranslation(&v25, x * a4, y * a4);
    CGAffineTransform v26 = v30;
    CGAffineTransformConcat(&t1, &v26, &v25);
    CGAffineTransform v30 = t1;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v31 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "copy", v18, v19, v20, (void)v21);
          CGAffineTransform t1 = v30;
          [v16 applyTransform:&t1];
          [v10 addObject:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v31 count:16];
      }
      while (v13);
    }
  }
  else
  {
    id v10 = v8;
  }

  return v10;
}

- (void)_adjustAnnotationFrameToFitText
{
  if (![(AKTextEditorController *)self isInAdjustAnnotationFrameToFitText])
  {
    [(AKTextEditorController *)self setIsInAdjustAnnotationFrameToFitText:1];
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    id v3 = [(AKTextEditorController *)self pageController];
    double v4 = [(AKTextEditorController *)self annotation];
    if (v4)
    {
      double v5 = [(AKTextEditorController *)self textStorage];
      uint64_t v6 = [v5 length];

      if (v6)
      {
        BOOL v7 = [(AKTextEditorController *)self textStorage];
        [(AKTextEditorController *)self renderingTextStorageScaleFactor];
        id v9 = +[AKTextAnnotationAttributeHelper newTextStorage:v7 byApplyingScaleFactor:1.0 / v8];
      }
      else
      {
        BOOL v7 = [v4 typingAttributes];
        id v9 = +[AKTextAnnotationAttributeHelper newTextStorageOriginalFontSavvyWithString:&stru_26EA57918 attributes:v7];
        [(AKTextEditorController *)self renderingTextStorageScaleFactor];
        id v10 = +[AKTextAnnotationAttributeHelper typingAttributes:byApplyingScaleFactor:](AKTextAnnotationAttributeHelper, "typingAttributes:byApplyingScaleFactor:", v7);
        id v11 = [(AKTextEditorController *)self textView];
        [v11 setTypingAttributes:v10];
      }
      uint64_t v12 = [(AKTextEditorController *)self textStorage];
      unint64_t v13 = [v12 length];

      if (v13 >= 2)
      {
        uint64_t v24 = 0;
        uint64_t v14 = [(AKTextEditorController *)self textStorage];
        id v15 = [v14 attributesAtIndex:0 effectiveRange:&v23];

        uint64_t v16 = *MEMORY[0x263F1C2C8];
        id v17 = [v15 objectForKeyedSubscript:*MEMORY[0x263F1C2C8]];

        if (v17)
        {
          unint64_t v18 = v13 - (v13 == [v4 maximumNumberOfCharacters]);
          if (v18 != v24)
          {
            long long v19 = [(AKTextEditorController *)self textStorage];
            objc_msgSend(v19, "removeAttribute:range:", v16, 0, v13);

            long long v20 = [(AKTextEditorController *)self textStorage];
            long long v21 = [v15 objectForKeyedSubscript:v16];
            objc_msgSend(v20, "addAttribute:value:range:", v16, v21, 0, v18);

            objc_msgSend(v9, "removeAttribute:range:", v16, 0, v13);
            long long v22 = [v15 objectForKeyedSubscript:v16];
            objc_msgSend(v9, "addAttribute:value:range:", v16, v22, 0, v18);
          }
        }
      }
      +[AKTextAnnotationAttributeHelper adjustBoundsOfAnnotation:v4 toFitOptionalText:v9 onPageController:v3];
      if (![v4 conformsToAKRectangularAnnotationProtocol]
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        [(AKTextEditorController *)self commitToModelWithoutEndingEditing];
      }
      [(AKTextEditorController *)self _adjustEditorToFitAnnotation:v4 withText:v9];
      [MEMORY[0x263F158F8] commit];
      [(AKTextEditorController *)self setIsInAdjustAnnotationFrameToFitText:0];
    }
  }
}

- (void)_adjustEditorToFitAnnotation:(id)a3 withText:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void *)MEMORY[0x263F158F8];
  id v8 = a4;
  [v7 begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  id v9 = [(AKTextEditorController *)self pageController];
  long long v32 = 0u;
  long long v33 = 0u;
  float64x2_t v31 = 0uLL;
  id v30 = 0;
  LOBYTE(v28) = 1;
  +[AKTextAnnotationRenderHelper getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:](AKTextAnnotationRenderHelper, "getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:", 0, &v32, &v31, &v30, 0, v6, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24), v9, 0, v28, v8);

  id v10 = v30;
  -[AKTextEditorController _editorFrameForTextBoundsInModel:](self, "_editorFrameForTextBoundsInModel:", v32, v33);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  [(AKTextEditorController *)self modelToEditorScaleFactor];
  double v29 = v19;
  id v20 = -[AKTextEditorController _newScaledPaths:withScaleFactor:aboutCenter:](self, "_newScaledPaths:withScaleFactor:aboutCenter:", v10);

  float64x2_t v31 = vmulq_n_f64(v31, v29);
  long long v21 = [(AKTextEditorController *)self textView];
  long long v22 = [v21 textContainer];
  [v22 akSetContainerSize:*(_OWORD *)&v31];

  uint64_t v23 = [(AKTextEditorController *)self textView];
  uint64_t v24 = [v23 textContainer];
  [v24 setExclusionPaths:v20];

  double v25 = 0.0;
  if ([v6 conformsToAKRotatableAnnotationProtocol])
  {
    [v6 rotationAngle];
    double v25 = v26;
  }
  CGAffineTransform v27 = [(AKTextEditorController *)self textView];
  -[AKTextEditorController _updateTextView:withFrame:andOrientation:additionalRotation:](self, "_updateTextView:withFrame:andOrientation:additionalRotation:", v27, [v6 originalExifOrientation], v12, v14, v16, v18, v25);

  [MEMORY[0x263F158F8] commit];
}

- (CGRect)_editorFrameForTextBoundsInModel:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:"))
  {
    CGFloat v8 = *MEMORY[0x263F001A8];
    CGFloat v9 = *(double *)(MEMORY[0x263F001A8] + 8);
    CGFloat v10 = *(double *)(MEMORY[0x263F001A8] + 16);
    CGFloat v11 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  else
  {
    double v12 = [(AKTextEditorController *)self pageController];
    objc_msgSend(v12, "convertRectFromModelToOverlay:", x, y, width, height);
    CGRect v18 = CGRectIntegral(v17);
    CGRect v19 = CGRectInset(v18, -1.0, -1.0);
    CGFloat v8 = v19.origin.x;
    CGFloat v9 = v19.origin.y;
    CGFloat v10 = v19.size.width;
    CGFloat v11 = v19.size.height;
  }
  double v13 = v8;
  double v14 = v9;
  double v15 = v10;
  double v16 = v11;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (void)_updateTextView:(id)a3 withFrame:(CGRect)a4 andOrientation:(int64_t)a5 additionalRotation:(double)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v13 = a3;
  int64_t v14 = +[AKGeometryHelper inverseExifOrientation:a5];
  long long v86 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v98.a = *MEMORY[0x263F000D0];
  long long v84 = *(_OWORD *)&v98.a;
  *(_OWORD *)&v98.c = v86;
  *(_OWORD *)&v98.tCGFloat x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  long long v83 = *(_OWORD *)&v98.tx;
  CGAffineTransformMakeScale(&t2, 1.0, -1.0);
  *(_OWORD *)&t1.a = v84;
  *(_OWORD *)&t1.c = v86;
  *(_OWORD *)&t1.tCGFloat x = v83;
  CGAffineTransformConcat(&v98, &t1, &t2);
  +[AKGeometryHelper affineTransformForExifOrientation:aboutCenter:](AKGeometryHelper, "affineTransformForExifOrientation:aboutCenter:", v14, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  CGAffineTransform v94 = v98;
  CGAffineTransformConcat(&t1, &v94, &v95);
  CGAffineTransform v98 = t1;
  CGAffineTransformMakeRotation(&v93, a6);
  CGAffineTransform v94 = v98;
  CGAffineTransformConcat(&t1, &v94, &v93);
  CGAffineTransform v98 = t1;
  [(AKTextEditorController *)self handleCompensatingScaleFactor];
  double v16 = v15;
  CGAffineTransformMakeScale(&v92, 1.0 / v15, 1.0 / v15);
  CGAffineTransform v94 = v98;
  CGAffineTransformConcat(&t1, &v94, &v92);
  CGAffineTransform v98 = t1;
  v99.origin.CGFloat x = x;
  v99.origin.CGFloat y = y;
  v99.size.double width = width;
  v99.size.double height = height;
  double MidX = CGRectGetMidX(v99);
  v100.origin.CGFloat x = x;
  v100.origin.CGFloat y = y;
  v100.size.double width = width;
  v100.size.double height = height;
  +[AKGeometryHelper rectWithSize:centeredAtPoint:](AKGeometryHelper, "rectWithSize:centeredAtPoint:", width * v16, height * v16, MidX, CGRectGetMidY(v100));
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v26 = [v13 superview];
  v91[0] = v84;
  v91[1] = v86;
  v91[2] = v83;
  [v26 setTransform:v91];

  v90[0] = v84;
  v90[1] = v86;
  v90[2] = v83;
  [v13 setTransform:v90];
  CGAffineTransform v27 = [v13 superview];
  objc_msgSend(v27, "setFrame:", v19, v21, v23, v25);

  uint64_t v28 = [v13 superview];
  [v28 bounds];
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;

  if (+[AKGeometryHelper exifOrientationHasReversedAxes:v14])
  {
    v101.origin.CGFloat x = v30;
    v101.origin.CGFloat y = v32;
    v101.size.double width = v34;
    v101.size.double height = v36;
    double v87 = v19;
    CGFloat v37 = CGRectGetHeight(v101);
    v102.origin.CGFloat x = v30;
    v102.origin.CGFloat y = v32;
    v102.size.double width = v34;
    v102.size.double height = v36;
    double v85 = v21;
    CGFloat v38 = CGRectGetWidth(v102);
    v103.origin.CGFloat x = v30;
    v103.origin.CGFloat y = v32;
    v103.size.double width = v34;
    v103.size.double height = v36;
    *(double *)&long long v83 = v25;
    double v39 = v23;
    double v40 = CGRectGetMidX(v103);
    v104.origin.CGFloat x = v30;
    v104.origin.CGFloat y = v32;
    v104.size.double width = v34;
    v104.size.double height = v36;
    double MidY = CGRectGetMidY(v104);
    v105.origin.CGFloat x = v30;
    v105.origin.CGFloat y = v32;
    v105.size.double width = v37;
    v105.size.double height = v38;
    double v42 = v40 - CGRectGetWidth(v105) * 0.5;
    v106.origin.CGFloat x = v30;
    v106.origin.CGFloat y = v32;
    v106.size.double width = v37;
    v106.size.double height = v38;
    double v32 = MidY - CGRectGetHeight(v106) * 0.5;
    double v36 = v38;
    double v21 = v85;
    double v34 = v37;
    double v19 = v87;
    double v30 = v42;
    double v23 = v39;
    double v25 = *(double *)&v83;
  }
  objc_msgSend(v13, "frame", (void)v83);
  v111.origin.CGFloat x = v30;
  v111.origin.CGFloat y = v32;
  v111.size.double width = v34;
  v111.size.double height = v36;
  if (CGRectEqualToRect(v107, v111))
  {
    v108.origin.CGFloat x = v30;
    v108.origin.CGFloat y = v32;
    v108.size.double width = v34;
    v108.size.double height = v36;
    CGRect v109 = CGRectInset(v108, -1.0, -1.0);
    objc_msgSend(v13, "setFrame:", v109.origin.x, v109.origin.y, v109.size.width, v109.size.height);
  }
  objc_msgSend(v13, "setFrame:", v30, v32, v34, v36);
  CGAffineTransform v89 = v98;
  v43 = [v13 superview];
  CGAffineTransform v88 = v89;
  [v43 setTransform:&v88];

  double v44 = [(AKTextEditorController *)self pageController];
  [v44 visibleRectOfOverlay];
  objc_msgSend(v44, "convertRectFromModelToOverlay:");
  double v46 = v45;
  double v48 = v47;
  double v50 = v49;
  double v52 = v51;
  v110.origin.CGFloat x = v19;
  v110.origin.CGFloat y = v21;
  v110.size.double width = v23;
  v110.size.double height = v25;
  v112.origin.CGFloat x = v46;
  v112.origin.CGFloat y = v48;
  v112.size.double width = v50;
  v112.size.double height = v52;
  BOOL v53 = CGRectIntersectsRect(v110, v112);
  uint64_t v54 = [(AKTextEditorController *)self textViewMaskLayer];
  v55 = v54;
  if (v53)
  {

    if (v55)
    {
      v56 = [(AKTextEditorController *)self textViewMaskLayer];
      v57 = [v56 sublayers];
      v55 = [v57 firstObject];
    }
    else
    {
      v58 = [MEMORY[0x263F157E8] layer];
      [(AKTextEditorController *)self setTextViewMaskLayer:v58];

      id v59 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.4];
      uint64_t v60 = [v59 CGColor];
      v61 = [(AKTextEditorController *)self textViewMaskLayer];
      [v61 setBackgroundColor:v60];

      v55 = [MEMORY[0x263F157E8] layer];
      id v62 = [MEMORY[0x263F1C550] blackColor];
      objc_msgSend(v55, "setBackgroundColor:", objc_msgSend(v62, "CGColor"));

      v56 = [(AKTextEditorController *)self textViewMaskLayer];
      [v56 addSublayer:v55];
    }

    [v13 bounds];
    double v64 = v63;
    double v66 = v65;
    double v68 = v67;
    double v70 = v69;
    v71 = [(AKTextEditorController *)self textViewMaskLayer];
    objc_msgSend(v71, "setFrame:", v64, v66, v68, v70);

    v72 = [v44 overlayView];
    objc_msgSend(v13, "convertRect:fromView:", v72, v46, v48, v50, v52);
    double v74 = v73;
    double v76 = v75;
    double v78 = v77;
    double v80 = v79;

    objc_msgSend(v55, "setFrame:", v74, v76, v78, v80);
    v81 = [(AKTextEditorController *)self textViewMaskLayer];
    v82 = [v13 layer];
    [v82 setMask:v81];
  }
  else
  {
    [v54 removeFromSuperlayer];
  }
}

- (BOOL)_doHandleTab
{
  id v3 = [(AKTextEditorController *)self controller];
  double v4 = [v3 delegate];
  if (objc_opt_respondsToSelector())
  {
    double v5 = [(AKTextEditorController *)self annotation];
    char v6 = [v4 handleTabInTextEditorForAnnotation:v5 forAnnotationController:v3];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)_doHandleBackTab
{
  id v3 = [(AKTextEditorController *)self controller];
  double v4 = [v3 delegate];
  if (objc_opt_respondsToSelector())
  {
    double v5 = [(AKTextEditorController *)self annotation];
    char v6 = [v4 handleBackTabInTextEditorForAnnotation:v5 forAnnotationController:v3];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)_registerForFirstResponderNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__firstResponderDidChange_ name:*MEMORY[0x263F1D8D0] object:0];
}

- (void)_unregisterForFirstResponderNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1D8D0] object:0];
}

- (void)_firstResponderDidChange:(id)a3
{
  if (!self->_wantsTextViewBecomeFirstResponder)
  {
    double v4 = [(AKTextEditorController *)self textView];
    char v5 = [v4 isFirstResponder];

    if ((v5 & 1) == 0)
    {
      self->_wantsTextViewBecomeFirstResponder = 0;
      [(AKTextEditorController *)self endEditing];
    }
  }
}

- (UITextView)textView
{
  return (UITextView *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTextView:(id)a3
{
}

- (AKTextAnnotationProtocol)annotation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_annotation);

  return (AKTextAnnotationProtocol *)WeakRetained;
}

- (void)setAnnotation:(id)a3
{
}

- (AKController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (AKController *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (AKPageController)pageController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageController);

  return (AKPageController *)WeakRetained;
}

- (void)setPageController:(id)a3
{
}

- (CALayer)textViewMaskLayer
{
  return (CALayer *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTextViewMaskLayer:(id)a3
{
}

- (UIView)textViewContainer
{
  return (UIView *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTextViewContainer:(id)a3
{
}

- (NSTextStorage)textStorage
{
  return (NSTextStorage *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTextStorage:(id)a3
{
}

- (double)renderingTextStorageScaleFactor
{
  return self->_renderingTextStorageScaleFactor;
}

- (void)setRenderingTextStorageScaleFactor:(double)a3
{
  self->_renderingTextStorageScaleFactor = a3;
}

- (double)modelToEditorScaleFactor
{
  return self->_modelToEditorScaleFactor;
}

- (void)setModelToEditorScaleFactor:(double)a3
{
  self->_modelToEditorScaleFactor = a3;
}

- (double)handleCompensatingScaleFactor
{
  return self->_handleCompensatingScaleFactor;
}

- (void)setHandleCompensatingScaleFactor:(double)a3
{
  self->_handleCompensatingScaleFactor = a3;
}

- (NSUndoManager)textViewUndoManager
{
  return (NSUndoManager *)objc_getProperty(self, a2, 96, 1);
}

- (void)setTextViewUndoManager:(id)a3
{
}

- (BOOL)isInEndEditing
{
  return self->_isInEndEditing;
}

- (void)setIsInEndEditing:(BOOL)a3
{
  self->_isInEndEditing = a3;
}

- (BOOL)isInAdjustAnnotationFrameToFitText
{
  return self->_isInAdjustAnnotationFrameToFitText;
}

- (void)setIsInAdjustAnnotationFrameToFitText:(BOOL)a3
{
  self->_isInAdjustAnnotationFrameToFitText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textViewUndoManager, 0);
  objc_storeStrong((id *)&self->_textStorage, 0);
  objc_storeStrong((id *)&self->_textViewContainer, 0);
  objc_storeStrong((id *)&self->_textViewMaskLayer, 0);
  objc_destroyWeak((id *)&self->_pageController);
  objc_destroyWeak((id *)&self->_controller);
  objc_destroyWeak((id *)&self->_annotation);

  objc_storeStrong((id *)&self->_textView, 0);
}

@end