@interface AXAuditService
+ (Class)deviceSettingsManagerClass;
- (AXAuditDeviceSettingsManager)deviceSettingsManager;
- (AXAuditService)initWithTransport:(id)a3;
- (AXAuditer)currentAuditer;
- (BOOL)applicationStateNotificationsEnabled;
- (BOOL)runningAudit;
- (DTXConnection)connection;
- (id)_channelRestrictBlock;
- (id)auditCaseIDsForAuditGroup:(id)a3;
- (id)deviceAccessibilitySettings;
- (id)deviceAllAuditCaseIDs;
- (id)deviceAllSupportedAuditTypes;
- (id)deviceApiVersion;
- (id)deviceAuditIssueSupportedKeys;
- (id)deviceCapabilities;
- (id)deviceCaptureScreenshot;
- (id)deviceCurrentState;
- (id)deviceElement:(id)a3 performAction:(id)a4 withValue:(id)a5;
- (id)deviceElement:(id)a3 valueForAttribute:(id)a4;
- (id)deviceElement:(id)a3 valueForParameterizedAttribute:(id)a4 withObject:(id)a5;
- (id)deviceFetchElementAtNormalizedDeviceCoordinate:(id)a3;
- (id)deviceFetchResolvesElementsOnSimulator;
- (id)deviceFetchSpecialElement:(id)a3;
- (id)deviceHumanReadableDescriptionForAuditCaseID:(id)a3;
- (id)deviceInspectorCanNavWhileMonitoringEvents;
- (id)deviceInspectorSupportedEventType;
- (id)deviceInspectorSupportedEventTypes;
- (id)deviceInspectorSupportsAutodrillIntoElements;
- (id)deviceInspectorSupportsIgnoredElements;
- (id)deviceRunningApplications;
- (id)synchronousDeviceCaptureScreenshot;
- (int)targetPid;
- (int64_t)hostAPIVersion;
- (unint64_t)monitoredEventType;
- (void)auditer:(id)a3 didAppendLogWithMessage:(id)a4;
- (void)auditer:(id)a3 didCompleteWithResults:(id)a4;
- (void)auditer:(id)a3 didEncounterIssue:(id)a4;
- (void)axAuditDeviceManager:(id)a3 settingDidChange:(id)a4;
- (void)cancel;
- (void)connectionInterrupted;
- (void)deviceBeginAuditCaseIDs:(id)a3;
- (void)deviceBeginAuditTypes:(id)a3;
- (void)deviceHighlightIssue:(id)a3;
- (void)deviceHighlightIssues:(id)a3;
- (void)deviceInspectorEnable:(id)a3;
- (void)deviceInspectorSetMonitoredEventType:(id)a3;
- (void)deviceResetToDefaultAccessibilitySettings;
- (void)deviceSetAppMonitoringEnabled:(id)a3;
- (void)deviceSetAuditTargetPid:(id)a3;
- (void)deviceUpdateAccessibilitySetting:(id)a3 withValue:(id)a4;
- (void)requestHostAPIVersion;
- (void)resume;
- (void)setApplicationStateNotificationsEnabled:(BOOL)a3;
- (void)setCurrentAuditer:(id)a3;
- (void)setDeviceSettingsManager:(id)a3;
- (void)setHostAPIVersion:(int64_t)a3;
- (void)setMaxConnectionEnqueue:(unint64_t)a3;
- (void)setMonitoredEventType:(unint64_t)a3;
- (void)setRunningAudit:(BOOL)a3;
- (void)setTargetPid:(int)a3;
- (void)set_channelRestrictBlock:(id)a3;
@end

@implementation AXAuditService

+ (Class)deviceSettingsManagerClass
{
  return (Class)objc_opt_class();
}

