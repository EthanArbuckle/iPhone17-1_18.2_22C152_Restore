@interface AXPIFingerEventSender
- (AXPIFingerEventSender)init;
- (AXPIFingerEventSender)initWithDisplayUUID:(id)a3;
- (BOOL)setOutputEvent:(id)a3 forService:(id)a4;
- (BOOL)setProperty:(id)a3 forKey:(id)a4 forService:(id)a5;
- (BOOL)shouldAddRealEventFlag;
- (HIDVirtualEventService)eventService;
- (NSDictionary)properties;
- (NSString)displayUUID;
- (OS_dispatch_queue)eventSendingQueue;
- (id)_assignFingerIdentifiersToTouches:(id)a3;
- (id)copyEventMatching:(id)a3 forService:(id)a4;
- (id)propertyForKey:(id)a3 forService:(id)a4;
- (unint64_t)senderID;
- (void)_sendHandEvent:(unsigned int)a3 touchesByFingerIdentifier:(id)a4;
- (void)dealloc;
- (void)performCancel;
- (void)performDownWithTouches:(id)a3;
- (void)performDownWithTouchesByFingerIdentifier:(id)a3;
- (void)performMoveWithTouches:(id)a3;
- (void)performMoveWithTouchesByFingerIdentifier:(id)a3;
- (void)performUpWithTouches:(id)a3;
- (void)performUpWithTouchesByFingerIdentifier:(id)a3;
- (void)setDisplayUUID:(id)a3;
- (void)setEventSendingQueue:(id)a3;
- (void)setEventService:(id)a3;
- (void)setProperties:(id)a3;
- (void)setSenderID:(unint64_t)a3;
- (void)setShouldAddRealEventFlag:(BOOL)a3;
- (void)startNewGeneration;
@end

@implementation AXPIFingerEventSender

- (AXPIFingerEventSender)init
{
  return [(AXPIFingerEventSender *)self initWithDisplayUUID:0];
}

- (AXPIFingerEventSender)initWithDisplayUUID:(id)a3
{
  v31[9] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)AXPIFingerEventSender;
  v6 = [(AXPIFingerEventSender *)&v26 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_displayUUID, a3);
    dispatch_queue_t v8 = dispatch_queue_create("AXPIFingerEventSendingQueue", 0);
    eventSendingQueue = v7->_eventSendingQueue;
    v7->_eventSendingQueue = (OS_dispatch_queue *)v8;

    [(AXPIFingerEventSender *)v7 setSenderID:0x8000000817319372];
    v10 = (HIDVirtualEventService *)objc_alloc_init(MEMORY[0x263F41DE8]);
    eventService = v7->_eventService;
    v7->_eventService = v10;

    v31[0] = @"AXPIFingerTransport";
    v30[0] = @"Transport";
    v30[1] = @"PrimaryUsagePage";
    v12 = [NSNumber numberWithUnsignedShort:13];
    v31[1] = v12;
    v30[2] = @"PrimaryUsage";
    v13 = [NSNumber numberWithUnsignedShort:4];
    v31[2] = v13;
    v31[3] = MEMORY[0x263EFFA88];
    v30[3] = @"Authenticated";
    v30[4] = @"Built-In";
    v31[4] = MEMORY[0x263EFFA88];
    v31[5] = MEMORY[0x263EFFA88];
    v30[5] = @"DisplayIntegrated";
    v30[6] = @"VendorID";
    v31[6] = &unk_26EC8F0E8;
    v31[7] = &unk_26EC8F0E8;
    v30[7] = @"ProductID";
    v30[8] = @"DeviceUsagePairs";
    v27[0] = @"DeviceUsagePage";
    v14 = [NSNumber numberWithUnsignedShort:13];
    v27[1] = @"DeviceUsage";
    v28[0] = v14;
    v15 = [NSNumber numberWithUnsignedShort:4];
    v28[1] = v15;
    v16 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
    v29 = v16;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];
    v31[8] = v17;
    v18 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:9];

    if (v5)
    {
      v19 = (NSDictionary *)[(NSDictionary *)v18 mutableCopy];
      [(NSDictionary *)v19 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"Built-In"];
      [(NSDictionary *)v19 setObject:v5 forKeyedSubscript:@"displayUUID"];

      v18 = v19;
    }
    properties = v7->_properties;
    v7->_properties = v18;
    v21 = v18;

    v22 = v7->_eventSendingQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __45__AXPIFingerEventSender_initWithDisplayUUID___block_invoke;
    block[3] = &unk_264D86378;
    v25 = v7;
    dispatch_sync(v22, block);
  }
  return v7;
}

