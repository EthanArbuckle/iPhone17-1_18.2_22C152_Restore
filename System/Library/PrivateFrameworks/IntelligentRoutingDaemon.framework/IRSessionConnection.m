@interface IRSessionConnection
- (IRServiceHandling)serviceHandler;
- (IRSessionClientProxy)client;
- (IRSessionConnection)initWithServer:(id)a3 client:(id)a4;
- (IRSessionServer)server;
- (NSString)serviceIdentifier;
- (int64_t)mode;
- (void)_addEvent:(id)a3 forCandidate:(id)a4;
- (void)_createServiceWithParameters:(id)a3 reply:(id)a4;
- (void)_databaseExportwithReply:(id)a3;
- (void)_deleteCandidate:(id)a3;
- (void)_deleteDatabaseWithReply:(id)a3;
- (void)_deleteService:(id)a3;
- (void)_getServiceTokensWithReply:(id)a3;
- (void)_invalidate;
- (void)_requestCurrentContextWithBundleID:(id)a3;
- (void)_runWithConfiguration:(id)a3;
- (void)_setSpotOnLocationWithParameters:(id)a3;
- (void)_updateCandidates:(id)a3;
- (void)didSpotOnLocationComplete:(id)a3;
- (void)didUpdateBundlesWithSignificantInteractionPattern:(id)a3;
- (void)didUpdateContexts:(id)a3 withReason:(id)a4;
- (void)setClient:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setServer:(id)a3;
- (void)setServiceHandler:(id)a3;
- (void)setServiceIdentifier:(id)a3;
- (void)xpcInvalidationHandler;
@end

@implementation IRSessionConnection

