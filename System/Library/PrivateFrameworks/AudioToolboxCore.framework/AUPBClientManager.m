@interface AUPBClientManager
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)sharedInstance;
- (AUPBClientManager)init;
- (OpaqueAUPB)aupbRefFromHandle:(unsigned int)a3;
- (OpaqueRemoteAudioUnit)auRefFromHandle:(unsigned int)a3;
- (id).cxx_construct;
- (id)serverFromRef:(OpaqueAUPBServer *)a3;
- (int)addNewServerListener:(void *)a3 withUserData:(void *)a4;
- (int)addPropertyListener:(void *)a3 onServer:(OpaqueAUPBServer *)a4 block:(OpaqueAUPB *)a5 property:(unsigned int)a6 withUserData:(void *)a7;
- (int)copyPBProperty:(unsigned int)a3 onServer:(OpaqueAUPBServer *)a4 block:(OpaqueAUPB *)a5 intoValue:(const void *)a6;
- (int)getAUParameter:(unsigned int)a3 onServer:(OpaqueAUPBServer *)a4 audioUnit:(OpaqueRemoteAudioUnit *)a5 scope:(unsigned int)a6 element:(unsigned int)a7 copiedIntoValue:(float *)a8;
- (int)getAUProperty:(unsigned int)a3 onServer:(OpaqueAUPBServer *)a4 audioUnit:(OpaqueRemoteAudioUnit *)a5 scope:(unsigned int)a6 element:(unsigned int)a7 copiedIntoBufer:(void *)a8 withSize:(unsigned int *)a9;
- (int)getAUPropertyInfo:(unsigned int)a3 onServer:(OpaqueAUPBServer *)a4 audioUnit:(OpaqueRemoteAudioUnit *)a5 scope:(unsigned int)a6 element:(unsigned int)a7 intoDataSize:(unsigned int *)a8 writeable:(char *)a9;
- (int)getSerialAUProperty:(unsigned int)a3 onServer:(OpaqueAUPBServer *)a4 audioUnit:(OpaqueRemoteAudioUnit *)a5 scope:(unsigned int)a6 element:(unsigned int)a7 inData:(id *)a8;
- (int)removePropertyListener:(void *)a3 onServer:(OpaqueAUPBServer *)a4 block:(OpaqueAUPB *)a5 property:(unsigned int)a6 withUserData:(void *)a7;
- (int)removePropertyListenersForServer:(OpaqueAUPBServer *)a3;
- (int)removeServerListener:(void *)a3 withUserData:(void *)a4;
- (int)setAUParameter:(unsigned int)a3 onServer:(OpaqueAUPBServer *)a4 audioUnit:(OpaqueRemoteAudioUnit *)a5 scope:(unsigned int)a6 element:(unsigned int)a7 value:(float)a8;
- (int)setAUProperty:(unsigned int)a3 onServer:(OpaqueAUPBServer *)a4 audioUnit:(OpaqueRemoteAudioUnit *)a5 scope:(unsigned int)a6 element:(unsigned int)a7 withValue:(const void *)a8 size:(unsigned int)a9;
- (int)setPBProperty:(unsigned int)a3 onServer:(OpaqueAUPBServer *)a4 block:(OpaqueAUPB *)a5 value:(void *)a6;
- (int)setSerialAUProperty:(unsigned int)a3 onServer:(OpaqueAUPBServer *)a4 audioUnit:(OpaqueRemoteAudioUnit *)a5 scope:(unsigned int)a6 element:(unsigned int)a7 toData:(id)a8;
- (unint64_t)retainCount;
- (unsigned)auHandleFromRef:(OpaqueRemoteAudioUnit *)a3;
- (void)dealloc;
- (void)handleRegistrarCrash;
- (void)newServerAdded:(id)a3;
- (void)processingBlock:(unsigned int)a3 propertiesChanged:(id)a4 withQualifierData:(id)a5;
- (void)processingBlock:(unsigned int)a3 propertyChanged:(unsigned int)a4;
- (void)startRegistarConnection;
@end

@implementation AUPBClientManager

+ (id)allocWithZone:(_NSZone *)a3
{
  v3 = objc_msgSend(a1, "sharedInstance", a3);
  return v3;
}

+ (id)sharedInstance
{
  objc_sync_enter(a1);
  if (!sSharedInstance)
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___AUPBClientManager;
    sSharedInstance = objc_msgSend(objc_msgSendSuper2(&v4, sel_allocWithZone_, 0), "init");
  }
  objc_sync_exit(a1);
  return (id)sSharedInstance;
}

- (id).cxx_construct
{
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 2) = 0u;
  return self;
}

- (void).cxx_destruct
{
  begin = self->mNewServerListeners.__begin_;
  if (begin)
  {
    self->mNewServerListeners.__end_ = begin;
    operator delete(begin);
  }
  objc_super v4 = self->mPropertyListeners.__begin_;
  if (v4)
  {
    self->mPropertyListeners.__end_ = v4;
    operator delete(v4);
  }
}

- (int)setSerialAUProperty:(unsigned int)a3 onServer:(OpaqueAUPBServer *)a4 audioUnit:(OpaqueRemoteAudioUnit *)a5 scope:(unsigned int)a6 element:(unsigned int)a7 toData:(id)a8
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (self->mConnectionAcknowledged)
  {
    uint64_t v9 = *(void *)&a7;
    uint64_t v10 = *(void *)&a6;
    uint64_t v13 = *(void *)&a3;
    id v15 = [(AUPBClientManager *)self serverFromRef:a4];
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2020000000;
    int v26 = 1936881215;
    if (gLogScope)
    {
      v16 = *(NSObject **)gLogScope;
      if (!*(void *)gLogScope) {
        goto LABEL_10;
      }
    }
    else
    {
      v16 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316674;
      *(void *)&buf[4] = "AUPBClientManager.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 806;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v13;
      *(_WORD *)v28 = 2048;
      *(void *)&v28[2] = a4;
      *(_WORD *)&v28[10] = 2048;
      *(void *)&v28[12] = a5;
      *(_WORD *)&v28[20] = 1024;
      *(_DWORD *)&v28[22] = v10;
      __int16 v29 = 1024;
      int v30 = v9;
      _os_log_impl(&dword_18FEC0000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d SetAUPropSerial: property=%d server=%p au=%p scope=%d element=%d\n", buf, 0x38u);
      v18 = v24;
      if (!v15) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
LABEL_10:
    v18 = &v23;
    if (!v15)
    {
LABEL_12:
      int v17 = *((_DWORD *)v18 + 6);
      _Block_object_dispose(&v23, 8);
      return v17;
    }
LABEL_11:
    *((_DWORD *)v18 + 6) = 1953461620;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3052000000;
    *(void *)v28 = __Block_byref_object_copy__130;
    *(void *)&v28[8] = __Block_byref_object_dispose__131;
    *(void *)&v28[16] = 0;
    *(void *)&v28[16] = dispatch_semaphore_create(0);
    [v15 addSema:*(void *)(*(void *)&buf[8] + 40)];
    v19 = (void *)[v15 proxyInterface];
    uint64_t v20 = [(AUPBClientManager *)self auHandleFromRef:a5];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __81__AUPBClientManager_setSerialAUProperty_onServer_audioUnit_scope_element_toData___block_invoke;
    v22[3] = &unk_1E5687FE8;
    v22[4] = &v23;
    v22[5] = buf;
    v22[6] = v15;
    [v19 setAudioUnit:v20 property:v13 onScope:v10 element:v9 value:a8 withReply:v22];
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)&buf[8] + 40), 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(*(dispatch_object_t *)(*(void *)&buf[8] + 40));
    _Block_object_dispose(buf, 8);
    v18 = v24;
    goto LABEL_12;
  }
  return 560295540;
}

