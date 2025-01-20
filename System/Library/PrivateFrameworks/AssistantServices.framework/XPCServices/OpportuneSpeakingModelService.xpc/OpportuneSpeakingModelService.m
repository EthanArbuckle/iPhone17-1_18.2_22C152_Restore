void sub_10000515C(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  float v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  double v14;

  v2 = [*(id *)(*(void *)(a1 + 32) + 8) predictionForElement:*(void *)(a1 + 40)];
  v3 = (void *)AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(void **)(a1 + 48);
    v6 = v3;
    v7 = [v5 speakableIdentifier];
    [v2 probability];
    v9 = 136315650;
    v10 = "-[OSMRelevanceEngine predictionForSpeakable:withRelevanceProviders:handler:]_block_invoke";
    v11 = 2112;
    v12 = v7;
    v13 = 2048;
    v14 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s Element: %@ Probability: %f", (uint8_t *)&v9, 0x20u);
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
  v4 = *(void *)(a1 + 56);
  [v2 probability];
  (*(void (**)(uint64_t))(v4 + 16))(v4);
}

REFeatureValue *__cdecl sub_100005E18(id a1, REFeatureValue *a2)
{
  v2 = a2;
  [(REFeatureValue *)v2 doubleValue];
  if (v3 <= 60.0)
  {
    uint64_t v10 = 0;
  }
  else
  {
    [(REFeatureValue *)v2 doubleValue];
    if (v4 > 60.0 && ([(REFeatureValue *)v2 doubleValue], v5 <= 900.0))
    {
      uint64_t v10 = 1;
    }
    else
    {
      [(REFeatureValue *)v2 doubleValue];
      if (v6 > 900.0 && ([(REFeatureValue *)v2 doubleValue], v7 <= 1800.0))
      {
        uint64_t v10 = 2;
      }
      else
      {
        [(REFeatureValue *)v2 doubleValue];
        if (v8 <= 1800.0)
        {
          uint64_t v10 = 4;
        }
        else
        {
          [(REFeatureValue *)v2 doubleValue];
          if (v9 <= 3600.0) {
            uint64_t v10 = 3;
          }
          else {
            uint64_t v10 = 4;
          }
        }
      }
    }
  }
  v11 = +[REFeatureValue featureValueWithInt64:v10];

  return (REFeatureValue *)v11;
}

REFeatureValue *__cdecl sub_100005F2C(id a1, REFeatureValue *a2)
{
  v2 = a2;
  [(REFeatureValue *)v2 doubleValue];
  if (v3 <= 60.0)
  {
    uint64_t v12 = 0;
  }
  else
  {
    [(REFeatureValue *)v2 doubleValue];
    if (v4 > 60.0 && ([(REFeatureValue *)v2 doubleValue], v5 <= 3600.0))
    {
      uint64_t v12 = 1;
    }
    else
    {
      [(REFeatureValue *)v2 doubleValue];
      if (v6 > 3600.0 && ([(REFeatureValue *)v2 doubleValue], v7 <= 86400.0))
      {
        uint64_t v12 = 2;
      }
      else
      {
        [(REFeatureValue *)v2 doubleValue];
        if (v8 > 86400.0 && ([(REFeatureValue *)v2 doubleValue], v9 <= 604800.0))
        {
          uint64_t v12 = 3;
        }
        else
        {
          [(REFeatureValue *)v2 doubleValue];
          if (v10 <= 604800.0)
          {
            uint64_t v12 = 5;
          }
          else
          {
            [(REFeatureValue *)v2 doubleValue];
            if (v11 <= 2419200.0) {
              uint64_t v12 = 4;
            }
            else {
              uint64_t v12 = 5;
            }
          }
        }
      }
    }
  }
  v13 = +[REFeatureValue featureValueWithInt64:v12];

  return (REFeatureValue *)v13;
}

void sub_1000060C8(id a1)
{
  qword_100015820 = objc_alloc_init(OSMRelevanceEngine);
  _objc_release_x1();
}