- (AXAuditService)initWithTransport:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)AXAuditService;
  v5 = [(AXAuditService *)&v22 init];
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      objc_initWeak(&location, v5);
      v7 = (void *)[objc_alloc(MEMORY[0x263F38C88]) initWithTransport:v4];
      [v7 publishCapability:@"com.apple.accessibility.axAuditDaemon.protocolVersion" withVersion:157 forClass:0];
      [v7 setMaximumEnqueueSize:0x800000];
      [v7 setDispatchTarget:v6];
      v8 = (void *)os_transaction_create();
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __36__AXAuditService_initWithTransport___block_invoke;
      v18[3] = &unk_26520D8B8;
      v6 = v6;
      v19 = v6;
      id v9 = v8;
      id v20 = v9;
      [v7 setMessageHandler:v18];
      uint64_t v13 = MEMORY[0x263EF8330];
      uint64_t v14 = 3221225472;
      v15 = __36__AXAuditService_initWithTransport___block_invoke_2;
      v16 = &unk_26520D8E0;
      objc_copyWeak(&v17, &location);
      [v7 setChannelHandler:&v13];
      objc_storeStrong((id *)&v6->_connection, v7);
      objc_msgSend((id)objc_opt_class(), "deviceSettingsManagerClass", v13, v14, v15, v16);
      uint64_t v10 = objc_opt_new();
      deviceSettingsManager = v6->_deviceSettingsManager;
      v6->_deviceSettingsManager = (AXAuditDeviceSettingsManager *)v10;

      [(AXAuditDeviceSettingsManager *)v6->_deviceSettingsManager setDelegate:v6];
      [(AXAuditDeviceSettingsManager *)v6->_deviceSettingsManager startObservingChanges];
      [(AXAuditDeviceSettingsManager *)v6->_deviceSettingsManager cacheDeviceSettingsValues];
      objc_destroyWeak(&v17);

      objc_destroyWeak(&location);
    }
    else
    {

      v6 = 0;
    }
  }

  return v6;
}

void __36__AXAuditService_initWithTransport___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 errorStatus] == 2)
  {
    [*(id *)(a1 + 32) connectionInterrupted];
    v3 = [*(id *)(a1 + 32) connection];
    [v3 setDispatchTarget:0];

    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = 0;
  }
}

void __36__AXAuditService_initWithTransport___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v9 = [WeakRetained _channelRestrictBlock];

  if (v9) {
    ((void (**)(void, id, id, void *))v9)[2](v9, v10, v7, a4);
  }
  if (a4) {
    [a4 instantiateServiceWithChannel:v10];
  }
  else {
    [v10 cancel];
  }
}

- (id)deviceInspectorSupportedEventTypes
{
  return &unk_26FB7ADC0;
}

- (id)deviceInspectorCanNavWhileMonitoringEvents
{
  return (id)MEMORY[0x263EFFA80];
}

- (void)cancel
{
  v3 = [(AXAuditService *)self connection];
  [v3 cancel];

  [(AXAuditService *)self set_channelRestrictBlock:0];
}

- (void)resume
{
  v3 = [(AXAuditService *)self connection];
  [v3 resume];

  [(AXAuditService *)self requestHostAPIVersion];
}

- (void)setMaxConnectionEnqueue:(unint64_t)a3
{
  id v4 = [(AXAuditService *)self connection];
  [v4 setMaximumEnqueueSize:a3];
}

- (void)requestHostAPIVersion
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__AXAuditService_requestHostAPIVersion__block_invoke;
  v6[3] = &unk_26520D908;
  v6[4] = self;
  v3 = (void *)MEMORY[0x24C54EE20](v6, a2);
  id v4 = [MEMORY[0x263F38CA0] messageWithSelector:sel_hostApiVersion objectArguments:0];
  if ([(AXAuditService *)self hostAPIVersion] <= 0)
  {
    v5 = [(AXAuditService *)self connection];
    [v5 sendControlAsync:v4 replyHandler:v3];
  }
}

