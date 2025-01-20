@interface BLTSettingSyncServer
- (BLTPreviouslySentMessageStore)sectionInfoPreviouslySentMessageStore;
- (BLTPreviouslySentMessageStore)sectionSubtypeParametersIconsPreviouslySentMessageStore;
- (BLTSettingSyncServer)init;
- (BLTSettingSyncingClient)delegate;
- (BOOL)isSectionInfoSentCacheEmpty;
- (void)clearSectionInfoSentCache;
- (void)handleFileURL:(id)a3 extraMetadata:(id)a4;
- (void)handleRemoveSectionRequest:(id)a3;
- (void)handleSetNotificationsAlertLevelRequest:(id)a3;
- (void)handleSetNotificationsCriticalAlertRequest:(id)a3;
- (void)handleSetNotificationsGroupingRequest:(id)a3;
- (void)handleSetNotificationsSoundRequest:(id)a3;
- (void)handleSetRemoteGlobalSettingsRequest:(id)a3;
- (void)handleSetRemoteGlobalSpokenSettingEnabledRequest:(id)a3;
- (void)handleSetSectionInfoRequest:(id)a3;
- (void)handleSetSectionSubtypeParametersIconRequest:(id)a3;
- (void)handleSetSectionSubtypeParametersIconResponse:(id)a3;
- (void)registerProtobufHandlers;
- (void)remoteGlobalSettingsSyncServer:(id)a3 sendChangeset:(id)a4;
- (void)removeSectionInfoSentCacheForSectionID:(id)a3;
- (void)removeSectionWithSectionID:(id)a3;
- (void)removeSectionWithSectionID:(id)a3 sent:(id)a4;
- (void)sendRemoteGlobalSpokenSettingEnabled:(BOOL)a3 date:(id)a4;
- (void)sendSpooledRequestsNowWithSent:(id)a3 withAcknowledgement:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setNotificationsCriticalAlertEnabled:(int)a3 sectionID:(id)a4;
- (void)setNotificationsGrouping:(int)a3 sectionID:(id)a4;
- (void)setNotificationsGrouping:(int)a3 sectionID:(id)a4 spoolToFile:(BOOL)a5;
- (void)setNotificationsLevel:(unint64_t)a3 sectionID:(id)a4 mirror:(BOOL)a5;
- (void)setNotificationsLevel:(unint64_t)a3 sectionID:(id)a4 mirror:(BOOL)a5 spoolToFile:(BOOL)a6;
- (void)setNotificationsSoundEnabled:(int)a3 sectionID:(id)a4;
- (void)setSectionInfo:(id)a3 completion:(id)a4;
- (void)setSectionInfo:(id)a3 withSent:(id)a4 withAcknowledgement:(id)a5 keypaths:(id)a6 spoolToFile:(BOOL)a7;
- (void)setSectionInfoPreviouslySentMessageStore:(id)a3;
- (void)setSectionSubtypeParametersIcon:(id)a3 forSectionID:(id)a4 forSubtypeID:(int64_t)a5;
- (void)setSectionSubtypeParametersIcon:(id)a3 forSectionID:(id)a4 forSubtypeID:(int64_t)a5 withQueue:(id)a6 withSent:(id)a7 withAcknowledgement:(id)a8 spoolToFile:(BOOL)a9;
- (void)setSectionSubtypeParametersIconsPreviouslySentMessageStore:(id)a3;
@end

@implementation BLTSettingSyncServer

- (BLTSettingSyncServer)init
{
  v2 = [(BLTRemoteObject *)self initWithServiceName:@"com.apple.private.alloy.bulletindistributor.settings" idsQueueName:"com.apple.bulletindistributor.settingsync"];
  if (v2)
  {
    if ([MEMORY[0x263F57700] activePairedDeviceSupportsFileSettingSync]) {
      v3 = BLTSettingsSendSerializer;
    }
    else {
      v3 = BLTSettingsSendSerializerPassthrough;
    }
    v4 = (BLTSettingsSendSerializerPassthrough *)objc_alloc_init(v3);
    settingSendSerializer = v2->_settingSendSerializer;
    v2->_settingSendSerializer = v4;

    [(BLTSettingsSendSerializerPassthrough *)v2->_settingSendSerializer setDelegate:v2];
    v6 = [MEMORY[0x263F57730] sharedInstance];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __28__BLTSettingSyncServer_init__block_invoke;
    v8[3] = &unk_264683F70;
    v9 = v2;
    [v6 waitForPairingStorePathPairingID:v8];
  }
  return v2;
}

void __28__BLTSettingSyncServer_init__block_invoke(uint64_t a1, void *a2)
{
  v21[1] = *MEMORY[0x263EF8340];
  v3 = [a2 stringByAppendingPathComponent:@"BulletinDistributor"];
  v4 = [MEMORY[0x263F08850] defaultManager];
  char v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    v7 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v20 = *MEMORY[0x263F080A8];
    v21[0] = *MEMORY[0x263F080B0];
    v8 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
    id v19 = 0;
    char v9 = [v7 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:v8 error:&v19];
    id v6 = v19;

    if ((v9 & 1) == 0)
    {
      v10 = blt_settings_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __28__BLTSettingSyncServer_init__block_invoke_cold_1((uint64_t)v3, v10);
      }
    }
  }
  v11 = [v3 stringByAppendingPathComponent:@"PreviouslySentSettingSyncMessageStore.plist"];
  v12 = [[BLTPreviouslySentMessageStore alloc] initWithMessageStorePath:v11];
  uint64_t v13 = *(void *)(a1 + 32);
  v14 = *(void **)(v13 + 168);
  *(void *)(v13 + 168) = v12;

  v15 = [v3 stringByAppendingPathComponent:@"PreviouslySentSectionSubtypeParameterIconsMessageStore.plist"];

  v16 = [[BLTPreviouslySentMessageStore alloc] initWithMessageStorePath:v15];
  uint64_t v17 = *(void *)(a1 + 32);
  v18 = *(void **)(v17 + 176);
  *(void *)(v17 + 176) = v16;
}

