@interface CSLiveFSVolume
+ (id)sharedInstance;
- (BOOL)isInterestingPath:(const char *)a3;
- (CSLiveFSVolume)init;
- (CSLiveFSVolume)initWithVolumeName:(id)a3;
- (CSLiveFSVolume)initWithVolumeURL:(id)a3;
- (NSString)volumeName;
- (NSURL)volumeURL;
- (OS_dispatch_queue)queue;
- (OS_xpc_object)delayedObject;
- (const)volumeNameCString;
- (int)sendCSLiveFSEvent:(CSLiveEventInfo *)a3;
- (unint64_t)volumeNameCStringLength;
- (void)_handleDelayedEvent;
- (void)dealloc;
- (void)sendDeleteEventForPID:(int)a3 path:(const char *)a4 pathLength:(unint64_t)a5;
- (void)sendEventOfType:(int)a3 pid:(int)a4 path:(const char *)a5 pathLength:(unint64_t)a6 attributes:(id)a7;
- (void)sendPairedEventOfType:(int)a3 pid:(int)a4 fromPath:(const char *)a5 fromPathLength:(unint64_t)a6 fromAttributes:(id)a7 toPath:(const char *)a8 toPathLength:(unint64_t)a9 toAttributes:(id)a10;
- (void)sendXattrModifiedEventForPID:(int)a3 path:(const char *)a4 pathLength:(unint64_t)a5 xAttrName:(id)a6 xAttrValue:(id)a7 attributes:(id)a8;
- (void)sendXattrRemovedEventForPID:(int)a3 path:(const char *)a4 pathLength:(unint64_t)a5 xAttrName:(id)a6 attributes:(id)a7;
- (void)setDelayedObject:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSLiveFSVolume

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_16_0);
  }
  v2 = (void *)sharedInstance_sSharedInstance_0;

  return v2;
}

uint64_t __32__CSLiveFSVolume_sharedInstance__block_invoke()
{
  sharedInstance_sSharedInstance_0 = objc_alloc_init(CSLiveFSVolume);

  return MEMORY[0x1F41817F8]();
}

- (CSLiveFSVolume)init
{
  v8.receiver = self;
  v8.super_class = (Class)CSLiveFSVolume;
  v2 = [(CSLiveFSVolume *)&v8 init];
  if (v2)
  {
    qos_class_t v3 = qos_class_self();
    v4 = dispatch_get_global_queue(v3, 0);
    dispatch_queue_t v5 = dispatch_queue_create_with_target_V2("CSLiveEvent queue", 0, v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (CSLiveFSVolume)initWithVolumeName:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(CSLiveFSVolume *)self init];
  if (v5)
  {
    id v6 = v4;
    v7 = (char *)[v6 UTF8String];
    if (!v7 || (objc_super v8 = v7, strchr(v7, 47)) || (v9 = strlen(v8), v5->_volumeNameCStringLength = v9, v9 - 1 > 0xFE))
    {
      v10 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CSLiveFSVolume initWithVolumeName:]((uint64_t)v6, v10, v11, v12, v13, v14, v15, v16);
      }

      dispatch_queue_t v5 = 0;
    }
    else
    {
      v5->_volumeNameCString = strdup(v8);
      objc_storeStrong((id *)&v5->_volumeName, v6);
    }
  }

  return v5;
}

- (CSLiveFSVolume)initWithVolumeURL:(id)a3
{
  id v4 = a3;
  if ([v4 isFileURL]
    && (dispatch_queue_t v5 = (const char *)[v4 fileSystemRepresentation]) != 0
    && (id v6 = v5, strlen(v5) - 69 <= 0x3BA)
    && !strncmp(v6, "/private/var/mobile/Library/LiveFiles/com.apple.filesystems.userfsd/", 0x44uLL)
    && (v7 = (char *)(v6 + 68), !strchr(v7, 47))
    && ([NSString stringWithUTF8String:v7], (uint64_t v18 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v15 = (void *)v18;
    uint64_t v16 = [(CSLiveFSVolume *)self initWithVolumeName:v18];
  }
  else
  {
    objc_super v8 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CSLiveFSVolume initWithVolumeURL:]((uint64_t)v4, v8, v9, v10, v11, v12, v13, v14);
    }

    uint64_t v15 = 0;
    uint64_t v16 = 0;
  }

  return v16;
}

