@interface OSMSmartHeuristicsModel
- (OSMSmartHeuristicsModel)init;
- (id)modelIdentifier;
- (void)recordFeedbackOfType:(int64_t)a3 forSpeakable:(id)a4;
- (void)setSpeakable:(id)a3;
- (void)startWithDelegate:(id)a3;
- (void)stop;
@end

@implementation OSMSmartHeuristicsModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (id)modelIdentifier
{
  return self->_identifier;
}

- (void)stop
{
  v3 = AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    v6 = "-[OSMSmartHeuristicsModel stop]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v5, 0xCu);
  }
  delegate = self->_delegate;
  self->_delegate = 0;
}

- (void)recordFeedbackOfType:(int64_t)a3 forSpeakable:(id)a4
{
  id v6 = a4;
  id v8 = +[AFOpportuneSpeakingModuleDataCollection sharedCollector];
  v7 = [v6 speakableIdentifier];

  [v8 logFeedbackOfType:a3 forSpeakableId:v7 withModelId:self->_identifier];
}

- (void)setSpeakable:(id)a3
{
  id v4 = a3;
  int v5 = (void *)AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
  {
    v44 = v5;
    v45 = [v4 speakableDescription];
    *(_DWORD *)buf = 136315394;
    v77 = "-[OSMSmartHeuristicsModel setSpeakable:]";
    __int16 v78 = 2112;
    v79 = v45;
    _os_log_debug_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "%s speakable: %@", buf, 0x16u);
  }
  id v6 = v4;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v48 = self;
    id v47 = [v6 copy];
    v49 = [[OSMNotificationFeatureMap alloc] initWithNotification:v47];
    if ([(OSMNotificationFeatureMap *)v49 isMessageSenderFavorite])
    {
      v9 = AFSiriLogContextService;
      if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v77 = "-[OSMSmartHeuristicsModel setSpeakable:]";
        _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s sender is favorite, score + 10", buf, 0xCu);
      }
      uint64_t v10 = AFOpportuneSpeakingModuleDataCollectionFeatureNameKey;
      uint64_t v11 = AFOpportuneSpeakingModuleDataCollectionFeatureValueKey;
      v74[0] = AFOpportuneSpeakingModuleDataCollectionFeatureNameKey;
      v74[1] = AFOpportuneSpeakingModuleDataCollectionFeatureValueKey;
      v75[0] = @"IsFavorite";
      v75[1] = &off_100010C90;
      v12 = +[NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:2];
      uint64_t v13 = 10;
    }
    else
    {
      uint64_t v10 = AFOpportuneSpeakingModuleDataCollectionFeatureNameKey;
      uint64_t v11 = AFOpportuneSpeakingModuleDataCollectionFeatureValueKey;
      v72[0] = AFOpportuneSpeakingModuleDataCollectionFeatureNameKey;
      v72[1] = AFOpportuneSpeakingModuleDataCollectionFeatureValueKey;
      v73[0] = @"IsFavorite";
      v73[1] = &off_100010CA8;
      v12 = +[NSDictionary dictionaryWithObjects:v73 forKeys:v72 count:2];
      uint64_t v13 = 0;
    }
    [v7 addObject:v12];

    if ([(OSMNotificationFeatureMap *)v49 isGroupMessage])
    {
      v68[0] = v10;
      v68[1] = v11;
      v69[0] = @"IsNotGroupMessage";
      v69[1] = &off_100010CA8;
      v15 = v69;
      v16 = v68;
    }
    else
    {
      v17 = AFSiriLogContextService;
      if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v77 = "-[OSMSmartHeuristicsModel setSpeakable:]";
        _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s not sent to group, score + 10", buf, 0xCu);
      }
      v13 += 10;
      v70[0] = v10;
      v70[1] = v11;
      v71[0] = @"IsNotGroupMessage";
      v71[1] = &off_100010C90;
      v15 = v71;
      v16 = v70;
    }
    v18 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v16 count:2];
    [v7 addObject:v18];

    v14 = (char *)[(OSMNotificationFeatureMap *)v49 numberOfRecentInteractionsWithSender]+ v13;
    v66[1] = v11;
    v67[0] = @"NumberOfRecentInteractions";
    v66[0] = v10;
    v19 = +[NSNumber numberWithUnsignedInteger:[(OSMNotificationFeatureMap *)v49 numberOfRecentInteractionsWithSender]];
    v67[1] = v19;
    v20 = +[NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:2];
    [v7 addObject:v20];

    v64[1] = v11;
    v65[0] = @"TimeSinceMostRecentInteraction";
    v64[0] = v10;
    [(OSMNotificationFeatureMap *)v49 timeSinceMostRecentInteractionWithSender];
    v21 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v65[1] = v21;
    v22 = +[NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:2];
    [v7 addObject:v22];

    [(OSMNotificationFeatureMap *)v49 timeSinceMostRecentInteractionWithSender];
    if (v23 >= 86400.0)
    {
      v60[0] = v10;
      v60[1] = v11;
      v61[0] = @"SentWithinLast24Hrs";
      v61[1] = &off_100010CA8;
      v25 = +[NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:2];
    }
    else
    {
      v24 = AFSiriLogContextService;
      if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v77 = "-[OSMSmartHeuristicsModel setSpeakable:]";
        _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "%s sent within last 24 hours, score + 10", buf, 0xCu);
      }
      v14 += 10;
      v62[0] = v10;
      v62[1] = v11;
      v63[0] = @"SentWithinLast24Hrs";
      v63[1] = &off_100010C90;
      v25 = +[NSDictionary dictionaryWithObjects:v63 forKeys:v62 count:2];
    }
    [v7 addObject:v25];

    v26 = +[OSMBackgroundFeatureManager sharedBackgroundFeatureManager];
    if ([v26 hasOngoingEvent])
    {
      v27 = AFSiriLogContextService;
      self = v48;
      if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v77 = "-[OSMSmartHeuristicsModel setSpeakable:]";
        _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "%s has ongoing event, score - 10", buf, 0xCu);
      }
      v14 -= 10;
      v58[0] = v10;
      v58[1] = v11;
      v59[0] = @"HasOngoingEvent";
      v59[1] = &off_100010CC0;
      v28 = +[NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:2];
    }
    else
    {
      v56[0] = v10;
      v56[1] = v11;
      v57[0] = @"HasOngoingEvent";
      v57[1] = &off_100010CA8;
      v28 = +[NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:2];
      self = v48;
    }
    [v7 addObject:v28];

    v29 = [v26 feedbackManager];
    v30 = [v29 lastNegativeFeedbackForContact:0];

    if (v30)
    {
      v46 = v26;
      v54[1] = v11;
      v55[0] = @"TimeSinceLastNegativeFeedback";
      v54[0] = v10;
      v31 = +[NSDate date];
      [v31 timeIntervalSinceDate:v30];
      v32 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      v55[1] = v32;
      v33 = +[NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:2];
      [v7 addObject:v33];

      v34 = +[NSDate date];
      [v34 timeIntervalSinceDate:v30];
      double v36 = v35;

      if (v36 >= 3600.0)
      {
        v50[0] = v10;
        v50[1] = v11;
        v51[0] = @"HadRecentNegativeFeedback";
        v51[1] = &off_100010CA8;
        v38 = v51;
        v39 = v50;
      }
      else
      {
        v37 = AFSiriLogContextService;
        if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v77 = "-[OSMSmartHeuristicsModel setSpeakable:]";
          _os_log_debug_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "%s recently had negative feedback, score - 10", buf, 0xCu);
        }
        v14 -= 10;
        v52[0] = v10;
        v52[1] = v11;
        v53[0] = @"HadRecentNegativeFeedback";
        v53[1] = &off_100010CC0;
        v38 = v53;
        v39 = v52;
      }
      v40 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v39 count:2];
      self = v48;
      v26 = v46;
      [v7 addObject:v40];
    }
    v41 = +[AFOpportuneSpeakingModuleDataCollection sharedCollector];
    v42 = [(OSMNotificationFeatureMap *)v49 contactId];
    *(float *)&double v43 = (float)(uint64_t)v14;
    [v41 logSpeakable:v6 forContact:v42 withModelId:self->_identifier withFeatures:v7 withScore:v43];
  }
  else
  {
    v14 = 0;
  }
  *(float *)&double v8 = (float)(uint64_t)v14;
  [(AFOpportuneSpeakingModelDelegate *)self->_delegate modelWithIdentifier:self->_identifier didUpdateScore:v6 forSpeakable:v8];
}

- (void)startWithDelegate:(id)a3
{
  id v4 = (AFOpportuneSpeakingModelDelegate *)a3;
  int v5 = AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315394;
    double v8 = "-[OSMSmartHeuristicsModel startWithDelegate:]";
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s delegate: %@", (uint8_t *)&v7, 0x16u);
  }
  delegate = self->_delegate;
  self->_delegate = v4;
}

- (OSMSmartHeuristicsModel)init
{
  v10.receiver = self;
  v10.super_class = (Class)OSMSmartHeuristicsModel;
  v2 = [(OSMSmartHeuristicsModel *)&v10 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)NSString);
    id v4 = +[NSUUID UUID];
    int v5 = [v4 UUIDString];
    id v6 = (NSString *)[v3 initWithFormat:@"SmartHeuristicsModel-%@", v5];
    identifier = v2->_identifier;
    v2->_identifier = v6;

    id v8 = +[AFOpportuneSpeakingModuleDataCollection sharedCollector];
  }
  return v2;
}

@end