@interface COMeshNode
+ (void)_commandPayloadFromRapportRepresentation:(id)a3 result:(id)a4;
- (BOOL)_validateSource:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)linkActivated;
- (BOOL)nodeActivated;
- (COClusterMemberRoleSnapshot)memberSnapshot;
- (COCompanionLinkClientProtocol)client;
- (COConstituent)remote;
- (COConstituent)source;
- (CODiscoveryRecord)discoveryRecord;
- (COMeshLocalNode)parent;
- (COMeshNode)initWithCompanionLinkClient:(id)a3 source:(id)a4;
- (COMeshNode)initWithNode:(id)a3;
- (COMeshNodeDelegate)delegate;
- (CONode)underlyingNode;
- (NSMutableDictionary)counters;
- (NSString)IDSIdentifier;
- (NSString)label;
- (NSString)meshName;
- (NSUUID)HomeKitIdentifier;
- (OS_nw_activity)activity;
- (double)averageRequestTime;
- (id)_commandPayloadFromRapportRepresentation:(id)a3;
- (id)_eventIDForClass:(Class)a3;
- (id)_serializedDataForCommand:(id)a3;
- (id)description;
- (id)recorder;
- (unint64_t)connectionType;
- (unint64_t)discoveryType;
- (unint64_t)hash;
- (unint64_t)requestCount;
- (void)HomeKitIdentifier;
- (void)_handleActivation:(id)a3;
- (void)_handleDisconnect;
- (void)_handleErrorFlagsUpdate;
- (void)_handleRPIsUsingOnDemandConnection;
- (void)_handleRPStateUpdate;
- (void)_handleResponseToRequest:(id)a3 rapportRepresentation:(id)a4 options:(id)a5 error:(id)a6 responseCallback:(id)a7 at:(unint64_t)a8;
- (void)_setIDSIdentifier:(id)a3;
- (void)_validateDiscoveryRecord;
- (void)_withLock:(id)a3;
- (void)activate;
- (void)invalidate;
- (void)sendMeshCommand:(id)a3;
- (void)sendMeshRequest:(id)a3;
- (void)sendMeshRequest:(id)a3 responseCallback:(id)a4;
- (void)setAverageRequestTime:(double)a3;
- (void)setConnectionType:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDiscoveryRecord:(id)a3;
- (void)setDiscoveryType:(unint64_t)a3;
- (void)setLabel:(id)a3;
- (void)setLinkActivated:(BOOL)a3;
- (void)setMemberSnapshot:(id)a3;
- (void)setMeshName:(id)a3;
- (void)setNodeActivated:(BOOL)a3;
- (void)setParent:(id)a3;
- (void)setRecorder:(id)a3;
- (void)setRemote:(id)a3;
- (void)setRequestCount:(unint64_t)a3;
@end

@implementation COMeshNode

- (COMeshNode)initWithNode:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COMeshNode;
  v6 = [(COMeshNode *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_underlyingNode, a3);
  }

  return v7;
}

- (COMeshNode)initWithCompanionLinkClient:(id)a3 source:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)COMeshNode;
  objc_super v9 = [(COMeshNode *)&v29 init];
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_client, a3);
    objc_storeStrong((id *)&v10->_source, a4);
    v11 = [(COCompanionLinkClientProtocol *)v10->_client destinationDevice];
    uint64_t v12 = [v11 idsDeviceIdentifier];
    IDSIdentifier = v10->_IDSIdentifier;
    v10->_IDSIdentifier = (NSString *)v12;

    v14 = [MEMORY[0x263F086E0] mainBundle];
    v15 = [v14 bundleIdentifier];
    v16 = v15;
    if (v15)
    {
      v17 = v15;
      meshName = v10->_meshName;
      v10->_meshName = v17;
    }
    else
    {
      meshName = [MEMORY[0x263F08AB0] processInfo];
      uint64_t v19 = [meshName processName];
      v20 = v10->_meshName;
      v10->_meshName = (NSString *)v19;
    }
    uint64_t v21 = [(NSString *)v10->_meshName copy];
    label = v10->_label;
    v10->_label = (NSString *)v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    counters = v10->_counters;
    v10->_counters = v23;

    v10->_discoveryType = 0;
    v10->_connectionType = 0;
    id recorder = v10->_recorder;
    v10->_id recorder = &__block_literal_global_5;

    uint64_t v26 = +[CONetworkActivityFactory activityWithLabel:1 parentActivity:0];
    activity = v10->_activity;
    v10->_activity = (OS_nw_activity *)v26;
  }
  return v10;
}

uint64_t __49__COMeshNode_initWithCompanionLinkClient_source___block_invoke()
{
  return AnalyticsSendEventLazy();
}

- (void)_setIDSIdentifier:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    IDSIdentifier = self->_IDSIdentifier;
    p_IDSIdentifier = &self->_IDSIdentifier;
    if (!IDSIdentifier)
    {
      id v8 = v5;
      objc_storeStrong((id *)p_IDSIdentifier, a3);
      id v5 = v8;
    }
  }
}

- (COConstituent)source
{
  if ([MEMORY[0x263F33F80] isGlobalMessagingEnabled])
  {
    v3 = [(COMeshNode *)self underlyingNode];
    v4 = [v3 meConstituent];
  }
  else
  {
    v4 = self->_source;
  }
  return v4;
}

- (COConstituent)remote
{
  if ([MEMORY[0x263F33F80] isGlobalMessagingEnabled])
  {
    v3 = [(COMeshNode *)self underlyingNode];
    v4 = [v3 remote];
  }
  else
  {
    v4 = self->_remote;
  }
  return v4;
}

- (NSString)IDSIdentifier
{
  if ([MEMORY[0x263F33F80] isGlobalMessagingEnabled])
  {
    v3 = [(COMeshNode *)self underlyingNode];
    v4 = [v3 IDSIdentifier];
  }
  else
  {
    v4 = self->_IDSIdentifier;
  }
  return v4;
}

