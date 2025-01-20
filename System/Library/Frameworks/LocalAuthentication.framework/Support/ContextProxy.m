@interface ContextProxy
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)_isPreflightOnCleanContext:(id)a3;
- (BOOL)cApiOrigin;
- (BOOL)checkEntitlement:(id)a3;
- (Context)managedContext;
- (ContextProxy)initWithContext:(id)a3 processId:(int)a4 userId:(unsigned int)a5 auditSessionId:(int)a6 auditToken:(id *)a7 cApiOrigin:(BOOL)a8 checkEntitlementBlock:(id)a9 invalidationBlock:(id)a10 callback:(id)a11 clientId:(unint64_t)a12;
- (LAContextCallbackXPC)callback;
- (NSString)description;
- (NSString)proxyId;
- (int)auditSessionId;
- (int)processId;
- (unint64_t)originatorId;
- (unsigned)userId;
- (void)_evaluateRequest:(id)a3 originator:(id)a4 preflightKey:(id)a5 uiDelegate:(id)a6 reply:(id)a7;
- (void)allowTransferToProcess:(int)a3 receiverAuditTokenData:(id)a4 reply:(id)a5;
- (void)authMethodWithReply:(id)a3;
- (void)credentialOfType:(int64_t)a3 reply:(id)a4;
- (void)dealloc;
- (void)evaluateACL:(id)a3 cfOperation:(void *)a4 options:(id)a5 uiDelegate:(id)a6 reply:(id)a7;
- (void)evaluateACL:(id)a3 operation:(id)a4 options:(id)a5 uiDelegate:(id)a6 originator:(id)a7 reply:(id)a8;
- (void)evaluateACL:(id)a3 operation:(id)a4 options:(id)a5 uiDelegate:(id)a6 reply:(id)a7;
- (void)evaluatePolicy:(int64_t)a3 options:(id)a4 uiDelegate:(id)a5 originator:(id)a6 reply:(id)a7;
- (void)evaluatePolicy:(int64_t)a3 options:(id)a4 uiDelegate:(id)a5 reply:(id)a6;
- (void)externalizedContextWithReply:(id)a3;
- (void)failProcessedEvent:(int64_t)a3 failureError:(id)a4 reply:(id)a5;
- (void)getDomainStateWithOptions:(id)a3 originator:(id)a4 reply:(id)a5;
- (void)getDomainStateWithOptions:(id)a3 reply:(id)a4;
- (void)interruptWithReply:(id)a3;
- (void)invalidateWithError:(id)a3;
- (void)invalidateWithReply:(id)a3;
- (void)isCredentialSet:(int64_t)a3 reply:(id)a4;
- (void)optionsForInternalOperation:(int64_t)a3 reply:(id)a4;
- (void)pauseProcessedEvent:(int64_t)a3 pause:(BOOL)a4 reply:(id)a5;
- (void)resetProcessedEvent:(int64_t)a3 reply:(id)a4;
- (void)retryProcessedEvent:(int64_t)a3 reply:(id)a4;
- (void)serverPropertyForOption:(int64_t)a3 reply:(id)a4;
- (void)setCredential:(id)a3 forProcessedEvent:(int64_t)a4 credentialType:(int64_t)a5 reply:(id)a6;
- (void)setCredential:(id)a3 type:(int64_t)a4 reply:(id)a5;
- (void)setOptions:(id)a3 forInternalOperation:(int64_t)a4 reply:(id)a5;
- (void)setServerPropertyForOption:(int64_t)a3 value:(id)a4 reply:(id)a5;
- (void)setShowingCoachingHint:(BOOL)a3 event:(int64_t)a4 reply:(id)a5;
- (void)tokenForTransferToUnknownProcess:(id)a3;
- (void)verifyFileVaultUser:(id)a3 volumeUuid:(id)a4 options:(unint64_t)a5 reply:(id)a6;
@end

@implementation ContextProxy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyId, 0);
  objc_storeStrong((id *)&self->_managedContext, 0);
  objc_storeStrong((id *)&self->_callback, 0);
  objc_storeStrong(&self->_checkEntitlementBlock, 0);

  objc_storeStrong(&self->_invalidationBlock, 0);
}

