@interface MapsPushManager
+ (id)defaultManager;
+ (id)fakeDevicesFromNames:(id)a3;
- (APSConnection)apsConnection;
- (BOOL)shouldUseDevAPNS;
- (MapsPushDelegate)delegate;
- (MapsPushManager)init;
- (NSArray)devices;
- (id)_simulatedDetails;
- (id)_simulatedNotification;
- (id)_simulatedPlace;
- (id)_simulatedProblemResolutionResponse;
- (id)_simulatedProblemStatus;
- (id)devicePushToken;
- (id)devicePushTokenCompletion;
- (int64_t)_priorityForMessageOfType:(int64_t)a3;
- (void)_handleGenericIDSMessage:(id)a3;
- (void)_updateDevices;
- (void)connection:(id)a3 didFailToSendOutgoingMessage:(id)a4 error:(id)a5;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)dealloc;
- (void)fetchProblemStatus:(id)a3 problemReportIDs:(id)a4 manifestToken:(id)a5;
- (void)mapsInstallStateDidChange:(BOOL)a3;
- (void)propagateIDSMessageOfType:(int64_t)a3 message:(id)a4;
- (void)pushItem:(id)a3 toDevice:(id)a4;
- (void)registerForMapsICloudPushTopic;
- (void)sendRAPStatusChangeNotification:(id)a3;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)setApsConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDevicePushTokenCompletion:(id)a3;
- (void)setShouldUseDevAPNS:(BOOL)a3;
- (void)setUpPushConnection;
- (void)simulateProblemResolution;
- (void)simulateRAPStatusChange;
- (void)simulateUGCPhotoAttributionClearedNotification;
- (void)simulateUGCPhotoSubmissionResolution;
@end

@implementation MapsPushManager

+ (id)defaultManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000095BC;
  block[3] = &unk_100038BC8;
  block[4] = a1;
  if (qword_1000474E0 != -1) {
    dispatch_once(&qword_1000474E0, block);
  }
  v2 = (void *)qword_1000474D8;

  return v2;
}

- (MapsPushManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)MapsPushManager;
  v2 = [(MapsPushManager *)&v8 init];
  if (v2)
  {
    v3 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.maps"];
    service = v2->_service;
    v2->_service = v3;

    [(IDSService *)v2->_service addDelegate:v2 queue:&_dispatch_main_q];
    [(MapsPushManager *)v2 _updateDevices];
    v5 = +[MSPMapsInstallState sharedState];
    [v5 registerMapsInstallStateObserver:v2];

    v6 = v2;
  }

  return v2;
}

- (void)dealloc
{
  v3 = +[MSPMapsInstallState sharedState];
  [v3 unregisterMapsInstallStateObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MapsPushManager;
  [(MapsPushManager *)&v4 dealloc];
}

- (void)_updateDevices
{
  v22 = +[NSMutableArray array];
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    objc_super v4 = [(IDSService *)self->_service devices];
    *(_DWORD *)buf = 138412290;
    v35 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Updating devices from full list: %@", buf, 0xCu);
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v20 = self;
  id obj = [(IDSService *)self->_service devices];
  id v5 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v23 = *(void *)v29;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(obj);
        }
        objc_super v8 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v9 = [v8 modelIdentifier];
        id v10 = [v9 length];

        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v11 = [&off_10003C358 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v25;
LABEL_10:
          uint64_t v14 = 0;
          while (1)
          {
            if (*(void *)v25 != v13) {
              objc_enumerationMutation(&off_10003C358);
            }
            uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8 * v14);
            v16 = [v8 modelIdentifier];
            LOBYTE(v15) = [v16 hasPrefix:v15];

            if (v15) {
              break;
            }
            if (v12 == (id)++v14)
            {
              id v12 = [&off_10003C358 countByEnumeratingWithState:&v24 objects:v32 count:16];
              if (v12) {
                goto LABEL_10;
              }
              goto LABEL_16;
            }
          }
        }
        else
        {
LABEL_16:
          if (v10)
          {
            GEOFindOrCreateLog();
            v17 = (MapsPushDevice *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(&v17->super, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v35 = v8;
              _os_log_impl((void *)&_mh_execute_header, &v17->super, OS_LOG_TYPE_DEBUG, "Skipping device without proper modelIdentifier prefix: %@", buf, 0xCu);
            }
            goto LABEL_22;
          }
        }
        v18 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v8;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Adding device to list: %@", buf, 0xCu);
        }

        v17 = [[MapsPushDevice alloc] initWithIDSDevice:v8];
        [(NSArray *)v22 addObject:v17];
