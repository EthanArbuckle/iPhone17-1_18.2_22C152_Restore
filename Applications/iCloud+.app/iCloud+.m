id sub_100001EA8(void *a1)
{
  return [*(id *)(a1[4] + 8) beginPostPurchaseFlowWithLink:a1[5] offer:a1[6]];
}

id sub_100001FA8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) beginFlowWithPresentingViewController:0];
}

void sub_1000025D4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100002E30(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100004340(v6);
    }

    v8 = *(void **)(a1 + 32);
    uint64_t v9 = +[NSURL URLWithString:@"https://support.apple.com/HT201318"];
    [v8 launchURL:v9];
    goto LABEL_16;
  }
  uint64_t v9 = [v5 universalSuccessLink];
  v10 = [v9 actionURL];
  v11 = [*(id *)(a1 + 40) absoluteString];
  v12 = [v10 icq_URLByAppendingQueryParamtersFromContext:v11];
  [v9 setActionURL:v12];

  if (!v9)
  {
    v17 = _ICQGetLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000042FC(v17);
    }
    goto LABEL_15;
  }
  id v13 = [v9 action];
  if (v13 != (id)115 && v13 != (id)112)
  {
    v17 = _ICQGetLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Unsupported action type for successInfo universal link", (uint8_t *)&v20, 2u);
    }
LABEL_15:

    v18 = *(void **)(a1 + 32);
    v19 = +[NSURL URLWithString:@"https://support.apple.com/HT201318"];
    [v18 launchURL:v19];

    goto LABEL_16;
  }
  v14 = _ICQGetLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    [v9 action];
    v15 = _ICQStringForAction();
    v16 = [v9 serverUIURL];
    int v20 = 138412546;
    v21 = v15;
    __int16 v22 = 2112;
    v23 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Detected upsell action %@, URL %@", (uint8_t *)&v20, 0x16u);
  }
  [*(id *)(a1 + 32) launchpostPurchaseFlowWithLink:v9 offer:v5];
LABEL_16:
}

void sub_10000315C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100004340(v6);
    }

    v8 = *(void **)(a1 + 32);
    uint64_t v9 = +[NSURL URLWithString:@"https://support.apple.com/HT201318"];
    [v8 launchURL:v9];
    goto LABEL_5;
  }
  [v5 setContext:*(void *)(a1 + 40)];
  v10 = [v5 actionBasedUniversalLinkSpecification];
  uint64_t v9 = [v10 icqLinkForContext:*(void *)(a1 + 40)];

  if (v9)
  {
    v11 = _ICQGetLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v34) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Found action based universal Link", (uint8_t *)&v34, 2u);
    }

    v12 = (char *)[v9 action];
    if ((unint64_t)(v12 - 112) <= 6 && ((1 << (v12 - 112)) & 0x4D) != 0)
    {
      id v13 = _ICQGetLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        [v9 action];
        v14 = _ICQStringForAction();
        v15 = [v9 serverUIURL];
        int v34 = 138412546;
        v35 = v14;
        __int16 v36 = 2112;
        v37 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Detected upsell action %@, URL %@", (uint8_t *)&v34, 0x16u);
      }
      [*(id *)(a1 + 32) launchFlowWithContext:*(void *)(a1 + 40) offer:v5];
      goto LABEL_5;
    }
    if (v12)
    {
      [*(id *)(a1 + 32) performActionForLink:v9];
      goto LABEL_5;
    }
    v19 = _ICQGetLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = *(void **)(a1 + 40);
      int v34 = 138412290;
      v35 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Potentially unkown action, falling back to KB article. url context: %@", (uint8_t *)&v34, 0xCu);
    }
    goto LABEL_28;
  }
  v16 = [v5 serverUIURL];

  if (!v16)
  {
    v21 = [v5 universalLink];
    id v22 = [v21 action];

    v23 = _ICQGetLogSystem();
    v19 = v23;
    if (v22)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = [v5 universalLink];
        int v34 = 138412290;
        v35 = v24;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Performing universal link action for link %@", (uint8_t *)&v34, 0xCu);
      }
      v25 = *(void **)(a1 + 32);
      v26 = [v5 universalLink];
      [v25 performActionForLink:v26];
      goto LABEL_29;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_1000043C8(a1 + 40, v19, v27, v28, v29, v30, v31, v32);
    }
LABEL_28:

    v33 = *(void **)(a1 + 32);
    v26 = +[NSURL URLWithString:@"https://support.apple.com/HT201318"];
    [v33 launchURL:v26];
LABEL_29:

    goto LABEL_5;
  }
  v17 = _ICQGetLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = [v5 serverUIURL];
    int v34 = 138412290;
    v35 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Launching upsell for URL %@", (uint8_t *)&v34, 0xCu);
  }
  [*(id *)(a1 + 32) launchFlowWithContext:*(void *)(a1 + 40)];
LABEL_5:
}

void sub_100003774(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000471C(a1, (uint64_t)v6, v7);
    }
  }
  v8 = _ICQGetLogSystem();
  uint64_t v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [v5 absoluteString];
      int v13 = 138412290;
      v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "handling resolved icq link %@", (uint8_t *)&v13, 0xCu);
    }
    [*(id *)(a1 + 40) handleICQLinkResult:[ICQLinkHandler resultFromURL:](ICQLinkHandler, "resultFromURL:", v5) url:v5];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100004690(a1);
    }

    id v11 = objc_alloc_init((Class)_LSOpenConfiguration);
    [v11 setAllowURLOverrides:0];
    v12 = +[LSApplicationWorkspace defaultWorkspace];
    [v12 openURL:*(void *)(a1 + 32) configuration:v11 completionHandler:&stru_1000082C0];
  }
}