- (void)dealloc
{
  free((void *)self->_volumeNameCString);
  v3.receiver = self;
  v3.super_class = (Class)CSLiveFSVolume;
  [(CSLiveFSVolume *)&v3 dealloc];
}

- (void)_handleDelayedEvent
{
  objc_super v3 = self->_delayedObject;
  if (v3)
  {
    delayedObject = self->_delayedObject;
    self->_delayedObject = 0;

    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__CSLiveFSVolume__handleDelayedEvent__block_invoke;
    block[3] = &unk_1E5548F00;
    v7 = v3;
    dispatch_async(queue, block);
  }
}

void __37__CSLiveFSVolume__handleDelayedEvent__block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "command", "fse");
  id v4 = *(void **)(a1 + 32);
  objc_super v3 = (uint64_t *)(a1 + 32);
  xpc_dictionary_set_value(v2, "data", v4);
  dispatch_queue_t v5 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __37__CSLiveFSVolume__handleDelayedEvent__block_invoke_cold_1(v3, v5);
  }

  id v6 = CSSharedUserFSConnection();
  [v6 sendMessageAsync:v2 completion:&__block_literal_global_30];
}

- (int)sendCSLiveFSEvent:(CSLiveEventInfo *)a3
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    *__error() = 22;
LABEL_116:
    LODWORD(var2) = -1;
    return (int)var2;
  }
  int var0 = a3->var0;
  uint64_t v6 = [a3->var4 bytes];
  uint64_t v7 = [a3->var4 length];
  if ((unint64_t)(v7 - 5) > 0x3FA)
  {
    LOWORD(v9) = 0;
    size_t v8 = 0;
    int v11 = 0;
    uint64_t v10 = 32;
  }
  else
  {
    size_t v8 = v7;
    uint64_t v9 = *(void *)(v6 + 8);
    uint64_t v10 = v7 + 32;
    if (v9) {
      int v11 = *(_DWORD *)(v6 + 24);
    }
    else {
      int v11 = 0;
    }
  }
  unsigned int v12 = var0 & 0xFFF;
  if ((v11 - 3) > 0xFFFFFFFD || v12 == 1)
  {
    if ((v9 & 0x100) != 0) {
      uint64_t v78 = *(void *)(v6 + 64);
    }
    else {
      uint64_t v78 = 0;
    }
    uint64_t v14 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      [(CSLiveFSVolume *)&a3->var0 sendCSLiveFSEvent:v14];
    }

    size_t v82 = v10;
    if (v12 <= 0xE)
    {
      int v15 = 1;
      if (((1 << v12) & 0x39D7) != 0)
      {
        char v16 = 0;
        v80 = 0;
        size_t v81 = 0;
        v76 = 0;
        size_t v77 = 0;
        v75 = 0;
        uint64_t v79 = 0;
        LODWORD(v17) = 0;
        goto LABEL_43;
      }
      if (((1 << v12) & 0x4028) != 0)
      {
        if (a3->var5 == 1)
        {
          v17 = a3->var6.var0.var0;
          if (!v17)
          {
            char v16 = 0;
            v80 = 0;
            size_t v81 = 0;
            v76 = 0;
            size_t v77 = 0;
            v75 = 0;
            uint64_t v79 = 0;
            goto LABEL_43;
          }
          size_t var1 = a3->var6.var0.var1;
          if ((var1 & 0x80000000) != 0) {
            size_t var1 = strlen(a3->var6.var0.var0);
          }
          size_t v81 = var1;
          if ((var1 - 1024) < 0xFFFFFC01)
          {
            char v16 = 0;
            v80 = 0;
LABEL_34:
            v76 = 0;
LABEL_35:
            size_t v77 = 0;
            v75 = 0;
            uint64_t v79 = 0;
            int v15 = 0;
            LODWORD(v17) = 22;
            goto LABEL_43;
          }
          uint64_t v79 = 0;
          v80 = v17;
          char v16 = 0;
          v76 = 0;
          size_t v77 = 0;
          v75 = 0;
          LODWORD(v17) = 0;
          uint64_t v22 = v10 + (var1 + 1);
LABEL_42:
          size_t v82 = v22;
LABEL_43:
          volumeNameCString = self->_volumeNameCString;
          if (volumeNameCString)
          {
            unsigned int v24 = strlen(self->_volumeNameCString);
            unsigned int v25 = v24;
            if (v24 > 0x100)
            {
LABEL_45:
              LODWORD(v17) = 22;
LABEL_113:
              v65 = logForCSLogCategoryDefault();
              if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
              {
                int v66 = a3->var0;
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v87 = v17;
                *(_WORD *)&v87[4] = 1024;
                *(_DWORD *)&v87[6] = v66;
                _os_log_impl(&dword_18D0E3000, v65, OS_LOG_TYPE_DEFAULT, "Error %d for eventType: %d", buf, 0xEu);
              }

              *__error() = (int)v17;
              goto LABEL_116;
            }
            v82 += v24 + 1;
            if (!v15) {
              goto LABEL_113;
            }
          }
          else
          {
            unsigned int v25 = 0;
            if (!v15) {
              goto LABEL_113;
            }
          }
          if (v16) {
            goto LABEL_11;
          }
          var2 = a3->var2;
          if (!var2) {
            return (int)var2;
          }
          unint64_t var3 = a3->var3;
          unsigned int v27 = var3 - 1024;
          size_t v28 = (var3 + 1);
          size_t v74 = v28;
          if ((var3 - 1024) < 0xFFFFFC01) {
            size_t v28 = 0;
          }
          size_t v73 = v28;
          if (CSIsInterestingPath(var2))
          {
            LODWORD(delayedObject) = 0;
            __int16 v30 = v81;
            if (v12 != 3) {
              goto LABEL_79;
            }
            if (!v81) {
              goto LABEL_79;
            }
            delayedObject = self->_delayedObject;
            if (!delayedObject) {
              goto LABEL_79;
            }
            if (!CSIsInterestingPath(v80))
            {
              bytes_ptr = (unsigned __int16 *)xpc_data_get_bytes_ptr(self->_delayedObject);
              uint64_t v32 = bytes_ptr[10];
              v71 = (char *)(bytes_ptr + 16);
              v33 = (char *)bytes_ptr + v32 + 32;
              if (bytes_ptr[11]) {
                uint64_t v34 = bytes_ptr[11] + 1;
              }
              else {
                uint64_t v34 = 0;
              }
              uint64_t v35 = bytes_ptr[12];
              uint64_t v72 = (uint64_t)&v33[v34 + 1];
              v36 = (char *)(v72 + v35);
              if (!strcmp((const char *)(v72 + v35), a3->var2))
              {
                if (v35 - 5) <= 0x3FA && (*(unsigned char *)(v72 + 9)) {
                  uint64_t v78 = *(void *)(v72 + 64);
                }
                v37 = logForCSLogCategoryDefault();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 134218498;
                  *(void *)v87 = v78;
                  *(_WORD *)&v87[8] = 2080;
                  v88 = v36;
                  __int16 v89 = 2080;
                  v90 = v71;
                  _os_log_debug_impl(&dword_18D0E3000, v37, OS_LOG_TYPE_DEBUG, "safe save detected oid: %lld rename %s to %s", buf, 0x20u);
                }

                v38 = self->_delayedObject;
                self->_delayedObject = 0;
              }
              LODWORD(delayedObject) = 0;
              __int16 v30 = v81;
LABEL_79:
              if (v27 >= 0xFFFFFC01)
              {
                int v70 = (int)delayedObject;
                [(CSLiveFSVolume *)self _handleDelayedEvent];
                uint64_t v42 = CSSharedUserFSConnection();
                v43 = (void *)v42;
                if (v42)
                {
                  uint64_t v72 = v42;
                  v71 = v69;
                  size_t v44 = v73 + v82;
                  v45 = &v69[-((v73 + v82 + 15) & 0xFFFFFFFFFFFFFFF0)];
                  bzero(v45, v73 + v82);
                  int v46 = a3->var0;
                  int v47 = a3->var1;
                  size_t v82 = v44;
                  *(_DWORD *)v45 = v44;
                  *((_DWORD *)v45 + 1) = v46;
                  *((_DWORD *)v45 + 4) = v47;
                  int v48 = v77;
                  *((void *)v45 + 1) = v78;
                  *((_WORD *)v45 + 10) = var3;
                  *((_WORD *)v45 + 11) = v25;
                  *((_WORD *)v45 + 12) = v8;
                  *((_WORD *)v45 + 13) = v30;
                  *((_WORD *)v45 + 14) = v48;
                  *((_WORD *)v45 + 15) = v79;
                  size_t v49 = v74;
                  memcpy(v45 + 32, a3->var2, v74);
                  v50 = &v45[v49 + 32];
                  if (v25)
                  {
                    memcpy(v50, volumeNameCString, v25 + 1);
                    v50 += v25 + 1;
                  }
                  v51 = v80;
                  v52 = v76;
                  if (v8)
                  {
                    memcpy(v50, (const void *)v6, v8);
                    v50 += v8;
                  }
                  if (v51 && v81)
                  {
                    size_t v53 = (v81 + 1);
                    memcpy(v50, v51, v53);
                    v50 += v53;
                  }
                  if (v52 && v48 && (memcpy(v50, v52, (v48 + 1)), v50 += (v48 + 1), v75))
                  {
                    unsigned int v54 = v79;
                    v43 = (void *)v72;
                    size_t v55 = v82;
                    if (v79)
                    {
                      memcpy(v50, v75, v79);
                      v50 += v54;
                    }
                  }
                  else
                  {
                    v43 = (void *)v72;
                    size_t v55 = v82;
                  }
                  if (&v50[-v55] == v45)
                  {
                    xpc_object_t v57 = xpc_data_create(v45, v55);
                    v58 = v57;
                    if (v70)
                    {
                      objc_storeStrong((id *)&self->_delayedObject, v57);
                      v59 = logForCSLogCategoryDefault();
                      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
                      {
                        v60 = a3->var2;
                        *(_DWORD *)buf = 134218498;
                        *(void *)v87 = v58;
                        *(_WORD *)&v87[8] = 2080;
                        v88 = v51;
                        __int16 v89 = 2080;
                        v90 = v60;
                        _os_log_debug_impl(&dword_18D0E3000, v59, OS_LOG_TYPE_DEBUG, "delay %p for safe save %s to %s", buf, 0x20u);
                      }
                    }
                    else
                    {
                      queue = self->_queue;
                      block[0] = MEMORY[0x1E4F143A8];
                      block[1] = 3221225472;
                      block[2] = __36__CSLiveFSVolume_sendCSLiveFSEvent___block_invoke;
                      block[3] = &unk_1E5548FE0;
                      v84 = v57;
                      id v85 = v43;
                      dispatch_async(queue, block);

                      v59 = v84;
                    }

                    LODWORD(v17) = 0;
                  }
                  else
                  {
                    LODWORD(v17) = 22;
                  }
                }
                else
                {
                  LODWORD(v17) = 0;
                }
              }
              else
              {
                LODWORD(v17) = 22;
              }
              if (!v17) {
                goto LABEL_11;
              }
              goto LABEL_113;
            }
          }
          else
          {
            __int16 v30 = v81;
            if (!v81 || !CSIsInterestingPath(v80))
            {
              if (v27 >= 0xFFFFFC01) {
                goto LABEL_11;
              }
              goto LABEL_45;
            }
            if (v12 == 3)
            {
              v39 = a3->var2;
              v40 = strrchr(v39, 47);
              if (v40) {
                v41 = v40 + 1;
              }
              else {
                v41 = v39;
              }
              LODWORD(delayedObject) = strncmp(v41, ".nfs.", 5uLL) == 0;
              goto LABEL_79;
            }
          }
          LODWORD(delayedObject) = 0;
          goto LABEL_79;
        }
LABEL_33:
        char v16 = 0;
        v80 = 0;
        size_t v81 = 0;
        goto LABEL_34;
      }
      if (a3->var5 != 2) {
        goto LABEL_33;
      }
      v19 = (const char *)[a3->var6.var0.var0 UTF8String];
      if (!v19) {
        goto LABEL_33;
      }
      v20 = v19;
      int v21 = *(unsigned __int8 *)v19;
      v76 = v19;
      if (!v21)
      {
        char v16 = 0;
        v80 = 0;
        size_t v81 = 0;
        goto LABEL_35;
      }
      if (!strcmp(v19, "com.apple.lastuseddate#PS"))
      {
        uint64_t v56 = 25;
      }
      else
      {
        if (strncmp(v20, "com.apple.metadata:", 0x13uLL))
        {
          v80 = 0;
          size_t v81 = 0;
          size_t v77 = 0;
          v75 = 0;
          uint64_t v79 = 0;
          LODWORD(v17) = 0;
          char v16 = 1;
          goto LABEL_43;
        }
        size_t v61 = strlen(v20);
        uint64_t v56 = v61;
        if ((v61 - 257) < 0xFFFFFF00)
        {
          size_t v77 = v61;
          v80 = 0;
          size_t v81 = 0;
          goto LABEL_37;
        }
      }
      uint64_t v62 = v10 + (v56 + 1);
      uint64_t v63 = [a3->var6.var1.var1 length];
      size_t v77 = v56;
      if (!v63)
      {
        size_t v81 = 0;
        size_t v82 = v62;
        char v16 = 0;
        uint64_t v79 = 0;
        v80 = 0;
        v75 = 0;
        LODWORD(v17) = 0;
        goto LABEL_39;
      }
      uint64_t v79 = v63;
      if (v63 <= 0x8000)
      {
        unsigned int v67 = v63;
        v75 = (const void *)[a3->var6.var1.var1 bytes];
        char v16 = 0;
        v80 = 0;
        size_t v81 = 0;
        LODWORD(v17) = 0;
        int v15 = 1;
        uint64_t v22 = v62 + v67;
        goto LABEL_42;
      }
      size_t v81 = 0;
      size_t v82 = v62;
      v80 = 0;
      v75 = 0;
