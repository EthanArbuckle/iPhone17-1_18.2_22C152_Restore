@interface Daemon
+ (id)sharedInstance;
- (Daemon)init;
- (NSHashTable)notifications;
- (id)_proxyWithContext:(id)a3 callback:(id)a4 clientId:(unint64_t)a5 request:(id)a6;
- (void)_clearNotification:(id)a3 fromPendingNotifications:(id)a4 finally:(id)a5;
- (void)_connectToExistingContext:(id)a3 callback:(id)a4 clientId:(unint64_t)a5 processId:(int)a6 userId:(unsigned int)a7 auditSessionId:(int)a8 auditToken:(id *)a9 cApiOrigin:(BOOL)a10 checkEntitlementBlock:(id)a11 invalidationBlock:(id)a12 connectionHash:(unint64_t)a13 reply:(id)a14;
- (void)addNotificationObserver:(id)a3 className:(id)a4 completionHandler:(id)a5;
- (void)bootstrapSessionServiceType:(id)a3 serviceClientID:(id)a4 completionHandler:(id)a5;
- (void)connectToContextWithUUID:(id)a3 callback:(id)a4 clientId:(unint64_t)a5 token:(id)a6 senderAuditTokenData:(id)a7 reply:(id)a8;
- (void)connectToExistingContext:(id)a3 callback:(id)a4 clientId:(unint64_t)a5 reply:(id)a6;
- (void)connectToExistingContext:(id)a3 userId:(unsigned int)a4 connection:(id)a5 checkEntitlementBlock:(id)a6 callback:(id)a7 clientId:(unint64_t)a8 reply:(id)a9;
- (void)createContextWithCompletion:(id)a3;
- (void)dumpStatusWithCompletion:(id)a3;
- (void)notifyEvent:(int64_t)a3 options:(id)a4 reply:(id)a5;
- (void)postNotificationOfClassNamed:(id)a3 newValue:(id)a4 oldValue:(id)a5 completionHandler:(id)a6;
- (void)prearmTouchIdWithReply:(id)a3;
@end

@implementation Daemon

- (void)connectToExistingContext:(id)a3 callback:(id)a4 clientId:(unint64_t)a5 reply:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  +[NSXPCConnection currentConnection];
  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  v19 = sub_100004214;
  v20 = &unk_100039068;
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v21;
  v14 = objc_retainBlock(&v17);
  v15 = +[NSXPCConnection currentConnection];
  id v16 = [v15 effectiveUserIdentifier];
  -[Daemon connectToExistingContext:userId:connection:checkEntitlementBlock:callback:clientId:reply:](self, "connectToExistingContext:userId:connection:checkEntitlementBlock:callback:clientId:reply:", v12, v16, v13, v14, v11, a5, v10, v17, v18, v19, v20);
}

- (void)connectToExistingContext:(id)a3 userId:(unsigned int)a4 connection:(id)a5 checkEntitlementBlock:(id)a6 callback:(id)a7 clientId:(unint64_t)a8 reply:(id)a9
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a9;
  id v18 = [v14 processIdentifier];
  objc_initWeak(location, v16);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000121A4;
  v25[3] = &unk_100039090;
  int v27 = (int)v18;
  objc_copyWeak(&v26, location);
  v19 = objc_retainBlock(v25);
  id v20 = [v14 auditSessionIdentifier];
  if (v14) {
    [v14 auditToken];
  }
  else {
    memset(v24, 0, sizeof(v24));
  }
  LOBYTE(v21) = 0;
  -[Daemon _connectToExistingContext:callback:clientId:processId:userId:auditSessionId:auditToken:cApiOrigin:checkEntitlementBlock:invalidationBlock:connectionHash:reply:](self, "_connectToExistingContext:callback:clientId:processId:userId:auditSessionId:auditToken:cApiOrigin:checkEntitlementBlock:invalidationBlock:connectionHash:reply:", v13, v16, a8, v18, a4, v20, v24, v21, v15, v19, [v14 hash], v17);

  objc_destroyWeak(&v26);
  objc_destroyWeak(location);
}

