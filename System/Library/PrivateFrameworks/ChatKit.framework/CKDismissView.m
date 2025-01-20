@interface CKDismissView
- (CKDismissViewDelegate)delegate;
- (NSArray)passthroughViews;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setPassthroughViews:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation CKDismissView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CKDismissView;
  -[CKDismissView hitTest:withEvent:](&v21, sel_hitTest_withEvent_, v7, x, y);
  v8 = (CKDismissView *)objc_claimAutoreleasedReturnValue();
  if (v8 == self)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v9 = [(CKDismissView *)self passthroughViews];
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
            goto LABEL_12;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    v8 = self;
  }

  return v8;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CKDismissView;
  [(CKDismissView *)&v6 touchesBegan:a3 withEvent:a4];
  v5 = [(CKDismissView *)self delegate];
  [v5 dismissViewWasTapped:self];
}

- (CKDismissViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKDismissViewDelegate *)WeakRetained;
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