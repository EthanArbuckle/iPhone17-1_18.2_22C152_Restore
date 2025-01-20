@interface AXPIEventSender
+ (id)sharedInstance;
- (AXPIEventSender)init;
- (unint64_t)senderID;
- (void)sendEventRepresentation:(id)a3;
- (void)sendIOHIDEventRef:(__IOHIDEvent *)a3;
- (void)setSenderID:(unint64_t)a3;
@end

@implementation AXPIEventSender

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance__shared;
  return v2;
}

uint64_t __33__AXPIEventSender_sharedInstance__block_invoke()
{
  sharedInstance__shared = objc_alloc_init(AXPIEventSender);
  return MEMORY[0x270F9A758]();
}

- (AXPIEventSender)init
{
  v6.receiver = self;
  v6.super_class = (Class)AXPIEventSender;
  v2 = [(AXPIEventSender *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("AXPIEventSender-EventSendingQueue", 0);
    eventSendingQueue = v2->_eventSendingQueue;
    v2->_eventSendingQueue = (OS_dispatch_queue *)v3;

    [(AXPIEventSender *)v2 setSenderID:0x8000000817319372];
  }
  return v2;
}

- (void)sendEventRepresentation:(id)a3
{
  id v4 = a3;
  eventSendingQueue = self->_eventSendingQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__AXPIEventSender_sendEventRepresentation___block_invoke;
  v7[3] = &unk_264D863F0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(eventSendingQueue, v7);
}

void __43__AXPIEventSender_sendEventRepresentation___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) postHIDEventDirectly])
  {
    if (!*(void *)(*(void *)(a1 + 40) + 8)) {
      *(void *)(*(void *)(a1 + 40) + 8) = IOHIDEventSystemClientCreate();
    }
    id v5 = [*(id *)(a1 + 32) normalizedEventRepresentation:0 scale:0];
    uint64_t v2 = [v5 newHIDEventRef];
    if (v2)
    {
      dispatch_queue_t v3 = (const void *)v2;
      IOHIDEventSetSenderID();
      IOHIDEventSystemClientDispatchEvent();
      CFRelease(v3);
    }
  }
  else
  {
    unint64_t v4 = ((unint64_t)[*(id *)(a1 + 32) additionalFlags] >> 14) & 1;
    objc_msgSend(*(id *)(a1 + 32), "setAdditionalFlags:", objc_msgSend(*(id *)(a1 + 32), "additionalFlags") & 0xFFFFFFFFFFFFBFFFLL);
    [*(id *)(a1 + 32) setSenderID:*(void *)(*(void *)(a1 + 40) + 24)];
    id v5 = [MEMORY[0x263F22840] server];
    [v5 postEvent:*(void *)(a1 + 32) systemEvent:v4];
  }
}

- (void)sendIOHIDEventRef:(__IOHIDEvent *)a3
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v7[3] = a3;
  if (a3) {
    CFRetain(a3);
  }
  eventSendingQueue = self->_eventSendingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__AXPIEventSender_sendIOHIDEventRef___block_invoke;
  block[3] = &unk_264D86418;
  block[5] = v7;
  block[6] = a3;
  block[4] = self;
  dispatch_async(eventSendingQueue, block);
  _Block_object_dispose(v7, 8);
}

void __37__AXPIEventSender_sendIOHIDEventRef___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 8)) {
    *(void *)(*(void *)(a1 + 32) + 8) = IOHIDEventSystemClientCreate();
  }
  IOHIDEventSetSenderID();
  IOHIDEventSystemClientDispatchEvent();
  uint64_t v2 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (unint64_t)senderID
{
  return self->_senderID;
}

- (void)setSenderID:(unint64_t)a3
{
  self->_senderID = a3;
}

- (void).cxx_destruct
{
}

@end