uint64_t __45__AXPIFingerEventSender_initWithDisplayUUID___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setDelegate:");
  [*(id *)(*(void *)(a1 + 32) + 32) setCancelHandler:&__block_literal_global];
  [*(id *)(*(void *)(a1 + 32) + 32) setDispatchQueue:*(void *)(*(void *)(a1 + 32) + 48)];
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  return [v2 activate];
}

- (void)dealloc
{
  eventSendingQueue = self->_eventSendingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__AXPIFingerEventSender_dealloc__block_invoke;
  block[3] = &unk_264D86378;
  void block[4] = self;
  dispatch_sync(eventSendingQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)AXPIFingerEventSender;
  [(AXPIFingerEventSender *)&v4 dealloc];
}

void __32__AXPIFingerEventSender_dealloc__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) cancel];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;
}

- (void)setSenderID:(unint64_t)a3
{
  self->_senderID = a3;
}

- (void)startNewGeneration
{
}

- (void)performDownWithTouches:(id)a3
{
  id v4 = [(AXPIFingerEventSender *)self _assignFingerIdentifiersToTouches:a3];
  [(AXPIFingerEventSender *)self performDownWithTouchesByFingerIdentifier:v4];
}

- (void)performDownWithTouchesByFingerIdentifier:(id)a3
{
}

- (void)performMoveWithTouches:(id)a3
{
  id v4 = [(AXPIFingerEventSender *)self _assignFingerIdentifiersToTouches:a3];
  [(AXPIFingerEventSender *)self performMoveWithTouchesByFingerIdentifier:v4];
}

- (void)performMoveWithTouchesByFingerIdentifier:(id)a3
{
}

- (void)performUpWithTouches:(id)a3
{
  id v4 = [(AXPIFingerEventSender *)self _assignFingerIdentifiersToTouches:a3];
  [(AXPIFingerEventSender *)self performUpWithTouchesByFingerIdentifier:v4];
}

- (void)performUpWithTouchesByFingerIdentifier:(id)a3
{
}

- (void)performCancel
{
}

