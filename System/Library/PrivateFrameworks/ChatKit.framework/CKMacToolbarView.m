@interface CKMacToolbarView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CKMacToolbarViewDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation CKMacToolbarView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v8 = [(CKMacToolbarView *)self subviews];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v14 = [(CKMacToolbarView *)self delegate];
          char v13 = objc_msgSend(v14, "macToolbarView:shouldAllowTouchesForPoint:andEvent:", self, v7, x, y);

          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  char v13 = 0;
LABEL_11:

  return v13;
}

- (CKMacToolbarViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKMacToolbarViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end