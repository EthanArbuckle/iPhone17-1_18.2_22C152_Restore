@interface BLTRemoteGizmoClient
- (BLTCompanionServer)server;
- (BLTGizmoLegacyMap)gizmoLegacyMap;
- (BLTRemoteGizmoClient)init;
- (void)_handleSyncStateChanged:(id)a3;
- (void)_pingPairedDevice;
- (void)_pingPairedDeviceWithRetry:(unint64_t)a3;
- (void)addBulletin:(id)a3 playLightsAndSirens:(BOOL)a4;
- (void)addBulletin:(id)a3 playLightsAndSirens:(BOOL)a4 updateType:(unint64_t)a5 transmissionDate:(id)a6 receptionDate:(id)a7;
- (void)addBulletin:(id)a3 playLightsAndSirens:(BOOL)a4 updateType:(unint64_t)a5 withTimeout:(id)a6 completion:(id)a7;
- (void)addBulletinSummary:(id)a3;
- (void)cancelBulletinWithPublisherMatchID:(id)a3 universalSectionID:(id)a4 feed:(unint64_t)a5 transmissionDate:(id)a6 receptionDate:(id)a7;
- (void)cancelBulletinWithPublisherMatchID:(id)a3 universalSectionID:(id)a4 feed:(unint64_t)a5 withTimeout:(id)a6;
- (void)dealloc;
- (void)handleAcknowledgeActionRequest:(id)a3;
- (void)handleDidPlayLightsAndSirensReply:(id)a3;
- (void)handleDismissActionRequest:(id)a3;
- (void)handleFileURL:(id)a3 extraMetadata:(id)a4;
- (void)handleHandlePairedDeviceReady:(id)a3;
- (void)handleLaunchSessionActionRequest:(id)a3;
- (void)handleRemoveBulletinRequest:(id)a3;
- (void)handleShouldSuppressLightsAndSirensNowRequest:(id)a3;
- (void)handleSnoozeActionRequest:(id)a3;
- (void)handleSupplementaryActionRequest:(id)a3;
- (void)handleWillSendLightsAndSirensRequest:(id)a3;
- (void)queuePendingRequests;
- (void)registerProtobufHandlers;
- (void)removeBulletinWithPublisherBulletinID:(id)a3 recordID:(id)a4 sectionID:(id)a5;
- (void)removeBulletinWithPublisherBulletinID:(id)a3 recordID:(id)a4 sectionID:(id)a5 withTimeout:(id)a6;
- (void)setGizmoLegacyMap:(id)a3;
- (void)setLastKnownConnectionStatus:(unint64_t)a3;
- (void)setServer:(id)a3;
- (void)updateBulletinList:(id)a3;
@end

@implementation BLTRemoteGizmoClient

- (BLTRemoteGizmoClient)init
{
  v2 = [(BLTRemoteObject *)self initWithServiceName:@"com.apple.private.alloy.bulletindistributor" idsQueueName:"com.apple.bulletindistributor.ids"];
  v3 = v2;
  if (v2)
  {
    [(BLTRemoteObject *)v2 setPairedDeviceReady:0];
    if ([MEMORY[0x263F57700] activePairedDeviceSupportsFileBulletinAdd]) {
      v4 = BLTBulletinSendQueue;
    }
    else {
      v4 = BLTBulletinSendQueuePassthrough;
    }
    v5 = (BLTBulletinSendQueuePassthrough *)objc_alloc_init(v4);
    bulletinSendQueue = v3->_bulletinSendQueue;
    v3->_bulletinSendQueue = v5;

    [(BLTBulletinSendQueuePassthrough *)v3->_bulletinSendQueue setDelegate:v3];
    [(BLTRemoteGizmoClient *)v3 _pingPairedDevice];
    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v3 selector:sel__handleSyncStateChanged_ name:@"BLTPairedSyncStateChanged" object:0];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)BLTRemoteGizmoClient;
  [(BLTRemoteObject *)&v4 dealloc];
}

- (void)registerProtobufHandlers
{
  [(BLTRemoteObject *)self setProtobufAction:sel_handleAcknowledgeActionRequest_ forIncomingRequestsOfType:5];
  [(BLTRemoteObject *)self setProtobufAction:sel_handleSnoozeActionRequest_ forIncomingRequestsOfType:6];
  [(BLTRemoteObject *)self setProtobufAction:sel_handleDismissActionRequest_ forIncomingRequestsOfType:8];
  [(BLTRemoteObject *)self setProtobufAction:sel_handleSupplementaryActionRequest_ forIncomingRequestsOfType:7];
  [(BLTRemoteObject *)self setProtobufAction:sel_handleLaunchSessionActionRequest_ forIncomingRequestsOfType:26];
  [(BLTRemoteObject *)self setProtobufAction:sel_handleDidPlayLightsAndSirensReply_ forIncomingRequestsOfType:9];
  [(BLTRemoteObject *)self setProtobufAction:sel_handleRemoveBulletinRequest_ forIncomingRequestsOfType:10];
  [(BLTRemoteObject *)self setProtobufAction:sel_handleShouldSuppressLightsAndSirensNowRequest_ forIncomingRequestsOfType:16];
  [(BLTRemoteObject *)self setProtobufAction:sel_handleHandlePairedDeviceReady_ forIncomingRequestsOfType:17];
  [(BLTRemoteObject *)self setProtobufAction:sel_handleWillSendLightsAndSirensRequest_ forIncomingRequestsOfType:18];
}

