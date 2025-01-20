@interface ADBiomeStreamProcessor
+ (id)processorForBMSiriHomeSeed:(id)a3 homeId:(id)a4 account:(id)a5;
+ (id)processorForBMSiriHomeSeed:(id)a3 homeId:(id)a4 userId:(id)a5;
+ (id)processorForBMSiriUserAggregationId:(id)a3 userId:(id)a4;
+ (id)processorForBMSiriUserSeed:(id)a3 userId:(id)a4;
- (ADBiomeStreamProcessor)initWithStream:(id)a3 fromBM:(id)a4 toBM:(id)a5 time:(id)a6 account:(id)a7 homeId:(id)a8 remoteDeviceTypes:(unint64_t)a9;
- (ADBiomeStreamProcessor)initWithStream:(id)a3 fromBM:(id)a4 toBM:(id)a5 time:(id)a6 userId:(id)a7 homeId:(id)a8 remoteDeviceTypes:(unint64_t)a9;
- (id)_merge:(id)a3 with:(id)a4;
- (id)_mergeRemotes:(id)a3;
- (id)_processPerDeviceEvents:(id)a3;
- (id)fetchIdItemPair;
- (id)fetchLocalIdItemPair;
@end

@implementation ADBiomeStreamProcessor

- (void).cxx_destruct
{
  objc_storeStrong(&self->_homeFilter, 0);
  objc_storeStrong((id *)&self->_accountId, 0);
  objc_storeStrong((id *)&self->_homeId, 0);
  objc_storeStrong((id *)&self->_today, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong(&self->_toBMMapper, 0);
  objc_storeStrong(&self->_fromBMMapper, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

- (id)_processPerDeviceEvents:(id)a3
{
  id v4 = a3;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  int v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  int v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  int v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  int v21 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  int v19 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001AE3E4;
  v17[3] = &unk_100505870;
  v17[4] = self;
  v17[5] = v26;
  v5 = [v4 filterWithIsIncluded:v17];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001AE508;
  v16[3] = &unk_100505898;
  v16[4] = self;
  v6 = [v5 mapWithTransform:v16];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001AE570;
  v15[3] = &unk_1005058C0;
  v15[4] = v20;
  v15[5] = v18;
  v7 = [v6 filterWithIsIncluded:v15];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001AE5A4;
  v14[3] = &unk_1005058E8;
  v14[4] = self;
  v14[5] = v24;
  v8 = [v7 filterWithIsIncluded:v14];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001AE5F4;
  v13[3] = &unk_100505910;
  v13[4] = self;
  v13[5] = v22;
  v13[6] = v20;
  v13[7] = v18;
  v9 = [v8 mapWithTransform:v13];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001AE774;
  v12[3] = &unk_100505938;
  v12[4] = self;
  v10 = [v9 reduceWithInitial:0 nextPartialResult:v12];

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);

  return v10;
}

- (id)_mergeRemotes:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_1001AE934;
  v17 = sub_1001AE944;
  id v18 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  int v12 = 0;
  v5 = [v4 merge];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001AE94C;
  v10[3] = &unk_100505820;
  v10[4] = v11;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001AEA94;
  v9[3] = &unk_100505848;
  v9[5] = v11;
  v9[6] = &v13;
  v9[4] = self;
  id v6 = [v5 sinkWithCompletion:v10 receiveInput:v9];

  id v7 = (id)v14[5];
  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v13, 8);

  return v7;
}

- (id)_merge:(id)a3 with:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[ADAnalyticsIdentifiersUtils logger];
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Attempting to merge %@", (uint8_t *)&v14, 0xCu);
    }

    uint64_t v9 = [v5 selectEarliest:v6];
    id v10 = v5;
    if ((id)v9 != v5)
    {
      v11 = (void *)v9;
      int v12 = +[ADAnalyticsIdentifiersUtils logger];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        int v14 = 138412290;
        id v15 = v11;
        _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Merged into %@", (uint8_t *)&v14, 0xCu);
      }

      id v10 = v11;
    }
  }
  else
  {
    if (v8)
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Starting merge with %@", (uint8_t *)&v14, 0xCu);
    }

    id v10 = v6;
  }

  return v10;
}

