@interface BAAgentClientProxy
- (BOOL)cancelDownload:(void *)a3 error:;
- (BOOL)markPurgeableWithFileURL:(void *)a3 error:;
- (BOOL)scheduleDownload:(void *)a3 error:;
- (BOOL)startForegroundDownload:(void *)a3 error:;
- (id)currentDownloads:(id *)a1;
- (id)initWithApplicationIdentifier:(void *)a3 downloadManager:;
- (uint64_t)_setupConnection;
- (void)_exclusiveControlEndedWithToken:(id *)a1;
- (void)acquireExclusiveControlBeforeDate:(void *)a3 handler:;
- (void)acquireExclusiveControlWithHandler:(id *)a1;
- (void)currentDownloadsWithCompletion:(id *)a1;
@end

@implementation BAAgentClientProxy

- (id)initWithApplicationIdentifier:(void *)a3 downloadManager:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)BAAgentClientProxy;
    a1 = (id *)objc_msgSendSuper2(&v13, sel_init);
    if (a1)
    {
      v7 = objc_msgSend(v5, "_baassets_validUTI");
      if ([v7 isEqualToString:v5])
      {
        objc_setProperty_atomic(a1, v8, v5, 16);
        objc_storeWeak(a1 + 4, v6);
        id v9 = objc_alloc_init(MEMORY[0x263F08958]);
        objc_setProperty_atomic(a1, v10, v9, 24);

        [(BAAgentClientProxy *)a1 _setupConnection];
      }
      else
      {

        v7 = a1;
        a1 = 0;
      }
    }
  }

  return a1;
}

