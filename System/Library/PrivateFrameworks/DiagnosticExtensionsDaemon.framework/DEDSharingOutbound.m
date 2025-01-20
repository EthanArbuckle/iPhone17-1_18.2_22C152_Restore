@interface DEDSharingOutbound
- (DEDSharingConnection)connection;
- (DEDSharingOutbound)initWithID:(id)a3 withSFSession:(id)a4 connection:(id)a5;
- (NSString)identifier;
- (OS_os_log)log;
- (SFSession)session;
- (id)basePayloadForCommand:(id)a3;
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
- (void)scheduleNotificationForSession:(id)a3;
- (void)setConnection:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLog:(id)a3;
- (void)setSession:(id)a3;
- (void)startDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 deferRunUntil:(id)a5 session:(id)a6;
- (void)startDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 session:(id)a5;
- (void)syncSessionStatusWithSession:(id)a3;
- (void)terminateExtension:(id)a3 info:(id)a4 session:(id)a5;
- (void)unscheduleNotificationForSession:(id)a3;
- (void)uploadProgress:(unint64_t)a3 total:(unint64_t)a4 sessionID:(id)a5;
@end

@implementation DEDSharingOutbound

- (int64_t)transportType
{
  return 3;
}

- (DEDSharingOutbound)initWithID:(id)a3 withSFSession:(id)a4 connection:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)DEDSharingOutbound;
  v11 = [(DEDSharingOutbound *)&v15 init];
  if (v11)
  {
    v12 = +[DEDConfiguration sharedInstance];
    os_log_t v13 = os_log_create((const char *)[v12 loggingSubsystem], "sharing-outbound");
    [(DEDSharingOutbound *)v11 setLog:v13];

    [(DEDSharingOutbound *)v11 setIdentifier:v8];
    [(DEDSharingOutbound *)v11 setSession:v9];
    [(DEDSharingOutbound *)v11 setConnection:v10];
  }

  return v11;
}

- (id)basePayloadForCommand:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  v6 = [v4 dictionaryWithCapacity:3];
  v7 = +[DEDDevice currentDevice];
  id v8 = [v7 serialize];
  [v6 setObject:v8 forKeyedSubscript:@"callingDevice"];

  id v9 = [(DEDSharingOutbound *)self identifier];
  [v6 setObject:v9 forKeyedSubscript:@"sessionID"];

  [v6 setObject:v5 forKeyedSubscript:@"session"];
  return v6;
}

- (void)pingSession:(id)a3
{
  id v5 = [(DEDSharingOutbound *)self session];
  v4 = [(DEDSharingOutbound *)self basePayloadForCommand:@"ping"];
  [v5 sendWithFlags:0 object:v4];
}

- (void)pongSession:(id)a3
{
  id v5 = [(DEDSharingOutbound *)self session];
  v4 = [(DEDSharingOutbound *)self basePayloadForCommand:@"pong"];
  [v5 sendWithFlags:0 object:v4];
}

- (void)listAvailableExtensionsForSession:(id)a3
{
  id v5 = [(DEDSharingOutbound *)self session];
  v4 = [(DEDSharingOutbound *)self basePayloadForCommand:@"listExtensions"];
  [v5 sendWithFlags:0 object:v4];
}

- (void)startDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 session:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v10 = [(DEDSharingOutbound *)self basePayloadForCommand:@"startDiagnostic"];
  [v10 setObject:v8 forKeyedSubscript:@"identifier"];

  [v10 setObject:v7 forKeyedSubscript:@"parameters"];
  id v9 = [(DEDSharingOutbound *)self session];
  [v9 sendWithFlags:0 object:v10];
}

- (void)startDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 deferRunUntil:(id)a5 session:(id)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v13 = [(DEDSharingOutbound *)self basePayloadForCommand:@"startDiagnostic"];
  [v13 setObject:v11 forKeyedSubscript:@"identifier"];

  [v13 setObject:v10 forKeyedSubscript:@"parameters"];
  [v13 setObject:v9 forKeyedSubscript:@"deferDate"];

  v12 = [(DEDSharingOutbound *)self session];
  [v12 sendWithFlags:0 object:v13];
}

- (void)terminateExtension:(id)a3 info:(id)a4 session:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v10 = [(DEDSharingOutbound *)self basePayloadForCommand:@"terminateExtension"];
  [v10 setObject:v8 forKeyedSubscript:@"identifier"];

  [v10 setObject:v7 forKeyedSubscript:@"info"];
  id v9 = [(DEDSharingOutbound *)self session];
  [v9 sendWithFlags:0 object:v10];
}

