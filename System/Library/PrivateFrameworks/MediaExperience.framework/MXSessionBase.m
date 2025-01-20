@interface MXSessionBase
+ (BOOL)isNonSerializedCopyProperty:(id)a3;
+ (BOOL)isNonSerializedSetProperty:(id)a3;
+ (BOOL)isNonSerializedSetPropertyWhenSessionIsInactive:(id)a3;
+ (id)getSetPropertiesOrder;
+ (int64_t)generateSessionID;
- (MXCoreSessionBase)parentCoreSession;
- (MXSessionBase)init;
- (NSNumber)ID;
- (id)copyProperties:(id)a3 outPropertyErrors:(id *)a4;
- (id)copyPropertiesInternal:(id)a3 outPropertyErrors:(id *)a4;
- (int)_beginInterruptionWithSecTask:(__SecTask *)a3 andFlags:(unint64_t)a4;
- (int)_endInterruptionWithSecTask:(__SecTask *)a3 andStatus:(id)a4;
- (int)_setPropertyForKey:(id)a3 value:(id)a4;
- (int)copyPropertyForKey:(id)a3 valueOut:(id *)a4;
- (int)copyPropertyForKeyInternal:(id)a3 valueOut:(id *)a4;
- (int)setOrderedProperties:(id)a3 usingErrorHandlingStrategy:(unsigned __int8)a4 outPropertiesErrors:(id *)a5;
- (int)setOrderedPropertiesInternal:(id)a3 usingErrorHandlingStrategy:(unsigned __int8)a4 outPropertiesErrors:(id *)a5;
- (int)setProperties:(id)a3 usingErrorHandlingStrategy:(unsigned __int8)a4 outPropertiesErrors:(id *)a5;
- (int)setPropertiesInternal:(id)a3 usingErrorHandlingStrategy:(unsigned __int8)a4 outPropertiesErrors:(id *)a5;
- (int)setPropertyForKey:(id)a3 value:(id)a4;
- (int)setPropertyForKeyInternal:(id)a3 value:(id)a4 fromPropertiesBatch:(id)a5;
- (void)dealloc;
- (void)setID:(id)a3;
- (void)setParentCoreSession:(id)a3;
@end

@implementation MXSessionBase

+ (BOOL)isNonSerializedCopyProperty:(id)a3
{
  MXSimulateCrash((uint64_t)"This is an abstract method and should be overriden! Please file a radar against 'MediaExperie"
                           "nce Session | All'");
  return 0;
}

+ (BOOL)isNonSerializedSetProperty:(id)a3
{
  MXSimulateCrash((uint64_t)"This is an abstract method and should be overriden! Please file a radar against 'MediaExperie"
                           "nce Session | All'");
  return 0;
}

+ (BOOL)isNonSerializedSetPropertyWhenSessionIsInactive:(id)a3
{
  MXSimulateCrash((uint64_t)"This is an abstract method and should be overriden! Please file a radar against 'MediaExperie"
                           "nce Session | All'");
  return 0;
}

+ (id)getSetPropertiesOrder
{
  MXSimulateCrash((uint64_t)"This is an abstract method and should be overriden! Please file a radar against 'MediaExperie"
                           "nce Session | All'");
  return 0;
}

+ (int64_t)generateSessionID
{
  return FigAtomicIncrement64();
}

- (MXSessionBase)init
{
  v4.receiver = self;
  v4.super_class = (Class)MXSessionBase;
  v2 = [(MXSessionBase *)&v4 init];
  if (v2) {
    v2->_ID = (NSNumber *)objc_msgSend(objc_alloc(MEMORY[0x1E4F28ED0]), "initWithLongLong:", +[MXSessionBase generateSessionID](MXSessionBase, "generateSessionID"));
  }
  return v2;
}

- (void)dealloc
{
  self->_ID = 0;
  self->_parentCoreSession = 0;
  v3.receiver = self;
  v3.super_class = (Class)MXSessionBase;
  [(MXSessionBase *)&v3 dealloc];
}