- (void)_runWithConfiguration:(id)a3
{
  v72[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(IRSessionConnection *)self server];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263F50100];
    v7 = [v4 serviceToken];
    v8 = [(IRSessionConnection *)self client];
    v9 = [v8 clientIdentifier];
    LODWORD(v6) = [v6 isServiceTokenValid:v7 forClientIdentifier:v9];

    if (v6)
    {
      v10 = [v4 serviceToken];
      v11 = (void *)[v10 copy];
    }
    else
    {
      v12 = (void *)MEMORY[0x263F50100];
      v10 = [(IRSessionConnection *)self client];
      v13 = [v10 clientIdentifier];
      v11 = [v12 serviceTokenForServiceIdentifier:v13];
    }
    if (v11)
    {
      uint64_t v14 = [v4 mode];
      v15 = (void *)[objc_alloc(MEMORY[0x263F500C8]) initWithServiceToken:v11];

      [v15 setMode:v14];
      v16 = [(IRSessionConnection *)self serviceIdentifier];

      if (v16)
      {
LABEL_17:
        int64_t v43 = [(IRSessionConnection *)self mode];
        if (v43 != [v15 mode])
        {
          -[IRSessionConnection setMode:](self, "setMode:", [v15 mode]);
          v44 = [(IRSessionConnection *)self serviceIdentifier];
          [v5 refreshUpdateModeForServiceIdentifier:v44];
        }
        v45 = [(IRSessionConnection *)self serviceHandler];
        [v45 run];
        id v4 = v15;
        goto LABEL_21;
      }
      os_unfair_lock_lock((os_unfair_lock_t)&serviceCreationAndDeletionlock);
      v17 = [v5 persistenceManager];
      v18 = +[IRServiceContainer getServicesWithPersistenceManager:v17];

      v59[0] = MEMORY[0x263EF8330];
      v59[1] = 3221225472;
      v59[2] = __45__IRSessionConnection__runWithConfiguration___block_invoke;
      v59[3] = &unk_2653A10F8;
      id v4 = v15;
      id v60 = v4;
      v57 = v18;
      uint64_t v58 = [v18 firstWhere:v59];
      v19 = (id)*MEMORY[0x263F50090];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v55 = [(IRSessionConnection *)self client];
        v53 = [v55 clientIdentifier];
        v20 = [v4 serviceToken];
        v21 = [v20 serviceIdentifier];
        v22 = [v4 serviceToken];
        [v22 servicePackage];
        IRServicePackageString();
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v64 = v53;
        __int16 v65 = 2112;
        uint64_t v66 = (uint64_t)v21;
        __int16 v67 = 2112;
        v68 = v23;
        __int16 v69 = 2112;
        uint64_t v70 = v58;
        _os_log_impl(&dword_25418E000, v19, OS_LOG_TYPE_INFO, "#session-connection, Client:%@ running Service Token:%@ with Service Package:%@\n Service found in database:%@", buf, 0x2Au);
      }
      v24 = (void *)v58;
      if (!v58)
      {
        v56 = [v4 serviceToken];
        v54 = [v56 serviceIdentifier];
        v25 = [v4 serviceToken];
        v26 = [v25 serviceIdentifier];
        id v27 = objc_alloc(MEMORY[0x263F500F8]);
        v28 = [v4 serviceToken];
        v29 = objc_msgSend(v27, "initWithServicePackage:", objc_msgSend(v28, "servicePackage"));
        v30 = [v5 persistenceManager];
        v52 = +[IRServiceContainer createServiceWithClientIdentifier:v54 serviceIdentifier:v26 parameters:v29 persistenceManager:v30];

        v31 = (id)*MEMORY[0x263F50090];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          v32 = [v4 serviceToken];
          v33 = [v32 serviceIdentifier];
          v34 = [(IRSessionConnection *)self client];
          uint64_t v35 = [v34 clientIdentifier];
          v36 = (void *)v35;
          v37 = @"YES";
          *(_DWORD *)buf = 138412802;
          v64 = v33;
          __int16 v65 = 2112;
          if (!v52) {
            v37 = @"NO";
          }
          uint64_t v66 = v35;
          __int16 v67 = 2112;
          v68 = v37;
          _os_log_impl(&dword_25418E000, v31, OS_LOG_TYPE_INFO, "#session-connection, Creating service: %@, for client: %@, success: %@", buf, 0x20u);
        }
        v24 = 0;
      }

      os_unfair_lock_unlock((os_unfair_lock_t)&serviceCreationAndDeletionlock);
      v38 = [v4 serviceToken];
      v39 = [v38 serviceIdentifier];
      v40 = [v5 registerWithServiceIdentifier:v39 withConnection:self];

      if (v40)
      {
        v41 = [v4 serviceToken];
        v42 = [v41 serviceIdentifier];
        [(IRSessionConnection *)self setServiceIdentifier:v42];

        [(IRSessionConnection *)self setServiceHandler:v40];
        goto LABEL_17;
      }
      v49 = (void *)MEMORY[0x263F087E8];
      uint64_t v61 = *MEMORY[0x263F08338];
      v62 = @"Could not run service";
      v50 = [NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
      v45 = [v49 errorWithDomain:*MEMORY[0x263F50088] code:-12889 userInfo:v50];

      v51 = [(IRSessionConnection *)self client];
      [v51 _sessionDidFailWithError:v45];
    }
    else
    {
      v46 = (void *)MEMORY[0x263F087E8];
      uint64_t v71 = *MEMORY[0x263F08338];
      v72[0] = @"Could not run service, unknown client";
      v47 = [NSDictionary dictionaryWithObjects:v72 forKeys:&v71 count:1];
      v45 = [v46 errorWithDomain:*MEMORY[0x263F50088] code:-12889 userInfo:v47];

      v48 = [(IRSessionConnection *)self client];
      [v48 _sessionDidFailWithError:v45];
    }
LABEL_21:
  }
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)didUpdateContexts:(id)a3 withReason:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(IRSessionConnection *)self mode] == 1)
  {
    v8 = [(IRSessionConnection *)self client];
    [v8 _didUpdateContext:v6];

    v9 = (void *)*MEMORY[0x263F500A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F500A0], OS_LOG_TYPE_DEFAULT))
    {
      log = v9;
      v20 = [(IRSessionConnection *)self client];
      v17 = [v20 clientIdentifier];
      v19 = [v6 allKeys];
      v10 = [v19 firstObject];
      v11 = [v6 allValues];
      v12 = [v11 firstObject];
      v13 = [v12 bundleIdentifier];
      uint64_t v14 = [v6 allValues];
      v15 = [v14 firstObject];
      v16 = +[IRLogQEUtility getContextAsString:v15];
      *(_DWORD *)buf = 138413314;
      v22 = v17;
      __int16 v23 = 2112;
      id v24 = v7;
      __int16 v25 = 2112;
      v26 = v10;
      __int16 v27 = 2112;
      v28 = v13;
      __int16 v29 = 2112;
      v30 = v16;
      _os_log_impl(&dword_25418E000, log, OS_LOG_TYPE_DEFAULT, "#session-connection, [%@]:[%@]: didUpdateContexts: [%@][%@]:\n%@", buf, 0x34u);
    }
  }
}

