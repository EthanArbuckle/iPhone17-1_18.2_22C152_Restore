@interface GAXOverlayUserInterfaceView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (GAXOverlayUserInterfaceViewDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation GAXOverlayUserInterfaceView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(GAXOverlayUserInterfaceView *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [v8 isModalContentBeingPresentedInOverlayUserInterfaceView:self])
  {
    v21.receiver = self;
    v21.super_class = (Class)GAXOverlayUserInterfaceView;
    BOOL v9 = -[GAXOverlayUserInterfaceView pointInside:withEvent:](&v21, "pointInside:withEvent:", v7, x, y);
  }
  else
  {
    [(GAXOverlayUserInterfaceView *)self subviews];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v18;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          objc_msgSend(v15, "convertPoint:fromView:", self, x, y, (void)v17);
          if (objc_msgSend(v15, "pointInside:withEvent:", v7))
          {
            BOOL v9 = 1;
            goto LABEL_14;
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    BOOL v9 = 0;
LABEL_14:
  }
  return v9;
}

- (GAXOverlayUserInterfaceViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GAXOverlayUserInterfaceViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end