- (id)fetchLocalIdItemPair
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_1001AE934;
  v16 = sub_1001AE944;
  id v17 = 0;
  v3 = +[ADAnalyticsIdentifiersUtils logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Processing local events", buf, 2u);
  }

  id v4 = [objc_alloc((Class)BMPublisherOptions) initWithStartDate:0 endDate:0 maxEvents:10 lastN:0 reversed:1];
  id v5 = [(BMStream *)self->_stream publisherWithUseCase:@"PrivacyFriendlyAnalyticsIdentifiersProvider" options:v4];
  id v6 = [(ADBiomeStreamProcessor *)self _processPerDeviceEvents:v5];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001AEE94;
  v10[3] = &unk_1005057F8;
  v10[4] = &v12;
  id v7 = [v6 sinkWithCompletion:&stru_1005057D0 receiveInput:v10];

  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

- (id)fetchIdItemPair
{
  uint64_t v3 = [(ADBiomeStreamProcessor *)self fetchLocalIdItemPair];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1001AF63C;
  v40[3] = &unk_100505788;
  v40[4] = self;
  id v4 = objc_retainBlock(v40);
  if (self->_accountId)
  {
    id v5 = objc_alloc_init((Class)BMPublisherOptions);
    stream = self->_stream;
    id v7 = +[NSArray arrayWithObject:self->_accountId];
    id v8 = [(BMStream *)stream publishersForAccounts:v7 deviceTypes:self->_remoteDeviceTypes includeLocal:0 options:v5 useCase:@"PrivacyFriendlyAnalyticsIdentifiersProvider" pipeline:v4];

    id v9 = objc_alloc((Class)BMPublishers);
    id v10 = [v8 publishers];
    id v11 = [v9 initWithPublishers:v10];
  }
  else
  {
    uint64_t v12 = self->_stream;
    id v39 = 0;
    uint64_t v13 = [(BMStream *)v12 remoteDevicesWithError:&v39];
    id v5 = v39;
    if (v5)
    {
      uint64_t v14 = +[ADAnalyticsIdentifiersUtils logger];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v42 = (uint64_t)v5;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Fetching list of remote devices failed: %@", buf, 0xCu);
      }
    }
    id v15 = +[ADAnalyticsIdentifiersUtils logger];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v42 = (uint64_t)v13;
      _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Known remote devices: %@", buf, 0xCu);
    }

    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_1001AF648;
    v38[3] = &unk_1005057B0;
    v38[4] = self;
    v16 = +[NSPredicate predicateWithBlock:v38];
    id v8 = [v13 filteredArrayUsingPredicate:v16];

    id v17 = +[ADAnalyticsIdentifiersUtils logger];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v42 = (uint64_t)v8;
      _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Filtered remote devices: %@", buf, 0xCu);
    }

    id v18 = self->_stream;
    id v10 = +[NSNumber numberWithUnsignedLongLong:10];
    LOWORD(v37) = 1;
    -[BMStream publishersForDevices:withUseCase:startTime:endTime:maxEvents:lastN:reversed:includeLocal:pipeline:](v18, "publishersForDevices:withUseCase:startTime:endTime:maxEvents:lastN:reversed:includeLocal:pipeline:", v8, @"PrivacyFriendlyAnalyticsIdentifiersProvider", 0, 0, v10, 0, v37, v4);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  int v19 = v11;

  uint64_t v20 = [(ADBiomeStreamProcessor *)self _mergeRemotes:v19];
  int v21 = (void *)v20;
  if (!(v3 | v20))
  {
    v22 = +[ADAnalyticsIdentifiersUtils logger];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "No local or remote entries", buf, 2u);
    }

    int v23 = 0;
    goto LABEL_34;
  }
  if (v20)
  {
    if (!v3)
    {
      int v27 = +[ADAnalyticsIdentifiersUtils logger];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v42 = (uint64_t)v21;
        _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "Only remote entry is present: %@", buf, 0xCu);
      }

      int v23 = [[ADSynchronizedIdItemPair alloc] initWithRemote:v21];
      goto LABEL_28;
    }
    int v23 = [(id)v3 adoptRemoteIfEarly:v20];
    v24 = +[ADAnalyticsIdentifiersUtils logger];
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG);
    if (v23 != (ADSynchronizedIdItemPair *)v3)
    {
      if (v25)
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v42 = v3;
        __int16 v43 = 2112;
        uint64_t v44 = (uint64_t)v21;
        _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Discarding local: %@; keeping remote: %@",
          buf,
          0x16u);
      }

