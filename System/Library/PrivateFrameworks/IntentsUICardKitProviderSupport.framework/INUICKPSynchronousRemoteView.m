@interface INUICKPSynchronousRemoteView
- (CGSize)sizeThatFits:(CGSize)a3;
- (INUICKPSynchronousRemoteViewDelegate)delegate;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
@end

@implementation INUICKPSynchronousRemoteView

- (CGSize)sizeThatFits:(CGSize)a3
{
  v4 = [(INUICKPSynchronousRemoteView *)self delegate];
  [v4 cachedSizeForSynchronousRemoteView:self];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)INUICKPSynchronousRemoteView;
  [(INUICKPSynchronousRemoteView *)&v13 layoutSubviews];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = [(INUICKPSynchronousRemoteView *)self subviews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        [(INUICKPSynchronousRemoteView *)self bounds];
        objc_msgSend(v8, "setFrame:");
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v5);
  }
}

- (INUICKPSynchronousRemoteViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (INUICKPSynchronousRemoteViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end