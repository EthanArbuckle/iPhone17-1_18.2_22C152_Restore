@interface PHAudioRoutingMenuController
+ (id)menuControllerWithCallStyle:(int64_t)a3 dataSource:(id)a4 delegate:(id)a5;
- (BOOL)_canShowWhileLocked;
- (BOOL)isMuted;
- (BOOL)isSharePlayActive;
- (BOOL)wantsAsyncReload;
- (NSArray)menuActions;
- (OS_dispatch_queue)reloadQueue;
- (PHAudioRoutingMenuController)initWithStyle:(int64_t)a3 dataSource:(id)a4 delegate:(id)a5 wantsAsyncReload:(BOOL)a6 menuChangeHandler:(id)a7;
- (PHAudioRoutingMenuControllerDataSource)dataSource;
- (PHAudioRoutingMenuControllerDelegate)delegate;
- (TUCallCenter)callCenter;
- (UIMenu)menu;
- (id)lagunaActionForConversation:(id)a3 deviceHandle:(id)a4;
- (id)lagunaActions;
- (id)menuActionsWithRoutes:(id)a3;
- (id)menuChangeHandler;
- (id)muteActionTitle;
- (id)muteMenuAction;
- (id)routeActionWithTitle:(id)a3 route:(id)a4;
- (int64_t)style;
- (void)fetchMenuActionsWithCompletionHandler:(id)a3;
- (void)reload;
- (void)setMenu:(id)a3;
@end

@implementation PHAudioRoutingMenuController

+ (id)menuControllerWithCallStyle:(int64_t)a3 dataSource:(id)a4 delegate:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = [[PHAudioRoutingMenuController alloc] initWithStyle:a3 dataSource:v8 delegate:v7 wantsAsyncReload:0 menuChangeHandler:0];

  return v9;
}

- (PHAudioRoutingMenuController)initWithStyle:(int64_t)a3 dataSource:(id)a4 delegate:(id)a5 wantsAsyncReload:(BOOL)a6 menuChangeHandler:(id)a7
{
  BOOL v8 = a6;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  v27.receiver = self;
  v27.super_class = (Class)PHAudioRoutingMenuController;
  v15 = [(PHAudioRoutingMenuController *)&v27 init];
  v16 = v15;
  if (v15)
  {
    v15->_wantsAsyncReload = v8;
    v15->_style = a3;
    objc_storeWeak((id *)&v15->_dataSource, v12);
    objc_storeWeak((id *)&v16->_delegate, v13);
    id v17 = objc_retainBlock(v14);
    id menuChangeHandler = v16->_menuChangeHandler;
    v16->_id menuChangeHandler = v17;

    uint64_t v19 = +[UIMenu menuWithTitle:&stru_1002D6110 children:&__NSArray0__struct];
    menu = v16->_menu;
    v16->_menu = (UIMenu *)v19;

    v21 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)2u, 0);
    dispatch_queue_t v22 = dispatch_queue_create("PHAudioRoutingMenuController.serialQueue", v21);
    reloadQueue = v16->_reloadQueue;
    v16->_reloadQueue = (OS_dispatch_queue *)v22;

    if (v8)
    {
      v24 = (TUCallCenter *)[objc_alloc((Class)TUCallCenter) initWithQueue:v16->_reloadQueue wantsCallNotifications:0];
    }
    else
    {
      v24 = +[TUCallCenter sharedInstance];
    }
    callCenter = v16->_callCenter;
    v16->_callCenter = v24;

    [(PHAudioRoutingMenuController *)v16 reload];
  }

  return v16;
}

- (void)reload
{
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000421B8;
  v7[3] = &unk_1002CE128;
  objc_copyWeak(&v8, &location);
  v3 = objc_retainBlock(v7);
  if ([(PHAudioRoutingMenuController *)self wantsAsyncReload])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000423B8;
    v5[3] = &unk_1002CE150;
    v6 = v3;
    [(PHAudioRoutingMenuController *)self fetchMenuActionsWithCompletionHandler:v5];
    v4 = v6;
  }
  else
  {
    v4 = [(PHAudioRoutingMenuController *)self menuActions];
    ((void (*)(void *, void *))v3[2])(v3, v4);
  }

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)setMenu:(id)a3
{
  id v5 = a3;
  if ([(PHAudioRoutingMenuController *)self wantsAsyncReload])
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004248C;
    v6[3] = &unk_1002CDDE0;
    v6[4] = self;
    id v7 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
  else
  {
    objc_storeStrong((id *)&self->_menu, a3);
  }
}