LABEL_28:
      v28 = +[ADAnalyticsIdentifiersUtils logger];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "Publishing the selected entries", buf, 2u);
      }

      v29 = [(BMStream *)self->_stream source];
      toBMMapper = (void (**)(id, void *))self->_toBMMapper;
      v31 = [(ADSynchronizedIdItemPair *)v23 current];
      v32 = toBMMapper[2](toBMMapper, v31);
      [v29 sendEvent:v32];

      v33 = (void (**)(id, void *))self->_toBMMapper;
      v34 = [(ADSynchronizedIdItemPair *)v23 next];
      v35 = v33[2](v33, v34);
      [v29 sendEvent:v35];

      goto LABEL_34;
    }
    if (v25)
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v42 = (uint64_t)v21;
      __int16 v43 = 2112;
      uint64_t v44 = v3;
      _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Discarding remote: %@; keeping local: %@",
        buf,
        0x16u);
    }

    int v23 = (ADSynchronizedIdItemPair *)v3;
  }
  else
  {
    v26 = +[ADAnalyticsIdentifiersUtils logger];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v42 = v3;
      _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Only local entry is present: %@", buf, 0xCu);
    }

    int v23 = (ADSynchronizedIdItemPair *)(id)v3;
  }
LABEL_34:

  return v23;
}

- (ADBiomeStreamProcessor)initWithStream:(id)a3 fromBM:(id)a4 toBM:(id)a5 time:(id)a6 account:(id)a7 homeId:(id)a8 remoteDeviceTypes:(unint64_t)a9
{
  id v37 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  int v21 = +[ADAnalyticsIdentifiersUtils logger];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v42 = v37;
    __int16 v43 = 2112;
    id v44 = v20;
    __int16 v45 = 2112;
    id v46 = v19;
    _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Initializing BiomeProcessor for stream:%@ homeId:%@ accountId:%@", buf, 0x20u);
  }

  v40.receiver = self;
  v40.super_class = (Class)ADBiomeStreamProcessor;
  v22 = [(ADBiomeStreamProcessor *)&v40 init];
  int v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_stream, a3);
    id v24 = objc_retainBlock(v16);
    id fromBMMapper = v23->_fromBMMapper;
    v23->_id fromBMMapper = v24;

    id v26 = objc_retainBlock(v17);
    id toBMMapper = v23->_toBMMapper;
    v23->_id toBMMapper = v26;

    uint64_t v28 = +[ADSynchronizedIdItem calendar];
    calendar = v23->_calendar;
    v23->_calendar = (NSCalendar *)v28;

    uint64_t v30 = +[ADSynchronizedIdItem alignToMidnight:v18];
    today = v23->_today;
    v23->_today = (NSDate *)v30;

    objc_storeStrong((id *)&v23->_accountId, a7);
    objc_storeStrong((id *)&v23->_homeId, a8);
    homeId = v23->_homeId;
    if (homeId)
    {
      v33 = v38;
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_1001AF928;
      v38[3] = &unk_100505760;
      a7 = &v39;
      id v39 = v20;
    }
    else
    {
      v33 = 0;
    }
    v34 = objc_retainBlock(v33);
    id homeFilter = v23->_homeFilter;
    v23->_id homeFilter = v34;

    v23->_remoteDeviceTypes = a9;
    if (homeId) {
  }
    }
  return v23;
}

