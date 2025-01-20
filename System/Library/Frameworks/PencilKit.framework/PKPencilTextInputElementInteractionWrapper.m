@interface PKPencilTextInputElementInteractionWrapper
- (BOOL)beginSuppressingPlaceholderForElement:(id)a3;
- (BOOL)focusWillTransformElement:(id)a3;
- (BOOL)isElementContainer;
- (BOOL)isElementFocused:(id)a3;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldBeginAtLocation:(CGPoint)a3;
- (BOOL)supportsIsElementFocused;
- (BOOL)supportsShouldBegin;
- (CGRect)frameForElement:(id)a3;
- (NSString)description;
- (PKPencilTextInputElementInteractionWrapper)initWithElementInteraction:(id)a3;
- (UIInteraction)interaction;
- (UIView)interactionView;
- (void)endSuppressingPlaceholderForElement:(id)a3;
- (void)focusElement:(id)a3 initialFocusSelectionReferencePoint:(CGPoint)a4 completion:(id)a5;
- (void)requestElementsInRect:(CGRect)a3 completion:(id)a4;
@end

@implementation PKPencilTextInputElementInteractionWrapper

- (PKPencilTextInputElementInteractionWrapper)initWithElementInteraction:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPencilTextInputElementInteractionWrapper;
  v5 = [(PKPencilTextInputElementInteractionWrapper *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_elementInteraction, v4);
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    knownElementsByID = v6->_knownElementsByID;
    v6->_knownElementsByID = (NSMutableDictionary *)v7;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (id *)v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_elementInteraction);
    id v7 = objc_loadWeakRetained(v5 + 1);

    BOOL v8 = WeakRetained == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)PKPencilTextInputElementInteractionWrapper;
  v3 = [(PKPencilTextInputElementInteractionWrapper *)&v7 description];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementInteraction);
  v5 = [v3 stringByAppendingFormat:@" %@", WeakRetained];

  return (NSString *)v5;
}

- (UIInteraction)interaction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementInteraction);

  return (UIInteraction *)WeakRetained;
}

- (UIView)interactionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementInteraction);
  v3 = [WeakRetained view];

  return (UIView *)v3;
}

- (BOOL)supportsShouldBegin
{
  return 0;
}

- (BOOL)supportsIsElementFocused
{
  return 0;
}

- (BOOL)isElementFocused:(id)a3
{
  return 0;
}

- (BOOL)isElementContainer
{
  return 1;
}

- (BOOL)isEnabled
{
  return 1;
}

- (CGRect)frameForElement:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB20];
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  if (a3)
  {
    objc_super v7 = -[NSMutableDictionary objectForKeyedSubscript:](self->_knownElementsByID, "objectForKeyedSubscript:");
    BOOL v8 = v7;
    if (v7)
    {
      [v7 frame];
      double v3 = v9;
      double v4 = v10;
      double v5 = v11;
      double v6 = v12;
    }
  }
  double v13 = v3;
  double v14 = v4;
  double v15 = v5;
  double v16 = v6;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (BOOL)beginSuppressingPlaceholderForElement:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementInteraction);
  if (!v4)
  {
    objc_super v7 = 0;
    goto LABEL_7;
  }
  uint64_t v6 = [(NSMutableDictionary *)self->_knownElementsByID objectForKeyedSubscript:v4];
  objc_super v7 = (void *)v6;
  BOOL v8 = 0;
  if (WeakRetained && v6)
  {
    double v9 = [WeakRetained delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      double v11 = [WeakRetained delegate];
      [v11 pencilTextInputInteraction:WeakRetained beginSuppressingPlaceholderForElement:v7];

      BOOL v8 = 1;
      goto LABEL_8;
    }
LABEL_7:
    BOOL v8 = 0;
  }
LABEL_8:

  return v8;
}

- (void)endSuppressingPlaceholderForElement:(id)a3
{
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementInteraction);
  if (v10)
  {
    uint64_t v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_knownElementsByID, "objectForKeyedSubscript:");
    uint64_t v6 = (void *)v5;
    if (WeakRetained)
    {
      if (v5)
      {
        objc_super v7 = [WeakRetained delegate];
        char v8 = objc_opt_respondsToSelector();

        if (v8)
        {
          double v9 = [WeakRetained delegate];
          [v9 pencilTextInputInteraction:WeakRetained endSuppressingPlaceholderForElement:v6];
        }
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
}

- (BOOL)focusWillTransformElement:(id)a3
{
  return 1;
}

- (BOOL)shouldBeginAtLocation:(CGPoint)a3
{
  return 1;
}

- (void)requestElementsInRect:(CGRect)a3 completion:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementInteraction);
  double v11 = [WeakRetained delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    double v13 = [WeakRetained delegate];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __79__PKPencilTextInputElementInteractionWrapper_requestElementsInRect_completion___block_invoke;
    v14[3] = &unk_1E64C7950;
    v14[4] = self;
    id v15 = v9;
    objc_msgSend(v13, "pencilTextInputInteraction:requestTextInputElementsInRect:completion:", WeakRetained, v14, x, y, width, height);
  }
}

void __79__PKPencilTextInputElementInteractionWrapper_requestElementsInRect_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__PKPencilTextInputElementInteractionWrapper_requestElementsInRect_completion___block_invoke_2;
  block[3] = &unk_1E64C6988;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __79__PKPencilTextInputElementInteractionWrapper_requestElementsInRect_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v9 = *(void **)(*(void *)(a1 + 40) + 16);
        id v10 = objc_msgSend(v8, "identifier", (void)v12);
        [v9 setObject:v8 forKeyedSubscript:v10];

        double v11 = [v8 identifier];
        [v2 addObject:v11];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)focusElement:(id)a3 initialFocusSelectionReferencePoint:(CGPoint)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, void))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementInteraction);
  if (!v7)
  {
    double v11 = 0;
LABEL_7:
    v8[2](v8, 0);
    goto LABEL_8;
  }
  uint64_t v10 = [(NSMutableDictionary *)self->_knownElementsByID objectForKeyedSubscript:v7];
  double v11 = (void *)v10;
  if (!WeakRetained) {
    goto LABEL_7;
  }
  if (!v10) {
    goto LABEL_7;
  }
  long long v12 = [WeakRetained delegate];
  char v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) == 0) {
    goto LABEL_7;
  }
  long long v14 = [WeakRetained delegate];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __106__PKPencilTextInputElementInteractionWrapper_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke;
  v15[3] = &unk_1E64C7978;
  double v16 = v8;
  [v14 pencilTextInputInteraction:WeakRetained focusTextInputElement:v11 completion:v15];

LABEL_8:
}

uint64_t __106__PKPencilTextInputElementInteractionWrapper_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownElementsByID, 0);

  objc_destroyWeak((id *)&self->_elementInteraction);
}

@end