@interface MXSessionSidekick
+ (int)updateIsPlaying:(id)a3;
+ (void)initialize;
- (BOOL)getIsPlaying;
- (MXSessionSidekick)initWithSession:(id)a3;
- (id)copyProperties:(id)a3 outPropertyErrors:(id *)a4;
- (id)getClientTypeAsString;
- (id)getCoreSession;
- (id)info;
- (int)activate;
- (int)copyPropertyForKey:(id)a3 valueOut:(id *)a4;
- (int)deactivate:(BOOL)a3 postInterruptionNotification:(BOOL)a4;
- (int)getClientType;
- (int)setClientType:(int)a3;
- (int)setID:(unint64_t)a3;
- (int)setIsPlaying:(BOOL)a3;
- (int)setOrderedProperties:(id)a3 usingErrorHandlingStrategy:(unsigned __int8)a4 outPropertiesErrors:(id *)a5;
- (int)setProperties:(id)a3 usingErrorHandlingStrategy:(unsigned __int8)a4 outPropertiesErrors:(id *)a5;
- (int)setPropertyForKey:(id)a3 value:(id)a4;
- (unint64_t)getCoreSessionID;
- (unint64_t)getID;
- (void)dealloc;
- (void)dumpInfo;
@end

@implementation MXSessionSidekick

+ (void)initialize
{
  if (self == a1) {
    sOrderedMXSessionSidekickProperties = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAA0]), "initWithObjects:", @"ClientType", @"ClientName", @"AudioSessionID", @"ClientPID", @"AuditToken", @"IAmTheAssistant", @"AudioCategory", @"AudioMode", @"InterruptionFadeDuration", 0);
  }
}

- (BOOL)getIsPlaying
{
  return self->mIsPlaying;
}

- (unint64_t)getID
{
  return self->mID;
}

- (id)getCoreSession
{
  return self->mCoreSession;
}

- (unint64_t)getCoreSessionID
{
  return self->mCoreSessionID;
}

- (int)getClientType
{
  return self->mClientType;
}

- (id)getClientTypeAsString
{
  unsigned int v2 = self->mClientType - 1;
  if (v2 > 3) {
    return @"kMXSessionClientType_Invalid";
  }
  else {
    return off_1E57CB800[v2];
  }
}

- (int)setID:(unint64_t)a3
{
  self->mID = a3;
  return 0;
}

- (int)setIsPlaying:(BOOL)a3
{
  if (self->mIsPlaying == a3) {
    return 0;
  }
  self->mIsPlaying = a3;
  return +[MXSessionSidekick updateIsPlaying:self->mCoreSession];
}

- (int)setClientType:(int)a3
{
  self->mClientType = a3;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return 0;
}

+ (int)updateIsPlaying:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = [+[MXSessionManagerSidekick sharedInstance] copyMXSessionList:a3];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v18 + 1) + 8 * i) getIsPlaying]) {
          char v7 = 1;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }
  else
  {
    char v7 = 0;
  }
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if ((v7 & 1) == objc_msgSend(a3, "isPlaying", v14, v16))
  {
    int v12 = 0;
  }
  else
  {
    if (dword_1E9359ED0)
    {
      v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    int v12 = objc_msgSend(a3, "_setPropertyForKey:value:", @"IsPlaying", objc_msgSend(NSNumber, "numberWithBool:", v7 & 1, v15, v17));
  }

  return v12;
}

- (id)info
{
  v3 = NSString;
  unint64_t mID = self->mID;
  unint64_t mCoreSessionID = self->mCoreSessionID;
  uint64_t v6 = objc_msgSend(-[MXSessionSidekick getCoreSession](self, "getCoreSession"), "clientName");
  char v7 = @"YES";
  if (!self->mIsPlaying) {
    char v7 = @"NO";
  }
  return (id)[v3 stringWithFormat:@"<MXSessionID: %llx, CoreSessionID = %lld, Name = %@, Playing = %@, clientType = %x", mID, mCoreSessionID, v6, v7, self->mClientType];
}

