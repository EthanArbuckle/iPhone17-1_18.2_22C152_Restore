@interface PKTextInputFeedbackController
- (BOOL)_shouldShowCustomFeedback;
- (BOOL)showingCustomFeedback;
- (PKTextInputElementContent)referenceElementContent;
- (PKTextInputFeedbackController)init;
- (PKTextInputFeedbackControllerDelegate)delegate;
- (PKTextInputGestureFeedbackView)_feedbackView;
- (PKTextInputTextPlaceholder)placeholder;
- (_NSRange)referenceTextRange;
- (int64_t)feedbackType;
- (void)_placeholderChanged:(id)a3;
- (void)_setShowingCustomFeedback:(BOOL)a3;
- (void)_updateFeedbackState;
- (void)_updateFeedbackView;
- (void)beginDisplayForReserveSpacePlaceholder:(id)a3;
- (void)cancelShowingReserveSpaceIntro;
- (void)dealloc;
- (void)endDisplayForReserveSpacePlaceholder:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFeedbackType:(int64_t)a3;
- (void)setPlaceholder:(id)a3;
- (void)setReferenceElementContent:(id)a3;
- (void)setReferenceElementContent:(id)a3 referenceRange:(_NSRange)a4 feedbackType:(int64_t)a5;
- (void)setReferenceTextRange:(_NSRange)a3;
- (void)set_feedbackView:(id)a3;
@end

@implementation PKTextInputFeedbackController

- (PKTextInputFeedbackController)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKTextInputFeedbackController;
  v2 = [(PKTextInputFeedbackController *)&v6 init];
  v3 = (PKTextInputFeedbackController *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 56) = xmmword_1C482B1D0;
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel__placeholderChanged_ name:*MEMORY[0x1E4FB3030] object:0];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PKTextInputFeedbackController;
  [(PKTextInputFeedbackController *)&v4 dealloc];
}

- (BOOL)_shouldShowCustomFeedback
{
  int v3 = 1;
  switch([(PKTextInputFeedbackController *)self feedbackType])
  {
    case 0:
      objc_super v4 = [(PKTextInputFeedbackController *)self referenceElementContent];

      if (!v4) {
        goto LABEL_12;
      }
      v5 = [(PKTextInputFeedbackController *)self referenceElementContent];
      BOOL v6 = -[PKTextInputElementContent configureSelectionStyleForNormalSelection]((uint64_t)v5);
      break;
    case 1:
      v7 = [(PKTextInputFeedbackController *)self referenceElementContent];

      if (!v7) {
        goto LABEL_12;
      }
      v5 = [(PKTextInputFeedbackController *)self referenceElementContent];
      BOOL v6 = -[PKTextInputElementContent configureSelectionStyleForDeletionPreview]((uint64_t)v5);
      break;
    case 2:
      v8 = [(PKTextInputFeedbackController *)self referenceElementContent];

      if (!v8) {
        goto LABEL_12;
      }
      v5 = [(PKTextInputFeedbackController *)self referenceElementContent];
      BOOL v6 = -[PKTextInputElementContent configureSelectionStyleForHighlight]((uint64_t)v5);
      break;
    case 4:
    case 5:
      int v3 = 0;
      goto LABEL_12;
    default:
      goto LABEL_12;
  }
  BOOL v9 = v6;

  if (v9) {
    return 0;
  }
  int v3 = 1;
LABEL_12:
  v11 = [(PKTextInputFeedbackController *)self referenceElementContent];
  if (v11
    && [(PKTextInputFeedbackController *)self feedbackType]
    && (!v3 || [(PKTextInputFeedbackController *)self referenceTextRange] != 0x7FFFFFFFFFFFFFFFLL))
  {
    v12 = [(PKTextInputFeedbackController *)self delegate];
    BOOL v10 = v12 != 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)_updateFeedbackState
{
  [(PKTextInputFeedbackController *)self _setShowingCustomFeedback:[(PKTextInputFeedbackController *)self _shouldShowCustomFeedback]];

  [(PKTextInputFeedbackController *)self _updateFeedbackView];
}

- (void)_setShowingCustomFeedback:(BOOL)a3
{
  if (self->_showingCustomFeedback != a3)
  {
    self->_showingCustomFeedback = a3;
    [(PKTextInputFeedbackController *)self _updateFeedbackView];
    id v4 = [(PKTextInputFeedbackController *)self delegate];
    [v4 feedbackControllerShowingCustomFeedbackDidChange:self];
  }
}

- (void)_updateFeedbackView
{
  BOOL v3 = [(PKTextInputFeedbackController *)self showingCustomFeedback];
  id v4 = [(PKTextInputFeedbackController *)self _feedbackView];

  if (!v3 || v4)
  {
    if (v4) {
      char v14 = v3;
    }
    else {
      char v14 = 1;
    }
    if ((v14 & 1) == 0)
    {
      v15 = [(PKTextInputFeedbackController *)self _feedbackView];
      [v15 removeFromSuperview];

      [(PKTextInputFeedbackController *)self set_feedbackView:0];
    }
  }
  else
  {
    v5 = [(PKTextInputFeedbackController *)self delegate];
    BOOL v6 = [v5 feedbackControllerContainerView:self];

    if (v6)
    {
      v7 = [PKTextInputGestureFeedbackView alloc];
      [v6 bounds];
      v8 = -[PKTextInputGestureFeedbackView initWithFrame:](v7, "initWithFrame:");
      [(PKTextInputFeedbackController *)self set_feedbackView:v8];

      uint64_t v9 = [(PKTextInputFeedbackController *)self _feedbackView];
      BOOL v10 = (void *)v9;
      if (v9) {
        objc_storeWeak((id *)(v9 + 416), self);
      }

      v11 = [(PKTextInputFeedbackController *)self _feedbackView];
      [v11 setAutoresizingMask:18];

      v12 = [(PKTextInputFeedbackController *)self _feedbackView];
      [v6 addSubview:v12];

      v13 = [(PKTextInputFeedbackController *)self _feedbackView];
      [v6 sendSubviewToBack:v13];
    }
  }
  if (v3)
  {
    id v16 = [(PKTextInputFeedbackController *)self _feedbackView];
    -[PKTextInputGestureFeedbackView setNeedsRefreshFeedbackViews]((uint64_t)v16);
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    [(PKTextInputFeedbackController *)self _updateFeedbackState];
    v5 = obj;
  }
}

- (void)setReferenceElementContent:(id)a3 referenceRange:(_NSRange)a4 feedbackType:(int64_t)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  BOOL v10 = (PKTextInputElementContent *)a3;
  p_referenceElementContent = &self->_referenceElementContent;
  if (self->_referenceElementContent != v10
    || (location == self->_referenceTextRange.location ? (BOOL v12 = length == self->_referenceTextRange.length) : (BOOL v12 = 0),
        !v12 || self->_feedbackType != a5))
  {
    self->_referenceTextRange.NSUInteger location = location;
    self->_referenceTextRange.NSUInteger length = length;
    self->_feedbackType = a5;
    v15 = v10;
    if (v10) {
      objc_storeStrong((id *)&self->_referenceElementContent, a3);
    }
    [(PKTextInputFeedbackController *)self _updateFeedbackState];
    if (a5 == 3)
    {
      v13 = [(PKTextInputFeedbackController *)self _feedbackView];
      -[PKTextInputGestureFeedbackView beginShowingReserveSpaceIntro]((uint64_t)v13);
    }
    BOOL v10 = v15;
    if (!v15)
    {
      char v14 = *p_referenceElementContent;
      *p_referenceElementContent = 0;

      BOOL v10 = 0;
    }
  }
}

