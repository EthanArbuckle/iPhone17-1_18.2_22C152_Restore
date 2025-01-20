@interface DDRemoteFlightViewControllerProvider
- (void)createViewControllerWithCompletionHandler:(id)a3;
@end

@implementation DDRemoteFlightViewControllerProvider

- (void)createViewControllerWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = (void (**)(void, void))v4;
  if (self->_flightViewController)
  {
    (*((void (**)(id))v4 + 2))(v4);
  }
  else
  {
    v6 = (FUFlightViewController *)objc_alloc_init((Class)FUFlightPreviewController);
    flightViewController = self->_flightViewController;
    self->_flightViewController = v6;

    v8 = [(DDRemoteFlightViewControllerProvider *)self actionContext];
    [v8 result];
    CFStringRef Type = (const __CFString *)DDResultGetType();
    CFComparisonResult v10 = CFStringCompare(Type, DDBinderFlightInformationKey, 0);

    v11 = 0;
    if (v10) {
      goto LABEL_4;
    }
    v12 = [(DDRemoteFlightViewControllerProvider *)self actionContext];
    [v12 result];
    DDResultGetSubresultWithType();

    v13 = [(DDRemoteFlightViewControllerProvider *)self actionContext];
    [v13 result];
    DDResultGetSubresultWithType();

    v11 = DDResultGetValue();
    id v14 = [(id)DDResultGetValue() integerValue];
    if (!v11) {
      goto LABEL_4;
    }
    id v15 = v14;
    if (v14)
    {
      v16 = +[NSDate date];
      id v17 = +[FUFlightFactory flightFactoryClassWithProvider:FUFactoryProvider_Default];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1000070D8;
      v18[3] = &unk_10000C500;
      v18[4] = self;
      v19 = v5;
      [v17 loadFlightsWithNumber:v15 airlineCode:v11 date:v16 dateType:1 completionHandler:v18];
    }
    else
    {
LABEL_4:
      v5[2](v5, 0);
    }
  }
}

- (void).cxx_destruct
{
}

@end