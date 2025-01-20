@interface YahooAccountCreationController
- (Class)accountClass;
- (void)beginAccountCreation;
@end

@implementation YahooAccountCreationController

- (void)beginAccountCreation
{
  id v3 = objc_alloc((Class)SLYahooWebAuthController);
  v4 = +[YahooAccount displayedAccountTypeString];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_79834;
  v10[3] = &unk_B8F98;
  v10[4] = self;
  v5 = (SLYahooWebAuthController *)[v3 initWithAccountDescription:v4 presentationBlock:v10];
  webAuthController = self->_webAuthController;
  self->_webAuthController = v5;

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_798BC;
  v7[3] = &unk_B8FC0;
  objc_copyWeak(&v8, &location);
  [(SLYahooWebAuthController *)self->_webAuthController setCompletion:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (Class)accountClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
}

@end