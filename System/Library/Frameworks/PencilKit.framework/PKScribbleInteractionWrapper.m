@interface PKScribbleInteractionWrapper
- (BOOL)beginSuppressingPlaceholderForElement:(id)a3;
- (BOOL)focusWillTransformElement:(id)a3;
- (BOOL)isEditableElement:(id)a3;
- (BOOL)isElementContainer;
- (BOOL)isElementFocused:(id)a3;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldBeginAtLocation:(CGPoint)a3;
- (BOOL)shouldDisableInputAssistant;
- (BOOL)supportsIsElementFocused;
- (BOOL)supportsShouldBegin;
- (CGRect)frameForElement:(id)a3;
- (NSString)description;
- (UIEdgeInsets)hitToleranceInsetsWithDefaultInsets:(UIEdgeInsets)a3 element:(id)a4;
- (UIInteraction)interaction;
- (UIView)interactionView;
- (id)initWithScribbleInteraction:(id *)a1;
- (void)didFinishWritingInElement:(id)a3;
- (void)didTargetElement:(id)a3 forTouches:(id)a4 event:(id)a5;
- (void)endSuppressingPlaceholderForElement:(id)a3;
- (void)focusElement:(id)a3 initialFocusSelectionReferencePoint:(CGPoint)a4 completion:(id)a5;
- (void)requestElementsInRect:(CGRect)a3 completion:(id)a4;
- (void)willBeginWritingInElement:(id)a3;
@end

@implementation PKScribbleInteractionWrapper

- (id)initWithScribbleInteraction:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)PKScribbleInteractionWrapper;
    v4 = (id *)objc_msgSendSuper2(&v6, sel_init);
    a1 = v4;
    if (v4) {
      objc_storeWeak(v4 + 1, v3);
    }
  }

  return a1;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKScribbleInteractionWrapper *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
      id v7 = objc_loadWeakRetained(v5 + 1);

      BOOL v8 = WeakRetained == v7;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)PKScribbleInteractionWrapper;
  id v3 = [(PKScribbleInteractionWrapper *)&v7 description];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  v5 = [v3 stringByAppendingFormat:@" %@", WeakRetained];

  return (NSString *)v5;
}

- (UIInteraction)interaction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);

  return (UIInteraction *)WeakRetained;
}

- (UIView)interactionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  id v3 = [WeakRetained view];

  return (UIView *)v3;
}

- (BOOL)supportsShouldBegin
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  id v3 = [WeakRetained delegate];
  char v4 = objc_opt_respondsToSelector();

  return v4 & 1;
}

- (BOOL)isElementContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  id v3 = [WeakRetained elementSource];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isEditableElement:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  objc_super v6 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector()) {
    char v7 = [v6 _scribbleInteraction:WeakRetained isEditableElement:v4];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (BOOL)isEnabled
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  id v3 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 _scribbleInteractionIsEnabled:WeakRetained];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)didTargetElement:(id)a3 forTouches:(id)a4 event:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  v11 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector()) {
    [v11 _scribbleInteraction:WeakRetained didTargetElement:v12 forTouches:v8 event:v9];
  }
}

- (CGRect)frameForElement:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  objc_super v6 = [WeakRetained elementSource];
  char v7 = v6;
  if (v6)
  {
    [v6 _scribbleInteraction:WeakRetained frameForElement:v4];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    double v9 = *MEMORY[0x1E4F1DB20];
    double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v13 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (BOOL)beginSuppressingPlaceholderForElement:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  objc_super v6 = [WeakRetained delegate];
  char v7 = objc_opt_respondsToSelector();
  if (v7) {
    [v6 _scribbleInteraction:WeakRetained beginSuppressingPlaceholderForElement:v4];
  }

  return v7 & 1;
}

- (void)endSuppressingPlaceholderForElement:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  v5 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 _scribbleInteraction:WeakRetained endSuppressingPlaceholderForElement:v6];
  }
}

- (BOOL)focusWillTransformElement:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  id v6 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector()) {
    char v7 = [v6 _scribbleInteraction:WeakRetained focusWillTransformElement:v4];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)shouldBeginAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  id v6 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector()) {
    char v7 = objc_msgSend(v6, "_scribbleInteraction:shouldBeginAtLocation:", WeakRetained, x, y);
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (BOOL)supportsIsElementFocused
{
  return 0;
}

- (BOOL)isElementFocused:(id)a3
{
  return 0;
}

- (BOOL)shouldDisableInputAssistant
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  id v3 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 _pkScribbleInteractionShouldDisableInputAssistant:WeakRetained];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)willBeginWritingInElement:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  v5 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 _scribbleInteraction:WeakRetained willBeginWritingInElement:v6];
  }
}

- (void)didFinishWritingInElement:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  v5 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 _scribbleInteraction:WeakRetained didFinishWritingInElement:v6];
  }
}

- (void)requestElementsInRect:(CGRect)a3 completion:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  double v11 = [WeakRetained elementSource];
  if (objc_opt_respondsToSelector())
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __65__PKScribbleInteractionWrapper_requestElementsInRect_completion___block_invoke;
    v12[3] = &unk_1E64C7330;
    id v13 = WeakRetained;
    id v14 = v9;
    objc_msgSend(v11, "_scribbleInteraction:requestElementsInRect:completion:", v13, v12, x, y, width, height);
  }
  else if (v9)
  {
    (*((void (**)(id, void, uint64_t))v9 + 2))(v9, MEMORY[0x1E4F1CBF0], 0x7FFFFFFFFFFFFFFFLL);
  }
}

void __65__PKScribbleInteractionWrapper_requestElementsInRect_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6 && *(unsigned char *)(v6 + 24))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    char v7 = +[PKTextInputSettings sharedSettings];
    [v7 debugElementFinderArtificialDelay];
    double v9 = v8;

    dispatch_time_t v10 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__PKScribbleInteractionWrapper_requestElementsInRect_completion___block_invoke_2;
    block[3] = &unk_1E64C7308;
    id v13 = *(id *)(a1 + 40);
    id v12 = v5;
    uint64_t v14 = a3;
    dispatch_after(v10, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __65__PKScribbleInteractionWrapper_requestElementsInRect_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[4], a1[6]);
}

- (void)focusElement:(id)a3 initialFocusSelectionReferencePoint:(CGPoint)a4 completion:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v12 = a3;
  double v9 = (void (**)(id, void))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  double v11 = [WeakRetained elementSource];
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v11, "_scribbleInteraction:focusElement:initialFocusSelectionReferencePoint:completion:", WeakRetained, v12, v9, x, y);
  }
  else if (objc_opt_respondsToSelector())
  {
    [v11 _scribbleInteraction:WeakRetained focusElement:v12 completion:v9];
  }
  else if (v9)
  {
    v9[2](v9, 0);
  }
}

- (UIEdgeInsets)hitToleranceInsetsWithDefaultInsets:(UIEdgeInsets)a3 element:(id)a4
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  double v11 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v11, "_scribbleInteraction:hitToleranceInsetsForElement:defaultInsets:", WeakRetained, v9, top, left, bottom, right);
    double top = v12;
    double left = v13;
    double bottom = v14;
    double right = v15;
  }

  double v16 = top;
  double v17 = left;
  double v18 = bottom;
  double v19 = right;
  result.double right = v19;
  result.double bottom = v18;
  result.double left = v17;
  result.double top = v16;
  return result;
}

- (void).cxx_destruct
{
}

@end