- (void)_handleSyncStateChanged:(id)a3
{
  id v4 = a3;
  v5 = [v4 object];
  int v6 = [v5 becameTrafficUnrestricted:v4];

  if (v6)
  {
    bulletinSendQueue = self->_bulletinSendQueue;
    [(BLTBulletinSendQueuePassthrough *)bulletinSendQueue sendNow];
  }
}

- (void)addBulletin:(id)a3 playLightsAndSirens:(BOOL)a4
{
}

- (void)addBulletin:(id)a3 playLightsAndSirens:(BOOL)a4 updateType:(unint64_t)a5 transmissionDate:(id)a6 receptionDate:(id)a7
{
}

- (void)addBulletin:(id)a3 playLightsAndSirens:(BOOL)a4 updateType:(unint64_t)a5 withTimeout:(id)a6 completion:(id)a7
{
  BOOL v53 = a4;
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v55 = a6;
  id v12 = a7;
  v13 = [MEMORY[0x263EFF910] date];
  [v13 timeIntervalSince1970];
  double v15 = v14;

  v56 = self;
  unint64_t v16 = [(BLTRemoteObject *)self connectionStatus];
  unint64_t v17 = v16 - 1;
  if (v16 == 1)
  {
    v18 = +[BLTPairedSyncCoordinator syncState];
    uint64_t v19 = [v18 isTrafficRestricted];
  }
  else
  {
    uint64_t v19 = 0;
  }
  v20 = blt_ids_log();
  v57 = v12;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v52 = v17 < 2;
    unint64_t v21 = v16 - 1;
    uint64_t v22 = v19;
    int v23 = [v11 hasSummary];
    int v24 = [v11 hasThreadSummary];
    v25 = BLTIDSConnectionStatusString(v16);
    v26 = [v11 publisherMatchID];
    [v11 sectionID];
    v28 = unint64_t v27 = a5;
    *(_DWORD *)buf = 67110658;
    *(_DWORD *)v61 = v23;
    uint64_t v19 = v22;
    unint64_t v17 = v21;
    *(_WORD *)&v61[4] = 1024;
    *(_DWORD *)&v61[6] = v24;
    __int16 v62 = 2080;
    v63 = v25;
    __int16 v64 = 1024;
    int v65 = v19;
    __int16 v66 = 1024;
    BOOL v67 = v52;
    id v12 = v57;
    __int16 v68 = 2112;
    v69 = v26;
    __int16 v70 = 2112;
    v71 = v28;
    _os_log_impl(&dword_222F4C000, v20, OS_LOG_TYPE_DEFAULT, "addBulletin hasSummary=%{BOOL}u hasThreadSummary=%{BOOL}u connectionStatus=%s isTrafficRestricted=%{BOOL}u watchNearby=%{BOOL}u matchID=%@ sectionID=%@", buf, 0x38u);

    a5 = v27;
  }

  if ([v11 hasSummary])
  {
    if (v17 < 2) {
      char v29 = 1;
    }
    else {
      char v29 = v19;
    }
    if (v29)
    {
      uint64_t v30 = 0;
      int v31 = 0;
      goto LABEL_15;
    }
LABEL_14:
    uint64_t v30 = [v11 copy];
    [v11 setSummary:0];
    [v11 setThreadSummary:0];
    int v31 = 1;
    goto LABEL_15;
  }
  int v32 = [v11 hasThreadSummary];
  int v31 = 0;
  uint64_t v30 = 0;
  if (v17 >= 2 && ((v32 ^ 1 | v19) & 1) == 0) {
    goto LABEL_14;
  }