intptr_t __81__AUPBClientManager_setSerialAUProperty_onServer_audioUnit_scope_element_toData___block_invoke(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  [*(id *)(a1 + 48) removeSema:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  v3 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return dispatch_semaphore_signal(v3);
}

- (int)getSerialAUProperty:(unsigned int)a3 onServer:(OpaqueAUPBServer *)a4 audioUnit:(OpaqueRemoteAudioUnit *)a5 scope:(unsigned int)a6 element:(unsigned int)a7 inData:(id *)a8
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (self->mConnectionAcknowledged)
  {
    uint64_t v9 = *(void *)&a7;
    uint64_t v10 = *(void *)&a6;
    uint64_t v13 = *(void *)&a3;
    id v15 = [(AUPBClientManager *)self serverFromRef:a4];
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2020000000;
    int v26 = 1936881215;
    if (gLogScope)
    {
      v16 = *(NSObject **)gLogScope;
      if (!*(void *)gLogScope) {
        goto LABEL_10;
      }
    }
    else
    {
      v16 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316674;
      *(void *)&buf[4] = "AUPBClientManager.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 776;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v13;
      *(_WORD *)v28 = 2048;
      *(void *)&v28[2] = a4;
      *(_WORD *)&v28[10] = 2048;
      *(void *)&v28[12] = a5;
      *(_WORD *)&v28[20] = 1024;
      *(_DWORD *)&v28[22] = v10;
      __int16 v29 = 1024;
      int v30 = v9;
      _os_log_impl(&dword_18FEC0000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d GetAUPropSerial: property=%d server=%p au=%p scope=%d element=%d\n", buf, 0x38u);
      v18 = v24;
      if (!v15) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
LABEL_10:
    v18 = &v23;
    if (!v15)
    {
LABEL_12:
      int v17 = *((_DWORD *)v18 + 6);
      _Block_object_dispose(&v23, 8);
      return v17;
    }
LABEL_11:
    *((_DWORD *)v18 + 6) = 1953461620;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3052000000;
    *(void *)v28 = __Block_byref_object_copy__130;
    *(void *)&v28[8] = __Block_byref_object_dispose__131;
    *(void *)&v28[16] = 0;
    *(void *)&v28[16] = dispatch_semaphore_create(0);
    [v15 addSema:*(void *)(*(void *)&buf[8] + 40)];
    v19 = (void *)[v15 proxyInterface];
    uint64_t v20 = [(AUPBClientManager *)self auHandleFromRef:a5];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __81__AUPBClientManager_getSerialAUProperty_onServer_audioUnit_scope_element_inData___block_invoke;
    v22[3] = &unk_1E5688088;
    v22[4] = v15;
    v22[5] = &v23;
    v22[6] = buf;
    void v22[7] = a8;
    [v19 getAudioUnit:v20 property:v13 onScope:v10 element:v9 inReply:v22];
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)&buf[8] + 40), 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(*(dispatch_object_t *)(*(void *)&buf[8] + 40));
    _Block_object_dispose(buf, 8);
    v18 = v24;
    goto LABEL_12;
  }
  return 560295540;
}

intptr_t __81__AUPBClientManager_getSerialAUProperty_onServer_audioUnit_scope_element_inData___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  **(void **)(a1 + 56) = a3;
  objc_super v4 = **(void ***)(a1 + 56);
  if (v4) {
    id v5 = v4;
  }
  [*(id *)(a1 + 32) removeSema:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  v6 = *(NSObject **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  return dispatch_semaphore_signal(v6);
}

- (int)setAUParameter:(unsigned int)a3 onServer:(OpaqueAUPBServer *)a4 audioUnit:(OpaqueRemoteAudioUnit *)a5 scope:(unsigned int)a6 element:(unsigned int)a7 value:(float)a8
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (self->mConnectionAcknowledged)
  {
    uint64_t v9 = *(void *)&a7;
    uint64_t v10 = *(void *)&a6;
    uint64_t v13 = *(void *)&a3;
    id v15 = [(AUPBClientManager *)self serverFromRef:a4];
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2020000000;
    int v26 = 1936881215;
    if (gLogScope)
    {
      v16 = *(NSObject **)gLogScope;
      if (!*(void *)gLogScope) {
        goto LABEL_10;
      }
    }
    else
    {
      v16 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316674;
      *(void *)&buf[4] = "AUPBClientManager.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 748;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v13;
      *(_WORD *)v28 = 2048;
      *(void *)&v28[2] = a4;
      *(_WORD *)&v28[10] = 2048;
      *(void *)&v28[12] = a5;
      *(_WORD *)&v28[20] = 1024;
      *(_DWORD *)&v28[22] = v10;
      __int16 v29 = 1024;
      int v30 = v9;
      _os_log_impl(&dword_18FEC0000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d SetAUParam: parameter=%d server=%p au=%p scope=%d element=%d\n", buf, 0x38u);
      v18 = v24;
      if (!v15) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
LABEL_10:
    v18 = &v23;
    if (!v15)
    {
LABEL_12:
      int v17 = *((_DWORD *)v18 + 6);
      _Block_object_dispose(&v23, 8);
      return v17;
    }
LABEL_11:
    *((_DWORD *)v18 + 6) = 1953461620;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3052000000;
    *(void *)v28 = __Block_byref_object_copy__130;
    *(void *)&v28[8] = __Block_byref_object_dispose__131;
    *(void *)&v28[16] = 0;
    *(void *)&v28[16] = dispatch_semaphore_create(0);
    [v15 addSema:*(void *)(*(void *)&buf[8] + 40)];
    v19 = (void *)[v15 proxyInterface];
    uint64_t v20 = [(AUPBClientManager *)self auHandleFromRef:a5];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __75__AUPBClientManager_setAUParameter_onServer_audioUnit_scope_element_value___block_invoke;
    v22[3] = &unk_1E5687FE8;
    v22[4] = &v23;
    v22[5] = buf;
    v22[6] = v15;
    [v19 setAudioUnit:v20 parameter:v13 onScope:v10 element:v9 value:v22 withReply:COERCE_DOUBLE((unint64_t)LODWORD(a8))];
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)&buf[8] + 40), 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(*(dispatch_object_t *)(*(void *)&buf[8] + 40));
    _Block_object_dispose(buf, 8);
    v18 = v24;
    goto LABEL_12;
  }
  return 560295540;
}

intptr_t __75__AUPBClientManager_setAUParameter_onServer_audioUnit_scope_element_value___block_invoke(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  [*(id *)(a1 + 48) removeSema:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  v3 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return dispatch_semaphore_signal(v3);
}

- (int)getAUParameter:(unsigned int)a3 onServer:(OpaqueAUPBServer *)a4 audioUnit:(OpaqueRemoteAudioUnit *)a5 scope:(unsigned int)a6 element:(unsigned int)a7 copiedIntoValue:(float *)a8
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (self->mConnectionAcknowledged)
  {
    uint64_t v9 = *(void *)&a7;
    uint64_t v10 = *(void *)&a6;
    uint64_t v13 = *(void *)&a3;
    id v15 = [(AUPBClientManager *)self serverFromRef:a4];
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2020000000;
    int v26 = 1936881215;
    if (gLogScope)
    {
      v16 = *(NSObject **)gLogScope;
      if (!*(void *)gLogScope) {
        goto LABEL_10;
      }
    }
    else
    {
      v16 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316674;
      *(void *)&buf[4] = "AUPBClientManager.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 719;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v13;
      *(_WORD *)v28 = 2048;
      *(void *)&v28[2] = a4;
      *(_WORD *)&v28[10] = 2048;
      *(void *)&v28[12] = a5;
      *(_WORD *)&v28[20] = 1024;
      *(_DWORD *)&v28[22] = v10;
      __int16 v29 = 1024;
      int v30 = v9;
      _os_log_impl(&dword_18FEC0000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d GetAUParam: parameter=%d server=%p au=%p scope=%d element=%d\n", buf, 0x38u);
      v18 = v24;
      if (a8) {
        goto LABEL_11;
      }
      goto LABEL_13;
    }
LABEL_10:
    v18 = &v23;
    if (a8)
    {
LABEL_11:
      if (v15)
      {
        *((_DWORD *)v18 + 6) = 1953461620;
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3052000000;
        *(void *)v28 = __Block_byref_object_copy__130;
        *(void *)&v28[8] = __Block_byref_object_dispose__131;
        *(void *)&v28[16] = 0;
        *(void *)&v28[16] = dispatch_semaphore_create(0);
        [v15 addSema:*(void *)(*(void *)&buf[8] + 40)];
        v19 = (void *)[v15 proxyInterface];
        uint64_t v20 = [(AUPBClientManager *)self auHandleFromRef:a5];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __85__AUPBClientManager_getAUParameter_onServer_audioUnit_scope_element_copiedIntoValue___block_invoke;
        v22[3] = &unk_1E5688060;
        v22[4] = v15;
        v22[5] = &v23;
        v22[6] = buf;
        void v22[7] = a8;
        [v19 getAudioUnit:v20 parameter:v13 onScope:v10 element:v9 inReply:v22];
        dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)&buf[8] + 40), 0xFFFFFFFFFFFFFFFFLL);
        dispatch_release(*(dispatch_object_t *)(*(void *)&buf[8] + 40));
        _Block_object_dispose(buf, 8);
        v18 = v24;
      }
    }
LABEL_13:
    int v17 = *((_DWORD *)v18 + 6);
    _Block_object_dispose(&v23, 8);
    return v17;
  }
  return 560295540;
}

intptr_t __85__AUPBClientManager_getAUParameter_onServer_audioUnit_scope_element_copiedIntoValue___block_invoke(uint64_t a1, int a2, float a3)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  **(float **)(a1 + 56) = a3;
  [*(id *)(a1 + 32) removeSema:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  objc_super v4 = *(NSObject **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  return dispatch_semaphore_signal(v4);
}

- (int)setAUProperty:(unsigned int)a3 onServer:(OpaqueAUPBServer *)a4 audioUnit:(OpaqueRemoteAudioUnit *)a5 scope:(unsigned int)a6 element:(unsigned int)a7 withValue:(const void *)a8 size:(unsigned int)a9
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!self->mConnectionAcknowledged) {
    return 560295540;
  }
  id v14 = [(AUPBClientManager *)self serverFromRef:a4];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  int v21 = 1936881215;
  if (!gLogScope)
  {
    id v15 = MEMORY[0x1E4F14500];
LABEL_7:
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      buf[0] = 136316674;
      *(void *)&buf[1] = "AUPBClientManager.mm";
      __int16 v23 = 1024;
      int v24 = 684;
      __int16 v25 = 1024;
      unsigned int v26 = a3;
      v27[0] = 2048;
      *(void *)&v27[1] = a4;
      v27[5] = 2048;
      v28 = a5;
      __int16 v29 = 1024;
      unsigned int v30 = a6;
      __int16 v31 = 1024;
      unsigned int v32 = a7;
      _os_log_impl(&dword_18FEC0000, v15, OS_LOG_TYPE_DEBUG, "%25s:%-5d SetAUProp: property=%d server=%p au=%p scope=%d element=%d\n", (uint8_t *)buf, 0x38u);
    }
    goto LABEL_9;
  }
  id v15 = *(NSObject **)gLogScope;
  if (*(void *)gLogScope) {
    goto LABEL_7;
  }
