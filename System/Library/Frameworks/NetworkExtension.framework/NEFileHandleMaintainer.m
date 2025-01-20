@interface NEFileHandleMaintainer
+ (id)sharedMaintainer;
- (NEFileHandleMaintainer)init;
- (NSString)eventName;
- (id)copyAuxiliaryDataForKey:(id)a3;
- (id)createEvent;
- (void)commit;
- (void)iterateFileHandlesWithBlock:(id)a3;
- (void)removeFileHandleMatchingPredicate:(id)a3;
- (void)resetFileHandlesFromEvent:(id)a3;
- (void)setAuxiliaryData:(id)a3 forKey:(id)a4;
- (void)setEventName:(id)a3;
- (void)setFileHandle:(id)a3 matchingPredicate:(id)a4;
- (void)startOwnerModeWithEventName:(id)a3 handlesReceivedCallback:(id)a4;
@end

@implementation NEFileHandleMaintainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventName, 0);
  objc_storeStrong((id *)&self->_auxiliaryDataDictionary, 0);
  objc_storeStrong(&self->_receivedHandlesCallback, 0);

  objc_storeStrong((id *)&self->_fileHandles, 0);
}

- (void)setEventName:(id)a3
{
}

- (NSString)eventName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (id)copyAuxiliaryDataForKey:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!v5
    || (id v7 = objc_getProperty(v5, v6, 32, 1)) == 0
    || (v8 = v7, uint64_t v9 = [v4 length], v8, !v9))
  {
    v13 = ne_log_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v20 = 138412290;
      id v21 = v4;
      _os_log_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_INFO, "Failed to get auxiliary data for key %@: auxiliaryDataDictionary is nil", (uint8_t *)&v20, 0xCu);
    }
    goto LABEL_12;
  }
  id v11 = objc_getProperty(v5, v10, 32, 1);
  id v12 = v4;
  v13 = xpc_dictionary_get_value(v11, (const char *)[v12 UTF8String]);

  if (!v13)
  {
    v15 = ne_log_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      id v21 = v12;
      _os_log_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_DEFAULT, "Failed to get auxiliary data for key %@: key does not exist", (uint8_t *)&v20, 0xCu);
    }

    v13 = 0;
LABEL_12:
    v16 = 0;
    goto LABEL_15;
  }
  if (MEMORY[0x19F3B92C0](v13) == MEMORY[0x1E4F14580])
  {
    id v17 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    bytes_ptr = xpc_data_get_bytes_ptr(v13);
    uint64_t v14 = [v17 initWithBytesNoCopy:bytes_ptr length:xpc_data_get_length(v13) freeWhenDone:0];
  }
  else
  {
    uint64_t v14 = _CFXPCCreateCFObjectFromXPCObject();
  }
  v16 = (void *)v14;
LABEL_15:

  objc_sync_exit(v5);
  return v16;
}

- (void)setAuxiliaryData:(id)a3 forKey:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  if (v6 && [v7 length])
  {
    v10 = _CFXPCCreateXPCObjectFromCFObject();
    if (v10)
    {
      if (!v8 || !objc_getProperty(v8, v9, 32, 1))
      {
        xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
        uint64_t v14 = v12;
        if (!v8)
        {

          id Property = 0;
          goto LABEL_9;
        }
        objc_setProperty_atomic(v8, v13, v12, 32);
      }
      id Property = objc_getProperty(v8, v11, 32, 1);
LABEL_9:
      id v16 = Property;
      xpc_dictionary_set_value(v16, (const char *)[v7 UTF8String], v10);

      goto LABEL_15;
    }
    id v17 = ne_log_obj();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138412290;
      id v19 = v6;
      _os_log_error_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_ERROR, "Failed to convert %@ to an XPC object", (uint8_t *)&v18, 0xCu);
    }

    v10 = 0;
  }
  else
  {
    v10 = ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v18 = 134218242;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_error_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_ERROR, "Auxiliary data (%p) is nil or key (%@) has length 0", (uint8_t *)&v18, 0x16u);
    }
  }
LABEL_15:

  objc_sync_exit(v8);
}

- (void)iterateFileHandlesWithBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (uint64_t (**)(id, void))a3;
  v5 = self;
  objc_sync_enter(v5);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  if (v5) {
    id Property = objc_getProperty(v5, v6, 16, 1);
  }
  else {
    id Property = 0;
  }
  id v8 = Property;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
LABEL_5:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v13 != v10) {
        objc_enumerationMutation(v8);
      }
      if ((v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * v11)) & 1) == 0) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v9) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  objc_sync_exit(v5);
}

