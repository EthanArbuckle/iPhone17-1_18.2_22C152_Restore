@interface FKAPointPickerViewController
- (FKAPointPickerViewControllerDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation FKAPointPickerViewController

- (FKAPointPickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FKAPointPickerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end