LABEL_22:
      }
      id v6 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v6);
  }

  devices = v20->_devices;
  v20->_devices = v22;
}

- (void)pushItem:(id)a3 toDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = v7;
  if (!v7 || ([v7 isFake] & 1) == 0)
  {
    v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = [v8 device];
      *(_DWORD *)buf = 138412546;
      id v32 = v6;
      __int16 v33 = 2112;
      v34 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Pushing item: %@ to device %@", buf, 0x16u);
    }
    id v11 = [(IDSService *)self->_service accounts];
    id v12 = [v11 anyObject];

    if (v12)
    {
      uint64_t v13 = [v6 pushSubmissionData];
      uint64_t v14 = (void *)v13;
      if (v13)
      {
        CFStringRef v29 = @"syncedBookmarkData";
        uint64_t v30 = v13;
        uint64_t v15 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
        if (v8)
        {
          v16 = [v8 device];
          v17 = (void *)IDSCopyForDevice();
        }
        else
        {
          v17 = (void *)IDSCopyIDForAccount();
        }
        v20 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          id v32 = v15;
          __int16 v33 = 2112;
          v34 = v17;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Sending message: %@ to destination: %@", buf, 0x16u);
        }

        service = self->_service;
        v22 = +[NSSet setWithObject:v17];
        uint64_t v27 = IDSSendMessageOptionEncryptPayloadKey;
        long long v28 = &__kCFBooleanTrue;
        uint64_t v23 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        id v26 = 0;
        unsigned __int8 v24 = [(IDSService *)service sendMessage:v15 toDestinations:v22 priority:300 options:v23 identifier:0 error:&v26];
        id v25 = v26;

        if ((v24 & 1) == 0) {
          NSLog(@"Error sending message: %@", v25);
        }
      }
      else
      {
        v19 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v32 = v6;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "No sync data for item: %@", buf, 0xCu);
        }

        NSLog(@"ERROR: No sync data...");
      }
    }
    else
    {
      v18 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "No valid account found", buf, 2u);
      }

      NSLog(@"No valid account found...");
    }
  }
}

- (void)propagateIDSMessageOfType:(int64_t)a3 message:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    id v20 = v6;
    v37[0] = @"GenericIDSMessageData";
    v37[1] = @"GenericIDSMessageType";
    v38[0] = v6;
    objc_super v8 = +[NSNumber numberWithInteger:a3];
    v38[1] = v8;
    v9 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = [(IDSService *)self->_service devices];
    unsigned __int8 v24 = (char *)[obj countByEnumeratingWithState:&v26 objects:v36 count:16];
    if (v24)
    {
      uint64_t v23 = *(void *)v27;
      uint64_t v22 = IDSSendMessageOptionEncryptPayloadKey;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(void *)v27 != v23) {
            objc_enumerationMutation(obj);
          }
          id v11 = (void *)IDSCopyForDevice();
          id v12 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            __int16 v33 = v9;
            __int16 v34 = 2112;
            v35 = v11;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Sending message: %@ to destination: %@", buf, 0x16u);
          }

          service = self->_service;
          uint64_t v14 = +[NSSet setWithObject:v11];
          int64_t v15 = a3;
          int64_t v16 = [(MapsPushManager *)self _priorityForMessageOfType:a3];
          uint64_t v30 = v22;
          long long v31 = &__kCFBooleanTrue;
          v17 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
          id v25 = 0;
          LOBYTE(service) = [(IDSService *)service sendMessage:v9 toDestinations:v14 priority:v16 options:v17 identifier:0 error:&v25];
          v18 = v25;

          if ((service & 1) == 0)
          {
            v19 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              __int16 v33 = v18;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Error sending message: %@", buf, 0xCu);
            }
          }
          a3 = v15;
        }
        unsigned __int8 v24 = (char *)[obj countByEnumeratingWithState:&v26 objects:v36 count:16];
      }
      while (v24);
    }

    id v7 = v20;
  }
  else
  {
    v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Can't send nil message", buf, 2u);
    }
  }
}

