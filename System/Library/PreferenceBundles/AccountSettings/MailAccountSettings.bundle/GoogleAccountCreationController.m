@interface GoogleAccountCreationController
- (Class)accountClass;
- (void)beginAccountCreation;
@end

@implementation GoogleAccountCreationController

- (void)beginAccountCreation
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_6CA00;
  v6[3] = &unk_B9A70;
  v6[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_6CA88;
  v4[3] = &unk_B8FC0;
  objc_copyWeak(&v5, &location);
  id v3 = +[SLGoogleAuthController googleAuthControllerWithPresentationBlock:v6 completion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (Class)accountClass
{
  return (Class)objc_opt_class();
}

@end