@interface BuddyChoiceController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (NSArray)choices;
- (void)_tappedChoice:(id)a3;
- (void)didSelectChoice:(id)a3;
- (void)setChoices:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation BuddyChoiceController

+ (id)cloudConfigSkipKey
{
  id v7 = a1;
  SEL aSelector = a2;
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v4 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id location = NSStringFromSelector(aSelector);
    sub_10004B238((uint64_t)buf, (uint64_t)location);
    _os_log_impl((void *)&_mh_execute_header, oslog, v4, "Subclasses must implement %@", buf, 0xCu);

    objc_storeStrong(&location, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  return 0;
}

+ (unint64_t)applicableDispositions
{
}

- (void)setChoices:(id)a3
{
  id val = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (*((id *)val + 2) != location[0])
  {
    long long v26 = 0u;
    long long v25 = 0u;
    long long v24 = 0u;
    long long v23 = 0u;
    id v3 = location[0];
    id v4 = [v3 countByEnumeratingWithState:&v23 objects:v30 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v24;
      do
      {
        for (unint64_t i = 0; i < (unint64_t)v4; ++i)
        {
          if (*(void *)v24 != v5) {
            objc_enumerationMutation(v3);
          }
          id v27 = *(id *)(*((void *)&v23 + 1) + 8 * i);
          [v27 setChoiceController:0];
        }
        id v4 = [v3 countByEnumeratingWithState:&v23 objects:v30 count:16];
      }
      while (v4);
    }

    [val removeAllButtons];
    objc_storeStrong((id *)val + 2, location[0]);
    objc_initWeak(&from, val);
    for (unint64_t j = 0; ; ++j)
    {
      unint64_t v7 = j;
      if (v7 >= (unint64_t)[*((id *)val + 2) count]) {
        break;
      }
      id v20 = [*((id *)val + 2) objectAtIndexedSubscript:j];
      [v20 setChoiceController:val];
      uint64_t v19 = 0;
      uint64_t v8 = 1;
      if (j) {
        uint64_t v8 = 2;
      }
      uint64_t v19 = v8;
      id v9 = val;
      id v10 = [v20 title];
      uint64_t v11 = v19;
      v12 = _NSConcreteStackBlock;
      int v13 = -1073741824;
      int v14 = 0;
      v15 = sub_1000ECB14;
      v16 = &unk_1002B1408;
      objc_copyWeak(&v18, &from);
      id v17 = v20;
      [v9 addButtonWithTitle:v10 style:v11 action:&v12];

      objc_storeStrong(&v17, 0);
      objc_destroyWeak(&v18);
      objc_storeStrong(&v20, 0);
    }
    objc_destroyWeak(&from);
  }
  objc_storeStrong(location, 0);
}

- (void)_tappedChoice:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = location[0];
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  unint64_t v7 = sub_1000ECC58;
  uint64_t v8 = &unk_1002B20E8;
  id v9 = v12;
  id v10 = location[0];
  [v3 runConfirmationIfNeededCompletion:&v4];
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)didSelectChoice:(id)a3
{
  int v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyChoiceController *)v5 delegate];
  -[BFFFlowItemDelegate flowItemDone:nextItemClass:](v3, "flowItemDone:nextItemClass:", v5, [location[0] nextControllerClass]);

  objc_storeStrong(location, 0);
}

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)choices
{
  return self->_choices;
}

- (void).cxx_destruct
{
}

@end