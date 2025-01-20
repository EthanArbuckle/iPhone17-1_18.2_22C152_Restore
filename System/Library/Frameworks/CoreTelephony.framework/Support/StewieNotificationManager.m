@interface StewieNotificationManager
- (StewieNotificationManager)initWithQueue:(id)a3 localizationService:(shared_ptr<LocalizationInterface>)a4;
- (id).cxx_construct;
- (void)dismissNotification:(id)a3;
- (void)postNotification:(const void *)a3;
- (void)registerActions;
- (void)registerOfferCategory:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation StewieNotificationManager

- (StewieNotificationManager)initWithQueue:(id)a3 localizationService:(shared_ptr<LocalizationInterface>)a4
{
  id v5 = a3;
  v7.receiver = self;
  v7.super_class = (Class)StewieNotificationManager;
  if ([(StewieNotificationManager *)&v7 init]) {
    operator new();
  }

  return 0;
}

- (void)registerActions
{
  id location = 0;
  objc_initWeak(&location, self);
  fUserNotificationCenter = self->fUserNotificationCenter;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1011DA7F8;
  v4[3] = &unk_101A9DA18;
  objc_copyWeak(&v5, &location);
  [(UNUserNotificationCenter *)fUserNotificationCenter getNotificationCategoriesWithCompletionHandler:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)registerOfferCategory:(id)a3
{
  id v21 = a3;
  v4 = sub_100200FB4((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v28[0] = @"OffGridModeOfferAlert";
    v28[1] = @"OffGridModeOffer";
    id v5 = +[NSArray arrayWithObjects:v28 count:2];
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#I Registering '%@' notification categories", buf, 0xCu);
  }
  ptr = self->fLocalizationService.__ptr_;
  cntrl = self->fLocalizationService.__cntrl_;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  uint64_t v8 = kBifrostLocalizationTable;
  (*(void (**)(unsigned char *__return_ptr, LocalizationInterface *, void, const __CFString *, void))(*(void *)ptr + 40))(buf, ptr, kBifrostLocalizationTable, @"BIFROST_MESSAGING_LOCK_SCREEN_OTG_OFFER_ACTION_ACCEPT", 0);
  id v9 = *(id *)buf;
  sub_1000558F4((const void **)buf);
  (*(void (**)(unsigned char *__return_ptr, LocalizationInterface *, uint64_t, const __CFString *, void))(*(void *)ptr + 40))(buf, ptr, v8, @"BIFROST_MESSAGING_LOCK_SCREEN_OTG_OFFER_ACTION_DECLINE", 0);
  id v10 = *(id *)buf;
  sub_1000558F4((const void **)buf);
  if (v9 && v10)
  {
    v11 = [v21 mutableCopy];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1011DAD54;
    v22[3] = &unk_101A9DA40;
    v23 = @"OffGridModeOfferAlert";
    v24 = self;
    v25 = @"OffGridModeOffer";
    v12 = +[NSPredicate predicateWithBlock:v22];
    [v11 filterUsingPredicate:v12];

    v20 = +[UNNotificationCategory categoryWithIdentifier:@"OffGridModeOfferAlert" actions:&__NSArray0__struct intentIdentifiers:&__NSArray0__struct options:0];
    v13 = +[UNNotificationAction actionWithIdentifier:@"Accept" title:v9 options:4];
    v14 = +[UNNotificationAction actionWithIdentifier:@"Decline" title:v10 options:0];
    v27[0] = v14;
    v27[1] = v13;
    v15 = +[NSArray arrayWithObjects:v27 count:2];
    v16 = +[UNNotificationCategory categoryWithIdentifier:@"OffGridModeOffer" actions:v15 intentIdentifiers:&__NSArray0__struct options:131085];

    fUserNotificationCenter = self->fUserNotificationCenter;
    v26[0] = v20;
    v26[1] = v16;
    v18 = +[NSArray arrayWithObjects:v26 count:2];
    v19 = [v11 setByAddingObjectsFromArray:v18];
    [(UNUserNotificationCenter *)fUserNotificationCenter setNotificationCategories:v19];
  }
  else
  {
    v11 = sub_100200FB4((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to reteieve localized strings", buf, 2u);
    }
  }

  if (cntrl) {
    sub_10004D2C8((std::__shared_weak_count *)cntrl);
  }
}

- (void)postNotification:(const void *)a3
{
  id v5 = objc_opt_new();
  v6 = v5;
  if (*(void *)a3) {
    objc_super v7 = sub_1000810B8;
  }
  else {
    objc_super v7 = 0;
  }
  if (v7) {
    objc_msgSend(v5, "setTitle:");
  }
  if (*((void *)a3 + 1)) {
    uint64_t v8 = sub_1000810B8;
  }
  else {
    uint64_t v8 = 0;
  }
  if (v8) {
    objc_msgSend(v6, "setBody:");
  }
  id v9 = +[UNNotificationIcon iconForSystemImageNamed:@"satellite.wave.2.fill"];
  [v6 setIcon:v9];

  if (*((void *)a3 + 4)) {
    id v10 = sub_1000810B8;
  }
  else {
    id v10 = 0;
  }
  if (v10) {
    objc_msgSend(v6, "setCategoryIdentifier:");
  }
  [v6 setInterruptionLevel:2];
  [v6 setShouldHideDate:1];
  [v6 setShouldHideTime:1];
  [v6 setShouldIgnoreDowntime:1];
  [v6 setShouldIgnoreDoNotDisturb:1];
  [v6 setShouldPreemptPresentedNotification:1];
  [v6 setShouldDisplayActionsInline:*((unsigned __int8 *)a3 + 41)];
  [v6 setShouldBackgroundDefaultAction:1];
  if (*((unsigned char *)a3 + 40)) {
    uint64_t v11 = 6;
  }
  else {
    uint64_t v11 = 1;
  }
  v12 = +[UNNotificationRequest requestWithIdentifier:*((void *)a3 + 3) content:v6 trigger:0 destinations:v11];
  v13 = sub_100200FB4((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    v15 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#I Posting notification request: %@", (uint8_t *)&v14, 0xCu);
  }

  [(UNUserNotificationCenter *)self->fUserNotificationCenter addNotificationRequest:v12 withCompletionHandler:&stru_101A9DA60];
}

- (void)dismissNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_100200FB4((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I Dismissing notification: %@", buf, 0xCu);
  }

  fUserNotificationCenter = self->fUserNotificationCenter;
  id v8 = v4;
  objc_super v7 = +[NSArray arrayWithObjects:&v8 count:1];
  [(UNUserNotificationCenter *)fUserNotificationCenter removeDeliveredNotificationsWithIdentifiers:v7];
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(void))a5;
  id v9 = sub_100200FB4((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#I didReceiveNotificationResponse %@", (uint8_t *)&v10, 0xCu);
  }

  if (v8) {
    v8[2](v8);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->fUserNotificationCenter, 0);
  cntrl = self->fLocalizationService.__cntrl_;
  if (cntrl) {
    sub_10004D2C8((std::__shared_weak_count *)cntrl);
  }

  sub_100119D1C((ctu::OsLogLogger **)&self->logger, 0);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end