LABEL_9:
  if (v14) {
    PropertyMarshaller::PropertyMarshaller((PropertyMarshaller *)buf, 0);
  }
  int v16 = *((_DWORD *)v19 + 6);
  _Block_object_dispose(&v18, 8);
  return v16;
}

intptr_t __83__AUPBClientManager_setAUProperty_onServer_audioUnit_scope_element_withValue_size___block_invoke(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  [*(id *)(a1 + 48) removeSema:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  v3 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return dispatch_semaphore_signal(v3);
}

- (int)getAUProperty:(unsigned int)a3 onServer:(OpaqueAUPBServer *)a4 audioUnit:(OpaqueRemoteAudioUnit *)a5 scope:(unsigned int)a6 element:(unsigned int)a7 copiedIntoBufer:(void *)a8 withSize:(unsigned int *)a9
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (self->mConnectionAcknowledged)
  {
    uint64_t v10 = *(void *)&a7;
    uint64_t v11 = *(void *)&a6;
    uint64_t v14 = *(void *)&a3;
    id v16 = [(AUPBClientManager *)self serverFromRef:a4];
    uint64_t v25 = 0;
    unsigned int v26 = &v25;
    uint64_t v27 = 0x2020000000;
    int v28 = 1936881215;
    if (gLogScope)
    {
      int v17 = *(NSObject **)gLogScope;
      if (!*(void *)gLogScope) {
        goto LABEL_10;
      }
    }
    else
    {
      int v17 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316674;
      *(void *)&buf[4] = "AUPBClientManager.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 651;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v14;
      *(_WORD *)unsigned int v30 = 2048;
      *(void *)&v30[2] = a4;
      *(_WORD *)&v30[10] = 2048;
      *(void *)&v30[12] = a5;
      *(_WORD *)&v30[20] = 1024;
      *(_DWORD *)&v30[22] = v11;
      __int16 v31 = 1024;
      int v32 = v10;
      _os_log_impl(&dword_18FEC0000, v17, OS_LOG_TYPE_DEBUG, "%25s:%-5d GetAUProp: property=%d server=%p au=%p scope=%d element=%d\n", buf, 0x38u);
      v19 = v26;
      if (!v16) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
LABEL_10:
    v19 = &v25;
    if (!v16)
    {
LABEL_12:
      int v18 = *((_DWORD *)v19 + 6);
      _Block_object_dispose(&v25, 8);
      return v18;
    }
LABEL_11:
    *((_DWORD *)v19 + 6) = 1953461620;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3052000000;
    *(void *)unsigned int v30 = __Block_byref_object_copy__130;
    *(void *)&v30[8] = __Block_byref_object_dispose__131;
    *(void *)&v30[16] = 0;
    *(void *)&v30[16] = dispatch_semaphore_create(0);
    [v16 addSema:*(void *)(*(void *)&buf[8] + 40)];
    uint64_t v20 = (void *)[v16 proxyInterface];
    uint64_t v21 = [(AUPBClientManager *)self auHandleFromRef:a5];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __93__AUPBClientManager_getAUProperty_onServer_audioUnit_scope_element_copiedIntoBufer_withSize___block_invoke;
    v23[3] = &unk_1E5688038;
    int v24 = v14;
    v23[7] = a8;
    v23[8] = a9;
    v23[4] = v16;
    v23[5] = &v25;
    v23[6] = buf;
    [v20 getAudioUnit:v21 property:v14 onScope:v11 element:v10 inReply:v23];
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)&buf[8] + 40), 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(*(dispatch_object_t *)(*(void *)&buf[8] + 40));
    _Block_object_dispose(buf, 8);
    v19 = v26;
    goto LABEL_12;
  }
  return 560295540;
}

intptr_t __93__AUPBClientManager_getAUProperty_onServer_audioUnit_scope_element_copiedIntoBufer_withSize___block_invoke(uint64_t a1, int a2, void *a3)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  if (a3 && !*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v5 = (const void *)[a3 bytes];
    [a3 length];
    PropertyMarshaller::PropertyMarshaller((PropertyMarshaller *)v7, v5);
  }
  objc_msgSend(*(id *)(a1 + 32), "removeSema:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v7[0]);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
}

- (int)getAUPropertyInfo:(unsigned int)a3 onServer:(OpaqueAUPBServer *)a4 audioUnit:(OpaqueRemoteAudioUnit *)a5 scope:(unsigned int)a6 element:(unsigned int)a7 intoDataSize:(unsigned int *)a8 writeable:(char *)a9
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (self->mConnectionAcknowledged)
  {
    uint64_t v10 = *(void *)&a7;
    uint64_t v11 = *(void *)&a6;
    uint64_t v14 = *(void *)&a3;
    id v16 = [(AUPBClientManager *)self serverFromRef:a4];
    uint64_t v25 = 0;
    unsigned int v26 = &v25;
    uint64_t v27 = 0x2020000000;
    int v28 = 1936881215;
    if (gLogScope)
    {
      int v17 = *(NSObject **)gLogScope;
      if (!*(void *)gLogScope) {
        goto LABEL_10;
      }
    }
    else
    {
      int v17 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316674;
      *(void *)&buf[4] = "AUPBClientManager.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 573;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v14;
      *(_WORD *)unsigned int v30 = 2048;
      *(void *)&v30[2] = a4;
      *(_WORD *)&v30[10] = 2048;
      *(void *)&v30[12] = a5;
      *(_WORD *)&v30[20] = 1024;
      *(_DWORD *)&v30[22] = v11;
      __int16 v31 = 1024;
      int v32 = v10;
      _os_log_impl(&dword_18FEC0000, v17, OS_LOG_TYPE_DEBUG, "%25s:%-5d GetAUPropInfo: property=%d server=%p au=%p scope=%d element=%d\n", buf, 0x38u);
      v19 = v26;
      if (!v16) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
LABEL_10:
    v19 = &v25;
    if (!v16)
    {
LABEL_12:
      int v18 = *((_DWORD *)v19 + 6);
      _Block_object_dispose(&v25, 8);
      return v18;
    }
LABEL_11:
    *((_DWORD *)v19 + 6) = 1953461620;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3052000000;
    *(void *)unsigned int v30 = __Block_byref_object_copy__130;
    *(void *)&v30[8] = __Block_byref_object_dispose__131;
    *(void *)&v30[16] = 0;
    *(void *)&v30[16] = dispatch_semaphore_create(0);
    [v16 addSema:*(void *)(*(void *)&buf[8] + 40)];
    uint64_t v20 = (void *)[v16 proxyInterface];
    uint64_t v21 = [(AUPBClientManager *)self auHandleFromRef:a5];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __95__AUPBClientManager_getAUPropertyInfo_onServer_audioUnit_scope_element_intoDataSize_writeable___block_invoke;
    v23[3] = &unk_1E5688010;
    v23[7] = a8;
    v23[8] = a9;
    int v24 = v14;
    v23[4] = v16;
    v23[5] = &v25;
    v23[6] = buf;
    [v20 getAudioUnit:v21 propertyInfo:v14 onScope:v11 element:v10 inReply:v23];
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)&buf[8] + 40), 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(*(dispatch_object_t *)(*(void *)&buf[8] + 40));
    _Block_object_dispose(buf, 8);
    v19 = v26;
    goto LABEL_12;
  }
  return 560295540;
}

intptr_t __95__AUPBClientManager_getAUPropertyInfo_onServer_audioUnit_scope_element_intoDataSize_writeable___block_invoke(uint64_t a1, int a2, int a3, char a4)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  id v5 = *(_DWORD **)(a1 + 56);
  if (v5) {
    *id v5 = a3;
  }
  v6 = *(unsigned char **)(a1 + 64);
  if (v6) {
    unsigned char *v6 = a4;
  }
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    int v7 = *(_DWORD *)(a1 + 72);
    int v8 = 8;
    if (v7 <= 23)
    {
      if (v7)
      {
        if (v7 == 4)
        {
          int v8 = 104;
        }
        else if (v7 != 16)
        {
          goto LABEL_19;
        }
      }
LABEL_18:
      **(_DWORD **)(a1 + 56) = v8;
      goto LABEL_19;
    }
    switch(v7)
    {
      case 24:
      case 25:
      case 30:
        goto LABEL_18;
      case 26:
      case 27:
      case 28:
      case 29:
      case 31:
      case 32:
      case 37:
        break;
      case 33:
      case 38:
        int v8 = 24;
        goto LABEL_18;
      case 34:
      case 35:
      case 36:
        int v8 = 16;
        goto LABEL_18;
      default:
        if (v7 == 50 || v7 == 54) {
          goto LABEL_18;
        }
        break;
    }
  }