- (void)deviceSupportsDiagnosticExtensions:(id)a3 session:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [(DEDSharingOutbound *)self basePayloadForCommand:@"supportsExtensions"];
  id v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "serialize", (void)v15);
        [v7 addObject:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  [v6 setObject:v7 forKeyedSubscript:@"extensions"];
  v14 = [(DEDSharingOutbound *)self session];
  [v14 sendWithFlags:0 object:v6];
}

- (void)finishedDiagnosticWithIdentifier:(id)a3 result:(id)a4 session:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v11 = [(DEDSharingOutbound *)self basePayloadForCommand:@"finishedDiagnostic"];
  [v11 setObject:v8 forKeyedSubscript:@"identifier"];

  uint64_t v9 = [v7 serialize];

  [v11 setObject:v9 forKeyedSubscript:@"group"];
  uint64_t v10 = [(DEDSharingOutbound *)self session];
  [v10 sendWithFlags:0 object:v11];
}

- (void)getSessionStatusWithSession:(id)a3
{
  id v5 = [(DEDSharingOutbound *)self basePayloadForCommand:@"getStatus"];
  v4 = [(DEDSharingOutbound *)self session];
  [v4 sendWithFlags:0 object:v5];
}

- (void)getSessionStateWithSession:(id)a3
{
  id v5 = [(DEDSharingOutbound *)self basePayloadForCommand:@"getState"];
  v4 = [(DEDSharingOutbound *)self session];
  [v4 sendWithFlags:0 object:v5];
}

- (void)didGetState:(int64_t)a3 info:(id)a4 sessionID:(id)a5
{
  id v7 = a4;
  id v11 = [(DEDSharingOutbound *)self basePayloadForCommand:@"didGetState"];
  id v8 = [NSNumber numberWithInteger:a3];
  [v11 setObject:v8 forKeyedSubscript:@"state"];

  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = (id)MEMORY[0x263EFFA78];
  }
  [v11 setObject:v9 forKeyedSubscript:@"info"];

  uint64_t v10 = [(DEDSharingOutbound *)self session];
  [v10 sendWithFlags:0 object:v11];
}

- (void)syncSessionStatusWithSession:(id)a3
{
  id v5 = [(DEDSharingOutbound *)self basePayloadForCommand:@"syncStatus"];
  v4 = [(DEDSharingOutbound *)self session];
  [v4 sendWithFlags:0 object:v5];
}

- (void)hasCollected:(id)a3 isCollecting:(id)a4 inSession:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v12 = [(DEDSharingOutbound *)self basePayloadForCommand:@"didGetStatus"];
  id v9 = objc_msgSend(v7, "ded_mapWithBlock:", &__block_literal_global_32);

  [v12 setObject:v9 forKeyedSubscript:@"extensions"];
  uint64_t v10 = objc_msgSend(v8, "ded_mapWithBlock:", &__block_literal_global_83);

  [v12 setObject:v10 forKeyedSubscript:@"groups"];
  id v11 = [(DEDSharingOutbound *)self session];
  [v11 sendWithFlags:0 object:v12];
}

uint64_t __58__DEDSharingOutbound_hasCollected_isCollecting_inSession___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serialize];
}

uint64_t __58__DEDSharingOutbound_hasCollected_isCollecting_inSession___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serialize];
}

- (void)hasCollected:(id)a3 isCollecting:(id)a4 withIdentifiers:(id)a5 inSession:(id)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v16 = [(DEDSharingOutbound *)self basePayloadForCommand:@"didSyncStatus"];
  id v12 = objc_msgSend(v10, "ded_mapWithBlock:", &__block_literal_global_91);

  [v16 setObject:v12 forKeyedSubscript:@"extensions"];
  id v13 = objc_msgSend(v11, "ded_mapWithBlock:", &__block_literal_global_93);

  [v16 setObject:v13 forKeyedSubscript:@"groups"];
  v14 = objc_msgSend(v9, "ded_mapWithBlock:", &__block_literal_global_95);

  [v16 setObject:v14 forKeyedSubscript:@"identifiers"];
  long long v15 = [(DEDSharingOutbound *)self session];
  [v15 sendWithFlags:0 object:v16];
}

uint64_t __74__DEDSharingOutbound_hasCollected_isCollecting_withIdentifiers_inSession___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serialize];
}

uint64_t __74__DEDSharingOutbound_hasCollected_isCollecting_withIdentifiers_inSession___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serialize];
}

uint64_t __74__DEDSharingOutbound_hasCollected_isCollecting_withIdentifiers_inSession___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 stringValue];
}

- (void)adoptFiles:(id)a3 forSession:(id)a4
{
  id v5 = a3;
  id v7 = [(DEDSharingOutbound *)self basePayloadForCommand:@"adoptFiles"];
  [v7 setObject:v5 forKeyedSubscript:@"filesForAdopt"];

  v6 = [(DEDSharingOutbound *)self session];
  [v6 sendWithFlags:0 object:v7];
}

