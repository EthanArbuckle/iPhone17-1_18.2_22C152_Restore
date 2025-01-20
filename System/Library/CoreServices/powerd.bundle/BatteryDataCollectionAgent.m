@interface BatteryDataCollectionAgent
- (BOOL)batteryChanged;
- (BOOL)collectAtPowerSourceChange;
- (BOOL)collectAtSBC;
- (BOOL)collectOnce;
- (BOOL)eventBasedCollection;
- (BOOL)neverPrune;
- (BOOL)skipCSVAndUsePowerlog;
- (BOOL)useBTMAsDataSource;
- (BOOL)useSmartChargingDataSource;
- (BatteryDataCollectionAgent)initWithParams:(id)a3 collectionBlock:(id)a4;
- (NSArray)columnNames;
- (NSNumber)collationPeriod;
- (NSNumber)collectionPeriod;
- (NSNumber)retentionPeriod;
- (NSString)dataGroupName;
- (NSString)dirPath;
- (NSString)formatVersion;
- (OS_dispatch_queue)collectionQueue;
- (OS_dispatch_source)collectionTimer;
- (id)collectionEventHandler;
- (id)createDataDictCollectionBlock;
- (id)description;
- (id)getLastDataLoggedTimestampDefaultsKey;
- (id)getLastUsedDataFileNameDefaultsKey;
- (id)shortDescription;
- (int)eventRegistrationToken;
- (unint64_t)getCollectionPeriod;
- (void)dealloc;
- (void)setBatteryChanged:(BOOL)a3;
- (void)setCollationPeriod:(id)a3;
- (void)setCollectAtPowerSourceChange:(BOOL)a3;
- (void)setCollectAtSBC:(BOOL)a3;
- (void)setCollectOnce:(BOOL)a3;
- (void)setCollectionEventHandler:(id)a3;
- (void)setCollectionPeriod:(id)a3;
- (void)setCollectionQueue:(id)a3;
- (void)setCollectionTimer:(id)a3;
- (void)setColumnNames:(id)a3;
- (void)setCreateDataDictCollectionBlock:(id)a3;
- (void)setDataGroupName:(id)a3;
- (void)setDirPath:(id)a3;
- (void)setEventBasedCollection:(BOOL)a3;
- (void)setEventRegistrationToken:(int)a3;
- (void)setFormatVersion:(id)a3;
- (void)setNeverPrune:(BOOL)a3;
- (void)setRetentionPeriod:(id)a3;
- (void)setSkipCSVAndUsePowerlog:(BOOL)a3;
- (void)setUseBTMAsDataSource:(BOOL)a3;
- (void)setUseSmartChargingDataSource:(BOOL)a3;
- (void)start;
- (void)stop;
@end

@implementation BatteryDataCollectionAgent

