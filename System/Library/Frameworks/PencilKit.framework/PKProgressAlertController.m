@interface PKProgressAlertController
+ (id)newProgressAlertControllerWithTitle:(id)a3 cancel:(id)a4;
- (BOOL)_canShowWhileLocked;
- (BOOL)canBecomeFirstResponder;
- (PKProgressAlertControllerDelegate)delegate;
- (double)progress;
- (void)setDelegate:(id)a3;
- (void)setProgress:(double)a3;
@end

@implementation PKProgressAlertController

+ (id)newProgressAlertControllerWithTitle:(id)a3 cancel:(id)a4
{
  id v6 = a4;
  v7 = [a1 alertControllerWithTitle:a3 message:0 preferredStyle:1];
  v8 = (void *)MEMORY[0x1E4FB1410];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__PKProgressAlertController_newProgressAlertControllerWithTitle_cancel___block_invoke;
  v14[3] = &unk_1E64C6F68;
  id v9 = v7;
  id v15 = v9;
  v10 = [v8 actionWithTitle:v6 style:1 handler:v14];

  [v9 addAction:v10];
  v11 = objc_alloc_init(PKProgressContentViewController);
  [v9 setContentViewController:v11];
  id v12 = v9;

  return v12;
}

void __72__PKProgressAlertController_newProgressAlertControllerWithTitle_cancel___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 alertControllerDidCancel:*(void *)(a1 + 32)];
}

- (void)setProgress:(double)a3
{
  id v4 = [(PKProgressAlertController *)self contentViewController];
  [v4 setProgress:a3];
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (PKProgressAlertControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKProgressAlertControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
}

@end