void __39__AXAuditService_requestHostAPIVersion__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__AXAuditService_requestHostAPIVersion__block_invoke_2;
  v6[3] = &unk_26520D2E0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __39__AXAuditService_requestHostAPIVersion__block_invoke_2(uint64_t a1)
{
  if (![*(id *)(a1 + 32) errorStatus])
  {
    id v4 = [*(id *)(a1 + 32) object];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend(*(id *)(a1 + 40), "setHostAPIVersion:", objc_msgSend(v4, "integerValue"));
      uint64_t v2 = [*(id *)(a1 + 40) hostAPIVersion];
      id v3 = [*(id *)(a1 + 40) deviceSettingsManager];
      [v3 setHostAPIVersion:v2];
    }
  }
}

- (void)axAuditDeviceManager:(id)a3 settingDidChange:(id)a4
{
  id v5 = a4;
  v6 = +[AXAuditObjectTransportManager sharedManager];
  id v9 = [v6 transportDictionaryForObject:v5];

  id v7 = objc_msgSend(MEMORY[0x263F38CA0], "messageWithSelector:objectArguments:", sel_hostAccessibilitySettingDidChange_, v9, 0);
  uint64_t v8 = [(AXAuditService *)self connection];
  [v8 sendControlAsync:v7 replyHandler:0];
}

- (void)auditer:(id)a3 didEncounterIssue:(id)a4
{
  id v5 = a4;
  v6 = +[AXAuditObjectTransportManager sharedManager];
  id v10 = [v6 transportDictionaryForObject:v5];

  id v7 = v10;
  if (v10)
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x263F38CA0], "messageWithSelector:objectArguments:", sel_hostFoundAuditIssue_, v10, 0);
    id v9 = [(AXAuditService *)self connection];
    [v9 sendControlAsync:v8 replyHandler:0];

    id v7 = v10;
  }
}

- (void)auditer:(id)a3 didAppendLogWithMessage:(id)a4
{
  objc_msgSend(MEMORY[0x263F38CA0], "messageWithSelector:objectArguments:", sel_hostAppendAuditLog_, a4, 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [(AXAuditService *)self connection];
  [v5 sendControlAsync:v6 replyHandler:0];
}

- (void)auditer:(id)a3 didCompleteWithResults:(id)a4
{
  id v5 = a4;
  id v6 = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__AXAuditService_auditer_didCompleteWithResults___block_invoke;
  v8[3] = &unk_26520D2E0;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __49__AXAuditService_auditer_didCompleteWithResults___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v18 = a1;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v23 + 1) + 8 * v7) allIssues];
        if ([v8 count])
        {
          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          id v9 = v8;
          uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v20;
            do
            {
              uint64_t v13 = 0;
              do
              {
                if (*(void *)v20 != v12) {
                  objc_enumerationMutation(v9);
                }
                [v2 addObject:*(void *)(*((void *)&v19 + 1) + 8 * v13++)];
              }
              while (v11 != v13);
              uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }
            while (v11);
          }
        }
        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v5);
  }

  uint64_t v14 = +[AXAuditObjectTransportManager sharedManager];
  v15 = [v14 transportDictionaryForObject:v2];

  v16 = objc_msgSend(MEMORY[0x263F38CA0], "messageWithSelector:objectArguments:", sel_hostDeviceDidCompleteAuditCategoriesWithAuditIssues_, v15, 0);
  id v17 = [*(id *)(v18 + 40) connection];
  [v17 sendControlAsync:v16 replyHandler:0];

  [*(id *)(v18 + 40) setRunningAudit:0];
  [*(id *)(v18 + 40) setCurrentAuditer:0];
}

- (void)connectionInterrupted
{
  id v3 = [(AXAuditService *)self deviceSettingsManager];
  [v3 restoreDeviceSettingsValues];

  [(AXAuditService *)self setApplicationStateNotificationsEnabled:0];
  [(AXAuditService *)self deviceInspectorSetMonitoredEventType:&unk_26FB7ADD8];
  [(AXAuditService *)self deviceHighlightIssue:0];
  uint64_t v4 = MEMORY[0x263EFFA80];

  [(AXAuditService *)self deviceInspectorShowVisuals:v4];
}

- (void)deviceSetAuditTargetPid:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [a3 longValue];
    [(AXAuditService *)self setTargetPid:v4];
  }
}

