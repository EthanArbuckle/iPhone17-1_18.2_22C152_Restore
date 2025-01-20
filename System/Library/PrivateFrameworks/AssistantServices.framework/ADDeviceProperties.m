@interface ADDeviceProperties
- (ADDeviceProperties)init;
- (void)_getODDiOSDevicePropertiesWithGeneral:(id)a3 assistant:(id)a4 dictation:(id)a5 iOSGeneral:(id)a6 iOSAssistant:(id)a7 completion:(id)a8;
- (void)_getODDmacOSDevicePropertiesWithGeneral:(id)a3 assistant:(id)a4 dictation:(id)a5 macOS:(id)a6 completion:(id)a7;
- (void)_getODDtvOSDevicePropertiesWithGeneral:(id)a3 assistant:(id)a4 dictation:(id)a5 tvOS:(id)a6 completion:(id)a7;
- (void)_getODDvisionOSDevicePropertiesWithGeneral:(id)a3 assistant:(id)a4 dictation:(id)a5 completion:(id)a6;
- (void)_getODDwatchOSDevicePropertiesWithGeneral:(id)a3 assistant:(id)a4 dictation:(id)a5 watchOS:(id)a6 completion:(id)a7;
- (void)_populateDevicePropertiesForClientEvent:(id)a3 withCompletion:(id)a4;
- (void)_populateEventMetadataForClientEvent:(id)a3 withCompletion:(id)a4;
- (void)_triggerReportingForNullDeviceAggregationId;
- (void)getODDDevicePropertiesWithCompletion:(id)a3;
@end

@implementation ADDeviceProperties

- (void).cxx_destruct
{
}

- (void)_triggerReportingForNullDeviceAggregationId
{
  AnalyticsSendEvent();
  v2 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315138;
    v7 = "-[ADDeviceProperties _triggerReportingForNullDeviceAggregationId]";
    _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s Reporting missing deviceAggregationId for ODDDeviceProperties to ABC", (uint8_t *)&v6, 0xCu);
  }
  v3 = +[SiriCoreSymptomsReporter sharedInstance];
  v4 = +[NSProcessInfo processInfo];
  id v5 = [v4 processIdentifier];
  [v3 reportIssueForType:@"ODDDeviceProperties" subType:@"null_deviceAggregationId" context:&__NSDictionary0__struct processIdentifier:v5 walkboutStatus:byte_100585E38];
}

- (void)_getODDvisionOSDevicePropertiesWithGeneral:(id)a3 assistant:(id)a4 dictation:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[ADDeviceProperties _getODDvisionOSDevicePropertiesWithGeneral:assistant:dictation:completion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  id v14 = objc_alloc_init((Class)ODDSiriSchemaODDvisionOSDevicePropertiesReported);
  v15 = [v10 getODDAssistantProperties];
  [v14 setAssistant:v15];

  v16 = [v11 getODDDictationProperties];
  [v14 setDictation:v16];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001207A4;
  v19[3] = &unk_100502B08;
  id v20 = v14;
  id v21 = v12;
  id v17 = v12;
  id v18 = v14;
  [v9 getODDGeneralPropertiesWithCompletion:v19];
}

- (void)_getODDmacOSDevicePropertiesWithGeneral:(id)a3 assistant:(id)a4 dictation:(id)a5 macOS:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[ADDeviceProperties _getODDmacOSDevicePropertiesWithGeneral:assistant:dictation:macOS:completion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  id v17 = objc_alloc_init((Class)ODDSiriSchemaODDmacOSDevicePropertiesReported);
  id v18 = [v12 getODDAssistantProperties];
  [v17 setAssistant:v18];

  v19 = [v13 getODDDictationProperties];
  [v17 setDictation:v19];

  id v20 = [v14 getODDmacOSAssistantProperties];
  [v17 setMacOSAssistant:v20];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1001209F8;
  v23[3] = &unk_100502B08;
  id v24 = v17;
  id v25 = v15;
  id v21 = v15;
  id v22 = v17;
  [v11 getODDGeneralPropertiesWithCompletion:v23];
}

- (void)_getODDtvOSDevicePropertiesWithGeneral:(id)a3 assistant:(id)a4 dictation:(id)a5 tvOS:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v39 = "-[ADDeviceProperties _getODDtvOSDevicePropertiesWithGeneral:assistant:dictation:tvOS:completion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  id v18 = dispatch_group_create();
  id v19 = objc_alloc_init((Class)ODDSiriSchemaODDtvOSDevicePropertiesReported);
  id v20 = [v13 getODDAssistantProperties];
  [v19 setAssistant:v20];

  id v21 = [v14 getODDDictationProperties];
  [v19 setDictation:v21];

  dispatch_group_enter(v18);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100120D40;
  v35[3] = &unk_100502AB8;
  id v22 = v19;
  id v36 = v22;
  v23 = v18;
  v37 = v23;
  [v12 getODDGeneralPropertiesWithCompletion:v35];
  dispatch_group_enter(v23);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100120D80;
  v32[3] = &unk_100502B30;
  id v24 = v22;
  id v33 = v24;
  v34 = v23;
  id v25 = v23;
  [v15 getODDtvOSAssistantPropertiesWithCompletion:v32];
  queue = self->_queue;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100120DC0;
  v29[3] = &unk_10050E188;
  id v30 = v24;
  id v31 = v16;
  id v27 = v24;
  id v28 = v16;
  dispatch_group_notify(v25, queue, v29);
}

