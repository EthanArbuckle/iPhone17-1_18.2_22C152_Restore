@interface HSPCCreateRoomViewController
- (HSPCCreateRoomViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (id)commitConfiguration;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation HSPCCreateRoomViewController

- (HSPCCreateRoomViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HSPCCreateRoomViewController;
  v4 = [(HSPCTextFieldViewController *)&v7 initWithCoordinator:a3 config:a4];
  if (v4)
  {
    v5 = HULocalizedString();
    [(HSPCCreateRoomViewController *)v4 setTitle:v5];
  }
  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HSPCCreateRoomViewController;
  [(HSPCCreateRoomViewController *)&v8 viewDidAppear:a3];
  v4 = [(HSPCTextFieldViewController *)self textField];
  v5 = [v4 text];
  id v6 = [v5 length];

  if (!v6)
  {
    objc_super v7 = [(HSPCTextFieldViewController *)self textField];
    [v7 becomeFirstResponder];
  }
}

- (id)commitConfiguration
{
  [(HSPCTextFieldViewController *)self endEditing];
  v3 = [(HSPCTextFieldViewController *)self textFieldText];
  v4 = [(HSPCTextFieldViewController *)self config];
  unsigned int v5 = [v4 isSetupInitiatedByOtherMatterEcosystem];

  if (v5)
  {
    id v6 = [objc_alloc((Class)MTSDeviceSetupRoom) initWithName:v3];
    uint64_t v7 = objc_opt_class();
    id v8 = [(HSPCTextFieldViewController *)self config];
    if (v8)
    {
      if (objc_opt_isKindOfClass()) {
        v9 = v8;
      }
      else {
        v9 = 0;
      }
      id v10 = v9;
      if (!v10)
      {
        v11 = +[NSAssertionHandler currentHandler];
        v12 = +[NSString stringWithUTF8String:"id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"];
        [v11 handleFailureInFunction:v12, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v7, objc_opt_class() file lineNumber description];
      }
    }
    else
    {
      id v10 = 0;
    }

    [v10 setSelectedPartnerRoom:v6];
    v15 = +[NAFuture futureWithResult:&off_1000B0088];
  }
  else
  {
    v13 = [(HSPCTextFieldViewController *)self config];
    [v13 setRoomName:v3];

    id v6 = +[NSString stringWithFormat:@"Create Room: \"%@\"", v3];
    id v10 = [(HSPCTextFieldViewController *)self config];
    v14 = [v10 configureRoom];
    v15 = [v14 hs_commitConfigurationFutureWithContextMessage:v6];
  }

  return v15;
}

@end