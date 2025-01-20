@interface SpeakThisEventProcessor
- (BOOL)_handleEvent:(id)a3;
- (SpeakThisEventProcessor)init;
- (SpeakThisEventProcessor)initWithHIDTapIdentifier:(id)a3 HIDEventTapPriority:(int)a4 systemEventTapIdentifier:(id)a5 systemEventTapPriority:(int)a6;
- (SpeakThisEventProcessorDelegate)delegate;
- (id)contextForDisplayID:(unint64_t)a3;
- (unint64_t)activeDisplayId;
- (unsigned)contextIdForActiveDisplay;
- (void)addEventContextForWindow:(id)a3;
- (void)dealloc;
- (void)removeEventContextForContextID:(unsigned int)a3;
- (void)setActiveDisplayId:(unint64_t)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SpeakThisEventProcessor

- (SpeakThisEventProcessor)initWithHIDTapIdentifier:(id)a3 HIDEventTapPriority:(int)a4 systemEventTapIdentifier:(id)a5 systemEventTapPriority:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SpeakThisEventProcessor;
  v12 = [(SpeakThisEventProcessor *)&v22 initWithHIDTapIdentifier:v10 HIDEventTapPriority:v8 systemEventTapIdentifier:v11 systemEventTapPriority:v6];
  v13 = v12;
  if (v12)
  {
    [(SpeakThisEventProcessor *)v12 setHIDEventFilterMask:3];
    v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v15 = dispatch_queue_create("SpeakThisHIDDispatchQueue", v14);
    hidDispatchQueue = v13->_hidDispatchQueue;
    v13->_hidDispatchQueue = (OS_dispatch_queue *)v15;

    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x3032000000;
    v20[3] = sub_186D4;
    v20[4] = sub_186E4;
    v17 = v13;
    v21 = v17;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_186EC;
    v19[3] = &unk_28C18;
    v19[4] = v20;
    [(SpeakThisEventProcessor *)v17 setHIDEventHandler:v19];
    v17->_activeDisplayId = -1;
    _Block_object_dispose(v20, 8);
  }
  return v13;
}

- (SpeakThisEventProcessor)init
{
  return [(SpeakThisEventProcessor *)self initWithHIDTapIdentifier:SpeakThisHIDEventTapIdentifier HIDEventTapPriority:27 systemEventTapIdentifier:0 systemEventTapPriority:0];
}

- (void)dealloc
{
  [(NSMutableSet *)self->_eventContexts removeAllObjects];
  v3.receiver = self;
  v3.super_class = (Class)SpeakThisEventProcessor;
  [(SpeakThisEventProcessor *)&v3 dealloc];
}

- (void)addEventContextForWindow:(id)a3
{
  id v4 = a3;
  if (!self->_eventContexts)
  {
    v5 = +[NSMutableSet set];
    eventContexts = self->_eventContexts;
    self->_eventContexts = v5;
  }
  id v7 = [v4 _contextId];
  uint64_t v8 = [v4 screen];
  v9 = [v8 displayIdentity];
  uint64_t v10 = [v9 displayID];

  id v11 = [v4 screen];
  v12 = [v11 displayConfiguration];
  v13 = [v12 hardwareIdentifier];

  v14 = [[SpeakThisEventContext alloc] initWithDisplayID:v10 contextID:v7 displayHardwareID:v13];
  [(NSMutableSet *)self->_eventContexts addObject:v14];
  dispatch_queue_t v15 = AXLogSpeakScreen();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_19B28((int)v7, v15);
  }
}

- (void)removeEventContextForContextID:(unsigned int)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_eventContexts;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
      if (objc_msgSend(v10, "contextID", (void)v13) == a3) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v11 = v10;

    if (!v11) {
      goto LABEL_14;
    }
    [(NSMutableSet *)self->_eventContexts removeObject:v11];
    v12 = AXLogSpeakScreen();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_19C18(a3, v12);
    }
  }
  else
  {
LABEL_9:

LABEL_14:
    id v11 = AXLogSpeakScreen();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_19BA0(a3, v11);
    }
  }
}