- (void)dumpInfo
{
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (MXSessionSidekick)initWithSession:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)MXSessionSidekick;
  id v4 = [(MXSessionSidekick *)&v16 init];
  uint64_t v5 = v4;
  if (v4)
  {
    if (a3)
    {
      v4->mIsPlaying = 0;
      v4->mClientType = 1;
      uint64_t v6 = (MXCoreSessionSidekick *)a3;
      v5->mCoreSession = v6;
      uint64_t v7 = [(NSNumber *)[(MXCoreSessionBase *)v6 ID] unsignedLongLongValue];
      v5->unint64_t mCoreSessionID = v7;
      v5->unint64_t mID = [a3 mxSessionIDCounter] + 1000 * v7;
      objc_msgSend(a3, "setMxSessionIDCounter:", objc_msgSend(a3, "mxSessionIDCounter") + 1);
      [(NSRecursiveLock *)[+[MXSessionManagerSidekick sharedInstance] recursiveLock] lock];
      uint64_t v8 = [+[MXSessionManagerSidekick sharedInstance] coreSessionIDToMXSessionList];
      uint64_t v9 = -[NSMapTable objectForKey:](v8, "objectForKey:", [NSNumber numberWithUnsignedLongLong:v5->mCoreSessionID]);
      v10 = (void *)v9;
      if (!v9) {
        v10 = (void *)[objc_alloc(MEMORY[0x1E4F28F50]) initWithOptions:5];
      }
      objc_initWeak(&location, v5);
      [v10 addPointer:objc_loadWeak(&location)];
      v11 = [+[MXSessionManagerSidekick sharedInstance] coreSessionIDToMXSessionList];
      -[NSMapTable setObject:forKey:](v11, "setObject:forKey:", v10, [NSNumber numberWithUnsignedLongLong:v5->mCoreSessionID]);
      [(NSRecursiveLock *)[+[MXSessionManagerSidekick sharedInstance] recursiveLock] unlock];
      if (dword_1E9359ED0)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      if (!v9) {

      }
      v5->mDescription = (NSString *)[[NSString alloc] initWithFormat:@"<MXSessionID = %llx, CoreSessionID = %lld>", v5->mID, v5->mCoreSessionID];
      objc_destroyWeak(&location);
    }
    else
    {
      v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  v3 = (void *)MEMORY[0x1997179E0](self, a2);
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  [(NSRecursiveLock *)[+[MXSessionManagerSidekick sharedInstance] recursiveLock] lock];
  id v4 = [(NSMapTable *)[+[MXSessionManagerSidekick sharedInstance] coreSessionIDToMXSessionList] objectForKey:[(MXCoreSessionBase *)self->mCoreSession ID]];
  [v4 addPointer:0];
  [v4 compact];
  if ([v4 count])
  {
    *((unsigned char *)v12 + 24) = 1;
  }
  else
  {
    uint64_t v5 = [+[MXSessionManagerSidekick sharedInstance] coreSessionIDToMXSessionList];
    -[NSMapTable removeObjectForKey:](v5, "removeObjectForKey:", [NSNumber numberWithUnsignedLongLong:self->mCoreSessionID]);
  }
  [(NSRecursiveLock *)[+[MXSessionManagerSidekick sharedInstance] recursiveLock] unlock];
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3052000000;
  v10[3] = __Block_byref_object_copy__17;
  mCoreSession = self->mCoreSession;
  v10[4] = __Block_byref_object_dispose__17;
  v10[5] = mCoreSession;
  uint64_t v7 = [+[MXSessionManagerSidekick sharedInstance] serialQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __28__MXSessionSidekick_dealloc__block_invoke;
  v9[3] = &unk_1E57CB7E0;
  v9[4] = &v11;
  v9[5] = v10;
  MXDispatchAsync((uint64_t)"-[MXSessionSidekick dealloc]", (uint64_t)"MXSessionSidekick.m", 315, 0, 0, v7, (uint64_t)v9);

  v8.receiver = self;
  v8.super_class = (Class)MXSessionSidekick;
  [(MXSessionSidekick *)&v8 dealloc];
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v11, 8);
}

void __28__MXSessionSidekick_dealloc__block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    +[MXSessionSidekick updateIsPlaying:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
  unsigned int v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
}

- (int)setPropertyForKey:(id)a3 value:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([a3 isEqualToString:@"IsPlaying"])
  {
    if (a4)
    {
      CFTypeID v7 = CFGetTypeID(a4);
      if (v7 == CFBooleanGetTypeID())
      {
        int v8 = [(MXSessionSidekick *)self setIsPlaying:*MEMORY[0x1E4F1CFD0] == (void)a4];
        goto LABEL_10;
      }
    }
  }
  else
  {
    if (![a3 isEqualToString:@"ClientType"])
    {
      int v8 = [(MXCoreSessionSidekick *)self->mCoreSession _setPropertyForKey:a3 value:a4];
      goto LABEL_10;
    }
    CFTypeID v9 = CFGetTypeID(a4);
    if (v9 == CFNumberGetTypeID())
    {
      valuePtr[0] = 1;
      CFNumberGetValue((CFNumberRef)a4, kCFNumberSInt32Type, valuePtr);
      if ((valuePtr[0] - 5) > 0xFFFFFFFB)
      {
        int v8 = -[MXSessionSidekick setClientType:](self, "setClientType:");
        goto LABEL_10;
      }
    }
  }
  int v8 = FigSignalErrorAt();
LABEL_10:
  int v10 = v8;
  if (v8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v10;
}

- (int)setProperties:(id)a3 usingErrorHandlingStrategy:(unsigned __int8)a4 outPropertiesErrors:(id *)a5
{
  int v6 = a4;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v35 = a5;
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
    int v10 = (void *)sOrderedMXSessionSidekickProperties;
    uint64_t v11 = [(id)sOrderedMXSessionSidekickProperties countByEnumeratingWithState:&v47 objects:v61 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v48 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v47 + 1) + 8 * i);
          uint64_t v16 = objc_msgSend(a3, "objectForKey:", v15, v33, v34);
          if (v16)
          {
            uint64_t v59 = v15;
            uint64_t v60 = v16;
            objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1));
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v47 objects:v61 count:16];
      }
      while (v12);
    }
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v17 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v43, v58, 16, v33, v34);
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v44;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v44 != v19) {
            objc_enumerationMutation(a3);
          }
          uint64_t v21 = *(void *)(*((void *)&v43 + 1) + 8 * j);
          if (([(id)sOrderedMXSessionSidekickProperties containsObject:v21] & 1) == 0)
          {
            uint64_t v56 = v21;
            uint64_t v57 = [a3 objectForKey:v21];
            objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1));
          }
        }
        uint64_t v18 = [a3 countByEnumeratingWithState:&v43 objects:v58 count:16];
      }
      while (v18);
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v22 = [v8 countByEnumeratingWithState:&v39 objects:v55 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      int v36 = 0;
      uint64_t v24 = *(void *)v40;
      do
      {
        for (uint64_t k = 0; k != v23; ++k)
        {
          if (*(void *)v40 != v24) {
            objc_enumerationMutation(v8);
          }
          v26 = *(void **)(*((void *)&v39 + 1) + 8 * k);
          v27 = (void *)MEMORY[0x1997179E0]();
          uint64_t v28 = objc_msgSend((id)objc_msgSend(v26, "allKeys"), "firstObject");
          uint64_t v29 = [v26 objectForKey:v28];
          if (v29 == [MEMORY[0x1E4F1CA98] null]) {
            uint64_t v30 = 0;
          }
          else {
            uint64_t v30 = v29;
          }
          uint64_t v31 = [(MXSessionSidekick *)self setPropertyForKey:v28 value:v30];
          uint64_t v53 = v28;
          uint64_t v54 = [NSNumber numberWithInt:v31];
          objc_msgSend(v38, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1));
          if (v6 == 2)
          {
            if (v31) {
              int v36 = FigSignalErrorAt();
            }
          }
          else if (v6 == 1 && v31)
          {
            int v36 = FigSignalErrorAt();
            goto LABEL_40;
          }
        }
        uint64_t v23 = [v8 countByEnumeratingWithState:&v39 objects:v55 count:16];
      }
      while (v23);
    }
    else
    {
      int v36 = 0;
    }
  }
  else
  {
    int v36 = FigSignalErrorAt();
  }