- (void)_connectToExistingContext:(id)a3 callback:(id)a4 clientId:(unint64_t)a5 processId:(int)a6 userId:(unsigned int)a7 auditSessionId:(int)a8 auditToken:(id *)a9 cApiOrigin:(BOOL)a10 checkEntitlementBlock:(id)a11 invalidationBlock:(id)a12 connectionHash:(unint64_t)a13 reply:(id)a14
{
  id v35 = a3;
  id v32 = a4;
  id v17 = a11;
  id v18 = a12;
  id v19 = a14;
  id v20 = sub_1000072EC();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67110144;
    unsigned int v55 = [v35 hash];
    __int16 v56 = 1024;
    int v57 = a6;
    __int16 v58 = 1024;
    unsigned int v59 = a7;
    __int16 v60 = 1024;
    BOOL v61 = a10;
    __int16 v62 = 1024;
    int v63 = a13;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "connectToExistingContext:%x, pid:%d, uid:%u, cAPI:%d, connection:%x", buf, 0x20u);
  }

  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_100004AE8;
  v51[3] = &unk_100038FF0;
  unint64_t v53 = a13;
  id v21 = v19;
  id v52 = v21;
  v22 = objc_retainBlock(v51);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  long long v23 = *(_OWORD *)&a9->var0[4];
  long long v48 = *(_OWORD *)a9->var0;
  v39[2] = sub_1000045D4;
  v39[3] = &unk_100039018;
  unsigned int v31 = a6;
  int v45 = a6;
  unsigned int v46 = a7;
  int v47 = a8;
  long long v49 = v23;
  BOOL v50 = a10;
  id v24 = v17;
  id v41 = v24;
  id v25 = v18;
  id v42 = v25;
  id v26 = v32;
  id v40 = v26;
  unint64_t v44 = a5;
  int v27 = v22;
  id v43 = v27;
  v28 = objc_retainBlock(v39);
  if (v35
    && (+[ContextManager sharedInstance],
        v29 = objc_claimAutoreleasedReturnValue(),
        [v29 findContextForExternalizedContext:v35],
        v30 = objc_claimAutoreleasedReturnValue(),
        v29,
        v30))
  {
    ((void (*)(void *, void *))v28[2])(v28, v30);
  }
  else
  {
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100003F8C;
    v36[3] = &unk_100039040;
    v37 = v28;
    v38 = v27;
    +[Context managedContextWithExternalizedContext:v35 processId:v31 userId:a7 auditSessionId:a8 reply:v36];

    v30 = v37;
  }
}

+ (id)sharedInstance
{
  if (qword_100046E58 != -1) {
    dispatch_once(&qword_100046E58, &stru_100038F60);
  }
  v2 = (void *)qword_100046E50;

  return v2;
}

- (Daemon)init
{
  v8.receiver = self;
  v8.super_class = (Class)Daemon;
  v2 = [(Daemon *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[DaemonServiceManagerFactory build];
    serviceManager = v2->_serviceManager;
    v2->_serviceManager = (LAServiceManager *)v3;

    uint64_t v5 = +[NSHashTable weakObjectsHashTable];
    notifications = v2->_notifications;
    v2->_notifications = (NSHashTable *)v5;

    +[RemoteUIActivator setDaemon:v2];
  }
  return v2;
}

- (void)createContextWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = getuid();
  v6 = +[NSXPCConnection currentConnection];
  id v7 = [objc_alloc((Class)LAWeakBox) initWithReceiver:self];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100012190;
  v9[3] = &unk_100038FC8;
  id v10 = v4;
  id v8 = v4;
  [(Daemon *)self connectToExistingContext:0 userId:v5 connection:v6 checkEntitlementBlock:&stru_100038FA0 callback:v7 clientId:0 reply:v9];
}

- (void)connectToContextWithUUID:(id)a3 callback:(id)a4 clientId:(unint64_t)a5 token:(id)a6 senderAuditTokenData:(id)a7 reply:(id)a8
{
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a3;
  id v19 = +[ContextManager sharedInstance];
  id v20 = [v19 contextForUUID:v18];

  if (v20)
  {
    id v21 = +[Request requestFromCurrentConnection];
    v22 = [v21 caller];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    _OWORD v24[2] = sub_100012420;
    v24[3] = &unk_1000390B8;
    id v29 = v17;
    v24[4] = self;
    id v25 = v20;
    unint64_t v30 = a5;
    id v26 = v14;
    id v27 = v21;
    id v28 = v19;
    id v23 = v21;
    [v25 connectFromCaller:v22 token:v15 senderAuditTokenData:v16 reply:v24];
  }
  else
  {
    id v23 = +[LAErrorHelper errorWithCode:-10 message:@"Context not found."];
    (*((void (**)(id, void, void, id))v17 + 2))(v17, 0, 0, v23);
  }
}

