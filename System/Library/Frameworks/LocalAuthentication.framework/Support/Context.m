@interface Context
+ (unsigned)newInstanceId;
+ (void)managedContextWithExternalizedContext:(id)a3 processId:(int)a4 userId:(unsigned int)a5 auditSessionId:(int)a6 reply:(id)a7;
- (BOOL)_hasProtectedOptions:(id)a3;
- (BOOL)_hasProtectedUiDelegate:(id)a3 policy:(int64_t)a4 options:(id)a5;
- (Context)initWithPlugin:(id)a3 processId:(int)a4 userId:(unsigned int)a5 auditSessionId:(int)a6 externalizedContext:(id)a7;
- (ContextPlugin)plugin;
- (NSData)externalizedContext;
- (NSString)description;
- (NSUUID)uuid;
- (OS_os_transaction)transaction;
- (id)_updateOptionsWithServerProperties:(id)a3 policy:(int64_t)a4;
- (id)updateOptionsWithServerProperties:(id)a3;
- (int)auditSessionId;
- (int)processId;
- (unsigned)instanceId;
- (unsigned)userId;
- (void)_registerAcmHashInDaemon:(unint64_t)a3 completion:(id)a4;
- (void)allowTransferFromCaller:(id)a3 receiverAuditTokenData:(id)a4 reply:(id)a5;
- (void)authMethodWithReply:(id)a3;
- (void)checkCredentialSatisfied:(int64_t)a3 policy:(int64_t)a4 reply:(id)a5;
- (void)connectFromCaller:(id)a3 token:(id)a4 senderAuditTokenData:(id)a5 reply:(id)a6;
- (void)contextWasExternalized:(id)a3;
- (void)credentialOfType:(int64_t)a3 originator:(id)a4 reply:(id)a5;
- (void)dealloc;
- (void)evaluateRequest:(id)a3 uiDelegate:(id)a4 originator:(id)a5 reply:(id)a6;
- (void)externalizedContextWithReply:(id)a3;
- (void)failProcessedEvent:(int64_t)a3 failureError:(id)a4 reply:(id)a5;
- (void)forciblyInvalidate;
- (void)isCredentialSet:(int64_t)a3 originator:(id)a4 reply:(id)a5;
- (void)optionsForInternalOperation:(int64_t)a3 originator:(id)a4 reply:(id)a5;
- (void)pauseProcessedEvent:(int64_t)a3 pause:(BOOL)a4 reply:(id)a5;
- (void)resetEvent:(int64_t)a3 originator:(id)a4 reply:(id)a5;
- (void)retryEvent:(int64_t)a3 originator:(id)a4 reply:(id)a5;
- (void)serverPropertyForOption:(int64_t)a3 reply:(id)a4;
- (void)setCredential:(id)a3 forProcessedEvent:(int64_t)a4 credentialType:(int64_t)a5 reply:(id)a6;
- (void)setCredential:(id)a3 type:(int64_t)a4 options:(id)a5 originator:(id)a6 reply:(id)a7;
- (void)setOptions:(id)a3 forInternalOperation:(int64_t)a4 originator:(id)a5 reply:(id)a6;
- (void)setServerPropertyForOption:(int64_t)a3 value:(id)a4 reply:(id)a5;
- (void)setShowingCoachingHint:(BOOL)a3 event:(int64_t)a4 originator:(id)a5 reply:(id)a6;
- (void)tokenForTransferFromCaller:(id)a3 reply:(id)a4;
- (void)verifyFileVaultUser:(id)a3 volumeUuid:(id)a4 options:(unint64_t)a5 reply:(id)a6;
@end

@implementation Context

- (void)contextWasExternalized:(id)a3
{
  id v4 = a3;
  id v5 = +[ContextManager sharedInstance];
  [v5 registerExternalizedContext:v4 forContext:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_plugin, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_allowedTransfers, 0);

  objc_storeStrong((id *)&self->_serverProperties, 0);
}

