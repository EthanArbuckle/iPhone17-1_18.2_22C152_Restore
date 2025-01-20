@interface SFDownloadsUnifiedBarItem
- (SFDownloadsUnifiedBarItem)initWithAction:(id)a3;
- (double)progress;
- (id)view;
- (void)pulse;
- (void)setProgress:(double)a3;
@end

@implementation SFDownloadsUnifiedBarItem

- (SFDownloadsUnifiedBarItem)initWithAction:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SFDownloadsUnifiedBarItem;
  v5 = [(SFDownloadsUnifiedBarItem *)&v17 init];
  if (v5)
  {
    v6 = objc_alloc_init(SFDownloadsUnifiedBarItemView);
    view = v5->_view;
    v5->_view = v6;

    objc_initWeak(&location, v5);
    v8 = v5->_view;
    v9 = (void *)MEMORY[0x1E4FB13F0];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __44__SFDownloadsUnifiedBarItem_initWithAction___block_invoke;
    v13[3] = &unk_1E5C78928;
    objc_copyWeak(&v15, &location);
    id v14 = v4;
    v10 = [v9 actionWithHandler:v13];
    [(SFDownloadsUnifiedBarItemView *)v8 addAction:v10 forControlEvents:0x2000];

    v11 = v5;
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __44__SFDownloadsUnifiedBarItem_initWithAction___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3)
    {
      id v4 = WeakRetained;
      (*(void (**)(void))(v3 + 16))();
      id WeakRetained = v4;
    }
  }
}

- (double)progress
{
  [(SFDownloadsUnifiedBarItemView *)self->_view progress];
  return result;
}

- (void)setProgress:(double)a3
{
}

- (void)pulse
{
}

- (id)view
{
  return self->_view;
}

- (void).cxx_destruct
{
}

@end