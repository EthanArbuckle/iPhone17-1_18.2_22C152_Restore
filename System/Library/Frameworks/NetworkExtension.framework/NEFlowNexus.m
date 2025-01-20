@interface NEFlowNexus
- (BOOL)setDiscoveredEndpoints:(id)a3 forClient:(id)a4;
- (BOOL)supportsBrowseRequests;
- (NEFlowNexus)initWithName:(id)a3 delegate:(id)a4;
- (void)dealloc;
- (void)handleAssertFromClient:(id)a3;
- (void)handleUnassertFromClient:(id)a3;
- (void)setRemoteConnectionDirector:(id)a3;
- (void)setSupportsBrowseRequests:(BOOL)a3;
@end

@implementation NEFlowNexus

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browseAssertions, 0);
  objc_storeStrong((id *)&self->_connectionDirector, 0);
  objc_storeStrong((id *)&self->_flowDivertTokenHMACKey, 0);
  objc_storeStrong((id *)&self->_flowDivertQueue, 0);

  objc_storeStrong((id *)&self->_flowDivertControl, 0);
}

- (BOOL)supportsBrowseRequests
{
  return self->_supportsBrowseRequests;
}

- (void)handleUnassertFromClient:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NEFlowNexus;
  [(NENexus *)&v17 handleUnassertFromClient:v4];
  if (self) {
    id Property = objc_getProperty(self, v5, 200, 1);
  }
  else {
    id Property = 0;
  }
  id v7 = Property;
  objc_sync_enter(v7);
  if (self) {
    id v9 = objc_getProperty(self, v8, 200, 1);
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;
  int v11 = [v10 containsObject:v4];

  if (v11)
  {
    if (self) {
      id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
    }
    else {
      id WeakRetained = 0;
    }
    if (objc_opt_respondsToSelector())
    {
      v13 = objc_alloc_init(NENexusBrowse);
      [(NENexusBrowse *)v13 setClientIdentifier:v4];
      [WeakRetained stopBrowse:v13 fromNexus:self];
    }
    [(NEFlowNexus *)self setDiscoveredEndpoints:0 forClient:v4];
    if (self) {
      id v15 = objc_getProperty(self, v14, 200, 1);
    }
    else {
      id v15 = 0;
    }
    id v16 = v15;
    [v16 removeObject:v4];
  }
  objc_sync_exit(v7);
}

- (void)handleAssertFromClient:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NEFlowNexus;
  [(NENexus *)&v20 handleAssertFromClient:v4];
  v5 = [MEMORY[0x1E4F38C18] pathForClientID:v4];
  v6 = v5;
  if (!v5)
  {
    id v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v4;
      _os_log_error_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_ERROR, "Failed to get path for assert client %@", buf, 0xCu);
    }
    goto LABEL_16;
  }
  if ([v5 hasBrowseDescriptor])
  {
    if (self) {
      id Property = objc_getProperty(self, v7, 200, 1);
    }
    else {
      id Property = 0;
    }
    id v9 = Property;
    objc_sync_enter(v9);
    if (self)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
      id v12 = objc_getProperty(self, v11, 200, 1);
    }
    else
    {
      id WeakRetained = 0;
      id v12 = 0;
    }
    v13 = (NENexusBrowse *)v12;
    if (([(NENexusBrowse *)v13 containsObject:v4] & 1) == 0)
    {
      char v14 = objc_opt_respondsToSelector();

      if ((v14 & 1) == 0)
      {
LABEL_13:

        objc_sync_exit(v9);
LABEL_16:

        goto LABEL_17;
      }
      v13 = objc_alloc_init(NENexusBrowse);
      [(NENexusBrowse *)v13 setClientIdentifier:v4];
      id v15 = [v6 browseDescriptor];
      [(NENexusBrowse *)v13 setDescriptor:v15];

      id v16 = [v6 parameters];
      [(NENexusBrowse *)v13 setParameters:v16];

      [WeakRetained startBrowse:v13 fromNexus:self];
      if (self) {
        id v18 = objc_getProperty(self, v17, 200, 1);
      }
      else {
        id v18 = 0;
      }
      id v19 = v18;
      [v19 addObject:v4];
    }
    goto LABEL_13;
  }