- (BOOL)_isPreflightOnCleanContext:(id)a3
{
  v4 = [self->_managedContext updateOptionsWithServerProperties:a3];
  v5 = [v4 objectForKeyedSubscript:&off_10003A180];
  unsigned int v6 = [v5 BOOLValue];

  if (v6
    && ([self->_managedContext plugin],
        v7 = objc_claimAutoreleasedReturnValue(),
        [v7 resultInfo],
        v8 = objc_claimAutoreleasedReturnValue(),
        id v9 = [v8 count],
        v8,
        v7,
        !v9)
    && os_variant_allows_internal_security_policies())
  {
    v10 = +[NSUserDefaults standardUserDefaults];
    v11 = [v10 persistentDomainForName:NSGlobalDomain];

    v12 = [v11 objectForKeyedSubscript:@"LA.preflightCache.enabled"];
    v13 = v12;
    if (!v12) {
      v12 = &__kCFBooleanFalse;
    }
    unsigned __int8 v14 = [v12 BOOLValue];
  }
  else
  {
    unsigned __int8 v14 = 0;
  }

  return v14;
}

- (void)dealloc
{
  v3 = LALogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    unsigned int v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocated", buf, 0xCu);
  }

  [(ContextProxy *)self interruptWithReply:0];
  v4.receiver = self;
  v4.super_class = (Class)ContextProxy;
  [(ContextProxy *)&v4 dealloc];
}

- (void)interruptWithReply:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ContextProxy *)self originatorId];
  unsigned int v6 = [(ContextProxy *)self description];
  v7 = [self->_managedContext uuid];
  v8 = +[DaemonUtils sharedInstance];
  id v9 = [v8 serverQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000671C;
  v13[3] = &unk_100038DD8;
  id v16 = v4;
  unint64_t v17 = v5;
  id v14 = v6;
  id v15 = v7;
  id v10 = v7;
  id v11 = v4;
  id v12 = v6;
  dispatch_async(v9, v13);
}

- (unint64_t)originatorId
{
  return self->_originatorId;
}

- (void)evaluatePolicy:(int64_t)a3 options:(id)a4 uiDelegate:(id)a5 originator:(id)a6 reply:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v12) {
    id v16 = v12;
  }
  else {
    id v16 = &__NSDictionary0__struct;
  }
  unint64_t v17 = [self->_managedContext updateOptionsWithServerProperties:v16];
  id v18 = objc_alloc((Class)EvaluationRequest);
  v19 = [self->_managedContext uuid];
  int64_t v31 = a3;
  id v20 = [v18 initWithPolicy:a3 options:v17 uiDelegate:v13 contextID:v19];

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100005BCC;
  v37[3] = &unk_100038E28;
  id v21 = v20;
  id v38 = v21;
  id v22 = v15;
  id v39 = v22;
  v23 = objc_retainBlock(v37);
  if ([(ContextProxy *)self _isPreflightOnCleanContext:v12])
  {
    v30 = v23;
    v24 = +[PreflightCache sharedInstance];
    if (v14) {
      [v14 auditToken];
    }
    else {
      memset(v36, 0, sizeof(v36));
    }
    objc_msgSend(v24, "keyForPreflightOfPolicy:options:auditToken:uid:", v31, v16, v36, objc_msgSend(v14, "userId"));
    id v25 = (id)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v26 = +[PreflightCache sharedInstance];
      v27 = [v26 cachedPreflightResultForKey:v25];

      if (v27)
      {
        v23 = v30;
        ((void (*)(void *, void, void *))v30[2])(v30, 0, v27);
        goto LABEL_16;
      }
    }
    v23 = v30;
  }
  else
  {
    id v25 = 0;
  }
  v28 = [v21 log];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v29 = [v21 identifier];
    *(_DWORD *)buf = 67110146;
    int v41 = v31;
    __int16 v42 = 2114;
    id v43 = v12;
    __int16 v44 = 1024;
    BOOL v45 = v13 != 0;
    __int16 v46 = 2114;
    v47 = self;
    __int16 v48 = 1024;
    unsigned int v49 = v29;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "evaluatePolicy:%d options:%{public}@, uiDelegate:%d on %{public}@ rid:%u", buf, 0x28u);
  }

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100005A9C;
  v32[3] = &unk_100038E50;
  id v33 = v21;
  id v25 = v25;
  id v34 = v25;
  v35 = v23;
  [(ContextProxy *)self _evaluateRequest:v33 originator:v14 preflightKey:v25 uiDelegate:v13 reply:v32];

  v27 = v33;
LABEL_16:
}