- (id)_proxyWithContext:(id)a3 callback:(id)a4 clientId:(unint64_t)a5 request:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a6;
  [v10 caller];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000126FC;
  v29[3] = &unk_100039068;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v30 = v11;
  id v12 = objc_retainBlock(v29);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100012708;
  v25[3] = &unk_100038BC0;
  id v13 = v10;
  id v26 = v13;
  id v14 = v11;
  id v27 = v14;
  id v15 = v9;
  id v28 = v15;
  id v16 = objc_retainBlock(v25);
  id v17 = [ContextProxy alloc];
  id v18 = [v14 pid];
  id v19 = [v14 euid];
  id v20 = [v14 asid];
  if (v14) {
    [v14 auditToken];
  }
  else {
    memset(v24, 0, sizeof(v24));
  }
  id v21 = [(ContextProxy *)v17 initWithContext:v8 processId:v18 userId:v19 auditSessionId:v20 auditToken:v24 cApiOrigin:0 checkEntitlementBlock:v12 invalidationBlock:v16 callback:v15 clientId:a5];

  return v21;
}

- (void)bootstrapSessionServiceType:(id)a3 serviceClientID:(id)a4 completionHandler:(id)a5
{
}

- (void)prearmTouchIdWithReply:(id)a3
{
  uint64_t v3 = (void (**)(id, void, id))a3;
  id v4 = sub_1000072EC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "prearmTouchIdWithReply", v11, 2u);
  }

  uint64_t v5 = +[NSXPCConnection currentConnection];
  v6 = [v5 valueForEntitlement:@"com.apple.private.CoreAuthentication.SPI"];
  unsigned __int8 v7 = [v6 BOOLValue];

  if (v7)
  {
    id v8 = [objc_alloc((Class)EvaluationRequest) initWithPolicy:1 options:&__NSDictionary0__struct contextID:0];
    id v9 = +[NSXPCConnection currentConnection];
    id v10 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v9 effectiveUserIdentifier]);
    +[TouchIdPrearmContext prearmForUser:v10 request:v8 reply:v3];
  }
  else
  {
    id v8 = +[LAErrorHelper missingEntitlementError:@"com.apple.private.CoreAuthentication.SPI"];
    v3[2](v3, 0, v8);
  }
}

- (void)notifyEvent:(int64_t)a3 options:(id)a4 reply:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(id, uint64_t, void))a5;
  id v9 = sub_1000072EC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v17[0] = 67109378;
    v17[1] = a3;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "notifyEvent: %d, options: %@", (uint8_t *)v17, 0x12u);
  }

  id v10 = +[NSXPCConnection currentConnection];
  id v11 = [v10 valueForEntitlement:@"com.apple.private.CoreAuthentication.SPI"];
  unsigned __int8 v12 = [v11 BOOLValue];

  if (v12)
  {
    if (a3 == 2) {
      goto LABEL_11;
    }
    if (a3 == 1)
    {
      id v16 = +[PushButtonMonitor sharedInstance];
      [v16 axApplePayConfirmation];

      v8[2](v8, 1, 0);
      goto LABEL_15;
    }
    if (a3)
    {
      uint64_t v13 = +[LAErrorHelper errorPlatformDoesNotSupportAction:@"Event notification"];
      goto LABEL_10;
    }
    if (!+[DaemonUtils deviceHasTouchIDAndSecureDoublePress])
    {
LABEL_11:
      id v14 = [v7 objectForKeyedSubscript:&off_10003A198];
      if (!v14)
      {
        id v14 = +[NSDate date];
      }
      id v15 = +[PushButtonMonitor sharedInstance];
      [v15 doubleTappedAt:v14];

      v8[2](v8, 1, 0);
      goto LABEL_14;
    }
    uint64_t v13 = +[LAErrorHelper parameterErrorWithMessage:@"LANotifyEventPowerButtonDoublePress has no effect"];
  }
  else
  {
    uint64_t v13 = +[LAErrorHelper missingEntitlementError:@"com.apple.private.CoreAuthentication.SPI"];
  }
LABEL_10:
  id v14 = (void *)v13;
  v8[2](v8, 0, v13);
LABEL_14:

LABEL_15:
}

- (void)addNotificationObserver:(id)a3 className:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, Notification *, void))a5;
  id v10 = a3;
  id v11 = +[NSXPCConnection currentConnection];
  id v12 = [v11 processIdentifier];

  uint64_t v13 = sub_100012CBC();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109378;
    v16[1] = v12;
    __int16 v17 = 2114;
    id v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Added notification observer from PID %d for notification class %{public}@", (uint8_t *)v16, 0x12u);
  }

  id v14 = [[Notification alloc] initWithObserver:v10 observerPid:v12 className:v8];
  id v15 = [(Daemon *)self notifications];
  [v15 addObject:v14];

  v9[2](v9, v14, 0);
}