- (void)fetchMenuActionsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(PHAudioRoutingMenuController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    objc_initWeak(&location, self);
    id v7 = [(PHAudioRoutingMenuController *)self dataSource];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000426E4;
    v9[3] = &unk_1002CE1A0;
    objc_copyWeak(&v11, &location);
    id v10 = v4;
    [v7 fetchRoutesForAudioRoutingMenuController:self completionHandler:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    id v8 = [(PHAudioRoutingMenuController *)self reloadQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000426CC;
    block[3] = &unk_1002CDA98;
    id v14 = v4;
    dispatch_async(v8, block);
  }
}

- (NSArray)menuActions
{
  v3 = [(PHAudioRoutingMenuController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(PHAudioRoutingMenuController *)self dataSource];
    char v6 = [v5 routesForAudioRoutingMenuController:self];

    id v7 = sub_1000D5130();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "going to construct menu actions with current routes: %@", (uint8_t *)&v10, 0xCu);
    }

    id v8 = [(PHAudioRoutingMenuController *)self menuActionsWithRoutes:v6];
  }
  else
  {
    id v8 = &__NSArray0__struct;
  }

  return (NSArray *)v8;
}

- (id)menuActionsWithRoutes:(id)a3
{
  id v4 = a3;
  v23 = +[NSMutableArray array];
  unsigned int v5 = [(PHAudioRoutingMenuController *)self isSharePlayActive];
  id v24 = objc_alloc_init((Class)NSMutableArray);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(obj);
        }
        int v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v11 = [v10 name];
        id v12 = [(PHAudioRoutingMenuController *)self routeActionWithTitle:v11 route:v10];

        [v12 setState:[v10 isCurrentlyPicked]];
        id v13 = [v10 name];
        id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"route title: %@, route state: %ld", v13, [v12 state]);

        if (v5 && ([v10 supportsSharePlay] & 1) == 0)
        {
          [v12 setAttributes:1];
          v15 = TUBundle();
          v16 = [v15 localizedStringForKey:@"UNAVAILABLE_AUDIO_ROUTE" value:&stru_1002D6110 table:@"TelephonyUtilities"];
          [v12 setDiscoverabilityTitle:v16];
        }
        if (v12)
        {
          [v23 addObject:v12];
          [v24 addObject:v14];
        }
        else
        {
          id v17 = sub_1000D5130();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v30 = v10;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[WARN] Unable to create menu action for route %@", buf, 0xCu);
          }
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v7);
  }

  if ((id)[(PHAudioRoutingMenuController *)self style] == (id)2)
  {
    v18 = [(PHAudioRoutingMenuController *)self muteMenuAction];
    if (v18) {
      [v23 addObject:v18];
    }
  }
  uint64_t v19 = sub_1000D5130();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v24;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "menuActionsWithRoutes: %@", buf, 0xCu);
  }

  id v20 = [v23 copy];

  return v20;
}