- (void)_evaluateRequest:(id)a3 originator:(id)a4 preflightKey:(id)a5 uiDelegate:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v35 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = +[DaemonServiceLocator sharedInstance];
  [v12 setServiceLocator:v16];

  [v12 setClient:v13];
  unint64_t v17 = [self->_managedContext externalizedContext];
  [v12 setExternalizedContext:v17];

  id v18 = objc_opt_new();
  v19 = +[DaemonServiceLocator sharedInstance];
  id v20 = [v19 sharedMode];
  id v21 = [v20 processor];
  [v18 addObject:v21];

  id v22 = [v12 acl];

  if (!v22)
  {
    v23 = +[DaemonServiceLocator sharedInstance];
    v24 = [v23 dto];
    id v25 = [v24 processor];
    [v18 addObject:v25];
  }
  v26 = +[DaemonServiceLocator sharedInstance];
  v27 = [v26 oneness];
  [v18 addObject:v27];

  v28 = [[EvaluationRequestProcessor alloc] initWithContext:self->_managedContext uiDelegate:v14];
  [v18 addObject:v28];

  unsigned int v29 = +[LACEvaluationRequestProcessorFactory makeProcessorWithSubprocessors:v18];
  objc_initWeak(&location, self);
  v30 = +[LACProcessingConfiguration defaultConfiguration];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  _OWORD v36[2] = sub_1000056C0;
  v36[3] = &unk_100038EA0;
  objc_copyWeak(&v41, &location);
  id v31 = v12;
  id v37 = v31;
  id v32 = v15;
  id v40 = v32;
  id v33 = v29;
  id v38 = v33;
  id v34 = v14;
  id v39 = v34;
  [v33 processRequest:v31 configuration:v30 completion:v36];

  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);
}

- (ContextProxy)initWithContext:(id)a3 processId:(int)a4 userId:(unsigned int)a5 auditSessionId:(int)a6 auditToken:(id *)a7 cApiOrigin:(BOOL)a8 checkEntitlementBlock:(id)a9 invalidationBlock:(id)a10 callback:(id)a11 clientId:(unint64_t)a12
{
  id v17 = a3;
  id v18 = a9;
  id v19 = a10;
  id v37 = a11;
  v40.receiver = self;
  v40.super_class = (Class)ContextProxy;
  id v20 = [(ContextProxy *)&v40 init];
  id v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_managedContext, a3);
    v21->_processId = a4;
    v21->_userId = a5;
    v21->_auditSessionId = a6;
    long long v22 = *(_OWORD *)&a7->var0[4];
    *(_OWORD *)v21->_auditToken.val = *(_OWORD *)a7->var0;
    *(_OWORD *)&v21->_auditToken.val[4] = v22;
    v21->_cApiOrigin = a8;
    id v23 = objc_retainBlock(v18);
    id checkEntitlementBlock = v21->_checkEntitlementBlock;
    v21->_id checkEntitlementBlock = v23;

    id v25 = objc_retainBlock(v19);
    id invalidationBlock = v21->_invalidationBlock;
    v21->_id invalidationBlock = v25;

    objc_storeStrong((id *)&v21->_callback, a11);
    v21->_originatorId = atomic_fetch_add(&qword_100046E48, 1uLL) + 1;
    id v27 = [v17 instanceId];
    v28 = [v17 plugin];
    uint64_t v29 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%u:%u", v27, [v28 instanceId]);
    proxyId = v21->_proxyId;
    v21->_proxyId = (NSString *)v29;

    v21->_clientId = a12;
  }
  id v31 = [v17 plugin];
  id v32 = [v31 module];
  id v33 = [v17 plugin];
  id v34 = [(ContextProxy *)v21 managedContext];
  [v32 trackPlugin:v33 processId:a4 proxy:v21 context:v34 invalidationBlock:v19];

  id v35 = LALogForCategory();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    __int16 v42 = v21;
    __int16 v43 = 2114;
    id v44 = v17;
    __int16 v45 = 1024;
    unsigned int v46 = a5;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ created for %{public}@ uid:%d", buf, 0x1Cu);
  }

  return v21;
}

- (NSString)description
{
  uint64_t v3 = [(ContextProxy *)self processId];
  uint64_t clientId = self->_clientId;
  uint64_t v5 = [self->_managedContext instanceId];
  unsigned int v6 = [self->_managedContext plugin];
  v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"ContextProxy[%u:%u:%u:%u]", v3, clientId, v5, [v6 instanceId]);

  return (NSString *)v7;
}