- (void)handleFileURL:(id)a3 extraMetadata:(id)a4
{
}

- (void)registerProtobufHandlers
{
  [(BLTRemoteObject *)self setProtobufAction:sel_handleSetSectionInfoRequest_ forIncomingRequestsOfType:13];
  [(BLTRemoteObject *)self setProtobufAction:sel_handleSetSectionSubtypeParametersIconRequest_ forIncomingRequestsOfType:14];
  [(BLTRemoteObject *)self setProtobufAction:sel_handleRemoveSectionRequest_ forIncomingRequestsOfType:19];
  [(BLTRemoteObject *)self setProtobufAction:sel_handleSetNotificationsAlertLevelRequest_ forIncomingRequestsOfType:20];
  [(BLTRemoteObject *)self setProtobufAction:sel_handleSetNotificationsGroupingRequest_ forIncomingRequestsOfType:21];
  [(BLTRemoteObject *)self setProtobufAction:sel_handleSetNotificationsSoundRequest_ forIncomingRequestsOfType:22];
  [(BLTRemoteObject *)self setProtobufAction:sel_handleSetNotificationsCriticalAlertRequest_ forIncomingRequestsOfType:23];
  [(BLTRemoteObject *)self setProtobufAction:sel_handleSetRemoteGlobalSpokenSettingEnabledRequest_ forIncomingRequestsOfType:24];
  [(BLTRemoteObject *)self setProtobufAction:sel_handleSetRemoteGlobalSettingsRequest_ forIncomingRequestsOfType:25];
  [(BLTRemoteObject *)self setProtobufAction:sel_handleSetSectionInfoResponse_ forIncomingResponsesOfType:13];
  [(BLTRemoteObject *)self setProtobufAction:sel_handleSetSectionSubtypeParametersIconResponse_ forIncomingResponsesOfType:14];
}

- (void)setSectionInfo:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __assert_rtn("-[BLTSettingSyncServer setSectionInfo:completion:]", "BLTSettingSyncServer.m", 144, "0");
}

- (void)setSectionInfo:(id)a3 withSent:(id)a4 withAcknowledgement:(id)a5 keypaths:(id)a6 spoolToFile:(BOOL)a7
{
  HIDWORD(v40) = a7;
  location[2] = *(id *)MEMORY[0x263EF8340];
  id v11 = a3;
  id v48 = a4;
  v46 = (void (**)(void))a5;
  id v43 = a6;
  context = (void *)MEMORY[0x223CAC5D0]();
  v12 = objc_alloc_init(BLTPBSetSectionInfoRequest);
  [(BLTPBSetSectionInfoRequest *)v12 setSectionInfo:v11];
  uint64_t v13 = v12;
  v51 = [v11 icon];
  v47 = [v51 data];
  v14 = [v11 sectionID];
  v50 = [v14 stringByAppendingString:@".setSectionInfoIconsOnly"];

  v49 = [(BLTPreviouslySentMessageStore *)self->_sectionInfoPreviouslySentMessageStore messageDigestForUnsentMessage:v47 messageKey:v50];
  v15 = objc_alloc_init(BLTPBSetSectionInfoRequest);
  id v16 = v11;
  uint64_t v17 = v16;
  v18 = v16;
  if (v51)
  {
    v18 = (void *)[v16 copy];

    [v18 setIcon:0];
    [v18 setIconsStripped:1];
  }
  v42 = v17;
  [(BLTPBSetSectionInfoRequest *)v15 setSectionInfo:v18];
  id v19 = [(BLTPBSetSectionInfoRequest *)v13 sectionInfo];
  uint64_t v20 = [v19 sectionID];
  v21 = [v20 stringByAppendingString:@".setSectionInfoWithoutIcons"];

  sectionInfoPreviouslySentMessageStore = self->_sectionInfoPreviouslySentMessageStore;
  v23 = [(BLTPBSetSectionInfoRequest *)v15 data];
  v45 = [(BLTPreviouslySentMessageStore *)sectionInfoPreviouslySentMessageStore messageDigestForUnsentMessage:v23 messageKey:v21];

  if (v49)
  {
    if (v13)
    {
      v24 = NSString;
      v25 = [(BLTPBSetSectionInfoRequest *)v13 sectionInfo];
      v26 = [v25 sectionID];
      v41 = [v24 stringWithFormat:@"setSectionInfoWithIcons:\"%@\"", v26];

      v27 = NSString;
      v28 = [(BLTPBSetSectionInfoRequest *)v13 sectionInfo];
      v29 = [v28 sectionID];
      v30 = [v27 stringWithFormat:@"%@.setSectionInfo.withIcons", v29];
      v31 = v13;
LABEL_9:

      objc_initWeak(location, self);
      v54[0] = MEMORY[0x263EF8330];
      v54[1] = 3221225472;
      v54[2] = __89__BLTSettingSyncServer_setSectionInfo_withSent_withAcknowledgement_keypaths_spoolToFile___block_invoke;
      v54[3] = &unk_264685830;
      objc_copyWeak(&v60, location);
      id v55 = v49;
      id v56 = v50;
      id v57 = v45;
      id v58 = v21;
      v59 = v46;
      v36 = (void *)MEMORY[0x223CAC810](v54);
      settingSendSerializer = self->_settingSendSerializer;
      v38 = [NSNumber numberWithDouble:*MEMORY[0x263F49E68]];
      v52[0] = MEMORY[0x263EF8330];
      v52[1] = 3221225472;
      v52[2] = __89__BLTSettingSyncServer_setSectionInfo_withSent_withAcknowledgement_keypaths_spoolToFile___block_invoke_2;
      v52[3] = &unk_2646841B8;
      id v53 = v48;
      LOBYTE(v40) = BYTE4(v40);
      [(BLTSettingsSendSerializerPassthrough *)settingSendSerializer sendRequest:v31 type:13 withTimeout:v38 withDescription:v41 onlyOneFor:v30 didSend:v52 andResponse:v36 spoolToFile:v40];

      objc_destroyWeak(&v60);
      objc_destroyWeak(location);

      goto LABEL_18;
    }
  }
  else if (v45)
  {
    v31 = v15;

    if (v31)
    {
      v32 = NSString;
      v33 = [(BLTPBSetSectionInfoRequest *)v13 sectionInfo];
      v34 = [v33 sectionID];
      v41 = [v32 stringWithFormat:@"setSectionInfoWithoutIcons:\"%@\"", v34];

      v35 = NSString;
      v28 = [(BLTPBSetSectionInfoRequest *)v13 sectionInfo];
      v29 = [v28 sectionID];
      v30 = [v35 stringWithFormat:@"%@.setSectionInfo.withoutIcons", v29];
      goto LABEL_9;
    }
  }
  else
  {
  }
  v39 = blt_settings_log();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(location[0]) = 138412290;
    *(id *)((char *)location + 4) = v21;
    _os_log_impl(&dword_222F4C000, v39, OS_LOG_TYPE_DEFAULT, "Not sending %@ because already sent", (uint8_t *)location, 0xCu);
  }

  if (v48) {
    (*((void (**)(id, uint64_t, void))v48 + 2))(v48, 1, 0);
  }
  if (v46) {
    v46[2]();
  }
  v31 = 0;