id sub_100008444(uint64_t a1, float a2)
{
  double v4 = +[AFOpportuneSpeakingModuleDataCollection sharedCollector];
  uint64_t v5 = *(void *)(a1 + 32);
  double v6 = [*(id *)(a1 + 40) contactId];
  *(float *)&double v7 = a2;
  [v4 logSpeakable:v5 forContact:v6 withModelId:*(void *)(*(void *)(a1 + 48) + 16) withFeatures:*(void *)(a1 + 56) withScore:v7];

  uint64_t v8 = *(void *)(a1 + 48);
  double v9 = *(void **)(v8 + 8);
  uint64_t v10 = *(void *)(v8 + 16);
  uint64_t v11 = *(void *)(a1 + 32);
  *(float *)&double v12 = a2;
  return [v9 modelWithIdentifier:v10 didUpdateScore:v11 forSpeakable:v12];
}

void sub_100009388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000093A0(uint64_t a1, void *a2)
{
  id v6 = [a2 objectForKey:kMRMediaRemoteNowPlayingInfoMediaType];
  if ([v6 isEqualToString:kMRMediaRemoteMediaTypeMusic])
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v4 = 1;
  }
  else if ([v6 isEqualToString:kMRMediaRemoteMediaTypePodcast])
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v4 = 2;
  }
  else if ([v6 isEqualToString:kMRMediaRemoteMediaTypeAudioBook])
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v4 = 3;
  }
  else
  {
    unsigned int v5 = [v6 isEqualToString:kMRMediaRemoteMediaTypeITunesU];
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    if (v5) {
      uint64_t v4 = 4;
    }
    else {
      uint64_t v4 = 5;
    }
  }
  *(void *)(v3 + 24) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000095F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000960C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000961C(uint64_t a1)
{
}

void sub_100009624(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100009998(uint64_t a1, void *a2)
{
}

void sub_100009A9C(uint64_t a1)
{
  v2 = +[NSDate date];
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  id v4 = [v2 dateByAddingTimeInterval:-43200.0];
  unsigned int v5 = [v2 dateByAddingTimeInterval:43200.0];
  id v6 = [v3 predicateForEventsWithStartDate:v4 endDate:v5 calendars:0];

  double v7 = *(void **)(*(void *)(a1 + 32) + 8);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100009BC4;
  v10[3] = &unk_1000104C8;
  uint64_t v8 = *(void *)(a1 + 48);
  id v11 = v2;
  uint64_t v12 = v8;
  id v9 = v2;
  [v7 enumerateEventsMatchingPredicate:v6 usingBlock:v10];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100009BC4(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136315394;
    id v11 = "-[OSMBackgroundFeatureManager hasOngoingEvent]_block_invoke_2";
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s found event: %@", (uint8_t *)&v10, 0x16u);
  }
  if (([v5 isAllDay] & 1) == 0)
  {
    double v7 = [v5 startDate];
    if ([v7 compare:*(void *)(a1 + 32)] != (id)1)
    {
      uint64_t v8 = [v5 endDate];
      if ([v8 compare:*(void *)(a1 + 32)] != (id)-1)
      {
        id v9 = [v5 availability];

        if (!v9)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
          *a3 = 1;
        }
        goto LABEL_10;
      }
    }
  }
LABEL_10:
}

void sub_100009F20(id a1)
{
  qword_100015838 = [[OSMBackgroundFeatureManager alloc] _init];
  _objc_release_x1();
}