LABEL_15:
  v33 = (void *)v30;
  v34 = [v11 sectionID];
  int v35 = [v34 isEqualToString:@"com.apple.MobileSMS"];

  uint64_t v36 = v35 ^ 1u;
  if (v17 < 2 || ((v35 ^ 1) & 1) != 0)
  {
    uint64_t v39 = v19;
    v37 = objc_alloc_init(BLTPBAddBulletinRequest);
    [(BLTPBAddBulletinRequest *)v37 setBulletin:v11];
    [(BLTPBAddBulletinRequest *)v37 setShouldPlayLightsAndSirens:v53];
    [(BLTPBAddBulletinRequest *)v37 setDate:v15];
    [(BLTPBAddBulletinRequest *)v37 setUpdateType:a5];
    unsigned int v54 = v39;
    [(BLTPBAddBulletinRequest *)v37 setTrafficRestricted:v39];
    v40 = [v11 universalSectionID];
    v41 = v40;
    if (!v40)
    {
      v41 = [v11 sectionID];
    }
    v42 = [(BLTPBAddBulletinRequest *)v37 data];
    uint64_t v43 = [v42 length];
    v44 = [v11 publisherMatchID];
    BLTAnalyticsLogBulletinSize(v41, v43, v44);

    if (!v40) {
    kdebug_trace();
    }
    v58[0] = MEMORY[0x263EF8330];
    v58[1] = 3221225472;
    v58[2] = __90__BLTRemoteGizmoClient_addBulletin_playLightsAndSirens_updateType_withTimeout_completion___block_invoke;
    v58[3] = &unk_2646841B8;
    id v12 = v57;
    id v45 = v57;
    id v59 = v45;
    v46 = (void *)MEMORY[0x223CAC810](v58);
    v38 = v55;
    if (v45) {
      v47 = v46;
    }
    else {
      v47 = 0;
    }
    [(BLTBulletinSendQueuePassthrough *)v56->_bulletinSendQueue sendRequest:v37 withTimeout:v55 isTrafficRestricted:v54 didSend:v47];
  }
  else
  {
    blt_ids_log();
    v37 = (BLTPBAddBulletinRequest *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v37->super.super.super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222F4C000, &v37->super.super.super, OS_LOG_TYPE_DEFAULT, "skipping add bulletin request for messages, it is not needed due to direct push to watch", buf, 2u);
    }
    v38 = v55;
  }
  v48 = v33;

  if (v31)
  {
    v49 = objc_alloc_init(BLTPBIntelligentSummaryBulletinRequest);
    [(BLTPBIntelligentSummaryBulletinRequest *)v49 setBulletin:v48];
    [(BLTPBIntelligentSummaryBulletinRequest *)v49 setUpdateType:v36];
    v50 = blt_ids_log();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      v51 = [(PBCodable *)v49 redact];
      *(_DWORD *)buf = 138412290;
      *(void *)v61 = v51;
      _os_log_impl(&dword_222F4C000, v50, OS_LOG_TYPE_DEFAULT, "sending intelligent summary request %@", buf, 0xCu);
    }
    [(BLTBulletinSendQueuePassthrough *)v56->_bulletinSendQueue sendRequest:v49 withTimeout:&unk_26D607D08 didSend:0];
  }
}

uint64_t __90__BLTRemoteGizmoClient_addBulletin_playLightsAndSirens_updateType_withTimeout_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addBulletinSummary:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_opt_new();
  [v5 setBulletin:v4];

  [(BLTRemoteObject *)self sendRequest:v5 type:3];
}

- (void)cancelBulletinWithPublisherMatchID:(id)a3 universalSectionID:(id)a4 feed:(unint64_t)a5 transmissionDate:(id)a6 receptionDate:(id)a7
{
}

- (void)cancelBulletinWithPublisherMatchID:(id)a3 universalSectionID:(id)a4 feed:(unint64_t)a5 withTimeout:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  double v14 = objc_alloc_init(BLTPBCancelBulletinRequest);
  [(BLTPBCancelBulletinRequest *)v14 setPublisherMatchID:v12];

  [(BLTPBCancelBulletinRequest *)v14 setUniversalSectionID:v11];
  [(BLTPBCancelBulletinRequest *)v14 setFeed:a5];
  v13 = [MEMORY[0x263EFF910] date];
  [v13 timeIntervalSince1970];
  -[BLTPBCancelBulletinRequest setDate:](v14, "setDate:");

  [(BLTRemoteObject *)self sendRequest:v14 type:4 withTimeout:v10 didSend:0];
}

- (void)removeBulletinWithPublisherBulletinID:(id)a3 recordID:(id)a4 sectionID:(id)a5
{
}

- (void)removeBulletinWithPublisherBulletinID:(id)a3 recordID:(id)a4 sectionID:(id)a5 withTimeout:(id)a6
{
  bulletinSendQueue = self->_bulletinSendQueue;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  [(BLTBulletinSendQueuePassthrough *)bulletinSendQueue sendNow];
  unint64_t v16 = objc_alloc_init(BLTPBRemoveBulletinRequest);
  [(BLTPBRemoveBulletinRequest *)v16 setPublisherBulletinID:v14];

  [(BLTPBRemoveBulletinRequest *)v16 setRecordID:v13];
  [(BLTPBRemoveBulletinRequest *)v16 setSectionID:v12];

  double v15 = +[BLTRemoteRequest remoteRequestWithProtobuf:v16 type:2];
  [v15 setTimeout:v11];

  [v15 setNonWaking:1];
  [(BLTRemoteObject *)self sendRequest:v15];
}

- (void)updateBulletinList:(id)a3
{
  id v4 = a3;
  v9 = objc_alloc_init(BLTPBUpdateBulletinListRequest);
  [(BLTPBUpdateBulletinListRequest *)v9 setBulletinList:v4];

  id v5 = NSString;
  int v6 = [(BLTPBUpdateBulletinListRequest *)v9 bulletinList];
  v7 = [v6 sectionBulletinLists];
  v8 = objc_msgSend(v5, "stringWithFormat:", @"BLTPBUpdateBulletinListRequest %lu sections", objc_msgSend(v7, "count"));
  [(BLTRemoteObject *)self sendRequest:v9 type:15 withTimeout:0 withDescription:v8 didSend:0];
}