- (int64_t)mode
{
  return self->_mode;
}

- (IRSessionClientProxy)client
{
  return self->_client;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (IRServiceHandling)serviceHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceHandler);

  return (IRServiceHandling *)WeakRetained;
}

- (IRSessionServer)server
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);

  return (IRSessionServer *)WeakRetained;
}

- (IRSessionConnection)initWithServer:(id)a3 client:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IRSessionConnection;
  v8 = [(IRSessionConnection *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(IRSessionConnection *)v8 setServer:v6];
    [(IRSessionConnection *)v9 setClient:v7];
  }

  return v9;
}

- (void)xpcInvalidationHandler
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_25418E000, log, OS_LOG_TYPE_ERROR, "#session-connection, [ErrorId - Unregister error during invalidation] Could not unregister from server", v1, 2u);
}

- (void)_createServiceWithParameters:(id)a3 reply:(id)a4
{
  id v6 = (void *)MEMORY[0x263F50100];
  id v7 = a4;
  id v10 = [(IRSessionConnection *)self client];
  v8 = [v10 clientIdentifier];
  v9 = [v6 serviceTokenForServiceIdentifier:v8];
  (*((void (**)(id, void *, void))a4 + 2))(v7, v9, 0);
}

- (void)_deleteService:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&serviceCreationAndDeletionlock);
  id v4 = [(IRSessionConnection *)self server];
  v5 = [v4 persistenceManager];
  +[IRServiceContainer deleteServiceWithToken:v6 persistenceManager:v5];

  os_unfair_lock_unlock((os_unfair_lock_t)&serviceCreationAndDeletionlock);
}

- (void)_databaseExportwithReply:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void *, void *))a3;
  v5 = [(IRSessionConnection *)self server];
  id v6 = [v5 persistenceManager];
  id v7 = +[IRServiceContainer exportDatabaseWithPersistenceManager:v6];

  if (v7)
  {
    v8 = 0;
  }
  else
  {
    v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F50088];
    uint64_t v12 = *MEMORY[0x263F08338];
    v13[0] = @"Could not export DB";
    objc_super v11 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    v8 = [v9 errorWithDomain:v10 code:-12895 userInfo:v11];
  }
  v4[2](v4, v7, v8);
}

- (void)_deleteDatabaseWithReply:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void *))a3;
  os_unfair_lock_lock((os_unfair_lock_t)&serviceCreationAndDeletionlock);
  v5 = [(IRSessionConnection *)self server];
  id v6 = [v5 persistenceManager];
  BOOL v7 = +[IRServiceContainer deleteDatabaseWithPersistenceManager:v6];

  if (v7)
  {
    v8 = 0;
  }
  else
  {
    v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F08338];
    v12[0] = @"Couldn't delete DB";
    uint64_t v10 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    v8 = [v9 errorWithDomain:*MEMORY[0x263F50088] code:-12896 userInfo:v10];
  }
  v4[2](v4, v8);

  os_unfair_lock_unlock((os_unfair_lock_t)&serviceCreationAndDeletionlock);
}

- (void)_getServiceTokensWithReply:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void *, void *))a3;
  os_unfair_lock_lock((os_unfair_lock_t)&serviceCreationAndDeletionlock);
  v5 = [(IRSessionConnection *)self client];
  id v6 = [v5 clientIdentifier];
  BOOL v7 = [(IRSessionConnection *)self server];
  v8 = [v7 persistenceManager];
  v9 = +[IRServiceContainer getServiceTokensForClientIdentifier:v6 persistenceManager:v8];

  if (v9)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F08338];
    v14[0] = @"Could not get service tokens";
    uint64_t v12 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    uint64_t v10 = [v11 errorWithDomain:*MEMORY[0x263F50088] code:-12897 userInfo:v12];
  }
  v4[2](v4, v9, v10);

  os_unfair_lock_unlock((os_unfair_lock_t)&serviceCreationAndDeletionlock);
}

uint64_t __45__IRSessionConnection__runWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 serviceToken];
  v5 = [v4 serviceIdentifier];
  id v6 = [v3 serviceIdentifier];

  uint64_t v7 = [v5 isEqual:v6];
  return v7;
}

- (void)_updateCandidates:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__IRSessionConnection__updateCandidates___block_invoke;
  v8[3] = &unk_2653A1120;
  id v9 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:v8];

  uint64_t v7 = [(IRSessionConnection *)self serviceHandler];
  [v7 updateCandidates:v6];
}

