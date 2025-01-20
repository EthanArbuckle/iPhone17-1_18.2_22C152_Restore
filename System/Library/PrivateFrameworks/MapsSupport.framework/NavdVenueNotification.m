@interface NavdVenueNotification
+ (void)hide;
+ (void)showWithMapItem:(id)a3 airport:(id)a4;
@end

@implementation NavdVenueNotification

+ (void)showWithMapItem:(id)a3 airport:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[GEOMapURLBuilder URLForInternalBusiness:id:provider:](GEOMapURLBuilder, "URLForInternalBusiness:id:provider:", 0, [v5 _muid], 0);
  v8 = GEOFindOrCreateLog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v9)
    {
      int v13 = 138412290;
      v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Venue notication URL : %@", (uint8_t *)&v13, 0xCu);
    }

    if (![v6 length])
    {
      uint64_t v10 = [v5 name];

      id v6 = (id)v10;
    }
    v8 = objc_alloc_init(NavdNotificationManager);
    v11 = MapsSuggestionsLocalizedTitleFormatForVenueWelcomeNotification();
    v12 = MapsSuggestionsLocalizedSubtitleForVenueWelcomeNotification();
    [v8 showVenueBulletinWithTitle:v11 message:v12 actionURL:v7];
  }
  else if (v9)
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Unable to build url for notification", (uint8_t *)&v13, 2u);
  }
}

+ (void)hide
{
  v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Remove Venue notication", v4, 2u);
  }

  v3 = objc_alloc_init(NavdNotificationManager);
  [(NavdNotificationManager *)v3 clearVenueBulletin];
}

@end