+ (void)managedContextWithExternalizedContext:(id)a3 processId:(int)a4 userId:(unsigned int)a5 auditSessionId:(int)a6 reply:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  v13 = +[ContextManager sharedInstance];
  id v22 = 0;
  v14 = [v13 loadModule:1 error:&v22];
  id v15 = v22;

  if (v14)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000040A4;
    v16[3] = &unk_1000391F8;
    id v18 = v12;
    int v19 = a4;
    unsigned int v20 = a5;
    int v21 = a6;
    id v17 = v11;
    [v14 contextPluginWithExternalizedContext:v17 reply:v16];
  }
  else
  {
    (*((void (**)(id, void, id))v12 + 2))(v12, 0, v15);
  }
}

- (void)dealloc
{
  v3 = LALogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocated", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)Context;
  [(Context *)&v4 dealloc];
}

- (Context)initWithPlugin:(id)a3 processId:(int)a4 userId:(unsigned int)a5 auditSessionId:(int)a6 externalizedContext:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  id v12 = a3;
  v28.receiver = self;
  v28.super_class = (Class)Context;
  v13 = [(Context *)&v28 init];
  if (v13)
  {
    uint64_t v14 = objc_opt_new();
    serverProperties = v13->_serverProperties;
    v13->_serverProperties = (NSMutableDictionary *)v14;

    uint64_t v16 = objc_opt_new();
    allowedTransfers = v13->_allowedTransfers;
    v13->_allowedTransfers = (NSMutableArray *)v16;

    objc_storeStrong((id *)&v13->_plugin, a3);
    id v18 = [(ContextPlugin *)v13->_plugin cachedExternalizedContext];
    [v18 setExternalizationObserver:v13];

    v13->_userId = a5;
    v13->_auditSessionId = a6;
    uint64_t v19 = objc_opt_new();
    uuid = v13->_uuid;
    v13->_uuid = (NSUUID *)v19;

    v13->_instanceId = +[Context newInstanceId];
    int v21 = +[NSDate date];
    id v22 = +[NSDateFormatter localizedStringFromDate:v21 dateStyle:1 timeStyle:3];
    id v23 = +[NSString stringWithFormat:@"com.apple.LocalAuthentication.LAContext (%@ initially acquired by %d at %@)", v13, v9, v22];
    [v23 UTF8String];
    uint64_t v24 = os_transaction_create();
    transaction = v13->_transaction;
    v13->_transaction = (OS_os_transaction *)v24;
  }
  v26 = LALogForCategory();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v30 = v13;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ created", buf, 0xCu);
  }

  return v13;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (id)updateOptionsWithServerProperties:(id)a3
{
  return [(Context *)self _updateOptionsWithServerProperties:a3 policy:0];
}

- (NSData)externalizedContext
{
  v2 = [(ContextPlugin *)self->_plugin cachedExternalizedContext];
  v3 = [v2 externalizedContext];

  return (NSData *)v3;
}

- (void)evaluateRequest:(id)a3 uiDelegate:(id)a4 originator:(id)a5 reply:(id)a6
{
  id v20 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void, void *))a6;
  id v13 = [v20 policy];
  uint64_t v14 = [v20 options];
  id v15 = [(Context *)self _updateOptionsWithServerProperties:v14 policy:v13];
  [v20 updateOptions:v15];
  if ((-[Context _hasProtectedUiDelegate:policy:options:](self, "_hasProtectedUiDelegate:policy:options:", v10, v13, v15)|| -[Context _hasProtectedOptions:](self, "_hasProtectedOptions:", v15))&& ([v11 checkEntitlement:@"com.apple.private.CoreAuthentication.SPI"] & 1) == 0)
  {
    CFStringRef v17 = @"com.apple.private.CoreAuthentication.SPI";
  }
  else if (v13 == (id)1010 {
         && ([v11 checkEntitlement:@"com.apple.private.LocalAuthentication.SoftwareUpdate"] & 1) == 0)
  }
  {
    CFStringRef v17 = @"com.apple.private.LocalAuthentication.SoftwareUpdate";
  }
  else
  {
    uint64_t v16 = [v15 objectForKeyedSubscript:&off_10003A228];
    if (!v16
      || [v11 checkEntitlement:@"com.apple.private.LocalAuthentication.ExtractCredential"])
    {

LABEL_12:
      [(ContextPlugin *)self->_plugin evaluateRequest:v20 uiDelegate:v10 originator:v11 reply:v12];
      goto LABEL_15;
    }
    id v18 = [v20 acl];

    if (v18) {
      goto LABEL_12;
    }
    CFStringRef v17 = @"com.apple.private.LocalAuthentication.ExtractCredential";
  }
  uint64_t v19 = +[LAErrorHelper missingEntitlementError:v17];
  v12[2](v12, 0, v19);