- (NSUUID)HomeKitIdentifier
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263F33F80] isGlobalMessagingEnabled])
  {
    v3 = [(COMeshNode *)self underlyingNode];
    v4 = [v3 HomeKitIdentifier];
  }
  else
  {
    id v5 = [(COMeshNode *)self client];
    v6 = [v5 destinationDevice];
    v4 = [v6 homeKitIdentifier];

    if (!v4)
    {
      id v7 = [(COMeshNode *)self IDSIdentifier];
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v8 = [(COMeshNode *)self parent];
      objc_super v9 = [v8 client];
      v10 = [v9 activeDevices];

      v4 = (void *)[v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v4)
      {
        uint64_t v11 = *(void *)v18;
        while (2)
        {
          for (i = 0; i != v4; i = (char *)i + 1)
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v10);
            }
            v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            v14 = [v13 idsDeviceIdentifier];
            if (v14 && ![v7 compare:v14 options:1])
            {
              v4 = [v13 homeKitIdentifier];
              v15 = COCoreLogForCategory(0);
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
                -[COMeshNode HomeKitIdentifier]();
              }

              goto LABEL_17;
            }
          }
          v4 = (void *)[v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v4) {
            continue;
          }
          break;
        }
      }
LABEL_17:
    }
  }
  return (NSUUID *)v4;
}

- (void)setMemberSnapshot:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __32__COMeshNode_setMemberSnapshot___block_invoke;
  v6[3] = &unk_2645CAE80;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(COMeshNode *)self _withLock:v6];
}

void __32__COMeshNode_setMemberSnapshot___block_invoke(uint64_t a1)
{
  int v2 = [MEMORY[0x263F33F80] isGlobalMessagingEnabled];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2)
  {
    id v4 = [*(id *)(v3 + 152) memberSnapshot];
    uint64_t v5 = [v4 member];
    if (v5)
    {
      v6 = (void *)v5;
      id v7 = [*(id *)(*(void *)(a1 + 32) + 152) memberSnapshot];
      id v8 = [v7 member];
      objc_super v9 = [*(id *)(a1 + 40) member];
      char v10 = [v8 isEqual:v9];

      if (v10) {
        goto LABEL_6;
      }
      id v4 = [*(id *)(*(void *)(a1 + 32) + 152) memberSnapshot];
      uint64_t v11 = [v4 member];
      [v11 setStale:1];
    }
LABEL_6:
    uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 152) memberSnapshot];
    char v13 = [v12 isEqual:*(void *)(a1 + 40)];

    if ((v13 & 1) == 0)
    {
      v14 = [*(id *)(*(void *)(a1 + 32) + 152) memberSnapshot];

      if (v14)
      {
        v15 = [*(id *)(*(void *)(a1 + 32) + 152) memberSnapshot];
        [v15 setStale:1];
      }
      uint64_t v16 = *(void *)(a1 + 40);
      long long v17 = *(void **)(*(void *)(a1 + 32) + 152);
      [v17 setMemberSnapshot:v16];
    }
    return;
  }
  uint64_t v18 = [*(id *)(v3 + 24) member];
  if (v18)
  {
    long long v19 = (void *)v18;
    long long v20 = [*(id *)(*(void *)(a1 + 32) + 24) member];
    uint64_t v21 = [*(id *)(a1 + 40) member];
    char v22 = [v20 isEqual:v21];

    if ((v22 & 1) == 0)
    {
      v23 = [*(id *)(*(void *)(a1 + 32) + 24) member];
      [v23 setStale:1];
    }
  }
  if (([*(id *)(*(void *)(a1 + 32) + 24) isEqual:*(void *)(a1 + 40)] & 1) == 0)
  {
    uint64_t v24 = *(void *)(a1 + 32);
    v25 = *(void **)(v24 + 24);
    if (v25)
    {
      [v25 setStale:1];
      uint64_t v24 = *(void *)(a1 + 32);
    }
    uint64_t v26 = *(void **)(a1 + 40);
    objc_storeStrong((id *)(v24 + 24), v26);
  }
}

- (COClusterMemberRoleSnapshot)memberSnapshot
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__15;
  objc_super v9 = __Block_byref_object_dispose__15;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __28__COMeshNode_memberSnapshot__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(COMeshNode *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (COClusterMemberRoleSnapshot *)v2;
}

uint64_t __28__COMeshNode_memberSnapshot__block_invoke(uint64_t a1)
{
  int v2 = [MEMORY[0x263F33F80] isGlobalMessagingEnabled];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2)
  {
    id v4 = [*(id *)(v3 + 152) memberSnapshot];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void *)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  else
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v4 = *(id *)(v3 + 24);
    uint64_t v6 = *(void *)(v7 + 40);
    *(void *)(v7 + 40) = v4;
  }
  return MEMORY[0x270F9A758](v4, v6);
}

- (void)setDiscoveryRecord:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __33__COMeshNode_setDiscoveryRecord___block_invoke;
  v6[3] = &unk_2645CAE80;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(COMeshNode *)self _withLock:v6];
}

void __33__COMeshNode_setDiscoveryRecord___block_invoke(uint64_t a1)
{
}