- (int)processId
{
  return self->_processId;
}

- (unsigned)userId
{
  return self->_userId;
}

- (void)evaluatePolicy:(int64_t)a3 options:(id)a4 uiDelegate:(id)a5 reply:(id)a6
{
}

- (BOOL)checkEntitlement:(id)a3
{
  return (*((uint64_t (**)(void))self->_checkEntitlementBlock + 2))();
}

- (BOOL)cApiOrigin
{
  return self->_cApiOrigin;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  long long v3 = *(_OWORD *)self[3].var0;
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[2].var0[4];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (NSString)proxyId
{
  return self->_proxyId;
}

- (Context)managedContext
{
  return self->_managedContext;
}

- (void)getDomainStateWithOptions:(id)a3 originator:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  managedContext = self->_managedContext;
  if (v8) {
    id v11 = v8;
  }
  else {
    id v11 = &__NSDictionary0__struct;
  }
  id v12 = a4;
  id v13 = [managedContext updateOptionsWithServerProperties:v11];
  id v14 = objc_alloc((Class)DomainStateRequest);
  id v15 = [self->_managedContext uuid];
  id v16 = [v14 initWithOptions:v13 client:v12 contextID:v15];

  id v17 = objc_opt_new();
  id v18 = +[LACDomainStateProviderBiometry sharedInstance];
  [v17 addObject:v18];

  id v19 = +[DaemonServiceLocator sharedInstance];
  id v20 = [v19 oneness];
  [v17 addObject:v20];

  id v21 = [objc_alloc((Class)LACDomainStateProvider) initWithProviders:v17];
  LALogCategoryForOptions();
  long long v22 = LALogForCategory();
  id v23 = objc_opt_new();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v34 = v17;
    __int16 v35 = 2114;
    id v36 = v8;
    __int16 v37 = 2114;
    id v38 = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Requesting domain state with providers: %{public}@ options: %{public}@ uuid: %{public}@", buf, 0x20u);
  }
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10000E1CC;
  v28[3] = &unk_100038E00;
  uint64_t v29 = v22;
  id v30 = v23;
  id v31 = v21;
  id v32 = v9;
  id v24 = v21;
  id v25 = v9;
  id v26 = v23;
  id v27 = v22;
  [v24 domainStateForRequest:v16 completion:v28];
}

- (void)evaluateACL:(id)a3 operation:(id)a4 options:(id)a5 uiDelegate:(id)a6 originator:(id)a7 reply:(id)a8
{
  id v33 = a3;
  id v34 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v31 = a8;
  if (v14) {
    id v17 = v14;
  }
  else {
    id v17 = &__NSDictionary0__struct;
  }
  id v18 = -[Context updateOptionsWithServerProperties:](self->_managedContext, "updateOptionsWithServerProperties:", v17, v31);
  if ([(ContextProxy *)self _isPreflightOnCleanContext:v14])
  {
    id v19 = +[PreflightCache sharedInstance];
    if (v16) {
      [v16 auditToken];
    }
    else {
      memset(v39, 0, sizeof(v39));
    }
    id v21 = v33;
    objc_msgSend(v19, "keyForPreflightOfACL:operation:options:auditToken:uid:", v33, v34, v17, v39, objc_msgSend(v16, "userId"));
    id v20 = (id)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      long long v22 = +[PreflightCache sharedInstance];
      id v23 = [v22 cachedPreflightResultForKey:v20];

      if (v23)
      {
        id v24 = v32;
        ((void (**)(void, void, id))v32)[2](v32, 0, v23);
        goto LABEL_15;
      }
    }
  }
  else
  {
    id v20 = 0;
    id v21 = v33;
  }
  id v25 = objc_alloc((Class)EvaluationRequest);
  id v26 = [self->_managedContext uuid];
  id v27 = [v25 initWithAcl:v21 operation:v34 options:v18 uiDelegate:v15 contextID:v26];

  v28 = [v27 log];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v29 = [v21 hash];
    unsigned int v30 = [v27 identifier];
    *(_DWORD *)buf = 67110402;
    unsigned int v41 = v29;
    __int16 v42 = 2114;
    id v43 = v34;
    __int16 v44 = 2114;
    __int16 v45 = v18;
    __int16 v46 = 1024;
    BOOL v47 = v15 != 0;
    id v21 = v33;
    __int16 v48 = 2114;
    unsigned int v49 = self;
    __int16 v50 = 1024;
    unsigned int v51 = v30;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "evaluateACL:%x operation:%{public}@ options:%{public}@, uiDelegate:%d on %{public}@ rid:%u", buf, 0x32u);
  }

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10000E614;
  v35[3] = &unk_100038E50;
  id v36 = v27;
  id v20 = v20;
  id v37 = v20;
  id v24 = v32;
  id v38 = v32;
  id v23 = v27;
  [(ContextProxy *)self _evaluateRequest:v23 originator:v16 preflightKey:v20 uiDelegate:v15 reply:v35];