LABEL_17:
}

- (BOOL)setDiscoveredEndpoints:(id)a3 forClient:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v8 = (char *)a4;
  if (!v8)
  {
    id v10 = ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "-[NEFlowNexus setDiscoveredEndpoints:forClient:]";
      _os_log_fault_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_FAULT, "%s called with null clientID", buf, 0xCu);
    }
    goto LABEL_28;
  }
  if (self) {
    id Property = objc_getProperty(self, v7, 200, 1);
  }
  else {
    id Property = 0;
  }
  if (([Property containsObject:v8] & 1) == 0)
  {
    id v10 = ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v8;
      _os_log_error_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_ERROR, "Client %@ has not asserted browse, cannot assign discovered endpoints", buf, 0xCu);
    }
    goto LABEL_28;
  }
  if ([v6 count])
  {
    id v10 = nw_array_create();
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = (void *)[*(id *)(*((void *)&v28 + 1) + 8 * i) copyCEndpoint];
          nw_array_append();
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v13);
    }
  }
  else
  {
    id v10 = 0;
  }
  uint64_t browse_result = nw_path_create_browse_result();
  if (!browse_result)
  {
    v26 = ne_log_obj();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19DDAF000, v26, OS_LOG_TYPE_FAULT, "nw_path_create_browse_result failed", buf, 2u);
    }
    goto LABEL_27;
  }
  id v19 = (void *)browse_result;
  if (self)
  {
    objc_super v20 = (NEFlowNexus *)objc_getProperty(self, v18, 128, 1);
    self = v20;
    if (v20) {
      objc_super v20 = (NEFlowNexus *)objc_getProperty(v20, v21, 32, 1);
    }
  }
  else
  {
    objc_super v20 = 0;
  }
  id v22 = v20;
  uint64_t v23 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v19 length:0];
  char v24 = [(NEFlowNexus *)v22 assignNexusData:v23 toClient:v8];

  free(v19);
  if ((v24 & 1) == 0)
  {
    v26 = ne_log_obj();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v8;
      _os_log_error_impl(&dword_19DDAF000, v26, OS_LOG_TYPE_ERROR, "Could not assign browse result to client %@", buf, 0xCu);
    }
LABEL_27:

LABEL_28:
    BOOL v25 = 0;
    goto LABEL_29;
  }
  BOOL v25 = 1;
LABEL_29:

  return v25;
}

- (void)setSupportsBrowseRequests:(BOOL)a3
{
  BOOL v3 = a3;
  self->_supportsBrowseRequests = a3;
  id v5 = objc_getProperty(self, a2, 128, 1);
  [v5 setSupportsBrowseRequests:v3];

  id Property = objc_getProperty(self, v6, 128, 1);
  id v12 = Property;
  if (Property) {
    id Property = objc_getProperty(Property, v8, 32, 1);
  }
  id v9 = Property;
  id v11 = objc_getProperty(self, v10, 128, 1);
  [v9 updateNetworkAgent:v11];
}

- (void)setRemoteConnectionDirector:(id)a3
{
  if (self) {
    objc_setProperty_atomic(self, a2, a3, 192);
  }
}

- (void)dealloc
{
  if (self && self->_flowDivertDirector)
  {
    NEFlowDirectorDestroy();
    self->_flowDivertDirector = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)NEFlowNexus;
  [(NENexus *)&v3 dealloc];
}