- (CODiscoveryRecord)discoveryRecord
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__15;
  objc_super v9 = __Block_byref_object_dispose__15;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __29__COMeshNode_discoveryRecord__block_invoke;
  v4[3] = &unk_2645CB120;
  v4[4] = self;
  v4[5] = &v5;
  [(COMeshNode *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (CODiscoveryRecord *)v2;
}

void __29__COMeshNode_discoveryRecord__block_invoke(uint64_t a1)
{
  if (([MEMORY[0x263F33F80] isGlobalMessagingEnabled] & 1) == 0)
  {
    id v2 = *(void **)(*(void *)(a1 + 32) + 32);
    if (!v2)
    {
      uint64_t v3 = +[CODiscoveryRecord discoveryRecordWithNode:](CODiscoveryRecord, "discoveryRecordWithNode:");
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void **)(v4 + 32);
      *(void *)(v4 + 32) = v3;

      id v2 = *(void **)(*(void *)(a1 + 32) + 32);
    }
    uint64_t v6 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    objc_storeStrong(v6, v2);
  }
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(COMeshNode *)self source];
  uint64_t v7 = [(COMeshNode *)self remote];
  id v8 = [v3 stringWithFormat:@"<%@: %p, %@ -> %@>", v5, self, v6, v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (COMeshNode *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      if ([MEMORY[0x263F33F80] isGlobalMessagingEnabled])
      {
        uint64_t v6 = [(COMeshNode *)self remote];
        if (v6)
        {
        }
        else
        {
          id v8 = [(COMeshNode *)v5 remote];

          if (!v8)
          {
            v15 = [(COMeshNode *)self IDSIdentifier];
            uint64_t v16 = [(COMeshNode *)v5 IDSIdentifier];
            char v17 = [v15 isEqual:v16];

            if (v17) {
              goto LABEL_11;
            }
            goto LABEL_13;
          }
        }
      }
      objc_super v9 = [(COMeshNode *)self source];
      id v10 = [(COMeshNode *)v5 source];
      if ([v9 isEqual:v10])
      {
        uint64_t v11 = [(COMeshNode *)self remote];
        uint64_t v12 = [(COMeshNode *)v5 remote];
        char v13 = [v11 isEqual:v12];

        if (v13)
        {
LABEL_11:
          BOOL v7 = 1;
LABEL_14:

          goto LABEL_15;
        }
      }
      else
      {
      }
LABEL_13:
      BOOL v7 = 0;
      goto LABEL_14;
    }
    BOOL v7 = 0;
  }
LABEL_15:

  return v7;
}

- (unint64_t)hash
{
  id v2 = [(COMeshNode *)self IDSIdentifier];
  uint64_t v3 = [v2 uppercaseString];
  unint64_t v4 = [v3 hash];

  return v4;
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  unint64_t v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (id)_eventIDForClass:(Class)a3
{
  unint64_t v4 = [(COMeshNode *)self meshName];
  uint64_t v5 = NSStringFromClass(a3);
  uint64_t v6 = [v4 stringByAppendingFormat:@".%@", v5];

  return v6;
}

+ (void)_commandPayloadFromRapportRepresentation:(id)a3 result:(id)a4
{
  id v10 = a3;
  uint64_t v5 = (void (**)(id, void *, id))a4;
  uint64_t v6 = [v10 objectForKey:@"source"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v7 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:0];
    id v8 = [v10 objectForKey:@"command"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
      uint64_t v6 = v9;
    }
    else
    {
      id v9 = 0;
      uint64_t v6 = v8;
    }
  }
  else
  {
    BOOL v7 = 0;
    id v9 = 0;
  }
  v5[2](v5, v7, v9);
}

- (BOOL)_validateSource:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(COMeshNode *)self remote];
  uint64_t v6 = v5;
  if (v4)
  {
    if (v5)
    {
      char v7 = [v5 isEqual:v4];
    }
    else
    {
      [(COMeshNode *)self setRemote:v4];
      [(COMeshNode *)self _validateDiscoveryRecord];
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)_validateDiscoveryRecord
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(COMeshNode *)self remote];
  id v4 = self->_discoveryRecord;
  uint64_t v5 = [(CODiscoveryRecord *)v4 constituent];
  uint64_t v6 = (void *)v5;
  if (v3 && v5 && ([v3 isEqual:v5] & 1) == 0)
  {
    char v7 = (void *)[(CODiscoveryRecord *)v4 mutableCopy];
    [v7 rollConstituent:v3];
    id v8 = [[CODiscoveryRecord alloc] initWithDiscoveryRecord:v7];
    [(COMeshNode *)self setDiscoveryRecord:v8];
    id v9 = COCoreLogForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138413058;
      uint64_t v11 = self;
      __int16 v12 = 2112;
      char v13 = v3;
      __int16 v14 = 2112;
      v15 = v6;
      __int16 v16 = 2112;
      char v17 = v8;
      _os_log_impl(&dword_2217C1000, v9, OS_LOG_TYPE_DEFAULT, "%@ updated discovery constituent to %@ from %@ with record %@", (uint8_t *)&v10, 0x2Au);
    }
  }
}

- (id)_commandPayloadFromRapportRepresentation:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  int v10 = &v9;
  uint64_t v11 = 0x3032000000;
  __int16 v12 = __Block_byref_object_copy__15;
  char v13 = __Block_byref_object_dispose__15;
  id v14 = 0;
  uint64_t v5 = objc_opt_class();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__COMeshNode__commandPayloadFromRapportRepresentation___block_invoke;
  v8[3] = &unk_2645CD120;
  v8[4] = self;
  v8[5] = &v9;
  [v5 _commandPayloadFromRapportRepresentation:v4 result:v8];
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __55__COMeshNode__commandPayloadFromRapportRepresentation___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if ([*(id *)(a1 + 32) _validateSource:a2]) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

- (id)_serializedDataForCommand:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
  if (!v6)
  {
    if (class_getMethodImplementation(v5, sel_supportsSecureCoding)
      && class_getMethodImplementation(v5, sel_encodeWithCoder_))
    {
      char v7 = COCoreLogForCategory(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[COMeshNode _serializedDataForCommand:]();
      }
    }
    else
    {
      char v7 = COCoreLogForCategory(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[COMeshNode _serializedDataForCommand:](v5, v7);
      }
    }

    id v8 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263F08160] reason:0 userInfo:0];
    [v8 raise];
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __40__COMeshNode__serializedDataForCommand___block_invoke;
  v13[3] = &unk_2645CD148;
  v13[4] = self;
  v15 = v5;
  id v9 = v6;
  id v14 = v9;
  [(COMeshNode *)self _withLock:v13];
  int v10 = v14;
  id v11 = v9;

  return v11;
}