- (id)routeActionWithTitle:(id)a3 route:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    objc_initWeak(&location, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100042E0C;
    v13[3] = &unk_1002CE1C8;
    objc_copyWeak(&v15, &location);
    id v8 = v7;
    id v14 = v8;
    v9 = objc_retainBlock(v13);
    int v10 = [v8 audioRouteGlyphForDisplayStyle:0];
    id v11 = +[UIAction actionWithTitle:v6 image:v10 identifier:0 handler:v9];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)lagunaActions
{
  v3 = [(PHAudioRoutingMenuController *)self callCenter];
  uint64_t v4 = [v3 frontmostAudioOrVideoCall];

  unsigned int v5 = [(PHAudioRoutingMenuController *)self callCenter];
  uint64_t v19 = (void *)v4;
  id v6 = [v5 activeConversationForCall:v4];

  id v7 = [(PHAudioRoutingMenuController *)self callCenter];
  id v8 = +[TPAudioRouting eligibleLagunaDevices:v7];

  v9 = +[NSMutableArray array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v16 = [(PHAudioRoutingMenuController *)self lagunaActionForConversation:v6 deviceHandle:v15];
        [v16 setState:0];
        if (v16)
        {
          [v9 addObject:v16];
        }
        else
        {
          id v17 = sub_1000D5130();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v25 = v15;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[WARN] Unable to create menu action for laguna deviceHandle %@", buf, 0xCu);
          }
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v12);
  }

  return v9;
}

- (id)lagunaActionForConversation:(id)a3 deviceHandle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 name];
  id v9 = [v8 length];

  if (v9)
  {
    objc_initWeak(&location, self);
    uint64_t v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    id v17 = sub_1000432A4;
    v18 = &unk_1002CE1F0;
    objc_copyWeak(&v21, &location);
    id v10 = v7;
    id v19 = v10;
    id v20 = v6;
    id v11 = objc_retainBlock(&v15);
    [v10 deviceModel:v15, v16, v17, v18];
    id v12 = +[UIImage systemImageNamed:@"appletv"];
    uint64_t v13 = [v10 name];
    id v9 = +[UIAction actionWithTitle:v13 image:v12 identifier:0 handler:v11];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (id)muteMenuAction
{
  v3 = +[UIImage muteRouteGlyphForDisplayStyle:0];
  uint64_t v4 = [(PHAudioRoutingMenuController *)self muteActionTitle];
  if (v4)
  {
    objc_initWeak(&location, self);
    id v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472;
    id v10 = sub_10004349C;
    id v11 = &unk_1002CE218;
    objc_copyWeak(&v12, &location);
    unsigned int v5 = objc_retainBlock(&v8);
    id v6 = +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v4, v3, 0, v5, v8, v9, v10, v11);
    [v6 setState:[self isMuted]];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)isMuted
{
  v2 = [(PHAudioRoutingMenuController *)self callCenter];
  v3 = [v2 frontmostAudioOrVideoCall];

  LOBYTE(v2) = [v3 isUplinkMuted];
  return (char)v2;
}

- (BOOL)isSharePlayActive
{
  v3 = [(PHAudioRoutingMenuController *)self callCenter];
  uint64_t v4 = [v3 frontmostAudioOrVideoCall];

  if (v4)
  {
    unsigned int v5 = [(PHAudioRoutingMenuController *)self callCenter];
    id v6 = [v5 activeConversationForCall:v4];

    if (v6) {
      unsigned __int8 v7 = [v6 hasJoinedActivitySession];
    }
    else {
      unsigned __int8 v7 = 0;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (id)muteActionTitle
{
  v3 = [(PHAudioRoutingMenuController *)self dataSource];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    unsigned int v5 = [(PHAudioRoutingMenuController *)self dataSource];
    id v6 = [v5 muteActionTitleForAudioRoutingMenuController:self];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (UIMenu)menu
{
  return self->_menu;
}

- (int64_t)style
{
  return self->_style;
}

- (PHAudioRoutingMenuControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (PHAudioRoutingMenuControllerDataSource *)WeakRetained;
}

- (PHAudioRoutingMenuControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PHAudioRoutingMenuControllerDelegate *)WeakRetained;
}

- (BOOL)wantsAsyncReload
{
  return self->_wantsAsyncReload;
}

- (id)menuChangeHandler
{
  return self->_menuChangeHandler;
}

- (OS_dispatch_queue)reloadQueue
{
  return self->_reloadQueue;
}

- (TUCallCenter)callCenter
{
  return self->_callCenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callCenter, 0);
  objc_storeStrong((id *)&self->_reloadQueue, 0);
  objc_storeStrong(&self->_menuChangeHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);

  objc_storeStrong((id *)&self->_menu, 0);
}

@end