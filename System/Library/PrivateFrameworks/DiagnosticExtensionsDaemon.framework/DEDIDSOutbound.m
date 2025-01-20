@interface DEDIDSOutbound
+ (id)archivedClasses;
+ (id)outboundWithSessionID:(id)a3 withDeviceAtAddress:(id)a4 connection:(id)a5;
- (DEDIDSConnection)connection;
- (DEDIDSOutbound)init;
- (NSString)deviceAddress;
- (NSString)sessionID;
- (OS_os_log)log;
- (int64_t)transportType;
- (void)addSessionData:(id)a3 withFilename:(id)a4 forSession:(id)a5;
- (void)adoptFiles:(id)a3 forSession:(id)a4;
- (void)cancelSession:(id)a3;
- (void)commitSession:(id)a3;
- (void)compressionProgress:(unint64_t)a3 total:(unint64_t)a4 sessionID:(id)a5;
- (void)deviceSupportsDiagnosticExtensions:(id)a3 session:(id)a4;
- (void)didAdoptFilesWithError:(id)a3 forSession:(id)a4;
- (void)didCancelSession:(id)a3;
- (void)didCommitSession:(id)a3;
- (void)didGetState:(int64_t)a3 info:(id)a4 sessionID:(id)a5;
- (void)didLoadTextDataForExtensions:(id)a3 localization:(id)a4 session:(id)a5;
- (void)finishedDiagnosticWithIdentifier:(id)a3 result:(id)a4 session:(id)a5;
- (void)getSessionStateWithSession:(id)a3;
- (void)getSessionStatusWithSession:(id)a3;
- (void)hasCollected:(id)a3 isCollecting:(id)a4 inSession:(id)a5;
- (void)hasCollected:(id)a3 isCollecting:(id)a4 withIdentifiers:(id)a5 inSession:(id)a6;
- (void)listAvailableExtensionsForSession:(id)a3;
- (void)loadTextDataForExtensions:(id)a3 localization:(id)a4 sessionID:(id)a5;
- (void)pingSession:(id)a3;
- (void)pongSession:(id)a3;
- (void)presentNotificationForSession:(id)a3;
- (void)removeNotificationForSession:(id)a3;
- (void)scheduleNotificationForSession:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDeviceAddress:(id)a3;
- (void)setLog:(id)a3;
- (void)setSessionID:(id)a3;
- (void)startDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 deferRunUntil:(id)a5 session:(id)a6;
- (void)startDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 session:(id)a5;
- (void)syncSessionStatusWithSession:(id)a3;
- (void)terminateExtension:(id)a3 info:(id)a4 session:(id)a5;
- (void)unscheduleNotificationForSession:(id)a3;
- (void)uploadProgress:(unint64_t)a3 total:(unint64_t)a4 sessionID:(id)a5;
@end

@implementation DEDIDSOutbound

- (int64_t)transportType
{
  return 4;
}

+ (id)outboundWithSessionID:(id)a3 withDeviceAtAddress:(id)a4 connection:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(DEDIDSOutbound);
  [(DEDIDSOutbound *)v10 setConnection:v7];

  [(DEDIDSOutbound *)v10 setDeviceAddress:v8];
  [(DEDIDSOutbound *)v10 setSessionID:v9];

  return v10;
}

- (DEDIDSOutbound)init
{
  v9.receiver = self;
  v9.super_class = (Class)DEDIDSOutbound;
  v2 = [(DEDIDSOutbound *)&v9 init];
  if (v2)
  {
    v3 = +[DEDConfiguration sharedInstance];
    os_log_t v4 = os_log_create((const char *)[v3 loggingSubsystem], "ids-outbound");
    log = v2->_log;
    v2->_log = (OS_os_log *)v4;

    deviceAddress = v2->_deviceAddress;
    v2->_deviceAddress = 0;

    sessionID = v2->_sessionID;
    v2->_sessionID = 0;
  }
  return v2;
}

- (void)pingSession:(id)a3
{
  id v8 = a3;
  os_log_t v4 = [MEMORY[0x263EFF9A0] dictionary];
  if (v8) {
    [v4 setValue:v8 forKey:@"sessionID"];
  }
  v5 = [(DEDIDSOutbound *)self connection];
  v6 = +[DEDIDSConnection packPayload:v4];
  id v7 = [(DEDIDSOutbound *)self deviceAddress];
  [v5 sendMessage:10 withData:v6 forIDSDeviceID:v7 isResponse:0];
}