- (void)setLastKnownConnectionStatus:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BLTRemoteGizmoClient;
  -[BLTRemoteObject setLastKnownConnectionStatus:](&v5, sel_setLastKnownConnectionStatus_);
  if (a3 == 1) {
    [(BLTRemoteGizmoClient *)self _pingPairedDevice];
  }
  else {
    [(BLTRemoteObject *)self setPairedDeviceReady:0];
  }
}

- (void)_pingPairedDevice
{
}

- (void)_pingPairedDeviceWithRetry:(unint64_t)a3
{
  if (a3 <= 2
    && BLTIsDebugOrInternalBuild()
    && [(BLTRemoteObject *)self lastKnownConnectionStatus] == 1)
  {
    objc_super v5 = objc_alloc_init(BLTPBHandlePairedDeviceReady);
    objc_initWeak(&location, self);
    int v6 = +[BLTRemoteRequest remoteRequestWithProtobuf:v5 type:17];
    [v6 setAllowCloudDelivery:0];
    [v6 setUniqueID:@"pingRequest"];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __51__BLTRemoteGizmoClient__pingPairedDeviceWithRetry___block_invoke;
    v7[3] = &unk_2646841E0;
    objc_copyWeak(v8, &location);
    v8[1] = (id)a3;
    [v6 setDidSend:v7];
    [(BLTRemoteObject *)self sendRequest:v6];
    objc_destroyWeak(v8);

    objc_destroyWeak(&location);
  }
}

void __51__BLTRemoteGizmoClient__pingPairedDeviceWithRetry___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _pingPairedDeviceWithRetry:*(void *)(a1 + 40) + 1];
  }
}

- (void)handleAcknowledgeActionRequest:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [BLTPBHandleAcknowledgeActionRequest alloc];
  int v6 = [v4 data];

  v7 = [(BLTPBHandleAcknowledgeActionRequest *)v5 initWithData:v6];
  v8 = blt_ids_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [(PBCodable *)v7 redact];
    *(_DWORD *)buf = 136315394;
    int v32 = "-[BLTRemoteGizmoClient handleAcknowledgeActionRequest:]";
    __int16 v33 = 2112;
    v34 = v9;
    _os_log_impl(&dword_222F4C000, v8, OS_LOG_TYPE_DEFAULT, "Received %s encapsulating %@", buf, 0x16u);
  }
  id v10 = [(BLTPBHandleAcknowledgeActionRequest *)v7 sectionID];
  id v11 = [(BLTPBHandleAcknowledgeActionRequest *)v7 publisherBulletinID];
  if (v11)
  {
    uint64_t v12 = +[BLTBBBulletinKey bulletinKeyWithSectionID:v10 publisherMatchID:v11];
  }
  else
  {
    id v13 = [(BLTPBHandleAcknowledgeActionRequest *)v7 recordID];
    uint64_t v12 = +[BLTBBBulletinKey bulletinKeyWithSectionID:v10 publisherMatchID:v13];
  }
  char v29 = (void *)v12;

  id v14 = [(BLTRemoteGizmoClient *)self gizmoLegacyMap];
  v28 = [v14 phonePublisherBulletinIDForGizmoKey:v12];

  double v15 = [(BLTRemoteGizmoClient *)self gizmoLegacyMap];
  unint64_t v16 = [v15 phoneSectionIDForGizmoKey:v12];

  unint64_t v17 = [BLTActionInfo alloc];
  v18 = [(BLTPBHandleAcknowledgeActionRequest *)v7 recordID];
  [(BLTPBHandleAcknowledgeActionRequest *)v7 actionInfo];
  uint64_t v19 = v7;
  v20 = uint64_t v30 = v7;
  unint64_t v21 = [v20 context];
  uint64_t v22 = [(BLTPBHandleAcknowledgeActionRequest *)v19 actionInfo];
  [v22 contextNulls];
  v24 = int v23 = self;
  v25 = _dictionaryFromPBData(v21, v24);
  v26 = [(BLTActionInfo *)v17 initWithActionType:3 publisherBulletinID:v28 recordID:v18 sectionID:v16 context:v25];

  unint64_t v27 = [(BLTRemoteGizmoClient *)v23 server];
  [v27 handleAction:v26];
}