- (int)setPropertyForKeyInternal:(id)a3 value:(id)a4 fromPropertiesBatch:(id)a5
{
  MXSimulateCrash((uint64_t)"This is an abstract method and should be overriden! Please file a radar against 'MediaExperie"
                           "nce Session | All'");
  return 0;
}

- (int)_setPropertyForKey:(id)a3 value:(id)a4
{
  return [(MXSessionBase *)self setPropertyForKeyInternal:a3 value:a4 fromPropertiesBatch:0];
}

- (int)setPropertyForKey:(id)a3 value:(id)a4
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  if (([(id)objc_opt_class() isNonSerializedSetProperty:a3] & 1) != 0
    || [(id)objc_opt_class() isNonSerializedSetPropertyWhenSessionIsInactive:a3]
    && ![(MXCoreSessionBase *)[(MXSessionBase *)self parentCoreSession] isActive])
  {
    int v7 = [(MXSessionBase *)self setPropertyForKeyInternal:a3 value:a4 fromPropertiesBatch:0];
    *((_DWORD *)v12 + 6) = v7;
  }
  else
  {
    v8 = MXGetSerialQueue();
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __41__MXSessionBase_setPropertyForKey_value___block_invoke;
    v10[3] = &unk_1E57C57E0;
    v10[4] = self;
    v10[5] = a3;
    v10[6] = a4;
    v10[7] = &v11;
    MXDispatchAsyncAndWait((uint64_t)"-[MXSessionBase setPropertyForKey:value:]", (uint64_t)"MXSessionBase.m", 113, 0, 0, v8, (uint64_t)v10);
    int v7 = *((_DWORD *)v12 + 6);
  }
  _Block_object_dispose(&v11, 8);
  return v7;
}

uint64_t __41__MXSessionBase_setPropertyForKey_value___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _setPropertyForKey:*(void *)(a1 + 40) value:*(void *)(a1 + 48)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (int)copyPropertyForKeyInternal:(id)a3 valueOut:(id *)a4
{
  MXSimulateCrash((uint64_t)"This is an abstract method and should be overriden! Please file a radar against 'MediaExperie"
                           "nce Session | All'");
  return 0;
}

- (int)copyPropertyForKey:(id)a3 valueOut:(id *)a4
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  if ([(id)objc_opt_class() isNonSerializedCopyProperty:a3])
  {
    int v7 = [(MXSessionBase *)self copyPropertyForKeyInternal:a3 valueOut:a4];
    *((_DWORD *)v12 + 6) = v7;
  }
  else
  {
    v8 = MXGetSerialQueue();
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __45__MXSessionBase_copyPropertyForKey_valueOut___block_invoke;
    v10[3] = &unk_1E57C5808;
    v10[4] = self;
    v10[5] = a3;
    v10[6] = &v11;
    v10[7] = a4;
    MXDispatchAsyncAndWait((uint64_t)"-[MXSessionBase copyPropertyForKey:valueOut:]", (uint64_t)"MXSessionBase.m", 143, 0, 0, v8, (uint64_t)v10);
    int v7 = *((_DWORD *)v12 + 6);
  }
  _Block_object_dispose(&v11, 8);
  return v7;
}