- (void)_handleGenericIDSMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"GenericIDSMessageType"];
  id v6 = [v5 integerValue];

  if (v6 == (id)2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained clearRAPStatusChangeNotificationWithManager:self];
LABEL_9:

    goto LABEL_10;
  }
  if (v6 == (id)1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v9 = objc_alloc((Class)GEORPRapInfo);
    id v10 = [v4 objectForKeyedSubscript:@"GenericIDSMessageData"];
    id v11 = [v9 initWithData:v10];
    [WeakRetained pushManager:self receivedRAPStatusChangeNotification:v11];

    goto LABEL_9;
  }
  if (!v6)
  {
    id v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Received unknown generic message: %@", (uint8_t *)&v12, 0xCu);
    }
  }
LABEL_10:
}

- (int64_t)_priorityForMessageOfType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 2) {
    return 200;
  }
  else {
    return 300;
  }
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v9 = a4;
  id v7 = [(MapsPushManager *)self devicePushTokenCompletion];

  if (v7)
  {
    objc_super v8 = [(MapsPushManager *)self devicePushTokenCompletion];
    ((void (**)(void, id))v8)[2](v8, v9);
  }
  [(MapsPushManager *)self setDevicePushTokenCompletion:0];
}

- (void)connection:(id)a3 didFailToSendOutgoingMessage:(id)a4 error:(id)a5
{
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5 = a4;
  id v6 = [v5 topic];
  unsigned int v7 = [v6 isEqualToString:@"com.apple.maps.icloud"];

  if (v7)
  {
    objc_super v8 = [v5 userInfo];
    id v9 = [v8 objectForKeyedSubscript:@"nid"];

    id v10 = [v9 firstObject];
    id v11 = [v5 userInfo];
    int v12 = [v11 objectForKeyedSubscript:@"prid"];

    id v13 = [v5 userInfo];
    uint64_t v14 = [v13 objectForKeyedSubscript:@"mftoken"];

    int64_t v15 = [v5 userInfo];
    int64_t v16 = [v15 objectForKey:@"aps"];

    if (v16)
    {
      v17 = [v5 userInfo];
      v18 = [v17 objectForKeyedSubscript:@"aps"];
    }
    else
    {
      v18 = 0;
    }
    v19 = [v5 userInfo];
    id v20 = [v19 objectForKey:@"photoLiveness"];

    if (v20)
    {
      v42 = v14;
      v38 = v12;
      v39 = v10;
      v40 = v9;
      v21 = [v5 userInfo];
      uint64_t v22 = [v21 objectForKeyedSubscript:@"photoLiveness"];

      uint64_t v23 = [v22 objectForKeyedSubscript:@"muid"];
      id v24 = objc_alloc_init((Class)NSNumberFormatter);
      id v25 = [v24 numberFromString:v23];
      long long v26 = +[GEOMapURLBuilder URLForInternalBusiness:id:provider:](GEOMapURLBuilder, "URLForInternalBusiness:id:provider:", 0, [v25 unsignedLongValue], 0);

      v41 = v18;
      long long v27 = [v18 objectForKeyedSubscript:@"alert"];
      long long v28 = [v27 objectForKeyedSubscript:@"title"];
      long long v29 = [v27 objectForKeyedSubscript:@"body"];
      uint64_t v30 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v44 = v28;
        __int16 v45 = 2112;
        v46 = v29;
        __int16 v47 = 2112;
        v48 = v23;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "Did receive incoming message for ARP notification with title: %@, body: %@, and muid: %@", buf, 0x20u);
      }

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained pushManager:self receivedPhotoLivenessMUID:v23 title:v28 message:v29 actionURL:v26];

      id v10 = v39;
      id v9 = v40;
      int v12 = v38;
      goto LABEL_9;
    }
    id v32 = [v18 objectForKey:@"category"];

    if (v32)
    {
      __int16 v33 = [v18 objectForKeyedSubscript:@"category"];
      if ([v33 isEqualToString:@"ATTRIBUTION_NAME_CLEARED"])
      {
        v41 = v18;
        v42 = v14;
        __int16 v34 = [v18 objectForKeyedSubscript:@"alert"];
        v35 = [v34 objectForKeyedSubscript:@"title"];
        v36 = [v34 objectForKeyedSubscript:@"body"];
        id v37 = objc_loadWeakRetained((id *)&self->_delegate);
        [v37 pushManager:self receivedClearedPhotoAttributionNotificationWithTitle:v35 message:v36];

LABEL_9:
LABEL_15:

        goto LABEL_16;
      }
    }
    [(MapsPushManager *)self fetchProblemStatus:v10 problemReportIDs:v12 manifestToken:v14];

    goto LABEL_15;
  }
