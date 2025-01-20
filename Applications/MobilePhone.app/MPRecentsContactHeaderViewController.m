@interface MPRecentsContactHeaderViewController
- (CHRecentCall)recentCall;
- (MPRecentsContactHeaderViewController)init;
- (NSDictionary)rttConversations;
- (PHRecentCallDetailsView)detailsView;
- (PHRecentsItem)recentsItem;
- (id)generateDetailsView;
- (id)rttConversationForUUID:(id)a3;
- (int64_t)recentCallTTYType;
- (void)loadLayoutConstraints;
- (void)loadRTTConversations;
- (void)loadView;
- (void)presentConversationForUUID:(id)a3;
- (void)setDetailsView:(id)a3;
- (void)setRecentCall:(id)a3;
- (void)setRecentsItem:(id)a3;
- (void)setRttConversations:(id)a3;
@end

@implementation MPRecentsContactHeaderViewController

- (MPRecentsContactHeaderViewController)init
{
  v7.receiver = self;
  v7.super_class = (Class)MPRecentsContactHeaderViewController;
  v2 = [(MPRecentsContactHeaderViewController *)&v7 initWithNibName:0 bundle:0];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.mobilephone.rttConversations", v3);
    rttConversationsQueue = v2->_rttConversationsQueue;
    v2->_rttConversationsQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)MPRecentsContactHeaderViewController;
  [(MPRecentsContactHeaderViewController *)&v5 loadView];
  [(MPRecentsContactHeaderViewController *)self loadRTTConversations];
  v3 = [(MPRecentsContactHeaderViewController *)self view];
  dispatch_queue_t v4 = [(MPRecentsContactHeaderViewController *)self generateDetailsView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:v4];
  [(MPRecentsContactHeaderViewController *)self setDetailsView:v4];
  [(MPRecentsContactHeaderViewController *)self loadLayoutConstraints];
}

- (void)loadLayoutConstraints
{
  id v13 = [(MPRecentsContactHeaderViewController *)self detailsView];
  v3 = [(MPRecentsContactHeaderViewController *)self view];
  dispatch_queue_t v4 = [v13 widthAnchor];
  objc_super v5 = [v3 widthAnchor];
  v6 = [v4 constraintEqualToAnchor:v5];
  [v6 setActive:1];

  objc_super v7 = [v13 topAnchor];
  v8 = [v3 topAnchor];
  v9 = [v7 constraintEqualToAnchor:v8];
  [v9 setActive:1];

  v10 = [v13 bottomAnchor];
  v11 = [v3 bottomAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  [v12 setActive:1];
}

- (id)generateDetailsView
{
  v3 = -[PHRecentCallDetailsView initWithFrame:]([PHRecentCallDetailsView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(PHRecentCallDetailsView *)v3 setDelegate:self];
  dispatch_queue_t v4 = [(MPRecentsContactHeaderViewController *)self recentCall];
  [(PHRecentCallDetailsView *)v3 setRecentCall:v4];

  return v3;
}

- (void)loadRTTConversations
{
  v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting loadRTTConversations", (uint8_t *)buf, 2u);
  }

  id v4 = RTTUIUtilitiesClass();
  if (v4)
  {
    objc_super v5 = v4;
    objc_initWeak(buf, self);
    rttConversationsQueue = self->_rttConversationsQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __60__MPRecentsContactHeaderViewController_loadRTTConversations__block_invoke;
    v8[3] = &unk_10027C8C8;
    objc_copyWeak(v9, buf);
    v9[1] = v5;
    dispatch_async(rttConversationsQueue, v8);
    objc_destroyWeak(v9);
    objc_destroyWeak(buf);
  }
  else
  {
    objc_super v7 = PHDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Stopped loadRTTConversations because we could not find RTTUIUtilities", (uint8_t *)buf, 2u);
    }
  }
}