- (void)handleSnoozeActionRequest:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [BLTPBHandleSnoozeActionRequest alloc];
  int v6 = [v4 data];

  v7 = [(BLTPBHandleSnoozeActionRequest *)v5 initWithData:v6];
  v8 = blt_ids_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [(PBCodable *)v7 redact];
    *(_DWORD *)buf = 136315394;
    int v32 = "-[BLTRemoteGizmoClient handleSnoozeActionRequest:]";
    __int16 v33 = 2112;
    v34 = v9;
    _os_log_impl(&dword_222F4C000, v8, OS_LOG_TYPE_DEFAULT, "Received %s encapsulating %@", buf, 0x16u);
  }
  id v10 = [(BLTPBHandleSnoozeActionRequest *)v7 sectionID];
  id v11 = [(BLTPBHandleSnoozeActionRequest *)v7 publisherBulletinID];
  if (v11)
  {
    uint64_t v12 = +[BLTBBBulletinKey bulletinKeyWithSectionID:v10 publisherMatchID:v11];
  }
  else
  {
    id v13 = [(BLTPBHandleSnoozeActionRequest *)v7 recordID];
    uint64_t v12 = +[BLTBBBulletinKey bulletinKeyWithSectionID:v10 publisherMatchID:v13];
  }
  char v29 = (void *)v12;

  id v14 = [(BLTRemoteGizmoClient *)self gizmoLegacyMap];
  v28 = [v14 phonePublisherBulletinIDForGizmoKey:v12];

  double v15 = [(BLTRemoteGizmoClient *)self gizmoLegacyMap];
  unint64_t v16 = [v15 phoneSectionIDForGizmoKey:v12];

  unint64_t v17 = [BLTActionInfo alloc];
  v18 = [(BLTPBHandleSnoozeActionRequest *)v7 recordID];
  [(BLTPBHandleSnoozeActionRequest *)v7 actionInfo];
  uint64_t v19 = v7;
  v20 = uint64_t v30 = v7;
  unint64_t v21 = [v20 context];
  uint64_t v22 = [(BLTPBHandleSnoozeActionRequest *)v19 actionInfo];
  [v22 contextNulls];
  v24 = int v23 = self;
  v25 = _dictionaryFromPBData(v21, v24);
  v26 = [(BLTActionInfo *)v17 initWithActionType:6 publisherBulletinID:v28 recordID:v18 sectionID:v16 context:v25];

  unint64_t v27 = [(BLTRemoteGizmoClient *)v23 server];
  [v27 handleAction:v26];
}

- (void)handleDismissActionRequest:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [BLTPBHandleDismissActionRequest alloc];
  int v6 = [v4 data];

  v7 = [(BLTPBHandleDismissActionRequest *)v5 initWithData:v6];
  v8 = blt_ids_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [(PBCodable *)v7 redact];
    *(_DWORD *)buf = 136315394;
    int v32 = "-[BLTRemoteGizmoClient handleDismissActionRequest:]";
    __int16 v33 = 2112;
    v34 = v9;
    _os_log_impl(&dword_222F4C000, v8, OS_LOG_TYPE_DEFAULT, "Received %s encapsulating %@", buf, 0x16u);
  }
  id v10 = [(BLTPBHandleDismissActionRequest *)v7 sectionID];
  id v11 = [(BLTPBHandleDismissActionRequest *)v7 publisherBulletinID];
  if (v11)
  {
    uint64_t v12 = +[BLTBBBulletinKey bulletinKeyWithSectionID:v10 publisherMatchID:v11];
  }
  else
  {
    id v13 = [(BLTPBHandleDismissActionRequest *)v7 recordID];
    uint64_t v12 = +[BLTBBBulletinKey bulletinKeyWithSectionID:v10 publisherMatchID:v13];
  }
  char v29 = (void *)v12;

  id v14 = [(BLTRemoteGizmoClient *)self gizmoLegacyMap];
  v28 = [v14 phonePublisherBulletinIDForGizmoKey:v12];

  double v15 = [(BLTRemoteGizmoClient *)self gizmoLegacyMap];
  unint64_t v16 = [v15 phoneSectionIDForGizmoKey:v12];

  unint64_t v17 = [BLTActionInfo alloc];
  v18 = [(BLTPBHandleDismissActionRequest *)v7 recordID];
  [(BLTPBHandleDismissActionRequest *)v7 actionInfo];
  uint64_t v19 = v7;
  v20 = uint64_t v30 = v7;
  unint64_t v21 = [v20 context];
  uint64_t v22 = [(BLTPBHandleDismissActionRequest *)v19 actionInfo];
  [v22 contextNulls];
  v24 = int v23 = self;
  v25 = _dictionaryFromPBData(v21, v24);
  v26 = [(BLTActionInfo *)v17 initWithActionType:8 publisherBulletinID:v28 recordID:v18 sectionID:v16 context:v25];

  unint64_t v27 = [(BLTRemoteGizmoClient *)v23 server];
  [v27 handleAction:v26];
}