LABEL_18:
}

uint64_t __89__BLTSettingSyncServer_setSectionInfo_withSent_withAcknowledgement_keypaths_spoolToFile___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v10 = v3;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    id v5 = WeakRetained;
    if (*(void *)(a1 + 32))
    {
      id v6 = [WeakRetained sectionInfoPreviouslySentMessageStore];
      [v6 recordMessageDigestAsPreviouslySent:*(void *)(a1 + 32) messageKey:*(void *)(a1 + 40)];
    }
    if (*(void *)(a1 + 48))
    {
      v7 = [v5 sectionInfoPreviouslySentMessageStore];
      [v7 recordMessageDigestAsPreviouslySent:*(void *)(a1 + 48) messageKey:*(void *)(a1 + 56)];
    }
    id v3 = v10;
  }
  uint64_t v8 = *(void *)(a1 + 64);
  if (v8)
  {
    uint64_t v8 = (*(uint64_t (**)(uint64_t, BOOL))(v8 + 16))(v8, v3 != 0);
    id v3 = v10;
  }
  return MEMORY[0x270F9A758](v8, v3);
}

uint64_t __89__BLTSettingSyncServer_setSectionInfo_withSent_withAcknowledgement_keypaths_spoolToFile___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setSectionSubtypeParametersIcon:(id)a3 forSectionID:(id)a4 forSubtypeID:(int64_t)a5
{
  id v6 = a3;
  id v7 = a4;
  __assert_rtn("-[BLTSettingSyncServer setSectionSubtypeParametersIcon:forSectionID:forSubtypeID:]", "BLTSettingSyncServer.m", 258, "0");
}