uint64_t __45__MXSessionBase_copyPropertyForKey_valueOut___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _copyPropertyForKey:*(void *)(a1 + 40) valueOut:*(void *)(a1 + 56)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (int)setProperties:(id)a3 usingErrorHandlingStrategy:(unsigned __int8)a4 outPropertiesErrors:(id *)a5
{
  uint64_t v6 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  +[MXInitialization waitUntilMXIsFullyInitialized];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  int v27 = 0;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v9 = [a3 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(a3);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        if (([(id)objc_opt_class() isNonSerializedSetProperty:v12] & 1) == 0
          && (![(id)objc_opt_class() isNonSerializedSetPropertyWhenSessionIsInactive:v12]
           || [(MXCoreSessionBase *)[(MXSessionBase *)self parentCoreSession] isActive]))
        {
          int v14 = MXGetSerialQueue();
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __78__MXSessionBase_setProperties_usingErrorHandlingStrategy_outPropertiesErrors___block_invoke;
          v18[3] = &unk_1E57C5830;
          v18[4] = self;
          v18[5] = a3;
          char v19 = v6;
          v18[6] = &v24;
          v18[7] = a5;
          MXDispatchAsyncAndWait((uint64_t)"-[MXSessionBase setProperties:usingErrorHandlingStrategy:outPropertiesErrors:]", (uint64_t)"MXSessionBase.m", 173, 0, 0, v14, (uint64_t)v18);
          if (a5) {
            id v15 = *a5;
          }
          goto LABEL_14;
        }
      }
      uint64_t v9 = [a3 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  int v13 = [(MXSessionBase *)self setPropertiesInternal:a3 usingErrorHandlingStrategy:v6 outPropertiesErrors:a5];
  *((_DWORD *)v25 + 6) = v13;
LABEL_14:
  int v16 = *((_DWORD *)v25 + 6);
  _Block_object_dispose(&v24, 8);
  return v16;
}

id __78__MXSessionBase_setProperties_usingErrorHandlingStrategy_outPropertiesErrors___block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(a1 + 32) _setProperties:*(void *)(a1 + 40) usingErrorHandlingStrategy:*(unsigned __int8 *)(a1 + 64) outPropertiesErrors:*(void *)(a1 + 56)];
  objc_super v3 = *(void ***)(a1 + 56);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  if (v3)
  {
    objc_super v4 = *v3;
    return v4;
  }
  return result;
}

- (int)setPropertiesInternal:(id)a3 usingErrorHandlingStrategy:(unsigned __int8)a4 outPropertiesErrors:(id *)a5
{
  int v6 = a4;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v36 = a5;
  if (a3)
  {
    if (dword_1E9359ED0)
    {
      int v52 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    CMSMDebugUtility_PrintDictionary(a3);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v11 = (void *)[(id)objc_opt_class() getSetPropertiesOrder];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v47 objects:v61 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v48 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v47 + 1) + 8 * i);
          uint64_t v17 = objc_msgSend(a3, "objectForKey:", v16, v34, v35);
          if (v17)
          {
            uint64_t v59 = v16;
            uint64_t v60 = v17;
            objc_msgSend(v9, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1));
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v47 objects:v61 count:16];
      }
      while (v13);
    }
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v18 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v43, v58, 16, v34, v35);
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v44;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v44 != v20) {
            objc_enumerationMutation(a3);
          }
          uint64_t v22 = *(void *)(*((void *)&v43 + 1) + 8 * j);
          if ((objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "getSetPropertiesOrder"), "containsObject:", v22) & 1) == 0)
          {
            uint64_t v56 = v22;
            uint64_t v57 = [a3 objectForKey:v22];
            objc_msgSend(v9, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1));
          }
        }
        uint64_t v19 = [a3 countByEnumeratingWithState:&v43 objects:v58 count:16];
      }
      while (v19);
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v23 = [v9 countByEnumeratingWithState:&v39 objects:v55 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      int v37 = 0;
      uint64_t v25 = *(void *)v40;
      do
      {
        for (uint64_t k = 0; k != v24; ++k)
        {
          if (*(void *)v40 != v25) {
            objc_enumerationMutation(v9);
          }
          int v27 = *(void **)(*((void *)&v39 + 1) + 8 * k);
          v28 = (void *)MEMORY[0x1997179E0]();
          uint64_t v29 = objc_msgSend((id)objc_msgSend(v27, "allKeys"), "firstObject");
          uint64_t v30 = [v27 objectForKey:v29];
          if (v30 == [MEMORY[0x1E4F1CA98] null]) {
            uint64_t v31 = 0;
          }
          else {
            uint64_t v31 = v30;
          }
          uint64_t v32 = [(MXSessionBase *)self setPropertyForKeyInternal:v29 value:v31 fromPropertiesBatch:a3];
          uint64_t v53 = v29;
          uint64_t v54 = [MEMORY[0x1E4F28ED0] numberWithInt:v32];
          objc_msgSend(v38, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1));
          if (v6 == 2)
          {
            if (v32) {
              int v37 = FigSignalErrorAt();
            }
          }
          else if (v6 == 1 && v32)
          {
            int v37 = FigSignalErrorAt();
            goto LABEL_40;
          }
        }
        uint64_t v24 = [v9 countByEnumeratingWithState:&v39 objects:v55 count:16];
      }
      while (v24);
    }
    else
    {
      int v37 = 0;
    }
  }
  else
  {
    int v37 = FigSignalErrorAt();
  }
