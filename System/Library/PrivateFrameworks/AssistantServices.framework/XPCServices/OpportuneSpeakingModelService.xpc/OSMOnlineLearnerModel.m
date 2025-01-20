@interface OSMOnlineLearnerModel
- (OSMOnlineLearnerModel)init;
- (id)modelIdentifier;
- (void)recordFeedbackOfType:(int64_t)a3 forSpeakable:(id)a4;
- (void)setSpeakable:(id)a3;
- (void)startWithDelegate:(id)a3;
- (void)stop;
@end

@implementation OSMOnlineLearnerModel

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
    v6 = "-[OSMOnlineLearnerModel stop]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v5, 0xCu);
  }
  delegate = self->_delegate;
  self->_delegate = 0;
}

- (void)recordFeedbackOfType:(int64_t)a3 forSpeakable:(id)a4
{
  id v6 = a4;
  v7 = (void *)AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
  {
    v11 = v7;
    v12 = AFOpportuneSpeakingModelFeedbackGetDescription();
    v13 = [v6 speakableIdentifier];
    int v14 = 136315650;
    v15 = "-[OSMOnlineLearnerModel recordFeedbackOfType:forSpeakable:]";
    __int16 v16 = 2112;
    v17 = v12;
    __int16 v18 = 2112;
    v19 = v13;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s feedback: %@, speakable id: %@", (uint8_t *)&v14, 0x20u);
  }
  v8 = +[AFOpportuneSpeakingModuleDataCollection sharedCollector];
  v9 = [v6 speakableIdentifier];
  [v8 logFeedbackOfType:a3 forSpeakableId:v9 withModelId:self->_identifier];

  v10 = +[OSMRelevanceEngine sharedEngine];
  [v10 processFeedback:a3];
}