- (BatteryDataCollectionAgent)initWithParams:(id)a3 collectionBlock:(id)a4
{
  v34.receiver = self;
  v34.super_class = (Class)BatteryDataCollectionAgent;
  v6 = [(BatteryDataCollectionAgent *)&v34 init];
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_ERROR)) {
      sub_100066E34();
    }
    return 0;
  }
  -[BatteryDataCollectionAgent setDataGroupName:](v6, "setDataGroupName:", [a3 objectForKeyedSubscript:@"DataGroupName"]);
  -[BatteryDataCollectionAgent setFormatVersion:](v6, "setFormatVersion:", [a3 objectForKeyedSubscript:@"DataFormatVersion"]);
  -[BatteryDataCollectionAgent setDirPath:](v6, "setDirPath:", [a3 objectForKeyedSubscript:@"DataFilePath"]);
  -[BatteryDataCollectionAgent setColumnNames:](v6, "setColumnNames:", [a3 objectForKeyedSubscript:@"DataColumnNames"]);
  [(BatteryDataCollectionAgent *)v6 setCreateDataDictCollectionBlock:a4];
  -[BatteryDataCollectionAgent setCollectionPeriod:](v6, "setCollectionPeriod:", [a3 objectForKeyedSubscript:@"DataCollectionPeriod"]);
  -[BatteryDataCollectionAgent setCollectAtSBC:](v6, "setCollectAtSBC:", objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"DataCollectionAtSBC"), "BOOLValue"));
  -[BatteryDataCollectionAgent setCollectAtPowerSourceChange:](v6, "setCollectAtPowerSourceChange:", objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"DataCollectAtPowerSourceChange"), "BOOLValue"));
  -[BatteryDataCollectionAgent setCollectOnce:](v6, "setCollectOnce:", objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"DataCollectionOnce"), "BOOLValue"));
  -[BatteryDataCollectionAgent setCollationPeriod:](v6, "setCollationPeriod:", [a3 objectForKeyedSubscript:@"DataCollationPeriod"]);
  -[BatteryDataCollectionAgent setRetentionPeriod:](v6, "setRetentionPeriod:", [a3 objectForKeyedSubscript:@"DataRetentionPeriod"]);
  -[BatteryDataCollectionAgent setBatteryChanged:](v6, "setBatteryChanged:", objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"BatteryChanged"), "BOOLValue"));
  [(BatteryDataCollectionAgent *)v6 setEventRegistrationToken:0];
  -[BatteryDataCollectionAgent setSkipCSVAndUsePowerlog:](v6, "setSkipCSVAndUsePowerlog:", objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"SkipCSVUsePowerlog"), "BOOLValue"));
  -[BatteryDataCollectionAgent setUseBTMAsDataSource:](v6, "setUseBTMAsDataSource:", objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"useBTM"), "BOOLValue"));
  -[BatteryDataCollectionAgent setUseSmartChargingDataSource:](v6, "setUseSmartChargingDataSource:", objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"useSC"), "BOOLValue"));
  BOOL v7 = v6->_collectOnce || v6->_collectAtPowerSourceChange || v6->_useSmartChargingDataSource;
  [(BatteryDataCollectionAgent *)v6 setEventBasedCollection:v7];
  uint64_t v8 = (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"DataNeverPrune"), "BOOLValue") & 1) != 0
    || [(BatteryDataCollectionAgent *)v6 skipCSVAndUsePowerlog];
  [(BatteryDataCollectionAgent *)v6 setNeverPrune:v8];
  v9 = [+[NSString stringWithFormat:@"%@.%@", @"com.apple.powerd.bdc.collectionqueue", [(BatteryDataCollectionAgent *)v6 dataGroupName]] UTF8String];
  v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6->_collectionQueue = (OS_dispatch_queue *)dispatch_queue_create(v9, v10);
  v6->_collectionTimer = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)[(BatteryDataCollectionAgent *)v6 collectionQueue]);
  if (v6->_eventBasedCollection
    || (collectionPeriod = v6->_collectionPeriod,
        collectionPeriod != (NSNumber *)+[NSNull null])
    && [(NSNumber *)v6->_collectionPeriod intValue] > 0)
  {
    char v11 = 0;
  }
  else
  {
    v13 = qword_1000A3508;
    if (os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_ERROR)) {
      sub_100066E9C((uint64_t)v6, (id *)&v6->_collectionPeriod, v13);
    }
    char v11 = 1;
  }
  if (!v6->_neverPrune)
  {
    retentionPeriod = v6->_retentionPeriod;
    if (retentionPeriod == (NSNumber *)+[NSNull null]
      || [(NSNumber *)v6->_retentionPeriod intValue] <= 0)
    {
      if (os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_ERROR)) {
        sub_100066E68();
      }
      goto LABEL_36;
    }
  }
  if (v11)
  {
LABEL_36:

    return 0;
  }
  objc_initWeak(&location, v6);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100025D38;
  v31[3] = &unk_100091DF0;
  objc_copyWeak(&v32, &location);
  v31[4] = v6;
  [(BatteryDataCollectionAgent *)v6 setCollectionEventHandler:v31];
  id v15 = objc_msgSend((id)qword_1000A47E8, "objectForKey:", -[BatteryDataCollectionAgent getLastDataLoggedTimestampDefaultsKey](v6, "getLastDataLoggedTimestampDefaultsKey"));
  int64_t v16 = 1000000000;
  if (v15)
  {
    int64_t v16 = 1000000000;
    if (![(BatteryDataCollectionAgent *)v6 eventBasedCollection])
    {
      int64_t v16 = 1000000000;
      if (![(BatteryDataCollectionAgent *)v6 skipCSVAndUsePowerlog])
      {
        [(NSDate *)sub_100021BA0() timeIntervalSinceDate:v15];
        double v18 = v17;
        [(NSNumber *)[(BatteryDataCollectionAgent *)v6 collectionPeriod] doubleValue];
        double v20 = v19;
        unsigned int v21 = [objc_msgSend((id)qword_1000A47E8 stringForKey:-[BatteryDataCollectionAgent getLastUsedDataFileNameDefaultsKey](v6, "getLastUsedDataFileNameDefaultsKey")), "containsString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"version%@", v6->_formatVersion)];
        unsigned int v22 = v21;
        double v23 = v20 / 1000.0;
        if (v18 < v23) {
          unsigned int v24 = v21;
        }
        else {
          unsigned int v24 = 0;
        }
        int64_t v16 = 1000000000;
        if (v24 == 1)
        {
          if (1000000000 * (unint64_t)(v23 - v18) <= 0x989680) {
            int64_t v16 = 10000000;
          }
          else {
            int64_t v16 = 1000000000 * (unint64_t)(v23 - v18);
          }
        }
        v25 = qword_1000A3508;
        if (os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_DEFAULT))
        {
          v26 = [(BatteryDataCollectionAgent *)v6 dataGroupName];
          *(_DWORD *)buf = 138413314;
          v36 = v26;
          __int16 v37 = 2112;
          id v38 = v15;
          __int16 v39 = 2048;
          double v40 = v23;
          __int16 v41 = 2048;
          double v42 = (double)(unint64_t)v16 / 1000000000.0;
          __int16 v43 = 1024;
          int v44 = v22 ^ 1;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%@: last logged %@, collection period %f s, start delta %f s, versionChanged %d", buf, 0x30u);
        }
      }
    }
  }
  dispatch_source_set_event_handler((dispatch_source_t)[(BatteryDataCollectionAgent *)v6 collectionTimer], [(BatteryDataCollectionAgent *)v6 collectionEventHandler]);
  v27 = [(BatteryDataCollectionAgent *)v6 collectionTimer];
  dispatch_time_t v28 = dispatch_time(0x8000000000000000, v16);
  dispatch_source_set_timer(v27, v28, [(BatteryDataCollectionAgent *)v6 getCollectionPeriod], 0x3B9ACA00uLL);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
  return v6;
}