void sub_10000391C(id a1, NSDictionary *a2, NSError *a3)
{
  v4 = a2;
  id v5 = a3;
  id v6 = _ICQGetLogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v7)
    {
      int v9 = 138412546;
      v10 = v4;
      __int16 v11 = 2112;
      v12 = v5;
      v8 = "Success %@ %@";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v9, 0x16u);
    }
  }
  else if (v7)
  {
    int v9 = 138412546;
    v10 = 0;
    __int16 v11 = 2112;
    v12 = v5;
    v8 = "Failure %@ %@";
    goto LABEL_6;
  }
}

void sub_100003A24(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_100003BA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 48) processResolvedURL:a2 originalURL:*(void *)(a1 + 32) resolutionError:a3 completion:*(void *)(a1 + 40)];
}

uint64_t start(int a1, char **a2)
{
  id v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  id v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

void sub_100003F34(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Attempted to launch success flow without universalSuccessInfoLink. Bailing.", v1, 2u);
}

void sub_100003F78(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100003FE4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100004050(os_log_t log)
{
  int v1 = 136315138;
  v2 = "-[ICQLinkAppDelegate_iOS handleAMSLinkWithURL:]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s No url provided. Bailing.", (uint8_t *)&v1, 0xCu);
}

void sub_1000040D4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000414C(char a1, NSObject *a2)
{
  int v2 = 136315394;
  v3 = "-[ICQLinkAppDelegate_iOS handleAMSLinkWithURL:]";
  __int16 v4 = 1024;
  int v5 = a1 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s Launched deepink for AMS: %d", (uint8_t *)&v2, 0x12u);
}

void sub_1000041DC()
{
  v1[0] = 136315394;
  sub_1000025F0();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s Unable to open deeplink for AMS. %@", (uint8_t *)v1, 0x16u);
}

void sub_10000425C(void *a1, NSObject *a2)
{
  v3 = [a1 absoluteString];
  v4[0] = 136315394;
  sub_1000025F0();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s Preparing to handle CIP link with url %@.", (uint8_t *)v4, 0x16u);
}

void sub_1000042FC(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "We could not detect a universal success link in this offer payload. Bailing.", v1, 2u);
}

void sub_100004340(void *a1)
{
  int v1 = [a1 localizedDescription];
  sub_100003A24((void *)&_mh_execute_header, v2, v3, "Unable to retrieve default offer for universal link due to error %@. Falling back to KB article.", v4, v5, v6, v7, 2u);
}

void sub_1000043C8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100004438(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000044B0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100004528(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000045A0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100004618(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100004690(uint64_t a1)
{
  int v1 = [*(id *)(a1 + 32) absoluteString];
  sub_100003A24((void *)&_mh_execute_header, v2, v3, "Could not resolve url %@, falling back to the browser", v4, v5, v6, v7, 2u);
}

void sub_10000471C(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error resolving url %@, error: %@", (uint8_t *)&v4, 0x16u);
}

void sub_1000047A8()
{
  sub_100003D64();
  sub_1000025D4((void *)&_mh_execute_header, v0, v1, "failed to resolve chatterbox URL %@ with unknown error.", v2, v3, v4, v5, v6);
}

void sub_100004810()
{
  sub_100003D64();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "failed to resolve chatterbox URL %@ with error: %@.", v2, 0x16u);
}

void sub_100004894()
{
  sub_100003D64();
  sub_1000025D4((void *)&_mh_execute_header, v0, v1, "chatterbox URL resolved to itself! %@", v2, v3, v4, v5, v6);
}

void sub_1000048FC()
{
  sub_100003D64();
  sub_1000025D4((void *)&_mh_execute_header, v0, v1, "chatterbox URL resolved to unexpected URL! %@", v2, v3, v4, v5, v6);
}

void sub_100004964(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 absoluteString];
  int v4 = 136315394;
  uint64_t v5 = "+[ICQDeeplinkHelper deeplinkFromURL:]";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s Generated deeplink url: %@", (uint8_t *)&v4, 0x16u);
}

uint64_t ICQCreateError()
{
  return _ICQCreateError();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

uint64_t _ICQGetLogSystem()
{
  return __ICQGetLogSystem();
}

uint64_t _ICQStringForAction()
{
  return __ICQStringForAction();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return [a1 action];
}

id objc_msgSend_actionBasedUniversalLinkSpecification(void *a1, const char *a2, ...)
{
  return [a1 actionBasedUniversalLinkSpecification];
}

id objc_msgSend_actionURL(void *a1, const char *a2, ...)
{
  return [a1 actionURL];
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return [a1 activityType];
}

id objc_msgSend_alphanumericCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 alphanumericCharacterSet];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_launchSettingsDeeplink(void *a1, const char *a2, ...)
{
  return [a1 launchSettingsDeeplink];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return [a1 queryItems];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_serverUIURL(void *a1, const char *a2, ...)
{
  return [a1 serverUIURL];
}

id objc_msgSend_sharedOfferManager(void *a1, const char *a2, ...)
{
  return [a1 sharedOfferManager];
}

id objc_msgSend_universalLink(void *a1, const char *a2, ...)
{
  return [a1 universalLink];
}

id objc_msgSend_universalSuccessLink(void *a1, const char *a2, ...)
{
  return [a1 universalSuccessLink];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_webpageURL(void *a1, const char *a2, ...)
{
  return [a1 webpageURL];
}