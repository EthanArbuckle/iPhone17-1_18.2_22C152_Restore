@interface HSPCRouterReplaceViewController
- (HSPCRouterReplaceViewController)initWithCoordinator:(id)a3;
- (HSProxCardCoordinator)coordinator;
@end

@implementation HSPCRouterReplaceViewController

- (HSPCRouterReplaceViewController)initWithCoordinator:(id)a3
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)HUIconView) initWithFrame:CGRectZero contentMode:1];
  [v6 setIconSize:5];
  v7 = [v5 activeTuple];
  v8 = [v7 accessoryCategoryOrPrimaryServiceType];
  v9 = +[HFServiceIconFactory iconDescriptorForAccessoryCategoryOrServiceType:v8];

  [v6 updateWithIconDescriptor:v9 displayStyle:1 animated:1];
  v34.receiver = self;
  v34.super_class = (Class)HSPCRouterReplaceViewController;
  v10 = [(HSPCFixedSizeCenterContentViewController *)&v34 initWithCenterContentView:v6];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_coordinator, a3);
    v12 = HULocalizedWiFiString();
    [(HSPCRouterReplaceViewController *)v11 setTitle:v12];

    v13 = HULocalizedString();
    [(HSPCRouterReplaceViewController *)v11 setSubtitle:v13];

    v14 = [v5 activeTuple];
    v15 = [v14 configuration];
    v16 = [v15 home];

    v17 = [v5 setupAccessoryDescription];
    v18 = HULocalizedString();
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100009030;
    v30[3] = &unk_1000A8EF8;
    id v19 = v16;
    id v31 = v19;
    id v20 = v17;
    id v32 = v20;
    v21 = v11;
    v33 = v21;
    v22 = +[PRXAction actionWithTitle:v18 style:0 handler:v30];
    id v23 = [(HSPCRouterReplaceViewController *)v21 addAction:v22];

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10000909C;
    v27[3] = &unk_1000A8F20;
    id v28 = v19;
    id v29 = v20;
    id v24 = v20;
    id v25 = v19;
    [(HSPCRouterReplaceViewController *)v21 addDismissButtonWithCoordinator:v5 dismissAfterExecuting:v27];
  }
  return v11;
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
}

@end