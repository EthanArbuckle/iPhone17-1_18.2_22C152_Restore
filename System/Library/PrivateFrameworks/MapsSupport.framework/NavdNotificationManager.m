@interface NavdNotificationManager
- (void)clearAirportArrivalBulletin;
- (void)clearMapsSuggestionsBulletin;
- (void)clearVenueBulletin;
- (void)showAirportArrivalBulletinWithTitle:(id)a3 message:(id)a4 mapRegion:(id)a5 regionName:(id)a6;
- (void)showMapsSuggestionsBulletinWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5;
- (void)showPredictedRouteTrafficIncidentBulletinForCommuteDetails:(id)a3;
- (void)showVenueBulletinWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5;
@end

@implementation NavdNotificationManager

- (void)showPredictedRouteTrafficIncidentBulletinForCommuteDetails:(id)a3
{
  id v3 = a3;
  v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = [v3 title];
    v6 = [v3 message];
    int v8 = 138412546;
    v9 = v5;
    __int16 v10 = 2112;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Traffic notification posted with title: \"%@\" and message: \"%@\"", (uint8_t *)&v8, 0x16u);
  }
  v7 = [sub_100049B58() sharedInstance];
  [v7 showPredictedRouteTrafficIncidentBulletinForCommuteDetails:v3];
}

- (void)showMapsSuggestionsBulletinWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  __int16 v10 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412546;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "MapsSuggestions notification posted with title: \"%@\" and message: \"%@\"", (uint8_t *)&v12, 0x16u);
  }

  v11 = [sub_100049B58() sharedInstance];
  [v11 showMapsSuggestionsBulletinWithTitle:v7 message:v8 actionURL:v9];
}

- (void)clearMapsSuggestionsBulletin
{
  id v2 = [sub_100049B58() sharedInstance];
  [v2 clearMapsSuggestionsBulletin];
}

- (void)showAirportArrivalBulletinWithTitle:(id)a3 message:(id)a4 mapRegion:(id)a5 regionName:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412546;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Airport arrival notification posted with title: \"%@\" and message: \"%@\"", (uint8_t *)&v15, 0x16u);
  }

  __int16 v14 = [sub_100049B58() sharedInstance];
  [v14 showAirportArrivalBulletinWithTitle:v9 message:v10 mapRegion:v12 regionName:v11];
}

- (void)clearAirportArrivalBulletin
{
  id v2 = [sub_100049B58() sharedInstance];
  [v2 clearAirportArrivalBulletin];
}

- (void)showVenueBulletinWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412546;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Venue notification posted with title: \"%@\" and message: \"%@\"", (uint8_t *)&v12, 0x16u);
  }

  id v11 = [sub_100049B58() sharedInstance];
  [v11 showVenueBulletinWithTitle:v7 message:v8 actionURL:v9];
}

- (void)clearVenueBulletin
{
  id v2 = [sub_100049B58() sharedInstance];
  [v2 clearVenueBulletin];
}

@end