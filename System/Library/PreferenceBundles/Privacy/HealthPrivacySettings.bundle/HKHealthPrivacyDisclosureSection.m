@interface HKHealthPrivacyDisclosureSection
- (BOOL)shouldHideHeader;
- (UIViewController)parentViewController;
- (id)viewForFooter:(id)a3;
- (void)setParentViewController:(id)a3;
- (void)setShouldHideHeader:(BOOL)a3;
@end

@implementation HKHealthPrivacyDisclosureSection

- (id)viewForFooter:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  v4 = [HKHealthPrivacyDisclosureView alloc];
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"PRIVACY_DISCLOSURE_FOOTER" value:&stru_8350 table:0];
  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"PRIVACY_DISCLOSURE_FOOTER_LEARN_MORE" value:&stru_8350 table:0];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_4198;
  v12[3] = &unk_82F0;
  id v13 = WeakRetained;
  id v9 = WeakRetained;
  v10 = [(HKHealthPrivacyDisclosureView *)v4 initWithBodyText:v6 linkText:v8 linkAction:v12];

  return v10;
}

- (BOOL)shouldHideHeader
{
  return self->_shouldHideHeader;
}

- (void)setShouldHideHeader:(BOOL)a3
{
  self->_shouldHideHeader = a3;
}

- (UIViewController)parentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setParentViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end