LABEL_19:
  [*(id *)(a1 + 32) removeSema:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  uint64_t v9 = *(NSObject **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  return dispatch_semaphore_signal(v9);
}

- (int)setPBProperty:(unsigned int)a3 onServer:(OpaqueAUPBServer *)a4 block:(OpaqueAUPB *)a5 value:(void *)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!self->mConnectionAcknowledged) {
    return 560295540;
  }
  uint64_t v9 = *(void *)&a3;
  id v10 = [(AUPBClientManager *)self serverFromRef:a4];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  int v21 = 1936881215;
  if (!gLogScope)
  {
    uint64_t v11 = MEMORY[0x1E4F14500];
LABEL_7:
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)&buf[4] = "AUPBClientManager.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 546;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v9;
      *(_WORD *)__int16 v23 = 2048;
      *(void *)&v23[2] = a4;
      *(_WORD *)&v23[10] = 2048;
      *(void *)&v23[12] = a5;
      _os_log_impl(&dword_18FEC0000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d SetPBProp: property=%d server=%p block=%p\n", buf, 0x2Cu);
    }
    goto LABEL_9;
  }
  uint64_t v11 = *(NSObject **)gLogScope;
  if (*(void *)gLogScope) {
    goto LABEL_7;
  }
LABEL_9:
  if (a6)
  {
    uint64_t v13 = v19;
    if (v10)
    {
      *((_DWORD *)v19 + 6) = 1953461620;
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3052000000;
      *(void *)__int16 v23 = __Block_byref_object_copy__130;
      *(void *)&v23[8] = __Block_byref_object_dispose__131;
      *(void *)&v23[16] = 0;
      *(void *)&v23[16] = dispatch_semaphore_create(0);
      [v10 addSema:*(void *)(*(void *)&buf[8] + 40)];
      CFDataRef Data = CFPropertyListCreateData(0, a6, kCFPropertyListBinaryFormat_v1_0, 0, 0);
      id v15 = (void *)[v10 proxyInterface];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __56__AUPBClientManager_setPBProperty_onServer_block_value___block_invoke;
      v17[3] = &unk_1E5687FE8;
      v17[4] = &v18;
      v17[5] = buf;
      v17[6] = v10;
      [v15 setProcessingBlock:a5 property:v9 value:Data withReply:v17];
      CFRelease(Data);
      dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)&buf[8] + 40), 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(*(dispatch_object_t *)(*(void *)&buf[8] + 40));
      _Block_object_dispose(buf, 8);
      uint64_t v13 = v19;
    }
  }
  else
  {
    uint64_t v13 = v19;
    *((_DWORD *)v19 + 6) = 1886806380;
  }
  int v12 = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v18, 8);
  return v12;
}

intptr_t __56__AUPBClientManager_setPBProperty_onServer_block_value___block_invoke(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  [*(id *)(a1 + 48) removeSema:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  v3 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return dispatch_semaphore_signal(v3);
}

- (int)copyPBProperty:(unsigned int)a3 onServer:(OpaqueAUPBServer *)a4 block:(OpaqueAUPB *)a5 intoValue:(const void *)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (self->mConnectionAcknowledged)
  {
    uint64_t v9 = *(void *)&a3;
    id v11 = [(AUPBClientManager *)self serverFromRef:a4];
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x2020000000;
    int v22 = 1936881215;
    if (gLogScope)
    {
      int v12 = *(NSObject **)gLogScope;
      if (!*(void *)gLogScope) {
        goto LABEL_10;
      }
    }
    else
    {
      int v12 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)&buf[4] = "AUPBClientManager.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 500;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v9;
      *(_WORD *)uint64_t v24 = 2048;
      *(void *)&v24[2] = a4;
      *(_WORD *)&v24[10] = 2048;
      *(void *)&v24[12] = a5;
      _os_log_impl(&dword_18FEC0000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d CopyPBProp: property=%d server=%p block=%p", buf, 0x2Cu);
      uint64_t v14 = v20;
      if (a6) {
        goto LABEL_11;
      }
      goto LABEL_13;
    }
LABEL_10:
    uint64_t v14 = &v19;
    if (a6)
    {
LABEL_11:
      if (!v11) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
LABEL_13:
    *((_DWORD *)v14 + 6) = 1886806380;
    if (!v11)
    {
LABEL_15:
      int v13 = *((_DWORD *)v14 + 6);
      _Block_object_dispose(&v19, 8);
      return v13;
    }
LABEL_14:
    *((_DWORD *)v14 + 6) = 1953461620;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3052000000;
    *(void *)uint64_t v24 = __Block_byref_object_copy__130;
    *(void *)&v24[8] = __Block_byref_object_dispose__131;
    *(void *)&v24[16] = 0;
    *(void *)&v24[16] = dispatch_semaphore_create(0);
    [v11 addSema:*(void *)(*(void *)&buf[8] + 40)];
    id v15 = (void *)[v11 proxyInterface];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __61__AUPBClientManager_copyPBProperty_onServer_block_intoValue___block_invoke;
    v17[3] = &unk_1E5687FC0;
    int v18 = v9;
    v17[4] = self;
    v17[5] = v11;
    v17[6] = &v19;
    void v17[7] = buf;
    v17[8] = a6;
    [v15 copyProcessingBlock:a5 property:v9 intoReply:v17];
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)&buf[8] + 40), 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(*(dispatch_object_t *)(*(void *)&buf[8] + 40));
    _Block_object_dispose(buf, 8);
    uint64_t v14 = v20;
    goto LABEL_15;
  }
  return 560295540;
}

intptr_t __61__AUPBClientManager_copyPBProperty_onServer_block_intoValue___block_invoke(uint64_t a1, int a2, CFDataRef data)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  **(void **)(a1 + 64) = CFPropertyListCreateWithData(0, data, 0, 0, 0);
  int v4 = *(_DWORD *)(a1 + 72);
  if (v4 == 1651272556)
  {
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      goto LABEL_56;
    }
    CFDataRef v10 = **(const __CFData ***)(a1 + 64);
    if (!v10) {
      goto LABEL_56;
    }
    BytePtr = CFDataGetBytePtr(v10);
    unint64_t Length = CFDataGetLength(**(CFDataRef **)(a1 + 64));
    if (Length >= 4)
    {
      int v8 = 0;
      int v28 = 0;
      __int16 v29 = 0;
      uint64_t v30 = 0;
      unint64_t v31 = Length >> 2;
      do
      {
        uint64_t v32 = [*(id *)(a1 + 32) aupbRefFromHandle:*(unsigned int *)&BytePtr[4 * v30]];
        uint64_t v33 = v32;
        if (v28 >= v29)
        {
          uint64_t v34 = v28 - v8;
          unint64_t v35 = v34 + 1;
          if ((unint64_t)(v34 + 1) >> 61) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)v29 - (char *)v8) >> 2 > v35) {
            unint64_t v35 = ((char *)v29 - (char *)v8) >> 2;
          }
          if ((unint64_t)((char *)v29 - (char *)v8) >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v36 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v36 = v35;
          }
          if (v36)
          {
            if (v36 >> 61) {
              std::__throw_bad_array_new_length[abi:ne180100]();
            }
            v37 = (char *)operator new(8 * v36);
          }
          else
          {
            v37 = 0;
          }
          v38 = (uint64_t *)&v37[8 * v34];
          uint64_t *v38 = v33;
          int v13 = v38 + 1;
          while (v28 != v8)
          {
            uint64_t v39 = *--v28;
            *--v38 = v39;
          }
          __int16 v29 = (uint64_t *)&v37[8 * v36];
          if (v8) {
            operator delete(v8);
          }
          int v8 = v38;
        }
        else
        {
          uint64_t *v28 = v32;
          int v13 = v28 + 1;
        }
        ++v30;
        int v28 = v13;
      }
      while (v30 != v31);
    }
    else
    {
      int v8 = 0;
      int v13 = 0;
    }
    CFRelease(**(CFTypeRef **)(a1 + 64));
    CFDataRef v27 = CFDataCreate(0, (const UInt8 *)v8, (char *)v13 - (char *)v8);
  }
  else
  {
    if (v4 != 1635087726) {
      goto LABEL_56;
    }
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      goto LABEL_56;
    }
    CFDataRef v5 = **(const __CFData ***)(a1 + 64);
    if (!v5) {
      goto LABEL_56;
    }
    v6 = CFDataGetBytePtr(v5);
    unint64_t v7 = CFDataGetLength(**(CFDataRef **)(a1 + 64));
    if (v7 >= 0x10)
    {
      int v8 = 0;
      uint64_t v9 = 0;
      unint64_t v14 = 0;
      uint64_t v15 = 0;
      unint64_t v16 = v7 >> 4;
      do
      {
        int v17 = &v6[16 * v15];
        *(void *)&long long v42 = *(void *)v17;
        DWORD2(v42) = *((_DWORD *)v17 + 2);
        uint64_t v18 = [*(id *)(a1 + 32) auRefFromHandle:*((unsigned int *)v17 + 3)];
        uint64_t v19 = v18;
        if ((unint64_t)v9 >= v14)
        {
          unint64_t v20 = 0xAAAAAAAAAAAAAAABLL * ((v9 - (char *)v8) >> 3) + 1;
          if (v20 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          if (0x5555555555555556 * ((uint64_t)(v14 - (void)v8) >> 3) > v20) {
            unint64_t v20 = 0x5555555555555556 * ((uint64_t)(v14 - (void)v8) >> 3);
          }
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v14 - (void)v8) >> 3) >= 0x555555555555555) {
            unint64_t v21 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v21 = v20;
          }
          if (v21) {
            unint64_t v21 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<RemoteAUPropertyListeners::AUPropertyListener>>(v21);
          }
          else {
            uint64_t v22 = 0;
          }
          unint64_t v23 = v21 + 8 * ((v9 - (char *)v8) >> 3);
          *(_OWORD *)unint64_t v23 = v42;
          *(void *)(v23 + 16) = v19;
          if (v9 == (char *)v8)
          {
            unsigned int v26 = (uint64_t *)(v21 + 8 * ((v9 - (char *)v8) >> 3));
          }
          else
          {
            unint64_t v24 = v21 + 8 * ((v9 - (char *)v8) >> 3);
            do
            {
              long long v25 = *(_OWORD *)(v9 - 24);
              unsigned int v26 = (uint64_t *)(v24 - 24);
              *(void *)(v24 - 8) = *((void *)v9 - 1);
              *(_OWORD *)(v24 - 24) = v25;
              v9 -= 24;
              v24 -= 24;
            }
            while (v9 != (char *)v8);
          }
          unint64_t v14 = v21 + 24 * v22;
          uint64_t v9 = (char *)(v23 + 24);
          if (v8) {
            operator delete(v8);
          }
          int v8 = v26;
        }
        else
        {
          *(_OWORD *)uint64_t v9 = v42;
          *((void *)v9 + 2) = v18;
          v9 += 24;
        }
        ++v15;
      }
      while (v15 != v16);
    }
    else
    {
      int v8 = 0;
      uint64_t v9 = 0;
    }
    CFRelease(**(CFTypeRef **)(a1 + 64));
    CFDataRef v27 = CFDataCreate(0, (const UInt8 *)v8, v9 - (char *)v8);
  }
  **(void **)(a1 + 64) = v27;
  if (v8) {
    operator delete(v8);
  }
