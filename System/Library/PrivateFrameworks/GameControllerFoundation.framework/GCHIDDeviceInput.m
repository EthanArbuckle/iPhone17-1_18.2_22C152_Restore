@interface GCHIDDeviceInput
- (BOOL)isSuspended;
- (GCHIDDeviceInput)init;
- (GCHIDDeviceInput)initWithIOHIDDevice:(__IOHIDDevice *)a3;
- (NSSet)elements;
- (__IOHIDDevice)deviceRef;
- (id)batchInputElementHandler;
- (void)activate;
- (void)cancel;
- (void)dealloc;
- (void)setBatchInputElementHandler:(id)a3;
- (void)setCancelHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInputElementMatching:(id)a3;
- (void)setInputElements:(id)a3;
- (void)setSuspended:(BOOL)a3;
@end

@implementation GCHIDDeviceInput

- (GCHIDDeviceInput)initWithIOHIDDevice:(__IOHIDDevice *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)GCHIDDeviceInput;
  v4 = [(GCHIDDeviceInput *)&v13 init];
  v5 = (__IOHIDDevice *)CFRetain(a3);
  io_service_t Service = IOHIDDeviceGetService(v5);
  if (Service) {
    IORegistryEntryGetRegistryEntryID(Service, &v4->_cachedDeviceRegistryEntryID);
  }
  IOHIDQueueRef v7 = IOHIDQueueCreate(kCFAllocatorDefault, v5, 20, 0);
  v4->_queue = v7;
  if (v7)
  {
    uint64_t v8 = [objc_alloc((Class)&off_26BEEB1B8) initWithCapacity:20];
    changedElements = v4->_changedElements;
    v4->_changedElements = (NSMutableArray *)v8;

    IOHIDQueueRegisterValueAvailableCallback(v4->_queue, (IOHIDCallback)__IOHIDQueueInputElementValueCallback, v4);
    [(GCHIDDeviceInput *)v4 setInputElementMatching:0];
    v10 = v4;
  }
  else
  {
    v11 = _gc_log_hid_input();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[GCHIDDeviceInput initWithIOHIDDevice:]((uint64_t)v5, v11);
    }

    v10 = 0;
  }

  return v10;
}

- (GCHIDDeviceInput)init
{
  return 0;
}

- (void)dealloc
{
  queue = self->_queue;
  if (queue)
  {
    IOHIDDeviceRef Device = IOHIDQueueGetDevice(queue);
    CFRelease(Device);
    CFRelease(self->_queue);
    self->_queue = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)GCHIDDeviceInput;
  [(GCHIDDeviceInput *)&v5 dealloc];
}

- (__IOHIDDevice)deviceRef
{
  return IOHIDQueueGetDevice(self->_queue);
}

- (void)setSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_suspended != v3)
  {
    obj->_suspended = v3;
    if (obj->_activated)
    {
      queue = obj->_queue;
      if (v3) {
        IOHIDQueueStop(queue);
      }
      else {
        IOHIDQueueStart(queue);
      }
    }
  }
  objc_sync_exit(obj);
}

- (void)activate
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_activated)
  {
    BOOL v3 = _os_activity_create(&dword_20AD04000, "[HID Input] Activate", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v3, &state);
    queue = v2->_queue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = __28__GCHIDDeviceInput_activate__block_invoke;
    handler[3] = &unk_26BEC3CA8;
    handler[4] = v2;
    IOHIDQueueSetCancelHandler(queue, handler);
    BOOL suspended = v2->_suspended;
    if (v2->_suspended) {
      [(GCHIDDeviceInput *)v2 willChangeValueForKey:@"suspended"];
    }
    *(_WORD *)&v2->_activated = 1;
    IOHIDQueueActivate(v2->_queue);
    if (suspended) {
      [(GCHIDDeviceInput *)v2 didChangeValueForKey:@"suspended"];
    }
    os_activity_scope_leave(&state);
  }
  objc_sync_exit(v2);
}

void __28__GCHIDDeviceInput_activate__block_invoke(uint64_t a1)
{
  v2 = _os_activity_create(&dword_20AD04000, "[HID Input] Cancelled", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v2, &v6);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))();
    uint64_t v4 = *(void *)(a1 + 32);
    objc_super v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = 0;
  }
  os_activity_scope_leave(&v6);
}