- (void)setSpeakable:(id)a3
{
  id v4 = a3;
  int v5 = (void *)AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
  {
    v156 = v5;
    v157 = [v4 speakableDescription];
    *(_DWORD *)buf = 136315394;
    v272 = "-[OSMOnlineLearnerModel setSpeakable:]";
    __int16 v273 = 2112;
    id v274 = v157;
    _os_log_debug_impl((void *)&_mh_execute_header, v156, OS_LOG_TYPE_DEBUG, "%s speakable: %@", buf, 0x16u);
  }
  id v6 = +[NSMutableArray array];
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v8 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v205 = self;
    v207 = v6;
    v236 = v8;
    id v206 = [v8 copy];
    v9 = [[OSMNotificationFeatureMap alloc] initWithNotification:v206];
    v10 = +[REFeatureValue featureValueWithInt64:[(OSMNotificationFeatureMap *)v9 isMessageSenderInContacts]];
    v11 = +[OSMRelevanceEngineFeatures isSenderInContactsFeature];
    v234 = +[RERelevanceProvider customRelevanceProviderForFeature:v11 withValue:v10];

    uint64_t v12 = AFOpportuneSpeakingModuleDataCollectionFeatureNameKey;
    uint64_t v13 = AFOpportuneSpeakingModuleDataCollectionFeatureValueKey;
    v285[0] = AFOpportuneSpeakingModuleDataCollectionFeatureNameKey;
    v285[1] = AFOpportuneSpeakingModuleDataCollectionFeatureValueKey;
    v286[0] = @"IsInContacts";
    v220 = v10;
    int v14 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v10 int64Value]);
    v286[1] = v14;
    v15 = +[NSDictionary dictionaryWithObjects:v286 forKeys:v285 count:2];
    [v7 addObject:v15];

    __int16 v16 = (void *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
    {
      v158 = v16;
      id v159 = [v10 int64Value];
      *(_DWORD *)buf = 136315394;
      v272 = "-[OSMOnlineLearnerModel setSpeakable:]";
      __int16 v273 = 2048;
      id v274 = v159;
      _os_log_debug_impl((void *)&_mh_execute_header, v158, OS_LOG_TYPE_DEBUG, "%s sender is in contacts: %llu", buf, 0x16u);
    }
    v17 = +[REFeatureValue featureValueWithInt64:[(OSMNotificationFeatureMap *)v9 isMessageSenderFavorite]];
    __int16 v18 = +[OSMRelevanceEngineFeatures isSenderFavoriteFeature];
    v233 = +[RERelevanceProvider customRelevanceProviderForFeature:v18 withValue:v17];

    v283[1] = v13;
    v284[0] = @"IsFavorite";
    v283[0] = v12;
    v219 = v17;
    v19 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v17 int64Value]);
    v284[1] = v19;
    v20 = +[NSDictionary dictionaryWithObjects:v284 forKeys:v283 count:2];
    [v7 addObject:v20];

    v21 = (void *)AFSiriLogContextService;
    uint64_t v22 = v12;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
    {
      v160 = v21;
      id v161 = [v17 int64Value];
      *(_DWORD *)buf = 136315394;
      v272 = "-[OSMOnlineLearnerModel setSpeakable:]";
      __int16 v273 = 2048;
      id v274 = v161;
      _os_log_debug_impl((void *)&_mh_execute_header, v160, OS_LOG_TYPE_DEBUG, "%s sender is favorite: %llu", buf, 0x16u);
    }
    v231 = v9;
    v23 = +[REFeatureValue featureValueWithInt64:[(OSMNotificationFeatureMap *)v9 isGroupMessage] ^ 1];
    v24 = +[OSMRelevanceEngineFeatures isNotGroupMessageFeature];
    v232 = +[RERelevanceProvider customRelevanceProviderForFeature:v24 withValue:v23];

    v281[1] = v13;
    v282[0] = @"IsNotGroupMessage";
    v281[0] = v22;
    v218 = v23;
    v25 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v23 int64Value]);
    v282[1] = v25;
    v26 = +[NSDictionary dictionaryWithObjects:v282 forKeys:v281 count:2];
    [v7 addObject:v26];

    v27 = (void *)AFSiriLogContextService;
    uint64_t v28 = v13;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
    {
      v162 = v27;
      id v163 = [v23 int64Value];
      *(_DWORD *)buf = 136315394;
      v272 = "-[OSMOnlineLearnerModel setSpeakable:]";
      __int16 v273 = 2048;
      id v274 = v163;
      _os_log_debug_impl((void *)&_mh_execute_header, v162, OS_LOG_TYPE_DEBUG, "%s not sent to group: %llu", buf, 0x16u);
    }
    v29 = +[OSMBackgroundFeatureManager sharedBackgroundFeatureManager];
    v30 = +[REFeatureValue featureValueWithInt64:](REFeatureValue, "featureValueWithInt64:", [v29 hasOngoingEvent]);
    v31 = +[OSMRelevanceEngineFeatures hasOngoingEventFeature];
    v230 = +[RERelevanceProvider customRelevanceProviderForFeature:v31 withValue:v30];

    v279[1] = v13;
    v280[0] = @"HasOngoingEvent";
    v279[0] = v22;
    v217 = v30;
    v32 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v30 int64Value]);
    v280[1] = v32;
    v33 = +[NSDictionary dictionaryWithObjects:v280 forKeys:v279 count:2];
    [v7 addObject:v33];

    v34 = (void *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
    {
      v164 = v34;
      id v165 = [v30 int64Value];
      *(_DWORD *)buf = 136315394;
      v272 = "-[OSMOnlineLearnerModel setSpeakable:]";
      __int16 v273 = 2048;
      id v274 = v165;
      _os_log_debug_impl((void *)&_mh_execute_header, v164, OS_LOG_TYPE_DEBUG, "%s has ongoing event: %llu", buf, 0x16u);
    }
    v35 = +[REFeatureValue featureValueWithInt64:](REFeatureValue, "featureValueWithInt64:", [v29 motionActivity]);
    v36 = +[OSMRelevanceEngineFeatures motionActivityFeature];
    v229 = +[RERelevanceProvider customRelevanceProviderForFeature:v36 withValue:v35];

    v278[0] = @"MotionActivity";
    v277[0] = v22;
    v277[1] = v28;
    v204 = v35;
    v37 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v35 int64Value]);
    v278[1] = v37;
    v38 = +[NSDictionary dictionaryWithObjects:v278 forKeys:v277 count:2];
    [v7 addObject:v38];

    v39 = (void *)AFSiriLogContextService;
    v235 = v29;
    uint64_t v40 = v22;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
    {
      v166 = v39;
      id v167 = [v29 motionActivity];
      v168 = [v29 motionConfidence];
      *(_DWORD *)buf = 136315650;
      v272 = "-[OSMOnlineLearnerModel setSpeakable:]";
      __int16 v273 = 2048;
      id v274 = v167;
      __int16 v275 = 2112;
      v276 = v168;
      _os_log_debug_impl((void *)&_mh_execute_header, v166, OS_LOG_TYPE_DEBUG, "%s motion activity: %lu confidence: %@", buf, 0x20u);

      v29 = v235;
    }
    v203 = [v29 musicPlayingState];
    v41 = +[REFeatureValue featureValueWithInt64:](REFeatureValue, "featureValueWithInt64:", [v203 state] == 1);
    v42 = +[OSMRelevanceEngineFeatures isMusicPlayingFeature];
    v228 = +[RERelevanceProvider customRelevanceProviderForFeature:v42 withValue:v41];

    v270[0] = @"IsMusicPlaying";
    v269[0] = v40;
    v269[1] = v28;
    v216 = v41;
    v43 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v41 int64Value]);
    v270[1] = v43;
    v44 = +[NSDictionary dictionaryWithObjects:v270 forKeys:v269 count:2];
    [v7 addObject:v44];

    v45 = (void *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
    {
      v169 = v45;
      id v170 = [v41 int64Value];
      *(_DWORD *)buf = 136315394;
      v272 = "-[OSMOnlineLearnerModel setSpeakable:]";
      __int16 v273 = 2048;
      id v274 = v170;
      _os_log_debug_impl((void *)&_mh_execute_header, v169, OS_LOG_TYPE_DEBUG, "%s is music playing: %llu", buf, 0x16u);
    }
    v46 = +[REFeatureValue featureValueWithInt64:](REFeatureValue, "featureValueWithInt64:", [v29 mediaType]);
    v47 = +[OSMRelevanceEngineFeatures mediaTypeFeature];
    v227 = +[RERelevanceProvider customRelevanceProviderForFeature:v47 withValue:v46];

    v268[0] = @"MediaType";
    v267[0] = v40;
    v267[1] = v28;
    v215 = v46;
    v48 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v46 int64Value]);
    v268[1] = v48;
    v49 = +[NSDictionary dictionaryWithObjects:v268 forKeys:v267 count:2];
    [v7 addObject:v49];

    v50 = (void *)AFSiriLogContextService;
    uint64_t v51 = v28;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
    {
      v171 = v50;
      id v172 = [v46 int64Value];
      *(_DWORD *)buf = 136315394;
      v272 = "-[OSMOnlineLearnerModel setSpeakable:]";
      __int16 v273 = 2048;
      id v274 = v172;
      _os_log_debug_impl((void *)&_mh_execute_header, v171, OS_LOG_TYPE_DEBUG, "%s media type: %llu", buf, 0x16u);
    }
    [(OSMNotificationFeatureMap *)v231 timeSinceMostRecentInteractionWithSender];
    v52 = +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:");
    v53 = +[OSMRelevanceEngineFeatures timeSinceMostRecentInteractionFeature];
    v226 = +[RERelevanceProvider customRelevanceProviderForFeature:v53 withValue:v52];

    v266[0] = @"TimeSinceMostRecentInteraction";
    v265[0] = v40;
    v265[1] = v28;
    v214 = v52;
    [v52 doubleValue];
    v54 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v266[1] = v54;
    v55 = +[NSDictionary dictionaryWithObjects:v266 forKeys:v265 count:2];
    [v7 addObject:v55];

    v56 = (void *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
    {
      v173 = v56;
      [v52 doubleValue];
      *(_DWORD *)buf = 136315394;
      v272 = "-[OSMOnlineLearnerModel setSpeakable:]";
      __int16 v273 = 2048;
      id v274 = v174;
      _os_log_debug_impl((void *)&_mh_execute_header, v173, OS_LOG_TYPE_DEBUG, "%s time since last interaction: %f", buf, 0x16u);
    }
    v264[0] = @"RecentInteractions";
    v263[0] = v40;
    v263[1] = v28;
    v57 = [(OSMNotificationFeatureMap *)v231 recentInteractionsWithSender];
    v58 = [v57 componentsJoinedByString:@", "];
    v264[1] = v58;
    v59 = +[NSDictionary dictionaryWithObjects:v264 forKeys:v263 count:2];
    [v7 addObject:v59];

    v60 = (void *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
    {
      v175 = v60;
      v176 = [(OSMNotificationFeatureMap *)v231 recentInteractionsWithSender];
      *(_DWORD *)buf = 136315394;
      v272 = "-[OSMOnlineLearnerModel setSpeakable:]";
      __int16 v273 = 2112;
      id v274 = v176;
      _os_log_debug_impl((void *)&_mh_execute_header, v175, OS_LOG_TYPE_DEBUG, "%s recent interactions buffer: %@", buf, 0x16u);
    }
    v61 = [v236 speakableDate];
    v62 = [v61 dateByAddingTimeInterval:-60.0];
    v63 = [v236 speakableDate];
    v64 = +[REFeatureValue featureValueWithInt64:[(OSMNotificationFeatureMap *)v231 numberOfInteractionsBetweenDate:v62 andDate:v63]];

    v65 = +[OSMRelevanceEngineFeatures numberOfInteractionsInLastMinuteFeature];
    v225 = +[RERelevanceProvider customRelevanceProviderForFeature:v65 withValue:v64];

    v262[0] = @"NumberOfInteractionsInLastMinute";
    v261[0] = v40;
    v261[1] = v28;
    v213 = v64;
    v66 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v64 int64Value]);
    v262[1] = v66;
    v67 = +[NSDictionary dictionaryWithObjects:v262 forKeys:v261 count:2];
    [v7 addObject:v67];

    v68 = (void *)AFSiriLogContextService;
    v237 = v7;
    uint64_t v69 = v40;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
    {
      v177 = v68;
      id v178 = [v64 int64Value];
      *(_DWORD *)buf = 136315394;
      v272 = "-[OSMOnlineLearnerModel setSpeakable:]";
      __int16 v273 = 2048;
      id v274 = v178;
      _os_log_debug_impl((void *)&_mh_execute_header, v177, OS_LOG_TYPE_DEBUG, "%s number of interactions in last minute: %llu", buf, 0x16u);
    }
    v70 = [v236 speakableDate];
    v71 = [v70 dateByAddingTimeInterval:-1800.0];
    v72 = [v236 speakableDate];
    v73 = [v72 dateByAddingTimeInterval:-60.0];
    v74 = +[REFeatureValue featureValueWithInt64:[(OSMNotificationFeatureMap *)v231 numberOfInteractionsBetweenDate:v71 andDate:v73]];

    v75 = +[OSMRelevanceEngineFeatures numberOfInteractionsInLastHalfHourFeature];
    v224 = +[RERelevanceProvider customRelevanceProviderForFeature:v75 withValue:v74];

    v260[0] = @"NumberOfInteractionsInLastHalfHour";
    v259[0] = v69;
    v259[1] = v28;
    v212 = v74;
    v76 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v74 int64Value]);
    v260[1] = v76;
    v77 = +[NSDictionary dictionaryWithObjects:v260 forKeys:v259 count:2];
    [v237 addObject:v77];

    v78 = (void *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
    {
      v179 = v78;
      id v180 = [v74 int64Value];
      *(_DWORD *)buf = 136315394;
      v272 = "-[OSMOnlineLearnerModel setSpeakable:]";
      __int16 v273 = 2048;
      id v274 = v180;
      _os_log_debug_impl((void *)&_mh_execute_header, v179, OS_LOG_TYPE_DEBUG, "%s number of interactions in last half hour: %llu", buf, 0x16u);
    }
    v79 = [v236 speakableDate];
    v80 = [v79 dateByAddingTimeInterval:-3600.0];
    v81 = [v236 speakableDate];
    v82 = [v81 dateByAddingTimeInterval:-1800.0];
    v83 = +[REFeatureValue featureValueWithInt64:[(OSMNotificationFeatureMap *)v231 numberOfInteractionsBetweenDate:v80 andDate:v82]];

    v84 = +[OSMRelevanceEngineFeatures numberOfInteractionsInLastHourFeature];
    v223 = +[RERelevanceProvider customRelevanceProviderForFeature:v84 withValue:v83];

    v258[0] = @"NumberOfInteractionsInLastHour";
    v257[0] = v69;
    v257[1] = v51;
    v211 = v83;
    v85 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v83 int64Value]);
    v258[1] = v85;
    v86 = +[NSDictionary dictionaryWithObjects:v258 forKeys:v257 count:2];
    [v237 addObject:v86];

    v87 = (void *)AFSiriLogContextService;
    uint64_t v88 = v51;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
    {
      v181 = v87;
      id v182 = [v211 int64Value];
      *(_DWORD *)buf = 136315394;
      v272 = "-[OSMOnlineLearnerModel setSpeakable:]";
      __int16 v273 = 2048;
      id v274 = v182;
      _os_log_debug_impl((void *)&_mh_execute_header, v181, OS_LOG_TYPE_DEBUG, "%s number of interactions in last hour: %llu", buf, 0x16u);
    }
    v89 = [v236 speakableDate];
    v90 = [v89 dateByAddingTimeInterval:-21600.0];
    v91 = [v236 speakableDate];
    v92 = [v91 dateByAddingTimeInterval:-3600.0];
    v93 = +[REFeatureValue featureValueWithInt64:[(OSMNotificationFeatureMap *)v231 numberOfInteractionsBetweenDate:v90 andDate:v92]];

    v94 = +[OSMRelevanceEngineFeatures numberOfInteractionsInLastSixHoursFeature];
    v222 = +[RERelevanceProvider customRelevanceProviderForFeature:v94 withValue:v93];

    v256[0] = @"NumberOfInteractionsInLastSixHours";
    v255[0] = v69;
    v255[1] = v88;
    v210 = v93;
    v95 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v93 int64Value]);
    v256[1] = v95;
    v96 = +[NSDictionary dictionaryWithObjects:v256 forKeys:v255 count:2];
    [v237 addObject:v96];

    v97 = (void *)AFSiriLogContextService;
    uint64_t v98 = v88;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
    {
      v183 = v97;
      id v184 = [v93 int64Value];
      *(_DWORD *)buf = 136315394;
      v272 = "-[OSMOnlineLearnerModel setSpeakable:]";
      __int16 v273 = 2048;
      id v274 = v184;
      _os_log_debug_impl((void *)&_mh_execute_header, v183, OS_LOG_TYPE_DEBUG, "%s number of interactions in last six hours: %llu", buf, 0x16u);
    }
    v99 = [v236 speakableDate];
    v100 = [v99 dateByAddingTimeInterval:-86400.0];
    v101 = [v236 speakableDate];
    v102 = [v101 dateByAddingTimeInterval:-21600.0];
    v103 = +[REFeatureValue featureValueWithInt64:[(OSMNotificationFeatureMap *)v231 numberOfInteractionsBetweenDate:v100 andDate:v102]];

    v104 = +[OSMRelevanceEngineFeatures numberOfInteractionsInLastDayFeature];
    v221 = +[RERelevanceProvider customRelevanceProviderForFeature:v104 withValue:v103];

    v254[0] = @"NumberOfInteractionsInLastDay";
    v253[0] = v69;
    v253[1] = v98;
    v209 = v103;
    v105 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v103 int64Value]);
    v254[1] = v105;
    v106 = +[NSDictionary dictionaryWithObjects:v254 forKeys:v253 count:2];
    [v237 addObject:v106];

    v107 = (void *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
    {
      v185 = v107;
      id v186 = [v103 int64Value];
      *(_DWORD *)buf = 136315394;
      v272 = "-[OSMOnlineLearnerModel setSpeakable:]";
      __int16 v273 = 2048;
      id v274 = v186;
      _os_log_debug_impl((void *)&_mh_execute_header, v185, OS_LOG_TYPE_DEBUG, "%s number of interactions in last day: %llu", buf, 0x16u);
    }
    v108 = [v236 speakableDate];
    v109 = [v108 dateByAddingTimeInterval:-604800.0];
    v110 = [v236 speakableDate];
    v111 = [v110 dateByAddingTimeInterval:-86400.0];
    v112 = +[REFeatureValue featureValueWithInt64:[(OSMNotificationFeatureMap *)v231 numberOfInteractionsBetweenDate:v109 andDate:v111]];

    v113 = +[OSMRelevanceEngineFeatures numberOfInteractionsInLastWeekFeature];
    v202 = +[RERelevanceProvider customRelevanceProviderForFeature:v113 withValue:v112];

    v252[0] = @"NumberOfInteractionsInLastWeek";
    v251[0] = v69;
    v251[1] = v98;
    v208 = v112;
    v114 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v112 int64Value]);
    v252[1] = v114;
    v115 = +[NSDictionary dictionaryWithObjects:v252 forKeys:v251 count:2];
    [v237 addObject:v115];

    v116 = (void *)AFSiriLogContextService;
    uint64_t v117 = v98;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
    {
      v187 = v116;
      id v188 = [v208 int64Value];
      *(_DWORD *)buf = 136315394;
      v272 = "-[OSMOnlineLearnerModel setSpeakable:]";
      __int16 v273 = 2048;
      id v274 = v188;
      _os_log_debug_impl((void *)&_mh_execute_header, v187, OS_LOG_TYPE_DEBUG, "%s number of interactions in last week: %llu", buf, 0x16u);
    }
    v118 = [v236 speakableDate];
    v119 = [v118 dateByAddingTimeInterval:-1209600.0];
    v120 = [v236 speakableDate];
    v121 = [v120 dateByAddingTimeInterval:-604800.0];
    v122 = +[REFeatureValue featureValueWithInt64:[(OSMNotificationFeatureMap *)v231 numberOfInteractionsBetweenDate:v119 andDate:v121]];

    v123 = +[OSMRelevanceEngineFeatures numberOfInteractionsInLastFortnightFeature];
    v201 = +[RERelevanceProvider customRelevanceProviderForFeature:v123 withValue:v122];

    v250[0] = @"NumberOfInteractionsInLastFortnight";
    v249[0] = v69;
    v249[1] = v117;
    v124 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v122 int64Value]);
    v250[1] = v124;
    v125 = +[NSDictionary dictionaryWithObjects:v250 forKeys:v249 count:2];
    [v237 addObject:v125];

    v126 = (void *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
    {
      v189 = v126;
      id v190 = [v122 int64Value];
      *(_DWORD *)buf = 136315394;
      v272 = "-[OSMOnlineLearnerModel setSpeakable:]";
      __int16 v273 = 2048;
      id v274 = v190;
      _os_log_debug_impl((void *)&_mh_execute_header, v189, OS_LOG_TYPE_DEBUG, "%s number of interactions in last fortnight: %llu", buf, 0x16u);
    }
    v127 = [v236 speakableDate];
    v128 = [v127 dateByAddingTimeInterval:-2419200.0];
    v129 = [v236 speakableDate];
    v130 = [v129 dateByAddingTimeInterval:-1209600.0];
    v131 = +[REFeatureValue featureValueWithInt64:[(OSMNotificationFeatureMap *)v231 numberOfInteractionsBetweenDate:v128 andDate:v130]];

    v132 = +[OSMRelevanceEngineFeatures numberOfInteractionsInLastMonthFeature];
    v199 = +[RERelevanceProvider customRelevanceProviderForFeature:v132 withValue:v131];

    v247[1] = v117;
    v248[0] = @"NumberOfInteractionsInLastMonth";
    v247[0] = v69;
    v133 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v131 int64Value]);
    v248[1] = v133;
    v134 = +[NSDictionary dictionaryWithObjects:v248 forKeys:v247 count:2];
    [v237 addObject:v134];

    v135 = (void *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
    {
      v191 = v135;
      id v192 = [v131 int64Value];
      *(_DWORD *)buf = 136315394;
      v272 = "-[OSMOnlineLearnerModel setSpeakable:]";
      __int16 v273 = 2048;
      id v274 = v192;
      _os_log_debug_impl((void *)&_mh_execute_header, v191, OS_LOG_TYPE_DEBUG, "%s number of interactions in last month: %llu", buf, 0x16u);
    }
    v200 = v131;
    v136 = +[NSDate distantPast];
    v137 = [v236 speakableDate];
    v138 = [v137 dateByAddingTimeInterval:-2419200.0];
    v139 = +[REFeatureValue featureValueWithInt64:[(OSMNotificationFeatureMap *)v231 numberOfInteractionsBetweenDate:v136 andDate:v138]];

    v140 = +[OSMRelevanceEngineFeatures numberOfInteractionsOlderThanLastMonthFeature];
    v197 = +[RERelevanceProvider customRelevanceProviderForFeature:v140 withValue:v139];

    v245[1] = v117;
    v246[0] = @"NumberOfInteractionsOlderThanLastMonth";
    v245[0] = v69;
    v141 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v139 int64Value]);
    v246[1] = v141;
    v142 = +[NSDictionary dictionaryWithObjects:v246 forKeys:v245 count:2];
    [v237 addObject:v142];

    v143 = (void *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
    {
      v193 = v143;
      id v194 = [v139 int64Value];
      *(_DWORD *)buf = 136315394;
      v272 = "-[OSMOnlineLearnerModel setSpeakable:]";
      __int16 v273 = 2048;
      id v274 = v194;
      _os_log_debug_impl((void *)&_mh_execute_header, v193, OS_LOG_TYPE_DEBUG, "%s number of interactions older than last month: %llu", buf, 0x16u);
    }
    v144 = [v235 feedbackManager];
    v145 = [v144 lastNegativeFeedbackForContact:0];

    v146 = +[NSDate date];
    v147 = v146;
    v198 = v139;
    if (v145) {
      [v146 timeIntervalSinceDate:v145];
    }
    else {
      [v146 timeIntervalSince1970];
    }
    v148 = +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:");

    v149 = +[OSMRelevanceEngineFeatures timeSinceNegativeFeedbackFeature];
    v150 = +[RERelevanceProvider customRelevanceProviderForFeature:v149 withValue:v148];

    v243[1] = v117;
    v244[0] = @"TimeSinceLastNegativeFeedback";
    v243[0] = v69;
    [v148 doubleValue];
    v151 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v244[1] = v151;
    v152 = +[NSDictionary dictionaryWithObjects:v244 forKeys:v243 count:2];
    [v237 addObject:v152];

    v153 = (void *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
    {
      v195 = v153;
      [v148 doubleValue];
      *(_DWORD *)buf = 136315394;
      v272 = "-[OSMOnlineLearnerModel setSpeakable:]";
      __int16 v273 = 2048;
      id v274 = v196;
      _os_log_debug_impl((void *)&_mh_execute_header, v195, OS_LOG_TYPE_DEBUG, "%s time since last negative feedback: %f", buf, 0x16u);
    }
    [v207 addObject:v234];
    [v207 addObject:v233];
    [v207 addObject:v232];
    [v207 addObject:v230];
    [v207 addObject:v229];
    [v207 addObject:v228];
    [v207 addObject:v227];
    [v207 addObject:v226];
    [v207 addObject:v225];
    [v207 addObject:v224];
    [v207 addObject:v223];
    [v207 addObject:v222];
    [v207 addObject:v221];
    [v207 addObject:v202];
    [v207 addObject:v201];
    [v207 addObject:v199];
    [v207 addObject:v197];
    [v207 addObject:v150];
    v154 = +[OSMRelevanceEngine sharedEngine];
    v238[0] = _NSConcreteStackBlock;
    v238[1] = 3221225472;
    v238[2] = sub_100008444;
    v238[3] = &unk_100010460;
    id v239 = v236;
    v240 = v231;
    v241 = v205;
    id v242 = v237;
    v155 = v231;
    [v154 predictionForSpeakable:v239 withRelevanceProviders:v207 handler:v238];

    id v6 = v207;
    id v8 = v236;

    id v7 = v237;
  }
}

- (void)startWithDelegate:(id)a3
{
  id v4 = (AFOpportuneSpeakingModelDelegate *)a3;
  int v5 = AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315394;
    id v8 = "-[OSMOnlineLearnerModel startWithDelegate:]";
    __int16 v9 = 2112;
    v10 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s delegate: %@", (uint8_t *)&v7, 0x16u);
  }
  delegate = self->_delegate;
  self->_delegate = v4;
}

- (OSMOnlineLearnerModel)init
{
  v10.receiver = self;
  v10.super_class = (Class)OSMOnlineLearnerModel;
  v2 = [(OSMOnlineLearnerModel *)&v10 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)NSString);
    id v4 = +[NSUUID UUID];
    int v5 = [v4 UUIDString];
    id v6 = (NSString *)[v3 initWithFormat:@"OnlineLearnerModel-%@", v5];
    identifier = v2->_identifier;
    v2->_identifier = v6;

    id v8 = +[AFOpportuneSpeakingModuleDataCollection sharedCollector];
  }
  return v2;
}

@end