LABEL_15:
}

- (void)failProcessedEvent:(int64_t)a3 failureError:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = +[Request requestFromCurrentConnection];
  id v11 = [v10 log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109890;
    int v18 = a3;
    __int16 v19 = 2114;
    id v20 = v8;
    __int16 v21 = 2114;
    long long v22 = self;
    __int16 v23 = 1024;
    unsigned int v24 = [v10 identifier];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "failProcessedEvent:%d failureError:%{public}@ on %{public}@ rid:%u", buf, 0x22u);
  }

  if ([(ContextProxy *)self checkEntitlement:@"com.apple.private.CoreAuthentication.SPI"])
  {
    managedContext = self->_managedContext;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000E960;
    v14[3] = &unk_100038EC8;
    id v15 = v10;
    id v16 = v9;
    [managedContext failProcessedEvent:a3 failureError:v8 reply:v14];

    id v13 = v15;
  }
  else
  {
    id v13 = +[LAErrorHelper missingEntitlementError:@"com.apple.private.CoreAuthentication.SPI"];
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v13);
  }
}

- (void)retryProcessedEvent:(int64_t)a3 reply:(id)a4
{
  id v6 = a4;
  v7 = +[Request requestFromCurrentConnection];
  id v8 = [v7 log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v15 = a3;
    __int16 v16 = 2114;
    id v17 = self;
    __int16 v18 = 1024;
    unsigned int v19 = [v7 identifier];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "retryProcessedEvent:%d on %{public}@ rid:%u", buf, 0x18u);
  }

  if ([(ContextProxy *)self checkEntitlement:@"com.apple.private.CoreAuthentication.SPI"])
  {
    managedContext = self->_managedContext;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000EC20;
    v11[3] = &unk_100038EC8;
    id v12 = v7;
    id v13 = v6;
    [managedContext retryEvent:a3 originator:self reply:v11];

    id v10 = v12;
  }
  else
  {
    id v10 = +[LAErrorHelper missingEntitlementError:@"com.apple.private.CoreAuthentication.SPI"];
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v10);
  }
}

- (void)resetProcessedEvent:(int64_t)a3 reply:(id)a4
{
  id v6 = a4;
  v7 = +[Request requestFromCurrentConnection];
  id v8 = [v7 log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v15 = a3;
    __int16 v16 = 2114;
    id v17 = self;
    __int16 v18 = 1024;
    unsigned int v19 = [v7 identifier];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "resetProcessedEvent:%d on %{public}@ rid:%u", buf, 0x18u);
  }

  if ([(ContextProxy *)self checkEntitlement:@"com.apple.private.CoreAuthentication.SPI"])
  {
    managedContext = self->_managedContext;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000EEE0;
    v11[3] = &unk_100038EC8;
    id v12 = v7;
    id v13 = v6;
    [managedContext resetEvent:a3 originator:self reply:v11];

    id v10 = v12;
  }
  else
  {
    id v10 = +[LAErrorHelper missingEntitlementError:@"com.apple.private.CoreAuthentication.SPI"];
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v10);
  }
}

- (void)pauseProcessedEvent:(int64_t)a3 pause:(BOOL)a4 reply:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = +[Request requestFromCurrentConnection];
  id v10 = [v9 log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v17 = a3;
    __int16 v18 = 2114;
    unsigned int v19 = self;
    __int16 v20 = 1024;
    unsigned int v21 = [v9 identifier];
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "pauseProcessedEvent:%d on %{public}@ rid:%u", buf, 0x18u);
  }

  if ([(ContextProxy *)self checkEntitlement:@"com.apple.private.CoreAuthentication.SPI"])
  {
    managedContext = self->_managedContext;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000F1A4;
    v13[3] = &unk_100038EC8;
    id v14 = v9;
    id v15 = v8;
    [managedContext pauseProcessedEvent:a3 pause:v5 reply:v13];

    id v12 = v14;
  }
  else
  {
    id v12 = +[LAErrorHelper missingEntitlementError:@"com.apple.private.CoreAuthentication.SPI"];
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v12);
  }
}