- (void)terminateExtension:(id)a3 info:(id)a4 session:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [MEMORY[0x263EFF9A0] dictionary];
  if (v14 && v9)
  {
    [v10 setValue:v9 forKey:@"sessionID"];
    [v10 setValue:v14 forKey:@"triggerDE"];
  }
  if (v8) {
    [v10 setValue:v8 forKey:@"triggerDEParams"];
  }
  v11 = [(DEDIDSOutbound *)self connection];
  v12 = +[DEDIDSConnection packPayload:v10];
  v13 = [(DEDIDSOutbound *)self deviceAddress];
  [v11 sendMessage:12 withData:v12 forIDSDeviceID:v13 isResponse:0];
}

- (void)pongSession:(id)a3
{
  id v8 = a3;
  os_log_t v4 = [MEMORY[0x263EFF9A0] dictionary];
  if (v8) {
    [v4 setValue:v8 forKey:@"sessionID"];
  }
  v5 = [(DEDIDSOutbound *)self connection];
  v6 = +[DEDIDSConnection packPayload:v4];
  id v7 = [(DEDIDSOutbound *)self deviceAddress];
  [v5 sendMessage:11 withData:v6 forIDSDeviceID:v7 isResponse:0];
}

- (void)listAvailableExtensionsForSession:(id)a3
{
  id v8 = a3;
  os_log_t v4 = [MEMORY[0x263EFF9A0] dictionary];
  if (v8) {
    [v4 setValue:v8 forKey:@"sessionID"];
  }
  v5 = [(DEDIDSOutbound *)self connection];
  v6 = +[DEDIDSConnection packPayload:v4];
  id v7 = [(DEDIDSOutbound *)self deviceAddress];
  [v5 sendMessage:2 withData:v6 forIDSDeviceID:v7 isResponse:0];
}

- (void)deviceSupportsDiagnosticExtensions:(id)a3 session:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263EFF9A0] dictionary];
  id v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v14), "serialize", (void)v19);
        [v9 addObject:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  [v8 setValue:v7 forKey:@"sessionID"];
  [v8 setValue:v9 forKey:@"getDEList"];
  v16 = [(DEDIDSOutbound *)self connection];
  v17 = +[DEDIDSConnection packPayload:v8];
  v18 = [(DEDIDSOutbound *)self deviceAddress];
  [v16 sendMessage:3 withData:v17 forIDSDeviceID:v18 isResponse:0];
}

- (void)startDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 session:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x263EFF9A0] dictionary];
  if (v14 && v9)
  {
    [v10 setValue:v9 forKey:@"sessionID"];
    [v10 setValue:v14 forKey:@"triggerDE"];
    [v10 setValue:v8 forKey:@"triggerDEParams"];
  }
  uint64_t v11 = [(DEDIDSOutbound *)self connection];
  uint64_t v12 = +[DEDIDSConnection packPayload:v10];
  uint64_t v13 = [(DEDIDSOutbound *)self deviceAddress];
  [v11 sendMessage:4 withData:v12 forIDSDeviceID:v13 isResponse:0];
}

- (void)startDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 deferRunUntil:(id)a5 session:(id)a6
{
  id v17 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
  if (v17 && v12)
  {
    [v13 setValue:v12 forKey:@"sessionID"];
    [v13 setValue:v17 forKey:@"triggerDE"];
    [v13 setValue:v10 forKey:@"triggerDEParams"];
    [v13 setValue:v11 forKey:@"triggerDERunDate"];
  }
  id v14 = [(DEDIDSOutbound *)self connection];
  v15 = +[DEDIDSConnection packPayload:v13];
  v16 = [(DEDIDSOutbound *)self deviceAddress];
  [v14 sendMessage:4 withData:v15 forIDSDeviceID:v16 isResponse:0];
}

- (void)finishedDiagnosticWithIdentifier:(id)a3 result:(id)a4 session:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x263EFF9A0] dictionary];
  if (v8 && v15 && v9)
  {
    [v10 setValue:v9 forKey:@"sessionID"];
    [v10 setValue:v15 forKey:@"triggerDE"];
    id v11 = [v8 serialize];
    [v10 setValue:v11 forKey:@"finishedDEDGroups"];
  }
  id v12 = [(DEDIDSOutbound *)self connection];
  uint64_t v13 = +[DEDIDSConnection packPayload:v10];
  id v14 = [(DEDIDSOutbound *)self deviceAddress];
  [v12 sendMessage:5 withData:v13 forIDSDeviceID:v14 isResponse:0];
}

