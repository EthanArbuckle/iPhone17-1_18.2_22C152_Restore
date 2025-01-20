@interface MapsSuggestionsOfflineDownloadNotificationAction
- (MapsSuggestionsOfflineDownloadNotificationAction)init;
- (MapsSuggestionsOfflineDownloadNotificationAction)initWithEntry:(id)a3 budget:(id)a4 completion:(id)a5;
- (NSString)uniqueName;
- (void)actWithHandler:(id)a3;
@end

@implementation MapsSuggestionsOfflineDownloadNotificationAction

- (MapsSuggestionsOfflineDownloadNotificationAction)init
{
}

- (MapsSuggestionsOfflineDownloadNotificationAction)initWithEntry:(id)a3 budget:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MapsSuggestionsOfflineDownloadNotificationAction;
  v12 = [(MapsSuggestionsOfflineDownloadNotificationAction *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_entry, a3);
    objc_storeStrong((id *)&v13->_budget, a4);
    id v14 = objc_retainBlock(v11);
    id handler = v13->_handler;
    v13->_id handler = v14;

    v13->_hasBeenTriggered = 0;
  }

  return v13;
}

- (void)actWithHandler:(id)a3
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_hasBeenTriggered)
  {
    objc_sync_exit(obj);
  }
  else
  {
    obj->_hasBeenTriggered = 1;
    objc_sync_exit(obj);

    v3 = [(MapsSuggestionsEntry *)obj->_entry stringForKey:@"MapsSuggestionsFlightArrivalAirportLocalityKey"];
    if (v3)
    {
      v4 = [(MapsSuggestionsEntry *)obj->_entry numberForKey:@"MapsSuggestionsFlightArrivalAirportLatitudeKey"];
      [v4 doubleValue];

      v5 = [(MapsSuggestionsEntry *)obj->_entry numberForKey:@"MapsSuggestionsFlightArrivalAirportLongitudeKey"];
      [v5 doubleValue];

      v6 = objc_alloc_init((Class)GEOMapDataSubscriptionManager);
      GEOConfigGetInteger();
      GEOMapRectMakeWithRadialDistance();
      id v11 = objc_msgSend(objc_alloc((Class)GEOMapRegion), "initWithMapRect:", v7, v8, v9, v10);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10004428C;
      v16[3] = &unk_10008C2C8;
      v16[4] = obj;
      id v17 = v3;
      id v12 = v11;
      id v18 = v12;
      id v13 = [v6 determineEstimatedSizeForSubscriptionWithRegion:v12 dataTypes:1024 queue:&_dispatch_main_q completionHandler:v16];
      id handler = (void (**)(void))obj->_handler;
      if (handler) {
        handler[2]();
      }
    }
    else
    {
      v6 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "MapsSuggestionsFlightArrivalAirportLocalityKey is nil, not showing notification.", buf, 2u);
      }
    }
  }
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();

  return (NSString *)[v2 description];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_budget, 0);

  objc_storeStrong((id *)&self->_entry, 0);
}

@end