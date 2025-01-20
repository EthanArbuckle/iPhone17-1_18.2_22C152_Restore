@interface CKEffectPickerViewController
- (BOOL)isInlineReply;
- (CGPoint)balloonViewOrigin;
- (CGRect)sendButtonFrame;
- (CKEffectPickerView)pickerView;
- (CKEffectPickerViewController)initWithComposition:(id)a3 sendButtonFrame:(CGRect)a4 balloonViewOrigin:(CGPoint)a5 color:(char)a6;
- (CKEffectPickerViewControllerDelegate)delegate;
- (NSAttributedString)text;
- (UIView)effectPreviewOverlayView;
- (unint64_t)supportedInterfaceOrientations;
- (void)dismissViewControllerKeepingSideMount:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)effectPickerViewDidFinishAnimatingIn:(id)a3;
- (void)effectSelectedWithIdentifier:(id)a3;
- (void)handleTouchMoved:(CGPoint)a3;
- (void)handleTouchUp:(CGPoint)a3;
- (void)presentPicker;
- (void)setBalloonViewOrigin:(CGPoint)a3;
- (void)setCloseButtonYPosition:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setEffectPreviewOverlayView:(id)a3;
- (void)setIsInlineReply:(BOOL)a3;
- (void)setPickerView:(id)a3;
- (void)setSemanticContentAttribute:(id)a3 forceLTR:(BOOL)a4;
- (void)setSendButtonFrame:(CGRect)a3;
- (void)setText:(id)a3;
- (void)touchUpInsideCloseButton;
- (void)updateColor:(char)a3;
- (void)updateHintTransition:(double)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CKEffectPickerViewController