- (void)getSessionStatusWithSession:(id)a3
{
  id v8 = a3;
  os_log_t v4 = [MEMORY[0x263EFF9A0] dictionary];
  if (v8) {
    [v4 setValue:v8 forKey:@"sessionID"];
  }
  v5 = [(DEDIDSOutbound *)self connection];
  id v6 = +[DEDIDSConnection packPayload:v4];
  id v7 = [(DEDIDSOutbound *)self deviceAddress];
  [v5 sendMessage:13 withData:v6 forIDSDeviceID:v7 isResponse:0];
}

- (void)getSessionStateWithSession:(id)a3
{
  id v8 = a3;
  os_log_t v4 = [MEMORY[0x263EFF9A0] dictionary];
  if (v8) {
    [v4 setValue:v8 forKey:@"sessionID"];
  }
  v5 = [(DEDIDSOutbound *)self connection];
  id v6 = +[DEDIDSConnection packPayload:v4];
  id v7 = [(DEDIDSOutbound *)self deviceAddress];
  [v5 sendMessage:24 withData:v6 forIDSDeviceID:v7 isResponse:0];
}

- (void)addSessionData:(id)a3 withFilename:(id)a4 forSession:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x263EFF9A0] dictionary];
  id v11 = v10;
  if (v9)
  {
    [v10 setValue:v9 forKey:@"sessionID"];
    [v11 setValue:v15 forKey:@"sessionData"];
    [v11 setValue:v8 forKey:@"sessionDataFilename"];
  }
  id v12 = [(DEDIDSOutbound *)self connection];
  uint64_t v13 = +[DEDIDSConnection packPayload:v11];
  id v14 = [(DEDIDSOutbound *)self deviceAddress];
  [v12 sendMessage:30 withData:v13 forIDSDeviceID:v14 isResponse:0];
}

- (void)didGetState:(int64_t)a3 info:(id)a4 sessionID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x263EFF9A0] dictionary];
  id v11 = v10;
  if (v9)
  {
    [v10 setObject:v9 forKeyedSubscript:@"sessionID"];
    id v12 = [NSNumber numberWithInteger:a3];
    [v11 setObject:v12 forKeyedSubscript:@"sessionState"];

    if (v8) {
      id v13 = v8;
    }
    else {
      id v13 = (id)MEMORY[0x263EFFA78];
    }
    [v11 setObject:v13 forKeyedSubscript:@"sessionStateInfo"];
  }
  else
  {
    id v14 = [(DEDIDSOutbound *)self log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[DEDIDSOutbound didGetState:info:sessionID:](v14);
    }
  }
  id v15 = [(DEDIDSOutbound *)self connection];
  v16 = +[DEDIDSConnection packPayload:v11];
  id v17 = [(DEDIDSOutbound *)self deviceAddress];
  [v15 sendMessage:25 withData:v16 forIDSDeviceID:v17 isResponse:0];
}

- (void)hasCollected:(id)a3 isCollecting:(id)a4 inSession:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x263EFF9A0] dictionary];
  if (v16 && v9)
  {
    [v10 setObject:v9 forKeyedSubscript:@"sessionID"];
    id v11 = objc_msgSend(v8, "ded_mapWithBlock:", &__block_literal_global_21);
    [v10 setObject:v11 forKeyedSubscript:@"runningDEs"];

    id v12 = objc_msgSend(v16, "ded_mapWithBlock:", &__block_literal_global_54);
    [v10 setObject:v12 forKeyedSubscript:@"finishedDEDGroups"];
  }
  id v13 = [(DEDIDSOutbound *)self connection];
  id v14 = +[DEDIDSConnection packPayload:v10];
  id v15 = [(DEDIDSOutbound *)self deviceAddress];
  [v13 sendMessage:14 withData:v14 forIDSDeviceID:v15 isResponse:0];
}

uint64_t __54__DEDIDSOutbound_hasCollected_isCollecting_inSession___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serialize];
}

uint64_t __54__DEDIDSOutbound_hasCollected_isCollecting_inSession___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serialize];
}

