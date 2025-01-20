@interface ICSCallDisplayStyleManager
+ (id)allChildViewControllersOfViewController:(id)a3;
+ (id)allSubviewsAndChildViewControllersForRootViewController:(id)a3;
+ (id)allSubviewsOfView:(id)a3;
+ (int64_t)callDisplayStyleToRequestForCurrentState;
+ (void)notifyAllRespondersForViewController:(id)a3 callDisplayStyleDidChangeFromStyle:(int64_t)a4 toStyle:(int64_t)a5;
- (BOOL)attachedToWindowedAccessory;
- (CGRect)miniWindowCutoutFrame;
- (ICSCallDisplayStyleManager)init;
- (NSString)sceneSessionIdentifier;
- (UIViewController)rootViewController;
- (int)toggleCleethorpesNotificationToken;
- (int64_t)callDisplayStyle;
- (unint64_t)sceneType;
- (void)dealloc;
- (void)setAttachedToWindowedAccessory:(BOOL)a3;
- (void)setCallDisplayStyle:(int64_t)a3;
- (void)setMiniWindowCutoutFrame:(CGRect)a3;
- (void)setRootViewController:(id)a3;
- (void)setSceneSessionIdentifier:(id)a3;
- (void)setSceneType:(unint64_t)a3;
- (void)setToggleCleethorpesNotificationToken:(int)a3;
- (void)updateMiniWindowCutoutFrame:(CGRect)a3 attachedToWindowedAccessory:(BOOL)a4;
@end

@implementation ICSCallDisplayStyleManager

- (ICSCallDisplayStyleManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)ICSCallDisplayStyleManager;
  v2 = [(ICSCallDisplayStyleManager *)&v8 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    id v3 = &_dispatch_main_q;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10004BE78;
    v5[3] = &unk_1002CDE68;
    objc_copyWeak(&v6, &location);
    notify_register_dispatch("ToggleCleethorpes", &v2->_toggleCleethorpesNotificationToken, (dispatch_queue_t)&_dispatch_main_q, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  notify_cancel([(ICSCallDisplayStyleManager *)self toggleCleethorpesNotificationToken]);
  v3.receiver = self;
  v3.super_class = (Class)ICSCallDisplayStyleManager;
  [(ICSCallDisplayStyleManager *)&v3 dealloc];
}

- (void)setCallDisplayStyle:(int64_t)a3
{
  if (self->_callDisplayStyle != a3)
  {
    v5 = sub_1000D5130();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      int64_t v9 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Call display style changed: %ld", (uint8_t *)&v8, 0xCu);
    }

    int64_t callDisplayStyle = self->_callDisplayStyle;
    self->_int64_t callDisplayStyle = a3;
    v7 = [(ICSCallDisplayStyleManager *)self rootViewController];
    +[ICSCallDisplayStyleManager notifyAllRespondersForViewController:v7 callDisplayStyleDidChangeFromStyle:callDisplayStyle toStyle:a3];
  }
}

- (void)updateMiniWindowCutoutFrame:(CGRect)a3 attachedToWindowedAccessory:(BOOL)a4
{
  BOOL v4 = a4;
  -[ICSCallDisplayStyleManager setMiniWindowCutoutFrame:](self, "setMiniWindowCutoutFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  [(ICSCallDisplayStyleManager *)self setAttachedToWindowedAccessory:v4];
}

+ (int64_t)callDisplayStyleToRequestForCurrentState
{
  v2 = +[TUCallCenter sharedInstance];
  objc_super v3 = [v2 incomingCall];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = +[TUCallCenter sharedInstance];
    id v6 = [v5 incomingVideoCall];
    BOOL v4 = v6 != 0;
  }
  v7 = +[ICSPreferences sharedPreferences];
  unsigned int v8 = [v7 hasBannersEnabled];

  if ((v8 & v4) != 0) {
    return 0;
  }
  else {
    return 2;
  }
}

+ (void)notifyAllRespondersForViewController:(id)a3 callDisplayStyleDidChangeFromStyle:(int64_t)a4 toStyle:(int64_t)a5
{
  v7 = +[ICSCallDisplayStyleManager allSubviewsAndChildViewControllersForRootViewController:a3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v12 conformsToProtocol:&OBJC_PROTOCOL___ICSCallDisplayStyleHandler]) {
          [v12 callDisplayStyleDidChangeFromStyle:a4 toStyle:a5];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

+ (id)allSubviewsAndChildViewControllersForRootViewController:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 view];
  v5 = +[ICSCallDisplayStyleManager allSubviewsOfView:v4];

  id v6 = +[ICSCallDisplayStyleManager allChildViewControllersOfViewController:v3];

  v7 = [v5 arrayByAddingObjectsFromArray:v6];

  return v7;
}

+ (id)allSubviewsOfView:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[NSMutableArray array];
  v5 = v4;
  if (v3)
  {
    [v4 addObject:v3];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = [v3 subviews];
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = +[ICSCallDisplayStyleManager allSubviewsOfView:*(void *)(*((void *)&v14 + 1) + 8 * i)];
          [v5 addObjectsFromArray:v11];
        }
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  id v12 = [v5 copy];

  return v12;
}

+ (id)allChildViewControllersOfViewController:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[NSMutableArray array];
  v5 = +[PHInCallUIUtilities handleNavigationControllerIfNecessary:v3];

  if (v5)
  {
    [v4 addObject:v5];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = [v5 childViewControllers];
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = +[ICSCallDisplayStyleManager allChildViewControllersOfViewController:*(void *)(*((void *)&v14 + 1) + 8 * i)];
          [v4 addObjectsFromArray:v11];
        }
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  id v12 = [v4 copy];

  return v12;
}

- (int64_t)callDisplayStyle
{
  return self->_callDisplayStyle;
}

- (UIViewController)rootViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setRootViewController:(id)a3
{
}

- (NSString)sceneSessionIdentifier
{
  return self->_sceneSessionIdentifier;
}

- (void)setSceneSessionIdentifier:(id)a3
{
}

- (BOOL)attachedToWindowedAccessory
{
  return self->_attachedToWindowedAccessory;
}

- (void)setAttachedToWindowedAccessory:(BOOL)a3
{
  self->_attachedToWindowedAccessory = a3;
}

- (CGRect)miniWindowCutoutFrame
{
  double x = self->_miniWindowCutoutFrame.origin.x;
  double y = self->_miniWindowCutoutFrame.origin.y;
  double width = self->_miniWindowCutoutFrame.size.width;
  double height = self->_miniWindowCutoutFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setMiniWindowCutoutFrame:(CGRect)a3
{
  self->_miniWindowCutoutFrame = a3;
}

- (unint64_t)sceneType
{
  return self->_sceneType;
}

- (void)setSceneType:(unint64_t)a3
{
  self->_sceneType = a3;
}

- (int)toggleCleethorpesNotificationToken
{
  return self->_toggleCleethorpesNotificationToken;
}

- (void)setToggleCleethorpesNotificationToken:(int)a3
{
  self->_toggleCleethorpesNotificationToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneSessionIdentifier, 0);

  objc_destroyWeak((id *)&self->_rootViewController);
}

@end