LABEL_38:
      LODWORD(v17) = 0;
      char v16 = 1;
LABEL_39:
      int v15 = 1;
      goto LABEL_43;
    }
    v80 = 0;
    size_t v81 = 0;
    v76 = 0;
    size_t v77 = 0;
LABEL_37:
    v75 = 0;
    uint64_t v79 = 0;
    goto LABEL_38;
  }
  [(CSLiveFSVolume *)self _handleDelayedEvent];
LABEL_11:
  LODWORD(var2) = 0;
  return (int)var2;
}

void __36__CSLiveFSVolume_sendCSLiveFSEvent___block_invoke(uint64_t a1)
{
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(xdict, "command", "fse");
  xpc_dictionary_set_value(xdict, "data", *(xpc_object_t *)(a1 + 32));
  [*(id *)(a1 + 40) sendMessageAsync:xdict completion:&__block_literal_global_36];
}

- (void)sendEventOfType:(int)a3 pid:(int)a4 path:(const char *)a5 pathLength:(unint64_t)a6 attributes:(id)a7
{
  v9[0] = a3;
  v9[1] = a4;
  uint64_t v10 = a5;
  uint64_t v11 = a6;
  id v8 = a7;
  id v12 = v8;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  [(CSLiveFSVolume *)self sendCSLiveFSEvent:v9];
}