LABEL_16:
}

- (void)setUpPushConnection
{
  unsigned int v3 = [(MapsPushManager *)self shouldUseDevAPNS];
  id v4 = (id *)&APSEnvironmentDevelopment;
  if (!v3) {
    id v4 = (id *)&APSEnvironmentProduction;
  }
  id v5 = *v4;
  id v6 = objc_alloc((Class)APSConnection);
  unsigned int v7 = dispatch_get_global_queue(0, 0);
  id v8 = [v6 initWithEnvironmentName:v5 namedDelegatePort:@"com.apple.Maps.mapspushd.icloud" queue:v7];

  [v8 setDelegate:self];
  [(MapsPushManager *)self setApsConnection:v8];
}

- (BOOL)shouldUseDevAPNS
{
  v2 = +[NSFileManager defaultManager];
  unsigned int v3 = [v2 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.Maps"];
  id v4 = [v3 path];
  BOOL v5 = _CFPreferencesGetAppBooleanValueWithContainer() != 0;

  return v5;
}

- (void)setShouldUseDevAPNS:(BOOL)a3
{
  +[NSNumber numberWithBool:a3];
  id v5 = +[NSFileManager defaultManager];
  unsigned int v3 = [v5 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.Maps"];
  id v4 = [v3 path];
  _CFPreferencesSetAppValueWithContainer();
}

- (id)devicePushToken
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_10000AC54;
  uint64_t v22 = sub_10000AC64;
  id v23 = 0;
  int v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  uint64_t v14 = sub_10000AC6C;
  int64_t v15 = &unk_100038BF0;
  v17 = &v18;
  unsigned int v3 = dispatch_semaphore_create(0);
  int64_t v16 = v3;
  [(MapsPushManager *)self setDevicePushTokenCompletion:&v12];
  id v4 = [(MapsPushManager *)self apsConnection];

  if (!v4) {
    [(MapsPushManager *)self setUpPushConnection];
  }
  id v5 = [(MapsPushManager *)self apsConnection];
  [v5 invalidateTokenForTopic:@"com.apple.maps.icloud" identifier:0];

  id v6 = [(MapsPushManager *)self devicePushTokenCompletion];
  unsigned int v7 = [(MapsPushManager *)self apsConnection];
  id v8 = [v7 publicToken];
  ((void (**)(void, void *))v6)[2](v6, v8);

  dispatch_time_t v9 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v3, v9);
  [(MapsPushManager *)self setDevicePushTokenCompletion:0];
  id v10 = (id)v19[5];

  _Block_object_dispose(&v18, 8);

  return v10;
}