void __60__MPRecentsContactHeaderViewController_loadRTTConversations__block_invoke(uint64_t a1)
{
  from = (id *)(a1 + 32);
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v1 = objc_loadWeakRetained(&to);
  BOOL v2 = v1 == 0;

  if (v2)
  {
    v6 = PHDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Stopped loadRTTConversations because MPRecentsContactHeaderViewController was deallocated before starting", buf, 2u);
    }
  }
  else
  {
    v17 = +[NSMutableDictionary dictionary];
    id v3 = objc_loadWeakRetained(&to);
    id v4 = [v3 recentCall];
    objc_super v5 = [v4 callOccurrences];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v6 = v5;
    id v7 = [v6 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v23;
      uint64_t v9 = kCHCallOccurrenceUniqueIdKey;
      do
      {
        v10 = 0;
        do
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v22 + 1) + 8 * (void)v10) objectForKeyedSubscript:v9];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v12 = v11;
            id v13 = [*(id *)(a1 + 40) sharedUtilityProvider];
            v14 = [v13 conversationForCallUID:v12];

            if (v14) {
              [v17 setObject:v14 forKeyedSubscript:v12];
            }
          }
          v10 = (char *)v10 + 1;
        }
        while (v7 != v10);
        id v7 = [v6 countByEnumeratingWithState:&v22 objects:v28 count:16];
      }
      while (v7);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __60__MPRecentsContactHeaderViewController_loadRTTConversations__block_invoke_45;
    block[3] = &unk_10027C8A0;
    objc_copyWeak(&v21, from);
    id v20 = v17;
    id v15 = v17;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v21);
  }

  objc_destroyWeak(&to);
}

void __60__MPRecentsContactHeaderViewController_loadRTTConversations__block_invoke_45(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setRttConversations:*(void *)(a1 + 32)];
    id v4 = PHDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Successfully finished loadRTTConversations", buf, 2u);
    }

    objc_super v5 = PHDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Reloading conversation list", v8, 2u);
    }

    v6 = [v3 detailsView];
    [v6 reloadCallOccurences];
  }
  else
  {
    v6 = PHDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Stopped loadRTTConversations because MPRecentsContactHeaderViewController was deallocated when trying to write rttConversations", v7, 2u);
    }
  }
}

- (int64_t)recentCallTTYType
{
  BOOL v2 = [(MPRecentsContactHeaderViewController *)self recentCall];
  id v3 = [v2 ttyType];

  return (int64_t)v3;
}

- (id)rttConversationForUUID:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(MPRecentsContactHeaderViewController *)self rttConversations];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)presentConversationForUUID:(id)a3
{
  id v4 = a3;
  id v5 = RTTUIConversationViewControllerClass();
  if (v5)
  {
    v6 = v5;
    id v7 = [(MPRecentsContactHeaderViewController *)self rttConversationForUUID:v4];
    if (v7)
    {
      uint64_t v8 = [v6 viewControllerForConversation:v7];
      uint64_t v9 = [(MPRecentsContactHeaderViewController *)self navigationController];
      [v9 pushViewController:v8 animated:1];
    }
    else
    {
      v10 = PHDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[MPRecentsContactHeaderViewController presentConversationForUUID:](v10);
      }
    }
  }
}

- (PHRecentCallDetailsView)detailsView
{
  return self->_detailsView;
}

- (void)setDetailsView:(id)a3
{
}

- (CHRecentCall)recentCall
{
  return self->_recentCall;
}

- (void)setRecentCall:(id)a3
{
}

- (PHRecentsItem)recentsItem
{
  return self->_recentsItem;
}

- (void)setRecentsItem:(id)a3
{
}

- (NSDictionary)rttConversations
{
  return self->_rttConversations;
}

- (void)setRttConversations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rttConversations, 0);
  objc_storeStrong((id *)&self->_recentsItem, 0);
  objc_storeStrong((id *)&self->_recentCall, 0);
  objc_storeStrong((id *)&self->_detailsView, 0);

  objc_storeStrong((id *)&self->_rttConversationsQueue, 0);
}

- (void)presentConversationForUUID:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No rttConversation found", v1, 2u);
}

@end