- (void)setShowingCoachingHint:(BOOL)a3 event:(int64_t)a4 reply:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = +[Request requestFromCurrentConnection];
  id v10 = [v9 log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109890;
    BOOL v17 = v6;
    __int16 v18 = 1024;
    int v19 = a4;
    __int16 v20 = 2114;
    unsigned int v21 = self;
    __int16 v22 = 1024;
    unsigned int v23 = [v9 identifier];
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "setShowingCoachingHint:%d event:%d on %{public}@ rid:%u", buf, 0x1Eu);
  }

  if ([(ContextProxy *)self checkEntitlement:@"com.apple.private.CoreAuthentication.SPI"])
  {
    managedContext = self->_managedContext;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000F474;
    v13[3] = &unk_100038EC8;
    id v14 = v9;
    id v15 = v8;
    [managedContext setShowingCoachingHint:v6 event:a4 originator:self reply:v13];

    id v12 = v14;
  }
  else
  {
    id v12 = +[LAErrorHelper missingEntitlementError:@"com.apple.private.CoreAuthentication.SPI"];
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v12);
  }
}

- (void)setCredential:(id)a3 forProcessedEvent:(int64_t)a4 credentialType:(int64_t)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = (void (**)(id, void, void *))a6;
  id v12 = +[Request requestFromCurrentConnection];
  id v13 = [v12 log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109890;
    int v20 = a4;
    __int16 v21 = 1024;
    int v22 = a5;
    __int16 v23 = 2114;
    unsigned int v24 = self;
    __int16 v25 = 1024;
    unsigned int v26 = [v12 identifier];
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "setCredential:forProcessedEvent:%d credentialType:%d on %{public}@ rid:%u", buf, 0x1Eu);
  }

  if (v10
    && ![(ContextProxy *)self checkEntitlement:@"com.apple.private.CoreAuthentication.SPI"])
  {
    id v15 = +[LAErrorHelper missingEntitlementError:@"com.apple.private.CoreAuthentication.SPI"];
    v11[2](v11, 0, v15);
  }
  else
  {
    managedContext = self->_managedContext;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000F760;
    v16[3] = &unk_100038EC8;
    id v17 = v12;
    __int16 v18 = v11;
    [managedContext setCredential:v10 forProcessedEvent:a4 credentialType:a5 reply:v16];

    id v15 = v17;
  }
}

- (void)isCredentialSet:(int64_t)a3 reply:(id)a4
{
  id v6 = a4;
  v7 = +[Request requestFromCurrentConnection];
  id v8 = [v7 log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v16 = a3;
    __int16 v17 = 2114;
    __int16 v18 = self;
    __int16 v19 = 1024;
    unsigned int v20 = [v7 identifier];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "isCredentialSet:%d on %{public}@ rid:%u", buf, 0x18u);
  }

  managedContext = self->_managedContext;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000F9D8;
  v12[3] = &unk_100038EC8;
  id v13 = v7;
  id v14 = v6;
  id v10 = v6;
  id v11 = v7;
  [managedContext isCredentialSet:a3 originator:self reply:v12];
}

- (void)setCredential:(id)a3 type:(int64_t)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void, void *))a5;
  id v10 = +[Request requestFromCurrentConnection];
  id v11 = [v10 log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v19 = a4;
    __int16 v20 = 2114;
    __int16 v21 = self;
    __int16 v22 = 1024;
    unsigned int v23 = [v10 identifier];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "setCredential:type:%d on %{public}@ rid:%u", buf, 0x18u);
  }

  if (a4 == -6)
  {
    if (![(ContextProxy *)self checkEntitlement:@"com.apple.private.LocalAuthentication.RGBCapture"])
    {
      CFStringRef v12 = @"com.apple.private.LocalAuthentication.RGBCapture";
      goto LABEL_10;
    }
  }
  else if (a4 == -1 {
         && ![(ContextProxy *)self checkEntitlement:@"com.apple.private.CoreAuthentication.SPI"])
  }
  {
    CFStringRef v12 = @"com.apple.private.CoreAuthentication.SPI";
LABEL_10:
    id v14 = +[LAErrorHelper missingEntitlementError:v12];
    v9[2](v9, 0, v14);
    goto LABEL_11;
  }
  managedContext = self->_managedContext;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000FCEC;
  v15[3] = &unk_100038EC8;
  id v16 = v10;
  __int16 v17 = v9;
  [managedContext setCredential:v8 type:a4 options:&__NSDictionary0__struct originator:self reply:v15];

  id v14 = v16;