- (void)setSectionSubtypeParametersIcon:(id)a3 forSectionID:(id)a4 forSubtypeID:(int64_t)a5 withQueue:(id)a6 withSent:(id)a7 withAcknowledgement:(id)a8 spoolToFile:(BOOL)a9
{
  location[2] = *(id *)MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  dispatch_queue_t queue = (dispatch_queue_t)a6;
  id v37 = a7;
  id v38 = a8;
  context = (void *)MEMORY[0x223CAC5D0]();
  uint64_t v17 = objc_alloc_init(BLTPBSetSectionSubtypeParametersIconRequest);
  v34 = v16;
  [(BLTPBSetSectionSubtypeParametersIconRequest *)v17 setSectionID:v16];
  if (a5 != 0x7FFFFFFFFFFFFFFFLL) {
    [(BLTPBSetSectionSubtypeParametersIconRequest *)v17 setSubtypeID:a5];
  }
  [(BLTPBSetSectionSubtypeParametersIconRequest *)v17 setDefaultSubtype:a5 == 0x7FFFFFFFFFFFFFFFLL];
  v32 = v15;
  [(BLTPBSetSectionSubtypeParametersIconRequest *)v17 setIcon:v15];
  v35 = [(BLTPBSetSectionSubtypeParametersIconRequest *)v17 data];
  v18 = NSString;
  if (a5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v19 = [NSString stringWithFormat:@"%@.%@", v16, @"default"];
  }
  else
  {
    uint64_t v20 = [NSNumber numberWithInteger:a5];
    id v19 = [v18 stringWithFormat:@"%@.%@", v16, v20];
  }
  v21 = [(BLTPreviouslySentMessageStore *)self->_sectionSubtypeParametersIconsPreviouslySentMessageStore messageDigestForUnsentMessage:v35 messageKey:v19];
  if (v21)
  {
    uint64_t v22 = [NSString stringWithFormat:@"setSectionSubtypeParametersIcon:\"%@\"", v19];
    v23 = [NSString stringWithFormat:@"%@.setSectionSubtypeParametersIcon", v19];
    objc_initWeak(location, self);
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __133__BLTSettingSyncServer_setSectionSubtypeParametersIcon_forSectionID_forSubtypeID_withQueue_withSent_withAcknowledgement_spoolToFile___block_invoke;
    v46[3] = &unk_264685858;
    objc_copyWeak(&v51, location);
    id v47 = v21;
    id v48 = v19;
    id v50 = v38;
    v24 = queue;
    v49 = v24;
    v25 = (void *)MEMORY[0x223CAC810](v46);
    v26 = v21;
    settingSendSerializer = self->_settingSendSerializer;
    v28 = [NSNumber numberWithDouble:*MEMORY[0x263F49E68]];
    v29 = (void *)v22;
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __133__BLTSettingSyncServer_setSectionSubtypeParametersIcon_forSectionID_forSubtypeID_withQueue_withSent_withAcknowledgement_spoolToFile___block_invoke_3;
    v43[3] = &unk_264685880;
    id v45 = v37;
    v44 = v24;
    LOBYTE(v31) = a9;
    [(BLTSettingsSendSerializerPassthrough *)settingSendSerializer sendRequest:v17 type:14 withTimeout:v28 withDescription:v22 onlyOneFor:v23 didSend:v43 andResponse:v25 spoolToFile:v31];

    v21 = v26;
    objc_destroyWeak(&v51);
    objc_destroyWeak(location);

LABEL_14:
    goto LABEL_15;
  }
  v30 = blt_settings_log();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    LODWORD(location[0]) = 138412290;
    *(id *)((char *)location + 4) = v19;
    _os_log_impl(&dword_222F4C000, v30, OS_LOG_TYPE_INFO, "Not sending %@ because already sent", (uint8_t *)location, 0xCu);
  }

  if (v37)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __133__BLTSettingSyncServer_setSectionSubtypeParametersIcon_forSectionID_forSubtypeID_withQueue_withSent_withAcknowledgement_spoolToFile___block_invoke_68;
    block[3] = &unk_264683CA0;
    id v42 = v37;
    dispatch_async(queue, block);
  }
  if (v38)
  {
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __133__BLTSettingSyncServer_setSectionSubtypeParametersIcon_forSectionID_forSubtypeID_withQueue_withSent_withAcknowledgement_spoolToFile___block_invoke_2_69;
    v39[3] = &unk_264683CA0;
    id v40 = v38;
    dispatch_async(queue, v39);
    v29 = v40;
    goto LABEL_14;
  }
LABEL_15:
}

void __133__BLTSettingSyncServer_setSectionSubtypeParametersIcon_forSectionID_forSubtypeID_withQueue_withSent_withAcknowledgement_spoolToFile___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v5 = WeakRetained;
  if (v3)
  {
    id v6 = [WeakRetained sectionSubtypeParametersIconsPreviouslySentMessageStore];
    [v6 recordMessageDigestAsPreviouslySent:*(void *)(a1 + 32) messageKey:*(void *)(a1 + 40)];
  }
  id v7 = *(void **)(a1 + 56);
  if (v7)
  {
    uint64_t v8 = *(NSObject **)(a1 + 48);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __133__BLTSettingSyncServer_setSectionSubtypeParametersIcon_forSectionID_forSubtypeID_withQueue_withSent_withAcknowledgement_spoolToFile___block_invoke_2;
    v9[3] = &unk_264683C28;
    id v11 = v7;
    id v10 = v3;
    dispatch_async(v8, v9);
  }
}

uint64_t __133__BLTSettingSyncServer_setSectionSubtypeParametersIcon_forSectionID_forSubtypeID_withQueue_withSent_withAcknowledgement_spoolToFile___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32) != 0);
}

