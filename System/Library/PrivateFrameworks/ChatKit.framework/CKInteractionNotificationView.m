@interface CKInteractionNotificationView
- (CKInteractionNotificationViewDelegate)delegate;
- (NSArray)passthroughViews;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setPassthroughViews:(id)a3;
@end

@implementation CKInteractionNotificationView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CKInteractionNotificationView;
  -[CKInteractionNotificationView hitTest:withEvent:](&v21, sel_hitTest_withEvent_, v7, x, y);
  v8 = (CKInteractionNotificationView *)objc_claimAutoreleasedReturnValue();
  if (v8 == self)
  {
    if (![v7 type])
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      v9 = [(CKInteractionNotificationView *)self passthroughViews];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v18;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v18 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            objc_msgSend(v14, "convertPoint:fromView:", self, x, y);
            v15 = objc_msgSend(v14, "hitTest:withEvent:", v7);

            if (v15)
            {

              self = 0;
              goto LABEL_14;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      if (!self)
      {
        v8 = 0;
        goto LABEL_16;
      }
      v9 = [(CKInteractionNotificationView *)self delegate];
      [v9 interactionNotificationViewWasTapped:self];
LABEL_14:
    }
    v8 = self;
  }
LABEL_16:

  return 0;
}

- (CKInteractionNotificationViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKInteractionNotificationViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)passthroughViews
{
  return self->_passthroughViews;
}

- (void)setPassthroughViews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passthroughViews, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end