void __40__COMeshNode__serializedDataForCommand___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) counters];
  uint64_t v3 = NSStringFromClass(*(Class *)(a1 + 48));
  id v4 = [v2 objectForKey:v3];
  if (!v4)
  {
    id v4 = objc_alloc_init(COMeshNodeMessageCounter);
    [v2 setObject:v4 forKey:v3];
  }
  unint64_t v5 = [(COMeshNodeMessageCounter *)v4 count] + 1;
  unint64_t v6 = [*(id *)(a1 + 40) length];
  unint64_t v7 = [(COMeshNodeMessageCounter *)v4 size];
  if (v5 > 0x3E7)
  {
    double v16 = (double)v7;
    char v17 = [*(id *)(a1 + 32) label];
    uint64_t v18 = [*(id *)(a1 + 32) recorder];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __40__COMeshNode__serializedDataForCommand___block_invoke_3;
    v22[3] = &unk_2645CB750;
    *(double *)&v24[1] = v16;
    v24[2] = v5;
    uint64_t v21 = v3;
    char v13 = (id *)v24;
    id v23 = v3;
    v24[0] = v17;
    long long v19 = v2;
    long long v20 = (void (*)(void *, uint64_t, void *))v18[2];
    id v15 = v17;
    v20(v18, 0x26D3D61C8, v22);
    id v2 = v19;
    __int16 v12 = &v23;

    [(COMeshNodeMessageCounter *)v4 setCount:0];
    [(COMeshNodeMessageCounter *)v4 setSize:0];
    goto LABEL_7;
  }
  unint64_t v8 = v6 / v5 + v7 - v7 / v5;
  [(COMeshNodeMessageCounter *)v4 setCount:v5];
  [(COMeshNodeMessageCounter *)v4 setSize:v8];
  HIDWORD(v9) = -1030792151 * (unsigned __int16)v5;
  LODWORD(v9) = HIDWORD(v9);
  if ((v9 >> 2) <= 0x28F5C28)
  {
    int v10 = [*(id *)(a1 + 32) label];
    id v11 = [*(id *)(a1 + 32) recorder];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __40__COMeshNode__serializedDataForCommand___block_invoke_2;
    v25[3] = &unk_2645CB750;
    v27[1] = v8;
    v27[2] = v5;
    __int16 v12 = &v26;
    uint64_t v21 = v3;
    char v13 = (id *)v27;
    id v26 = v3;
    v27[0] = v10;
    id v14 = (void (*)(void *, uint64_t, void *))v11[2];
    id v15 = v10;
    v14(v11, 0x26D3D61C8, v25);

LABEL_7:
    uint64_t v3 = v21;
  }
}