LABEL_56:
  [*(id *)(a1 + 40) removeSema:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  v40 = *(NSObject **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  return dispatch_semaphore_signal(v40);
}

- (int)removePropertyListenersForServer:(OpaqueAUPBServer *)a3
{
  begin = self->mPropertyListeners.__begin_;
  end = self->mPropertyListeners.__end_;
  while (begin != end)
  {
    if (*(OpaqueAUPBServer **)begin == a3)
    {
      int64_t v7 = end - (PropertyListener *)((char *)begin + 40);
      if (end != (PropertyListener *)((char *)begin + 40)) {
        memmove(begin, (char *)begin + 40, end - (PropertyListener *)((char *)begin + 40));
      }
      end = (PropertyListener *)((char *)begin + v7);
      self->mPropertyListeners.__end_ = (PropertyListener *)((char *)begin + v7);
    }
    else
    {
      begin = (PropertyListener *)((char *)begin + 40);
    }
  }
  return 0;
}

- (int)removePropertyListener:(void *)a3 onServer:(OpaqueAUPBServer *)a4 block:(OpaqueAUPB *)a5 property:(unsigned int)a6 withUserData:(void *)a7
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  begin = self->mPropertyListeners.__begin_;
  end = self->mPropertyListeners.__end_;
  if (begin == end)
  {
LABEL_8:
    int v15 = -50;
  }
  else
  {
    while (*((void **)begin + 3) != a3
         || *(OpaqueAUPBServer **)begin != a4
         || *((OpaqueAUPB **)begin + 1) != a5
         || *((_DWORD *)begin + 4) != a6
         || *((void **)begin + 4) != a7)
    {
      begin = (PropertyListener *)((char *)begin + 40);
      if (begin == end) {
        goto LABEL_8;
      }
    }
    int64_t v18 = end - (PropertyListener *)((char *)begin + 40);
    if (end != (PropertyListener *)((char *)begin + 40)) {
      memmove(begin, (char *)begin + 40, end - (PropertyListener *)((char *)begin + 40));
    }
    int v15 = 0;
    self->mPropertyListeners.__end_ = (PropertyListener *)((char *)begin + v18);
  }
  if (gLogScope)
  {
    unint64_t v16 = *(NSObject **)gLogScope;
    if (!*(void *)gLogScope) {
      return v15;
    }
  }
  else
  {
    unint64_t v16 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 136316930;
    unint64_t v20 = "AUPBClientManager.mm";
    __int16 v21 = 1024;
    int v22 = 478;
    __int16 v23 = 2048;
    unint64_t v24 = a3;
    __int16 v25 = 2048;
    unsigned int v26 = a4;
    __int16 v27 = 2048;
    int v28 = a5;
    __int16 v29 = 1024;
    unsigned int v30 = a6;
    __int16 v31 = 2048;
    uint64_t v32 = a7;
    __int16 v33 = 1024;
    int v34 = v15;
    _os_log_impl(&dword_18FEC0000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d RemovePBPropListener: proc=%p, server=%p block=%p property=%d userData=%p result=%d\n", (uint8_t *)&v19, 0x46u);
  }
  return v15;
}

- (int)addPropertyListener:(void *)a3 onServer:(OpaqueAUPBServer *)a4 block:(OpaqueAUPB *)a5 property:(unsigned int)a6 withUserData:(void *)a7
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  int v12 = -50;
  if (a3 && a4)
  {
    end = self->mPropertyListeners.__end_;
    value = self->mPropertyListeners.__end_cap_.__value_;
    if (end >= value)
    {
      begin = self->mPropertyListeners.__begin_;
      unint64_t v18 = 0xCCCCCCCCCCCCCCCDLL * ((end - begin) >> 3) + 1;
      if (v18 > 0x666666666666666) {
        std::vector<float>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v19 = 0xCCCCCCCCCCCCCCCDLL * ((value - begin) >> 3);
      if (2 * v19 > v18) {
        unint64_t v18 = 2 * v19;
      }
      if (v19 >= 0x333333333333333) {
        unint64_t v20 = 0x666666666666666;
      }
      else {
        unint64_t v20 = v18;
      }
      if (v20)
      {
        if (v20 > 0x666666666666666) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        __int16 v21 = (char *)operator new(40 * v20);
      }
      else
      {
        __int16 v21 = 0;
      }
      int v22 = &v21[8 * ((end - begin) >> 3)];
      *(void *)int v22 = a4;
      *((void *)v22 + 1) = a5;
      *((_DWORD *)v22 + 4) = a6;
      *((_DWORD *)v22 + 5) = 0;
      *((void *)v22 + 3) = a3;
      *((void *)v22 + 4) = a7;
      unint64_t v16 = (PropertyListener *)(v22 + 40);
      if (end != begin)
      {
        do
        {
          long long v23 = *(_OWORD *)((char *)end - 40);
          long long v24 = *(_OWORD *)((char *)end - 24);
          *((void *)v22 - 1) = *((void *)end - 1);
          *(_OWORD *)(v22 - 24) = v24;
          *(_OWORD *)(v22 - 40) = v23;
          v22 -= 40;
          end = (PropertyListener *)((char *)end - 40);
        }
        while (end != begin);
        end = self->mPropertyListeners.__begin_;
      }
      self->mPropertyListeners.__begin_ = (PropertyListener *)v22;
      self->mPropertyListeners.__end_ = v16;
      self->mPropertyListeners.__end_cap_.__value_ = (PropertyListener *)&v21[40 * v20];
      if (end) {
        operator delete(end);
      }
    }
    else
    {
      *(void *)end = a4;
      *((void *)end + 1) = a5;
      *((void *)end + 2) = a6;
      unint64_t v16 = (PropertyListener *)((char *)end + 40);
      *((void *)end + 3) = a3;
      *((void *)end + 4) = a7;
    }
    int v12 = 0;
    self->mPropertyListeners.__end_ = v16;
  }
  if (gLogScope)
  {
    __int16 v25 = *(NSObject **)gLogScope;
    if (!*(void *)gLogScope) {
      return v12;
    }
  }
  else
  {
    __int16 v25 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    int v27 = 136316930;
    int v28 = "AUPBClientManager.mm";
    __int16 v29 = 1024;
    int v30 = 463;
    __int16 v31 = 2048;
    uint64_t v32 = a3;
    __int16 v33 = 2048;
    int v34 = a4;
    __int16 v35 = 2048;
    unint64_t v36 = a5;
    __int16 v37 = 1024;
    unsigned int v38 = a6;
    __int16 v39 = 2048;
    v40 = a7;
    __int16 v41 = 1024;
    int v42 = v12;
    _os_log_impl(&dword_18FEC0000, v25, OS_LOG_TYPE_DEBUG, "%25s:%-5d AddPBPropListener: proc=%p, server=%p block=%p property=%d userData=%p result=%d\n", (uint8_t *)&v27, 0x46u);
  }
  return v12;
}

- (int)removeServerListener:(void *)a3 withUserData:(void *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    begin = self->mNewServerListeners.__begin_;
    end = self->mNewServerListeners.__end_;
    while (begin != end)
    {
      if (*(void **)begin == a3 && *((void **)begin + 1) == a4)
      {
        int64_t v12 = end - (NewServerListener *)((char *)begin + 16);
        if (end != (NewServerListener *)((char *)begin + 16)) {
          memmove(begin, (char *)begin + 16, end - (NewServerListener *)((char *)begin + 16));
        }
        int v9 = 0;
        self->mNewServerListeners.__end_ = (NewServerListener *)((char *)begin + v12);
        goto LABEL_8;
      }
      begin = (NewServerListener *)((char *)begin + 16);
    }
  }
  int v9 = -50;
LABEL_8:
  if (gLogScope)
  {
    CFDataRef v10 = *(NSObject **)gLogScope;
    if (!*(void *)gLogScope) {
      return v9;
    }
  }
  else
  {
    CFDataRef v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136316162;
    unint64_t v14 = "AUPBClientManager.mm";
    __int16 v15 = 1024;
    int v16 = 450;
    __int16 v17 = 2048;
    unint64_t v18 = a3;
    __int16 v19 = 2048;
    unint64_t v20 = a4;
    __int16 v21 = 1024;
    int v22 = v9;
    _os_log_impl(&dword_18FEC0000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d RemoveServerListener: proc=%p, userData=%p, result=%d\n", (uint8_t *)&v13, 0x2Cu);
  }
  return v9;
}

- (int)addNewServerListener:(void *)a3 withUserData:(void *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    end = self->mNewServerListeners.__end_;
    value = self->mNewServerListeners.__end_cap_.__value_;
    if (end >= value)
    {
      begin = self->mNewServerListeners.__begin_;
      uint64_t v12 = (end - begin) >> 4;
      unint64_t v13 = v12 + 1;
      if ((unint64_t)(v12 + 1) >> 60) {
        std::vector<float>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v14 = value - begin;
      if (v14 >> 3 > v13) {
        unint64_t v13 = v14 >> 3;
      }
      if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v15 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v15 = v13;
      }
      if (v15)
      {
        if (v15 >> 60) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        int v16 = (char *)operator new(16 * v15);
      }
      else
      {
        int v16 = 0;
      }
      __int16 v17 = &v16[16 * v12];
      *(void *)__int16 v17 = a3;
      *((void *)v17 + 1) = a4;
      int v9 = (NewServerListener *)(v17 + 16);
      if (end != begin)
      {
        do
        {
          *((_OWORD *)v17 - 1) = *((_OWORD *)end - 1);
          v17 -= 16;
          end = (NewServerListener *)((char *)end - 16);
        }
        while (end != begin);
        end = self->mNewServerListeners.__begin_;
      }
      self->mNewServerListeners.__begin_ = (NewServerListener *)v17;
      self->mNewServerListeners.__end_ = v9;
      self->mNewServerListeners.__end_cap_.__value_ = (NewServerListener *)&v16[16 * v15];
      if (end) {
        operator delete(end);
      }
    }
    else
    {
      *(void *)end = a3;
      *((void *)end + 1) = a4;
      int v9 = (NewServerListener *)((char *)end + 16);
    }
    self->mNewServerListeners.__end_ = v9;
    uint64_t v18 = [(NSMutableArray *)self->mRemoteServers copy];
    mTouchServersQueue = self->mTouchServersQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__AUPBClientManager_addNewServerListener_withUserData___block_invoke;
    block[3] = &unk_1E5687F98;
    block[4] = v18;
    block[5] = a3;
    block[6] = a4;
    dispatch_async(mTouchServersQueue, block);
    int v10 = 0;
  }
  else
  {
    int v10 = -50;
  }
  if (gLogScope)
  {
    unint64_t v20 = *(NSObject **)gLogScope;
    if (!*(void *)gLogScope) {
      return v10;
    }
  }
  else
  {
    unint64_t v20 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    long long v24 = "AUPBClientManager.mm";
    __int16 v25 = 1024;
    int v26 = 432;
    __int16 v27 = 2048;
    int v28 = a3;
    __int16 v29 = 2048;
    int v30 = a4;
    __int16 v31 = 1024;
    int v32 = v10;
    _os_log_impl(&dword_18FEC0000, v20, OS_LOG_TYPE_DEBUG, "%25s:%-5d AddServerListener: proc=%p, userData=%p, result=%d\n", buf, 0x2Cu);
  }
  return v10;
}