LABEL_40:
  if (v35) {
    id *v35 = v38;
  }
  else {

  }
  return v36;
}

- (int)setOrderedProperties:(id)a3 usingErrorHandlingStrategy:(unsigned __int8)a4 outPropertiesErrors:(id *)a5
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
          uint64_t v15 = (void *)MEMORY[0x1997179E0](v9, v10);
          uint64_t v16 = objc_msgSend((id)objc_msgSend(v14, "allKeys"), "firstObject");
          uint64_t v17 = [v14 objectForKey:v16];
          if (v17 == [MEMORY[0x1E4F1CA98] null]) {
            uint64_t v18 = 0;
          }
          else {
            uint64_t v18 = v17;
          }
          uint64_t v19 = -[MXSessionSidekick setPropertyForKey:value:](self, "setPropertyForKey:value:", v16, v18, v21, v22);
          uint64_t v32 = v16;
          uint64_t v33 = [NSNumber numberWithInt:v19];
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
        uint64_t v12 = (void *)MEMORY[0x1997179E0]();
        id v18 = 0;
        uint64_t v13 = [(MXSessionSidekick *)self copyPropertyForKey:v11 valueOut:&v18];
        if (v13) {
          BOOL v14 = 1;
        }
        else {
          BOOL v14 = v18 == 0;
        }
        if (!v14) {
          objc_msgSend(v17, "setObject:forKey:");
        }
        objc_msgSend(v6, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", v13), v11);
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

- (int)copyPropertyForKey:(id)a3 valueOut:(id *)a4
{
  if (!a3) {
    return -15682;
  }
  if ([a3 isEqualToString:@"IsPlaying"])
  {
    BOOL v7 = [(MXSessionSidekick *)self getIsPlaying];
    uint64_t v8 = (id *)MEMORY[0x1E4F1CFD0];
    if (!v7) {
      uint64_t v8 = (id *)MEMORY[0x1E4F1CFC8];
    }
    id v9 = *v8;
    *a4 = *v8;
    CFRetain(v9);
    return 0;
  }
  if ([a3 isEqualToString:@"MXSessionID"])
  {
    unint64_t v17 = [(MXSessionSidekick *)self getID];
    CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    p_int valuePtr = &v17;
    CFNumberType v13 = kCFNumberSInt64Type;
LABEL_11:
    CFNumberRef v14 = CFNumberCreate(v11, v13, p_valuePtr);
    int result = 0;
    *a4 = v14;
    return result;
  }
  if ([a3 isEqualToString:@"TestOnly_ClientType"])
  {
    int valuePtr = [(MXSessionSidekick *)self getClientType];
    CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    p_int valuePtr = (unint64_t *)&valuePtr;
    CFNumberType v13 = kCFNumberSInt32Type;
    goto LABEL_11;
  }
  mCoreSession = self->mCoreSession;
  return [(MXCoreSessionSidekick *)mCoreSession _copyPropertyForKey:a3 valueOut:a4];
}

- (int)activate
{
  return [(MXCoreSessionSidekick *)self->mCoreSession activate];
}

- (int)deactivate:(BOOL)a3 postInterruptionNotification:(BOOL)a4
{
  return [(MXCoreSessionSidekick *)self->mCoreSession deactivate:a3 postInterruptionNotification:a4];
}

@end