- (void)setFileHandle:(id)a3 matchingPredicate:(id)a4
{
  id v20 = a3;
  id v6 = (uint64_t (**)(id, void *))a4;
  if (v20)
  {
    id v7 = self;
    objc_sync_enter(v7);
    unint64_t v9 = 0;
    if (!v7) {
      goto LABEL_9;
    }
LABEL_3:
    for (id i = objc_getProperty(v7, v8, 16, 1); ; id i = 0)
    {
      id v11 = i;
      unint64_t v12 = [v11 count];

      if (v9 >= v12) {
        goto LABEL_12;
      }
      id v13 = v7 ? objc_getProperty(v7, v8, 16, 1) : 0;
      id v14 = v13;
      long long v15 = [v14 objectAtIndexedSubscript:v9];
      char v16 = v6[2](v6, v15);

      if (v16) {
        break;
      }
      ++v9;
      if (v7) {
        goto LABEL_3;
      }
LABEL_9:
      ;
    }
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_12:
      if (v7) {
        id Property = objc_getProperty(v7, v8, 16, 1);
      }
      else {
        id Property = 0;
      }
      id v18 = Property;
      [v18 addObject:v20];
      goto LABEL_18;
    }
    if (v7) {
      id v19 = objc_getProperty(v7, v8, 16, 1);
    }
    else {
      id v19 = 0;
    }
    id v18 = v19;
    [v18 setObject:v20 atIndexedSubscript:v9];
LABEL_18:

    if (v7) {
      v7->_changed = 1;
    }
    objc_sync_exit(v7);
  }
}

- (void)removeFileHandleMatchingPredicate:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = (unsigned int (**)(id, void))a3;
  v5 = self;
  objc_sync_enter(v5);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  if (v5) {
    id Property = objc_getProperty(v5, v6, 16, 1);
  }
  else {
    id Property = 0;
  }
  id v9 = Property;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (v4[2](v4, v13)) {
          objc_msgSend(v7, "addObject:", v13, (void)v17);
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  if ([v7 count])
  {
    if (v5) {
      id v15 = objc_getProperty(v5, v14, 16, 1);
    }
    else {
      id v15 = 0;
    }
    id v16 = v15;
    [v16 removeObjectsInArray:v7];

    if (v5) {
      v5->_changed = 1;
    }
  }

  objc_sync_exit(v5);
}

- (void)commit
{
  obj = self;
  objc_sync_enter(obj);
  v2 = [(NEFileHandleMaintainer *)obj createEvent];
  id v3 = [(NEFileHandleMaintainer *)obj eventName];
  [v3 UTF8String];
  xpc_set_event();

  if (obj) {
    obj->_changed = 0;
  }

  objc_sync_exit(obj);
}

- (id)createEvent
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  xpc_object_t v4 = xpc_array_create(0, 0);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  if (self) {
    id Property = objc_getProperty(self, v3, 16, 1);
  }
  else {
    id Property = 0;
  }
  id v6 = Property;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    uint64_t v10 = MEMORY[0x1E4F14590];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "dictionary", (void)v19);
        uint64_t v13 = (void *)v12;
        if (v12 && MEMORY[0x19F3B92C0](v12) == v10) {
          xpc_array_append_value(v4, v13);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v14, "handles-array", v4);
  if (self && objc_getProperty(self, v15, 32, 1))
  {
    id v17 = objc_getProperty(self, v16, 32, 1);
    xpc_dictionary_set_value(v14, "aux-data", v17);
  }

  return v14;
}

- (void)startOwnerModeWithEventName:(id)a3 handlesReceivedCallback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  [(NEFileHandleMaintainer *)v8 setEventName:v6];
  objc_initWeak(&location, v8);
  id v9 = v6;
  uint64_t v10 = (const char *)[v9 UTF8String];
  uint64_t v11 = MEMORY[0x1E4F14428];
  id v12 = MEMORY[0x1E4F14428];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__NEFileHandleMaintainer_startOwnerModeWithEventName_handlesReceivedCallback___block_invoke;
  v14[3] = &unk_1E598F918;
  objc_copyWeak(&v15, &location);
  xpc_set_event_stream_handler(v10, v11, v14);

  if (v8)
  {
    v8->_isOwnerMode = 1;
    objc_setProperty_atomic_copy(v8, v13, v7, 24);
  }
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  objc_sync_exit(v8);
}

void __78__NEFileHandleMaintainer_startOwnerModeWithEventName_handlesReceivedCallback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [WeakRetained eventName];
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_INFO, "Handling a %@ event", (uint8_t *)&v7, 0xCu);
    }
    [WeakRetained resetFileHandlesFromEvent:v3];
  }
}