- (void)_getODDwatchOSDevicePropertiesWithGeneral:(id)a3 assistant:(id)a4 dictation:(id)a5 watchOS:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v27 = "-[ADDeviceProperties _getODDwatchOSDevicePropertiesWithGeneral:assistant:dictation:watchOS:completion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  id v17 = objc_alloc_init((Class)ODDSiriSchemaODDwatchOSDevicePropertiesReported);
  id v18 = [v12 getODDAssistantProperties];
  [v17 setAssistant:v18];

  id v19 = [v13 getODDDictationProperties];
  [v17 setDictation:v19];

  id v20 = [v14 getODDwatchOSAssistantProperties];
  [v17 setWatchOSAssistant:v20];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100120FD8;
  v23[3] = &unk_100502B08;
  id v24 = v17;
  id v25 = v15;
  id v21 = v15;
  id v22 = v17;
  [v11 getODDGeneralPropertiesWithCompletion:v23];
}

- (void)_getODDiOSDevicePropertiesWithGeneral:(id)a3 assistant:(id)a4 dictation:(id)a5 iOSGeneral:(id)a6 iOSAssistant:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v43 = "-[ADDeviceProperties _getODDiOSDevicePropertiesWithGeneral:assistant:dictation:iOSGeneral:iOSAssistant:completion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  id v21 = dispatch_group_create();
  id v22 = objc_alloc_init((Class)ODDSiriSchemaODDiOSDevicePropertiesReported);
  v23 = [v15 getODDAssistantProperties];
  [v22 setAssistant:v23];

  id v24 = [v16 getODDDictationProperties];
  [v22 setDictation:v24];

  id v25 = [v17 getODDiOSGeneralProperties];
  [v22 setIOSGeneral:v25];

  dispatch_group_enter(v21);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100121350;
  v39[3] = &unk_100502AB8;
  id v26 = v22;
  id v40 = v26;
  id v27 = v21;
  v41 = v27;
  [v14 getODDGeneralPropertiesWithCompletion:v39];
  dispatch_group_enter(v27);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100121390;
  v36[3] = &unk_100502AE0;
  id v28 = v26;
  id v37 = v28;
  v38 = v27;
  v29 = v27;
  [v18 getODDiOSAssistantPropertiesWithCompletion:v36];
  queue = self->_queue;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1001213D0;
  v33[3] = &unk_10050E188;
  id v34 = v28;
  id v35 = v19;
  id v31 = v28;
  id v32 = v19;
  dispatch_group_notify(v29, queue, v33);
}

- (void)_populateDevicePropertiesForClientEvent:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [[ADGeneralProperties alloc] initWithQueue:self->_queue];
  id v9 = objc_alloc_init(ADAssistantProperties);
  id v10 = objc_alloc_init(ADDictationProperties);
  id v11 = objc_alloc_init(ADiOSGeneralProperties);
  id v12 = [[ADiOSAssistantProperties alloc] initWithQueue:self->_queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100121548;
  v15[3] = &unk_100502A90;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  [(ADDeviceProperties *)self _getODDiOSDevicePropertiesWithGeneral:v8 assistant:v9 dictation:v10 iOSGeneral:v11 iOSAssistant:v12 completion:v15];
}

- (void)_populateEventMetadataForClientEvent:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100121664;
  block[3] = &unk_10050E1D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)getODDDevicePropertiesWithCompletion:(id)a3
{
  v4 = (void (**)(id, id))a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v25 = "-[ADDeviceProperties getODDDevicePropertiesWithCompletion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  id v6 = dispatch_group_create();
  id v7 = objc_alloc_init((Class)ODDSiriSchemaODDSiriClientEvent);
  dispatch_group_enter(v6);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100121F68;
  v22[3] = &unk_10050E138;
  v8 = v6;
  v23 = v8;
  [(ADDeviceProperties *)self _populateEventMetadataForClientEvent:v7 withCompletion:v22];
  dispatch_group_enter(v8);
  id v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  id v19 = sub_100121F70;
  id v20 = &unk_10050E138;
  id v9 = v8;
  id v21 = v9;
  [(ADDeviceProperties *)self _populateDevicePropertiesForClientEvent:v7 withCompletion:&v17];
  dispatch_time_t v10 = dispatch_time(0, 11000000000);
  intptr_t v11 = dispatch_group_wait(v9, v10);
  id v12 = (void *)AFSiriLogContextDaemon;
  if (!v11)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      id v15 = v12;
      id v16 = objc_msgSend(v7, "dictionaryRepresentation", v17, v18, v19, v20);
      *(_DWORD *)buf = 136315394;
      id v25 = "-[ADDeviceProperties getODDDevicePropertiesWithCompletion:]";
      __int16 v26 = 2112;
      id v27 = v16;
      _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s Successfully populated ODDDeviceProperties event %@", buf, 0x16u);

      if (!v4) {
        goto LABEL_11;
      }
    }
    else if (!v4)
    {
      goto LABEL_11;
    }
LABEL_10:
    v4[2](v4, v7);
    goto LABEL_11;
  }
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    id v13 = v12;
    id v14 = objc_msgSend(v7, "dictionaryRepresentation", v17, v18, v19, v20);
    *(_DWORD *)buf = 136315394;
    id v25 = "-[ADDeviceProperties getODDDevicePropertiesWithCompletion:]";
    __int16 v26 = 2112;
    id v27 = v14;
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Timed out waiting to populate ODDDeviceProperties event %@", buf, 0x16u);
  }
  AnalyticsSendEvent();
  if (v4) {
    goto LABEL_10;
  }
LABEL_11:
}

- (ADDeviceProperties)init
{
  v8.receiver = self;
  v8.super_class = (Class)ADDeviceProperties;
  v2 = [(ADDeviceProperties *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v5 = dispatch_queue_create("ADDeviceProperties", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

@end