- (void)dealloc
{
  collectionTimer = self->_collectionTimer;
  if (collectionTimer)
  {
    dispatch_source_cancel(collectionTimer);
    dispatch_release((dispatch_object_t)self->_collectionTimer);
  }
  collectionQueue = self->_collectionQueue;
  if (collectionQueue) {
    dispatch_release((dispatch_object_t)collectionQueue);
  }

  v5.receiver = self;
  v5.super_class = (Class)BatteryDataCollectionAgent;
  [(BatteryDataCollectionAgent *)&v5 dealloc];
}

- (void)start
{
  BOOL v4 = [(BatteryDataCollectionAgent *)self collectAtPowerSourceChange];
  if (v4)
  {
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1000271C4;
    v37[3] = &unk_100091E58;
    id v38 = &stru_100091E30;
    uint64_t v33 = 0;
    objc_super v34 = &v33;
    uint64_t v35 = 0x2020000000;
    char v36 = 0;
    if (sub_1000270B0((id)v4, 0x10000uLL)) {
      char v5 = 2;
    }
    else {
      char v5 = 0;
    }
    char v36 = v5 | ((uint64_t (*)(void))v38->invoke)();
    *(void *)&long long out_token = 0;
    *((void *)&out_token + 1) = &out_token;
    uint64_t v42 = 0x3052000000;
    __int16 v43 = sub_100027228;
    int v44 = sub_100027238;
    v45 = 0;
    v45 = +[NSDate distantPast];
    id v6 = [(id)qword_1000A47E8 objectForKey:@"LastConnectedState"];
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (unsigned int v7 = [v6 unsignedIntValue],
            uint64_t v8 = *((unsigned __int8 *)v34 + 24),
            v7 == v8))
      {
        v9 = qword_1000A3508;
        if (os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_DEFAULT))
        {
          int v10 = *((unsigned __int8 *)v34 + 24);
          *(_DWORD *)buf = 67109120;
          int v40 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Connected state %u unchanged", buf, 8u);
        }
        goto LABEL_24;
      }
    }
    else
    {
      uint64_t v8 = *((unsigned __int8 *)v34 + 24);
    }
    objc_msgSend((id)qword_1000A47E8, "setObject:forKey:", +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v8), @"LastConnectedState");
    dispatch_async((dispatch_queue_t)[(BatteryDataCollectionAgent *)self collectionQueue], [(BatteryDataCollectionAgent *)self collectionEventHandler]);