- (NEFlowNexus)initWithName:(id)a3 delegate:(id)a4
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  v60.receiver = self;
  v60.super_class = (Class)NEFlowNexus;
  id v4 = [(NENexus *)&v60 initWithLevel:4 name:a3 virtualInterfaceType:1 delegate:a4 channelCount:0];
  if (!v4)
  {
    v33 = ne_log_obj();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v70 = 0;
      _os_log_fault_impl(&dword_19DDAF000, v33, OS_LOG_TYPE_FAULT, "[super initWithLevel:name:delegate:] failed", v70, 2u);
    }
    goto LABEL_40;
  }
  id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v6 = dispatch_queue_create("FlowDivertDirector", v5);
  objc_setProperty_atomic(v4, v7, v6, 176);

  if (!objc_getProperty(v4, v8, 176, 1))
  {
    long long v31 = ne_log_obj();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    v32 = "dispatch_queue_create failed";
    goto LABEL_15;
  }
  id v9 = [[NEFlowDivertFileHandle alloc] initFlowDivertControlSocket];
  objc_setProperty_atomic(v4, v10, v9, 168);

  if (!objc_getProperty(v4, v11, 168, 1))
  {
    long long v31 = ne_log_obj();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    v32 = "[NEFlowDivertFileHandle initFlowDivertControlSocket] failed";
    goto LABEL_15;
  }
  uint64_t v13 = objc_msgSend(objc_getProperty(v4, v12, 168, 1), "controlUnit");
  v4->_flowDivertControlUnit = [v13 unsignedIntValue];

  id v15 = objc_msgSend(objc_getProperty(v4, v14, 168, 1), "keyMaterial");
  objc_setProperty_atomic(v4, v16, v15, 184);

  id v18 = objc_msgSend(objc_getProperty(v4, v17, 168, 1), "handle");
  [v18 fileDescriptor];
  objc_getProperty(v4, v19, 176, 1);
  v4->_flowDivertDirector = (_NEFlowDirector *)NEFlowDirectorCreate();

  if (!v4->_flowDivertDirector)
  {
    long long v31 = ne_log_obj();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    v32 = "NEFlowDirectorCreate failed";
LABEL_15:
    _os_log_fault_impl(&dword_19DDAF000, v31, OS_LOG_TYPE_FAULT, v32, buf, 2u);
LABEL_16:

    v33 = ne_log_obj();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v70 = 0;
      _os_log_fault_impl(&dword_19DDAF000, v33, OS_LOG_TYPE_FAULT, "setupFlowDivertDirector failed", v70, 2u);
    }
    goto LABEL_40;
  }
  int v69 = 0;
  uint64_t v67 = 0;
  uint64_t v68 = 0;
  uint64_t v66 = 0;
  objc_super v20 = (void *)NEFlowTLVMsgCreate();
  NEFlowTLVAdd();
  id v22 = objc_msgSend(objc_getProperty(v4, v21, 168, 1), "handle");
  int v23 = [v22 fileDescriptor];
  ssize_t v24 = send(v23, v20, v66 - v68, 0);

  if (v24 < 0)
  {
    v34 = ne_log_obj();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v54 = __error();
      v55 = strerror(*v54);
      *(_DWORD *)buf = 136315138;
      v76 = v55;
      _os_log_error_impl(&dword_19DDAF000, v34, OS_LOG_TYPE_ERROR, "Failed to send a FLOW_DIVERT_PKT_APP_MAP_CREATE message: %s", buf, 0xCu);
    }

    if (v20) {
      CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v20);
    }
  }
  else
  {
    CFAllocatorRef v25 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v20);
    int v69 = 1;
    v26 = (void *)NEFlowTLVMsgCreate();
    NEFlowTLVAdd();
    NEFlowTLVAdd();
    long long v28 = objc_msgSend(objc_getProperty(v4, v27, 168, 1), "handle");
    int v29 = [v28 fileDescriptor];
    ssize_t v30 = send(v29, v26, v66 - v68, 0);

    if (v30 >= 0)
    {
      if (!v26) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }
    uint64_t v35 = ne_log_obj();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      uint64_t v56 = v66;
      uint64_t v57 = v68;
      v58 = __error();
      v59 = strerror(*v58);
      *(_DWORD *)buf = 134218242;
      v76 = (char *)(v56 - v57);
      __int16 v77 = 2080;
      v78 = v59;
      _os_log_error_impl(&dword_19DDAF000, v35, OS_LOG_TYPE_ERROR, "Failed to send a FLOW_DIVERT_PKT_APP_MAP_CREATE with size %lu bytes: %s", buf, 0x16u);
    }

    if (v26) {
LABEL_26:
    }
      CFAllocatorDeallocate(v25, v26);
  }
