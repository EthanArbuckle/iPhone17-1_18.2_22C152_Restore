@interface DBLockOutView
- (DBLockOutView)initWithMode:(int64_t)a3 environmentConfiguration:(id)a4;
- (DBLockOutViewDelegate)delegate;
- (UITapGestureRecognizer)backToOEMGestureRecognizer;
- (int64_t)mode;
- (void)_backToOEM;
- (void)setBackToOEMGestureRecognizer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DBLockOutView

- (DBLockOutView)initWithMode:(int64_t)a3 environmentConfiguration:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)DBLockOutView;
  v5 = -[DBLockOutView initWithFrame:](&v10, sel_initWithFrame_, a3, a4, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v6 = v5;
  if (v5)
  {
    v5->_mode = a3;
    uint64_t v7 = [objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:v5 action:sel__backToOEM];
    backToOEMGestureRecognizer = v6->_backToOEMGestureRecognizer;
    v6->_backToOEMGestureRecognizer = (UITapGestureRecognizer *)v7;

    [(UITapGestureRecognizer *)v6->_backToOEMGestureRecognizer setAllowedPressTypes:&unk_26E17EEB8];
    [(DBLockOutView *)v6 addGestureRecognizer:v6->_backToOEMGestureRecognizer];
  }
  return v6;
}

- (void)traitCollectionDidChange:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)DBLockOutView;
  [(DBLockOutView *)&v3 traitCollectionDidChange:a3];
}

- (void)_backToOEM
{
  id v3 = [(DBLockOutView *)self delegate];
  [v3 lockOutView:self didTapButtonOfType:1000];
}

- (int64_t)mode
{
  return self->_mode;
}

- (DBLockOutViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DBLockOutViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UITapGestureRecognizer)backToOEMGestureRecognizer
{
  return self->_backToOEMGestureRecognizer;
}

- (void)setBackToOEMGestureRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backToOEMGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end