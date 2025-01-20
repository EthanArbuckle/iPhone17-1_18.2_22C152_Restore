@interface DDAddToContactsViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
+ (id)alternateNameForContact:(id)a3;
- (CGSize)preferredContentSize;
- (DDAction)action;
- (void)adaptForPresentationInPopover:(BOOL)a3;
- (void)cancelPressed:(id)a3;
- (void)contactViewControllerForUnknownContactDidBeginAddingToContacts:(id)a3;
- (void)contactViewControllerForUnknownContactDidEndAddingToContacts:(id)a3;
- (void)doneWithAddingContactShouldDismiss:(BOOL)a3;
- (void)prepareForAction:(id)a3;
- (void)setAction:(id)a3;
- (void)setCancelButtonVisible:(BOOL)a3;
- (void)setCancellable:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation DDAddToContactsViewController

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___DDRemoteActionPresenter, a2, a1);
}

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___DDRemoteActionViewService, a2, a1);
}

- (CGSize)preferredContentSize
{
  sub_100011D40();
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)prepareForAction:(id)a3
{
  v50 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v48 = objc_alloc_init((Class)CNMutableContact);
  id v47 = 0;
  [(DDAddToContactsViewController *)v50 setAction:location[0]];
  id v46 = &_os_log_default;
  os_log_type_t v45 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_DEBUG))
  {
    sub_10000A468((uint64_t)v53, (uint64_t)location[0]);
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v46, v45, "Preparing a view controller for the action %@", v53, 0xCu);
  }
  objc_storeStrong(&v46, 0);
  id v27 = [location[0] contact];

  if (v27)
  {
    id v26 = [location[0] contact];
    id v3 = [v26 mutableCopy];
    id v4 = v48;
    id v48 = v3;

    if ([location[0] result])
    {
      v5 = sub_100012478((uint64_t)[location[0] result]);
      id v6 = v47;
      id v47 = v5;
    }
  }
  else if ([location[0] result])
  {
    DDAugmentContactWithResultsFromAction();
    v7 = sub_100012478((uint64_t)[location[0] result]);
    id v8 = v47;
    id v47 = v7;
  }
  else
  {
    id v24 = [location[0] url];
    id v23 = [v24 scheme];
    id v22 = [v23 lowercaseString];
    unsigned __int8 v25 = [v22 isEqualToString:@"mailto"];

    if (v25)
    {
      id v44 = &_os_log_default;
      char v43 = 16;
      if (os_log_type_enabled((os_log_t)v44, OS_LOG_TYPE_ERROR))
      {
        v20 = v44;
        os_log_type_t v21 = v43;
        sub_100005458(v42);
        _os_log_error_impl((void *)&_mh_execute_header, v20, v21, "Data Detectors BUG (or use of deprecated methods): should have a result. Will fallback to the URL for now", v42, 2u);
      }
      objc_storeStrong(&v44, 0);
      id v19 = [location[0] url];
      id v18 = [v19 dd_emailFromMailtoScheme];
      id v41 = [v18 dd_userFriendlyEmail];

      if (v41)
      {
        id v40 = +[CNLabeledValue labeledValueWithLabel:0 value:v41];
        if (v40)
        {
          id v52 = v40;
          v17 = +[NSArray arrayWithObjects:&v52 count:1];
          [v48 setEmailAddresses:];

          objc_storeStrong(&v47, CNContactEmailAddressesKey);
        }
        objc_storeStrong(&v40, 0);
      }
      objc_storeStrong(&v41, 0);
    }
    else
    {
      id v15 = [location[0] url];
      unsigned __int8 v16 = [v15 dd_isAnySimpleTelephonyScheme];

      if (v16)
      {
        id v14 = [location[0] url];
        id v13 = [v14 dd_phoneNumberFromTelScheme];
        id v39 = (id)DDPhoneLabeledValue();

        if (v39)
        {
          id v51 = v39;
          v12 = +[NSArray arrayWithObjects:&v51 count:1];
          [v48 setPhoneNumbers:];

          objc_storeStrong(&v47, CNContactPhoneNumbersKey);
        }
        objc_storeStrong(&v39, 0);
      }
      else
      {
        id v38 = &_os_log_default;
        char v37 = 16;
        if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_ERROR))
        {
          v10 = v38;
          os_log_type_t v11 = v37;
          sub_100005458(v36);
          _os_log_error_impl((void *)&_mh_execute_header, v10, v11, "Unknown scheme", v36, 2u);
        }
        objc_storeStrong(&v38, 0);
      }
    }
  }
  dispatch_queue_t queue = &_dispatch_main_q;
  v28 = _NSConcreteStackBlock;
  int v29 = -1073741824;
  int v30 = 0;
  v31 = sub_1000126CC;
  v32 = &unk_100020650;
  id v33 = v48;
  v34 = v50;
  id v35 = v47;
  dispatch_async(queue, &v28);

  objc_storeStrong(&v35, 0);
  objc_storeStrong((id *)&v34, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(location, 0);
}