int main(int argc, const char **argv, const char **envp)
{
  AFLogInitIfNeeded();
  uint64_t v3 = objc_opt_new();
  id v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

void sub_10000A350(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315650;
    __int16 v12 = "-[OSMNotificationFeatureMap _recent]_block_invoke";
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s %@, error: %@", (uint8_t *)&v11, 0x20u);
  }
  uint64_t v8 = [v5 firstObject];
  uint64_t v9 = *(void *)(a1 + 32);
  int v10 = *(void **)(v9 + 48);
  *(void *)(v9 + 48) = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10000A830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000A84C(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = [v5 firstName];
  double v7 = [v5 lastName];
  if ([v6 length]
    && [*(id *)(a1 + 32) containsObject:v6]
    && [v7 length]
    && [*(id *)(a1 + 32) containsObject:v7])
  {
    [v5 score];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8;
    uint64_t v9 = AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      int v11 = 136315394;
      __int16 v12 = "-[OSMNotificationFeatureMap senderScore]_block_invoke";
      __int16 v13 = 2048;
      uint64_t v14 = v10;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s Found a match! score: %f", (uint8_t *)&v11, 0x16u);
    }
    *a3 = 1;
  }
}

void sub_10000B0A0(uint64_t a1)
{
  v2 = +[OSMBackgroundFeatureManager sharedBackgroundFeatureManager];
  uint64_t v3 = [v2 feedbackManager];
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000B18C;
  v7[3] = &unk_1000105F8;
  id v8 = v4;
  id v9 = *(id *)(a1 + 56);
  [v3 fetchNotificationUsageForSpeakableId:v8 withStartDate:v5 withEndDate:v6 withHandler:v7];
}

uint64_t sub_10000B18C(uint64_t a1, void *a2, int a3)
{
  if (a3)
  {
    id v4 = a2;
    uint64_t v5 = +[AFOpportuneSpeakingModuleDataCollection sharedCollector];
    [v5 logInteractionEvents:v4 forSpeakableId:*(void *)(a1 + 32)];

    uint64_t v6 = +[OSMBackgroundFeatureManager sharedBackgroundFeatureManager];
    double v7 = [v6 feedbackManager];
    [v7 interactionDetectedForSpeakableId:*(void *)(a1 + 32)];
  }
  id v8 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v8();
}

uint64_t AFGetNowPlayingInfoDictionary()
{
  return _AFGetNowPlayingInfoDictionary();
}

uint64_t AFGetNowPlayingQueueState()
{
  return _AFGetNowPlayingQueueState();
}

uint64_t AFLogInitIfNeeded()
{
  return _AFLogInitIfNeeded();
}

uint64_t AFOpportuneSpeakingModelFeedbackGetDescription()
{
  return _AFOpportuneSpeakingModelFeedbackGetDescription();
}

uint64_t AFOpportuneSpeakingModelServiceInterface()
{
  return _AFOpportuneSpeakingModelServiceInterface();
}

uint64_t AFUserSupportDirectoryPath()
{
  return _AFUserSupportDirectoryPath();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return [a1 _init];
}

id objc_msgSend__messageSender(void *a1, const char *a2, ...)
{
  return [a1 _messageSender];
}

id objc_msgSend__messageSenderCNContact(void *a1, const char *a2, ...)
{
  return [a1 _messageSenderCNContact];
}