- (ADBiomeStreamProcessor)initWithStream:(id)a3 fromBM:(id)a4 toBM:(id)a5 time:(id)a6 userId:(id)a7 homeId:(id)a8 remoteDeviceTypes:(unint64_t)a9
{
  id v15 = a7;
  id v16 = a8;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  if (v15)
  {
    id v21 = [objc_alloc((Class)BMAccount) initWithAccountIdentifier:v15];
    v22 = [(ADBiomeStreamProcessor *)self initWithStream:v20 fromBM:v19 toBM:v18 time:v17 account:v21 homeId:v16 remoteDeviceTypes:a9];

    int v23 = v22;
  }
  else
  {
    id v24 = [(ADBiomeStreamProcessor *)self initWithStream:v20 fromBM:v19 toBM:v18 time:v17 account:0 homeId:v16 remoteDeviceTypes:a9];

    int v23 = v24;
  }

  return v23;
}

+ (id)processorForBMSiriHomeSeed:(id)a3 homeId:(id)a4 account:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = +[ADAnalyticsIdentifiersUtils logger];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v26 = v7;
    __int16 v27 = 2112;
    id v28 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Initializing HomeSeed BiomeStreamProcessor for homeId:%@ account:%@", buf, 0x16u);
  }

  id v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  v22 = sub_1001AFCE8;
  int v23 = &unk_100505738;
  id v24 = v7;
  id v11 = v7;
  uint64_t v12 = objc_retainBlock(&v20);
  uint64_t v13 = [ADBiomeStreamProcessor alloc];
  uint64_t v14 = BiomeLibrary();
  id v15 = [v14 Siri];
  id v16 = [v15 AnalyticsIdentifiers];
  id v17 = [v16 HomeSeed];
  id v18 = -[ADBiomeStreamProcessor initWithStream:fromBM:toBM:time:account:homeId:remoteDeviceTypes:](v13, "initWithStream:fromBM:toBM:time:account:homeId:remoteDeviceTypes:", v17, &stru_100505710, v12, v9, v8, v11, 160, v20, v21, v22, v23);

  return v18;
}

+ (id)processorForBMSiriHomeSeed:(id)a3 homeId:(id)a4 userId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[ADAnalyticsIdentifiersUtils logger];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 138412546;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Initializing HomeSeed BiomeStreamProcessor for homeId:%@ userId:%@", (uint8_t *)&v15, 0x16u);
  }

  if (v10)
  {
    id v12 = [objc_alloc((Class)BMAccount) initWithAltDSID:v10];
    uint64_t v13 = [a1 processorForBMSiriHomeSeed:v8 homeId:v9 account:v12];
  }
  else
  {
    uint64_t v13 = [a1 processorForBMSiriHomeSeed:v8 homeId:v9 account:0];
  }

  return v13;
}

+ (id)processorForBMSiriUserAggregationId:(id)a3 userId:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ADAnalyticsIdentifiersUtils logger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Initializing UserAggregationId BiomeStreamProcessor for userId:%@", buf, 0xCu);
  }

  id v8 = [ADBiomeStreamProcessor alloc];
  id v9 = BiomeLibrary();
  id v10 = [v9 Siri];
  id v11 = [v10 AnalyticsIdentifiers];
  id v12 = [v11 UserAggregationId];
  uint64_t v13 = [(ADBiomeStreamProcessor *)v8 initWithStream:v12 fromBM:&stru_100505690 toBM:&stru_1005056D0 time:v6 userId:v5 homeId:0 remoteDeviceTypes:94];

  return v13;
}

+ (id)processorForBMSiriUserSeed:(id)a3 userId:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ADAnalyticsIdentifiersUtils logger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Initializing UserSeed BiomeStreamProcessor for userId:%@", buf, 0xCu);
  }

  id v8 = [ADBiomeStreamProcessor alloc];
  id v9 = BiomeLibrary();
  id v10 = [v9 Siri];
  id v11 = [v10 AnalyticsIdentifiers];
  id v12 = [v11 UserSeed];
  uint64_t v13 = [(ADBiomeStreamProcessor *)v8 initWithStream:v12 fromBM:&stru_100505610 toBM:&stru_100505650 time:v6 userId:v5 homeId:0 remoteDeviceTypes:94];

  return v13;
}

@end