LABEL_15:
}

- (id)_updateOptionsWithServerProperties:(id)a3 policy:(int64_t)a4
{
  id v5 = a3;
  v6 = +[NSMutableDictionary dictionaryWithDictionary:v5];
  id v7 = [(NSMutableDictionary *)self->_serverProperties copy];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100014684;
  v12[3] = &unk_100039220;
  id v13 = v5;
  id v8 = v6;
  id v14 = v8;
  id v15 = self;
  id v9 = v5;
  [v7 enumerateKeysAndObjectsUsingBlock:v12];

  id v10 = v8;
  return v10;
}

- (BOOL)_hasProtectedUiDelegate:(id)a3 policy:(int64_t)a4 options:(id)a5
{
  return a3 != 0;
}

- (BOOL)_hasProtectedOptions:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[NSMutableSet setWithObjects:](NSMutableSet, "setWithObjects:", &off_10003A1B0, &off_10003A1C8, &off_10003A1E0, &off_10003A1F8, &off_10003A210, 0);
  id v5 = [v3 allKeys];

  v6 = +[NSSet setWithArray:v5];

  [v4 intersectSet:v6];
  BOOL v7 = [v4 count] != 0;

  return v7;
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"Context[%u:%u]", [(Context *)self instanceId], [(ContextPlugin *)self->_plugin instanceId]];
}

- (unsigned)instanceId
{
  return self->_instanceId;
}

- (ContextPlugin)plugin
{
  return self->_plugin;
}

- (void)_registerAcmHashInDaemon:(unint64_t)a3 completion:(id)a4
{
}

+ (unsigned)newInstanceId
{
  return ++dword_100046E90;
}

- (void)verifyFileVaultUser:(id)a3 volumeUuid:(id)a4 options:(unint64_t)a5 reply:(id)a6
{
}

- (void)setCredential:(id)a3 forProcessedEvent:(int64_t)a4 credentialType:(int64_t)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = +[AuthenticationManager sharedInstance];
  id v13 = [(Context *)self plugin];
  id v14 = [v12 findMechanismForEvent:a4 mustBeRunning:1 plugin:v13];

  if (v14)
  {
    if (v10)
    {
      [v14 setCredential:v10 credentialType:a5 reply:v11];
    }
    else
    {
      plugin = self->_plugin;
      id v19 = [v14 policy];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000144EC;
      v20[3] = &unk_100038EC8;
      id v21 = v14;
      id v22 = v11;
      [(ContextPlugin *)plugin checkCredentialSatisfied:a5 policy:v19 reply:v20];
    }
  }
  else if (v10)
  {
    id v15 = +[NSNumber numberWithInteger:a4];
    uint64_t v16 = +[NSString stringWithFormat:@"No running mechanism for event %@.", v15];
    CFStringRef v17 = +[LAErrorHelper errorWithCode:-1008 message:v16];
    (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v17);
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v11 + 2))(v11, 1, 0);
  }
}

- (void)isCredentialSet:(int64_t)a3 originator:(id)a4 reply:(id)a5
{
}

