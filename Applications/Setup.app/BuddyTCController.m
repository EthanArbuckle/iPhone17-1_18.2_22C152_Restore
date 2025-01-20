@interface BuddyTCController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BOOL)controllerAllowsNavigatingBack;
- (BOOL)includeWarranty;
- (BOOL)shouldPresentModally;
- (BuddyTCController)init;
- (BuddyWarrantyTCController)warrantyTermsController;
- (BuddyiOSTCController)iOSTermsController;
- (RUIObjectModel)objectModel;
- (id)multiTermsController;
- (id)parentViewControllerForObjectModel:(id)a3;
- (id)viewController;
- (void)buddyTCSubController:(id)a3 didFinishWithAgree:(BOOL)a4;
- (void)loader:(id)a3 didFailWithError:(id)a4;
- (void)loader:(id)a3 receivedObjectModel:(id)a4 actionSignal:(unint64_t)a5;
- (void)objectModel:(id)a3 didNavigateBackFromController:(id)a4 withGesture:(BOOL)a5;
- (void)objectModel:(id)a3 pressedButton:(id)a4 attributes:(id)a5;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIOSTermsController:(id)a3;
- (void)setIncludeWarranty:(BOOL)a3;
- (void)setObjectModel:(id)a3;
- (void)setWarrantyTermsController:(id)a3;
@end

@implementation BuddyTCController

- (BuddyTCController)init
{
  SEL v6 = a2;
  id location = 0;
  v5.receiver = self;
  v5.super_class = (Class)BuddyTCController;
  id location = [(BuddyTCController *)&v5 init];
  objc_storeStrong(&location, location);
  if (location)
  {
    unsigned __int8 v2 = +[BYWarranty shouldDisplay];
    *((unsigned char *)location + 8) = v2 & 1;
  }
  v3 = (BuddyTCController *)location;
  objc_storeStrong(&location, 0);
  return v3;
}

- (BuddyiOSTCController)iOSTermsController
{
  if (!self->_iOSTermsController)
  {
    unsigned __int8 v2 = objc_alloc_init(BuddyiOSTCController);
    iOSTermsController = self->_iOSTermsController;
    self->_iOSTermsController = v2;

    -[BuddySimpleTCController setTermsAndConditionsDelegate:](self->_iOSTermsController, "setTermsAndConditionsDelegate:", self, a2);
  }
  v4 = self->_iOSTermsController;

  return v4;
}

- (BuddyWarrantyTCController)warrantyTermsController
{
  if (!self->_warrantyTermsController)
  {
    unsigned __int8 v2 = objc_alloc_init(BuddyWarrantyTCController);
    warrantyTermsController = self->_warrantyTermsController;
    self->_warrantyTermsController = v2;

    -[BuddySimpleTCController setTermsAndConditionsDelegate:](self->_warrantyTermsController, "setTermsAndConditionsDelegate:", self, a2);
  }
  v4 = self->_warrantyTermsController;

  return v4;
}