id __40__COMeshNode__serializedDataForCommand___block_invoke_2(void *a1)
{
  v9[4] = *MEMORY[0x263EF8340];
  v8[0] = 0x26D3D6428;
  id v2 = [NSNumber numberWithUnsignedLongLong:a1[6]];
  v9[0] = v2;
  v8[1] = 0x26D3D63E8;
  uint64_t v3 = [NSNumber numberWithUnsignedLongLong:a1[7]];
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  v9[1] = v3;
  v9[2] = v4;
  v8[2] = 0x26D3D6448;
  v8[3] = 0x26D3D61E8;
  v9[3] = v5;
  unint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

id __40__COMeshNode__serializedDataForCommand___block_invoke_3(uint64_t a1)
{
  v9[4] = *MEMORY[0x263EF8340];
  v8[0] = 0x26D3D6428;
  id v2 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  v9[0] = v2;
  v8[1] = 0x26D3D63E8;
  uint64_t v3 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v9[1] = v3;
  v9[2] = v4;
  v8[2] = 0x26D3D6448;
  v8[3] = 0x26D3D61E8;
  v9[3] = v5;
  unint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

- (void)_handleResponseToRequest:(id)a3 rapportRepresentation:(id)a4 options:(id)a5 error:(id)a6 responseCallback:(id)a7 at:(unint64_t)a8
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  uint64_t v18 = (void (**)(id, void *, void))a7;
  __uint64_t v19 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  if (v17)
  {
    int v20 = 0;
    goto LABEL_24;
  }
  __uint64_t v21 = v19;
  char v22 = [v15 objectForKey:@"response"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v22 length])
  {
    id v23 = [(id)objc_opt_class() acceptableResponses];
    v77[0] = MEMORY[0x263EF8330];
    v77[1] = 3221225472;
    v77[2] = __95__COMeshNode__handleResponseToRequest_rapportRepresentation_options_error_responseCallback_at___block_invoke;
    v77[3] = &unk_2645CB6B0;
    v77[4] = self;
    id v66 = v22;
    id v78 = v66;
    v68 = v23;
    uint64_t v24 = [v23 objectsPassingTest:v77];
    uint64_t v25 = [v24 anyObject];

    if (!v25)
    {
      id v17 = [MEMORY[0x263F087E8] errorWithDomain:@"COMeshNodeErrorDomain" code:-4001 userInfo:0];
      int v20 = 0;
LABEL_22:

      goto LABEL_23;
    }
    v67 = [(COMeshNode *)self _commandPayloadFromRapportRepresentation:v15];
    if (v67)
    {
      id v26 = [MEMORY[0x263F08928] unarchivedObjectOfClass:v25 fromData:v67 error:0];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v26)
        {
          v65 = [v15 objectForKey:@"overhead"];
          if (v65)
          {
            v63 = v26;
            unint64_t v27 = [(COMeshNode *)self requestCount] + 1;
            if (v27 > 0x3E7)
            {
              [(COMeshNode *)self averageRequestTime];
              uint64_t v47 = v46;
              v48 = [(COMeshNode *)self label];
              v49 = [(COMeshNode *)self recorder];
              v69[0] = MEMORY[0x263EF8330];
              v69[1] = 3221225472;
              v69[2] = __95__COMeshNode__handleResponseToRequest_rapportRepresentation_options_error_responseCallback_at___block_invoke_2;
              v69[3] = &unk_2645CB700;
              uint64_t v71 = v47;
              unint64_t v72 = v27;
              id v70 = v48;
              v50 = (void (*)(void *, uint64_t, void *))v49[2];
              v62 = v48;
              v50(v49, 0x26D3D61A8, v69);

              [(COMeshNode *)self setRequestCount:0];
              [(COMeshNode *)self setAverageRequestTime:0.0];
              v51 = COCoreLogForCategory(0);
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
              {
                v57 = objc_opt_class();
                *(_DWORD *)buf = 138412802;
                v80 = self;
                __int16 v81 = 2112;
                id v82 = v66;
                __int16 v83 = 2112;
                uint64_t v84 = (uint64_t)v57;
                id v58 = v57;
                _os_log_debug_impl(&dword_2217C1000, v51, OS_LOG_TYPE_DEBUG, "%@ received %@ (reset timings) for %@", buf, 0x20u);
              }
              v42 = v62;
              id v26 = v63;
            }
            else
            {
              [v65 doubleValue];
              double v29 = ((double)(v21 - a8) - v28) / 1000000.0;
              [(COMeshNode *)self averageRequestTime];
              double v31 = v30 * 1000.0;
              if (v29 <= v31)
              {
                uint64_t v32 = v27;
                double v29 = v31 + (v29 - v31) / (double)v27;
              }
              else
              {
                uint64_t v32 = 1;
              }
              id v26 = v63;
              [(COMeshNode *)self setRequestCount:v32];
              double v52 = v29 / 1000.0;
              [(COMeshNode *)self setAverageRequestTime:v52];
              v53 = COCoreLogForCategory(0);
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
              {
                v59 = objc_opt_class();
                *(_DWORD *)buf = 138413314;
                v80 = self;
                __int16 v81 = 2112;
                id v82 = v66;
                __int16 v83 = 2048;
                uint64_t v84 = v32;
                __int16 v85 = 2048;
                double v86 = v52;
                __int16 v87 = 2112;
                v88 = v59;
                uint64_t v60 = v32;
                id v61 = v59;
                _os_log_debug_impl(&dword_2217C1000, v53, OS_LOG_TYPE_DEBUG, "%@ received %@ (%llu at %g ms) for %@", buf, 0x34u);

                uint64_t v32 = v60;
                id v26 = v63;
              }

              HIDWORD(v54) = -1030792151 * (unsigned __int16)v32;
              LODWORD(v54) = HIDWORD(v54);
              if ((v54 >> 2) > 0x28F5C28) {
                goto LABEL_46;
              }
              v55 = [(COMeshNode *)self label];
              v56 = [(COMeshNode *)self recorder];
              v73[0] = MEMORY[0x263EF8330];
              v73[1] = 3221225472;
              v73[2] = __95__COMeshNode__handleResponseToRequest_rapportRepresentation_options_error_responseCallback_at___block_invoke_59;
              v73[3] = &unk_2645CB700;
              double v75 = v52;
              uint64_t v76 = v32;
              id v74 = v55;
              v64 = (void (*)(void *, uint64_t, void *))v56[2];
              v42 = v55;
              v64(v56, 0x26D3D61A8, v73);
            }
          }
          else
          {
            v42 = COCoreLogForCategory(0);
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            {
              v43 = objc_opt_class();
              *(_DWORD *)buf = 138412802;
              v80 = self;
              __int16 v81 = 2112;
              id v82 = v66;
              __int16 v83 = 2112;
              uint64_t v84 = (uint64_t)v43;
              v44 = v42;
              id v45 = v43;
              _os_log_debug_impl(&dword_2217C1000, v44, OS_LOG_TYPE_DEBUG, "%@ received %@ for %@", buf, 0x20u);

              v42 = v44;
            }
          }

LABEL_46:
          [v26 _setRapportOptions:v16];
          v18[2](v18, v26, 0);

          int v20 = 0;
          id v17 = 0;
LABEL_21:

          goto LABEL_22;
        }
      }
      else
      {

        [MEMORY[0x263F087E8] errorWithDomain:@"COMeshNodeErrorDomain" code:-4001 userInfo:0];
      }
    }
    v34 = COCoreLogForCategory(0);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[COMeshNode _handleResponseToRequest:rapportRepresentation:options:error:responseCallback:at:]();
    }

    id v17 = [MEMORY[0x263F087E8] errorWithDomain:@"COMeshNodeErrorDomain" code:-4000 userInfo:0];
    int v20 = 1;
    goto LABEL_21;
  }
  v33 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
    -[COMeshNode _handleResponseToRequest:rapportRepresentation:options:error:responseCallback:at:]();
  }

  id v17 = [MEMORY[0x263F087E8] errorWithDomain:@"COMeshNodeErrorDomain" code:-4000 userInfo:0];
  int v20 = 0;
LABEL_23:

  if (!v17) {
    goto LABEL_34;
  }
LABEL_24:
  v35 = [(COMeshNode *)self remote];
  if (v35 || [v17 code] != -6714)
  {

    goto LABEL_29;
  }
  v36 = [v17 domain];
  char v37 = [v36 isEqualToString:*MEMORY[0x263F62C18]];

  if ((v37 & 1) == 0)
  {
LABEL_29:
    v38 = COCoreLogForCategory(0);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v40 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      v80 = self;
      __int16 v81 = 2112;
      id v82 = v17;
      __int16 v83 = 2112;
      uint64_t v84 = (uint64_t)v40;
      id v41 = v40;
      _os_log_error_impl(&dword_2217C1000, v38, OS_LOG_TYPE_ERROR, "%@ received %@ for %@", buf, 0x20u);
    }
  }
  ((void (**)(id, void *, id))v18)[2](v18, 0, v17);
  if (v20)
  {
    v39 = [(COMeshNode *)self parent];
    [v39 _invalidateAndReintroduceNode:self];
  }
LABEL_34:
}

uint64_t __95__COMeshNode__handleResponseToRequest_rapportRepresentation_options_error_responseCallback_at___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) _eventIDForClass:a2];
  uint64_t v6 = [v5 isEqualToString:*(void *)(a1 + 40)];
  *a3 = v6;

  return v6;
}

id __95__COMeshNode__handleResponseToRequest_rapportRepresentation_options_error_responseCallback_at___block_invoke_59(uint64_t a1)
{
  v8[3] = *MEMORY[0x263EF8340];
  v7[0] = 0x26D3D6408;
  id v2 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v8[0] = v2;
  v7[1] = 0x26D3D63E8;
  uint64_t v3 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 48)];
  v7[2] = 0x26D3D61E8;
  uint64_t v4 = *(void *)(a1 + 32);
  v8[1] = v3;
  v8[2] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

