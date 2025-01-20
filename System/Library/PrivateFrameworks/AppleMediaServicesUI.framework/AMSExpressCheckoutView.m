@interface AMSExpressCheckoutView
+ (id)createViewControllerWithRequest:(id)a3 model:(id)a4 engagementViewController:(id)a5;
- (_TtC20AppleMediaServicesUI22AMSExpressCheckoutView)init;
@end

@implementation AMSExpressCheckoutView

+ (id)createViewControllerWithRequest:(id)a3 model:(id)a4 engagementViewController:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = static AMSExpressCheckoutView.createViewController(request:model:engagementViewController:)(v7, v8, v9);

  return v10;
}

- (_TtC20AppleMediaServicesUI22AMSExpressCheckoutView)init
{
  return (_TtC20AppleMediaServicesUI22AMSExpressCheckoutView *)AMSExpressCheckoutView.init()();
}

@end