- (void)registerForMapsICloudPushTopic
{
  if (+[MSPMapsInstallState isMapsAppInstalled])
  {
    unsigned int v3 = [(MapsPushManager *)self apsConnection];

    if (!v3) {
      [(MapsPushManager *)self setUpPushConnection];
    }
    CFStringRef v6 = @"com.apple.maps.icloud";
    id v4 = +[NSArray arrayWithObjects:&v6 count:1];
    id v5 = [(MapsPushManager *)self apsConnection];
    [v5 _setEnabledTopics:v4];
  }
}

- (id)_simulatedPlace
{
  id v2 = objc_alloc_init((Class)GEOPDPlace);
  [v2 setMuid:0x8F98FC444E72B232];
  [v2 setResultProviderId:9902];
  [v2 setStatus:0];

  return v2;
}

- (id)_simulatedDetails
{
  id v3 = objc_alloc_init((Class)GEORPDetails);
  [v3 setDisplayStyle:2];
  [v3 setLocalizedTitle:@"Location Updated"];
  [v3 setLocalizedDescription:@"Thank you for the report you submitted on June 10, 2015. The information for the location “P T C R Jewellery Polishing” has been updated."];
  id v4 = objc_alloc_init((Class)GEOMapRegion);
  [v3 setDisplayRegion:v4];

  id v5 = [v3 displayRegion];
  [v5 setEastLng:-0.109615239];

  CFStringRef v6 = [v3 displayRegion];
  [v6 setNorthLat:51.5208347];

  unsigned int v7 = [v3 displayRegion];
  [v7 setSouthLat:51.5195643];

  id v8 = [v3 displayRegion];
  [v8 setWestLng:-0.111656927];

  dispatch_time_t v9 = [(MapsPushManager *)self _simulatedPlace];
  [v3 addPlace:v9];

  return v3;
}

- (id)_simulatedProblemStatus
{
  id v3 = objc_alloc_init((Class)GEORPProblemStatus);
  id v4 = +[NSString stringWithFormat:@"%d", rand()];
  [v3 setProblemId:v4];

  id v5 = +[NSDate dateWithTimeIntervalSinceNow:-604800.0];
  [v5 timeIntervalSinceReferenceDate];
  objc_msgSend(v3, "setCreationDate:");

  [v3 setProblemState:2];
  CFStringRef v6 = [(MapsPushManager *)self _simulatedNotification];
  [v3 setNotification:v6];

  unsigned int v7 = [(MapsPushManager *)self _simulatedDetails];
  [v3 setDetails:v7];

  return v3;
}

- (id)_simulatedNotification
{
  id v2 = objc_alloc_init((Class)GEORPNotification);
  [v2 setLocalizedText:@"The information for the location “P T C R Jewellery Polishing” has been updated."];
  [v2 setLocalizedTitle:@"Problem Fixed"];

  return v2;
}

- (id)_simulatedProblemResolutionResponse
{
  id v3 = objc_alloc_init((Class)GEORPProblemStatusResponse);
  [v3 setStatusCode:0];
  id v4 = [(MapsPushManager *)self _simulatedProblemStatus];
  [v3 addProblemStatus:v4];

  return v3;
}

- (void)simulateProblemResolution
{
  id v3 = [(MapsPushManager *)self _simulatedProblemResolutionResponse];
  if (v3)
  {
    dispatch_time_t v4 = dispatch_time(0, 10000000000);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10000B1CC;
    v5[3] = &unk_100038A18;
    v5[4] = self;
    id v6 = v3;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, v5);
  }
}

