@interface EKUIVisualEffectView
- (EKUITintColorUpdateDelegate)tintColorDelegate;
- (EKUIVisualEffectView)initWithFrame:(CGRect)a3;
- (void)setTintColorDelegate:(id)a3;
- (void)viewTintColorDidChangeForView:(id)a3 toColor:(id)a4;
@end

@implementation EKUIVisualEffectView

- (void)viewTintColorDidChangeForView:(id)a3 toColor:(id)a4
{
  id v7 = a4;
  v5 = [(EKUIVisualEffectView *)self tintColorDelegate];

  if (v5)
  {
    v6 = [(EKUIVisualEffectView *)self tintColorDelegate];
    [v6 viewTintColorDidChangeForView:self toColor:v7];
  }
  [(EKUIVisualEffectView *)self subTintColorUpdatedToColor:v7];
}

- (EKUITintColorUpdateDelegate)tintColorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tintColorDelegate);

  return (EKUITintColorUpdateDelegate *)WeakRetained;
}

- (void)setTintColorDelegate:(id)a3
{
}

- (EKUIVisualEffectView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)EKUIVisualEffectView;
  v3 = -[EKUIVisualEffectView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [TintColorUpdateView alloc];
    uint64_t v5 = -[TintColorUpdateView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    updateView = v3->_updateView;
    v3->_updateView = (TintColorUpdateView *)v5;

    [(TintColorUpdateView *)v3->_updateView setHidden:1];
    id v7 = [MEMORY[0x1E4FB1618] clearColor];
    [(TintColorUpdateView *)v3->_updateView setBackgroundColor:v7];

    [(TintColorUpdateView *)v3->_updateView setTintColorUpdateDelegate:v3];
    v8 = [(EKUIVisualEffectView *)v3 contentView];
    [v8 addSubview:v3->_updateView];
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tintColorDelegate);

  objc_storeStrong((id *)&self->_updateView, 0);
}

@end