@interface BuddyCloudConfigAboutConfigurationContainerController
+ (id)defaultParagraphTextAttributes;
- (BOOL)isSupervised;
- (BuddyCloudConfigAboutConfigurationContainerController)initWithNibName:(id)a3 bundle:(id)a4;
- (NSString)organizationAddress;
- (NSString)organizationAddressLine1;
- (NSString)organizationAddressLine2;
- (NSString)organizationCity;
- (NSString)organizationCountry;
- (NSString)organizationDepartment;
- (NSString)organizationName;
- (NSString)organizationRegion;
- (NSString)organizationSupportEmail;
- (NSString)organizationSupportPhone;
- (NSString)organizationZipCode;
- (UILabel)descriptionLabel;
- (UIScrollView)containerView;
- (id)_descriptionText;
- (void)controllerDone:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setIsSupervised:(BOOL)a3;
- (void)setOrganizationAddress:(id)a3;
- (void)setOrganizationAddressLine1:(id)a3;
- (void)setOrganizationAddressLine2:(id)a3;
- (void)setOrganizationCity:(id)a3;
- (void)setOrganizationCountry:(id)a3;
- (void)setOrganizationDepartment:(id)a3;
- (void)setOrganizationName:(id)a3;
- (void)setOrganizationRegion:(id)a3;
- (void)setOrganizationSupportEmail:(id)a3;
- (void)setOrganizationSupportPhone:(id)a3;
- (void)setOrganizationZipCode:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BuddyCloudConfigAboutConfigurationContainerController

+ (id)defaultParagraphTextAttributes
{
  v5 = (dispatch_once_t *)&unk_100321F20;
  id location = 0;
  objc_storeStrong(&location, &stru_1002B4988);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)qword_100321F18;

  return v2;
}

