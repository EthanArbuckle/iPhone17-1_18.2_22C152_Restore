@interface HUViewControllerPresentationRequest
+ (id)requestWithViewController:(id)a3;
- (BOOL)animated;
- (HUViewControllerPresentationRequest)initWithViewController:(id)a3;
- (UIViewController)viewController;
- (id)asGeneric;
- (unint64_t)preferredPresentationType;
- (void)setAnimated:(BOOL)a3;
- (void)setPreferredPresentationType:(unint64_t)a3;
@end

@implementation HUViewControllerPresentationRequest

- (id)asGeneric
{
  sub_1BE45F99C();
  id v2 = HUViewControllerPresentationRequest.asGeneric()();

  return v2;
}

+ (id)requestWithViewController:(id)a3
{
  id v3 = a3;
  v4 = [[HUViewControllerPresentationRequest alloc] initWithViewController:v3];

  return v4;
}

- (HUViewControllerPresentationRequest)initWithViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUViewControllerPresentationRequest;
  v6 = [(HUViewControllerPresentationRequest *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewController, a3);
    v7->_animated = 1;
  }

  return v7;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (unint64_t)preferredPresentationType
{
  return self->_preferredPresentationType;
}

- (void)setPreferredPresentationType:(unint64_t)a3
{
  self->_preferredPresentationType = a3;
}

- (BOOL)animated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (void).cxx_destruct
{
}

@end