- (id)deviceAuditIssueSupportedKeys
{
  return 0;
}

- (id)deviceCapabilities
{
  uint64_t v2 = [MEMORY[0x263EFF980] array];
  unsigned int outCount = 0;
  id v3 = &unk_26FB80980;
  uint64_t v4 = protocol_copyMethodDescriptionList((Protocol *)v3, 1, 1, &outCount);
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = outCount;
    if (outCount)
    {
      unint64_t v7 = 0;
      p_name = &v4->name;
      do
      {
        if (*p_name)
        {
          id v9 = NSStringFromSelector(*p_name);
          [v2 addObject:v9];

          unint64_t v6 = outCount;
        }
        ++v7;
        p_name += 2;
      }
      while (v7 < v6);
    }
    free(v5);
  }

  return v2;
}

- (id)deviceApiVersion
{
  return (id)[NSNumber numberWithInteger:25];
}

- (id)deviceRunningApplications
{
  return 0;
}

- (id)deviceCurrentState
{
  return &unk_26FB7ADF0;
}

- (void)deviceSetAppMonitoringEnabled:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [a3 BOOLValue];
    [(AXAuditService *)self setApplicationStateNotificationsEnabled:v4];
  }
}

- (id)deviceAllAuditCaseIDs
{
  return 0;
}

- (id)auditCaseIDsForAuditGroup:(id)a3
{
  return 0;
}

- (id)deviceHumanReadableDescriptionForAuditCaseID:(id)a3
{
  return 0;
}

- (void)deviceBeginAuditCaseIDs:(id)a3
{
}

- (id)deviceAllSupportedAuditTypes
{
  uint64_t v2 = objc_opt_new();
  id v3 = [v2 allSupportedAuditTypes];
  uint64_t v4 = [v3 allObjects];

  return v4;
}

- (void)deviceBeginAuditTypes:(id)a3
{
  id v4 = a3;
  if (![(AXAuditService *)self runningAudit])
  {
    [(AXAuditService *)self setRunningAudit:1];
    [(AXAuditService *)self auditCategorySetup];
    uint64_t v5 = dispatch_get_global_queue(0, 0);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __40__AXAuditService_deviceBeginAuditTypes___block_invoke;
    v6[3] = &unk_26520D2E0;
    void v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

void __40__AXAuditService_deviceBeginAuditTypes___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_opt_new();
  [v2 setDelegate:*(void *)(a1 + 32)];
  objc_msgSend(v2, "setTargetPid:", objc_msgSend(*(id *)(a1 + 32), "targetPid"));
  [v2 setCategoryType:1];
  [*(id *)(a1 + 32) setCurrentAuditer:v2];
  [v2 startWithAuditTypes:*(void *)(a1 + 40)];
}

- (void)deviceInspectorSetMonitoredEventType:(id)a3
{
  if (a3)
  {
    char v4 = [a3 integerValue];
    if (v4) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = v4 & 2;
    }
    [(AXAuditService *)self setMonitoredEventType:v5];
  }
}

- (void)deviceInspectorEnable:(id)a3
{
  if (a3)
  {
    unsigned int v4 = [a3 BOOLValue];
    id v5 = [NSNumber numberWithUnsignedLongLong:v4];
    [(AXAuditService *)self deviceInspectorSetMonitoredEventType:v5];
  }
}

- (id)deviceInspectorSupportedEventType
{
  return 0;
}

- (id)deviceInspectorSupportsIgnoredElements
{
  return (id)MEMORY[0x263EFFA80];
}

- (id)deviceInspectorSupportsAutodrillIntoElements
{
  return (id)MEMORY[0x263EFFA80];
}

- (id)deviceAccessibilitySettings
{
  id v3 = +[AXAuditObjectTransportManager sharedManager];
  unsigned int v4 = [(AXAuditService *)self deviceSettingsManager];
  id v5 = [v4 settings];
  unint64_t v6 = [v3 transportDictionaryForObject:v5];

  return v6;
}

