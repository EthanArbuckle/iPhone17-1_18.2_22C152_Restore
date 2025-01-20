@interface CSAttendingSelfLogger
+ (void)emitAttendingContextEndedEventWithStopReason:(int64_t)a3 withMHUUID:(id)a4;
+ (void)emitAttendingContextStartedEventWithAttendingOptions:(id)a3 withMHUUID:(id)a4;
@end

@implementation CSAttendingSelfLogger

+ (void)emitAttendingContextStartedEventWithAttendingOptions:(id)a3 withMHUUID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    v7 = +[NSUUID UUID];
    id v6 = [v7 UUIDString];

    v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136315138;
      v23 = "+[CSAttendingSelfLogger emitAttendingContextStartedEventWithAttendingOptions:withMHUUID:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Mint a new MHUUID for attending started events", (uint8_t *)&v22, 0xCu);
    }
  }
  id v9 = objc_alloc_init((Class)MHSchemaMHAttendingContext);
  id v10 = objc_alloc_init((Class)MHSchemaMHAttendingStarted);
  if ([v5 attendingType] == (id)1)
  {
    v11 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136315138;
      v23 = "+[CSAttendingSelfLogger emitAttendingContextStartedEventWithAttendingOptions:withMHUUID:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Emit AttendingStarted with reason: Flexible FollowUp", (uint8_t *)&v22, 0xCu);
    }
    uint64_t v12 = 1;
  }
  else if ([v5 attendingType] == (id)6 || objc_msgSend(v5, "attendingType") == (id)7)
  {
    v13 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136315138;
      v23 = "+[CSAttendingSelfLogger emitAttendingContextStartedEventWithAttendingOptions:withMHUUID:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Emit AttendingStarted with reason: Announce Notification", (uint8_t *)&v22, 0xCu);
    }
    uint64_t v12 = 2;
  }
  else
  {
    v20 = CSLogContextFacilityCoreSpeech;
    BOOL v21 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
    uint64_t v12 = 0;
    if (v21)
    {
      int v22 = 136315138;
      v23 = "+[CSAttendingSelfLogger emitAttendingContextStartedEventWithAttendingOptions:withMHUUID:]";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s Emit AttendingStarted with reason: Other reasons", (uint8_t *)&v22, 0xCu);
      uint64_t v12 = 0;
    }
  }
  [v10 setStartReason:v12];
  [v9 setStartedOrChanged:v10];
  id v14 = objc_alloc_init((Class)MHSchemaMHClientEvent);
  id v15 = objc_alloc_init((Class)MHSchemaMHClientEventMetadata);
  id v16 = objc_alloc((Class)SISchemaUUID);
  id v17 = [objc_alloc((Class)NSUUID) initWithUUIDString:v6];
  id v18 = [v16 initWithNSUUID:v17];
  [v15 setMhId:v18];

  [v14 setEventMetadata:v15];
  [v14 setAttendingContext:v9];
  v19 = +[AssistantSiriAnalytics sharedStream];
  [v19 emitMessage:v14];
}

+ (void)emitAttendingContextEndedEventWithStopReason:(int64_t)a3 withMHUUID:(id)a4
{
  id v5 = a4;
  if (!v5)
  {
    id v6 = +[NSUUID UUID];
    id v5 = [v6 UUIDString];

    v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315138;
      int v22 = "+[CSAttendingSelfLogger emitAttendingContextEndedEventWithStopReason:withMHUUID:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Mint a new MHUUID for attending ended events", (uint8_t *)&v21, 0xCu);
    }
  }
  id v8 = objc_alloc_init((Class)MHSchemaMHAttendingContext);
  id v9 = objc_alloc_init((Class)MHSchemaMHAttendingEnded);
  if (a3 == 1)
  {
    uint64_t v12 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315138;
      int v22 = "+[CSAttendingSelfLogger emitAttendingContextEndedEventWithStopReason:withMHUUID:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s Emit AttendingEnded with reason: New request started", (uint8_t *)&v21, 0xCu);
    }
    uint64_t v11 = 1;
  }
  else if (a3 == 7)
  {
    id v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315138;
      int v22 = "+[CSAttendingSelfLogger emitAttendingContextEndedEventWithStopReason:withMHUUID:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Emit AttendingEnded with reason: UI requested", (uint8_t *)&v21, 0xCu);
    }
    uint64_t v11 = 2;
  }
  else
  {
    v13 = CSLogContextFacilityCoreSpeech;
    BOOL v14 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
    uint64_t v11 = 0;
    if (v14)
    {
      int v21 = 136315138;
      int v22 = "+[CSAttendingSelfLogger emitAttendingContextEndedEventWithStopReason:withMHUUID:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Emit AttendingEnded with reason: Other reasons", (uint8_t *)&v21, 0xCu);
      uint64_t v11 = 0;
    }
  }
  [v9 setEndReason:v11];
  [v8 setEnded:v9];
  id v15 = objc_alloc_init((Class)MHSchemaMHClientEvent);
  id v16 = objc_alloc_init((Class)MHSchemaMHClientEventMetadata);
  id v17 = objc_alloc((Class)SISchemaUUID);
  id v18 = [objc_alloc((Class)NSUUID) initWithUUIDString:v5];
  id v19 = [v17 initWithNSUUID:v18];
  [v16 setMhId:v19];

  [v15 setEventMetadata:v16];
  [v15 setAttendingContext:v8];
  v20 = +[AssistantSiriAnalytics sharedStream];
  [v20 emitMessage:v15];
}

@end