- (void)didAdoptFilesWithError:(id)a3 forSession:(id)a4
{
  id v7 = a3;
  id v5 = [(DEDSharingOutbound *)self basePayloadForCommand:@"didAdoptFiles"];
  if (v7) {
    [v5 setObject:v7 forKeyedSubscript:@"error"];
  }
  v6 = [(DEDSharingOutbound *)self session];
  [v6 sendWithFlags:0 object:v5];
}

- (void)uploadProgress:(unint64_t)a3 total:(unint64_t)a4 sessionID:(id)a5
{
  id v11 = [(DEDSharingOutbound *)self basePayloadForCommand:@"uploadProgress", a4, a5];
  id v8 = [NSNumber numberWithUnsignedLongLong:a3];
  [v11 setObject:v8 forKeyedSubscript:@"uploaded"];

  id v9 = [NSNumber numberWithUnsignedLongLong:a4];
  [v11 setObject:v9 forKeyedSubscript:@"total"];

  id v10 = [(DEDSharingOutbound *)self session];
  [v10 sendWithFlags:0 object:v11];
}

- (void)compressionProgress:(unint64_t)a3 total:(unint64_t)a4 sessionID:(id)a5
{
  id v11 = [(DEDSharingOutbound *)self basePayloadForCommand:@"compressionProgress", a4, a5];
  id v8 = [NSNumber numberWithUnsignedLongLong:a3];
  [v11 setObject:v8 forKeyedSubscript:@"compressed"];

  id v9 = [NSNumber numberWithUnsignedLongLong:a4];
  [v11 setObject:v9 forKeyedSubscript:@"total"];

  id v10 = [(DEDSharingOutbound *)self session];
  [v10 sendWithFlags:0 object:v11];
}

- (void)commitSession:(id)a3
{
  id v5 = [(DEDSharingOutbound *)self basePayloadForCommand:@"commitSession"];
  v4 = [(DEDSharingOutbound *)self session];
  [v4 sendWithFlags:0 object:v5];
}

- (void)didCommitSession:(id)a3
{
  id v5 = [(DEDSharingOutbound *)self basePayloadForCommand:@"didCommitSession"];
  v4 = [(DEDSharingOutbound *)self session];
  [v4 sendWithFlags:0 object:v5];
}

- (void)cancelSession:(id)a3
{
  id v5 = [(DEDSharingOutbound *)self basePayloadForCommand:@"cancelSession"];
  v4 = [(DEDSharingOutbound *)self session];
  [v4 sendWithFlags:0 object:v5];
}

- (void)scheduleNotificationForSession:(id)a3
{
  id v4 = a3;
  id v5 = [(DEDSharingOutbound *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[DEDSharingOutbound scheduleNotificationForSession:]((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }
}

- (void)unscheduleNotificationForSession:(id)a3
{
  id v4 = a3;
  id v5 = [(DEDSharingOutbound *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[DEDSharingOutbound scheduleNotificationForSession:]((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }
}

- (void)addSessionData:(id)a3 withFilename:(id)a4 forSession:(id)a5
{
  id v6 = a5;
  uint64_t v7 = [(DEDSharingOutbound *)self log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[DEDSharingOutbound addSessionData:withFilename:forSession:]((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)didCancelSession:(id)a3
{
  id v5 = [(DEDSharingOutbound *)self basePayloadForCommand:@"didCancelSession"];
  id v4 = [(DEDSharingOutbound *)self session];
  [v4 sendWithFlags:0 object:v5];
}

- (void)loadTextDataForExtensions:(id)a3 localization:(id)a4 sessionID:(id)a5
{
  id v5 = [(DEDSharingOutbound *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[DEDSharingOutbound loadTextDataForExtensions:localization:sessionID:](v5, v6, v7, v8, v9, v10, v11, v12);
  }
}

- (void)didLoadTextDataForExtensions:(id)a3 localization:(id)a4 session:(id)a5
{
  id v5 = [(DEDSharingOutbound *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[DEDSharingOutbound didLoadTextDataForExtensions:localization:session:](v5, v6, v7, v8, v9, v10, v11, v12);
  }
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (SFSession)session
{
  return (SFSession *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSession:(id)a3
{
}

- (DEDSharingConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  return (DEDSharingConnection *)WeakRetained;
}

- (void)setConnection:(id)a3
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
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)scheduleNotificationForSession:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)addSessionData:(uint64_t)a3 withFilename:(uint64_t)a4 forSession:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)loadTextDataForExtensions:(uint64_t)a3 localization:(uint64_t)a4 sessionID:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)didLoadTextDataForExtensions:(uint64_t)a3 localization:(uint64_t)a4 session:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end