- (uint64_t)_setupConnection
{
  v96[4] = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  objc_msgSend(objc_getProperty(a1, a2, 24, 1), "lock");
  if (objc_getProperty(a1, v3, 8, 1))
  {
    uint64_t v5 = 1;
    objc_msgSend(objc_getProperty(a1, v4, 24, 1), "unlock");
    return v5;
  }
  id v6 = objc_alloc(MEMORY[0x263F08D68]);
  v7 = (void *)[v6 initWithMachServiceName:kBackgroundAssetsAgentMachServiceName options:0];
  objc_setProperty_atomic(a1, v8, v7, 8);

  if (!objc_getProperty(a1, v9, 8, 1))
  {
    objc_msgSend(objc_getProperty(a1, v10, 24, 1), "unlock");
    return 0;
  }
  v11 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DAFC6D0];
  v12 = (void *)MEMORY[0x263EFFA08];
  v96[0] = objc_opt_class();
  v96[1] = objc_opt_class();
  v96[2] = objc_opt_class();
  v96[3] = objc_opt_class();
  objc_super v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v96 count:4];
  v14 = [v12 setWithArray:v13];
  [v11 setClasses:v14 forSelector:NSSelectorFromString(&cfstr_Currentdownloa.isa) argumentIndex:0 ofReply:1];

  v15 = (void *)MEMORY[0x263EFFA08];
  uint64_t v95 = objc_opt_class();
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v95 count:1];
  v17 = [v15 setWithArray:v16];
  [v11 setClasses:v17 forSelector:NSSelectorFromString(&cfstr_Performwithexc.isa) argumentIndex:0 ofReply:0];

  v18 = (void *)MEMORY[0x263EFFA08];
  v94[0] = objc_opt_class();
  v94[1] = objc_opt_class();
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v94 count:2];
  v20 = [v18 setWithArray:v19];
  [v11 setClasses:v20 forSelector:NSSelectorFromString(&cfstr_Scheduledownlo.isa) argumentIndex:0 ofReply:0];

  v21 = (void *)MEMORY[0x263EFFA08];
  v93[0] = objc_opt_class();
  v93[1] = objc_opt_class();
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v93 count:2];
  v23 = [v21 setWithArray:v22];
  [v11 setClasses:v23 forSelector:NSSelectorFromString(&cfstr_Startforegroun.isa) argumentIndex:0 ofReply:0];

  objc_msgSend(objc_getProperty(a1, v24, 8, 1), "setRemoteObjectInterface:", v11);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);

  if (WeakRetained)
  {
    v26 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DAFB160];
    v27 = (void *)MEMORY[0x263EFFA08];
    v92[0] = objc_opt_class();
    v92[1] = objc_opt_class();
    v92[2] = objc_opt_class();
    v92[3] = objc_opt_class();
    v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v92 count:4];
    v29 = [v27 setWithArray:v28];
    [v26 setClasses:v29 forSelector:sel_syncDownloads_ argumentIndex:0 ofReply:0];

    v30 = (void *)MEMORY[0x263EFFA08];
    uint64_t v91 = objc_opt_class();
    v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v91 count:1];
    v32 = [v30 setWithArray:v31];
    [v26 setClasses:v32 forSelector:sel_removeDownloadIdentifier_ argumentIndex:0 ofReply:0];

    v33 = (void *)MEMORY[0x263EFFA08];
    uint64_t v90 = objc_opt_class();
    v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v90 count:1];
    v35 = [v33 setWithArray:v34];
    [v26 setClasses:v35 forSelector:sel_downloadIdentifierDidBegin_ argumentIndex:0 ofReply:0];

    v36 = (void *)MEMORY[0x263EFFA08];
    uint64_t v89 = objc_opt_class();
    v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v89 count:1];
    v38 = [v36 setWithArray:v37];
    [v26 setClasses:v38 forSelector:sel_downloadIdentifierDidPause_ argumentIndex:0 ofReply:0];

    v39 = (void *)MEMORY[0x263EFFA08];
    uint64_t v88 = objc_opt_class();
    v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v88 count:1];
    v41 = [v39 setWithArray:v40];
    [v26 setClasses:v41 forSelector:sel_downloadIdentifier_didWriteBytes_totalBytesWritten_totalBytesExpectedToWrite_ argumentIndex:0 ofReply:0];

    v42 = (void *)MEMORY[0x263EFFA08];
    uint64_t v87 = objc_opt_class();
    v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v87 count:1];
    v44 = [v42 setWithArray:v43];
    [v26 setClasses:v44 forSelector:sel_downloadIdentifier_didReceiveChallenge_authChallengeHandler_ argumentIndex:0 ofReply:0];

    v45 = (void *)MEMORY[0x263EFFA08];
    uint64_t v86 = objc_opt_class();
    v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v86 count:1];
    v47 = [v45 setWithArray:v46];
    [v26 setClasses:v47 forSelector:sel_downloadIdentifier_didReceiveChallenge_authChallengeHandler_ argumentIndex:1 ofReply:0];

    v48 = (void *)MEMORY[0x263EFFA08];
    uint64_t v85 = objc_opt_class();
    v49 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v85 count:1];
    v50 = [v48 setWithArray:v49];
    [v26 setClasses:v50 forSelector:sel_downloadIdentifier_didReceiveChallenge_authChallengeHandler_ argumentIndex:1 ofReply:1];

    v51 = (void *)MEMORY[0x263EFFA08];
    uint64_t v84 = objc_opt_class();
    v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v84 count:1];
    v53 = [v51 setWithArray:v52];
    [v26 setClasses:v53 forSelector:sel_downloadIdentifier_didFailWithError_wasHandled_ argumentIndex:0 ofReply:0];

    v54 = (void *)MEMORY[0x263EFFA08];
    uint64_t v83 = objc_opt_class();
    v55 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v83 count:1];
    v56 = [v54 setWithArray:v55];
    [v26 setClasses:v56 forSelector:sel_downloadIdentifier_didFailWithError_wasHandled_ argumentIndex:1 ofReply:0];

    v57 = (void *)MEMORY[0x263EFFA08];
    uint64_t v82 = objc_opt_class();
    v58 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v82 count:1];
    v59 = [v57 setWithArray:v58];
    [v26 setClasses:v59 forSelector:sel_downloadIdentifierDidFinish_sandboxExtensionToken_wasHandled_ argumentIndex:0 ofReply:0];

    v60 = (void *)MEMORY[0x263EFFA08];
    uint64_t v81 = objc_opt_class();
    v61 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v81 count:1];
    v62 = [v60 setWithArray:v61];
    [v26 setClasses:v62 forSelector:sel_downloadIdentifierDidFinish_sandboxExtensionToken_wasHandled_ argumentIndex:1 ofReply:0];

    objc_msgSend(objc_getProperty(a1, v63, 8, 1), "setExportedInterface:", v26);
    id v65 = objc_getProperty(a1, v64, 8, 1);
    id v66 = objc_loadWeakRetained(a1 + 4);
    [v65 setExportedObject:v66];
  }
  objc_initWeak(&location, a1);
  id v68 = objc_getProperty(a1, v67, 8, 1);
  v78[0] = MEMORY[0x263EF8330];
  v78[1] = 3221225472;
  v78[2] = __38__BAAgentClientProxy__setupConnection__block_invoke;
  v78[3] = &unk_2647E8D40;
  objc_copyWeak(&v79, &location);
  [v68 setInterruptionHandler:v78];

  id v70 = objc_getProperty(a1, v69, 8, 1);
  v76[0] = MEMORY[0x263EF8330];
  v76[1] = 3221225472;
  v76[2] = __38__BAAgentClientProxy__setupConnection__block_invoke_2;
  v76[3] = &unk_2647E8D40;
  objc_copyWeak(&v77, &location);
  [v70 setInvalidationHandler:v76];

  id v72 = objc_getProperty(a1, v71, 8, 1);
  [v72 resume];

  id v74 = objc_getProperty(a1, v73, 24, 1);
  [v74 unlock];

  objc_destroyWeak(&v77);
  objc_destroyWeak(&v79);
  objc_destroyWeak(&location);

  return 1;
}