- (void)setCredential:(id)a3 type:(int64_t)a4 options:(id)a5 originator:(id)a6 reply:(id)a7
{
  plugin = self->_plugin;
  id v13 = a7;
  id v14 = a6;
  id v15 = a3;
  id v16 = [(Context *)self updateOptionsWithServerProperties:a5];
  [(ContextPlugin *)plugin setCredential:v15 type:a4 options:v16 originator:v14 reply:v13];
}

- (void)credentialOfType:(int64_t)a3 originator:(id)a4 reply:(id)a5
{
}

- (void)checkCredentialSatisfied:(int64_t)a3 policy:(int64_t)a4 reply:(id)a5
{
}

- (void)optionsForInternalOperation:(int64_t)a3 originator:(id)a4 reply:(id)a5
{
}

- (void)setOptions:(id)a3 forInternalOperation:(int64_t)a4 originator:(id)a5 reply:(id)a6
{
}

- (void)serverPropertyForOption:(int64_t)a3 reply:(id)a4
{
  v6 = (void (**)(id, void *, void))a4;
  BOOL v7 = sub_100007340();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109378;
    v11[1] = a3;
    __int16 v12 = 2114;
    id v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "querying option %d on %{public}@", (uint8_t *)v11, 0x12u);
  }

  serverProperties = self->_serverProperties;
  id v9 = +[NSNumber numberWithInteger:a3];
  id v10 = [(NSMutableDictionary *)serverProperties objectForKeyedSubscript:v9];

  v6[2](v6, v10, 0);
}

- (void)setServerPropertyForOption:(int64_t)a3 value:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t, void))a5;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v11 = sub_100007340();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (isKindOfClass)
  {
    if (v12)
    {
      LODWORD(v17) = 67109634;
      HIDWORD(v17) = a3;
      *(_WORD *)id v18 = 2114;
      *(void *)&v18[2] = self;
      *(_WORD *)&v18[10] = 2114;
      *(void *)&v18[12] = v8;
      id v13 = "setting option %d on %{public}@ to %{public}@";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v17, 0x1Cu);
    }
  }
  else if (v12)
  {
    LODWORD(v17) = 67109634;
    HIDWORD(v17) = a3;
    *(_WORD *)id v18 = 2114;
    *(void *)&v18[2] = self;
    *(_WORD *)&v18[10] = 2112;
    *(void *)&v18[12] = v8;
    id v13 = "setting option %d on %{public}@ to %@";
    goto LABEL_6;
  }

  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    serverProperties = self->_serverProperties;
    id v15 = +[NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)serverProperties setObject:v8 forKey:v15];
  }
  else
  {
    id v14 = self->_serverProperties;
    id v15 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3, v17, *(_OWORD *)v18, *(void *)&v18[16]);
    [(NSMutableDictionary *)v14 removeObjectForKey:v15];
  }

  v9[2](v9, 1, 0);
}

- (void)failProcessedEvent:(int64_t)a3 failureError:(id)a4 reply:(id)a5
{
  id v16 = a4;
  id v8 = (void (**)(id, void, void *))a5;
  id v9 = +[AuthenticationManager sharedInstance];
  id v10 = [(Context *)self plugin];
  id v11 = [v9 findMechanismForEvent:a3 mustBeRunning:0 plugin:v10];

  if (([v11 isRunning] & 1) == 0 && !objc_msgSend(v11, "isRestartable"))
  {
    id v14 = +[LAErrorHelper errorWithCode:-1008 message:@"Can't stop event, because its mechanism is not running."];
    v8[2](v8, 0, v14);

    goto LABEL_13;
  }
  if ([v11 eventIdentifier] != (id)7) {
    goto LABEL_9;
  }
  BOOL v12 = [v11 request];
  if (([v12 isPurposeApplePay] & 1) == 0)
  {

LABEL_9:
    if (v16)
    {
      objc_msgSend(v11, "finishRunWithResult:error:", 0);
    }
    else
    {
      id v15 = +[LAErrorHelper errorWithCode:-1 message:@"Mechanism stopped on client request."];
      [v11 finishRunWithResult:0 error:v15];
    }
    goto LABEL_12;
  }
  unsigned int v13 = [v11 fallbackToIdentifier:2];

  if (!v13) {
    goto LABEL_9;
  }
LABEL_12:
  v8[2](v8, 1, 0);
LABEL_13:
}

