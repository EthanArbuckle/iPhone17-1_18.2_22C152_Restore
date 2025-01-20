@interface CNContactPickerServiceErrorViewController
- (CNContactPickerContentDelegate)delegate;
- (UIBarButtonItem)addContactBarButtonItem;
- (UINavigationController)navigationController;
- (void)setDelegate:(id)a3;
- (void)setupWithOptions:(id)a3 readyBlock:(id)a4;
@end

@implementation CNContactPickerServiceErrorViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->addContactBarButtonItem, 0);
  objc_storeStrong((id *)&self->navigationController, 0);

  objc_destroyWeak((id *)&self->delegate);
}

- (UIBarButtonItem)addContactBarButtonItem
{
  return self->addContactBarButtonItem;
}

- (UINavigationController)navigationController
{
  return self->navigationController;
}

- (void)setDelegate:(id)a3
{
}

- (CNContactPickerContentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (CNContactPickerContentDelegate *)WeakRetained;
}

- (void)setupWithOptions:(id)a3 readyBlock:(id)a4
{
}

@end