- (void)handleSupplementaryActionRequest:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [BLTPBHandleSupplementaryActionRequest alloc];
  int v6 = [v4 data];

  v7 = [(BLTPBHandleSupplementaryActionRequest *)v5 initWithData:v6];
  v8 = blt_ids_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [(PBCodable *)v7 redact];
    *(_DWORD *)buf = 136315394;
    __int16 v33 = "-[BLTRemoteGizmoClient handleSupplementaryActionRequest:]";
    __int16 v34 = 2112;
    uint64_t v35 = v9;
    _os_log_impl(&dword_222F4C000, v8, OS_LOG_TYPE_DEFAULT, "Received %s encapsulating %@", buf, 0x16u);
  }
  id v10 = [(BLTPBHandleSupplementaryActionRequest *)v7 sectionID];
  id v11 = [(BLTPBHandleSupplementaryActionRequest *)v7 publisherBulletinID];
  if (v11)
  {
    uint64_t v12 = +[BLTBBBulletinKey bulletinKeyWithSectionID:v10 publisherMatchID:v11];
  }
  else
  {
    id v13 = [(BLTPBHandleSupplementaryActionRequest *)v7 recordID];
    uint64_t v12 = +[BLTBBBulletinKey bulletinKeyWithSectionID:v10 publisherMatchID:v13];
  }
  int v31 = (void *)v12;

  id v14 = [(BLTRemoteGizmoClient *)self gizmoLegacyMap];
  uint64_t v30 = [v14 phonePublisherBulletinIDForGizmoKey:v12];

  double v15 = [(BLTRemoteGizmoClient *)self gizmoLegacyMap];
  unint64_t v16 = [v15 phoneSectionIDForGizmoKey:v12];

  unint64_t v17 = [BLTSupplementaryActionInfo alloc];
  v18 = [(BLTPBHandleSupplementaryActionRequest *)v7 recordID];
  [(BLTPBHandleSupplementaryActionRequest *)v7 actionInfo];
  uint64_t v19 = v7;
  v20 = char v29 = v7;
  unint64_t v21 = [v20 context];
  uint64_t v22 = [(BLTPBHandleSupplementaryActionRequest *)v19 actionInfo];
  [v22 contextNulls];
  v24 = int v23 = self;
  v25 = _dictionaryFromPBData(v21, v24);
  v26 = [(BLTActionInfo *)v17 initWithActionType:7 publisherBulletinID:v30 recordID:v18 sectionID:v16 context:v25];

  unint64_t v27 = [(BLTPBHandleSupplementaryActionRequest *)v29 identifier];
  [(BLTSupplementaryActionInfo *)v26 setIdentifier:v27];

  v28 = [(BLTRemoteGizmoClient *)v23 server];
  [v28 handleAction:v26];
}

- (void)handleLaunchSessionActionRequest:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [BLTPBHandleLaunchSessionActionRequest alloc];
  int v6 = [v4 data];

  v7 = [(BLTPBHandleLaunchSessionActionRequest *)v5 initWithData:v6];
  v8 = [(BLTPBHandleLaunchSessionActionRequest *)v7 sectionID];
  v9 = [(BLTPBHandleLaunchSessionActionRequest *)v7 publisherBulletinID];
  if (v9)
  {
    uint64_t v10 = +[BLTBBBulletinKey bulletinKeyWithSectionID:v8 publisherMatchID:v9];
  }
  else
  {
    id v11 = [(BLTPBHandleLaunchSessionActionRequest *)v7 recordID];
    uint64_t v10 = +[BLTBBBulletinKey bulletinKeyWithSectionID:v8 publisherMatchID:v11];
  }
  uint64_t v12 = [(BLTRemoteGizmoClient *)self gizmoLegacyMap];
  id v13 = [v12 phonePublisherBulletinIDForGizmoKey:v10];

  id v14 = [(BLTRemoteGizmoClient *)self gizmoLegacyMap];
  char v29 = (void *)v10;
  double v15 = [v14 phoneSectionIDForGizmoKey:v10];

  unint64_t v16 = [BLTActionInfo alloc];
  unint64_t v17 = [(BLTPBHandleLaunchSessionActionRequest *)v7 recordID];
  [(BLTPBHandleLaunchSessionActionRequest *)v7 actionInfo];
  v18 = v28 = self;
  uint64_t v19 = [v18 context];
  v20 = [(BLTPBHandleLaunchSessionActionRequest *)v7 actionInfo];
  unint64_t v21 = [v20 contextNulls];
  uint64_t v22 = _dictionaryFromPBData(v19, v21);
  int v23 = [(BLTActionInfo *)v16 initWithActionType:11 publisherBulletinID:v13 recordID:v17 sectionID:v15 context:v22];

  int v24 = blt_ids_log();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = [(PBCodable *)v7 redact];
    v26 = [(BLTRemoteGizmoClient *)v28 server];
    *(_DWORD *)buf = 138412802;
    int v31 = v25;
    __int16 v32 = 2112;
    __int16 v33 = v23;
    __int16 v34 = 2112;
    uint64_t v35 = v26;
    _os_log_impl(&dword_222F4C000, v24, OS_LOG_TYPE_DEFAULT, "handleLaunchSessionActionRequest: Received request: %@ generated actionInfo: %@ sending to: %@", buf, 0x20u);
  }
  unint64_t v27 = [(BLTRemoteGizmoClient *)v28 server];
  [v27 handleAction:v23];
}