void __55__AUPBClientManager_addNewServerListener_withUserData___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void, uint64_t))(a1 + 40))(*(void *)(a1 + 48), [*(id *)(*((void *)&v7 + 1) + 8 * i) ref]);
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)serverFromRef:(OpaqueAUPBServer *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  mRemoteServers = self->mRemoteServers;
  uint64_t v5 = [(NSMutableArray *)mRemoteServers countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(mRemoteServers);
    }
    long long v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ((OpaqueAUPBServer *)[v9 ref] == a3) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSMutableArray *)mRemoteServers countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)processingBlock:(unsigned int)a3 propertiesChanged:(id)a4 withQualifierData:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = [MEMORY[0x1E4F29268] currentConnection];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  mRemoteServers = self->mRemoteServers;
  uint64_t v10 = [(NSMutableArray *)mRemoteServers countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v49 != v11) {
          objc_enumerationMutation(mRemoteServers);
        }
        long long v13 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        if (v8 == [v13 xpcConnection])
        {
          if (![a4 count]) {
            return;
          }
          uint64_t v15 = 0;
          *(void *)&long long v14 = 136316162;
          long long v32 = v14;
          while (2)
          {
            int v16 = objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", v15, v32), "unsignedIntValue");
            if (gLogScope)
            {
              __int16 v17 = *(NSObject **)gLogScope;
              if (!*(void *)gLogScope)
              {
LABEL_18:
                for (j = self->mPropertyListeners.__begin_;
                      j != self->mPropertyListeners.__end_;
                      j = (PropertyListener *)((char *)j + 40))
                {
                  __int16 v21 = (OpaqueAUPB *)*((void *)j + 1);
                  if (v21 == [(AUPBClientManager *)self aupbRefFromHandle:v6]
                    && *((_DWORD *)j + 4) == v16)
                  {
                    uint64_t v22 = *(void *)j;
                    if (v22 == [v13 ref])
                    {
                      if ((unint64_t)[a5 length] >= 9)
                      {
                        uint64_t v23 = (_DWORD *)[a5 bytes];
                        unint64_t v24 = [a5 bytes];
                        while ((unint64_t)v23 >= v24)
                        {
                          uint64_t v25 = [a5 bytes];
                          if ((unint64_t)v23 > v25 + [a5 length] - 8) {
                            break;
                          }
                          if (*v23 == v16)
                          {
                            uint64_t v27 = [a5 length];
                            size_t v28 = v23[1];
                            if ((unint64_t)v23 > v27 - v28 - 8) {
                              break;
                            }
                            std::vector<unsigned char>::vector(&__dst, v23[1]);
                            int v30 = v23 + 2;
                            __int16 v29 = __dst;
                            if (v28)
                            {
                              memcpy(__dst, v30, v28);
                              __int16 v29 = __dst;
                            }
                            goto LABEL_31;
                          }
                          uint64_t v26 = v23[1];
                          unint64_t v24 = [a5 bytes];
                          uint64_t v23 = (_DWORD *)((char *)v23 + v26 + 8);
                        }
                      }
                      __int16 v29 = 0;
                      LODWORD(v28) = 0;
                      int v30 = 0;
                      __dst = 0;
                      *(void *)v46 = 0;
                      uint64_t v47 = 0;
LABEL_31:
                      *(_OWORD *)buf = *(_OWORD *)j;
                      *(_OWORD *)&buf[16] = *((_OWORD *)j + 1);
                      *(void *)&buf[32] = *((void *)j + 4);
                      block[0] = MEMORY[0x1E4F143A8];
                      block[1] = 3321888768;
                      block[2] = __73__AUPBClientManager_processingBlock_propertiesChanged_withQualifierData___block_invoke;
                      block[3] = &unk_1EDFA2FB8;
                      int v42 = v28;
                      unint64_t v36 = 0;
                      uint64_t v37 = 0;
                      __p = 0;
                      std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, v29, *(uint64_t *)v46, *(void *)v46 - (void)v29);
                      global_queue = dispatch_get_global_queue(0, 0);
                      long long v39 = *(_OWORD *)buf;
                      long long v40 = *(_OWORD *)&buf[16];
                      uint64_t v41 = *(void *)&buf[32];
                      unsigned int v38 = v30;
                      block[4] = self;
                      int v43 = v6;
                      int v44 = v16;
                      dispatch_async(global_queue, block);
                      if (__p)
                      {
                        unint64_t v36 = __p;
                        operator delete(__p);
                      }
                      if (__dst)
                      {
                        *(void *)v46 = __dst;
                        operator delete(__dst);
                      }
                    }
                  }
                }
                if (++v15 >= (unint64_t)[a4 count]) {
                  return;
                }
                continue;
              }
            }
            else
            {
              __int16 v17 = MEMORY[0x1E4F14500];
            }
            break;
          }
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v18 = objc_msgSend((id)objc_msgSend(v13, "description"), "UTF8String");
            __int16 v19 = [(AUPBClientManager *)self aupbRefFromHandle:v6];
            *(_DWORD *)buf = v32;
            *(void *)&uint8_t buf[4] = "AUPBClientManager.mm";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 345;
            *(_WORD *)&buf[18] = 2080;
            *(void *)&buf[20] = v18;
            *(_WORD *)&buf[28] = 2048;
            *(void *)&buf[30] = v19;
            *(_WORD *)&buf[38] = 1024;
            int v53 = v16;
            _os_log_impl(&dword_18FEC0000, v17, OS_LOG_TYPE_DEBUG, "%25s:%-5d PBPropsChanged: %s, block=%p property=%d\n", buf, 0x2Cu);
          }
          goto LABEL_18;
        }
      }
      uint64_t v10 = [(NSMutableArray *)mRemoteServers countByEnumeratingWithState:&v48 objects:v54 count:16];
    }
    while (v10);
  }
}