- (void)cancel
{
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)batchInputElementHandler
{
  if (a1)
  {
    a1 = objc_getProperty(a1, sel_batchInputElementHandler, 24, 1);
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setBatchInputElementHandler:(id)a3
{
  id v5 = _Block_copy(a3);
  objc_setProperty(self, a2, 24, v5, 1, 1);
}

- (void)setCancelHandler:(id)a3
{
  id v5 = _Block_copy(a3);
  objc_setProperty(self, a2, 16, v5, 1, 1);
}

- (void)setInputElements:(id)a3
{
  id v4 = a3;
  id v5 = _gc_log_hid_input();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(GCHIDDeviceInput *)(uint64_t)self setInputElements:v5];
  }

  IOHIDDeviceRef Device = IOHIDQueueGetDevice(self->_queue);
  IOHIDQueueRef v7 = objc_msgSend(objc_alloc((Class)&off_26BEEB428), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  obuint64_t j = v4;
  uint64_t v8 = [obj countByEnumeratingWithState:&v65 objects:v72 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v66;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v66 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v65 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v11 = (void *)[v11 element];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            CFTypeID v12 = CFGetTypeID(v11);
            if (v12 != IOHIDElementGetTypeID())
            {
              objc_super v13 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
              [v13 handleFailureInMethod:a2, self, @"GCHIDDeviceInput.m", 215, @"Invalid object: %@", v11 object file lineNumber description];

              goto LABEL_14;
            }
          }
        }
        if (IOHIDElementGetDevice((IOHIDElementRef)v11) == Device)
        {
          [v7 addObject:v11];
        }
        else
        {
          v14 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
          [v14 handleFailureInMethod:a2, self, @"GCHIDDeviceInput.m", 219, @"<HIDElement %@> is not an element of %@", v11, Device object file lineNumber description];
        }
LABEL_14:
        ++v10;
      }
      while (v8 != v10);
      uint64_t v15 = [obj countByEnumeratingWithState:&v65 objects:v72 count:16];
      uint64_t v8 = v15;
    }
    while (v15);
  }

  CFArrayRef v49 = IOHIDDeviceCopyMatchingElements(Device, (CFDictionaryRef)&unk_26BEE2898, 0);
  if (!v49)
  {
    v45 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v45 handleFailureInMethod:a2, self, @"GCHIDDeviceInput.m", 230, @"Could not obtain the NULL elements from %@.", Device object file lineNumber description];
  }
  v50 = self;
  objc_sync_enter(v50);
  IOHIDQueueStop(self->_queue);
  while (1)
  {
    IOHIDValueRef Value = IOHIDQueueCopyNextValue(self->_queue);
    if (!Value) {
      break;
    }
    CFRelease(Value);
  }
  v17 = [(GCHIDDeviceInput *)v50 elements];
  v18 = (void *)[v17 mutableCopy];
  v19 = v18;
  if (v18) {
    CFMutableSetRef Mutable = v18;
  }
  else {
    CFMutableSetRef Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
  }
  CFMutableSetRef v21 = Mutable;

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v22 = (void *)_IOHIDQueueCopyElements();
  uint64_t v23 = [v22 countByEnumeratingWithState:&v61 objects:v71 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v62 != v24) {
          objc_enumerationMutation(v22);
        }
        v26 = *(__IOHIDElement **)(*((void *)&v61 + 1) + 8 * i);
        v27 = [v7 member:v26];
        BOOL v28 = v27 == 0;

        if (v28)
        {
          v29 = [(__CFSet *)v21 member:v26];
          if (!v29 && IOHIDElementGetType(v26) != kIOHIDElementTypeInput_NULL)
          {
            v48 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
            objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, v50, v26);
          }
          [(__CFSet *)v21 removeObject:v26];
          IOHIDQueueRemoveElement(self->_queue, v26);
        }
      }
      uint64_t v23 = [v22 countByEnumeratingWithState:&v61 objects:v71 count:16];
    }
    while (v23);
  }

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v30 = v7;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v57 objects:v70 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v58;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v58 != v32) {
          objc_enumerationMutation(v30);
        }
        v34 = *(__IOHIDElement **)(*((void *)&v57 + 1) + 8 * j);
        v35 = [(__CFSet *)v21 member:v34];
        BOOL v36 = v35 == 0;

        if (v36)
        {
          v37 = [[GCHIDInputElement alloc] initWithElement:v34];
          [(__CFSet *)v21 addObject:v37];
          IOHIDQueueAddElement(self->_queue, v34);
        }
      }
      uint64_t v31 = [v30 countByEnumeratingWithState:&v57 objects:v70 count:16];
    }
    while (v31);
  }

  v38 = (void *)_IOHIDQueueCopyElements();
  uint64_t v39 = [v38 count];
  BOOL v40 = v39 == [(__CFSet *)v21 count];

  if (!v40)
  {
    v46 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    v47 = (void *)_IOHIDQueueCopyElements();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, v50, objc_msgSend(v47, "count"), -[__CFSet count](v21, "count"));
  }
  [(GCHIDDeviceInput *)v50 willChangeValueForKey:@"elements"];
  objc_setProperty(v50, a2, 56, v21, 1, 1);
  [(GCHIDDeviceInput *)v50 didChangeValueForKey:@"elements"];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  CFArrayRef v41 = v49;
  uint64_t v42 = [(__CFArray *)v41 countByEnumeratingWithState:&v53 objects:v69 count:16];
  if (v42)
  {
    uint64_t v43 = *(void *)v54;
    do
    {
      for (uint64_t k = 0; k != v42; ++k)
      {
        if (*(void *)v54 != v43) {
          objc_enumerationMutation(v41);
        }
        IOHIDQueueAddElement(self->_queue, *(IOHIDElementRef *)(*((void *)&v53 + 1) + 8 * k));
      }
      uint64_t v42 = [(__CFArray *)v41 countByEnumeratingWithState:&v53 objects:v69 count:16];
    }
    while (v42);
  }

  if (v50->_activated && !v50->_suspended) {
    IOHIDQueueStart(self->_queue);
  }

  objc_sync_exit(v50);
}