- (void)handleRemoveBulletinRequest:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [BLTPBRemoveBulletinRequest alloc];
  int v6 = [v4 data];

  v7 = [(BLTPBRemoveBulletinRequest *)v5 initWithData:v6];
  v8 = blt_ids_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [(PBCodable *)v7 redact];
    int v20 = 136315394;
    unint64_t v21 = "-[BLTRemoteGizmoClient handleRemoveBulletinRequest:]";
    __int16 v22 = 2112;
    int v23 = v9;
    _os_log_impl(&dword_222F4C000, v8, OS_LOG_TYPE_DEFAULT, "Received %s encapsulating %@", (uint8_t *)&v20, 0x16u);
  }
  uint64_t v10 = [(BLTPBRemoveBulletinRequest *)v7 sectionID];
  id v11 = [(BLTPBRemoveBulletinRequest *)v7 publisherBulletinID];
  if (v11)
  {
    uint64_t v12 = +[BLTBBBulletinKey bulletinKeyWithSectionID:v10 publisherMatchID:v11];
  }
  else
  {
    id v13 = [(BLTPBRemoveBulletinRequest *)v7 recordID];
    uint64_t v12 = +[BLTBBBulletinKey bulletinKeyWithSectionID:v10 publisherMatchID:v13];
  }
  id v14 = [(BLTRemoteGizmoClient *)self gizmoLegacyMap];
  double v15 = [v14 phonePublisherBulletinIDForGizmoKey:v12];

  unint64_t v16 = [(BLTRemoteGizmoClient *)self gizmoLegacyMap];
  unint64_t v17 = [v16 phoneSectionIDForGizmoKey:v12];

  v18 = [(BLTPBRemoveBulletinRequest *)v7 recordID];
  uint64_t v19 = [(BLTRemoteGizmoClient *)self server];
  [v19 removeBulletinWithPublisherBulletinID:v15 recordID:v18 sectionID:v17];
}

- (void)handleDidPlayLightsAndSirensReply:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [BLTPBHandleDidPlayLightsAndSirensReplyRequest alloc];
  int v6 = [v4 data];

  v7 = [(BLTPBHandleDidPlayLightsAndSirensReplyRequest *)v5 initWithData:v6];
  v8 = blt_ids_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [(PBCodable *)v7 redact];
    int v23 = 136315394;
    uint64_t v24 = "-[BLTRemoteGizmoClient handleDidPlayLightsAndSirensReply:]";
    __int16 v25 = 2112;
    v26 = v9;
    _os_log_impl(&dword_222F4C000, v8, OS_LOG_TYPE_DEFAULT, "Received %s encapsulating %@", (uint8_t *)&v23, 0x16u);
  }
  kdebug_trace();
  uint64_t v10 = [(BLTPBHandleDidPlayLightsAndSirensReplyRequest *)v7 didPlayLightsAndSirens];
  id v11 = [(BLTPBHandleDidPlayLightsAndSirensReplyRequest *)v7 phoneSectionID];
  uint64_t v12 = [(BLTPBHandleDidPlayLightsAndSirensReplyRequest *)v7 publisherMatchID];
  id v13 = +[BLTBBBulletinKey bulletinKeyWithSectionID:v11 publisherMatchID:v12];

  id v14 = [(BLTRemoteGizmoClient *)self gizmoLegacyMap];
  double v15 = [v14 phonePublisherBulletinIDForGizmoKey:v13];

  unint64_t v16 = [(BLTRemoteGizmoClient *)self gizmoLegacyMap];
  unint64_t v17 = [v16 phoneSectionIDForGizmoKey:v13];

  v18 = [(BLTPBHandleDidPlayLightsAndSirensReplyRequest *)v7 replyToken];
  uint64_t v19 = [(BLTRemoteGizmoClient *)self server];
  int v20 = (void *)MEMORY[0x263EFF910];
  [(BLTPBHandleDidPlayLightsAndSirensReplyRequest *)v7 date];
  unint64_t v21 = objc_msgSend(v20, "dateWithTimeIntervalSince1970:");
  __int16 v22 = [MEMORY[0x263EFF910] date];
  [v19 handleDidPlayLightsAndSirens:v10 forBulletin:v15 inPhoneSection:v17 transmissionDate:v21 receptionDate:v22 replyToken:v18];
}

- (void)handleHandlePairedDeviceReady:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [BLTPBHandlePairedDeviceReady alloc];
  int v6 = [v4 data];

  v7 = [(BLTPBHandlePairedDeviceReady *)v5 initWithData:v6];
  v8 = blt_ids_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [(PBCodable *)v7 redact];
    int v10 = 136315394;
    id v11 = "-[BLTRemoteGizmoClient handleHandlePairedDeviceReady:]";
    __int16 v12 = 2112;
    id v13 = v9;
    _os_log_impl(&dword_222F4C000, v8, OS_LOG_TYPE_DEFAULT, "Received %s encapsulating %@", (uint8_t *)&v10, 0x16u);
  }
  if ([(BLTRemoteObject *)self lastKnownConnectionStatus] == 1) {
    [(BLTRemoteObject *)self setPairedDeviceReady:1];
  }
}