- (CKEffectPickerViewController)initWithComposition:(id)a3 sendButtonFrame:(CGRect)a4 balloonViewOrigin:(CGPoint)a5 color:(char)a6
{
  uint64_t v6 = a6;
  double y = a5.y;
  double x = a5.x;
  double height = a4.size.height;
  double width = a4.size.width;
  double v11 = a4.origin.y;
  double v12 = a4.origin.x;
  id v14 = a3;
  v61.receiver = self;
  v61.super_class = (Class)CKEffectPickerViewController;
  v15 = [(CKEffectPickerViewController *)&v61 init];
  v16 = v15;
  if (v15)
  {
    -[CKEffectPickerViewController setSendButtonFrame:](v15, "setSendButtonFrame:", v12, v11, width, height);
    -[CKEffectPickerViewController setBalloonViewOrigin:](v16, "setBalloonViewOrigin:", x, y);
    v17 = [(CKEffectPickerViewController *)v16 view];
    v18 = [v17 layer];
    [v18 setAllowsGroupBlending:0];

    v19 = +[CKUIBehavior sharedBehaviors];
    int v20 = [v19 isAccessibilityPreferredContentSizeCategory];

    v21 = off_1E561D810;
    if (!v20) {
      v21 = off_1E561D818;
    }
    id v22 = objc_alloc(*v21);
    v23 = [(CKEffectPickerViewController *)v16 view];
    [v23 bounds];
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    [(CKEffectPickerViewController *)v16 sendButtonFrame];
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    [(CKEffectPickerViewController *)v16 balloonViewOrigin];
    v42 = objc_msgSend(v22, "initWithFrame:sendButtonFrame:balloonViewOrigin:composition:color:", v14, v6, v25, v27, v29, v31, v33, v35, v37, v39, v40, v41);

    [v42 setAutoresizingMask:18];
    v43 = [(CKEffectPickerViewController *)v16 view];
    [v43 bounds];
    objc_msgSend(v42, "setFrame:");

    [v42 setAccessibilityIdentifier:@"EffectPickerView"];
    [v42 setDelegate:v16];
    [(CKEffectPickerViewController *)v16 setPickerView:v42];
    [v17 addSubview:v42];
    if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
      [(CKEffectPickerViewController *)v16 setSemanticContentAttribute:v17 forceLTR:1];
    }
    v44 = CKFrameworkBundle();
    v45 = [v44 localizedStringForKey:@"IMPACT_PICKER_INVISIBLE_INK_NAME" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v46 = CKFrameworkBundle();
    v47 = [v46 localizedStringForKey:@"IMPACT_PICKER_INVISIBLE_INK_DESCRIPTION" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [v42 addEffect:v45 withDescriptiveText:v47 withIdentifier:@"com.apple.MobileSMS.expressivesend.invisibleink"];

    v48 = CKFrameworkBundle();
    v49 = [v48 localizedStringForKey:@"IMPACT_PICKER_GENTLE_NAME" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v50 = CKFrameworkBundle();
    v51 = [v50 localizedStringForKey:@"IMPACT_PICKER_GENTLE_DESCRIPTION" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [v42 addEffect:v49 withDescriptiveText:v51 withIdentifier:@"com.apple.MobileSMS.expressivesend.gentle"];

    v52 = CKFrameworkBundle();
    v53 = [v52 localizedStringForKey:@"IMPACT_PICKER_LOUD_NAME" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v54 = CKFrameworkBundle();
    v55 = [v54 localizedStringForKey:@"IMPACT_PICKER_LOUD_DESCRIPTION" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [v42 addEffect:v53 withDescriptiveText:v55 withIdentifier:@"com.apple.MobileSMS.expressivesend.loud"];

    v56 = CKFrameworkBundle();
    v57 = [v56 localizedStringForKey:@"IMPACT_PICKER_IMPACT_NAME" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v58 = CKFrameworkBundle();
    v59 = [v58 localizedStringForKey:@"IMPACT_PICKER_IMPACT_DESCRIPTION" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [v42 addEffect:v57 withDescriptiveText:v59 withIdentifier:@"com.apple.MobileSMS.expressivesend.impact"];
  }
  return v16;
}

- (void)setSemanticContentAttribute:(id)a3 forceLTR:(BOOL)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [a3 subviews];
  uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    BOOL v9 = !a4;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(obj);
        }
        double v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
        objc_opt_class();
        char v12 = objc_opt_isKindOfClass() | v9;
        if (v12) {
          uint64_t v13 = 4;
        }
        else {
          uint64_t v13 = 3;
        }
        [v11 setSemanticContentAttribute:v13];
        [(CKEffectPickerViewController *)self setSemanticContentAttribute:v11 forceLTR:(v12 & 1) == 0];
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKEffectPickerViewController;
  [(CKEffectPickerViewController *)&v5 viewWillAppear:a3];
  v4 = [(CKEffectPickerViewController *)self pickerView];
  [v4 _adjustMainLabelAndTypeSegmentedControlIfNecessary];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKEffectPickerViewController;
  [(CKEffectPickerViewController *)&v5 viewWillDisappear:a3];
  v4 = [(CKEffectPickerViewController *)self pickerView];
  [v4 invalidateAllAnimationTimers];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  id v5 = [(CKEffectPickerViewController *)self delegate];
  [v5 effectPickerViewControllerClose:self animated:0];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)presentPicker
{
  id v2 = [(CKEffectPickerViewController *)self pickerView];
  [v2 _animateIn];
}

- (void)updateHintTransition:(double)a3
{
  id v4 = [(CKEffectPickerViewController *)self pickerView];
  [v4 updateHintTransition:a3];
}

- (void)updateColor:(char)a3
{
  uint64_t v3 = a3;
  id v4 = [(CKEffectPickerViewController *)self pickerView];
  [v4 updateColor:v3];
}

- (void)dismissViewControllerKeepingSideMount:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
}

- (void)handleTouchUp:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = [(CKEffectPickerViewController *)self pickerView];
  uint64_t v7 = [(CKEffectPickerViewController *)self pickerView];
  objc_msgSend(v6, "convertPoint:toView:", v7, x, y);
  double v9 = v8;
  double v11 = v10;

  id v12 = [(CKEffectPickerViewController *)self pickerView];
  objc_msgSend(v12, "handleTouchUp:", v9, v11);
}

- (void)handleTouchMoved:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = [(CKEffectPickerViewController *)self pickerView];
  uint64_t v7 = [(CKEffectPickerViewController *)self pickerView];
  objc_msgSend(v6, "convertPoint:toView:", v7, x, y);
  double v9 = v8;
  double v11 = v10;

  id v12 = [(CKEffectPickerViewController *)self pickerView];
  objc_msgSend(v12, "handleTouchMoved:", v9, v11);
}

- (void)setCloseButtonYPosition:(double)a3
{
  id v4 = [(CKEffectPickerViewController *)self pickerView];
  [v4 setCloseButtonYPosition:a3];
}

- (void)effectPickerViewDidFinishAnimatingIn:(id)a3
{
  id v3 = [(CKEffectPickerViewController *)self pickerView];
  [v3 _startSwitcherAnimationIfNecessary];
}

- (void)touchUpInsideCloseButton
{
  id v3 = [(CKEffectPickerViewController *)self delegate];
  [v3 effectPickerViewControllerClose:self animated:0];
}

- (void)effectSelectedWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CKEffectPickerViewController *)self delegate];
  [v5 effectPickerViewController:self effectWithIdentifierSelected:v4];
}

- (CKEffectPickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKEffectPickerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)effectPreviewOverlayView
{
  return self->_effectPreviewOverlayView;
}

- (void)setEffectPreviewOverlayView:(id)a3
{
}

- (BOOL)isInlineReply
{
  return self->_isInlineReply;
}

- (void)setIsInlineReply:(BOOL)a3
{
  self->_isInlineRepldouble y = a3;
}

- (NSAttributedString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (CGRect)sendButtonFrame
{
  double x = self->_sendButtonFrame.origin.x;
  double y = self->_sendButtonFrame.origin.y;
  double width = self->_sendButtonFrame.size.width;
  double height = self->_sendButtonFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSendButtonFrame:(CGRect)a3
{
  self->_sendButtonFrame = a3;
}

- (CGPoint)balloonViewOrigin
{
  double x = self->_balloonViewOrigin.x;
  double y = self->_balloonViewOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setBalloonViewOrigin:(CGPoint)a3
{
  self->_balloonViewOrigin = a3;
}

- (CKEffectPickerView)pickerView
{
  return self->_pickerView;
}

- (void)setPickerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerView, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_effectPreviewOverlayView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end