- (void)postNotificationOfClassNamed:(id)a3 newValue:(id)a4 oldValue:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_1000131F4;
  v47[3] = &unk_1000390E0;
  id v34 = v10;
  id v48 = v34;
  id v33 = v11;
  id v49 = v33;
  id v32 = v12;
  id v50 = v32;
  id v30 = v13;
  id v51 = v30;
  id v35 = objc_retainBlock(v47);
  id v14 = sub_100012CBC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v54 = v34;
    __int16 v55 = 2114;
    id v56 = v33;
    __int16 v57 = 2114;
    id v58 = v32;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Posting notification %{public}@, newValue: %{public}@, oldValue: %{public}@", buf, 0x20u);
  }

  id v15 = [(Daemon *)self notifications];
  id v16 = [v15 allObjects];
  __int16 v17 = +[NSPredicate predicateWithBlock:&stru_100039120];
  unsigned int v31 = [v16 filteredArrayUsingPredicate:v17];

  id v18 = +[NSMutableArray arrayWithArray:v31];
  objc_initWeak((id *)buf, self);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v19 = [(Daemon *)self notifications];
  id v20 = [v19 allObjects];

  id v21 = [v20 countByEnumeratingWithState:&v43 objects:v52 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v44;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v44 != v22) {
          objc_enumerationMutation(v20);
        }
        id v24 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        id v25 = objc_msgSend(v24, "className", v30);
        unsigned int v26 = [v25 isEqualToString:v34];

        if (v26)
        {
          v39[0] = _NSConcreteStackBlock;
          v39[1] = 3221225472;
          v39[2] = sub_1000132E4;
          v39[3] = &unk_100039148;
          objc_copyWeak(&v42, (id *)buf);
          void v39[4] = v24;
          id v40 = v18;
          id v41 = v35;
          [v24 newValue:v33 oldValue:v32 completionHandler:v39];

          objc_destroyWeak(&v42);
        }
        else
        {
          id WeakRetained = objc_loadWeakRetained((id *)buf);
          [WeakRetained _clearNotification:v24 fromPendingNotifications:v18 finally:v35];
        }
      }
      id v21 = [v20 countByEnumeratingWithState:&v43 objects:v52 count:16];
    }
    while (v21);
  }

  if ([v18 count])
  {
    dispatch_time_t v28 = dispatch_time(0, 100000000);
    id v29 = +[DaemonUtils queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100013414;
    block[3] = &unk_100038EF0;
    id v37 = v18;
    v38 = v35;
    dispatch_after(v28, v29, block);
  }
  else
  {
    ((void (*)(void))v35[2])();
  }
  objc_destroyWeak((id *)buf);
}

- (void)_clearNotification:(id)a3 fromPendingNotifications:(id)a4 finally:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  if ([v8 containsObject:v7])
  {
    [v8 removeObject:v7];
    if (![v8 count]) {
      v9[2](v9);
    }
  }
  else
  {
    id v10 = sub_100012CBC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100027AA8((uint64_t)v7, (uint64_t)v8, v10);
    }
  }
}

- (void)dumpStatusWithCompletion:(id)a3
{
  uint64_t v3 = (void (**)(id, void, uint64_t))a3;
  id v4 = sub_1000072EC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    pid_t v19 = getpid();
    __int16 v20 = 1024;
    uid_t v21 = geteuid();
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dumping status information for coreauthd[%u] (user %u)...", buf, 0xEu);
  }

  uint64_t v5 = +[NSXPCConnection currentConnection];
  v6 = [v5 valueForEntitlement:@"com.apple.private.LocalAuthentication.StatusDump"];
  unsigned __int8 v7 = [v6 BOOLValue];

  if ((v7 & 1) == 0)
  {
    uint64_t v15 = +[LAErrorHelper missingEntitlementError:@"com.apple.private.LocalAuthentication.StatusDump"];
LABEL_8:
    id v9 = (void *)v15;
    v3[2](v3, 0, v15);
    goto LABEL_9;
  }
  if ((os_variant_allows_internal_security_policies() & 1) == 0)
  {
    uint64_t v15 = +[LAErrorHelper internalErrorWithMessage:@"Status dump not allowed on production builds"];
    goto LABEL_8;
  }
  id v8 = +[ContextManager sharedInstance];
  id v9 = [v8 dumpStatus];

  v16[0] = @"environment";
  id v10 = +[EnvironmentManager sharedInstance];
  id v11 = [v10 dumpStatus];
  v17[0] = v11;
  v17[1] = v9;
  v16[1] = @"contexts";
  _DWORD v16[2] = @"context#";
  id v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 count]);
  _DWORD v17[2] = v12;
  v16[3] = @"process";
  id v13 = +[NSString stringWithFormat:@"coreauthd[%u]", getpid()];
  v17[3] = v13;
  id v14 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:4];

  ((void (**)(id, void *, uint64_t))v3)[2](v3, v14, 0);
LABEL_9:
}

- (NSHashTable)notifications
{
  return self->_notifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifications, 0);

  objc_storeStrong((id *)&self->_serviceManager, 0);
}

@end