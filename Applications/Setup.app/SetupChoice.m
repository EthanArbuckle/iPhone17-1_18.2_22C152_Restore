@interface SetupChoice
- (Class)nextControllerClass;
- (NSString)localizedTitle;
- (SetupChoice)initWithChoiceID:(id)a3 title:(id)a4 nextItemClass:(Class)a5;
- (SetupChoiceController)choiceController;
- (UIAlertController)alertController;
- (id)condition;
- (id)confirmationAcceptActionWithTitle:(id)a3 style:(int64_t)a4 action:(id)a5;
- (id)confirmationCancelActionWithTitle:(id)a3 style:(int64_t)a4 action:(id)a5;
- (id)identifier;
- (void)runConfirmationIfNeeded;
- (void)setAlertController:(id)a3;
- (void)setChoiceController:(id)a3;
- (void)setCondition:(id)a3;
- (void)setConfirmationAlert:(id)a3 condition:(id)a4;
- (void)setIdentifier:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setNextControllerClass:(Class)a3;
@end

@implementation SetupChoice

- (SetupChoice)initWithChoiceID:(id)a3 title:(id)a4 nextItemClass:(Class)a5
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  Class v11 = a5;
  id v7 = v14;
  id v14 = 0;
  v10.receiver = v7;
  v10.super_class = (Class)SetupChoice;
  id v14 = [(SetupChoice *)&v10 init];
  objc_storeStrong(&v14, v14);
  if (v14)
  {
    [v14 setLocalizedTitle:v12];
    [v14 setNextControllerClass:v11];
    [v14 setIdentifier:location[0]];
  }
  v8 = (SetupChoice *)v14;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v14, 0);
  return v8;
}

- (id)confirmationAcceptActionWithTitle:(id)a3 style:(int64_t)a4 action:(id)a5
{
  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v21 = a4;
  id v20 = 0;
  objc_storeStrong(&v20, a5);
  objc_initWeak(&from, v23);
  id v7 = location[0];
  int64_t v8 = v21;
  Class v11 = _NSConcreteStackBlock;
  int v12 = -1073741824;
  int v13 = 0;
  id v14 = sub_1000C94B4;
  v15 = &unk_1002B27B8;
  id v17 = v20;
  objc_copyWeak(&v18, &from);
  v16 = v23;
  v9 = +[UIAlertAction actionWithTitle:v7 style:v8 handler:&v11];
  objc_storeStrong((id *)&v16, 0);
  objc_destroyWeak(&v18);
  objc_storeStrong(&v17, 0);
  objc_destroyWeak(&from);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);

  return v9;
}

- (id)confirmationCancelActionWithTitle:(id)a3 style:(int64_t)a4 action:(id)a5
{
  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v21 = a4;
  id v20 = 0;
  objc_storeStrong(&v20, a5);
  objc_initWeak(&from, v23);
  id v7 = location[0];
  int64_t v8 = v21;
  Class v11 = _NSConcreteStackBlock;
  int v12 = -1073741824;
  int v13 = 0;
  id v14 = sub_1000C96EC;
  v15 = &unk_1002B27B8;
  id v17 = v20;
  objc_copyWeak(&v18, &from);
  v16 = v23;
  v9 = +[UIAlertAction actionWithTitle:v7 style:v8 handler:&v11];
  objc_storeStrong((id *)&v16, 0);
  objc_destroyWeak(&v18);
  objc_storeStrong(&v17, 0);
  objc_destroyWeak(&from);
  objc_storeStrong(&v20, 0);
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
  [(SetupChoice *)v7 setCondition:v5];
  [(SetupChoice *)v7 setAlertController:location[0]];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)runConfirmationIfNeeded
{
  v2 = [(SetupChoice *)self alertController];
  char v8 = 0;
  char v6 = 0;
  char v3 = 0;
  if (v2)
  {
    id v9 = [(SetupChoice *)self condition];
    char v8 = 1;
    char v3 = 1;
    if (v9)
    {
      id v7 = (uint64_t (**)(void))[(SetupChoice *)self condition];
      char v6 = 1;
      char v3 = v7[2]();
    }
  }
  if (v6) {

  }
  if (v8) {
  v4 = [(SetupChoice *)self choiceController];
  }
  if (v3)
  {
    id v5 = [(SetupChoice *)self alertController];
    [(SetupChoiceController *)v4 presentViewController:v5 animated:1 completion:0];
  }
  else
  {
    [(SetupChoiceController *)v4 choiceConfirmed:self];
  }
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (Class)nextControllerClass
{
  return self->_nextControllerClass;
}

- (void)setNextControllerClass:(Class)a3
{
}

- (id)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
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

- (SetupChoiceController)choiceController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_choiceController);

  return (SetupChoiceController *)WeakRetained;
}

- (void)setChoiceController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end