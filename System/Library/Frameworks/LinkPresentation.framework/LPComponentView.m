@interface LPComponentView
- (BOOL)isFlipped;
- (BOOL)shouldAllowHighlightToRecognizeSimultaneouslyWithGesture:(id)a3;
- (LPComponentView)init;
- (LPComponentView)initWithCoder:(id)a3;
- (LPComponentView)initWithFrame:(CGRect)a3;
- (LPComponentView)initWithHost:(id)a3;
- (LPComponentViewHost)host;
- (id)layoutExclusionsForView:(id)a3;
- (void)layoutSubviews;
@end

@implementation LPComponentView

- (LPComponentView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (LPComponentView)initWithCoder:(id)a3
{
  return 0;
}

- (LPComponentView)init
{
  return 0;
}

- (LPComponentView)initWithHost:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LPComponentView;
  v5 = -[LPComponentView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_host, v4);
    v7 = v6;
  }

  return v6;
}

- (BOOL)isFlipped
{
  return 1;
}

- (void)layoutSubviews
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __33__LPComponentView_layoutSubviews__block_invoke;
  v2[3] = &unk_1E5B04DF0;
  v2[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v2];
}

uint64_t __33__LPComponentView_layoutSubviews__block_invoke(uint64_t a1)
{
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)LPComponentView;
  objc_msgSendSuper2(&v3, sel_layoutSubviews);
  return [*(id *)(a1 + 32) layoutComponentView];
}

- (BOOL)shouldAllowHighlightToRecognizeSimultaneouslyWithGesture:(id)a3
{
  return 1;
}

- (id)layoutExclusionsForView:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (LPComponentViewHost)host
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  return (LPComponentViewHost *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end