- (void)resetEvent:(int64_t)a3 originator:(id)a4 reply:(id)a5
{
}

- (void)retryEvent:(int64_t)a3 originator:(id)a4 reply:(id)a5
{
  BOOL v7 = (void (**)(id, uint64_t, void))a5;
  id v8 = +[AuthenticationManager sharedInstance];
  id v9 = [(Context *)self plugin];
  id v11 = [v8 findMechanismForEvent:a3 mustBeRunning:1 plugin:v9];

  if (v11)
  {
    [v11 restartWithEventIdentifier:a3 lastAttempt:0];
    v7[2](v7, 1, 0);
  }
  else
  {
    uint64_t v10 = +[LAErrorHelper errorWithCode:-1008 message:@"Can't retry event, because no suitable mechanism is running."];
    v7[2](v7, 0, v10);

    BOOL v7 = (void (**)(id, uint64_t, void))v10;
  }
}

- (void)pauseProcessedEvent:(int64_t)a3 pause:(BOOL)a4 reply:(id)a5
{
  BOOL v5 = a4;
  id v8 = (void (**)(id, id, id))a5;
  id v9 = +[AuthenticationManager sharedInstance];
  uint64_t v10 = [(Context *)self plugin];
  id v11 = [v9 findMechanismForEvent:a3 mustBeRunning:1 plugin:v10];

  if (v11)
  {
    id v15 = 0;
    id v12 = [v11 pause:v5 forEvent:a3 error:&v15];
    id v13 = v15;
    v8[2](v8, v12, v13);
  }
  else
  {
    id v14 = +[LAErrorHelper errorWithCode:-1008 message:@"Can't toggle event because no suitable mechanism is running."];
    v8[2](v8, 0, v14);
  }
}

- (void)setShowingCoachingHint:(BOOL)a3 event:(int64_t)a4 originator:(id)a5 reply:(id)a6
{
  BOOL v7 = a3;
  id v13 = (void (**)(id, void, void *))a6;
  id v9 = +[AuthenticationManager sharedInstance];
  uint64_t v10 = [(Context *)self plugin];
  id v11 = [v9 findMechanismForEvent:a4 mustBeRunning:1 plugin:v10];

  if (v11)
  {
    [v11 setShowingCoachingHint:v7 reply:v13];
  }
  else
  {
    id v12 = +[LAErrorHelper errorWithCode:-1008 message:@"Can't set coaching, because no suitable mechanism is running."];
    v13[2](v13, 0, v12);
  }
}

- (void)externalizedContextWithReply:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ContextPlugin *)self->_plugin cachedExternalizedContext];

  if (v5)
  {
    v6 = [(ContextPlugin *)self->_plugin cachedExternalizedContext];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100015000;
    v8[3] = &unk_100039248;
    id v9 = v4;
    [v6 externalizedContextWithReply:v8];
  }
  else
  {
    BOOL v7 = +[LAErrorHelper internalErrorWithMessage:@"No externalized context"];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v7);
  }
}

- (void)forciblyInvalidate
{
}

- (void)authMethodWithReply:(id)a3
{
}

- (void)allowTransferFromCaller:(id)a3 receiverAuditTokenData:(id)a4 reply:(id)a5
{
  p_allowedTransfers = &self->_allowedTransfers;
  allowedTransfers = self->_allowedTransfers;
  id v9 = (void (**)(id, uint64_t, void))a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [[AllowedTransfer alloc] initWithReceiverAuditTokenData:v10 sender:v11];

  [(NSMutableArray *)allowedTransfers addObject:v12];
  id v13 = sub_100007340();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_100027B30((uint64_t)p_allowedTransfers, v13, v14, v15, v16, v17, v18, v19);
  }

  v9[2](v9, 1, 0);
}