void __38__BAAgentClientProxy__setupConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_setProperty_atomic(WeakRetained, v2, 0, 8);
    id WeakRetained = v3;
  }
}

void __38__BAAgentClientProxy__setupConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_setProperty_atomic(WeakRetained, v2, 0, 8);
    id WeakRetained = v3;
  }
}

- (void)currentDownloadsWithCompletion:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    [(BAAgentClientProxy *)a1 _setupConnection];
    id Property = objc_getProperty(a1, v5, 8, 1);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __53__BAAgentClientProxy_currentDownloadsWithCompletion___block_invoke;
    v11[3] = &unk_2647E8D68;
    id v7 = v4;
    id v12 = v7;
    SEL v8 = [Property remoteObjectProxyWithErrorHandler:v11];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __53__BAAgentClientProxy_currentDownloadsWithCompletion___block_invoke_108;
    v9[3] = &unk_2647E8D90;
    id v10 = v7;
    [v8 currentDownloads:v9];
  }
}

void __53__BAAgentClientProxy_currentDownloadsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = BAClientLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __53__BAAgentClientProxy_currentDownloadsWithCompletion___block_invoke_cold_1(v3);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __53__BAAgentClientProxy_currentDownloadsWithCompletion___block_invoke_108(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)currentDownloads:(id *)a1
{
  if (a1)
  {
    [(BAAgentClientProxy *)a1 _setupConnection];
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__0;
    v21 = __Block_byref_object_dispose__0;
    id v22 = 0;
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__0;
    v15 = __Block_byref_object_dispose__0;
    id v16 = 0;
    id v5 = objc_getProperty(a1, v4, 8, 1);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __39__BAAgentClientProxy_currentDownloads___block_invoke;
    v10[3] = &unk_2647E8DB8;
    v10[4] = &v17;
    id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v10];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __39__BAAgentClientProxy_currentDownloads___block_invoke_110;
    v9[3] = &unk_2647E8DE0;
    void v9[4] = &v17;
    v9[5] = &v11;
    [v6 currentDownloads:v9];

    if (a2) {
      *(void *)a2 = (id) v18[5];
    }
    id v7 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __39__BAAgentClientProxy_currentDownloads___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  SEL v4 = BAClientLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __39__BAAgentClientProxy_currentDownloads___block_invoke_cold_1(v3);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __39__BAAgentClientProxy_currentDownloads___block_invoke_110(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    SEL v8 = v5;
  }
  else
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    SEL v8 = v11;
  }
  id v9 = v8;
  id v10 = *v7;
  void *v7 = v9;
}