- (id)contextForDisplayID:(unint64_t)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_eventContexts;
  id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "displayID", (void)v12) == (id)a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (unsigned)contextIdForActiveDisplay
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v3 = self->_eventContexts;
  id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "displayID", (void)v11) == self->_activeDisplayId)
        {
          unsigned int v9 = [v8 contextID];
          goto LABEL_11;
        }
      }
      id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  unsigned int v9 = -1;
LABEL_11:

  return v9;
}

- (BOOL)_handleEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(SpeakThisEventProcessor *)self delegate];
  [v5 speakThisUIFrameWithEventProcessor:self];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  long long v14 = [v4 denormalizedEventRepresentation:0 descale:1];

  long long v15 = [v14 handInfo];
  long long v16 = [v15 paths];
  v17 = [v16 firstObject];
  [v17 pathLocation];
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  v43.origin.x = v7;
  v43.origin.y = v9;
  v43.size.width = v11;
  v43.size.height = v13;
  v42.x = v19;
  v42.y = v21;
  if (CGRectContainsPoint(v43, v42)
    && [v14 type] == 3001
    && self->_disableSystemGesturesAssertion)
  {
    objc_super v22 = +[AXAssertion assertionWithType:AXAssertionTypeDisableSystemGestures identifier:@"User is interacting with speech controller"];
    disableSystemGesturesAssertion = self->_disableSystemGesturesAssertion;
    self->_disableSystemGesturesAssertion = v22;

LABEL_21:
    BOOL v35 = 0;
    goto LABEL_22;
  }
  v24 = self->_disableSystemGesturesAssertion;
  self->_disableSystemGesturesAssertion = 0;

  v25 = [v14 keyInfo];
  [v25 translateKeycode];

  v26 = [v14 keyInfo];
  if (![v26 keyDown]) {
    goto LABEL_10;
  }
  v27 = [v14 keyInfo];
  if ([v27 modifierState] != 2)
  {

LABEL_10:
    goto LABEL_11;
  }
  v28 = [v14 keyInfo];
  unsigned int v29 = [v28 keyCode];

  if (v29 == 41)
  {
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_1904C;
    v41[3] = &unk_28710;
    v41[4] = self;
    v30 = v41;
    goto LABEL_17;
  }
LABEL_11:
  v31 = [(SpeakThisEventProcessor *)self delegate];
  unsigned int v32 = [v31 isInSpeakUnderFingerModeWithEventProcessor:self];

  if (!v32) {
    goto LABEL_21;
  }
  v33 = [v14 handInfo];
  if ([v33 eventType] == 6) {
    goto LABEL_15;
  }
  v34 = [v14 handInfo];
  if ([v34 eventType] == 10)
  {

LABEL_15:
LABEL_16:
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_190CC;
    block[3] = &unk_28710;
    block[4] = self;
    v30 = block;
    goto LABEL_17;
  }
  v36 = [v14 handInfo];
  unsigned int v37 = [v36 eventType];

  if (v37 == 9) {
    goto LABEL_16;
  }
  if ([v14 type] != 3001) {
    goto LABEL_21;
  }
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_19120;
  v39[3] = &unk_28C40;
  v39[4] = self;
  *(CGFloat *)&v39[5] = v19;
  *(CGFloat *)&v39[6] = v21;
  v30 = v39;
LABEL_17:
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v30);
  BOOL v35 = 1;
LABEL_22:

  return v35;
}

- (SpeakThisEventProcessorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SpeakThisEventProcessorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)activeDisplayId
{
  return self->_activeDisplayId;
}

- (void)setActiveDisplayId:(unint64_t)a3
{
  self->_activeDisplayId = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_eventContexts, 0);
  objc_storeStrong((id *)&self->_disableSystemGesturesAssertion, 0);

  objc_storeStrong((id *)&self->_hidDispatchQueue, 0);
}

@end