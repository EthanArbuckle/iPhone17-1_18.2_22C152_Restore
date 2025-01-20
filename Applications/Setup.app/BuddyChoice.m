@interface BuddyChoice
- (BuddyChoice)initWithTitle:(id)a3 nextItemClass:(Class)a4;
- (Class)nextControllerClass;
- (NSString)title;
- (UIAlertController)alertController;
- (UIImage)icon;
- (UIViewController)choiceController;
- (id)condition;
- (id)confirmationAcceptActionWithTitle:(id)a3 style:(int64_t)a4 action:(id)a5;
- (id)confirmationCancelActionWithTitle:(id)a3 style:(int64_t)a4 action:(id)a5;
- (id)confirmationCompletion;
- (void)_choiceConfirmed:(BOOL)a3;
- (void)runConfirmationIfNeededCompletion:(id)a3;
- (void)setAlertController:(id)a3;
- (void)setChoiceController:(id)a3;
- (void)setCondition:(id)a3;
- (void)setConfirmationAlert:(id)a3 condition:(id)a4;
- (void)setConfirmationCompletion:(id)a3;
- (void)setIcon:(id)a3;
- (void)setNextControllerClass:(Class)a3;
- (void)setTitle:(id)a3;
@end

@implementation BuddyChoice

- (BuddyChoice)initWithTitle:(id)a3 nextItemClass:(Class)a4
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  Class v9 = a4;
  id v5 = v11;
  id v11 = 0;
  v8.receiver = v5;
  v8.super_class = (Class)BuddyChoice;
  id v11 = [(BuddyChoice *)&v8 init];
  objc_storeStrong(&v11, v11);
  if (v11)
  {
    [v11 setTitle:location[0]];
    [v11 setNextControllerClass:v9];
  }
  v6 = (BuddyChoice *)v11;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v11, 0);
  return v6;
}

- (id)confirmationAcceptActionWithTitle:(id)a3 style:(int64_t)a4 action:(id)a5
{
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v20 = a4;
  id v19 = 0;
  objc_storeStrong(&v19, a5);
  objc_initWeak(&from, v22);
  id v7 = location[0];
  int64_t v8 = v20;
  id v11 = _NSConcreteStackBlock;
  int v12 = -1073741824;
  int v13 = 0;
  v14 = sub_1000EBE3C;
  v15 = &unk_1002B2C78;
  id v16 = v19;
  objc_copyWeak(&v17, &from);
  Class v9 = +[UIAlertAction actionWithTitle:v7 style:v8 handler:&v11];
  objc_destroyWeak(&v17);
  objc_storeStrong(&v16, 0);
  objc_destroyWeak(&from);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);

  return v9;
}

- (id)confirmationCancelActionWithTitle:(id)a3 style:(int64_t)a4 action:(id)a5
{
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v20 = a4;
  id v19 = 0;
  objc_storeStrong(&v19, a5);
  objc_initWeak(&from, v22);
  id v7 = location[0];
  int64_t v8 = v20;
  id v11 = _NSConcreteStackBlock;
  int v12 = -1073741824;
  int v13 = 0;
  v14 = sub_1000EC038;
  v15 = &unk_1002B2C78;
  id v16 = v19;
  objc_copyWeak(&v17, &from);
  Class v9 = +[UIAlertAction actionWithTitle:v7 style:v8 handler:&v11];
  objc_destroyWeak(&v17);
  objc_storeStrong(&v16, 0);
  objc_destroyWeak(&from);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);

  return v9;
}

- (void)setConfirmationAlert:(id)a3 condition:(id)a4
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  [(BuddyChoice *)v7 setCondition:v5];
  [(BuddyChoice *)v7 setAlertController:location[0]];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)runConfirmationIfNeededCompletion:(id)a3
{
  int v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(BuddyChoice *)v12 alertController];
  char v9 = 0;
  char v7 = 0;
  char v4 = 0;
  if (v3)
  {
    id v10 = [(BuddyChoice *)v12 condition];
    char v9 = 1;
    char v4 = 1;
    if (v10)
    {
      int64_t v8 = (uint64_t (**)(void))[(BuddyChoice *)v12 condition];
      char v7 = 1;
      char v4 = v8[2]();
    }
  }
  if (v7) {

  }
  if (v9) {
  if (v4)
  }
  {
    [(BuddyChoice *)v12 setConfirmationCompletion:location[0]];
    id v5 = [(BuddyChoice *)v12 choiceController];
    v6 = [(BuddyChoice *)v12 alertController];
    [(UIViewController *)v5 presentViewController:v6 animated:1 completion:0];
  }
  else if (location[0])
  {
    (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
  }
  objc_storeStrong(location, 0);
}

- (void)_choiceConfirmed:(BOOL)a3
{
  id v3 = [(BuddyChoice *)self confirmationCompletion];

  if (v3)
  {
    char v4 = (void (**)(id, BOOL))[(BuddyChoice *)self confirmationCompletion];
    v4[2](v4, a3);

    [(BuddyChoice *)self setConfirmationCompletion:0];
  }
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (Class)nextControllerClass
{
  return self->_nextControllerClass;
}

- (void)setNextControllerClass:(Class)a3
{
}

- (UIViewController)choiceController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_choiceController);

  return (UIViewController *)WeakRetained;
}

- (void)setChoiceController:(id)a3
{
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (id)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
}

- (id)confirmationCompletion
{
  return self->_confirmationCompletion;
}

- (void)setConfirmationCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end