void __41__IRSessionConnection__updateCandidates___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = +[IRCandidateDO candidateDOFromCandidate:a2];
  [v2 addObject:v3];
}

- (void)_deleteCandidate:(id)a3
{
  id v4 = a3;
  id v6 = [(IRSessionConnection *)self serviceHandler];
  v5 = +[IRCandidateDO candidateDOFromCandidate:v4];

  [v6 deleteCandidate:v5];
}

- (void)_addEvent:(id)a3 forCandidate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(IRSessionConnection *)self serviceHandler];
  v8 = [v7 eventDO];

  id v9 = +[IRCandidateDO candidateDOFromCandidate:v6];

  [v10 addEvent:v8 forCandidate:v9];
}

- (void)_requestCurrentContextWithBundleID:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(IRSessionConnection *)self serviceHandler];
  id v6 = [v5 requestCurrentContextWithBundleID:v4];

  id v7 = [(IRSessionConnection *)self client];
  [v7 _didUpdateContext:v6];

  v8 = (void *)*MEMORY[0x263F500A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F500A0], OS_LOG_TYPE_DEFAULT))
  {
    log = v8;
    v19 = [(IRSessionConnection *)self client];
    id v9 = [v19 clientIdentifier];
    v18 = [v6 allKeys];
    id v10 = [v18 firstObject];
    uint64_t v11 = [v6 allValues];
    uint64_t v12 = [v11 firstObject];
    uint64_t v13 = [v12 bundleIdentifier];
    uint64_t v14 = [v6 allValues];
    v15 = [v14 firstObject];
    v16 = +[IRLogQEUtility getContextAsString:v15];
    *(_DWORD *)buf = 138413314;
    v21 = v9;
    __int16 v22 = 2112;
    __int16 v23 = @"Request";
    __int16 v24 = 2112;
    __int16 v25 = v10;
    __int16 v26 = 2112;
    __int16 v27 = v13;
    __int16 v28 = 2112;
    __int16 v29 = v16;
    _os_log_impl(&dword_25418E000, log, OS_LOG_TYPE_DEFAULT, "#session-connection, [%@]:[%@]: didUpdateContexts: [%@][%@]:\n%@", buf, 0x34u);
  }
}

- (void)_invalidate
{
  id v2 = [(IRSessionConnection *)self client];
  [v2 invalidateXPCConnection];
}

- (void)didUpdateBundlesWithSignificantInteractionPattern:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(IRSessionConnection *)self client];
  [v5 _didUpdateBundlesWithSignificantInteractionPattern:v4];

  id v6 = (void *)*MEMORY[0x263F500A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F500A0], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    v8 = [(IRSessionConnection *)self client];
    id v9 = [v8 clientIdentifier];
    int v10 = 138412546;
    uint64_t v11 = v9;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_25418E000, v7, OS_LOG_TYPE_DEFAULT, "#session-connection, [%@]: Did update bundles: [%@]", (uint8_t *)&v10, 0x16u);
  }
}

- (void)_setSpotOnLocationWithParameters:(id)a3
{
  id v4 = a3;
  id v7 = [(IRSessionConnection *)self serviceHandler];
  v5 = [(IRSessionConnection *)self client];
  id v6 = [v5 clientIdentifier];
  [v7 setSpotOnLocationWithParameters:v4 andClientID:v6];
}

- (void)didSpotOnLocationComplete:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(IRSessionConnection *)self client];
  [v5 _didSpotOnLocationComplete:v4];

  id v6 = (void *)*MEMORY[0x263F500A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F500A0], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    v8 = [(IRSessionConnection *)self client];
    id v9 = [v8 clientIdentifier];
    int v10 = [v4 localizedDescription];
    int v11 = 138412546;
    __int16 v12 = v9;
    __int16 v13 = 2112;
    uint64_t v14 = v10;
    _os_log_impl(&dword_25418E000, v7, OS_LOG_TYPE_DEFAULT, "#session-connection, [%@]: Did Spot On Location Complete with error: [%@]", (uint8_t *)&v11, 0x16u);
  }
}

- (void)setClient:(id)a3
{
}

- (void)setServer:(id)a3
{
}

- (void)setServiceHandler:(id)a3
{
}

- (void)setServiceIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_destroyWeak((id *)&self->_serviceHandler);
  objc_destroyWeak((id *)&self->_server);

  objc_storeStrong((id *)&self->_client, 0);
}

@end