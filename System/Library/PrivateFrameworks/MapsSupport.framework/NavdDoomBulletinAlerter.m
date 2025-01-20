@interface NavdDoomBulletinAlerter
- (BOOL)_archiveDestination:(id)a3;
- (BOOL)alertBrokenRouteWithRecommendedAlternate:(id)a3 forDestination:(id)a4;
- (NavdDoomBulletinAlerter)initWithDoomStorage:(id)a3;
- (id)_alertStringFromPlaceFormattedString:(id)a3 destination:(id)a4;
@end

@implementation NavdDoomBulletinAlerter

- (NavdDoomBulletinAlerter)initWithDoomStorage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NavdDoomBulletinAlerter;
  v6 = [(NavdDoomBulletinAlerter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_storage, a3);
  }

  return v7;
}

- (BOOL)alertBrokenRouteWithRecommendedAlternate:(id)a3 forDestination:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = v6;
    v10 = [v9 names];
    id v11 = [v10 count];

    if (v11)
    {
      v12 = [v9 names];
      v13 = [v12 firstObject];
      v14 = [v13 name];
    }
    else
    {
      v14 = 0;
    }

    *(_DWORD *)buf = 138412290;
    v34 = v14;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Alerting of broken route with recommended alternate: %@", buf, 0xCu);
  }
  v15 = [[NavdDoomAlertFilters alloc] initWithDoomStorage:self->_storage];
  if ([(NavdDoomAlertFilters *)v15 shouldPresentAlertForDestination:v7])
  {
    v16 = [v6 outOfMapsAlertsInfo];
    v17 = [v16 alertNonRecommendedRouteText];
    v18 = [v17 title];
    v19 = [(NavdDoomBulletinAlerter *)self _alertStringFromPlaceFormattedString:v18 destination:v7];

    v20 = [v6 outOfMapsAlertsInfo];
    v21 = [v20 alertNonRecommendedRouteText];
    v22 = [v21 body];
    v23 = [(NavdDoomBulletinAlerter *)self _alertStringFromPlaceFormattedString:v22 destination:v7];

    if (v19) {
      BOOL v24 = v23 == 0;
    }
    else {
      BOOL v24 = 1;
    }
    BOOL v25 = !v24;
    if (v24)
    {
      v26 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "No title or no message for alert, will not display", buf, 2u);
      }
    }
    else
    {
      +[MapsSuggestionsEntry removeStaleArchivedDestinations];
      [(NavdDoomBulletinAlerter *)self _archiveDestination:v7];
      v26 = [v7 notificationDetailsWithTitle:v19 message:v23];
      v32 = objc_alloc_init(NavdNotificationManager);
      [(NavdNotificationManager *)v32 showPredictedRouteTrafficIncidentBulletinForCommuteDetails:v26];
      v27 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v34 = v19;
        __int16 v35 = 2112;
        v36 = v23;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Pushed a Doom notification with title=\"%@\" message=\"%@\"", buf, 0x16u);
      }

      v28 = [(NavdDoomStorage *)self->_storage newIncidentsForDestination:v7];
      if ([v28 count])
      {
        v29 = [(NavdDoomStorage *)self->_storage cachedIncidents];
        [v29 enumerateObjectsUsingBlock:&stru_100088D38];

        v30 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v28;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "These incidents should be suppressed until expired: %@", buf, 0xCu);
        }
      }
    }
  }
  else
  {
    v19 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Alert has been filtered and will not be presented", buf, 2u);
    }
    BOOL v25 = 0;
  }

  return v25;
}

- (id)_alertStringFromPlaceFormattedString:(id)a3 destination:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 type] == (id)1 && objc_msgSend(v5, "hasHome"))
  {
    uint64_t v7 = [v5 home];
  }
  else
  {
    if ([v6 type] != (id)2 || !objc_msgSend(v5, "hasWork")) {
      goto LABEL_8;
    }
    uint64_t v7 = [v5 work];
  }
  v8 = v7;
  if (v7)
  {
LABEL_10:
    id v9 = [v6 geoMapItem];
    v10 = +[NSDictionary _navigation_serverStringDictionaryForMapItem:v9];
    id v11 = [v10 mutableCopy];

    v12 = [v6 undecoratedTitle];

    if (v12)
    {
      v13 = [v6 undecoratedTitle];
      [v11 setObject:v13 forKey:@"{ClientDest}"];
    }
    v14 = +[NSString _navigation_stringForServerFormattedString:v8 abbreviatedUnits:1 detail:0 spoken:0 overrideVariables:v11];

    goto LABEL_13;
  }
LABEL_8:
  v8 = [v5 custom];
  if (v8) {
    goto LABEL_10;
  }
  v8 = [v5 unknown];
  if (v8) {
    goto LABEL_10;
  }
  v8 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    int v16 = 136446978;
    v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoomBulletinAlerter.m";
    __int16 v18 = 1024;
    int v19 = 116;
    __int16 v20 = 2082;
    v21 = "-[NavdDoomBulletinAlerter _alertStringFromPlaceFormattedString:destination:]";
    __int16 v22 = 2082;
    v23 = "nil == (formattedString)";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Empty alert strings", (uint8_t *)&v16, 0x26u);
  }
  v14 = 0;
LABEL_13:

  return v14;
}

- (BOOL)_archiveDestination:(id)a3
{
  if (a3) {
    [a3 archiveDestination];
  }
  return a3 != 0;
}

- (void).cxx_destruct
{
}

@end