- (id)multiTermsController
{
  unsigned __int8 v2 = [(BuddyTCController *)self objectModel];
  id v3 = [(RUIObjectModel *)v2 defaultPages];
  id v4 = [v3 count];

  if (v4)
  {
    objc_super v5 = [(BuddyTCController *)self objectModel];
    id v6 = [(RUIObjectModel *)v5 defaultPages];
    id v9 = [v6 objectAtIndex:0];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupTOS;
}

+ (unint64_t)applicableDispositions
{
  return 28;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v38 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([(BuddyTCController *)v38 includeWarranty])
  {
    id v3 = +[NSBundle mainBundle];
    id v36 = [(NSBundle *)v3 pathForResource:@"multiterms" ofType:@"xml"];

    id v35 = +[NSString stringWithContentsOfFile:v36 encoding:4 error:0];
    id v34 = 0;
    id v33 = 0;
    v24 = +[NSBundle mainBundle];
    id v4 = [(NSBundle *)v24 localizedStringForKey:@"TERMS_AND_CONDITIONS" value:&stru_1002B4E18 table:@"Localizable"];
    v23 = +[NSBundle mainBundle];
    objc_super v5 = [(NSBundle *)v23 localizedStringForKey:@"AGREE" value:&stru_1002B4E18 table:@"Localizable"];
    v22 = +[NSBundle mainBundle];
    v19 = [(NSBundle *)v22 localizedStringForKey:@"DISAGREE" value:&stru_1002B4E18 table:@"Localizable"];
    v21 = +[NSBundle mainBundle];
    id v6 = [(NSBundle *)v21 localizedStringForKey:@"IMPORTANT" value:&stru_1002B4E18 table:@"Localizable"];
    id v7 = (id)SFLocalizedMultipickerStringForKey();
    v20 = +[NSBundle mainBundle];
    v8 = [(NSBundle *)v20 localizedStringForKey:@"TC_HEADER" value:&stru_1002B4E18 table:@"Localizable"];
    id v9 = +[NSBundle mainBundle];
    v10 = [(NSBundle *)v9 localizedStringForKey:@"WARRANTY_HEADER" value:&stru_1002B4E18 table:@"Localizable"];
    id v11 = (id)SFLocalizedMultipickerStringForKey();
    id v12 = (id)SFLocalizedMultipickerStringForKey();
    v13 = v4;
    v14 = +[NSString stringWithValidatedFormat:v35, @"%@%@%@%@%@%@%@%@%@", &v33, v4, v5, v19, v6, v7, v8, v10, v11, v12 validFormatSpecifiers error];
    objc_storeStrong(&v34, v33);
    id v15 = v35;
    id v35 = v14;

    if (!v35)
    {
      id v32 = (id)_BYLoggingFacility();
      os_log_type_t v31 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
      {
        char v29 = 0;
        char v27 = 0;
        if (_BYIsInternalInstall())
        {
          v16 = (NSString *)v34;
        }
        else if (v34)
        {
          id v30 = [v34 domain];
          char v29 = 1;
          v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v30, [v34 code]);
          id v28 = v16;
          char v27 = 1;
        }
        else
        {
          v16 = 0;
        }
        sub_10004BB7C((uint64_t)buf, (uint64_t)v16);
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v32, v31, "Failed to load/format terms strings: %{public}@", buf, 0xCu);
        if (v27) {

        }
        if (v29) {
      }
        }
      objc_storeStrong(&v32, 0);
    }
    id v26 = [v35 dataUsingEncoding:4];
    if ([v26 length])
    {
      id v25 = objc_alloc_init((Class)RUILoader);
      [v25 setDelegate:v38];
      v17 = +[NSBundle mainBundle];
      v18 = [(NSBundle *)v17 resourceURL];
      [v25 loadXMLUIWithData:v26 baseURL:v18];

      objc_storeStrong(&v25, 0);
    }
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v34, 0);
    objc_storeStrong(&v35, 0);
    objc_storeStrong(&v36, 0);
  }
  if (location[0]) {
    (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
  }
  objc_storeStrong(location, 0);
}

- (id)viewController
{
  objc_super v5 = self;
  location[1] = (id)a2;
  location[0] = [(BuddyTCController *)self multiTermsController];
  if (location[0]) {
    id v6 = (BuddyiOSTCController *)location[0];
  }
  else {
    id v6 = [(BuddyTCController *)v5 iOSTermsController];
  }
  objc_storeStrong(location, 0);
  unsigned __int8 v2 = v6;

  return v2;
}

- (BOOL)controllerAllowsNavigatingBack
{
  return 0;
}

- (BOOL)shouldPresentModally
{
  return 1;
}

- (void)loader:(id)a3 receivedObjectModel:(id)a4 actionSignal:(unint64_t)a5
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  id v6 = [v14 defaultPages];
  id v7 = [v6 count];

  if (v7)
  {
    [(BuddyTCController *)v16 setObjectModel:v14];
    v8 = v16;
    id v9 = [(BuddyTCController *)v16 objectModel];
    [(RUIObjectModel *)v9 setDelegate:v8];

    id v10 = [v14 defaultPages];
    id v11 = [v10 objectAtIndex:0];
    id v12 = [v11 navigationItem];
    [v12 setHidesBackButton:1];

    id v13 = +[RUIStyle setupAssistantStyle];
    [v13 applyToObjectModel:v14];
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)loader:(id)a3 didFailWithError:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (id)parentViewControllerForObjectModel:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 0;
}