LABEL_27:
  objc_initWeak((id *)buf, v4);
  *(void *)v70 = MEMORY[0x1E4F143A8];
  uint64_t v71 = 3221225472;
  v72 = __38__NEFlowNexus_setupFlowDivertDirector__block_invoke;
  v73 = &unk_1E598FD88;
  objc_copyWeak(v74, (id *)buf);
  NEFlowDirectorSetNewFlowCallback();
  *(void *)v61 = MEMORY[0x1E4F143A8];
  uint64_t v62 = 3221225472;
  v63 = __38__NEFlowNexus_setupFlowDivertDirector__block_invoke_2;
  v64 = &unk_1E598FDB0;
  objc_copyWeak(v65, (id *)buf);
  NEFlowDirectorSetMatchRulesCallback();
  NEFlowDirectorStart();
  objc_destroyWeak(v65);
  objc_destroyWeak(v74);
  objc_destroyWeak((id *)buf);
  v36 = [NEPolicy alloc];
  v37 = +[NEPolicyResult divertSocketToControlUnit:v4->_flowDivertControlUnit];
  v38 = [(NENexus *)v4 interfaceName];
  v39 = +[NEPolicyCondition scopedInterface:v38];
  *(void *)v70 = v39;
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:1];
  v41 = [(NEPolicy *)v36 initWithOrder:0 result:v37 conditions:v40];

  if (!v41)
  {
    v51 = ne_log_obj();
    if (!os_log_type_enabled(v51, OS_LOG_TYPE_FAULT)) {
      goto LABEL_38;
    }
    *(_WORD *)v61 = 0;
    v52 = "[NEPolicy initWithOrder:result:conditions:] failed";
    goto LABEL_37;
  }
  v43 = objc_getProperty(v4, v42, 120, 1);
  BOOL v44 = [v43 addPolicy:v41] == 0;

  if (v44)
  {
    v51 = ne_log_obj();
    if (!os_log_type_enabled(v51, OS_LOG_TYPE_FAULT)) {
      goto LABEL_38;
    }
    *(_WORD *)v61 = 0;
    v52 = "[NEPolicySession addPolicy:] failed";
    goto LABEL_37;
  }
  v46 = objc_getProperty(v4, v45, 120, 1);
  int v47 = [v46 apply];

  if ((v47 & 1) == 0)
  {
    v51 = ne_log_obj();
    if (!os_log_type_enabled(v51, OS_LOG_TYPE_FAULT)) {
      goto LABEL_38;
    }
    *(_WORD *)v61 = 0;
    v52 = "[NEPolicySession apply] failed";
LABEL_37:
    _os_log_fault_impl(&dword_19DDAF000, v51, OS_LOG_TYPE_FAULT, v52, v61, 2u);
LABEL_38:

    v33 = ne_log_obj();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v70 = 0;
      _os_log_fault_impl(&dword_19DDAF000, v33, OS_LOG_TYPE_FAULT, "setupFlowDivertDirector failed", v70, 2u);
    }
LABEL_40:

    v50 = 0;
    goto LABEL_41;
  }

  v48 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  browseAssertions = v4->_browseAssertions;
  v4->_browseAssertions = v48;

  v50 = v4;
LABEL_41:

  return v50;
}