void __133__BLTSettingSyncServer_setSectionSubtypeParametersIcon_forSectionID_forSubtypeID_withQueue_withSent_withAcknowledgement_spoolToFile___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    id v7 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __133__BLTSettingSyncServer_setSectionSubtypeParametersIcon_forSectionID_forSubtypeID_withQueue_withSent_withAcknowledgement_spoolToFile___block_invoke_4;
    block[3] = &unk_264683C78;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __133__BLTSettingSyncServer_setSectionSubtypeParametersIcon_forSectionID_forSubtypeID_withQueue_withSent_withAcknowledgement_spoolToFile___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __133__BLTSettingSyncServer_setSectionSubtypeParametersIcon_forSectionID_forSubtypeID_withQueue_withSent_withAcknowledgement_spoolToFile___block_invoke_68(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __133__BLTSettingSyncServer_setSectionSubtypeParametersIcon_forSectionID_forSubtypeID_withQueue_withSent_withAcknowledgement_spoolToFile___block_invoke_2_69(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendSpooledRequestsNowWithSent:(id)a3 withAcknowledgement:(id)a4
{
  settingSendSerializer = self->_settingSendSerializer;
  id v6 = NSNumber;
  double v7 = *MEMORY[0x263F49E68];
  id v8 = a4;
  id v9 = a3;
  id v10 = [v6 numberWithDouble:v7];
  [(BLTSettingsSendSerializerPassthrough *)settingSendSerializer sendNowWithSent:v9 withAcknowledgement:v8 withTimeout:v10];
}

- (void)clearSectionInfoSentCache
{
}

- (void)removeSectionInfoSentCacheForSectionID:(id)a3
{
  id v4 = [a3 stringByAppendingString:@".setSectionInfoWithoutIcons"];
  [(BLTPreviouslySentMessageStore *)self->_sectionInfoPreviouslySentMessageStore removeDigestForKey:v4];
}

- (BOOL)isSectionInfoSentCacheEmpty
{
  return [(BLTPreviouslySentMessageStore *)self->_sectionInfoPreviouslySentMessageStore isEmpty];
}

- (void)removeSectionWithSectionID:(id)a3 sent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v16 = objc_alloc_init(BLTPBRemoveSectionRequest);
  [(BLTPBRemoveSectionRequest *)v16 setSectionID:v7];
  id v8 = [(BLTSettingSyncServer *)self sectionInfoPreviouslySentMessageStore];
  id v9 = [v7 stringByAppendingString:@".setSectionInfoIconsOnly"];
  [v8 removeDigestForKey:v9];

  id v10 = [(BLTSettingSyncServer *)self sectionInfoPreviouslySentMessageStore];
  char v11 = [v7 stringByAppendingString:@".setSectionInfoWithoutIcons"];
  [v10 removeDigestForKey:v11];

  settingSendSerializer = self->_settingSendSerializer;
  uint64_t v13 = [NSNumber numberWithDouble:*MEMORY[0x263F49E68]];
  v14 = [NSString stringWithFormat:@"%@.removeSectionRequest", v7];

  LOBYTE(v15) = 0;
  [(BLTSettingsSendSerializerPassthrough *)settingSendSerializer sendRequest:v16 type:19 withTimeout:v13 withDescription:0 onlyOneFor:v14 didSend:v6 andResponse:0 spoolToFile:v15];
}

- (void)removeSectionWithSectionID:(id)a3
{
}

- (void)setNotificationsLevel:(unint64_t)a3 sectionID:(id)a4 mirror:(BOOL)a5
{
}

- (void)setNotificationsLevel:(unint64_t)a3 sectionID:(id)a4 mirror:(BOOL)a5 spoolToFile:(BOOL)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  char v11 = objc_alloc_init(BLTPBSetNotificationsAlertLevelRequest);
  uint64_t v17 = v11;
  if (a3 - 1 < 3) {
    uint64_t v12 = a3;
  }
  else {
    uint64_t v12 = 0;
  }
  [(BLTPBSetNotificationsAlertLevelRequest *)v11 setLevel:v12];
  [(BLTPBSetNotificationsAlertLevelRequest *)v17 setSectionID:v10];
  [(BLTPBSetNotificationsAlertLevelRequest *)v17 setMirror:v7];
  settingSendSerializer = self->_settingSendSerializer;
  v14 = [NSNumber numberWithDouble:*MEMORY[0x263F49E68]];
  uint64_t v15 = [NSString stringWithFormat:@"%@.setnotificationsalertlevel", v10];

  LOBYTE(v16) = a6;
  [(BLTSettingsSendSerializerPassthrough *)settingSendSerializer sendRequest:v17 type:20 withTimeout:v14 withDescription:0 onlyOneFor:v15 didSend:0 andResponse:0 spoolToFile:v16];
}

- (void)setNotificationsGrouping:(int)a3 sectionID:(id)a4
{
}

- (void)setNotificationsGrouping:(int)a3 sectionID:(id)a4 spoolToFile:(BOOL)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  uint64_t v13 = objc_alloc_init(BLTPBSetNotificationsGroupingRequest);
  [(BLTPBSetNotificationsGroupingRequest *)v13 setGrouping:v6];
  [(BLTPBSetNotificationsGroupingRequest *)v13 setSectionID:v8];
  settingSendSerializer = self->_settingSendSerializer;
  id v10 = [NSNumber numberWithDouble:*MEMORY[0x263F49E68]];
  char v11 = [NSString stringWithFormat:@"%@.setnotificationsgrouping", v8];

  LOBYTE(v12) = a5;
  [(BLTSettingsSendSerializerPassthrough *)settingSendSerializer sendRequest:v13 type:21 withTimeout:v10 withDescription:0 onlyOneFor:v11 didSend:0 andResponse:0 spoolToFile:v12];
}

- (void)setNotificationsSoundEnabled:(int)a3 sectionID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  char v11 = objc_alloc_init(BLTPBSetNotificationsSoundRequest);
  [(BLTPBSetNotificationsSoundRequest *)v11 setSound:v4];
  [(BLTPBSetNotificationsSoundRequest *)v11 setSectionID:v6];
  settingSendSerializer = self->_settingSendSerializer;
  id v8 = [NSNumber numberWithDouble:*MEMORY[0x263F49E68]];
  id v9 = [NSString stringWithFormat:@"%@.setnotificationssound", v6];

  LOBYTE(v10) = 0;
  [(BLTSettingsSendSerializerPassthrough *)settingSendSerializer sendRequest:v11 type:22 withTimeout:v8 withDescription:0 onlyOneFor:v9 didSend:0 andResponse:0 spoolToFile:v10];
}