LABEL_40:
  if (v36) {
    id *v36 = v38;
  }
  else {

  }
  return v37;
}

- (int)setOrderedProperties:(id)a3 usingErrorHandlingStrategy:(unsigned __int8)a4 outPropertiesErrors:(id *)a5
{
  uint64_t v6 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  +[MXInitialization waitUntilMXIsFullyInitialized];
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  int v27 = 0;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v9 = [a3 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(a3);
        }
        uint64_t v12 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "allKeys"), "firstObject");
        if (([(id)objc_opt_class() isNonSerializedSetProperty:v12] & 1) == 0
          && (![(id)objc_opt_class() isNonSerializedSetPropertyWhenSessionIsInactive:v12]
           || [(MXCoreSessionBase *)[(MXSessionBase *)self parentCoreSession] isActive]))
        {
          uint64_t v14 = MXGetSerialQueue();
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __85__MXSessionBase_setOrderedProperties_usingErrorHandlingStrategy_outPropertiesErrors___block_invoke;
          v18[3] = &unk_1E57C5830;
          v18[4] = self;
          v18[5] = a3;
          char v19 = v6;
          v18[6] = &v24;
          v18[7] = a5;
          MXDispatchAsyncAndWait((uint64_t)"-[MXSessionBase setOrderedProperties:usingErrorHandlingStrategy:outPropertiesErrors:]", (uint64_t)"MXSessionBase.m", 301, 0, 0, v14, (uint64_t)v18);
          if (a5) {
            id v15 = *a5;
          }
          goto LABEL_14;
        }
      }
      uint64_t v9 = [a3 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  int v13 = [(MXSessionBase *)self setOrderedPropertiesInternal:a3 usingErrorHandlingStrategy:v6 outPropertiesErrors:a5];
  *((_DWORD *)v25 + 6) = v13;
LABEL_14:
  int v16 = *((_DWORD *)v25 + 6);
  _Block_object_dispose(&v24, 8);
  return v16;
}

id __85__MXSessionBase_setOrderedProperties_usingErrorHandlingStrategy_outPropertiesErrors___block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(a1 + 32) _setOrderedProperties:*(void *)(a1 + 40) usingErrorHandlingStrategy:*(unsigned __int8 *)(a1 + 64) outPropertiesErrors:*(void *)(a1 + 56)];
  objc_super v3 = *(void ***)(a1 + 56);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  if (v3)
  {
    objc_super v4 = *v3;
    return v4;
  }
  return result;
}