id __95__COMeshNode__handleResponseToRequest_rapportRepresentation_options_error_responseCallback_at___block_invoke_2(uint64_t a1)
{
  v8[3] = *MEMORY[0x263EF8340];
  v7[0] = 0x26D3D6408;
  id v2 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v8[0] = v2;
  v7[1] = 0x26D3D63E8;
  uint64_t v3 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 48)];
  v7[2] = 0x26D3D61E8;
  uint64_t v4 = *(void *)(a1 + 32);
  v8[1] = v3;
  v8[2] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

- (void)activate
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_2217C1000, v0, OS_LOG_TYPE_DEBUG, "%@ activating", v1, 0xCu);
}

void __22__COMeshNode_activate__block_invoke(uint64_t a1)
{
  uint64_t v2 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __22__COMeshNode_activate__block_invoke_cold_1(a1);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained invalidate];
    uint64_t v5 = [v4 delegate];
    if (objc_opt_respondsToSelector()) {
      [v5 didInvalidateNode:v4];
    }
  }
}

void __22__COMeshNode_activate__block_invoke_62(uint64_t a1)
{
  uint64_t v2 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __22__COMeshNode_activate__block_invoke_62_cold_1(a1);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _handleRPStateUpdate];
  }
}

void __22__COMeshNode_activate__block_invoke_63(uint64_t a1)
{
  uint64_t v2 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __22__COMeshNode_activate__block_invoke_63_cold_1(a1);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _handleErrorFlagsUpdate];
  }
}

void __22__COMeshNode_activate__block_invoke_64(uint64_t a1)
{
  uint64_t v2 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __22__COMeshNode_activate__block_invoke_64_cold_1(a1, v2);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _handleDisconnect];
  }
}

void __22__COMeshNode_activate__block_invoke_65(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __22__COMeshNode_activate__block_invoke_65_cold_1(a1);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    unint64_t v7 = [WeakRetained activity];
    if (v7 && (nw_activity_is_activated() & 1) == 0) {
      nw_activity_activate();
    }
    [v6 setLinkActivated:1];
    [v6 _handleActivation:v3];
  }
}

- (void)_handleActivation:(id)a3
{
  id v4 = a3;
  if ([(COMeshNode *)self linkActivated] && ![(COMeshNode *)self nodeActivated])
  {
    [(COMeshNode *)self setNodeActivated:1];
    uint64_t v5 = COCoreLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[COMeshNode _handleActivation:]();
    }

    uint64_t v6 = [(COMeshNode *)self parent];
    if (v6)
    {
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_14;
      }
    }
    unint64_t v7 = [(COMeshNode *)self delegate];
    if (v4)
    {
      if (objc_opt_respondsToSelector()) {
        [v7 node:self didReceiveError:v4 forCommand:0];
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      [v7 didActivateNode:self];
    }
  }
LABEL_14:
}

- (void)_handleRPStateUpdate
{
  id v3 = [(COMeshNode *)self client];
  int v4 = [v3 usingOnDemandConnection];

  if (v4)
  {
    [(COMeshNode *)self _handleRPIsUsingOnDemandConnection];
  }
}

- (void)_handleRPIsUsingOnDemandConnection
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    uint64_t v5 = self;
    _os_log_impl(&dword_2217C1000, v3, OS_LOG_TYPE_DEFAULT, "%@ link (IP) connected", (uint8_t *)&v4, 0xCu);
  }

  [(COMeshNode *)self setConnectionType:2];
}

- (void)_handleErrorFlagsUpdate
{
  id v3 = [(COMeshNode *)self client];
  __int16 v4 = [v3 errorFlags];

  if ((v4 & 0x200) != 0)
  {
    [(COMeshNode *)self _handleDisconnect];
  }
}

- (void)_handleDisconnect
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2217C1000, v0, v1, "%@ link (IP) disconnected, triggering invalidation", v2, v3, v4, v5, v6);
}

- (void)invalidate
{
  uint64_t v3 = [(COMeshNode *)self parent];
  id v13 = v3;
  if (v3)
  {
    [v3 _handleLostNode:self];
  }
  else
  {
    uint64_t v4 = [(COMeshNode *)self client];
    [v4 setInvalidationHandler:0];

    uint64_t v5 = [(COMeshNode *)self client];
    [v5 invalidate];

    uint8_t v6 = [(COMeshNode *)self activity];
    if (v6 && nw_activity_is_activated())
    {
      xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
      if (v7)
      {
        uint64_t v8 = mach_continuous_time();
        uint64_t activation_time = nw_activity_get_activation_time();
        xpc_dictionary_set_uint64(v7, "lifetime", v8 - activation_time);
        [(COMeshNode *)self averageRequestTime];
        xpc_dictionary_set_double(v7, "rtt", v10);
        xpc_dictionary_set_uint64(v7, "requests", [(COMeshNode *)self requestCount]);
        id v11 = [(COMeshNode *)self remote];
        __int16 v12 = v11;
        if (v11)
        {
          xpc_dictionary_set_uint64(v7, "nodeType", [v11 type]);
          xpc_dictionary_set_uint64(v7, "nodeFlags", [v12 flags]);
        }
        xpc_dictionary_set_uint64(v7, "transport_type", 0);
        nw_activity_submit_metrics();
      }
      nw_activity_complete_with_reason();
    }
  }
}