- (void)hasCollected:(id)a3 isCollecting:(id)a4 withIdentifiers:(id)a5 inSession:(id)a6
{
  id v20 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [MEMORY[0x263EFF9A0] dictionary];
  if (v20 && v12)
  {
    [v13 setObject:v12 forKeyedSubscript:@"sessionID"];
    id v14 = objc_msgSend(v10, "ded_mapWithBlock:", &__block_literal_global_56_0);
    [v13 setObject:v14 forKeyedSubscript:@"runningDEs"];

    id v15 = objc_msgSend(v20, "ded_mapWithBlock:", &__block_literal_global_58);
    [v13 setObject:v15 forKeyedSubscript:@"finishedDEDGroups"];

    id v16 = objc_msgSend(v11, "ded_mapWithBlock:", &__block_literal_global_60);
    [v13 setObject:v16 forKeyedSubscript:@"extensionIdentifiers"];
  }
  id v17 = [(DEDIDSOutbound *)self connection];
  v18 = +[DEDIDSConnection packPayload:v13];
  long long v19 = [(DEDIDSOutbound *)self deviceAddress];
  [v17 sendMessage:23 withData:v18 forIDSDeviceID:v19 isResponse:0];
}

uint64_t __70__DEDIDSOutbound_hasCollected_isCollecting_withIdentifiers_inSession___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serialize];
}

uint64_t __70__DEDIDSOutbound_hasCollected_isCollecting_withIdentifiers_inSession___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serialize];
}

uint64_t __70__DEDIDSOutbound_hasCollected_isCollecting_withIdentifiers_inSession___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 stringValue];
}

- (void)adoptFiles:(id)a3 forSession:(id)a4
{
  id v6 = (void *)MEMORY[0x263EFF9A0];
  id v7 = a4;
  id v8 = a3;
  id v12 = [v6 dictionary];
  [v12 setObject:v8 forKeyedSubscript:@"filesForAdopt"];

  [v12 setObject:v7 forKeyedSubscript:@"sessionID"];
  id v9 = [(DEDIDSOutbound *)self connection];
  id v10 = +[DEDIDSConnection packPayload:v12];
  id v11 = [(DEDIDSOutbound *)self deviceAddress];
  [v9 sendMessage:15 withData:v10 forIDSDeviceID:v11 isResponse:0];
}

- (void)didAdoptFilesWithError:(id)a3 forSession:(id)a4
{
  id v6 = (void *)MEMORY[0x263EFF9A0];
  id v7 = a4;
  id v8 = a3;
  id v12 = [v6 dictionary];
  [v12 setObject:v8 forKeyedSubscript:@"error"];

  [v12 setObject:v7 forKeyedSubscript:@"sessionID"];
  id v9 = [(DEDIDSOutbound *)self connection];
  id v10 = +[DEDIDSConnection packPayload:v12];
  id v11 = [(DEDIDSOutbound *)self deviceAddress];
  [v9 sendMessage:16 withData:v10 forIDSDeviceID:v11 isResponse:0];
}

- (void)uploadProgress:(unint64_t)a3 total:(unint64_t)a4 sessionID:(id)a5
{
  id v8 = (void *)MEMORY[0x263EFF9A0];
  id v9 = a5;
  id v15 = [v8 dictionary];
  [v15 setObject:v9 forKeyedSubscript:@"sessionID"];

  id v10 = [NSNumber numberWithUnsignedLongLong:a3];
  [v15 setObject:v10 forKeyedSubscript:@"uploadedBytes"];

  id v11 = [NSNumber numberWithUnsignedLongLong:a4];
  [v15 setObject:v11 forKeyedSubscript:@"totalBytes"];

  id v12 = [(DEDIDSOutbound *)self connection];
  id v13 = +[DEDIDSConnection packPayload:v15];
  id v14 = [(DEDIDSOutbound *)self deviceAddress];
  [v12 sendMessage:17 withData:v13 forIDSDeviceID:v14 isResponse:0];
}

- (void)compressionProgress:(unint64_t)a3 total:(unint64_t)a4 sessionID:(id)a5
{
  id v8 = (void *)MEMORY[0x263EFF9A0];
  id v9 = a5;
  id v15 = [v8 dictionary];
  [v15 setObject:v9 forKeyedSubscript:@"sessionID"];

  id v10 = [NSNumber numberWithUnsignedLongLong:a3];
  [v15 setObject:v10 forKeyedSubscript:@"compressedBytes"];

  id v11 = [NSNumber numberWithUnsignedLongLong:a4];
  [v15 setObject:v11 forKeyedSubscript:@"totalBytes"];

  id v12 = [(DEDIDSOutbound *)self connection];
  id v13 = +[DEDIDSConnection packPayload:v15];
  id v14 = [(DEDIDSOutbound *)self deviceAddress];
  [v12 sendMessage:32 withData:v13 forIDSDeviceID:v14 isResponse:0];
}