- (BOOL)scheduleDownload:(void *)a3 error:
{
  id v6 = a2;
  if (a1)
  {
    [(BAAgentClientProxy *)a1 _setupConnection];
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__0;
    id v22 = __Block_byref_object_dispose__0;
    id v23 = 0;
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    id v8 = objc_getProperty(a1, v7, 8, 1);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __45__BAAgentClientProxy_scheduleDownload_error___block_invoke;
    v13[3] = &unk_2647E8DB8;
    v13[4] = &v18;
    id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v13];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __45__BAAgentClientProxy_scheduleDownload_error___block_invoke_111;
    v12[3] = &unk_2647E8CC8;
    v12[4] = &v14;
    v12[5] = &v18;
    [v9 scheduleDownload:v6 reply:v12];

    if (a3) {
      *a3 = (id) v19[5];
    }
    BOOL v10 = *((unsigned char *)v15 + 24) != 0;
    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

void __45__BAAgentClientProxy_scheduleDownload_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  SEL v4 = BAClientLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __45__BAAgentClientProxy_scheduleDownload_error___block_invoke_cold_1(v3);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __45__BAAgentClientProxy_scheduleDownload_error___block_invoke_111(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)acquireExclusiveControlWithHandler:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    [(BAAgentClientProxy *)a1 _setupConnection];
    id Property = objc_getProperty(a1, v5, 8, 1);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __57__BAAgentClientProxy_acquireExclusiveControlWithHandler___block_invoke;
    v11[3] = &unk_2647E8D68;
    id v7 = v4;
    id v12 = v7;
    id v8 = [Property remoteObjectProxyWithErrorHandler:v11];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __57__BAAgentClientProxy_acquireExclusiveControlWithHandler___block_invoke_113;
    v9[3] = &unk_2647E8E08;
    void v9[4] = a1;
    id v10 = v7;
    [v8 performWithExclusiveControlWithHandler:v9];
  }
}

void __57__BAAgentClientProxy_acquireExclusiveControlWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = BAClientLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __57__BAAgentClientProxy_acquireExclusiveControlWithHandler___block_invoke_cold_1(v3);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __57__BAAgentClientProxy_acquireExclusiveControlWithHandler___block_invoke_113(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  SEL v5 = v6;
  if (v6)
  {
    -[BAAgentClientProxy _exclusiveControlEndedWithToken:](*(id **)(a1 + 32), v6);
    SEL v5 = v6;
  }
}

- (void)_exclusiveControlEndedWithToken:(id *)a1
{
  if (a1)
  {
    id v3 = a2;
    [(BAAgentClientProxy *)a1 _setupConnection];
    objc_msgSend(objc_getProperty(a1, v5, 8, 1), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v6 exclusiveControlExitedWithToken:v3];
  }
}

- (void)acquireExclusiveControlBeforeDate:(void *)a3 handler:
{
  id v5 = a3;
  if (a1)
  {
    id v6 = a2;
    [(BAAgentClientProxy *)a1 _setupConnection];
    id Property = objc_getProperty(a1, v8, 8, 1);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __64__BAAgentClientProxy_acquireExclusiveControlBeforeDate_handler___block_invoke;
    v14[3] = &unk_2647E8D68;
    id v10 = v5;
    id v15 = v10;
    id v11 = [Property remoteObjectProxyWithErrorHandler:v14];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __64__BAAgentClientProxy_acquireExclusiveControlBeforeDate_handler___block_invoke_115;
    v12[3] = &unk_2647E8E08;
    v12[4] = a1;
    id v13 = v10;
    [v11 performWithExclusiveControlBeforeDate:v6 handler:v12];
  }
}