void __38__NEFlowNexus_setupFlowDivertDirector__block_invoke(uint64_t a1, const void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  self = (id *)objc_loadWeakRetained(v4);
  id v6 = v5;
  if (!self) {
    goto LABEL_26;
  }
  SEL v7 = [NENexusFlowDivertFlow alloc];
  if (!v7)
  {
    p_isa = 0;
    goto LABEL_23;
  }
  p_super = &v7->super.super;
  if (a2)
  {
    v38.receiver = v7;
    v38.super_class = (Class)NENexusFlowDivertFlow;
    id v9 = objc_msgSendSuper2(&v38, sel_init);
    if (v9)
    {
      id v10 = v9;
      v9[8] = CFRetain(a2);
      uint64_t v11 = [MEMORY[0x1E4F29128] UUID];
      id v12 = (void *)*((void *)v10 + 5);
      *((void *)v10 + 5) = v11;

      -[NENexusFlow setupFlowProtocolWithUUID:](v10, *((void **)v10 + 5));
      uint64_t v13 = (void *)NEFlowCopyProperty();
      SEL v14 = (void *)NEFlowCopyProperty();
      int v15 = isa_nsstring(v14);
      int v16 = isa_nsdata(v13);
      if (v15)
      {
        if (v16 && (uint64_t v17 = [v13 bytes]) != 0)
        {
          int v18 = *(unsigned __int8 *)(v17 + 1);
          if (v18 == 30 || v18 == 2) {
            unsigned int v19 = *(unsigned __int16 *)(v17 + 2);
          }
          else {
            unsigned int v19 = 0;
          }
          uint64_t v22 = __rev16(v19);
        }
        else
        {
          uint64_t v22 = 0;
        }
        int v23 = (void *)MEMORY[0x1E4F38BF0];
        SEL v21 = [NSNumber numberWithUnsignedShort:v22];
        ssize_t v24 = [v21 stringValue];
        uint64_t v25 = [v23 endpointWithHostname:v14 port:v24];
        v26 = (void *)*((void *)v10 + 6);
        *((void *)v10 + 6) = v25;
      }
      else
      {
        if (!v16)
        {
LABEL_18:
          id v27 = objc_alloc_init(MEMORY[0x1E4F38C10]);
          long long v28 = (void *)*((void *)v10 + 7);
          *((void *)v10 + 7) = v27;

          if (NEFlowGetFlowType() == 1) {
            uint64_t v29 = 2;
          }
          else {
            uint64_t v29 = 1;
          }
          [*((id *)v10 + 7) setDataMode:v29];
          p_super = v10;

          p_isa = (id *)&p_super->isa;
          goto LABEL_22;
        }
        uint64_t v20 = objc_msgSend(MEMORY[0x1E4F38BC8], "endpointWithAddress:", objc_msgSend(v13, "bytes"));
        SEL v21 = (void *)*((void *)v10 + 6);
        *((void *)v10 + 6) = v20;
      }

      goto LABEL_18;
    }
    p_super = ne_log_obj();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19DDAF000, p_super, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
  }
  else
  {
    uint64_t v35 = ne_log_obj();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      LODWORD(v38.receiver) = 136315138;
      *(id *)((char *)&v38.receiver + 4) = "-[NENexusFlowDivertFlow initWithFlowDivertFlow:]";
      _os_log_fault_impl(&dword_19DDAF000, v35, OS_LOG_TYPE_FAULT, "%s called with null flowDivertFlow", (uint8_t *)&v38, 0xCu);
    }
  }
  p_isa = 0;
LABEL_22:

LABEL_23:
  [p_isa setState:1];
  id v32 = objc_getProperty(self, v31, 112, 1);
  if (p_isa) {
    objc_storeWeak(p_isa + 4, v32);
  }

  id WeakRetained = objc_loadWeakRetained(self + 17);
  v38.receiver = (id)MEMORY[0x1E4F143A8];
  v38.super_class = (Class)3221225472;
  v39 = __51__NEFlowNexus_flowDivertNewFlow_completionHandler___block_invoke;
  v40 = &unk_1E598FD60;
  v41 = p_isa;
  id v43 = v6;
  v42 = self;
  v34 = p_isa;
  [WeakRetained acceptNewFlow:v34 fromNexus:self completionHandler:&v38];

LABEL_26:
}

void __38__NEFlowNexus_setupFlowDivertDirector__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = ne_log_obj();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    uint64_t v9 = a4;
    _os_log_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_INFO, "Allowing flow from %@", (uint8_t *)&v8, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  NEFlowDirectorHandleMatchRulesResult();
}

