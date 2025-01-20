@interface HSPCCreateHomeViewController
- (HFHomeBuilder)builder;
- (HSPCCreateHomeViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (id)commitConfiguration;
- (id)hu_preloadContent;
- (void)setBuilder:(id)a3;
@end

@implementation HSPCCreateHomeViewController

- (HSPCCreateHomeViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)HSPCCreateHomeViewController;
  v4 = [(HSPCTextFieldViewController *)&v8 initWithCoordinator:a3 config:a4];
  if (v4)
  {
    v5 = HULocalizedString();
    [(HSPCCreateHomeViewController *)v4 setTitle:v5];

    id v6 = [objc_alloc((Class)HFHomeBuilder) initWithExistingObject:0 inHome:0];
    [(HSPCCreateHomeViewController *)v4 setBuilder:v6];
  }
  return v4;
}

- (id)commitConfiguration
{
  [(HSPCTextFieldViewController *)self endEditing];
  v3 = [(HSPCTextFieldViewController *)self textFieldText];
  v4 = [(HSPCTextFieldViewController *)self config];
  unsigned int v5 = [v4 isSetupInitiatedByOtherMatterEcosystem];

  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = [(HSPCTextFieldViewController *)self config];
    if (v7)
    {
      if (objc_opt_isKindOfClass()) {
        objc_super v8 = v7;
      }
      else {
        objc_super v8 = 0;
      }
      id v9 = v8;
      if (!v9)
      {
        v10 = +[NSAssertionHandler currentHandler];
        v11 = +[NSString stringWithUTF8String:"id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"];
        [v10 handleFailureInFunction:v11, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v6, objc_opt_class() file lineNumber description];
      }
    }
    else
    {
      id v9 = 0;
    }

    id v19 = [objc_alloc((Class)MTSDeviceSetupHome) initWithName:v3];
    [v9 setSelectedPartnerHome:v19];

    v18 = +[NAFuture futureWithResult:&off_1000B0190];
  }
  else
  {
    v12 = [(HSPCCreateHomeViewController *)self builder];
    [v12 setName:v3];

    objc_initWeak(&location, self);
    v13 = [(HSPCCreateHomeViewController *)self builder];
    v14 = [v13 commitItem];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100024FA4;
    v21[3] = &unk_1000A8F70;
    objc_copyWeak(&v22, &location);
    v15 = [v14 flatMap:v21];
    v16 = [(HSPCTextFieldViewController *)self textFieldText];
    v17 = +[NSString stringWithFormat:@"Create Home \"%@\"", v16];
    v18 = [v15 hs_commitConfigurationFutureWithContextMessage:v17];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v18;
}

- (id)hu_preloadContent
{
  v3 = +[HFHomeKitDispatcher sharedDispatcher];
  v4 = [v3 allHomesFuture];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100025128;
  v7[3] = &unk_1000A9C98;
  v7[4] = self;
  unsigned int v5 = [v4 flatMap:v7];

  return v5;
}

- (HFHomeBuilder)builder
{
  return (HFHomeBuilder *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBuilder:(id)a3
{
}

- (void).cxx_destruct
{
}

@end