- (void)sendDeleteEventForPID:(int)a3 path:(const char *)a4 pathLength:(unint64_t)a5
{
  v5[0] = 1;
  v5[1] = a4;
  v5[2] = a5;
  long long v6 = 0u;
  long long v7 = 0u;
  [(CSLiveFSVolume *)self sendCSLiveFSEvent:v5];
}

- (void)sendPairedEventOfType:(int)a3 pid:(int)a4 fromPath:(const char *)a5 fromPathLength:(unint64_t)a6 fromAttributes:(id)a7 toPath:(const char *)a8 toPathLength:(unint64_t)a9 toAttributes:(id)a10
{
  unsigned int v11 = a6;
  id v15 = a7;
  v17[0] = 3;
  v17[1] = a4;
  uint64_t v18 = a8;
  uint64_t v19 = a9;
  id v16 = a10;
  id v20 = v16;
  uint64_t v21 = 1;
  uint64_t v22 = a5;
  uint64_t v23 = v11;
  [(CSLiveFSVolume *)self sendCSLiveFSEvent:v17];
}

- (void)sendXattrModifiedEventForPID:(int)a3 path:(const char *)a4 pathLength:(unint64_t)a5 xAttrName:(id)a6 xAttrValue:(id)a7 attributes:(id)a8
{
  unsigned int v10 = a5;
  id v13 = a6;
  id v14 = a7;
  v16[0] = 9;
  v16[1] = a4;
  v16[2] = v10;
  id v15 = a8;
  id v17 = v15;
  uint64_t v18 = 2;
  id v19 = v13;
  id v20 = v14;
  [(CSLiveFSVolume *)self sendCSLiveFSEvent:v16];
}