id objc_msgSend__recent(void *a1, const char *a2, ...)
{
  return [a1 _recent];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_automotive(void *a1, const char *a2, ...)
{
  return [a1 automotive];
}

id objc_msgSend_availability(void *a1, const char *a2, ...)
{
  return [a1 availability];
}

id objc_msgSend_becomeCurrent(void *a1, const char *a2, ...)
{
  return [a1 becomeCurrent];
}

id objc_msgSend_confidence(void *a1, const char *a2, ...)
{
  return [a1 confidence];
}

id objc_msgSend_contactId(void *a1, const char *a2, ...)
{
  return [a1 contactId];
}

id objc_msgSend_contactIdentifier(void *a1, const char *a2, ...)
{
  return [a1 contactIdentifier];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countOfRecents(void *a1, const char *a2, ...)
{
  return [a1 countOfRecents];
}

id objc_msgSend_currentTimeFeature(void *a1, const char *a2, ...)
{
  return [a1 currentTimeFeature];
}

id objc_msgSend_cycling(void *a1, const char *a2, ...)
{
  return [a1 cycling];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dayOfWeekFeature(void *a1, const char *a2, ...)
{
  return [a1 dayOfWeekFeature];
}

id objc_msgSend_defaultConfiguration(void *a1, const char *a2, ...)
{
  return [a1 defaultConfiguration];
}

id objc_msgSend_defaultInstance(void *a1, const char *a2, ...)
{
  return [a1 defaultInstance];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
}

id objc_msgSend_feedbackManager(void *a1, const char *a2, ...)
{
  return [a1 feedbackManager];
}

id objc_msgSend_firstName(void *a1, const char *a2, ...)
{
  return [a1 firstName];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_hasOngoingEvent(void *a1, const char *a2, ...)
{
  return [a1 hasOngoingEvent];
}

id objc_msgSend_hasOngoingEventFeature(void *a1, const char *a2, ...)
{
  return [a1 hasOngoingEventFeature];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_int64Value(void *a1, const char *a2, ...)
{
  return [a1 int64Value];
}

id objc_msgSend_interactionDescriptors(void *a1, const char *a2, ...)
{
  return [a1 interactionDescriptors];
}

id objc_msgSend_isActivityAvailable(void *a1, const char *a2, ...)
{
  return [a1 isActivityAvailable];
}

id objc_msgSend_isAllDay(void *a1, const char *a2, ...)
{
  return [a1 isAllDay];
}

id objc_msgSend_isGroupMessage(void *a1, const char *a2, ...)
{
  return [a1 isGroupMessage];
}

id objc_msgSend_isMessageSenderFavorite(void *a1, const char *a2, ...)
{
  return [a1 isMessageSenderFavorite];
}

id objc_msgSend_isMessageSenderInContacts(void *a1, const char *a2, ...)
{
  return [a1 isMessageSenderInContacts];
}

id objc_msgSend_isMusicPlayingFeature(void *a1, const char *a2, ...)
{
  return [a1 isMusicPlayingFeature];
}

id objc_msgSend_isNotGroupMessageFeature(void *a1, const char *a2, ...)
{
  return [a1 isNotGroupMessageFeature];
}

id objc_msgSend_isSenderFavoriteFeature(void *a1, const char *a2, ...)
{
  return [a1 isSenderFavoriteFeature];
}

id objc_msgSend_isSenderInContactsFeature(void *a1, const char *a2, ...)
{
  return [a1 isSenderInContactsFeature];
}

id objc_msgSend_isWeekendFeature(void *a1, const char *a2, ...)
{
  return [a1 isWeekendFeature];
}

id objc_msgSend_lastName(void *a1, const char *a2, ...)
{
  return [a1 lastName];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mediaType(void *a1, const char *a2, ...)
{
  return [a1 mediaType];
}

id objc_msgSend_mediaTypeFeature(void *a1, const char *a2, ...)
{
  return [a1 mediaTypeFeature];
}

id objc_msgSend_modelIdentifier(void *a1, const char *a2, ...)
{
  return [a1 modelIdentifier];
}

id objc_msgSend_motionActivity(void *a1, const char *a2, ...)
{
  return [a1 motionActivity];
}

id objc_msgSend_motionActivityFeature(void *a1, const char *a2, ...)
{
  return [a1 motionActivityFeature];
}

id objc_msgSend_motionConfidence(void *a1, const char *a2, ...)
{
  return [a1 motionConfidence];
}

id objc_msgSend_musicPlayingState(void *a1, const char *a2, ...)
{
  return [a1 musicPlayingState];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_numberOfInteractionsInLastDayFeature(void *a1, const char *a2, ...)
{
  return [a1 numberOfInteractionsInLastDayFeature];
}

id objc_msgSend_numberOfInteractionsInLastFortnightFeature(void *a1, const char *a2, ...)
{
  return [a1 numberOfInteractionsInLastFortnightFeature];
}

id objc_msgSend_numberOfInteractionsInLastHalfHourFeature(void *a1, const char *a2, ...)
{
  return [a1 numberOfInteractionsInLastHalfHourFeature];
}

id objc_msgSend_numberOfInteractionsInLastHourFeature(void *a1, const char *a2, ...)
{
  return [a1 numberOfInteractionsInLastHourFeature];
}

id objc_msgSend_numberOfInteractionsInLastMinuteFeature(void *a1, const char *a2, ...)
{
  return [a1 numberOfInteractionsInLastMinuteFeature];
}

id objc_msgSend_numberOfInteractionsInLastMonthFeature(void *a1, const char *a2, ...)
{
  return [a1 numberOfInteractionsInLastMonthFeature];
}

id objc_msgSend_numberOfInteractionsInLastSixHoursFeature(void *a1, const char *a2, ...)
{
  return [a1 numberOfInteractionsInLastSixHoursFeature];
}

id objc_msgSend_numberOfInteractionsInLastWeekFeature(void *a1, const char *a2, ...)
{
  return [a1 numberOfInteractionsInLastWeekFeature];
}

id objc_msgSend_numberOfInteractionsOlderThanLastMonthFeature(void *a1, const char *a2, ...)
{
  return [a1 numberOfInteractionsOlderThanLastMonthFeature];
}

id objc_msgSend_numberOfRecentInteractionsWithSender(void *a1, const char *a2, ...)
{
  return [a1 numberOfRecentInteractionsWithSender];
}

id objc_msgSend_probability(void *a1, const char *a2, ...)
{
  return [a1 probability];
}

id objc_msgSend_recentDates(void *a1, const char *a2, ...)
{
  return [a1 recentDates];
}

id objc_msgSend_recentInteractionsWithSender(void *a1, const char *a2, ...)
{
  return [a1 recentInteractionsWithSender];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_running(void *a1, const char *a2, ...)
{
  return [a1 running];
}

id objc_msgSend_score(void *a1, const char *a2, ...)
{
  return [a1 score];
}

id objc_msgSend_sectionDescriptors(void *a1, const char *a2, ...)
{
  return [a1 sectionDescriptors];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sharedBackgroundFeatureManager(void *a1, const char *a2, ...)
{
  return [a1 sharedBackgroundFeatureManager];
}

id objc_msgSend_sharedCollector(void *a1, const char *a2, ...)
{
  return [a1 sharedCollector];
}

id objc_msgSend_sharedEngine(void *a1, const char *a2, ...)
{
  return [a1 sharedEngine];
}

id objc_msgSend_speakableDate(void *a1, const char *a2, ...)
{
  return [a1 speakableDate];
}

id objc_msgSend_speakableDescription(void *a1, const char *a2, ...)
{
  return [a1 speakableDescription];
}

id objc_msgSend_speakableIdentifier(void *a1, const char *a2, ...)
{
  return [a1 speakableIdentifier];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_startMonitoringActivity(void *a1, const char *a2, ...)
{
  return [a1 startMonitoringActivity];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stationary(void *a1, const char *a2, ...)
{
  return [a1 stationary];
}

id objc_msgSend_stopActivityUpdates(void *a1, const char *a2, ...)
{
  return [a1 stopActivityUpdates];
}

id objc_msgSend_stopMonitoringActivity(void *a1, const char *a2, ...)
{
  return [a1 stopMonitoringActivity];
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return [a1 subtitle];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeSinceMostRecentInteractionFeature(void *a1, const char *a2, ...)
{
  return [a1 timeSinceMostRecentInteractionFeature];
}

id objc_msgSend_timeSinceMostRecentInteractionWithSender(void *a1, const char *a2, ...)
{
  return [a1 timeSinceMostRecentInteractionWithSender];
}

id objc_msgSend_timeSinceNegativeFeedbackFeature(void *a1, const char *a2, ...)
{
  return [a1 timeSinceNegativeFeedbackFeature];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_trueCondition(void *a1, const char *a2, ...)
{
  return [a1 trueCondition];
}

id objc_msgSend_unknown(void *a1, const char *a2, ...)
{
  return [a1 unknown];
}

id objc_msgSend_walking(void *a1, const char *a2, ...)
{
  return [a1 walking];
}