- (void)simulateRAPStatusChange
{
  id v10 = objc_alloc_init((Class)GEORPRapNotification);
  id v3 = objc_alloc_init((Class)GEOLocalizedString);
  [v3 setStringValue:@"title: Rap status change notification"];
  id v4 = objc_alloc_init((Class)GEOLocalizedString);
  [v4 setStringValue:@"text: Rap status change notification"];
  [v10 setTitle:v3];
  [v10 setBody:v4];
  id v5 = objc_alloc_init((Class)GEORPRapResponse);
  [v5 setNotification:v10];
  [v5 setResponseId:@"responseId"];
  id v6 = objc_alloc_init((Class)GEORPDisplayDetails);
  id v7 = objc_alloc_init((Class)GEOLocalizedString);
  [v7 setStringValue:@"Need More Information"];
  id v8 = objc_alloc_init((Class)GEOLocalizedString);
  [v8 setStringValue:@"We're stumped! We couldn't find any information about this business. Please send us a picture of the front door and any other details that can help us respond to your report."];
  [v6 setTitle:v7];
  [v6 setBody:v8];
  [v5 setDisplayDetails:v6];
  id v9 = objc_alloc_init((Class)GEORPRapInfo);
  [v9 setRapResponse:v5];
  [v9 setRapId:@"b4977ec0-4b44-11ed-a777-b33297611d8b"];
  [v9 setRapDisplayMenu:3];
  [(MapsPushManager *)self sendRAPStatusChangeNotification:v9];
}

- (void)simulateUGCPhotoSubmissionResolution
{
  id v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v15 = @"2258143483938644182";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Simulating a successful photo submission resolution for muid: %@", buf, 0xCu);
  }

  id v4 = objc_alloc_init((Class)NSNumberFormatter);
  id v5 = [v4 numberFromString:@"2258143483938644182"];
  id v6 = +[GEOMapURLBuilder URLForInternalBusiness:id:provider:](GEOMapURLBuilder, "URLForInternalBusiness:id:provider:", 0, [v5 unsignedLongValue], 0);

  dispatch_time_t v7 = dispatch_time(0, 10000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B594;
  block[3] = &unk_100038C18;
  block[4] = self;
  id v10 = @"2258143483938644182";
  id v11 = @"Your Photos Are Live";
  int v12 = @"The photos you added of Agnes Restaurant & Cheesery are now visible to everyone.";
  id v13 = v6;
  id v8 = v6;
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)simulateUGCPhotoAttributionClearedNotification
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained pushManager:self receivedClearedPhotoAttributionNotificationWithTitle:@"Choose a Different Nickname" message:@"The nickname you chose for photo credit isn’t available. Choose a different nickname."];
}

- (void)sendRAPStatusChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 data];
  [(MapsPushManager *)self propagateIDSMessageOfType:1 message:v5];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained pushManager:self receivedRAPStatusChangeNotification:v4];
}

- (void)fetchProblemStatus:(id)a3 problemReportIDs:(id)a4 manifestToken:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)GEORPProblemStatusRequest);
  [v11 setStatusNotificationId:v10];

  id v12 = [v9 mutableCopy];
  [v11 setProblemIds:v12];

  id v13 = +[GEORPUserCredentials _credentialsForPrimaryICloudAccount];
  [v11 setUserCredentials:v13];

  id v14 = objc_alloc_init((Class)GEORPClientCapabilities);
  [v11 setClientCapabilities:v14];

  CFStringRef v15 = [v11 clientCapabilities];
  [v15 setHasConstrainedProblemStatusSize:0];

  int64_t v16 = [v11 clientCapabilities];
  [v16 setHasNoOptInRequest:1];

  v17 = +[GEOPlatform sharedPlatform];
  uint64_t v18 = [v17 clientCapabilities];
  id v19 = [v18 transitMarketSupport];
  uint64_t v20 = [v11 clientCapabilities];
  [v20 setTransitMarketSupport:v19];

  [v11 populateAnalyticsMetadata];
  v21 = +[GEOUtilityService sharedService];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10000B8E8;
  v24[3] = &unk_100038CA8;
  id v25 = v11;
  long long v26 = self;
  id v27 = v8;
  id v22 = v8;
  id v23 = v11;
  [v21 getCurrentGeoServicesState:&_dispatch_main_q callback:v24];
}

