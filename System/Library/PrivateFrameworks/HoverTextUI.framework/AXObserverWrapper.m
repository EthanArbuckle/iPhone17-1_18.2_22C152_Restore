@interface AXObserverWrapper
- (AXElement)systemElement;
- (AXObserverWrapper)initWithSystemElement:(id)a3 runloop:(id)a4 notifications:(id)a5 handler:(id)a6 error:(id *)a7;
- (NSArray)notifications;
- (NSRunLoop)runloop;
- (__AXObserver)observer;
- (id)handler;
- (void)dealloc;
- (void)setHandler:(id)a3;
- (void)setNotifications:(id)a3;
- (void)setObserver:(__AXObserver *)a3;
- (void)setRunloop:(id)a3;
- (void)setSystemElement:(id)a3;
@end

@implementation AXObserverWrapper

- (AXObserverWrapper)initWithSystemElement:(id)a3 runloop:(id)a4 notifications:(id)a5 handler:(id)a6 error:(id *)a7
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v40.receiver = self;
  v40.super_class = (Class)AXObserverWrapper;
  v16 = [(AXObserverWrapper *)&v40 init];
  v17 = v16;
  if (!v16)
  {
LABEL_15:
    v19 = v17;
    goto LABEL_16;
  }
  [(AXObserverWrapper *)v16 setRunloop:v13];
  [(AXObserverWrapper *)v17 setNotifications:v14];
  AXObserverRef outObserver = 0;
  [(AXObserverWrapper *)v17 setHandler:v15];
  [(AXObserverWrapper *)v17 setSystemElement:v12];
  AXError v18 = AXObserverCreate([v12 pid], (AXObserverCallback)_axEventHandler, &outObserver);
  if (v18 == kAXErrorSuccess)
  {
    [(AXObserverWrapper *)v17 setObserver:outObserver];
    CFRelease(outObserver);
    v20 = (__CFRunLoop *)[v13 getCFRunLoop];
    RunLoopSource = AXObserverGetRunLoopSource([(AXObserverWrapper *)v17 observer]);
    CFRunLoopAddSource(v20, RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v22 = v14;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      id v32 = v15;
      id v33 = v14;
      id v34 = v13;
      uint64_t v25 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v36 != v25) {
            objc_enumerationMutation(v22);
          }
          CFStringRef v27 = (const __CFString *)[*(id *)(*((void *)&v35 + 1) + 8 * i) intValue];
          v28 = [(AXObserverWrapper *)v17 observer];
          v29 = [(AXObserverWrapper *)v17 systemElement];
          v30 = [v29 uiElement];
          AXObserverAddNotification(v28, (AXUIElementRef)[v30 axElement], v27, v17);
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v35 objects:v41 count:16];
      }
      while (v24);

      id v14 = v33;
      id v13 = v34;
      id v15 = v32;
    }
    else
    {
    }
    goto LABEL_15;
  }
  if (a7)
  {
    objc_msgSend(MEMORY[0x263F087E8], "ax_errorWithDomain:description:", @"HoverText", @"Could not make observer. error: %ld", v18);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = 0;
LABEL_16:

  return v19;
}

- (void)dealloc
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v3 = [(AXObserverWrapper *)self notifications];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        CFStringRef v8 = (const __CFString *)[*(id *)(*((void *)&v16 + 1) + 8 * v7) intValue];
        v9 = [(AXObserverWrapper *)self observer];
        v10 = [(AXObserverWrapper *)self systemElement];
        v11 = [v10 uiElement];
        AXObserverRemoveNotification(v9, (AXUIElementRef)[v11 axElement], v8);

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  id v12 = [(AXObserverWrapper *)self runloop];
  id v13 = (__CFRunLoop *)[v12 getCFRunLoop];
  RunLoopSource = AXObserverGetRunLoopSource([(AXObserverWrapper *)self observer]);
  CFRunLoopRemoveSource(v13, RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE88]);

  v15.receiver = self;
  v15.super_class = (Class)AXObserverWrapper;
  [(AXObserverWrapper *)&v15 dealloc];
}

- (AXElement)systemElement
{
  return self->_systemElement;
}

- (void)setSystemElement:(id)a3
{
}

- (__AXObserver)observer
{
  return self->_observer;
}

- (void)setObserver:(__AXObserver *)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (NSArray)notifications
{
  return self->_notifications;
}

- (void)setNotifications:(id)a3
{
}

- (NSRunLoop)runloop
{
  return self->_runloop;
}

- (void)setRunloop:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runloop, 0);
  objc_storeStrong((id *)&self->_notifications, 0);
  objc_storeStrong(&self->_handler, 0);

  objc_storeStrong((id *)&self->_systemElement, 0);
}

@end