uint64_t __73__AUPBClientManager_processingBlock_propertiesChanged_withQualifierData___block_invoke(uint64_t a1)
{
  uint64_t v2 = 40;
  if (!*(_DWORD *)(a1 + 112)) {
    uint64_t v2 = 64;
  }
  uint64_t v3 = *(void *)(a1 + v2);
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 96);
  uint64_t v4 = *(void *)(a1 + 104);
  uint64_t v5 = *(void *)(a1 + 72);
  uint64_t v6 = [*(id *)(a1 + 32) aupbRefFromHandle:*(unsigned int *)(a1 + 116)];
  uint64_t v7 = *(unsigned int *)(a1 + 120);
  uint64_t v8 = *(unsigned int *)(a1 + 112);
  return v10(v4, v5, v6, v7, v3, v8);
}

- (void)processingBlock:(unsigned int)a3 propertyChanged:(unsigned int)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [MEMORY[0x1E4F29268] currentConnection];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  mRemoteServers = self->mRemoteServers;
  uint64_t v9 = [(NSMutableArray *)mRemoteServers countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (!v9) {
    return;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v28;
  while (2)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v28 != v11) {
        objc_enumerationMutation(mRemoteServers);
      }
      long long v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
      if (v7 == [v13 xpcConnection])
      {
        if (gLogScope)
        {
          long long v14 = *(NSObject **)gLogScope;
          if (!*(void *)gLogScope)
          {
LABEL_16:
            begin = self->mPropertyListeners.__begin_;
            for (j = self->mPropertyListeners.__end_; begin != j; begin = (PropertyListener *)((char *)begin + 40))
            {
              __int16 v19 = (OpaqueAUPB *)*((void *)begin + 1);
              if (v19 == [(AUPBClientManager *)self aupbRefFromHandle:v5]
                && *((_DWORD *)begin + 4) == a4)
              {
                uint64_t v21 = *(void *)begin;
                if (v21 == [v13 ref])
                {
                  *(_OWORD *)buf = *(_OWORD *)begin;
                  *(_OWORD *)&buf[16] = *((_OWORD *)begin + 1);
                  *(void *)&buf[32] = *((void *)begin + 4);
                  global_queue = dispatch_get_global_queue(0, 0);
                  block[0] = MEMORY[0x1E4F143A8];
                  block[1] = 3221225472;
                  block[2] = __53__AUPBClientManager_processingBlock_propertyChanged___block_invoke;
                  block[3] = &__block_descriptor_72_e5_v8__0l;
                  long long v24 = *(_OWORD *)buf;
                  long long v25 = *(_OWORD *)&buf[16];
                  uint64_t v26 = *(void *)&buf[32];
                  dispatch_async(global_queue, block);
                }
              }
            }
            return;
          }
        }
        else
        {
          long long v14 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v15 = objc_msgSend((id)objc_msgSend(v13, "description"), "UTF8String");
          int v16 = [(AUPBClientManager *)self aupbRefFromHandle:v5];
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = "AUPBClientManager.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 322;
          *(_WORD *)&buf[18] = 2080;
          *(void *)&buf[20] = v15;
          *(_WORD *)&buf[28] = 2048;
          *(void *)&buf[30] = v16;
          *(_WORD *)&buf[38] = 1024;
          unsigned int v32 = a4;
          _os_log_impl(&dword_18FEC0000, v14, OS_LOG_TYPE_DEBUG, "%25s:%-5d PBProp Changed: %s, block=%p property=%d\n", buf, 0x2Cu);
        }
        goto LABEL_16;
      }
    }
    uint64_t v10 = [(NSMutableArray *)mRemoteServers countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v10) {
      continue;
    }
    break;
  }
}

uint64_t __53__AUPBClientManager_processingBlock_propertyChanged___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, void))(a1 + 56))(*(void *)(a1 + 64), *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned int *)(a1 + 48), 0, 0);
}

- (unsigned)auHandleFromRef:(OpaqueRemoteAudioUnit *)a3
{
  return a3;
}

- (OpaqueRemoteAudioUnit)auRefFromHandle:(unsigned int)a3
{
  return (OpaqueRemoteAudioUnit *)a3;
}

- (OpaqueAUPB)aupbRefFromHandle:(unsigned int)a3
{
  return (OpaqueAUPB *)a3;
}