- (void)resetFileHandlesFromEvent:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = MEMORY[0x19F3B92C0](v4);
    uint64_t v7 = MEMORY[0x1E4F14590];
    if (v6 == MEMORY[0x1E4F14590])
    {
      uint64_t v8 = xpc_dictionary_get_array(v5, "handles-array");
      uint64_t v9 = xpc_dictionary_get_dictionary(v5, "aux-data");
      uint64_t v10 = self;
      objc_sync_enter(v10);
      if (v10 && v10->_isOwnerMode && !objc_getProperty(v10, v11, 24, 1))
      {
        v30 = ne_log_obj();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_19DDAF000, v30, OS_LOG_TYPE_DEBUG, "Ignoring additional event in owner mode", buf, 2u);
        }

        objc_sync_exit(v10);
        goto LABEL_43;
      }
      if (v8 && MEMORY[0x19F3B92C0](v8) == MEMORY[0x1E4F14568])
      {
        id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        if (v10) {
          id Property = objc_getProperty(v10, v12, 16, 1);
        }
        else {
          id Property = 0;
        }
        id v14 = Property;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v38;
          do
          {
            uint64_t v17 = 0;
            do
            {
              if (*(void *)v38 != v16) {
                objc_enumerationMutation(v14);
              }
              long long v18 = objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * v17), "handle", v34);
              [v18 setReadabilityHandler:0];

              ++v17;
            }
            while (v15 != v17);
            uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v45 count:16];
          }
          while (v15);
        }

        if (v10) {
          objc_setProperty_atomic(v10, v19, 0, 16);
        }
        applier[0] = MEMORY[0x1E4F143A8];
        applier[1] = 3221225472;
        applier[2] = __52__NEFileHandleMaintainer_resetFileHandlesFromEvent___block_invoke;
        applier[3] = &unk_1E5991810;
        id v20 = v34;
        id v36 = v20;
        xpc_array_apply(v8, applier);
        if (v10) {
          objc_setProperty_atomic(v10, v21, v20, 16);
        }
        long long v22 = ne_log_large_obj();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          v32 = [(NEFileHandleMaintainer *)v10 eventName];
          if (v10) {
            id v33 = objc_getProperty(v10, v31, 16, 1);
          }
          else {
            id v33 = 0;
          }
          *(_DWORD *)buf = 138412546;
          v42 = v32;
          __int16 v43 = 2112;
          id v44 = v33;
          _os_log_debug_impl(&dword_19DDAF000, v22, OS_LOG_TYPE_DEBUG, "Current file handles for %@: %@", buf, 0x16u);
        }
      }
      if (v10) {
        objc_setProperty_atomic(v10, v11, 0, 32);
      }
      if (v9 && MEMORY[0x19F3B92C0](v9) == v7)
      {
        v25 = ne_log_obj();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_19DDAF000, v25, OS_LOG_TYPE_DEBUG, "Received an auxiliary data dictionary", buf, 2u);
        }

        if (!v10) {
          goto LABEL_37;
        }
        objc_setProperty_atomic(v10, v26, v9, 32);
      }
      else
      {
        v23 = ne_log_obj();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_19DDAF000, v23, OS_LOG_TYPE_DEBUG, "Did not receive an auxiliary data dictionary", buf, 2u);
        }

        if (!v10) {
          goto LABEL_37;
        }
      }
      if (objc_getProperty(v10, v24, 24, 1))
      {
        v28 = (void (**)(id))objc_getProperty(v10, v27, 24, 1);
        objc_setProperty_atomic_copy(v10, v29, 0, 24);
LABEL_38:
        objc_sync_exit(v10);

        if (!v28)
        {
LABEL_44:

          goto LABEL_45;
        }
        v28[2](v28);
        uint64_t v10 = (NEFileHandleMaintainer *)v28;
LABEL_43:

        goto LABEL_44;
      }
LABEL_37:
      v28 = 0;
      goto LABEL_38;
    }
  }
LABEL_45:
}

uint64_t __52__NEFileHandleMaintainer_resetFileHandlesFromEvent___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self;
  if (!v4
    || MEMORY[0x19F3B92C0](v4) != MEMORY[0x1E4F14590]
    || xpc_dictionary_get_uint64(v4, "type") - 1 > 2
    || (v5 = (objc_class *)objc_opt_class()) == 0)
  {

    goto LABEL_15;
  }
  uint64_t v6 = (void *)[[v5 alloc] initFromDictionary:v4];

  if (!v6)
  {
LABEL_15:
    id v8 = 0;
    goto LABEL_16;
  }
  if (nelog_is_debug_logging_enabled())
  {
    uint64_t v7 = ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_debug_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_DEBUG, "File Handle Maintainer adding %@", (uint8_t *)&v11, 0xCu);
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_13;
  }
  id v8 = v6;
  if ([v8 isRegisteredHandle])
  {

LABEL_13:
    [*(id *)(a1 + 32) addObject:v6];
    id v8 = v6;
    goto LABEL_16;
  }
  uint64_t v10 = ne_log_obj();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    int v11 = 138412290;
    id v12 = v8;
    _os_log_error_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_ERROR, "File Handle Maintainer not adding %@, agent not registered", (uint8_t *)&v11, 0xCu);
  }

LABEL_16:
  return 1;
}

- (NEFileHandleMaintainer)init
{
  v6.receiver = self;
  v6.super_class = (Class)NEFileHandleMaintainer;
  v2 = [(NEFileHandleMaintainer *)&v6 init];
  if (v2)
  {
    id v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    fileHandles = v2->_fileHandles;
    v2->_fileHandles = v3;
  }
  return v2;
}

+ (id)sharedMaintainer
{
  if (sharedMaintainer_once_token != -1) {
    dispatch_once(&sharedMaintainer_once_token, &__block_literal_global_3378);
  }
  v2 = (void *)sharedMaintainer_g_maintainer;

  return v2;
}

uint64_t __42__NEFileHandleMaintainer_sharedMaintainer__block_invoke()
{
  sharedMaintainer_g_maintainer = objc_alloc_init(NEFileHandleMaintainer);

  return MEMORY[0x1F41817F8]();
}

@end