- (void)commitSession:(id)a3
{
  id v8 = a3;
  os_log_t v4 = [MEMORY[0x263EFF9A0] dictionary];
  if (v8) {
    [v4 setValue:v8 forKey:@"sessionID"];
  }
  v5 = [(DEDIDSOutbound *)self connection];
  id v6 = +[DEDIDSConnection packPayload:v4];
  id v7 = [(DEDIDSOutbound *)self deviceAddress];
  [v5 sendMessage:18 withData:v6 forIDSDeviceID:v7 isResponse:0];
}

- (void)didCommitSession:(id)a3
{
  id v8 = a3;
  os_log_t v4 = [MEMORY[0x263EFF9A0] dictionary];
  if (v8) {
    [v4 setValue:v8 forKey:@"sessionID"];
  }
  v5 = [(DEDIDSOutbound *)self connection];
  id v6 = +[DEDIDSConnection packPayload:v4];
  id v7 = [(DEDIDSOutbound *)self deviceAddress];
  [v5 sendMessage:19 withData:v6 forIDSDeviceID:v7 isResponse:0];
}

- (void)cancelSession:(id)a3
{
  id v8 = a3;
  os_log_t v4 = [MEMORY[0x263EFF9A0] dictionary];
  if (v8) {
    [v4 setValue:v8 forKey:@"sessionID"];
  }
  v5 = [(DEDIDSOutbound *)self connection];
  id v6 = +[DEDIDSConnection packPayload:v4];
  id v7 = [(DEDIDSOutbound *)self deviceAddress];
  [v5 sendMessage:20 withData:v6 forIDSDeviceID:v7 isResponse:0];
}

- (void)syncSessionStatusWithSession:(id)a3
{
  id v8 = a3;
  os_log_t v4 = [MEMORY[0x263EFF9A0] dictionary];
  if (v8) {
    [v4 setValue:v8 forKey:@"sessionID"];
  }
  v5 = [(DEDIDSOutbound *)self connection];
  id v6 = +[DEDIDSConnection packPayload:v4];
  id v7 = [(DEDIDSOutbound *)self deviceAddress];
  [v5 sendMessage:22 withData:v6 forIDSDeviceID:v7 isResponse:0];
}

- (void)didCancelSession:(id)a3
{
  id v8 = a3;
  os_log_t v4 = [MEMORY[0x263EFF9A0] dictionary];
  if (v8) {
    [v4 setValue:v8 forKey:@"sessionID"];
  }
  v5 = [(DEDIDSOutbound *)self connection];
  id v6 = +[DEDIDSConnection packPayload:v4];
  id v7 = [(DEDIDSOutbound *)self deviceAddress];
  [v5 sendMessage:21 withData:v6 forIDSDeviceID:v7 isResponse:0];
}

- (void)scheduleNotificationForSession:(id)a3
{
  id v8 = a3;
  os_log_t v4 = [MEMORY[0x263EFF9A0] dictionary];
  if (v8) {
    [v4 setValue:v8 forKey:@"sessionID"];
  }
  v5 = [(DEDIDSOutbound *)self connection];
  id v6 = +[DEDIDSConnection packPayload:v4];
  id v7 = [(DEDIDSOutbound *)self deviceAddress];
  [v5 sendMessage:26 withData:v6 forIDSDeviceID:v7 isResponse:0];
}

- (void)unscheduleNotificationForSession:(id)a3
{
  id v8 = a3;
  os_log_t v4 = [MEMORY[0x263EFF9A0] dictionary];
  if (v8) {
    [v4 setValue:v8 forKey:@"sessionID"];
  }
  v5 = [(DEDIDSOutbound *)self connection];
  id v6 = +[DEDIDSConnection packPayload:v4];
  id v7 = [(DEDIDSOutbound *)self deviceAddress];
  [v5 sendMessage:27 withData:v6 forIDSDeviceID:v7 isResponse:0];
}