+ (id)alternateNameForContact:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = [location[0] emailAddresses];
  BOOL v9 = [v8 count] != 0;

  BOOL v17 = v9;
  if (v9)
  {
    id v7 = [location[0] emailAddresses];
    id v16 = [v7 objectAtIndex:0];

    id v19 = [v16 value];
    objc_storeStrong(&v16, 0);
  }
  else
  {
    id v5 = [location[0] familyName];
    char v14 = 0;
    char v12 = 0;
    char v10 = 0;
    BOOL v6 = 0;
    if (![v5 length])
    {
      id v15 = [location[0] givenName];
      char v14 = 1;
      BOOL v6 = 0;
      if (![v15 length])
      {
        id v13 = [location[0] nickname];
        char v12 = 1;
        BOOL v6 = 0;
        if (![v13 length])
        {
          id v11 = [location[0] organizationName];
          char v10 = 1;
          BOOL v6 = [v11 length] == 0;
        }
      }
    }
    if (v10) {

    }
    if (v12) {
    if (v14)
    }

    if (v6) {
      id v19 = (id)DDLocalizedString();
    }
    else {
      id v19 = 0;
    }
  }
  objc_storeStrong(location, 0);
  id v3 = v19;

  return v3;
}

- (void)setCancelButtonVisible:(BOOL)a3
{
  if (a3)
  {
    id v7 = [(CNContactViewController *)self->_personViewController navigationItem];
    id v3 = [v7 rightBarButtonItem];
    BOOL v8 = v3 != 0;

    if (!v8)
    {
      id v6 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"cancelPressed:"];
      id v5 = [(CNContactViewController *)self->_personViewController navigationItem];
      [v5 setRightBarButtonItem:v6];
    }
  }
  else
  {
    id v4 = [(CNContactViewController *)self->_personViewController navigationItem];
    [v4 setRightBarButtonItem:0];
  }
}

- (void)adaptForPresentationInPopover:(BOOL)a3
{
}

- (void)doneWithAddingContactShouldDismiss:(BOOL)a3
{
  BOOL v4 = a3;
  id v3 = [(DDAddToContactsViewController *)self _remoteViewControllerProxy];
  [v3 actionDidFinishShouldDismiss:v4];

  [(DDAddToContactsViewController *)self setCancellable:1];
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a4);
  v16.receiver = v19;
  v16.super_class = (Class)DDAddToContactsViewController;
  [(DDAddToContactsViewController *)&v16 willTransitionToTraitCollection:location[0] withTransitionCoordinator:v17];
  id v6 = [location[0] verticalSizeClass];
  id v7 = [(DDAddToContactsViewController *)v19 traitCollection];
  BOOL v8 = v6 == [v7 verticalSizeClass];

  if (!v8)
  {
    id v4 = v17;
    BOOL v9 = _NSConcreteStackBlock;
    int v10 = -1073741824;
    int v11 = 0;
    char v12 = sub_1000133EC;
    id v13 = &unk_100020880;
    id v14 = location[0];
    id v15 = v17;
    [v4 animateAlongsideTransition:&v9];
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  if (!self->_contactBeingAdded) {
    [(DDAddToContactsViewController *)v6 doneWithAddingContactShouldDismiss:0];
  }
  v3.receiver = v6;
  v3.super_class = (Class)DDAddToContactsViewController;
  [(DDAddToContactsViewController *)&v3 viewDidDisappear:v4];
}

- (void)cancelPressed:(id)a3
{
  BOOL v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!v4->_contactBeingAdded) {
    [(DDAddToContactsViewController *)v4 doneWithAddingContactShouldDismiss:1];
  }
  objc_storeStrong(location, 0);
}

- (void)setCancellable:(BOOL)a3
{
  BOOL v4 = a3;
  id v3 = [(DDAddToContactsViewController *)self _remoteViewControllerProxy];
  [v3 actionCanBeCancelledExternally:v4];
}

- (void)contactViewControllerForUnknownContactDidBeginAddingToContacts:(id)a3
{
  BOOL v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4->_contactBeingAdded = 1;
  [(DDAddToContactsViewController *)v4 setCancellable:0];
  objc_storeStrong(location, 0);
}

- (void)contactViewControllerForUnknownContactDidEndAddingToContacts:(id)a3
{
  BOOL v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4->_contactBeingAdded = 0;
  [(DDAddToContactsViewController *)v4 setCancellable:1];
  objc_storeStrong(location, 0);
}

- (DDAction)action
{
  return (DDAction *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end