LABEL_11:
}

- (void)invalidateWithReply:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[Request requestFromCurrentConnection];
  id v6 = [v5 log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v13 = self;
    __int16 v14 = 1024;
    unsigned int v15 = [v5 identifier];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "invalidateWithReply on %{public}@ rid:%u", buf, 0x12u);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000FF40;
  v9[3] = &unk_100038EF0;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  [(ContextProxy *)self interruptWithReply:v9];
}

- (void)credentialOfType:(int64_t)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = +[Request requestFromCurrentConnection];
  id v8 = [v7 log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v16 = a3;
    __int16 v17 = 2114;
    __int16 v18 = self;
    __int16 v19 = 1024;
    unsigned int v20 = [v7 identifier];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "credentialOfType:%d on %{public}@ rid:%u", buf, 0x18u);
  }

  managedContext = self->_managedContext;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100010184;
  v12[3] = &unk_100038F18;
  id v13 = v7;
  id v14 = v6;
  id v10 = v6;
  id v11 = v7;
  [managedContext credentialOfType:a3 originator:self reply:v12];
}

- (void)optionsForInternalOperation:(int64_t)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = +[Request requestFromCurrentConnection];
  id v8 = [v7 log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v16 = a3;
    __int16 v17 = 2114;
    __int16 v18 = self;
    __int16 v19 = 1024;
    unsigned int v20 = [v7 identifier];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "optionsForInternalOperation:%d on %{public}@ rid:%u", buf, 0x18u);
  }

  managedContext = self->_managedContext;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100010424;
  v12[3] = &unk_100038F40;
  id v13 = v7;
  id v14 = v6;
  id v10 = v6;
  id v11 = v7;
  [managedContext optionsForInternalOperation:a3 originator:self reply:v12];
}

- (void)setOptions:(id)a3 forInternalOperation:(int64_t)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = +[Request requestFromCurrentConnection];
  id v11 = [v10 log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v19 = [v8 hash];
    __int16 v20 = 1024;
    int v21 = a4;
    __int16 v22 = 2114;
    unsigned int v23 = self;
    __int16 v24 = 1024;
    unsigned int v25 = [v10 identifier];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "setOptions:%u forInternalOperation:%d on %{public}@ rid:%u", buf, 0x1Eu);
  }

  managedContext = self->_managedContext;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001070C;
  v15[3] = &unk_100038EC8;
  id v16 = v10;
  id v17 = v9;
  id v13 = v9;
  id v14 = v10;
  [managedContext setOptions:v8 forInternalOperation:a4 originator:self reply:v15];
}

- (void)serverPropertyForOption:(int64_t)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = +[Request requestFromCurrentConnection];
  id v8 = [v7 log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v16 = a3;
    __int16 v17 = 2114;
    __int16 v18 = self;
    __int16 v19 = 1024;
    unsigned int v20 = [v7 identifier];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "serverPropertyForOption:%d on %{public}@ rid:%u", buf, 0x18u);
  }

  managedContext = self->_managedContext;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100010980;
  v12[3] = &unk_100038F40;
  id v13 = v7;
  id v14 = v6;
  id v10 = v6;
  id v11 = v7;
  [managedContext serverPropertyForOption:a3 reply:v12];
}

- (void)setServerPropertyForOption:(int64_t)a3 value:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = +[Request requestFromCurrentConnection];
  id v11 = [v10 log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109890;
    int v19 = a3;
    __int16 v20 = 2114;
    id v21 = v8;
    __int16 v22 = 2114;
    unsigned int v23 = self;
    __int16 v24 = 1024;
    unsigned int v25 = [v10 identifier];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "setServerPropertyForOption:%d value:%{public}@ on %{public}@ rid:%u", buf, 0x22u);
  }

  managedContext = self->_managedContext;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100010C14;
  v15[3] = &unk_100038EC8;
  id v16 = v10;
  id v17 = v9;
  id v13 = v9;
  id v14 = v10;
  [managedContext setServerPropertyForOption:a3 value:v8 reply:v15];
}