- (void)setNotificationsCriticalAlertEnabled:(int)a3 sectionID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  char v11 = objc_alloc_init(BLTPBSetNotificationsCriticalAlertRequest);
  [(BLTPBSetNotificationsCriticalAlertRequest *)v11 setCriticalAlertSetting:v4];
  [(BLTPBSetNotificationsCriticalAlertRequest *)v11 setSectionID:v6];
  settingSendSerializer = self->_settingSendSerializer;
  id v8 = [NSNumber numberWithDouble:*MEMORY[0x263F49E68]];
  id v9 = [NSString stringWithFormat:@"%@.setnotificationscriticalalert", v6];

  LOBYTE(v10) = 0;
  [(BLTSettingsSendSerializerPassthrough *)settingSendSerializer sendRequest:v11 type:23 withTimeout:v8 withDescription:0 onlyOneFor:v9 didSend:0 andResponse:0 spoolToFile:v10];
}

- (void)sendRemoteGlobalSpokenSettingEnabled:(BOOL)a3 date:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v12 = objc_alloc_init(BLTPBSetRemoteGlobalSpokenSettingEnabledRequest);
  [(BLTPBSetRemoteGlobalSpokenSettingEnabledRequest *)v12 setSettingEnabled:v4];
  [v6 timeIntervalSince1970];
  double v8 = v7;

  [(BLTPBSetRemoteGlobalSpokenSettingEnabledRequest *)v12 setSettingDate:v8];
  settingSendSerializer = self->_settingSendSerializer;
  uint64_t v10 = [NSNumber numberWithDouble:*MEMORY[0x263F49E68]];
  LOBYTE(v11) = 0;
  [(BLTSettingsSendSerializerPassthrough *)settingSendSerializer sendRequest:v12 type:24 withTimeout:v10 withDescription:0 onlyOneFor:@"remoteGlobalSpokenSettingEnabled" didSend:0 andResponse:0 spoolToFile:v11];
}

- (void)remoteGlobalSettingsSyncServer:(id)a3 sendChangeset:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = objc_msgSend(v7, "blt_protobuf");
  id v9 = blt_global_settings_sync_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v16 = self;
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_222F4C000, v9, OS_LOG_TYPE_DEFAULT, "%@ remoteGlobalSettingsSyncServer: %@ sendChangeset: %@", buf, 0x20u);
  }

  settingSendSerializer = self->_settingSendSerializer;
  uint64_t v11 = [NSNumber numberWithDouble:*MEMORY[0x263F49E68]];
  uint64_t v12 = (objc_class *)objc_opt_class();
  uint64_t v13 = NSStringFromClass(v12);
  LOBYTE(v14) = 0;
  [(BLTSettingsSendSerializerPassthrough *)settingSendSerializer sendRequest:v8 type:25 withTimeout:v11 withDescription:0 onlyOneFor:v13 didSend:0 andResponse:0 spoolToFile:v14];
}

- (void)handleSetSectionInfoRequest:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [BLTPBSetSectionInfoRequest alloc];
  id v6 = [v4 data];
  id v7 = [(BLTPBSetSectionInfoRequest *)v5 initWithData:v6];

  double v8 = blt_settings_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    *(_DWORD *)buf = 136315394;
    id v20 = "-[BLTSettingSyncServer handleSetSectionInfoRequest:]";
    __int16 v21 = 2112;
    uint64_t v22 = v10;
    _os_log_impl(&dword_222F4C000, v8, OS_LOG_TYPE_DEFAULT, "Received %s encapsulating %@", buf, 0x16u);
  }
  if ([(BLTPBSetSectionInfoRequest *)v7 keypathsCount])
  {
    uint64_t v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = [(BLTPBSetSectionInfoRequest *)v7 keypaths];
    uint64_t v13 = [v11 setWithArray:v12];
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v14 = [(BLTSettingSyncServer *)self delegate];
  uint64_t v15 = [(BLTPBSetSectionInfoRequest *)v7 sectionInfo];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __52__BLTSettingSyncServer_handleSetSectionInfoRequest___block_invoke;
  v17[3] = &unk_264683BB0;
  v17[4] = self;
  id v18 = v4;
  id v16 = v4;
  [v14 setSectionInfo:v15 keypaths:v13 completion:v17];
}

void __52__BLTSettingSyncServer_handleSetSectionInfoRequest___block_invoke(uint64_t a1)
{
  id v5 = objc_alloc_init(BLTPBSetSectionInfoResponse);
  id v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [NSNumber numberWithDouble:*MEMORY[0x263F49E68]];
  [v3 sendResponse:v5 type:13 withRequest:v2 withTimeout:v4 withDescription:@"sectionInfo response" onlyOneFor:0 didSend:0];
}