- (int)setOrderedPropertiesInternal:(id)a3 usingErrorHandlingStrategy:(unsigned __int8)a4 outPropertiesErrors:(id *)a5
{
  int v6 = a4;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (a3)
  {
    if (dword_1E9359ED0)
    {
      int v31 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    CMSMDebugUtility_PrintCollection(a3);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v9 = [a3 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v9)
    {
      uint64_t v11 = v9;
      LODWORD(v23) = 0;
      uint64_t v12 = *(void *)v27;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(a3);
          }
          uint64_t v14 = *(void **)(*((void *)&v26 + 1) + 8 * v13);
          id v15 = (void *)MEMORY[0x1997179E0](v9, v10);
          uint64_t v16 = objc_msgSend((id)objc_msgSend(v14, "allKeys"), "firstObject");
          uint64_t v17 = [v14 objectForKey:v16];
          if (v17 == [MEMORY[0x1E4F1CA98] null]) {
            uint64_t v18 = 0;
          }
          else {
            uint64_t v18 = v17;
          }
          uint64_t v19 = -[MXSessionBase setPropertyForKeyInternal:value:fromPropertiesBatch:](self, "setPropertyForKeyInternal:value:fromPropertiesBatch:", v16, v18, 0, v21, v22);
          uint64_t v32 = v16;
          uint64_t v33 = [MEMORY[0x1E4F28ED0] numberWithInt:v19];
          objc_msgSend(v25, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
          if (v6 == 2)
          {
            if (v19) {
              LODWORD(v23) = FigSignalErrorAt();
            }
          }
          else if (v6 == 1 && v19)
          {
            LODWORD(v23) = FigSignalErrorAt();
            goto LABEL_22;
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v9 = [a3 countByEnumeratingWithState:&v26 objects:v34 count:16];
        uint64_t v11 = v9;
      }
      while (v9);
    }
    else
    {
      LODWORD(v23) = 0;
    }
  }
  else
  {
    uint64_t v23 = FigSignalErrorAt();
  }
LABEL_22:
  if (a5) {
    *a5 = v25;
  }
  else {

  }
  return v23;
}

- (id)copyProperties:(id)a3 outPropertyErrors:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  +[MXInitialization waitUntilMXIsFullyInitialized];
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3052000000;
  uint64_t v23 = __Block_byref_object_copy_;
  uint64_t v24 = __Block_byref_object_dispose_;
  uint64_t v25 = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(a3);
        }
        if (([(id)objc_opt_class() isNonSerializedCopyProperty:*(void *)(*((void *)&v16 + 1) + 8 * v9)] & 1) == 0)
        {
          uint64_t v11 = MXGetSerialQueue();
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __50__MXSessionBase_copyProperties_outPropertyErrors___block_invoke;
          v15[3] = &unk_1E57C5808;
          v15[4] = self;
          v15[5] = a3;
          v15[6] = &v20;
          v15[7] = a4;
          MXDispatchAsyncAndWait((uint64_t)"-[MXSessionBase copyProperties:outPropertyErrors:]", (uint64_t)"MXSessionBase.m", 401, 0, 0, v11, (uint64_t)v15);
          if (a4) {
            id v12 = *a4;
          }
          goto LABEL_12;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [a3 countByEnumeratingWithState:&v16 objects:v26 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v10 = [(MXSessionBase *)self copyPropertiesInternal:a3 outPropertyErrors:a4];
  v21[5] = (uint64_t)v10;
LABEL_12:
  uint64_t v13 = (void *)v21[5];
  _Block_object_dispose(&v20, 8);
  return v13;
}

id __50__MXSessionBase_copyProperties_outPropertyErrors___block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(a1 + 32) _copyProperties:*(void *)(a1 + 40) outPropertyErrors:*(void *)(a1 + 56)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  objc_super v3 = *(void ***)(a1 + 56);
  if (v3)
  {
    objc_super v4 = *v3;
    return v4;
  }
  return result;
}

- (id)copyPropertiesInternal:(id)a3 outPropertyErrors:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(a3);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v12 = (void *)MEMORY[0x1997179E0]();
        id v18 = 0;
        uint64_t v13 = [(MXSessionBase *)self copyPropertyForKeyInternal:v11 valueOut:&v18];
        if (v13) {
          BOOL v14 = 1;
        }
        else {
          BOOL v14 = v18 == 0;
        }
        if (!v14) {
          objc_msgSend(v17, "setObject:forKey:");
        }
        objc_msgSend(v6, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", v13), v11);
      }
      uint64_t v8 = [a3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }
  if (a4) {
    *a4 = v6;
  }
  else {

  }
  return v17;
}

- (int)_beginInterruptionWithSecTask:(__SecTask *)a3 andFlags:(unint64_t)a4
{
  MXSimulateCrash((uint64_t)"This is an abstract method and should be overriden! Please file a radar against 'MediaExperie"
                           "nce Session | All'");
  return 0;
}

- (int)_endInterruptionWithSecTask:(__SecTask *)a3 andStatus:(id)a4
{
  MXSimulateCrash((uint64_t)"This is an abstract method and should be overriden! Please file a radar against 'MediaExperie"
                           "nce Session | All'");
  return 0;
}

- (MXCoreSessionBase)parentCoreSession
{
  return (MXCoreSessionBase *)objc_getProperty(self, a2, 8, 1);
}

- (void)setParentCoreSession:(id)a3
{
}

- (NSNumber)ID
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setID:(id)a3
{
}

@end