LABEL_24:
    *(_DWORD *)buf = 0;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100027244;
    v32[3] = &unk_100091EC0;
    v32[4] = self;
    v32[5] = v37;
    v32[6] = &stru_100091E98;
    v32[7] = &out_token;
    v32[8] = &v33;
    if (notify_register_dispatch("com.apple.system.powersources.timeremaining", (int *)buf, (dispatch_queue_t)[(BatteryDataCollectionAgent *)self collectionQueue], v32)&& os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_ERROR))
    {
      sub_1000671E4();
    }
    _Block_object_dispose(&out_token, 8);
    _Block_object_dispose(&v33, 8);
    goto LABEL_31;
  }
  if ([(BatteryDataCollectionAgent *)self useSmartChargingDataSource])
  {
    LODWORD(out_token) = -1;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10002743C;
    handler[3] = &unk_100091EE8;
    handler[4] = self;
    if (notify_register_dispatch("com.apple.smartcharging.charging", (int *)&out_token, (dispatch_queue_t)[(BatteryDataCollectionAgent *)self collectionQueue], handler)&& os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_ERROR))
    {
      sub_10006726C();
    }
    goto LABEL_31;
  }
  if (![(BatteryDataCollectionAgent *)self useBTMAsDataSource])
  {
    if ([(BatteryDataCollectionAgent *)self collectOnce])
    {
      double v19 = [(BatteryDataCollectionAgent *)self collectionTimer];
      dispatch_time_t v20 = dispatch_time(0x8000000000000000, 1000000000);
      dispatch_source_set_timer((dispatch_source_t)v19, v20, [(BatteryDataCollectionAgent *)self getCollectionPeriod], 0x3B9ACA00uLL);
    }
    goto LABEL_30;
  }
  if (_os_feature_enabled_impl())
  {
    CFTypeID TypeID = CFNumberGetTypeID();
    v12 = (void *)sub_100027580(@"BatteryDataCollectionReady", TypeID);
    v13 = v12;
    if (v12)
    {
      if ([v12 intValue] == 1)
      {
        id v14 = objc_alloc_init((Class)NSMutableDictionary);
        if (v14)
        {
          id v15 = v14;
          [v14 setObject:&off_10009A590 forKeyedSubscript:@"DataCaptureTrigger"];
          [v15 setObject:&off_10009A5A8 forKeyedSubscript:@"CaptureTime"];
          [v15 setObject:&off_10009A5C0 forKeyedSubscript:@"Voltage"];
          [v15 setObject:&off_10009A5C0 forKeyedSubscript:@"InstantAmperage"];
          [v15 setObject:&off_10009A5C0 forKeyedSubscript:@"PresentDOD"];
          [v15 setObject:&off_10009A5C0 forKeyedSubscript:@"ChargeAccum"];
          [v15 setObject:&off_10009A5C0 forKeyedSubscript:@"AlgoTemperature"];
          [v15 setObject:&off_10009A5C0 forKeyedSubscript:@"VirtualTemperature"];
          CFDictionaryRef v16 = IOServiceMatching("AppleBTM");
          io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v16);
          if (MatchingService)
          {
            io_object_t v18 = MatchingService;
            if (!IORegistryEntrySetCFProperties(MatchingService, v15))
            {
              IOObjectRelease(v18);

LABEL_30:
              dispatch_resume((dispatch_object_t)[(BatteryDataCollectionAgent *)self collectionTimer]);
LABEL_31:
              id v21 = [(BatteryDataCollectionAgent *)self shortDescription];
              unsigned int v22 = qword_1000A3508;
              if (os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(out_token) = 138412290;
                *(void *)((char *)&out_token + 4) = v21;
                _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Started bdc agent %@", (uint8_t *)&out_token, 0xCu);
              }
              goto LABEL_33;
            }
            if (os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_ERROR)) {
              sub_100067380();
            }
            IOObjectRelease(v18);
          }
          else if (os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_ERROR))
          {
            sub_1000673E8();
          }
          if (os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_ERROR)) {
            sub_100067380();
          }
