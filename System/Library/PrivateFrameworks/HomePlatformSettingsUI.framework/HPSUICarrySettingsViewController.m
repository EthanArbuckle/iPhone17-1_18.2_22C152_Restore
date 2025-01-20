@interface HPSUICarrySettingsViewController
+ (void)shouldShowCarrySettingsButtonForHomeID:(id)a3 homeKitIdentifiers:(id)a4 withCompletion:(id)a5;
+ (void)shouldShowCarrySettingsButtonForHomeID:(id)a3 withCompletion:(id)a4;
- (HPSUICarrySettingsViewController)initWithCoder:(id)a3;
- (HPSUICarrySettingsViewController)initWithHomeID:(id)a3;
- (HPSUICarrySettingsViewController)initWithHomeID:(id)a3 homeKitIdentifiers:(id)a4;
- (NSSet)identifiers;
- (NSString)homeID;
- (_HPSUICarrySettingsViewController)internalVC;
- (void)configureInternalVC;
- (void)encodeWithCoder:(id)a3;
- (void)setBackgroundColorIfNeeded;
- (void)setHomeID:(id)a3;
- (void)setIdentifiers:(id)a3;
- (void)setInternalVC:(id)a3;
- (void)viewDidLoad;
@end

@implementation HPSUICarrySettingsViewController

+ (void)shouldShowCarrySettingsButtonForHomeID:(id)a3 withCompletion:(id)a4
{
}

+ (void)shouldShowCarrySettingsButtonForHomeID:(id)a3 homeKitIdentifiers:(id)a4 withCompletion:(id)a5
{
}

- (HPSUICarrySettingsViewController)initWithHomeID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HPSUICarrySettingsViewController;
  v5 = [(HPSUICarrySettingsViewController *)&v9 initWithNibName:0 bundle:0];
  if (v5)
  {
    v6 = [[_HPSUICarrySettingsViewController alloc] initWithHomeID:v4];
    [(HPSUICarrySettingsViewController *)v5 setInternalVC:v6];

    v7 = v5;
  }

  return v5;
}

- (HPSUICarrySettingsViewController)initWithHomeID:(id)a3 homeKitIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HPSUICarrySettingsViewController;
  v8 = [(HPSUICarrySettingsViewController *)&v12 initWithNibName:0 bundle:0];
  if (v8)
  {
    objc_super v9 = [[_HPSUICarrySettingsViewController alloc] initWithHomeID:v6 homeKitIdentifiers:v7];
    [(HPSUICarrySettingsViewController *)v8 setInternalVC:v9];

    v10 = v8;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(HPSUICarrySettingsViewController *)self homeID];
  if (v4) {
    [v5 encodeObject:v4 forKey:@"hid"];
  }
}

- (HPSUICarrySettingsViewController)initWithCoder:(id)a3
{
  id v4 = [a3 decodeObjectForKey:@"hid"];
  if (v4)
  {
    self = [(HPSUICarrySettingsViewController *)self initWithHomeID:v4];
    id v5 = self;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)configureInternalVC
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  uint64_t v3 = [(HPSUICarrySettingsViewController *)self internalVC];
  if (v3) {
    [(UIViewController *)self wrapWithSubViewController:v3];
  }
  MEMORY[0x270F9A758]();
}

- (void)setBackgroundColorIfNeeded
{
  uint64_t v3 = [(HPSUICarrySettingsViewController *)self parentViewController];
  if (v3)
  {
    v13 = (void *)v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v13;
      id v5 = [v4 viewControllers];
      unint64_t v6 = [v5 count];

      unint64_t v7 = v6 - 2;
      if (v6 >= 2)
      {
        v8 = [v4 viewControllers];
        objc_super v9 = [v8 objectAtIndexedSubscript:v7];

        v10 = [v9 view];
        v11 = [v10 backgroundColor];

        if (v11)
        {
          objc_super v12 = [(HPSUICarrySettingsViewController *)self view];
          [v12 setBackgroundColor:v11];
        }
      }
    }
  }
  MEMORY[0x270F9A758]();
}

- (void)viewDidLoad
{
  [(HPSUICarrySettingsViewController *)self setBackgroundColorIfNeeded];
  [(HPSUICarrySettingsViewController *)self configureInternalVC];
  uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"HOMEPOD_INTERNAL_UPDATES" value:0 table:0];
  [(HPSUICarrySettingsViewController *)self setTitle:v4];
  v5.receiver = self;
  v5.super_class = (Class)HPSUICarrySettingsViewController;
  [(HPSUICarrySettingsViewController *)&v5 viewDidLoad];
}

- (NSString)homeID
{
  return self->_homeID;
}

- (void)setHomeID:(id)a3
{
}

- (NSSet)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
}

- (_HPSUICarrySettingsViewController)internalVC
{
  return self->_internalVC;
}

- (void)setInternalVC:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalVC, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_homeID, 0);
}

@end