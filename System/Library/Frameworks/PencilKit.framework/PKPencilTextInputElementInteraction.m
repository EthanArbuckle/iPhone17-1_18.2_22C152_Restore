@interface PKPencilTextInputElementInteraction
+ (id)_pencilTextInputElementInteractionInView:(id)a3;
- (PKPencilTextInputElementInteractionDelegate)delegate;
- (UIView)view;
- (id)scribbleInteractionWrapper;
- (void)setDelegate:(id)a3;
- (void)setView:(id)a3;
@end

@implementation PKPencilTextInputElementInteraction

+ (id)_pencilTextInputElementInteractionInView:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = objc_msgSend(a3, "interactions", 0);
  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)scribbleInteractionWrapper
{
  cachedWrapper = self->_cachedWrapper;
  if (!cachedWrapper)
  {
    id v4 = [[PKPencilTextInputElementInteractionWrapper alloc] initWithElementInteraction:self];
    uint64_t v5 = self->_cachedWrapper;
    self->_cachedWrapper = (PKScribbleInteractionWrapper *)v4;

    cachedWrapper = self->_cachedWrapper;
  }

  return cachedWrapper;
}

- (PKPencilTextInputElementInteractionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPencilTextInputElementInteractionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  return (UIView *)WeakRetained;
}

- (void)setView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_cachedWrapper, 0);
}

@end