- (void)sendMeshCommand:(id)a3
{
  v24[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(COMeshNode *)self _eventIDForClass:objc_opt_class()];
  uint8_t v6 = [(COMeshNode *)self _serializedDataForCommand:v4];
  v23[0] = @"source";
  xpc_object_t v7 = (void *)MEMORY[0x263F08910];
  uint64_t v8 = [(COMeshNode *)self source];
  unint64_t v9 = [v7 archivedDataWithRootObject:v8 requiringSecureCoding:1 error:0];
  v23[1] = @"command";
  v24[0] = v9;
  v24[1] = v6;
  double v10 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];

  id v11 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    int v20 = self;
    __int16 v21 = 2112;
    char v22 = v5;
    _os_log_impl(&dword_2217C1000, v11, OS_LOG_TYPE_DEFAULT, "%@ sending %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  __int16 v12 = [(COMeshNode *)self client];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __30__COMeshNode_sendMeshCommand___block_invoke;
  v15[3] = &unk_2645CD170;
  objc_copyWeak(&v18, (id *)buf);
  id v13 = v5;
  id v16 = v13;
  id v14 = v4;
  id v17 = v14;
  [v12 sendEventID:v13 event:v10 options:0 completion:v15];

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

void __30__COMeshNode_sendMeshCommand___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained) {
    goto LABEL_20;
  }
  uint64_t v5 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v13 = objc_loadWeakRetained((id *)(a1 + 48));
    id v14 = *(void **)(a1 + 32);
    int v15 = 138412802;
    id v16 = v13;
    __int16 v17 = 2112;
    id v18 = v14;
    __int16 v19 = 2112;
    id v20 = v3;
    _os_log_debug_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEBUG, "%@ sent %@ (%@)", (uint8_t *)&v15, 0x20u);
  }
  uint8_t v6 = (void *)*MEMORY[0x263F62C18];
  xpc_object_t v7 = [v3 domain];
  if ([v6 isEqualToString:v7])
  {
    uint64_t v8 = [v3 code];

    if (v8 == -71148)
    {
      unint64_t v9 = COCoreLogForCategory(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __30__COMeshNode_sendMeshCommand___block_invoke_cold_1();
      }

      [WeakRetained invalidate];
      goto LABEL_20;
    }
  }
  else
  {
  }
  double v10 = [WeakRetained delegate];
  if (v10)
  {
    if (v3)
    {
      if (objc_opt_respondsToSelector()) {
        [v10 node:WeakRetained didReceiveError:v3 forCommand:*(void *)(a1 + 40)];
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      [v10 node:WeakRetained didSendCommand:*(void *)(a1 + 40)];
    }
  }
  else
  {
    id v11 = COCoreLogForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = *(void **)(a1 + 40);
      int v15 = 138412802;
      id v16 = WeakRetained;
      __int16 v17 = 2112;
      id v18 = v3;
      __int16 v19 = 2112;
      id v20 = v12;
      _os_log_impl(&dword_2217C1000, v11, OS_LOG_TYPE_DEFAULT, "%@ received an error %@ for command %@ but no delegate to deliver", (uint8_t *)&v15, 0x20u);
    }
  }
LABEL_20:
}

- (void)sendMeshRequest:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __30__COMeshNode_sendMeshRequest___block_invoke;
  v6[3] = &unk_2645CD198;
  objc_copyWeak(&v9, &location);
  id v5 = v4;
  id v7 = v5;
  uint64_t v8 = self;
  [(COMeshNode *)self sendMeshRequest:v5 responseCallback:v6];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __30__COMeshNode_sendMeshRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained delegate];
    if (v9)
    {
      if (v6)
      {
        if (objc_opt_respondsToSelector()) {
          [v9 node:*(void *)(a1 + 40) didReceiveError:v6 forCommand:*(void *)(a1 + 32)];
        }
      }
      else if (objc_opt_respondsToSelector())
      {
        [v5 _setSender:*(void *)(a1 + 40)];
        [v9 node:*(void *)(a1 + 40) didReceiveResponse:v5 toRequest:*(void *)(a1 + 32)];
      }
    }
    else
    {
      double v10 = COCoreLogForCategory(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        if (v5) {
          id v11 = v5;
        }
        else {
          id v11 = v6;
        }
        uint64_t v12 = *(void *)(a1 + 32);
        int v13 = 138412802;
        id v14 = v8;
        __int16 v15 = 2112;
        id v16 = v11;
        __int16 v17 = 2112;
        uint64_t v18 = v12;
        _os_log_impl(&dword_2217C1000, v10, OS_LOG_TYPE_DEFAULT, "%@ received %@ for request %@ but no delegate to deliver", (uint8_t *)&v13, 0x20u);
      }
    }
  }
}

- (void)sendMeshRequest:(id)a3 responseCallback:(id)a4
{
  v39[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v26 = [(COMeshNode *)self _serializedDataForCommand:v6];
  v38[0] = @"source";
  uint64_t v8 = (void *)MEMORY[0x263F08910];
  id v9 = [(COMeshNode *)self source];
  double v10 = [v8 archivedDataWithRootObject:v9 requiringSecureCoding:1 error:0];
  v38[1] = @"command";
  v39[0] = v10;
  v39[1] = v26;
  id v11 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];

  uint64_t v12 = [(COMeshNode *)self _eventIDForClass:objc_opt_class()];
  int v13 = [(COMeshNode *)self client];
  [v6 responseTimeout];
  if (v14 >= 0.0) {
    double v15 = v14;
  }
  else {
    double v15 = 0.0;
  }
  if (v15 <= 0.0)
  {
    uint64_t v19 = COCoreLogForCategory(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v33 = self;
      __int16 v34 = 2114;
      v35 = v12;
      _os_log_impl(&dword_2217C1000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting %{public}@", buf, 0x16u);
    }
    uint64_t v18 = 0;
  }
  else
  {
    id v16 = NSDictionary;
    __int16 v17 = [NSNumber numberWithDouble:v15];
    uint64_t v18 = [v16 dictionaryWithObject:v17 forKey:*MEMORY[0x263F62CA0]];

    uint64_t v19 = COCoreLogForCategory(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v33 = self;
      __int16 v34 = 2114;
      v35 = v12;
      __int16 v36 = 2048;
      double v37 = v15;
      _os_log_impl(&dword_2217C1000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting %{public}@ with timeout of %g", buf, 0x20u);
    }
  }

  id v20 = [v6 activity];
  uint64_t v21 = +[CONetworkActivityFactory activityWithLabel:2 parentActivity:v20];
  if (v21) {
    nw_activity_activate();
  }
  char v22 = (void *)clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  objc_initWeak((id *)buf, self);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __47__COMeshNode_sendMeshRequest_responseCallback___block_invoke;
  v27[3] = &unk_2645CB598;
  objc_copyWeak(v31, (id *)buf);
  id v23 = v21;
  id v28 = v23;
  id v24 = v6;
  id v29 = v24;
  id v25 = v7;
  id v30 = v25;
  v31[1] = v22;
  [v13 sendRequestID:v12 request:v11 options:v18 responseHandler:v27];

  objc_destroyWeak(v31);
  objc_destroyWeak((id *)buf);
}

void __47__COMeshNode_sendMeshRequest_responseCallback___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained) {
    goto LABEL_16;
  }
  if (*(void *)(a1 + 32))
  {
    xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
    uint64_t v12 = v11;
    if (v11)
    {
      xpc_dictionary_set_uint64(v11, "transport_type", 0);
      nw_activity_submit_metrics();
    }
  }
  int v13 = (void *)*MEMORY[0x263F62C18];
  double v14 = [v9 domain];
  if ([v13 isEqualToString:v14])
  {
    uint64_t v15 = [v9 code];

    if (v15 == -71148)
    {
      id v16 = COCoreLogForCategory(0);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __47__COMeshNode_sendMeshRequest_responseCallback___block_invoke_cold_1();
      }

      [WeakRetained invalidate];
      if (*(void *)(a1 + 32)) {
        nw_activity_complete_with_reason();
      }
      goto LABEL_16;
    }
  }
  else
  {
  }
  if (*(void *)(a1 + 32)) {
    nw_activity_complete_with_reason();
  }
  [WeakRetained _handleResponseToRequest:*(void *)(a1 + 40) rapportRepresentation:v7 options:v8 error:v9 responseCallback:*(void *)(a1 + 48) at:*(void *)(a1 + 64)];