- (void)setInputElementMatching:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (v5)
    {
      if ((isKindOfClass & 1) == 0)
      {
        v25 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
        [v25 handleFailureInMethod:a2, self, @"GCHIDDeviceInput.m", 293, @"Unknown matching criteria: %@", v5 object file lineNumber description];
      }
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v5 count])
    {
      id v32 = v5;
      id v7 = +[NSArray arrayWithObjects:&v32 count:1];
      goto LABEL_11;
    }
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v5 count])
    {
      id v7 = v5;
LABEL_11:
      uint64_t v8 = v7;
      uint64_t v9 = objc_opt_new();
      if (v8)
      {
        SEL v26 = a2;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v10 = v8;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v28;
          v14 = &selRef_unmapMemoryAt_;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v28 != v13) {
                objc_enumerationMutation(v10);
              }
              CFDictionaryRef v16 = *(const __CFDictionary **)(*((void *)&v27 + 1) + 8 * v15);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                IOHIDDeviceRef Device = IOHIDQueueGetDevice(self->_queue);
                CFArrayRef v18 = IOHIDDeviceCopyMatchingElements(Device, v16, 0);
                if (v18)
                {
                  CFArrayRef v19 = v18;
                  [v9 addObjectsFromArray:v18];
                  CFRelease(v19);
                }
              }
              else
              {
                v20 = [v14[59] currentHandler];
                [v20 handleFailureInMethod:v26, self, @"GCHIDDeviceInput.m", 314, @"Invalid matching rule: %@", v16 object file lineNumber description];

                v14 = &selRef_unmapMemoryAt_;
              }
              ++v15;
            }
            while (v12 != v15);
            uint64_t v21 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
            uint64_t v12 = v21;
          }
          while (v21);
        }

LABEL_30:
        [(GCHIDDeviceInput *)self setInputElements:v9];
        goto LABEL_31;
      }
LABEL_28:
      v22 = IOHIDQueueGetDevice(self->_queue);
      CFArrayRef v23 = IOHIDDeviceCopyMatchingElements(v22, 0, 0);
      if (v23)
      {
        CFArrayRef v24 = v23;
        [v9 addObjectsFromArray:v23];
        CFRelease(v24);
      }
      goto LABEL_30;
    }
LABEL_27:
    uint64_t v9 = objc_opt_new();
    goto LABEL_28;
  }
  if (!v5) {
    goto LABEL_27;
  }
  uint64_t v9 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
  [v9 handleFailureInMethod:a2, self, @"GCHIDDeviceInput.m", 306, @"Invalid matching criteria: %@", v5 object file lineNumber description];
LABEL_31:
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (NSSet)elements
{
  return (NSSet *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_changedElements, 0);
  objc_storeStrong(&self->_inputHandler, 0);

  objc_storeStrong(&self->_cancelHandler, 0);
}

- (void)initWithIOHIDDevice:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20AD04000, a2, OS_LOG_TYPE_ERROR, "Failed to create IOHIDQueue for %@.", (uint8_t *)&v2, 0xCu);
}

- (void)setInputElements:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2048;
  uint64_t v7 = [a2 count];
  _os_log_debug_impl(&dword_20AD04000, a3, OS_LOG_TYPE_DEBUG, "%@: Track %zd elements.", (uint8_t *)&v4, 0x16u);
}

@end