+ (id)fakeDevicesFromNames:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v10 = [v9 lowercaseString];
        unsigned int v11 = [v10 hasSuffix:@"ipad"];

        if (v11) {
          CFStringRef v12 = @"iPad4,1";
        }
        else {
          CFStringRef v12 = @"iPhone5,3";
        }
        id v13 = [[FakeMapsPushDevice alloc] initWithName:v9 model:v12];
        [v4 addObject:v13];
      }
      id v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  return v4;
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Active Accounts changed", v6, 2u);
  }

  [(MapsPushManager *)self _updateDevices];
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Devices changed", v6, 2u);
  }

  [(MapsPushManager *)self _updateDevices];
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v40 = DefaultLoggingSubsystem;
  id v13 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v55 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Received message: %@", buf, 0xCu);
  }

  v42 = v12;
  id v43 = v9;
  id v14 = [v9 deviceForFromID:v12];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  CFStringRef v15 = v10;
  long long v16 = [v10 nearbyDevices];
  id v17 = [v16 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v49;
LABEL_5:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v49 != v19) {
        objc_enumerationMutation(v16);
      }
      v21 = objc_msgSend(*(id *)(*((void *)&v48 + 1) + 8 * v20), "uniqueID", v40);
      id v22 = [v14 uniqueID];
      unsigned __int8 v23 = [v21 isEqualToString:v22];

      if (v23) {
        break;
      }
      if (v18 == (id)++v20)
      {
        id v18 = [v16 countByEnumeratingWithState:&v48 objects:v53 count:16];
        if (v18) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v16 = [v15 devices];
    id v24 = [v16 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (!v24)
    {
LABEL_19:

      long long v31 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "Unexpected iCloud account. Ignoring.", buf, 2u);
      }

      NSLog(@"Unexpected iCloud account. Ignoring...");
      goto LABEL_24;
    }
    id v25 = v24;
    uint64_t v26 = *(void *)v45;
LABEL_13:
    uint64_t v27 = 0;
    while (1)
    {
      if (*(void *)v45 != v26) {
        objc_enumerationMutation(v16);
      }
      long long v28 = objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * v27), "uniqueID", v40);
      long long v29 = [v14 uniqueID];
      unsigned __int8 v30 = [v28 isEqualToString:v29];

      if (v30) {
        break;
      }
      if (v25 == (id)++v27)
      {
        id v25 = [v16 countByEnumeratingWithState:&v44 objects:v52 count:16];
        if (v25) {
          goto LABEL_13;
        }
        goto LABEL_19;
      }
    }
  }

  id v32 = [v11 objectForKeyedSubscript:@"GenericIDSMessageType"];

  if (v32)
  {
    [(MapsPushManager *)self _handleGenericIDSMessage:v11];
LABEL_24:
    __int16 v33 = v43;
    __int16 v34 = v15;
    goto LABEL_32;
  }
  v35 = [v11 objectForKeyedSubscript:@"syncedBookmarkData"];

  __int16 v34 = v15;
  if (v35)
  {
    v36 = [v11 objectForKeyedSubscript:@"syncedBookmarkData"];
    id v37 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "Passing data to delegate", buf, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained pushManager:self gotPushData:v36];

    __int16 v33 = v43;
  }
  else
  {
    v39 = GEOFindOrCreateLog();
    __int16 v33 = v43;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "Unexpected message body. Ignoring.", buf, 2u);
    }

    NSLog(@"Unexpected message body. Ignoring...");
  }
LABEL_32:
}

- (void)mapsInstallStateDidChange:(BOOL)a3
{
  if (a3)
  {
    [(MapsPushManager *)self registerForMapsICloudPushTopic];
  }
  else
  {
    CFStringRef v6 = @"com.apple.maps.icloud";
    id v4 = +[NSArray arrayWithObjects:&v6 count:1];
    id v5 = [(MapsPushManager *)self apsConnection];
    [v5 _setIgnoredTopics:v4];
  }
}

- (NSArray)devices
{
  return self->_devices;
}

- (MapsPushDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MapsPushDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (APSConnection)apsConnection
{
  return self->_apsConnection;
}

- (void)setApsConnection:(id)a3
{
}

- (id)devicePushTokenCompletion
{
  return self->_devicePushTokenCompletion;
}

- (void)setDevicePushTokenCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_devicePushTokenCompletion, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);
  objc_storeStrong((id *)&self->_devices, 0);

  objc_storeStrong((id *)&self->_service, 0);
}

@end