- (void)deviceResetToDefaultAccessibilitySettings
{
  id v2 = [(AXAuditService *)self deviceSettingsManager];
  [v2 resetToDefaultAccessibilitySettings];
}

- (void)deviceUpdateAccessibilitySetting:(id)a3 withValue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = +[AXAuditObjectTransportManager sharedManager];
  uint64_t v8 = [v11 objectForTransportDictionary:v7 expectedClass:objc_opt_class()];

  id v9 = [v11 objectForTransportDictionary:v6 expectedClass:objc_opt_class()];

  uint64_t v10 = [(AXAuditService *)self deviceSettingsManager];
  [v10 updateSetting:v8 withNumberValue:v9];
}

- (id)deviceElement:(id)a3 performAction:(id)a4 withValue:(id)a5
{
  return 0;
}

- (id)deviceElement:(id)a3 valueForAttribute:(id)a4
{
  return 0;
}

- (id)deviceElement:(id)a3 valueForParameterizedAttribute:(id)a4 withObject:(id)a5
{
  return 0;
}

- (id)synchronousDeviceCaptureScreenshot
{
  return 0;
}

- (id)deviceFetchSpecialElement:(id)a3
{
  return 0;
}

- (id)deviceFetchResolvesElementsOnSimulator
{
  return 0;
}

- (id)deviceFetchElementAtNormalizedDeviceCoordinate:(id)a3
{
  return 0;
}

- (id)deviceCaptureScreenshot
{
  return 0;
}

- (void)deviceHighlightIssue:(id)a3
{
  id v7 = a3;
  if ([v7 count])
  {
    unsigned int v4 = +[AXAuditObjectTransportManager sharedManager];
    id v5 = [v4 objectForTransportDictionary:v7 expectedClass:objc_opt_class()];

    id v6 = [v5 auditElement];
  }
  else
  {
    id v6 = 0;
  }
  [(AXAuditService *)self highlightElement:v6];
}

- (void)deviceHighlightIssues:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v11, "count", (void)v16))
        {
          uint64_t v12 = +[AXAuditObjectTransportManager sharedManager];
          uint64_t v13 = [v12 objectForTransportDictionary:v11 expectedClass:objc_opt_class()];

          uint64_t v14 = [v13 auditElement];

          if (v14)
          {
            v15 = [v13 auditElement];
            [v5 addObject:v15];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  [(AXAuditService *)self highlightElements:v5];
}

- (DTXConnection)connection
{
  return self->_connection;
}

- (BOOL)applicationStateNotificationsEnabled
{
  return self->_applicationStateNotificationsEnabled;
}

- (void)setApplicationStateNotificationsEnabled:(BOOL)a3
{
  self->_applicationStateNotificationsEnabled = a3;
}

- (BOOL)runningAudit
{
  return self->_runningAudit;
}

- (void)setRunningAudit:(BOOL)a3
{
  self->_runningAudit = a3;
}

- (int)targetPid
{
  return self->_targetPid;
}

- (void)setTargetPid:(int)a3
{
  self->_targetPid = a3;
}

- (unint64_t)monitoredEventType
{
  return self->_monitoredEventType;
}

- (void)setMonitoredEventType:(unint64_t)a3
{
  self->_monitoredEventType = a3;
}

- (AXAuditer)currentAuditer
{
  return self->_currentAuditer;
}

- (void)setCurrentAuditer:(id)a3
{
}

- (AXAuditDeviceSettingsManager)deviceSettingsManager
{
  return self->_deviceSettingsManager;
}

- (void)setDeviceSettingsManager:(id)a3
{
}

- (int64_t)hostAPIVersion
{
  return self->_hostAPIVersion;
}

- (void)setHostAPIVersion:(int64_t)a3
{
  self->_hostAPIVersion = a3;
}

- (id)_channelRestrictBlock
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)set_channelRestrictBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__channelRestrictBlock, 0);
  objc_storeStrong((id *)&self->_deviceSettingsManager, 0);
  objc_storeStrong((id *)&self->_currentAuditer, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end