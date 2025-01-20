@interface ICQLinkAppDelegate
- (BOOL)handleAMSLinkWithURL:(id)a3;
- (BOOL)handleICQLinkResult:(int64_t)a3 url:(id)a4;
- (BOOL)handleSkipCFUWithURL:(id)a3;
- (BOOL)handleUniversalLinkWithUserActivity:(id)a3;
- (void)handleChatterBoxURL:(id)a3;
- (void)handleUniversalLinkResultWithContext:(id)a3 offerManager:(id)a4;
- (void)handleUniversalSuccessLinkResultWithContext:(id)a3 offerManager:(id)a4;
- (void)launchFlowWithContext:(id)a3;
- (void)launchSettingsDeeplink;
- (void)launchURL:(id)a3;
- (void)performActionForLink:(id)a3;
@end

@implementation ICQLinkAppDelegate

- (BOOL)handleUniversalLinkWithUserActivity:(id)a3
{
  v4 = +[ICQLinkHandler urlFromUserActivity:a3];
  v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 absoluteString];
    int v9 = 138412290;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "handling universal link %@", (uint8_t *)&v9, 0xCu);
  }
  BOOL v7 = [(ICQLinkAppDelegate *)self handleICQLinkResult:+[ICQLinkHandler resultFromURL:v4] url:v4];

  return v7;
}

- (BOOL)handleICQLinkResult:(int64_t)a3 url:(id)a4
{
  id v6 = a4;
  BOOL v7 = v6;
  switch(a3)
  {
    case 1:
      v8 = [v6 absoluteString];
      int v9 = +[ICQOfferManager sharedOfferManager];
      [(ICQLinkAppDelegate *)self handleUniversalLinkResultWithContext:v8 offerManager:v9];

      goto LABEL_10;
    case 2:
      goto LABEL_9;
    case 3:
      [(ICQLinkAppDelegate *)self launchSettingsDeeplink];
      goto LABEL_11;
    case 4:
      unsigned __int8 v11 = [(ICQLinkAppDelegate *)self handleSkipCFUWithURL:v6];
      goto LABEL_7;
    case 5:
      unsigned __int8 v11 = [(ICQLinkAppDelegate *)self handleAMSLinkWithURL:v6];
LABEL_7:
      BOOL v10 = v11;
      break;
    case 6:
      [(ICQLinkAppDelegate *)self handleChatterBoxURL:v6];
LABEL_9:
      v8 = +[ICQOfferManager sharedOfferManager];
      [(ICQLinkAppDelegate *)self handleUniversalSuccessLinkResultWithContext:v7 offerManager:v8];
LABEL_10:

LABEL_11:
      BOOL v10 = 1;
      break;
    default:
      BOOL v10 = 0;
      break;
  }

  return v10;
}

- (void)handleUniversalSuccessLinkResultWithContext:(id)a3 offerManager:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100002E30;
  v6[3] = &unk_100008280;
  v6[4] = self;
  id v7 = a3;
  id v5 = v7;
  [a4 getDefaultOfferWithCompletion:v6];
}

- (void)handleUniversalLinkResultWithContext:(id)a3 offerManager:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000315C;
  v6[3] = &unk_100008280;
  v6[4] = self;
  id v7 = a3;
  id v5 = v7;
  [a4 getDefaultOfferWithCompletion:v6];
}

- (void)performActionForLink:(id)a3
{
}

- (void)launchFlowWithContext:(id)a3
{
  v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100004438(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (void)launchSettingsDeeplink
{
  v2 = _ICQGetLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1000044B0(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (void)launchURL:(id)a3
{
  uint64_t v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100004528(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (BOOL)handleSkipCFUWithURL:(id)a3
{
  uint64_t v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_1000045A0(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  return 0;
}

- (BOOL)handleAMSLinkWithURL:(id)a3
{
  uint64_t v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100004618(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  return 0;
}

- (void)handleChatterBoxURL:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100003774;
  v5[3] = &unk_1000082E8;
  id v6 = a3;
  uint64_t v7 = self;
  id v4 = v6;
  +[ICQRedirectResolver resolveWithURL:v4 completion:v5];
}

@end