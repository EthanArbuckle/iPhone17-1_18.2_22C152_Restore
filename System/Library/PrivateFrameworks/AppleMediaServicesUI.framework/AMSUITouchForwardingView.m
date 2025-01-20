@interface AMSUITouchForwardingView
- (NSArray)passthroughViews;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setPassthroughViews:(id)a3;
@end

@implementation AMSUITouchForwardingView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)AMSUITouchForwardingView;
  -[AMSUITouchForwardingView hitTest:withEvent:](&v25, sel_hitTest_withEvent_, v7, x, y);
  v8 = (AMSUITouchForwardingView *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 == self)
  {
    v11 = [(AMSUITouchForwardingView *)self passthroughViews];

    if (v11)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      v12 = [(AMSUITouchForwardingView *)self passthroughViews];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v22;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v22 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            if (v17)
            {
              -[AMSUITouchForwardingView convertPoint:toView:](self, "convertPoint:toView:", *(void *)(*((void *)&v21 + 1) + 8 * i), x, y);
              uint64_t v18 = objc_msgSend(v17, "hitTest:withEvent:", v7);
              if (v18)
              {
                v19 = (void *)v18;

                goto LABEL_16;
              }
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }
    }
    v10 = self;
  }
  else
  {
    v10 = v8;
  }
  v19 = v10;
LABEL_16:

  return v19;
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
}

@end