void __51__NEFlowNexus_flowDivertNewFlow_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = *(void **)(a1 + 40);
    if (v5) {
      objc_getProperty(v5, v3, 176, 1);
    }
    NEFlowSetDispatchQueue();
    id v6 = [v4 localEndpoint];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0
      || ([v4 localEndpoint],
          int v8 = objc_claimAutoreleasedReturnValue(),
          [v8 addressData],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          int v10 = NEFlowSetProperty(),
          v9,
          v8,
          v10))
    {
      objc_initWeak(location, *(id *)(a1 + 40));
      v32[1] = (id)MEMORY[0x1E4F143A8];
      v32[2] = (id)3221225472;
      v32[3] = __51__NEFlowNexus_flowDivertNewFlow_completionHandler___block_invoke_26;
      v32[4] = &unk_1E598FD10;
      id v33 = *(id *)(a1 + 32);
      int v11 = NEFlowSetEventHandler();
      v30[1] = (id)MEMORY[0x1E4F143A8];
      v30[2] = (id)3221225472;
      v30[3] = __51__NEFlowNexus_flowDivertNewFlow_completionHandler___block_invoke_2;
      v30[4] = &unk_1E598FD38;
      id v31 = *(id *)(a1 + 32);
      objc_copyWeak(v32, location);
      int v12 = NEFlowSetEventHandler();
      id v29 = *(id *)(a1 + 32);
      objc_copyWeak(v30, location);
      int v13 = NEFlowSetEventHandler();
      if (v11)
      {
        if (v12) {
          BOOL v14 = v13 == 0;
        }
        else {
          BOOL v14 = 1;
        }
        char v15 = !v14;
        objc_destroyWeak(v30);

        objc_destroyWeak(v32);
        objc_destroyWeak(location);
        if (v15)
        {
          if (NEFlowOpen())
          {
            uint64_t v18 = *(void *)(a1 + 32);
            id Property = *(id *)(a1 + 40);
            if (Property) {
              id Property = objc_getProperty(Property, v16, 144, 1);
            }
            id v20 = Property;
            SEL v21 = *(void **)(a1 + 32);
            if (v21) {
              id v22 = objc_getProperty(v21, v19, 40, 1);
            }
            else {
              id v22 = 0;
            }
            [v20 setObject:v18 forKeyedSubscript:v22];

            (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
            goto LABEL_26;
          }
          uint64_t v25 = ne_log_obj();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            id v28 = *(id *)(a1 + 32);
            if (v28) {
              id v28 = objc_getProperty(v28, v26, 40, 1);
            }
            LODWORD(location[0]) = 138412290;
            *(id *)((char *)location + 4) = v28;
            _os_log_error_impl(&dword_19DDAF000, v25, OS_LOG_TYPE_ERROR, "NEFlowOpen failed for client %@", (uint8_t *)location, 0xCu);
          }
        }
      }
      else
      {
        objc_destroyWeak(v30);

        objc_destroyWeak(v32);
        objc_destroyWeak(location);
      }
    }
    [*(id *)(a1 + 32) setState:3];
    NEFlowSetEventHandler();
    NEFlowSetEventHandler();
    NEFlowSetEventHandler();
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_26;
  }
  int v23 = ne_log_obj();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    id v27 = *(id *)(a1 + 32);
    if (v27) {
      id v27 = objc_getProperty(v27, v24, 40, 1);
    }
    LODWORD(location[0]) = 138412290;
    *(id *)((char *)location + 4) = v27;
    _os_log_debug_impl(&dword_19DDAF000, v23, OS_LOG_TYPE_DEBUG, "Rejecting new flow for client %@", (uint8_t *)location, 0xCu);
  }

  [*(id *)(a1 + 32) setState:3];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_26:
}

uint64_t __51__NEFlowNexus_flowDivertNewFlow_completionHandler___block_invoke_26(uint64_t a1)
{
  return [*(id *)(a1 + 32) setState:2];
}

void __51__NEFlowNexus_flowDivertNewFlow_completionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setState:3];
  NEFlowSetEventHandler();
  NEFlowSetEventHandler();
  NEFlowSetEventHandler();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained) {
    id WeakRetained = objc_getProperty(WeakRetained, v3, 144, 1);
  }
  id v5 = WeakRetained;
  id v6 = *(void **)(a1 + 32);
  if (v6) {
    id Property = objc_getProperty(v6, v4, 40, 1);
  }
  else {
    id Property = 0;
  }
  [v5 setObject:0 forKeyedSubscript:Property];
}

void __51__NEFlowNexus_flowDivertNewFlow_completionHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setState:3];
  NEFlowSetEventHandler();
  NEFlowSetEventHandler();
  NEFlowSetEventHandler();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained) {
    id WeakRetained = objc_getProperty(WeakRetained, v3, 144, 1);
  }
  id v5 = WeakRetained;
  id v6 = *(void **)(a1 + 32);
  if (v6) {
    id Property = objc_getProperty(v6, v4, 40, 1);
  }
  else {
    id Property = 0;
  }
  [v5 setObject:0 forKeyedSubscript:Property];
}

@end