- (void)handleSetSectionSubtypeParametersIconRequest:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [BLTPBSetSectionSubtypeParametersIconRequest alloc];
  id v6 = [v4 data];
  id v7 = [(BLTPBSetSectionSubtypeParametersIconRequest *)v5 initWithData:v6];

  double v8 = blt_settings_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    *(_DWORD *)buf = 136315394;
    id v18 = "-[BLTSettingSyncServer handleSetSectionSubtypeParametersIconRequest:]";
    __int16 v19 = 2112;
    id v20 = v10;
    _os_log_impl(&dword_222F4C000, v8, OS_LOG_TYPE_DEFAULT, "Received %s encapsulating %@", buf, 0x16u);
  }
  uint64_t v11 = [(BLTSettingSyncServer *)self delegate];
  uint64_t v12 = [(BLTPBSetSectionSubtypeParametersIconRequest *)v7 icon];
  uint64_t v13 = [(BLTPBSetSectionSubtypeParametersIconRequest *)v7 sectionID];
  if ([(BLTPBSetSectionSubtypeParametersIconRequest *)v7 defaultSubtype]) {
    uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v14 = [(BLTPBSetSectionSubtypeParametersIconRequest *)v7 subtypeID];
  }
  [v11 setSectionSubtypeParametersIcon:v12 forSectionID:v13 forSubtypeID:v14];

  uint64_t v15 = objc_alloc_init(BLTPBSetSectionSubtypeParametersIconResponse);
  id v16 = [NSNumber numberWithDouble:*MEMORY[0x263F49E68]];
  [(BLTRemoteObject *)self sendResponse:v15 type:14 withRequest:v4 withTimeout:v16 withDescription:@"subtypeParemetersIcon response" onlyOneFor:0 didSend:0];
}

- (void)handleRemoveSectionRequest:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [BLTPBRemoveSectionRequest alloc];
  id v6 = [v4 data];

  id v7 = [(BLTPBRemoveSectionRequest *)v5 initWithData:v6];
  double v8 = blt_settings_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    int v13 = 136315394;
    uint64_t v14 = "-[BLTSettingSyncServer handleRemoveSectionRequest:]";
    __int16 v15 = 2112;
    id v16 = v10;
    _os_log_impl(&dword_222F4C000, v8, OS_LOG_TYPE_DEFAULT, "Received %s encapsulating %@", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v11 = [(BLTSettingSyncServer *)self delegate];
  uint64_t v12 = [(BLTPBRemoveSectionRequest *)v7 sectionID];
  [v11 removeSectionWithSectionID:v12];
}

- (void)handleSetSectionSubtypeParametersIconResponse:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = blt_settings_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

  if (v6)
  {
    id v7 = [BLTPBSetSectionSubtypeParametersIconResponse alloc];
    double v8 = [v4 data];
    id v9 = [(BLTPBSetSectionSubtypeParametersIconResponse *)v7 initWithData:v8];

    uint64_t v10 = blt_settings_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [(PBCodable *)v9 redact];
      int v14 = 136315394;
      __int16 v15 = "-[BLTSettingSyncServer handleSetSectionSubtypeParametersIconResponse:]";
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      _os_log_impl(&dword_222F4C000, v10, OS_LOG_TYPE_DEFAULT, "Received response %s encapsulating %@", (uint8_t *)&v14, 0x16u);
    }
  }
  uint64_t v12 = [v4 context];
  int v13 = [v12 incomingResponseIdentifier];
  [(BLTSettingSyncServer *)self _handleResponse:v13];
}

- (void)handleSetNotificationsAlertLevelRequest:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [BLTPBSetNotificationsAlertLevelRequest alloc];
  BOOL v6 = [v4 data];

  id v7 = [(BLTPBSetNotificationsAlertLevelRequest *)v5 initWithData:v6];
  double v8 = blt_settings_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(PBCodable *)v7 redact];
    int v14 = 136315394;
    __int16 v15 = "-[BLTSettingSyncServer handleSetNotificationsAlertLevelRequest:]";
    __int16 v16 = 2112;
    uint64_t v17 = v9;
    _os_log_impl(&dword_222F4C000, v8, OS_LOG_TYPE_DEFAULT, "Received %s encapsulating %@", (uint8_t *)&v14, 0x16u);
  }
  uint64_t v10 = [(BLTSettingSyncServer *)self delegate];
  uint64_t v11 = [(BLTPBSetNotificationsAlertLevelRequest *)v7 level] - 1;
  if (v11 < 3) {
    uint64_t v12 = v11 + 1;
  }
  else {
    uint64_t v12 = 0;
  }
  int v13 = [(BLTPBSetNotificationsAlertLevelRequest *)v7 sectionID];
  objc_msgSend(v10, "setNotificationsLevel:sectionID:mirror:fromRemote:", v12, v13, -[BLTPBSetNotificationsAlertLevelRequest mirror](v7, "mirror"), 1);
}

- (void)handleSetNotificationsGroupingRequest:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [BLTPBSetNotificationsGroupingRequest alloc];
  BOOL v6 = [v4 data];

  id v7 = [(BLTPBSetNotificationsGroupingRequest *)v5 initWithData:v6];
  double v8 = blt_settings_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(PBCodable *)v7 redact];
    int v13 = 136315394;
    int v14 = "-[BLTSettingSyncServer handleSetNotificationsGroupingRequest:]";
    __int16 v15 = 2112;
    __int16 v16 = v9;
    _os_log_impl(&dword_222F4C000, v8, OS_LOG_TYPE_DEFAULT, "Received %s encapsulating %@", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v10 = [(BLTSettingSyncServer *)self delegate];
  uint64_t v11 = [(BLTPBSetNotificationsGroupingRequest *)v7 grouping];
  uint64_t v12 = [(BLTPBSetNotificationsGroupingRequest *)v7 sectionID];
  [v10 setNotificationsGrouping:v11 sectionID:v12];
}