- (BuddyCloudConfigAboutConfigurationContainerController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v30 = 0;
  objc_storeStrong(&v30, a4);
  id v5 = v32;
  id v32 = 0;
  v29.receiver = v5;
  v29.super_class = (Class)BuddyCloudConfigAboutConfigurationContainerController;
  id v32 = [(BuddyCloudConfigAboutConfigurationContainerController *)&v29 initWithNibName:location[0] bundle:v30];
  objc_storeStrong(&v32, v32);
  if (v32)
  {
    id v6 = [objc_alloc((Class)UIScrollView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v7 = (void *)*((void *)v32 + 2);
    *((void *)v32 + 2) = v6;

    [*((id *)v32 + 2) setScrollEnabled:1];
    *(void *)&long long v27 = 0x404C800000000000;
    *((void *)&v27 + 1) = qword_100321F00;
    *(void *)&long long v28 = 0x404C800000000000;
    *((void *)&v28 + 1) = qword_100321F00;
    long long v26 = v28;
    long long v25 = v27;
    v8 = (void *)*((void *)v32 + 2);
    long long v24 = v28;
    long long v23 = v27;
    [v8 setContentInset:57.0, *(double *)&qword_100321F00, 57.0, *(double *)&qword_100321F00];
    [v32 setView:*((void *)v32 + 2)];
    id v9 = +[BFFStyle sharedStyle];
    id v10 = [v9 backgroundColor];
    [*((id *)v32 + 2) setBackgroundColor:v10];

    id v11 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v12 = (void *)*((void *)v32 + 3);
    *((void *)v32 + 3) = v11;

    id v13 = +[BFFStyle sharedStyle];
    [v13 applyThemeToLabel:*((void *)v32 + 3)];

    [*((id *)v32 + 3) setNumberOfLines:0];
    [*((id *)v32 + 3) setText:&stru_1002B4E18];
    id v22 = objc_alloc_init((Class)UIView);
    id v14 = +[BFFStyle sharedStyle];
    id v15 = [v14 backgroundColor];
    [v22 setBackgroundColor:v15];

    [v22 setAutoresizingMask:18];
    id v16 = [v32 view];
    [v16 insertSubview:*((void *)v32 + 3) atIndex:0];

    id v17 = [v32 view];
    [v17 insertSubview:v22 belowSubview:*((void *)v32 + 3)];

    v18 = +[NSBundle mainBundle];
    v19 = [(NSBundle *)v18 localizedStringForKey:@"REMOTE_MANAGEMENT_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
    [v32 setTitle:v19];

    objc_storeStrong(&v22, 0);
  }
  v20 = (BuddyCloudConfigAboutConfigurationContainerController *)v32;
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v32, 0);
  return v20;
}

- (void)viewDidLayoutSubviews
{
  id v22 = self;
  SEL v21 = a2;
  v20.receiver = self;
  v20.super_class = (Class)BuddyCloudConfigAboutConfigurationContainerController;
  [(BuddyCloudConfigAboutConfigurationContainerController *)&v20 viewDidLayoutSubviews];
  v2 = [(BuddyCloudConfigAboutConfigurationContainerController *)v22 containerView];
  [(UIScrollView *)v2 bounds];

  v3 = [(BuddyCloudConfigAboutConfigurationContainerController *)v22 descriptionLabel];
  sub_1001D3718();
  -[UILabel sizeThatFits:](v3, "sizeThatFits:", v4, v5);
  double v18 = v6;
  double v19 = v7;

  sub_1001D374C();
  double v15 = v8;
  double v14 = v9;
  double v17 = v10;
  double v16 = v11;
  v12 = [(BuddyCloudConfigAboutConfigurationContainerController *)v22 descriptionLabel];
  -[UILabel setFrame:](v12, "setFrame:", v14, v15, v16, v17);

  id v13 = [(BuddyCloudConfigAboutConfigurationContainerController *)v22 containerView];
  -[UIScrollView setContentSize:](v13, "setContentSize:", v18, v19, *(void *)&v18, *(void *)&v19);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BuddyCloudConfigAboutConfigurationContainerController;
  [(BuddyCloudConfigAboutConfigurationContainerController *)&v10 viewWillAppear:a3];
  id v3 = objc_alloc((Class)UIBarButtonItem);
  double v4 = +[NSBundle mainBundle];
  double v5 = [(NSBundle *)v4 localizedStringForKey:@"DONE" value:&stru_1002B4E18 table:@"Localizable"];
  id v9 = [v3 initWithTitle:v5 style:2 target:v13 action:"controllerDone:"];

  id v6 = [(BuddyCloudConfigAboutConfigurationContainerController *)v13 navigationItem];
  [v6 setRightBarButtonItem:v9];

  id v7 = [(BuddyCloudConfigAboutConfigurationContainerController *)v13 _descriptionText];
  double v8 = [(BuddyCloudConfigAboutConfigurationContainerController *)v13 descriptionLabel];
  [(UILabel *)v8 setAttributedText:v7];

  objc_storeStrong(&v9, 0);
}

- (void)controllerDone:(id)a3
{
  double v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BuddyCloudConfigAboutConfigurationContainerController *)v4 dismissViewControllerAnimated:1 completion:0];
  objc_storeStrong(location, 0);
}