LABEL_16:
}

- (void)setRemote:(id)a3
{
}

- (COMeshNodeDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (COMeshNodeDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (COCompanionLinkClientProtocol)client
{
  return self->_client;
}

- (COMeshLocalNode)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (COMeshLocalNode *)WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (BOOL)linkActivated
{
  return self->_linkActivated;
}

- (void)setLinkActivated:(BOOL)a3
{
  self->_linkActivated = a3;
}

- (BOOL)nodeActivated
{
  return self->_nodeActivated;
}

- (void)setNodeActivated:(BOOL)a3
{
  self->_nodeActivated = a3;
}

- (NSString)meshName
{
  return self->_meshName;
}

- (void)setMeshName:(id)a3
{
}

- (id)recorder
{
  return self->_recorder;
}

- (void)setRecorder:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (unint64_t)requestCount
{
  return self->_requestCount;
}

- (void)setRequestCount:(unint64_t)a3
{
  self->_requestCount = a3;
}

- (double)averageRequestTime
{
  return self->_averageRequestTime;
}

- (void)setAverageRequestTime:(double)a3
{
  self->_averageRequestTime = a3;
}

- (NSMutableDictionary)counters
{
  return self->_counters;
}

- (unint64_t)discoveryType
{
  return self->_discoveryType;
}

- (void)setDiscoveryType:(unint64_t)a3
{
  self->_discoveryType = a3;
}

- (unint64_t)connectionType
{
  return self->_connectionType;
}

- (void)setConnectionType:(unint64_t)a3
{
  self->_connectionType = a3;
}

- (OS_nw_activity)activity
{
  return self->_activity;
}

- (CONode)underlyingNode
{
  return self->_underlyingNode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingNode, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_counters, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_recorder, 0);
  objc_storeStrong((id *)&self->_meshName, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_remote, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_discoveryRecord, 0);
  objc_storeStrong((id *)&self->_memberSnapshot, 0);
  objc_storeStrong((id *)&self->_IDSIdentifier, 0);
}

- (void)HomeKitIdentifier
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_2217C1000, v0, OS_LOG_TYPE_DEBUG, "%@ used fallback to get HomeKit identifier(%@)", v1, 0x16u);
}

- (void)_serializedDataForCommand:(objc_class *)a1 .cold.1(objc_class *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v3 = NSStringFromClass(a1);
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_2217C1000, a2, OS_LOG_TYPE_FAULT, "%@ does not appear to properly support secure coding which is required for all commands!", v4, 0xCu);
}

- (void)_serializedDataForCommand:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_2217C1000, v0, OS_LOG_TYPE_FAULT, "Failed to properly archive for sending: %@", v1, 0xCu);
}

- (void)_handleResponseToRequest:rapportRepresentation:options:error:responseCallback:at:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "%@ bad response ID (%@)");
}

- (void)_handleResponseToRequest:rapportRepresentation:options:error:responseCallback:at:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2217C1000, v0, v1, "%@ no response", v2, v3, v4, v5, v6);
}

void __22__COMeshNode_activate__block_invoke_cold_1(uint64_t a1)
{
  id v1 = OUTLINED_FUNCTION_8_1(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_2217C1000, v2, v3, "%@ invalidated", v4, v5, v6, v7, v8);
}

void __22__COMeshNode_activate__block_invoke_62_cold_1(uint64_t a1)
{
  id v1 = OUTLINED_FUNCTION_8_1(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_2217C1000, v2, v3, "%@ link state updated", v4, v5, v6, v7, v8);
}

void __22__COMeshNode_activate__block_invoke_63_cold_1(uint64_t a1)
{
  id v1 = OUTLINED_FUNCTION_8_1(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_2217C1000, v2, v3, "%@ link error flags updated", v4, v5, v6, v7, v8);
}

void __22__COMeshNode_activate__block_invoke_64_cold_1(uint64_t a1, NSObject *a2)
{
  id v3 = OUTLINED_FUNCTION_8_1(a1);
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_2217C1000, a2, OS_LOG_TYPE_ERROR, "%@ link (IP) disconnected", v4, 0xCu);
}

void __22__COMeshNode_activate__block_invoke_65_cold_1(uint64_t a1)
{
  id v1 = OUTLINED_FUNCTION_8_1(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_2217C1000, v2, v3, "%@ link activated", v4, v5, v6, v7, v8);
}

- (void)_handleActivation:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_2217C1000, v0, OS_LOG_TYPE_DEBUG, "%@ finishing activation", v1, 0xCu);
}

void __30__COMeshNode_sendMeshCommand___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "%@ link invalid for command %@");
}

void __47__COMeshNode_sendMeshRequest_responseCallback___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "%@ link invalid for request %@");
}

@end