- (void)sendXattrRemovedEventForPID:(int)a3 path:(const char *)a4 pathLength:(unint64_t)a5 xAttrName:(id)a6 attributes:(id)a7
{
  unsigned int v8 = a5;
  id v11 = a6;
  v13[0] = 10;
  v13[1] = a4;
  v13[2] = v8;
  id v12 = a7;
  id v14 = v12;
  uint64_t v15 = 2;
  id v16 = v11;
  uint64_t v17 = 0;
  [(CSLiveFSVolume *)self sendCSLiveFSEvent:v13];
}

- (BOOL)isInterestingPath:(const char *)a3
{
  return CSIsInterestingPath((char *)a3);
}

- (NSURL)volumeURL
{
  return self->_volumeURL;
}

- (NSString)volumeName
{
  return self->_volumeName;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (const)volumeNameCString
{
  return self->_volumeNameCString;
}

- (unint64_t)volumeNameCStringLength
{
  return self->_volumeNameCStringLength;
}

- (OS_xpc_object)delayedObject
{
  return self->_delayedObject;
}

- (void)setDelayedObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayedObject, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_volumeName, 0);

  objc_storeStrong((id *)&self->_volumeURL, 0);
}

- (void)initWithVolumeName:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithVolumeURL:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __37__CSLiveFSVolume__handleDelayedEvent__block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_18D0E3000, a2, OS_LOG_TYPE_DEBUG, "sending event %p", (uint8_t *)&v3, 0xCu);
}

- (void)sendCSLiveFSEvent:(os_log_t)log .cold.1(int *a1, uint64_t a2, os_log_t log)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v3 = *a1;
  int v4 = a1[1];
  uint64_t v5 = *(const char **)(a2 + 32);
  if (!v5) {
    uint64_t v5 = "";
  }
  uint64_t v6 = *((void *)a1 + 1);
  v7[0] = 67109890;
  v7[1] = v3;
  __int16 v8 = 1024;
  int v9 = v4;
  __int16 v10 = 2080;
  id v11 = v5;
  __int16 v12 = 2080;
  uint64_t v13 = v6;
  _os_log_debug_impl(&dword_18D0E3000, log, OS_LOG_TYPE_DEBUG, "event: %d pid:%d volume:%s path:%s", (uint8_t *)v7, 0x22u);
}

@end