- (void)objectModel:(id)a3 didNavigateBackFromController:(id)a4 withGesture:(BOOL)a5
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)objectModel:(id)a3 pressedButton:(id)a4 attributes:(id)a5
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  id v14 = 0;
  objc_storeStrong(&v14, a5);
  id v13 = [(BuddyTCController *)v17 multiTermsController];
  if ([v15 isEqualToString:@"agree"])
  {
    [(BuddyTCController *)v17 buddyTCSubController:v13 didFinishWithAgree:1];
  }
  else if ([v15 isEqualToString:@"disagree"])
  {
    [(BuddyTCController *)v17 buddyTCSubController:v13 didFinishWithAgree:0];
  }
  else if ([v15 isEqualToString:@"iOSTerms"])
  {
    id v12 = [(BuddyTCController *)v17 iOSTermsController];
    id v7 = [v12 navigationItem];
    [v7 setHidesBackButton:0];

    id v8 = [v13 navigationController];
    [v8 pushViewController:v12 animated:1];

    objc_storeStrong(&v12, 0);
  }
  else if ([v15 isEqualToString:@"iOSWarranty"])
  {
    id v11 = [(BuddyTCController *)v17 warrantyTermsController];
    id v9 = [(BuddyWarrantyTCController *)v11 navigationItem];
    [v9 setHidesBackButton:0];

    id v10 = [v13 navigationController];
    [v10 pushViewController:v11 animated:1];

    objc_storeStrong((id *)&v11, 0);
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

- (void)buddyTCSubController:(id)a3 didFinishWithAgree:(BOOL)a4
{
  v41 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v39 = a4;
  if (a4)
  {
    id v5 = +[NSBundle mainBundle];
    id v6 = [(NSBundle *)v5 localizedStringForKey:@"AGREE_DIALOG_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
    id v7 = +[NSBundle mainBundle];
    id v8 = [(NSBundle *)v7 localizedStringForKey:@"AGREE_DIALOG_TEXT" value:&stru_1002B4E18 table:@"Localizable"];
    id v38 = +[UIAlertController alertControllerWithTitle:v6 message:v8 preferredStyle:1];

    id v9 = +[NSBundle mainBundle];
    id v10 = [(NSBundle *)v9 localizedStringForKey:@"CANCEL" value:&stru_1002B4E18 table:@"Localizable"];
    id v11 = +[UIAlertAction actionWithTitle:v10 style:1 handler:0];
    [v38 addAction:v11];

    id v12 = v38;
    id v13 = +[NSBundle mainBundle];
    id v14 = [(NSBundle *)v13 localizedStringForKey:@"AGREE" value:&stru_1002B4E18 table:@"Localizable"];
    os_log_type_t v31 = _NSConcreteStackBlock;
    int v32 = -1073741824;
    int v33 = 0;
    id v34 = sub_1001A1178;
    id v35 = &unk_1002B1068;
    id v36 = v41;
    id v37 = location[0];
    id v15 = +[UIAlertAction actionWithTitle:v14 style:0 handler:&v31];
    [v12 addAction:v15];

    [location[0] presentViewController:v38 animated:1 completion:0];
    objc_storeStrong(&v37, 0);
    objc_storeStrong((id *)&v36, 0);
    objc_storeStrong(&v38, 0);
  }
  else
  {
    id v30 = [location[0] navigationController];
    id v29 = [v30 viewControllers];
    if ([v29 count] == (id)1)
    {
      v16 = [(BuddyTCController *)v41 delegate];
      [(BFFFlowItemDelegate *)v16 flowItemCancelled:v41];
    }
    else
    {
      id v28 = 0;
      for (i = (char *)[v29 count] - 1; i; --i)
      {
        id v17 = [v29 objectAtIndex:i];
        id v18 = v28;
        id v28 = v17;

        v19 = [(BuddyTCController *)v41 warrantyTermsController];
        char v25 = 0;
        char v23 = 0;
        BOOL v20 = 0;
        if (v28 != v19)
        {
          id v26 = [(BuddyTCController *)v41 iOSTermsController];
          char v25 = 1;
          BOOL v20 = 0;
          if (v28 != v26)
          {
            id v24 = [(BuddyTCController *)v41 multiTermsController];
            char v23 = 1;
            BOOL v20 = v28 != v24;
          }
        }
        if (v23) {

        }
        if (v25) {
        if (v20)
        }
          break;
      }
      id v21 = [v29 objectAtIndex:i];
      id v22 = [v30 popToViewController:v21 animated:1];

      objc_storeStrong(&v28, 0);
    }
    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v30, 0);
  }
  objc_storeStrong(location, 0);
}

- (BOOL)includeWarranty
{
  return self->_includeWarranty;
}

- (void)setIncludeWarranty:(BOOL)a3
{
  self->_includeWarranty = a3;
}

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RUIObjectModel)objectModel
{
  return self->_objectModel;
}

- (void)setObjectModel:(id)a3
{
}

- (void)setIOSTermsController:(id)a3
{
}

- (void)setWarrantyTermsController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end