LABEL_51:

          goto LABEL_33;
        }
        if (os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_ERROR)) {
          sub_10006734C();
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_ERROR))
      {
        sub_10006741C();
      }
    }
    else
    {
      double v23 = qword_1000A3508;
      if (os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_ERROR)) {
        sub_1000672D4(v23, v24, v25, v26, v27, v28, v29, v30);
      }
    }
    id v15 = 0;
    goto LABEL_51;
  }
  if (os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_ERROR)) {
    sub_100067450();
  }
LABEL_33:
}

- (void)stop
{
  if ([(BatteryDataCollectionAgent *)self collectAtPowerSourceChange]
    || [(BatteryDataCollectionAgent *)self useSmartChargingDataSource])
  {
    notify_cancel([(BatteryDataCollectionAgent *)self eventRegistrationToken]);
  }
  else
  {
    dispatch_suspend((dispatch_object_t)[(BatteryDataCollectionAgent *)self collectionTimer]);
  }
  id v4 = [(BatteryDataCollectionAgent *)self shortDescription];
  char v5 = qword_1000A3508;
  if (os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Stopped bdc agent %@", (uint8_t *)&v6, 0xCu);
  }
}

- (id)shortDescription
{
  return +[NSString stringWithFormat:@"Group:%@ Collection:%@ ms Retention:%@ s Collation:%@ s", [(BatteryDataCollectionAgent *)self dataGroupName], [(BatteryDataCollectionAgent *)self collectionPeriod], [(BatteryDataCollectionAgent *)self retentionPeriod], [(BatteryDataCollectionAgent *)self collationPeriod]];
}

- (id)description
{
  return +[NSString stringWithFormat:@"Columns:%@ FilePath:%@ %@", [(NSArray *)[(BatteryDataCollectionAgent *)self columnNames] description], [(BatteryDataCollectionAgent *)self dirPath], [(BatteryDataCollectionAgent *)self shortDescription]];
}

- (unint64_t)getCollectionPeriod
{
  if ([(BatteryDataCollectionAgent *)self eventBasedCollection]) {
    return -1;
  }
  else {
    return 1000000
  }
         * [(NSNumber *)[(BatteryDataCollectionAgent *)self collectionPeriod] unsignedIntValue];
}

- (id)getLastUsedDataFileNameDefaultsKey
{
  v2 = [(BatteryDataCollectionAgent *)self dataGroupName];

  return [(NSString *)v2 stringByAppendingString:@"_LastUsedFileName"];
}