void __64__BAAgentClientProxy_acquireExclusiveControlBeforeDate_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = BAClientLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __64__BAAgentClientProxy_acquireExclusiveControlBeforeDate_handler___block_invoke_cold_1(v3);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__BAAgentClientProxy_acquireExclusiveControlBeforeDate_handler___block_invoke_115(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v5 = v6;
  if (v6)
  {
    -[BAAgentClientProxy _exclusiveControlEndedWithToken:](*(id **)(a1 + 32), v6);
    id v5 = v6;
  }
}

void __54__BAAgentClientProxy__exclusiveControlEndedWithToken___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = BAClientLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __54__BAAgentClientProxy__exclusiveControlEndedWithToken___block_invoke_cold_1(v2);
  }
}

- (BOOL)startForegroundDownload:(void *)a3 error:
{
  id v6 = a2;
  if (a1)
  {
    [(BAAgentClientProxy *)a1 _setupConnection];
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x3032000000;
    char v17 = __Block_byref_object_copy__0;
    uint64_t v18 = __Block_byref_object_dispose__0;
    id v19 = 0;
    id v8 = objc_getProperty(a1, v7, 8, 1);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __52__BAAgentClientProxy_startForegroundDownload_error___block_invoke;
    v13[3] = &unk_2647E8DB8;
    v13[4] = &v14;
    id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v13];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __52__BAAgentClientProxy_startForegroundDownload_error___block_invoke_116;
    v12[3] = &unk_2647E8CC8;
    v12[4] = &v14;
    void v12[5] = &v20;
    [v9 startForegroundDownload:v6 reply:v12];

    if (a3) {
      *a3 = (id) v15[5];
    }
    BOOL v10 = *((unsigned char *)v21 + 24) != 0;
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

void __52__BAAgentClientProxy_startForegroundDownload_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = BAClientLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __52__BAAgentClientProxy_startForegroundDownload_error___block_invoke_cold_1(v3);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __52__BAAgentClientProxy_startForegroundDownload_error___block_invoke_116(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (BOOL)cancelDownload:(void *)a3 error:
{
  id v6 = a2;
  if (a1)
  {
    [(BAAgentClientProxy *)a1 _setupConnection];
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x3032000000;
    uint64_t v18 = __Block_byref_object_copy__0;
    id v19 = __Block_byref_object_dispose__0;
    id v20 = 0;
    id v8 = objc_getProperty(a1, v7, 8, 1);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __43__BAAgentClientProxy_cancelDownload_error___block_invoke;
    v14[3] = &unk_2647E8DB8;
    void v14[4] = &v15;
    id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v14];
    BOOL v10 = [v6 uniqueIdentifier];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __43__BAAgentClientProxy_cancelDownload_error___block_invoke_117;
    v13[3] = &unk_2647E8CC8;
    v13[4] = &v21;
    void v13[5] = &v15;
    [v9 cancelDownload:v10 reply:v13];

    if (a3) {
      *a3 = (id) v16[5];
    }
    BOOL v11 = *((unsigned char *)v22 + 24) != 0;
    _Block_object_dispose(&v15, 8);

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

void __43__BAAgentClientProxy_cancelDownload_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = BAClientLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __43__BAAgentClientProxy_cancelDownload_error___block_invoke_cold_1(v3);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __43__BAAgentClientProxy_cancelDownload_error___block_invoke_117(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)markPurgeableWithFileURL:(void *)a3 error:
{
  v35[1] = *MEMORY[0x263EF8340];
  id v6 = a2;
  if (!a1) {
    goto LABEL_13;
  }
  [(BAAgentClientProxy *)a1 _setupConnection];
  id v7 = v6;
  [v7 fileSystemRepresentation];
  id Property = objc_getProperty(a1, v8, 8, 1);
  if (Property)
  {
    [Property auditToken];
  }
  else
  {
    long long v32 = 0u;
    long long v33 = 0u;
  }
  BOOL v10 = (void *)sandbox_extension_issue_file_to_process();
  if (v10)
  {
    BOOL v11 = [NSString stringWithUTF8String:v10];
    free(v10);
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2020000000;
    char v31 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__0;
    v26 = __Block_byref_object_dispose__0;
    id v27 = 0;
    id v13 = objc_getProperty(a1, v12, 8, 1);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __53__BAAgentClientProxy_markPurgeableWithFileURL_error___block_invoke;
    v21[3] = &unk_2647E8DB8;
    v21[4] = &v22;
    uint64_t v14 = [v13 synchronousRemoteObjectProxyWithErrorHandler:v21];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __53__BAAgentClientProxy_markPurgeableWithFileURL_error___block_invoke_122;
    v20[3] = &unk_2647E8CC8;
    v20[4] = &v28;
    v20[5] = &v22;
    [v14 markPurgeableWithFileURL:v7 sandboxToken:v11 reply:v20];

    if (a3) {
      *a3 = (id) v23[5];
    }
    BOOL v15 = *((unsigned char *)v29 + 24) != 0;
    _Block_object_dispose(&v22, 8);

    _Block_object_dispose(&v28, 8);
    goto LABEL_11;
  }
  if (!a3)
  {
LABEL_13:
    BOOL v15 = 0;
    goto LABEL_12;
  }
  uint64_t v16 = (void *)MEMORY[0x263F087E8];
  uint64_t v17 = *__error();
  v34 = @"FileURL";
  v35[0] = v7;
  uint64_t v18 = [NSDictionary dictionaryWithObjects:v35 forKeys:&v34 count:1];
  BOOL v11 = [v16 errorWithDomain:*MEMORY[0x263F08438] code:v17 userInfo:v18];

  NSErrorWithBAErrorDomainCodeUnderlying(@"BAErrorDomain", -107, v11);
  BOOL v15 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

LABEL_12:
  return v15;
}

void __53__BAAgentClientProxy_markPurgeableWithFileURL_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = BAClientLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __53__BAAgentClientProxy_markPurgeableWithFileURL_error___block_invoke_cold_1(v3);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __53__BAAgentClientProxy_markPurgeableWithFileURL_error___block_invoke_122(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connectionGuard, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

void __53__BAAgentClientProxy_currentDownloadsWithCompletion___block_invoke_cold_1(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_226E14000, v2, v3, "Message failed: %{public}s error: %{public}@", v4, v5, v6, v7, 2u);
}

void __39__BAAgentClientProxy_currentDownloads___block_invoke_cold_1(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_226E14000, v2, v3, "Message failed: %{public}s error: %{public}@", v4, v5, v6, v7, 2u);
}

void __45__BAAgentClientProxy_scheduleDownload_error___block_invoke_cold_1(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_226E14000, v2, v3, "Message failed: %{public}s error: %{public}@", v4, v5, v6, v7, 2u);
}

void __57__BAAgentClientProxy_acquireExclusiveControlWithHandler___block_invoke_cold_1(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_226E14000, v2, v3, "Message failed: %{public}s error: %{public}@", v4, v5, v6, v7, 2u);
}

void __64__BAAgentClientProxy_acquireExclusiveControlBeforeDate_handler___block_invoke_cold_1(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_226E14000, v2, v3, "Message failed: %{public}s error: %{public}@", v4, v5, v6, v7, 2u);
}

void __54__BAAgentClientProxy__exclusiveControlEndedWithToken___block_invoke_cold_1(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_226E14000, v2, v3, "Message failed: %{public}s error: %{public}@", v4, v5, v6, v7, 2u);
}

void __52__BAAgentClientProxy_startForegroundDownload_error___block_invoke_cold_1(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_226E14000, v2, v3, "Message failed: %{public}s error: %{public}@", v4, v5, v6, v7, 2u);
}

void __43__BAAgentClientProxy_cancelDownload_error___block_invoke_cold_1(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_226E14000, v2, v3, "Message failed: %{public}s error: %{public}@", v4, v5, v6, v7, 2u);
}

void __53__BAAgentClientProxy_markPurgeableWithFileURL_error___block_invoke_cold_1(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_226E14000, v2, v3, "Message failed: %{public}s error: %{public}@", v4, v5, v6, v7, 2u);
}

@end