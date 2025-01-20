@interface MFDAutosave
+ (id)endpointInfo;
+ (id)log;
+ (id)sharedInstance;
- (EFScheduler)autosaveScheduler;
- (MFDAutosave)init;
- (NSHashTable)activeAutosaveSessions;
- (id)newConnectionForInterface:(id)a3;
- (void)_autosavedMessageWithIdentifier:(id)a3 localOnly:(BOOL)a4 completion:(id)a5;
- (void)autosaveMessageData:(id)a3 replacingIdentifier:(id)a4 completion:(id)a5;
- (void)autosaveSessionForIdentifier:(id)a3 completion:(id)a4;
- (void)autosavedMessageDataWithIdentifier:(id)a3 completion:(id)a4;
- (void)getIdleAutosaves:(id)a3;
- (void)hasAutosavedMessageWithIdentifier:(id)a3 completion:(id)a4;
- (void)removeAutosavedMessageWithIdentifier:(id)a3;
- (void)setActiveAutosaveSessions:(id)a3;
- (void)setAutosaveScheduler:(id)a3;
@end

@implementation MFDAutosave

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100056B94;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016BA38 != -1) {
    dispatch_once(&qword_10016BA38, block);
  }
  v2 = (void *)qword_10016BA30;

  return v2;
}

- (MFDAutosave)init
{
  v8.receiver = self;
  v8.super_class = (Class)MFDAutosave;
  v2 = [(MFDAutosave *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[EFScheduler serialDispatchQueueSchedulerWithName:@"MFDAutosaveQueue"];
    autosaveScheduler = v2->_autosaveScheduler;
    v2->_autosaveScheduler = (EFScheduler *)v3;

    uint64_t v5 = +[NSHashTable weakObjectsHashTable];
    activeAutosaveSessions = v2->_activeAutosaveSessions;
    v2->_activeAutosaveSessions = (NSHashTable *)v5;
  }
  return v2;
}

+ (id)endpointInfo
{
  v2 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MSDAutosaveProtocol];
  uint64_t v3 = +[MFXPCEndpointInfo endpointInfoWithExportedInterface:v2 remoteObjectInterface:0 shouldAcceptClient:0 exportedObjectForClient:&stru_10013B818];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:"getIdleAutosaves:" argumentIndex:0 ofReply:1];

  v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MSDAutosaveSessionProtocol];
  [v2 setInterface:v6 forSelector:"autosaveSessionForIdentifier:completion:" argumentIndex:0 ofReply:1];

  return v3;
}

+ (id)sharedInstance
{
  if (qword_10016BA48 != -1) {
    dispatch_once(&qword_10016BA48, &stru_10013B838);
  }
  v2 = (void *)qword_10016BA40;

  return v2;
}

- (id)newConnectionForInterface:(id)a3
{
  return 0;
}

- (void)hasAutosavedMessageWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = (void (**)(void, void))v7;
  if (v6)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100057020;
    v10[3] = &unk_10013B860;
    id v11 = v7;
    [(MFDAutosave *)self _autosavedMessageWithIdentifier:v6 localOnly:0 completion:v10];
  }
  else
  {
    v9 = +[MFDAutosave log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000C1214(v9);
    }

    v8[2](v8, 0);
  }
}

- (void)removeAutosavedMessageWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100057230;
    v6[3] = &unk_10013B888;
    id v7 = v4;
    [(MFDAutosave *)self _autosavedMessageWithIdentifier:v7 localOnly:1 completion:v6];
  }
}

- (void)_autosavedMessageWithIdentifier:(id)a3 localOnly:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(MFDAutosave *)self autosaveScheduler];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100057538;
  v13[3] = &unk_10013B8B0;
  id v11 = v8;
  id v14 = v11;
  BOOL v16 = a4;
  id v12 = v9;
  id v15 = v12;
  [v10 performBlock:v13];
}

- (void)autosavedMessageDataWithIdentifier:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100057994;
  v8[3] = &unk_10013B8D8;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(MFDAutosave *)self _autosavedMessageWithIdentifier:v7 localOnly:0 completion:v8];
}

- (void)autosaveMessageData:(id)a3 replacingIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v24 = a4;
  id v9 = a5;
  id v10 = +[MFMailMessage messageWithRFC822Data:v8];
  id v11 = objc_msgSend(v10, "mf_documentReference");
  uint64_t v12 = [v11 absoluteString];
  v13 = (void *)v12;
  if (v10 && v12)
  {
    id v14 = +[NSString stringWithFormat:@"MFDAutosave transaction: documentID=%@", v12];
    id v15 = +[EFProcessTransaction transactionWithDescription:v14];

    BOOL v16 = +[NSString stringWithFormat:@"(Autosave documentID=%@)", v13];
    v17 = +[MFDAutosave log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Enqueuing autosave. %@", buf, 0xCu);
    }

    v18 = [(MFDAutosave *)self autosaveScheduler];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100057EF4;
    v25[3] = &unk_10013B900;
    id v19 = v16;
    id v26 = v19;
    id v27 = v11;
    id v28 = v24;
    id v29 = v13;
    id v30 = v10;
    id v32 = v9;
    id v20 = v15;
    id v31 = v20;
    [v18 performBlock:v25];
  }
  else
  {
    if (v10)
    {
      id v20 = +[NSError errorWithDomain:MSAutosaveErrorDomain code:1 userInfo:0];
      v21 = +[MFDAutosave log];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = objc_msgSend(v20, "ef_publicDescription");
        sub_1000C1384(v22, (uint64_t)buf, v21);
      }
    }
    else
    {
      id v20 = +[NSError errorWithDomain:MSAutosaveErrorDomain code:3 userInfo:0];
      v21 = +[MFDAutosave log];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v23 = objc_msgSend(v20, "ef_publicDescription");
        sub_1000C13D4(v23, (uint64_t)buf, v21);
      }
    }

    (*((void (**)(id, void, id))v9 + 2))(v9, 0, v20);
  }
}

- (void)getIdleAutosaves:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MFDAutosave *)self autosaveScheduler];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000587E4;
  v7[3] = &unk_10013B9B8;
  id v6 = v4;
  v7[4] = self;
  id v8 = v6;
  [v5 performBlock:v7];
}

- (void)autosaveSessionForIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    id v8 = [(MFDAutosave *)self autosaveScheduler];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10005905C;
    v10[3] = &unk_10013B9E0;
    objc_copyWeak(&v13, &location);
    id v11 = v6;
    id v12 = v7;
    [v8 performBlock:v10];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    id v9 = +[NSError errorWithDomain:MSAutosaveErrorDomain code:1 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v9);
  }
}

- (EFScheduler)autosaveScheduler
{
  return self->_autosaveScheduler;
}

- (void)setAutosaveScheduler:(id)a3
{
}

- (NSHashTable)activeAutosaveSessions
{
  return self->_activeAutosaveSessions;
}

- (void)setActiveAutosaveSessions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeAutosaveSessions, 0);

  objc_storeStrong((id *)&self->_autosaveScheduler, 0);
}

@end