- (void)tokenForTransferFromCaller:(id)a3 reply:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void, uint64_t))a4;
  uint64_t v8 = SecRandomCopyBytes(kSecRandomDefault, 0x20uLL, bytes);
  if (v8)
  {
    id v9 = +[NSString stringWithFormat:@"Failed generating token: %x (err: %d)", v8, *__error()];
    uint64_t v10 = +[LAErrorHelper internalErrorWithMessage:v9];
    v7[2](v7, 0, v10);

    BOOL v7 = (void (**)(id, void, uint64_t))v10;
  }
  else
  {
    id v9 = +[NSData dataWithBytes:bytes length:32];
    allowedTransfers = self->_allowedTransfers;
    p_allowedTransfers = &self->_allowedTransfers;
    id v13 = [[AllowedTransfer alloc] initWithServerToken:v9 sender:v6];
    [(NSMutableArray *)allowedTransfers addObject:v13];

    uint64_t v14 = sub_100007340();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_100027B30((uint64_t)p_allowedTransfers, v14, v15, v16, v17, v18, v19, v20);
    }

    ((void (**)(id, void *, uint64_t))v7)[2](v7, v9, 0);
  }
}

- (void)connectFromCaller:(id)a3 token:(id)a4 senderAuditTokenData:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, void *))a6;
  uint64_t v14 = sub_100007340();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)v46 = self;
    *(_WORD *)&v46[8] = 1024;
    *(_DWORD *)v47 = [v10 pid];
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "connecting to %{public}@ from %d", buf, 0x12u);
  }

  uint64_t v15 = sub_100007340();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v34 = [v12 hash];
    v35 = [v10 auditTokenData];
    unsigned int v36 = [v35 hash];
    unsigned int v37 = [v11 hash];
    allowedTransfers = self->_allowedTransfers;
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v46 = v34;
    *(_WORD *)&v46[4] = 1024;
    *(_DWORD *)&v46[6] = v36;
    *(_WORD *)v47 = 1024;
    *(_DWORD *)&v47[2] = v37;
    __int16 v48 = 2112;
    v49 = allowedTransfers;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "checking access for SAT: %x, RAT: %x, ST: %x against: %@", buf, 0x1Eu);
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v17 = self->_allowedTransfers;
  p_allowedTransfers = &self->_allowedTransfers;
  uint64_t v18 = v17;
  id v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (!v19)
  {

LABEL_19:
    id v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"PID %d is not allowed to connect to this context.", [v10 pid]);
    v33 = +[LAErrorHelper errorWithCode:-1007 message:v21];
    v13[2](v13, 0, v33);

    goto LABEL_20;
  }
  id v20 = v19;
  v39 = v13;
  id v21 = 0;
  uint64_t v22 = *(void *)v41;
  do
  {
    for (i = 0; i != v20; i = (char *)i + 1)
    {
      if (*(void *)v41 != v22) {
        objc_enumerationMutation(v18);
      }
      uint64_t v24 = *(void **)(*((void *)&v40 + 1) + 8 * i);
      if ([v24 isReceiver:v10 allowedToConnectWithServerToken:v11 senderAuditTokenData:v12])
      {
        id v25 = v24;

        id v21 = v25;
      }
    }
    id v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v40 objects:v44 count:16];
  }
  while (v20);

  id v13 = v39;
  if (!v21) {
    goto LABEL_19;
  }
  [(NSMutableArray *)*p_allowedTransfers removeObject:v21];
  v26 = sub_100007340();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    sub_100027BA0((uint64_t)p_allowedTransfers, v26, v27, v28, v29, v30, v31, v32);
  }

  v39[2](v39, 1, 0);
LABEL_20:
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (int)processId
{
  return self->_processId;
}

- (unsigned)userId
{
  return self->_userId;
}

- (int)auditSessionId
{
  return self->_auditSessionId;
}

@end