- (void)loadTextDataForExtensions:(id)a3 localization:(id)a4 sessionID:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x263EFF9A0] dictionary];
  id v11 = v10;
  if (v9)
  {
    [v10 setValue:v9 forKey:@"sessionID"];
    id v12 = objc_msgSend(v16, "ded_flatMapWithBlock:", &__block_literal_global_81_0);
    [v11 setValue:v12 forKey:@"extensions"];
    [v11 setValue:v8 forKey:@"localization"];
  }
  id v13 = [(DEDIDSOutbound *)self connection];
  id v14 = +[DEDIDSConnection packPayload:v11];
  id v15 = [(DEDIDSOutbound *)self deviceAddress];
  [v13 sendMessage:31 withData:v14 forIDSDeviceID:v15 isResponse:0];
}

uint64_t __67__DEDIDSOutbound_loadTextDataForExtensions_localization_sessionID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serialize];
}

- (void)didLoadTextDataForExtensions:(id)a3 localization:(id)a4 session:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x263EFF9A0] dictionary];
  id v11 = v10;
  if (v9)
  {
    [v10 setValue:v9 forKey:@"sessionID"];
    id v12 = objc_msgSend(v16, "ded_flatMapWithBlock:", &__block_literal_global_89);
    [v11 setValue:v12 forKey:@"extensions"];
    [v11 setValue:v8 forKey:@"localization"];
  }
  id v13 = [(DEDIDSOutbound *)self connection];
  id v14 = +[DEDIDSConnection packPayload:v11];
  id v15 = [(DEDIDSOutbound *)self deviceAddress];
  [v13 sendMessage:31 withData:v14 forIDSDeviceID:v15 isResponse:1];
}

uint64_t __68__DEDIDSOutbound_didLoadTextDataForExtensions_localization_session___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serialize];
}

- (void)presentNotificationForSession:(id)a3
{
  id v8 = a3;
  os_log_t v4 = [MEMORY[0x263EFF9A0] dictionary];
  if (v8) {
    [v4 setValue:v8 forKey:@"sessionID"];
  }
  v5 = [(DEDIDSOutbound *)self connection];
  id v6 = +[DEDIDSConnection packPayload:v4];
  id v7 = [(DEDIDSOutbound *)self deviceAddress];
  [v5 sendMessage:28 withData:v6 forIDSDeviceID:v7 isResponse:0];
}

- (void)removeNotificationForSession:(id)a3
{
  id v8 = a3;
  os_log_t v4 = [MEMORY[0x263EFF9A0] dictionary];
  if (v8) {
    [v4 setValue:v8 forKey:@"sessionID"];
  }
  v5 = [(DEDIDSOutbound *)self connection];
  id v6 = +[DEDIDSConnection packPayload:v4];
  id v7 = [(DEDIDSOutbound *)self deviceAddress];
  [v5 sendMessage:29 withData:v6 forIDSDeviceID:v7 isResponse:0];
}

+ (id)archivedClasses
{
  if (archivedClasses_onceToken_5 != -1) {
    dispatch_once(&archivedClasses_onceToken_5, &__block_literal_global_92);
  }
  v2 = (void *)archivedClasses__outboundClasses_0;
  return v2;
}

void __33__DEDIDSOutbound_archivedClasses__block_invoke()
{
  v0 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, objc_opt_class(), 0);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = +[DEDExtension archivedClasses];
  [v13 unionSet:v8];

  id v9 = +[DEDAttachmentGroup archivedClasses];
  [v13 unionSet:v9];

  id v10 = +[DEDExtensionIdentifier archivedClasses];
  [v13 unionSet:v10];

  uint64_t v11 = [MEMORY[0x263EFFA08] setWithSet:v13];
  id v12 = (void *)archivedClasses__outboundClasses_0;
  archivedClasses__outboundClasses_0 = v11;
}

- (DEDIDSConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  return (DEDIDSConnection *)WeakRetained;
}

- (void)setConnection:(id)a3
{
}

- (NSString)deviceAddress
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDeviceAddress:(id)a3
{
}

- (NSString)sessionID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSessionID:(id)a3
{
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_deviceAddress, 0);
  objc_destroyWeak((id *)&self->_connection);
}

- (void)didGetState:(os_log_t)log info:sessionID:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21FE04000, log, OS_LOG_TYPE_ERROR, "Session ID is nil cannot send state update", v1, 2u);
}

@end