- (void)handleSetNotificationsSoundRequest:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [BLTPBSetNotificationsSoundRequest alloc];
  BOOL v6 = [v4 data];

  id v7 = [(BLTPBSetNotificationsSoundRequest *)v5 initWithData:v6];
  double v8 = blt_settings_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(PBCodable *)v7 redact];
    int v13 = 136315394;
    int v14 = "-[BLTSettingSyncServer handleSetNotificationsSoundRequest:]";
    __int16 v15 = 2112;
    __int16 v16 = v9;
    _os_log_impl(&dword_222F4C000, v8, OS_LOG_TYPE_DEFAULT, "Received %s encapsulating %@", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v10 = [(BLTSettingSyncServer *)self delegate];
  uint64_t v11 = [(BLTPBSetNotificationsSoundRequest *)v7 sound];
  uint64_t v12 = [(BLTPBSetNotificationsSoundRequest *)v7 sectionID];
  [v10 setNotificationsSoundEnabled:v11 sectionID:v12];
}

- (void)handleSetNotificationsCriticalAlertRequest:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [BLTPBSetNotificationsCriticalAlertRequest alloc];
  BOOL v6 = [v4 data];

  id v7 = [(BLTPBSetNotificationsCriticalAlertRequest *)v5 initWithData:v6];
  double v8 = blt_settings_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(PBCodable *)v7 redact];
    int v13 = 136315394;
    int v14 = "-[BLTSettingSyncServer handleSetNotificationsCriticalAlertRequest:]";
    __int16 v15 = 2112;
    __int16 v16 = v9;
    _os_log_impl(&dword_222F4C000, v8, OS_LOG_TYPE_DEFAULT, "Received %s encapsulating %@", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v10 = [(BLTSettingSyncServer *)self delegate];
  uint64_t v11 = [(BLTPBSetNotificationsCriticalAlertRequest *)v7 criticalAlertSetting];
  uint64_t v12 = [(BLTPBSetNotificationsCriticalAlertRequest *)v7 sectionID];
  [v10 setNotificationsCriticalAlertEnabled:v11 sectionID:v12];
}

- (void)handleSetRemoteGlobalSpokenSettingEnabledRequest:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [BLTPBSetRemoteGlobalSpokenSettingEnabledRequest alloc];
  BOOL v6 = [v4 data];

  id v7 = [(BLTPBSetRemoteGlobalSpokenSettingEnabledRequest *)v5 initWithData:v6];
  double v8 = blt_settings_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(PBCodable *)v7 redact];
    int v14 = 136315394;
    __int16 v15 = "-[BLTSettingSyncServer handleSetRemoteGlobalSpokenSettingEnabledRequest:]";
    __int16 v16 = 2112;
    uint64_t v17 = v9;
    _os_log_impl(&dword_222F4C000, v8, OS_LOG_TYPE_DEFAULT, "Received %s encapsulating %@", (uint8_t *)&v14, 0x16u);
  }
  uint64_t v10 = [(BLTSettingSyncServer *)self delegate];
  uint64_t v11 = [(BLTPBSetRemoteGlobalSpokenSettingEnabledRequest *)v7 settingEnabled];
  uint64_t v12 = (void *)MEMORY[0x263EFF910];
  [(BLTPBSetRemoteGlobalSpokenSettingEnabledRequest *)v7 settingDate];
  int v13 = objc_msgSend(v12, "dateWithTimeIntervalSince1970:");
  [v10 transportUpdateRemoteGlobalSpokenSettingEnabled:v11 date:v13];
}

- (void)handleSetRemoteGlobalSettingsRequest:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [BLTPBSetRemoteGlobalSettingsRequest alloc];
  BOOL v6 = [v4 data];

  id v7 = [(BLTPBSetRemoteGlobalSettingsRequest *)v5 initWithData:v6];
  double v8 = blt_settings_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(PBCodable *)v7 redact];
    int v11 = 136315394;
    uint64_t v12 = "-[BLTSettingSyncServer handleSetRemoteGlobalSettingsRequest:]";
    __int16 v13 = 2112;
    int v14 = v9;
    _os_log_impl(&dword_222F4C000, v8, OS_LOG_TYPE_DEFAULT, "Received %s encapsulating %@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v10 = [(BLTSettingSyncServer *)self delegate];
  [v10 updateGlobalSettings:v7];
}

- (BLTSettingSyncingClient)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BLTSettingSyncingClient *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BLTPreviouslySentMessageStore)sectionInfoPreviouslySentMessageStore
{
  return self->_sectionInfoPreviouslySentMessageStore;
}

- (void)setSectionInfoPreviouslySentMessageStore:(id)a3
{
}

- (BLTPreviouslySentMessageStore)sectionSubtypeParametersIconsPreviouslySentMessageStore
{
  return self->_sectionSubtypeParametersIconsPreviouslySentMessageStore;
}

- (void)setSectionSubtypeParametersIconsPreviouslySentMessageStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionSubtypeParametersIconsPreviouslySentMessageStore, 0);
  objc_storeStrong((id *)&self->_sectionInfoPreviouslySentMessageStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_settingSendSerializer, 0);
}

void __28__BLTSettingSyncServer_init__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_222F4C000, a2, OS_LOG_TYPE_ERROR, "Could not create %@", (uint8_t *)&v2, 0xCu);
}

@end