- (void)cancelShowingReserveSpaceIntro
{
  [(PKTextInputFeedbackController *)self setFeedbackType:4];
  BOOL v3 = [(PKTextInputFeedbackController *)self _feedbackView];
  -[PKTextInputGestureFeedbackView cancelShowingReserveSpaceIntro](v3);

  [(PKTextInputFeedbackController *)self setFeedbackType:0];

  [(PKTextInputFeedbackController *)self _updateFeedbackState];
}

- (void)beginDisplayForReserveSpacePlaceholder:(id)a3
{
  [(PKTextInputFeedbackController *)self setPlaceholder:a3];
  [(PKTextInputFeedbackController *)self setFeedbackType:5];

  [(PKTextInputFeedbackController *)self _updateFeedbackState];
}

- (void)endDisplayForReserveSpacePlaceholder:(id)a3
{
  id v4 = a3;
  id v5 = [(PKTextInputFeedbackController *)self placeholder];

  if (v5 == v4)
  {
    [(PKTextInputFeedbackController *)self setPlaceholder:0];
    [(PKTextInputFeedbackController *)self setFeedbackType:0];
    [(PKTextInputFeedbackController *)self _updateFeedbackState];
  }
}

- (void)_placeholderChanged:(id)a3
{
  id v4 = [a3 userInfo];
  id v8 = [v4 objectForKey:*MEMORY[0x1E4FB3038]];

  id v5 = [(PKTextInputFeedbackController *)self placeholder];
  id v6 = [v5 placeholder];

  v7 = v8;
  if (v8 == v6)
  {
    [(PKTextInputFeedbackController *)self _updateFeedbackState];
    v7 = v8;
  }
}

- (PKTextInputFeedbackControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKTextInputFeedbackControllerDelegate *)WeakRetained;
}

- (PKTextInputElementContent)referenceElementContent
{
  return self->_referenceElementContent;
}

- (void)setReferenceElementContent:(id)a3
{
}

- (_NSRange)referenceTextRange
{
  NSUInteger length = self->_referenceTextRange.length;
  NSUInteger location = self->_referenceTextRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setReferenceTextRange:(_NSRange)a3
{
  self->_referenceTextRange = a3;
}

- (int64_t)feedbackType
{
  return self->_feedbackType;
}

- (void)setFeedbackType:(int64_t)a3
{
  self->_feedbackType = a3;
}

- (BOOL)showingCustomFeedback
{
  return self->_showingCustomFeedback;
}

- (PKTextInputTextPlaceholder)placeholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(id)a3
{
}

- (PKTextInputGestureFeedbackView)_feedbackView
{
  return self->__feedbackView;
}

- (void)set_feedbackView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__feedbackView, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_referenceElementContent, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end