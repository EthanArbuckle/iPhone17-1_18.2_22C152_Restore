@interface MUPlaceViewControllerConfiguration
- (CNContactViewController)contactsViewController;
- (CNContactViewControllerPrivateDelegate)contactsNavigationController;
- (GEOApplicationAuditToken)developerPlaceCardAuditToken;
- (NSString)effectiveBundleIdentifier;
- (UIViewController)headerViewController;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)options;
- (void)setContactsNavigationController:(id)a3;
- (void)setContactsViewController:(id)a3;
- (void)setDeveloperPlaceCardAuditToken:(id)a3;
- (void)setEffectiveBundleIdentifier:(id)a3;
- (void)setHeaderViewController:(id)a3;
- (void)setOptions:(unint64_t)a3;
@end

@implementation MUPlaceViewControllerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MUPlaceViewControllerConfiguration);
  v5 = [(MUPlaceViewControllerConfiguration *)self contactsNavigationController];
  [(MUPlaceViewControllerConfiguration *)v4 setContactsNavigationController:v5];

  v6 = [(MUPlaceViewControllerConfiguration *)self contactsViewController];
  [(MUPlaceViewControllerConfiguration *)v4 setContactsViewController:v6];

  v7 = [(MUPlaceViewControllerConfiguration *)self headerViewController];
  [(MUPlaceViewControllerConfiguration *)v4 setHeaderViewController:v7];

  [(MUPlaceViewControllerConfiguration *)v4 setOptions:[(MUPlaceViewControllerConfiguration *)self options]];
  return v4;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (NSString)effectiveBundleIdentifier
{
  return self->_effectiveBundleIdentifier;
}

- (void)setEffectiveBundleIdentifier:(id)a3
{
}

- (CNContactViewControllerPrivateDelegate)contactsNavigationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactsNavigationController);
  return (CNContactViewControllerPrivateDelegate *)WeakRetained;
}

- (void)setContactsNavigationController:(id)a3
{
}

- (CNContactViewController)contactsViewController
{
  return self->_contactsViewController;
}

- (void)setContactsViewController:(id)a3
{
}

- (UIViewController)headerViewController
{
  return self->_headerViewController;
}

- (void)setHeaderViewController:(id)a3
{
}

- (GEOApplicationAuditToken)developerPlaceCardAuditToken
{
  return self->_developerPlaceCardAuditToken;
}

- (void)setDeveloperPlaceCardAuditToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_developerPlaceCardAuditToken, 0);
  objc_storeStrong((id *)&self->_headerViewController, 0);
  objc_storeStrong((id *)&self->_contactsViewController, 0);
  objc_destroyWeak((id *)&self->_contactsNavigationController);
  objc_storeStrong((id *)&self->_effectiveBundleIdentifier, 0);
}

@end