- (id)_descriptionText
{
  v61 = self;
  v60[1] = (id)a2;
  v60[0] = (id)objc_opt_new();
  id v59 = +[BuddyAppleIDTableHeaderView defaultDetailTextAttributes];
  id v58 = +[BuddyAppleIDTableHeaderView defaultTitleTextAttributes];
  id v57 = [objc_alloc((Class)NSAttributedString) initWithString:@"\n" attributes:v59];
  v2 = [(BuddyCloudConfigAboutConfigurationContainerController *)v61 organizationName];

  if (v2)
  {
    id v3 = objc_alloc((Class)NSMutableAttributedString);
    double v4 = [(BuddyCloudConfigAboutConfigurationContainerController *)v61 organizationName];
    id v5 = [v3 initWithString:v4 attributes:v58];
    [v60[0] appendAttributedString:v5];

    [v60[0] appendAttributedString:v57];
  }
  id v6 = [(BuddyCloudConfigAboutConfigurationContainerController *)v61 organizationDepartment];

  if (v6)
  {
    id v7 = objc_alloc((Class)NSMutableAttributedString);
    double v8 = [(BuddyCloudConfigAboutConfigurationContainerController *)v61 organizationDepartment];
    id v9 = [v7 initWithString:v8 attributes:v59];
    [v60[0] appendAttributedString:v9];

    [v60[0] appendAttributedString:v57];
  }
  char v56 = 0;
  id v55 = (id)objc_opt_new();
  objc_super v10 = [(BuddyCloudConfigAboutConfigurationContainerController *)v61 organizationAddressLine1];
  [v55 setValue:v10 forKey:CNPostalAddressStreetKey];

  BOOL v11 = [(BuddyCloudConfigAboutConfigurationContainerController *)v61 organizationAddressLine2];
  [v55 setValue:v11 forKey:CNPostalAddressSubLocalityKey];

  SEL v12 = [(BuddyCloudConfigAboutConfigurationContainerController *)v61 organizationCity];
  [v55 setValue:v12 forKey:CNPostalAddressCityKey];

  id v13 = [(BuddyCloudConfigAboutConfigurationContainerController *)v61 organizationRegion];
  [v55 setValue:v13 forKey:CNPostalAddressStateKey];

  double v14 = [(BuddyCloudConfigAboutConfigurationContainerController *)v61 organizationZipCode];
  [v55 setValue:v14 forKey:CNPostalAddressPostalCodeKey];

  double v15 = [(BuddyCloudConfigAboutConfigurationContainerController *)v61 organizationCountry];
  [v55 setValue:v15 forKey:CNPostalAddressCountryKey];

  id v54 = +[CNPostalAddress postalAddressWithDictionaryRepresentation:v55];
  if (v54)
  {
    id location = +[CNPostalAddressFormatter stringFromPostalAddress:v54 style:0];
    if ([location length])
    {
      id v16 = [objc_alloc((Class)NSAttributedString) initWithString:location attributes:v59];
      [v60[0] appendAttributedString:v16];

      [v60[0] appendAttributedString:v57];
      char v56 = 1;
    }
    objc_storeStrong(&location, 0);
  }
  char v51 = 0;
  BOOL v17 = 0;
  if ((v56 & 1) == 0)
  {
    id v52 = [(BuddyCloudConfigAboutConfigurationContainerController *)v61 organizationAddress];
    char v51 = 1;
    BOOL v17 = v52 != 0;
  }
  if (v51) {

  }
  if (v17)
  {
    double v18 = objc_opt_new();
    double v19 = [(BuddyCloudConfigAboutConfigurationContainerController *)v61 organizationAddress];
    id v50 = [v18 postalAddressFromString:v19];

    id v49 = 0;
    if (v50)
    {
      objc_super v20 = +[CNPostalAddressFormatter stringFromPostalAddress:v50 style:0];
      id v21 = v49;
      id v49 = v20;
    }
    id v22 = v60[0];
    id v23 = objc_alloc((Class)NSAttributedString);
    char v47 = 0;
    if (!v49)
    {
      v48 = [(BuddyCloudConfigAboutConfigurationContainerController *)v61 organizationAddress];
      char v47 = 1;
    }
    id v24 = [v23 initWithString:attributes:];
    [v22 appendAttributedString:v24];

    if (v47) {
    [v60[0] appendAttributedString:v57];
    }
    objc_storeStrong(&v49, 0);
    objc_storeStrong(&v50, 0);
  }
  long long v25 = [(BuddyCloudConfigAboutConfigurationContainerController *)v61 organizationSupportPhone];

  if (v25)
  {
    id v26 = v60[0];
    id v27 = objc_alloc((Class)NSMutableAttributedString);
    long long v28 = [(BuddyCloudConfigAboutConfigurationContainerController *)v61 organizationSupportPhone];
    id v29 = [v27 initWithString:v28 attributes:v59];
    [v26 appendAttributedString:v29];

    [v60[0] appendAttributedString:v57];
  }
  id v30 = [(BuddyCloudConfigAboutConfigurationContainerController *)v61 organizationSupportEmail];

  if (v30)
  {
    id v31 = v60[0];
    id v32 = objc_alloc((Class)NSMutableAttributedString);
    v33 = [(BuddyCloudConfigAboutConfigurationContainerController *)v61 organizationSupportEmail];
    id v34 = [v32 initWithString:v33 attributes:v59];
    [v31 appendAttributedString:v34];

    [v60[0] appendAttributedString:v57];
  }
  [v60[0] appendAttributedString:v57];
  [v60[0] appendAttributedString:v57];
  v35 = [(BuddyCloudConfigAboutConfigurationContainerController *)v61 organizationName];

  if (v35)
  {
    id v36 = v60[0];
    id v37 = objc_alloc((Class)NSMutableAttributedString);
    v38 = +[NSBundle mainBundle];
    id v39 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"REMOTE_MANAGEMENT_ABOUT_DESCRIPTION"];
    v40 = [(NSBundle *)v38 localizedStringForKey:v39 value:&stru_1002B4E18 table:@"Localizable"];
    v41 = [(BuddyCloudConfigAboutConfigurationContainerController *)v61 organizationName];
    v42 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v40, v41);
    id v43 = [(id)objc_opt_class() defaultParagraphTextAttributes];
    id v44 = [v37 initWithString:v42 attributes:v43];
    [v36 appendAttributedString:v44];

    [v60[0] appendAttributedString:v57];
  }
  id v45 = v60[0];
  objc_storeStrong(&v54, 0);
  objc_storeStrong(&v55, 0);
  objc_storeStrong(&v57, 0);
  objc_storeStrong(&v58, 0);
  objc_storeStrong(&v59, 0);
  objc_storeStrong(v60, 0);
  return v45;
}