- (void)newServerAdded:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_alloc_init(RemoteAUPBServer);
  -[RemoteAUPBServer setXpcConnection:](v5, "setXpcConnection:", [objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:a3]);
  -[NSXPCConnection setRemoteObjectInterface:](-[RemoteAUPBServer xpcConnection](v5, "xpcConnection"), "setRemoteObjectInterface:", [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDFB4D20]);
  [(RemoteAUPBServer *)v5 setProxyInterface:[(NSXPCConnection *)[(RemoteAUPBServer *)v5 xpcConnection] remoteObjectProxy]];
  -[NSXPCConnection setExportedInterface:](-[RemoteAUPBServer xpcConnection](v5, "xpcConnection"), "setExportedInterface:", [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDFB8448]);
  [(NSXPCConnection *)[(RemoteAUPBServer *)v5 xpcConnection] setExportedObject:self];
  mServerRefCounter = (void *)self->mServerRefCounter;
  self->mServerRefCounter = mServerRefCounter + 1;
  [(RemoteAUPBServer *)v5 setRef:mServerRefCounter];
  if (gLogScope)
  {
    uint64_t v7 = *(NSObject **)gLogScope;
    if (!*(void *)gLogScope) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v7 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    unint64_t v20 = "AUPBClientManager.mm";
    __int16 v21 = 1024;
    int v22 = 251;
    __int16 v23 = 2080;
    uint64_t v24 = objc_msgSend(-[RemoteAUPBServer description](v5, "description"), "UTF8String");
    _os_log_impl(&dword_18FEC0000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s\n", buf, 0x1Cu);
  }
LABEL_7:
  objc_initWeak((id *)buf, v5);
  objc_initWeak(&location, self);
  uint64_t v8 = [(RemoteAUPBServer *)v5 xpcConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __36__AUPBClientManager_newServerAdded___block_invoke;
  v15[3] = &unk_1E5687F28;
  objc_copyWeak(&v16, &location);
  objc_copyWeak(v17, (id *)buf);
  v17[1] = mServerRefCounter;
  [(NSXPCConnection *)v8 setInvalidationHandler:v15];
  uint64_t v9 = [(RemoteAUPBServer *)v5 xpcConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __36__AUPBClientManager_newServerAdded___block_invoke_127;
  v12[3] = &unk_1E5687F28;
  objc_copyWeak(&v13, &location);
  objc_copyWeak(v14, (id *)buf);
  v14[1] = mServerRefCounter;
  [(NSXPCConnection *)v9 setInterruptionHandler:v12];
  mTouchServersQueue = self->mTouchServersQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __36__AUPBClientManager_newServerAdded___block_invoke_128;
  v11[3] = &unk_1E5687F50;
  v11[4] = self;
  v11[5] = v5;
  v11[6] = mServerRefCounter;
  dispatch_async(mTouchServersQueue, v11);
  objc_destroyWeak(v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
}

id *__36__AUPBClientManager_newServerAdded___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  result = (id *)objc_loadWeak((id *)(a1 + 32));
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  result = (id *)objc_loadWeak((id *)(a1 + 40));
  if (!result) {
    return result;
  }
  uint64_t v4 = result;
  [result signalAllSemaphores];
  [v3[3] removeObject:v4];
  if (!gLogScope)
  {
    uint64_t v5 = MEMORY[0x1E4F14500];
LABEL_7:
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = objc_msgSend((id)objc_msgSend(v4, "description"), "UTF8String");
      uint64_t v7 = [v3[3] count];
      int v14 = 136315906;
      uint64_t v15 = "AUPBClientManager.mm";
      __int16 v16 = 1024;
      int v17 = 261;
      __int16 v18 = 2080;
      uint64_t v19 = v6;
      __int16 v20 = 2048;
      uint64_t v21 = v7;
      _os_log_impl(&dword_18FEC0000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d Remote server %s invalidated, now have %lu servers\n", (uint8_t *)&v14, 0x26u);
    }
    goto LABEL_9;
  }
  uint64_t v5 = *(NSObject **)gLogScope;
  if (*(void *)gLogScope) {
    goto LABEL_7;
  }
LABEL_9:
  uint64_t v8 = v3[4];
  uint64_t v9 = v3[5];
  if (v8 != v9)
  {
    uint64_t v10 = v8 + 4;
    do
    {
      uint64_t v11 = v10 - 4;
      if (*(v10 - 4) == *(void *)(a1 + 48) && *(v10 - 3) == 0 && *((_DWORD *)v10 - 4) == 1684628836) {
        ((void (*)(void))*(v10 - 1))(*v10);
      }
      v10 += 5;
    }
    while (v11 + 5 != v9);
  }
  return (id *)[v3 removePropertyListenersForServer:*(void *)(a1 + 48)];
}

id *__36__AUPBClientManager_newServerAdded___block_invoke_127(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  result = (id *)objc_loadWeak((id *)(a1 + 32));
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  result = (id *)objc_loadWeak((id *)(a1 + 40));
  if (!result) {
    return result;
  }
  uint64_t v4 = result;
  [result signalAllSemaphores];
  [v3[3] removeObject:v4];
  if (!gLogScope)
  {
    uint64_t v5 = MEMORY[0x1E4F14500];
LABEL_7:
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = objc_msgSend((id)objc_msgSend(v4, "description"), "UTF8String");
      uint64_t v7 = [v3[3] count];
      int v14 = 136315906;
      uint64_t v15 = "AUPBClientManager.mm";
      __int16 v16 = 1024;
      int v17 = 277;
      __int16 v18 = 2080;
      uint64_t v19 = v6;
      __int16 v20 = 2048;
      uint64_t v21 = v7;
      _os_log_impl(&dword_18FEC0000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d Remote server %s interrupted, now have %lu servers\n", (uint8_t *)&v14, 0x26u);
    }
    goto LABEL_9;
  }
  uint64_t v5 = *(NSObject **)gLogScope;
  if (*(void *)gLogScope) {
    goto LABEL_7;
  }
LABEL_9:
  uint64_t v8 = v3[4];
  uint64_t v9 = v3[5];
  if (v8 != v9)
  {
    uint64_t v10 = v8 + 4;
    do
    {
      uint64_t v11 = v10 - 4;
      if (*(v10 - 4) == *(void *)(a1 + 48) && *(v10 - 3) == 0 && *((_DWORD *)v10 - 4) == 1684628836) {
        ((void (*)(void))*(v10 - 1))(*v10);
      }
      v10 += 5;
    }
    while (v11 + 5 != v9);
  }
  return (id *)[v3 removePropertyListenersForServer:*(void *)(a1 + 48)];
}

uint64_t __36__AUPBClientManager_newServerAdded___block_invoke_128(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];

  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "xpcConnection"), "resume");
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 56);
  uint64_t v5 = *(void *)(v3 + 64);
  while (v4 != v5)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, void))v4;
    uint64_t v6 = *(void *)(v4 + 8);
    v4 += 16;
    uint64_t result = v7(v6, *(void *)(a1 + 48));
  }
  return result;
}

- (void)handleRegistrarCrash
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  mRegistrarConnection = self->mRegistrarConnection;
  if (mRegistrarConnection)
  {

    self->mRegistrarConnection = 0;
  }
  if (self->mConnectionAcknowledged)
  {
    if (gLogScope)
    {
      uint64_t v4 = *(NSObject **)gLogScope;
      if (!*(void *)gLogScope)
      {
LABEL_13:
        dispatch_time_t v6 = dispatch_time(0, 2000000000);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __41__AUPBClientManager_handleRegistrarCrash__block_invoke;
        block[3] = &unk_1E5687F00;
        void block[4] = self;
        dispatch_after(v6, MEMORY[0x1E4F14428], block);
        return;
      }
    }
    else
    {
      uint64_t v4 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v9 = "AUPBClientManager.mm";
      __int16 v10 = 1024;
      int v11 = 226;
      _os_log_impl(&dword_18FEC0000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d Delaying checking in with registrar a few seconds...\n", buf, 0x12u);
    }
    goto LABEL_13;
  }
  if (gLogScope)
  {
    uint64_t v5 = *(NSObject **)gLogScope;
    if (!*(void *)gLogScope) {
      return;
    }
  }
  else
  {
    uint64_t v5 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v9 = "AUPBClientManager.mm";
    __int16 v10 = 1024;
    int v11 = 233;
    _os_log_impl(&dword_18FEC0000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d Not retrying since connection not acknowledged.  No Entitlement?", buf, 0x12u);
  }
}

uint64_t __41__AUPBClientManager_handleRegistrarCrash__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startRegistarConnection];
}

- (void)startRegistarConnection
{
  self->mRegistrarConnection = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.internal.aupbregistrarservice"];
  -[NSXPCConnection setRemoteObjectInterface:](self->mRegistrarConnection, "setRemoteObjectInterface:", [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDFBB570]);
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3042000000;
  v9[3] = __Block_byref_object_copy__8599;
  v9[4] = __Block_byref_object_dispose__8600;
  objc_initWeak(&v10, self);
  mRegistrarConnection = self->mRegistrarConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__AUPBClientManager_startRegistarConnection__block_invoke;
  v8[3] = &unk_1E5688B80;
  v8[4] = v9;
  [(NSXPCConnection *)mRegistrarConnection setInterruptionHandler:v8];
  uint64_t v4 = self->mRegistrarConnection;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__AUPBClientManager_startRegistarConnection__block_invoke_2;
  v7[3] = &unk_1E5688B80;
  v7[4] = v9;
  [(NSXPCConnection *)v4 setInvalidationHandler:v7];
  -[NSXPCConnection setExportedInterface:](self->mRegistrarConnection, "setExportedInterface:", [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDFB8388]);
  [(NSXPCConnection *)self->mRegistrarConnection setExportedObject:self];
  [(NSXPCConnection *)self->mRegistrarConnection resume];
  uint64_t v5 = [(NSXPCConnection *)self->mRegistrarConnection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_8601];
  self->mProxyInterface = v5;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__AUPBClientManager_startRegistarConnection__block_invoke_99;
  v6[3] = &unk_1E5687ED8;
  v6[4] = self;
  [(AUPBRegistrarHosting *)v5 registerAsEndpointListenerWithReply:v6];
  if (self->mValidToken)
  {
    notify_set_state(self->mNotifyToken, 1uLL);
    notify_post("com.apple.audio.aupbregistrarneeded");
  }
  _Block_object_dispose(v9, 8);
  objc_destroyWeak(&v10);
}

uint64_t __44__AUPBClientManager_startRegistarConnection__block_invoke(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  return [Weak handleRegistrarCrash];
}

uint64_t __44__AUPBClientManager_startRegistarConnection__block_invoke_2(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  return [Weak handleRegistrarCrash];
}

void __44__AUPBClientManager_startRegistarConnection__block_invoke_99(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v4 = [a2 code];
    char v5 = 1;
    if (v4 && v4 != 3)
    {
      if (v4 != 1) {
        goto LABEL_7;
      }
      char v5 = 0;
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 101) = v5;
  }
LABEL_7:
  if (gLogScope)
  {
    dispatch_time_t v6 = *(NSObject **)gLogScope;
    if (!*(void *)gLogScope) {
      return;
    }
  }
  else
  {
    dispatch_time_t v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315650;
    uint64_t v8 = "AUPBClientManager.mm";
    __int16 v9 = 1024;
    int v10 = 210;
    __int16 v11 = 2080;
    uint64_t v12 = objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
    _os_log_impl(&dword_18FEC0000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", (uint8_t *)&v7, 0x1Cu);
  }
}

void __44__AUPBClientManager_startRegistarConnection__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (gLogScope)
  {
    uint64_t v3 = *(NSObject **)gLogScope;
    if (!*(void *)gLogScope) {
      return;
    }
  }
  else
  {
    uint64_t v3 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315650;
    char v5 = "AUPBClientManager.mm";
    __int16 v6 = 1024;
    int v7 = 190;
    __int16 v8 = 2080;
    uint64_t v9 = objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
    _os_log_impl(&dword_18FEC0000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", (uint8_t *)&v4, 0x1Cu);
  }
}

- (AUPBClientManager)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)AUPBClientManager;
  if ([(AUPBClientManager *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  if (self->mValidToken) {
    notify_cancel(self->mNotifyToken);
  }
  v3.receiver = self;
  v3.super_class = (Class)AUPBClientManager;
  [(AUPBClientManager *)&v3 dealloc];
}

- (unint64_t)retainCount
{
  return -1;
}

@end