- (id)getLastDataLoggedTimestampDefaultsKey
{
  v2 = [(BatteryDataCollectionAgent *)self dataGroupName];

  return [(NSString *)v2 stringByAppendingString:@"_LastLoggedTimeStamp"];
}

- (NSString)dataGroupName
{
  return self->_dataGroupName;
}

- (void)setDataGroupName:(id)a3
{
}

- (NSString)dirPath
{
  return self->_dirPath;
}

- (void)setDirPath:(id)a3
{
}

- (NSString)formatVersion
{
  return self->_formatVersion;
}

- (void)setFormatVersion:(id)a3
{
}

- (NSNumber)collectionPeriod
{
  return self->_collectionPeriod;
}

- (void)setCollectionPeriod:(id)a3
{
}

- (NSNumber)retentionPeriod
{
  return self->_retentionPeriod;
}

- (void)setRetentionPeriod:(id)a3
{
}

- (NSNumber)collationPeriod
{
  return self->_collationPeriod;
}

- (void)setCollationPeriod:(id)a3
{
}

- (NSArray)columnNames
{
  return self->_columnNames;
}

- (void)setColumnNames:(id)a3
{
}

- (id)createDataDictCollectionBlock
{
  return self->_createDataDictCollectionBlock;
}

- (void)setCreateDataDictCollectionBlock:(id)a3
{
}

- (BOOL)collectAtSBC
{
  return self->_collectAtSBC;
}

- (void)setCollectAtSBC:(BOOL)a3
{
  self->_collectAtSBC = a3;
}

- (BOOL)collectOnce
{
  return self->_collectOnce;
}

- (void)setCollectOnce:(BOOL)a3
{
  self->_collectOnce = a3;
}

- (BOOL)collectAtPowerSourceChange
{
  return self->_collectAtPowerSourceChange;
}

- (void)setCollectAtPowerSourceChange:(BOOL)a3
{
  self->_collectAtPowerSourceChange = a3;
}

- (BOOL)neverPrune
{
  return self->_neverPrune;
}

- (void)setNeverPrune:(BOOL)a3
{
  self->_neverPrune = a3;
}

- (BOOL)batteryChanged
{
  return self->_batteryChanged;
}

- (void)setBatteryChanged:(BOOL)a3
{
  self->_batteryChanged = a3;
}

- (BOOL)skipCSVAndUsePowerlog
{
  return self->_skipCSVAndUsePowerlog;
}

- (void)setSkipCSVAndUsePowerlog:(BOOL)a3
{
  self->_skipCSVAndUsePowerlog = a3;
}

- (BOOL)useBTMAsDataSource
{
  return self->_useBTMAsDataSource;
}

- (void)setUseBTMAsDataSource:(BOOL)a3
{
  self->_useBTMAsDataSource = a3;
}

- (BOOL)useSmartChargingDataSource
{
  return self->_useSmartChargingDataSource;
}

- (void)setUseSmartChargingDataSource:(BOOL)a3
{
  self->_useSmartChargingDataSource = a3;
}

- (id)collectionEventHandler
{
  return self->_collectionEventHandler;
}

- (void)setCollectionEventHandler:(id)a3
{
}

- (int)eventRegistrationToken
{
  return self->_eventRegistrationToken;
}

- (void)setEventRegistrationToken:(int)a3
{
  self->_eventRegistrationToken = a3;
}

- (BOOL)eventBasedCollection
{
  return self->_eventBasedCollection;
}

- (void)setEventBasedCollection:(BOOL)a3
{
  self->_eventBasedCollection = a3;
}

- (OS_dispatch_queue)collectionQueue
{
  return self->_collectionQueue;
}

- (void)setCollectionQueue:(id)a3
{
  self->_collectionQueue = (OS_dispatch_queue *)a3;
}

- (OS_dispatch_source)collectionTimer
{
  return self->_collectionTimer;
}

- (void)setCollectionTimer:(id)a3
{
  self->_collectionTimer = (OS_dispatch_source *)a3;
}

@end