- (UIScrollView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setOrganizationName:(id)a3
{
}

- (NSString)organizationDepartment
{
  return self->_organizationDepartment;
}

- (void)setOrganizationDepartment:(id)a3
{
}

- (NSString)organizationAddress
{
  return self->_organizationAddress;
}

- (void)setOrganizationAddress:(id)a3
{
}

- (NSString)organizationAddressLine1
{
  return self->_organizationAddressLine1;
}

- (void)setOrganizationAddressLine1:(id)a3
{
}

- (NSString)organizationAddressLine2
{
  return self->_organizationAddressLine2;
}

- (void)setOrganizationAddressLine2:(id)a3
{
}

- (NSString)organizationCity
{
  return self->_organizationCity;
}

- (void)setOrganizationCity:(id)a3
{
}

- (NSString)organizationRegion
{
  return self->_organizationRegion;
}

- (void)setOrganizationRegion:(id)a3
{
}

- (NSString)organizationZipCode
{
  return self->_organizationZipCode;
}

- (void)setOrganizationZipCode:(id)a3
{
}

- (NSString)organizationCountry
{
  return self->_organizationCountry;
}

- (void)setOrganizationCountry:(id)a3
{
}

- (NSString)organizationSupportPhone
{
  return self->_organizationSupportPhone;
}

- (void)setOrganizationSupportPhone:(id)a3
{
}

- (NSString)organizationSupportEmail
{
  return self->_organizationSupportEmail;
}

- (void)setOrganizationSupportEmail:(id)a3
{
}

- (BOOL)isSupervised
{
  return self->_isSupervised;
}

- (void)setIsSupervised:(BOOL)a3
{
  self->_isSupervised = a3;
}

- (void).cxx_destruct
{
}

@end