- (void)_sendHandEvent:(unsigned int)a3 touchesByFingerIdentifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if ([v6 count])
  {
    uint64_t v25 = 0;
    objc_super v26 = &v25;
    uint64_t v27 = 0x3032000000;
    v28 = __Block_byref_object_copy_;
    v29 = __Block_byref_object_dispose_;
    id v30 = 0;
    v7 = [MEMORY[0x263F82438] sharedApplication];
    dispatch_queue_t v8 = [v7 openSessions];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __66__AXPIFingerEventSender__sendHandEvent_touchesByFingerIdentifier___block_invoke;
    v24[3] = &unk_264D863A0;
    v24[4] = self;
    v24[5] = &v25;
    [v8 enumerateObjectsUsingBlock:v24];

    v9 = (void *)v26[5];
    if (!v9)
    {
      uint64_t v10 = [MEMORY[0x263F82B60] mainScreen];
      v11 = (void *)v26[5];
      v26[5] = v10;

      v9 = (void *)v26[5];
    }
    id v12 = v6;
    id v13 = v9;
    uint64_t v14 = [v12 count];
    if (v4 == 8 || v14)
    {
      v15 = objc_msgSend(MEMORY[0x263F228A0], "touchRepresentationWithHandType:location:", v4, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
      objc_msgSend(v15, "setAdditionalFlags:", objc_msgSend(v15, "additionalFlags"));
      uint64_t v35 = 0;
      v36 = &v35;
      uint64_t v37 = 0x3032000000;
      v38 = __Block_byref_object_copy_;
      v39 = __Block_byref_object_dispose_;
      id v40 = [MEMORY[0x263EFF980] array];
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __AXPIEventRepresentationFromTouches_block_invoke;
      v31[3] = &unk_264D863C8;
      id v16 = v13;
      int v34 = v4;
      id v32 = v16;
      v33 = &v35;
      [v12 enumerateKeysAndObjectsUsingBlock:v31];
      uint64_t v17 = v36[5];
      v18 = [v15 handInfo];
      [v18 setPaths:v17];

      _Block_object_dispose(&v35, 8);
    }
    else
    {
      v15 = 0;
    }

    [v15 setGenerationCount:self->_eventGenerationCount];
    if (v15)
    {
      if ([(AXPIFingerEventSender *)self shouldAddRealEventFlag]) {
        objc_msgSend(v15, "setAdditionalFlags:", objc_msgSend(v15, "additionalFlags") | 0x8000);
      }
      v19 = [(AXPIFingerEventSender *)self properties];
      v20 = [v19 valueForKey:@"Built-In"];
      objc_msgSend(v15, "setIsBuiltIn:", objc_msgSend(v20, "BOOLValue"));

      v21 = [(AXPIFingerEventSender *)self properties];
      v22 = [v21 valueForKey:@"DisplayIntegrated"];
      objc_msgSend(v15, "setIsDisplayIntegrated:", objc_msgSend(v22, "BOOLValue"));

      v23 = (const void *)[v15 newHIDEventRef];
      if (v23)
      {
        IOHIDEventSetSenderID();
        [(HIDVirtualEventService *)self->_eventService dispatchEvent:v23];
        CFRelease(v23);
      }
    }

    _Block_object_dispose(&v25, 8);
  }
}

uint64_t __66__AXPIFingerEventSender__sendHandEvent_touchesByFingerIdentifier___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v14 = [a2 scene];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v14 screen];
    id v6 = [v5 displayConfiguration];
    v7 = [v6 hardwareIdentifier];

    if (v7
      || ([*(id *)(a1 + 32) displayUUID], (id v5 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      dispatch_queue_t v8 = [*(id *)(a1 + 32) displayUUID];
      int v9 = [v7 isEqualToString:v8];

      if (v7)
      {
        if (!v9)
        {
LABEL_7:

          goto LABEL_8;
        }
      }
      else
      {

        if ((v9 & 1) == 0) {
          goto LABEL_7;
        }
      }
    }
    uint64_t v10 = [v14 screen];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *a3 = 1;
    goto LABEL_7;
  }
LABEL_8:
  return MEMORY[0x270F9A758]();
}

- (id)_assignFingerIdentifiersToTouches:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    uint64_t v9 = 1;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v9 + i, (void)v14);
        [v4 setObject:v11 forKeyedSubscript:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      v9 += i;
    }
    while (v7);
  }

  return v4;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4 forService:(id)a5
{
  return 0;
}

- (id)propertyForKey:(id)a3 forService:(id)a4
{
  return -[NSDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", a3, a4);
}

- (id)copyEventMatching:(id)a3 forService:(id)a4
{
  return 0;
}

- (BOOL)setOutputEvent:(id)a3 forService:(id)a4
{
  return 0;
}

- (BOOL)shouldAddRealEventFlag
{
  return self->_shouldAddRealEventFlag;
}

- (void)setShouldAddRealEventFlag:(BOOL)a3
{
  self->_shouldAddRealEventFlag = a3;
}

- (unint64_t)senderID
{
  return self->_senderID;
}

- (HIDVirtualEventService)eventService
{
  return self->_eventService;
}

- (void)setEventService:(id)a3
{
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (OS_dispatch_queue)eventSendingQueue
{
  return self->_eventSendingQueue;
}

- (void)setEventSendingQueue:(id)a3
{
}

- (NSString)displayUUID
{
  return self->_displayUUID;
}

- (void)setDisplayUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayUUID, 0);
  objc_storeStrong((id *)&self->_eventSendingQueue, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_eventService, 0);
}

@end