- (void)handleShouldSuppressLightsAndSirensNowRequest:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [BLTPBShouldSuppressLightsAndSirensNowRequest alloc];
  int v6 = [v4 data];
  v7 = [(BLTPBShouldSuppressLightsAndSirensNowRequest *)v5 initWithData:v6];

  v8 = blt_ids_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [(PBCodable *)v7 redact];
    *(_DWORD *)buf = 136315394;
    uint64_t v14 = "-[BLTRemoteGizmoClient handleShouldSuppressLightsAndSirensNowRequest:]";
    __int16 v15 = 2112;
    unint64_t v16 = v9;
    _os_log_impl(&dword_222F4C000, v8, OS_LOG_TYPE_DEFAULT, "Received %s encapsulating %@", buf, 0x16u);
  }
  int v10 = [(BLTRemoteGizmoClient *)self server];
  uint64_t v11 = [v10 shouldSuppressLightsAndSirensNow];

  __int16 v12 = objc_alloc_init(BLTPBShouldSuppressLightsAndSirensNowResponse);
  [(BLTPBShouldSuppressLightsAndSirensNowResponse *)v12 setShouldSuppress:v11];
  [(BLTRemoteObject *)self sendResponse:v12 type:16 withRequest:v4 withTimeout:0 withDescription:0 onlyOneFor:0 didSend:0];
}

- (void)handleWillSendLightsAndSirensRequest:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [BLTPBWillSendLightsAndSirensRequest alloc];
  int v6 = [v4 data];
  v7 = [(BLTPBWillSendLightsAndSirensRequest *)v5 initWithData:v6];

  v8 = blt_ids_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [(PBCodable *)v7 redact];
    *(_DWORD *)buf = 136315394;
    v28 = "-[BLTRemoteGizmoClient handleWillSendLightsAndSirensRequest:]";
    __int16 v29 = 2112;
    uint64_t v30 = v9;
    _os_log_impl(&dword_222F4C000, v8, OS_LOG_TYPE_DEFAULT, "Received %s encapsulating %@", buf, 0x16u);
  }
  int v10 = [(BLTPBWillSendLightsAndSirensRequest *)v7 sectionID];
  uint64_t v11 = [(BLTPBWillSendLightsAndSirensRequest *)v7 publisherBulletinID];
  if (v11)
  {
    __int16 v12 = +[BLTBBBulletinKey bulletinKeyWithSectionID:v10 publisherMatchID:v11];
  }
  else
  {
    id v13 = [(BLTPBWillSendLightsAndSirensRequest *)v7 recordID];
    __int16 v12 = +[BLTBBBulletinKey bulletinKeyWithSectionID:v10 publisherMatchID:v13];
  }
  uint64_t v14 = [(BLTRemoteGizmoClient *)self gizmoLegacyMap];
  __int16 v15 = [v14 phonePublisherBulletinIDForGizmoKey:v12];

  unint64_t v16 = [(BLTRemoteGizmoClient *)self gizmoLegacyMap];
  uint64_t v17 = [v16 phoneSectionIDForGizmoKey:v12];

  v18 = [(BLTRemoteGizmoClient *)self server];
  uint64_t v19 = [(BLTPBWillSendLightsAndSirensRequest *)v7 recordID];
  uint64_t v20 = [(BLTPBWillSendLightsAndSirensRequest *)v7 systemApp];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __61__BLTRemoteGizmoClient_handleWillSendLightsAndSirensRequest___block_invoke;
  v23[3] = &unk_264684208;
  uint64_t v24 = v7;
  __int16 v25 = self;
  id v26 = v4;
  id v21 = v4;
  __int16 v22 = v7;
  [v18 willSendLightsAndSirensWithPublisherBulletinID:v15 recordID:v19 inPhoneSection:v17 systemApp:v20 completion:v23];
}

void __61__BLTRemoteGizmoClient_handleWillSendLightsAndSirensRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = objc_alloc_init(BLTPBWillSendLightsAndSirensResponse);
  [(BLTPBWillSendLightsAndSirensResponse *)v6 setWillSend:a2];
  if ([*(id *)(a1 + 32) hasSystemApp]) {
    [(BLTPBWillSendLightsAndSirensResponse *)v6 setAdditionalWait:a3];
  }
  [*(id *)(a1 + 40) sendResponse:v6 type:18 withRequest:*(void *)(a1 + 48) withTimeout:0 withDescription:0 onlyOneFor:0 didSend:0];
}

- (void)handleFileURL:(id)a3 extraMetadata:(id)a4
{
}

- (void)queuePendingRequests
{
}

- (BLTCompanionServer)server
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  return (BLTCompanionServer *)WeakRetained;
}

- (void)setServer:(id)a3
{
}

- (BLTGizmoLegacyMap)gizmoLegacyMap
{
  return self->_gizmoLegacyMap;
}

- (void)setGizmoLegacyMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gizmoLegacyMap, 0);
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong((id *)&self->_gizmoToPhonePublisherBulletinIDMap, 0);
  objc_storeStrong((id *)&self->_bulletinSendQueue, 0);
}

@end