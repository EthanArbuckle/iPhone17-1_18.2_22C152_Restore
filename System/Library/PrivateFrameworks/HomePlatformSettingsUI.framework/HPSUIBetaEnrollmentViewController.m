@interface HPSUIBetaEnrollmentViewController
+ (void)shouldShowBetaEnrollmentButtonForHomeID:(id)a3 homeKitIdentifiers:(id)a4 withCompletion:(id)a5;
+ (void)shouldShowBetaEnrollmentButtonForHomeID:(id)a3 withCompletion:(id)a4;
- (HPSUIBetaEnrollmentViewController)initWithCoder:(id)a3;
- (HPSUIBetaEnrollmentViewController)initWithHomeID:(id)a3;
- (HPSUIBetaEnrollmentViewController)initWithHomeID:(id)a3 homeKitIdentifiers:(id)a4;
- (NSString)homeID;
- (_HPSUIBetaEnrollmentViewController)internalVC;
- (void)configureInternalVC;
- (void)encodeWithCoder:(id)a3;
- (void)setBackgroundColorIfNeeded;
- (void)setHomeID:(id)a3;
- (void)setInternalVC:(id)a3;
- (void)viewDidLoad;
@end

@implementation HPSUIBetaEnrollmentViewController

+ (void)shouldShowBetaEnrollmentButtonForHomeID:(id)a3 withCompletion:(id)a4
{
}

+ (void)shouldShowBetaEnrollmentButtonForHomeID:(id)a3 homeKitIdentifiers:(id)a4 withCompletion:(id)a5
{
}

- (HPSUIBetaEnrollmentViewController)initWithHomeID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HPSUIBetaEnrollmentViewController;
  v5 = [(HPSUIBetaEnrollmentViewController *)&v9 initWithNibName:0 bundle:0];
  if (v5)
  {
    v6 = [[_HPSUIBetaEnrollmentViewController alloc] initWithHomeID:v4];
    [(HPSUIBetaEnrollmentViewController *)v5 setInternalVC:v6];

    v7 = v5;
  }

  return v5;
}

- (HPSUIBetaEnrollmentViewController)initWithHomeID:(id)a3 homeKitIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HPSUIBetaEnrollmentViewController;
  v8 = [(HPSUIBetaEnrollmentViewController *)&v12 initWithNibName:0 bundle:0];
  if (v8)
  {
    objc_super v9 = [[_HPSUIBetaEnrollmentViewController alloc] initWithHomeID:v6 homeKitIdentifiers:v7];
    [(HPSUIBetaEnrollmentViewController *)v8 setInternalVC:v9];

    v10 = v8;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(HPSUIBetaEnrollmentViewController *)self homeID];
  if (v4) {
    [v5 encodeObject:v4 forKey:@"hid"];
  }
}

- (HPSUIBetaEnrollmentViewController)initWithCoder:(id)a3
{
  id v4 = [a3 decodeObjectForKey:@"hid"];
  if (v4)
  {
    self = [(HPSUIBetaEnrollmentViewController *)self initWithHomeID:v4];
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
  uint64_t v3 = [(HPSUIBetaEnrollmentViewController *)self internalVC];
  if (v3) {
    [(UIViewController *)self wrapWithSubViewController:v3];
  }
  MEMORY[0x270F9A758]();
}

- (void)setBackgroundColorIfNeeded
{
  uint64_t v3 = [(HPSUIBetaEnrollmentViewController *)self parentViewController];
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
          objc_super v12 = [(HPSUIBetaEnrollmentViewController *)self view];
          [v12 setBackgroundColor:v11];
        }
      }
    }
  }
  MEMORY[0x270F9A758]();
}

- (void)viewDidLoad
{
  [(HPSUIBetaEnrollmentViewController *)self setBackgroundColorIfNeeded];
  [(HPSUIBetaEnrollmentViewController *)self configureInternalVC];
  uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"HOMEPOD_BETA_UPDATES" value:0 table:0];
  [(HPSUIBetaEnrollmentViewController *)self setTitle:v4];
  v5.receiver = self;
  v5.super_class = (Class)HPSUIBetaEnrollmentViewController;
  [(HPSUIBetaEnrollmentViewController *)&v5 viewDidLoad];
}

- (NSString)homeID
{
  return self->_homeID;
}

- (void)setHomeID:(id)a3
{
}

- (_HPSUIBetaEnrollmentViewController)internalVC
{
  return self->_internalVC;
}

- (void)setInternalVC:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalVC, 0);
  objc_storeStrong((id *)&self->_homeID, 0);
}

@end