- (void)externalizedContextWithReply:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[Request requestFromCurrentConnection];
  id v6 = [v5 log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v14 = self;
    __int16 v15 = 1024;
    unsigned int v16 = [v5 identifier];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "externalizedContextWithReply on %{public}@ rid:%u", buf, 0x12u);
  }

  managedContext = self->_managedContext;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100010E6C;
  v10[3] = &unk_100038F18;
  id v11 = v5;
  id v12 = v4;
  id v8 = v4;
  id v9 = v5;
  [managedContext externalizedContextWithReply:v10];
}

- (void)authMethodWithReply:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[Request requestFromCurrentConnection];
  id v6 = [v5 log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v14 = self;
    __int16 v15 = 1024;
    unsigned int v16 = [v5 identifier];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "authMethodWithReply on %{public}@ rid:%u", buf, 0x12u);
  }

  managedContext = self->_managedContext;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100011100;
  v10[3] = &unk_100038F18;
  id v11 = v5;
  id v12 = v4;
  id v8 = v4;
  id v9 = v5;
  [managedContext authMethodWithReply:v10];
}

- (void)verifyFileVaultUser:(id)a3 volumeUuid:(id)a4 options:(unint64_t)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = +[Request requestFromCurrentConnection];
  id v14 = [v13 log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544386;
    id v22 = v10;
    __int16 v23 = 2114;
    id v24 = v11;
    __int16 v25 = 1024;
    int v26 = a5;
    __int16 v27 = 2114;
    v28 = self;
    __int16 v29 = 1024;
    unsigned int v30 = [v13 identifier];
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "verifyFileVaultUser:%{public}@ volumeUuid:%{public}@, options:%u on %{public}@ rid:%u", buf, 0x2Cu);
  }

  managedContext = self->_managedContext;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000113F4;
  v18[3] = &unk_100038EC8;
  id v19 = v13;
  id v20 = v12;
  id v16 = v12;
  id v17 = v13;
  [managedContext verifyFileVaultUser:v10 volumeUuid:v11 options:a5 reply:v18];
}

- (void)allowTransferToProcess:(int)a3 receiverAuditTokenData:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = +[Request requestFromCurrentConnection];
  id v11 = [v10 log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109890;
    int v20 = a3;
    __int16 v21 = 1024;
    unsigned int v22 = [v8 hash];
    __int16 v23 = 2114;
    id v24 = self;
    __int16 v25 = 1024;
    unsigned int v26 = [v10 identifier];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "allowTransferToProcess:%d receiverAuditTokenData:%x on %{public}@ rid:%u", buf, 0x1Eu);
  }

  managedContext = self->_managedContext;
  id v13 = [v10 caller];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000116AC;
  v16[3] = &unk_100038EC8;
  id v17 = v10;
  id v18 = v9;
  id v14 = v9;
  id v15 = v10;
  [managedContext allowTransferFromCaller:v13 receiverAuditTokenData:v8 reply:v16];
}

- (void)tokenForTransferToUnknownProcess:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[Request requestFromCurrentConnection];
  id v6 = [v5 log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v15 = self;
    __int16 v16 = 1024;
    unsigned int v17 = [v5 identifier];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "tokenForTransferToUnknownProcess on %{public}@ rid:%u", buf, 0x12u);
  }

  managedContext = self->_managedContext;
  id v8 = [v5 caller];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001191C;
  v11[3] = &unk_100038F18;
  id v12 = v5;
  id v13 = v4;
  id v9 = v4;
  id v10 = v5;
  [managedContext tokenForTransferFromCaller:v8 reply:v11];
}

- (void)getDomainStateWithOptions:(id)a3 reply:(id)a4
{
}

- (void)evaluateACL:(id)a3 operation:(id)a4 options:(id)a5 uiDelegate:(id)a6 reply:(id)a7
{
}

- (void)evaluateACL:(id)a3 cfOperation:(void *)a4 options:(id)a5 uiDelegate:(id)a6 reply:(id)a7
{
}

- (void)invalidateWithError:(id)a3
{
  [(LAContextCallbackXPC *)self->_callback invalidatedWithError:a3];
  id invalidationBlock = (void (**)(void))self->_invalidationBlock;
  if (invalidationBlock)
  {
    invalidationBlock[2]();
    id v5 = self->_invalidationBlock;
    self->_id invalidationBlock = 0;
  }
}

- (int)auditSessionId
{
  return self->_auditSessionId;
}

- (LAContextCallbackXPC)callback
{
  return self->_callback;
}

@end