@interface AUPBServer
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)sharedInstance;
- (AUPBServer)init;
- (AUProcessingBlock)aupbFromAUHandle:(unsigned int)a3;
- (AUProcessingBlock)aupbFromRef:(OpaqueAUPB *)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (OpaqueAUPB)registerBlock:(const AUPBMethods *)a3 withUserData:(void *)a4;
- (OpaqueRemoteAudioUnit)auRefFromHandle:(unsigned int)a3;
- (id).cxx_construct;
- (int)registerAU:(OpaqueRemoteAudioUnit *)a3 inBlock:(OpaqueAUPB *)a4;
- (int)unregisterAU:(OpaqueRemoteAudioUnit *)a3;
- (int)unregisterBlock:(OpaqueAUPB *)a3;
- (unint64_t)retainCount;
- (unsigned)auHandleFromRef:(OpaqueRemoteAudioUnit *)a3;
- (unsigned)handleFromAUPBRef:(OpaqueAUPB *)a3;
- (void)blockListChanged;
- (void)checkConnectRegistrar;
- (void)copyProcessingBlock:(unsigned int)a3 property:(unsigned int)a4 intoReply:(id)a5;
- (void)dealloc;
- (void)getAudioUnit:(unsigned int)a3 parameter:(unsigned int)a4 onScope:(unsigned int)a5 element:(unsigned int)a6 inReply:(id)a7;
- (void)getAudioUnit:(unsigned int)a3 property:(unsigned int)a4 onScope:(unsigned int)a5 element:(unsigned int)a6 inReply:(id)a7;
- (void)getAudioUnit:(unsigned int)a3 propertyInfo:(unsigned int)a4 onScope:(unsigned int)a5 element:(unsigned int)a6 inReply:(id)a7;
- (void)handleRegistrarCrash;
- (void)processingBlock:(OpaqueAUPB *)a3 properties:(const unsigned int *)a4 count:(unsigned int)a5 changedWithQualifierData:(void *)a6 length:(unsigned int)a7;
- (void)processingBlockRef:(OpaqueAUPB *)a3 propertyChanged:(unsigned int)a4;
- (void)setAudioUnit:(unsigned int)a3 parameter:(unsigned int)a4 onScope:(unsigned int)a5 element:(unsigned int)a6 value:(float)a7 withReply:(id)a8;
- (void)setAudioUnit:(unsigned int)a3 property:(unsigned int)a4 onScope:(unsigned int)a5 element:(unsigned int)a6 value:(id)a7 withReply:(id)a8;
- (void)setProcessingBlock:(unsigned int)a3 property:(unsigned int)a4 value:(id)a5 withReply:(id)a6;
- (void)startRegistrarConnection;
@end

@implementation AUPBServer

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
    v4.super_class = (Class)&OBJC_METACLASS___AUPBServer;
    sSharedInstance = objc_msgSend(objc_msgSendSuper2(&v4, sel_allocWithZone_, 0), "init");
  }
  objc_sync_exit(a1);
  return (id)sSharedInstance;
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = (char *)self + 56;
  *((void *)self + 11) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = (char *)self + 80;
  *((void *)self + 13) = 0;
  return self;
}

- (void).cxx_destruct
{
  value = self->mTestBlock.__ptr_.__value_;
  self->mTestBlock.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(TestAUProcessingBlock *, SEL))(*(void *)value + 8))(value, a2);
  }
  objc_super v4 = self->mLock.__ptr_.__value_;
  self->mLock.__ptr_.__value_ = 0;
  if (v4)
  {
    JUMPOUT(0x192FC8940);
  }
}

- (void)setAudioUnit:(unsigned int)a3 parameter:(unsigned int)a4 onScope:(unsigned int)a5 element:(unsigned int)a6 value:(float)a7 withReply:(id)a8
{
  uint64_t v10 = *(void *)&a6;
  uint64_t v11 = *(void *)&a5;
  uint64_t v12 = *(void *)&a4;
  uint64_t v13 = *(void *)&a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  os_unfair_recursive_lock_lock_with_options();
  v15 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    int v20 = 67109888;
    int v21 = v12;
    __int16 v22 = 1024;
    int v23 = v13;
    __int16 v24 = 1024;
    int v25 = v11;
    __int16 v26 = 1024;
    int v27 = v10;
    _os_log_debug_impl(&dword_18FEC0000, v15, OS_LOG_TYPE_DEBUG, "SetAUParam: Parameter=%u AU=0x%x scope=%u element=%u ", (uint8_t *)&v20, 0x1Au);
  }
  v16 = [(AUPBServer *)self aupbFromAUHandle:v13];
  if (v16)
  {
    v17 = [(AUPBServer *)self auRefFromHandle:v13];
    if (v17) {
      uint64_t v18 = ((uint64_t (*)(void *, OpaqueRemoteAudioUnit *, uint64_t, uint64_t, uint64_t, float))v16->var0.var7)(v16->var1, v17, v12, v11, v10, a7);
    }
    else {
      uint64_t v18 = 1063351615;
    }
  }
  else
  {
    uint64_t v18 = 1064329791;
  }
  v19 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    int v20 = 67109120;
    int v21 = v18;
    _os_log_debug_impl(&dword_18FEC0000, v19, OS_LOG_TYPE_DEBUG, "result=%d\n", (uint8_t *)&v20, 8u);
  }
  (*((void (**)(id, uint64_t))a8 + 2))(a8, v18);
  os_unfair_recursive_lock_unlock();
}

- (void)getAudioUnit:(unsigned int)a3 parameter:(unsigned int)a4 onScope:(unsigned int)a5 element:(unsigned int)a6 inReply:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  uint64_t v11 = *(void *)&a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v13 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109888;
    int v20 = v10;
    __int16 v21 = 1024;
    int v22 = v11;
    __int16 v23 = 1024;
    int v24 = v9;
    __int16 v25 = 1024;
    int v26 = v8;
    _os_log_debug_impl(&dword_18FEC0000, v13, OS_LOG_TYPE_DEBUG, "GetAUParam: Parameter=%u AU=0x%x scope=%u element=%u ", buf, 0x1Au);
  }
  float v18 = 0.0;
  v14 = [(AUPBServer *)self aupbFromAUHandle:v11];
  if (v14)
  {
    v15 = [(AUPBServer *)self auRefFromHandle:v11];
    if (v15) {
      uint64_t v16 = ((uint64_t (*)(void *, OpaqueRemoteAudioUnit *, uint64_t, uint64_t, uint64_t, float *))v14->var0.var6)(v14->var1, v15, v10, v9, v8, &v18);
    }
    else {
      uint64_t v16 = 1063351615;
    }
  }
  else
  {
    uint64_t v16 = 1064329791;
  }
  v17 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    int v20 = v16;
    _os_log_debug_impl(&dword_18FEC0000, v17, OS_LOG_TYPE_DEBUG, "result=%d\n", buf, 8u);
  }
  (*((void (**)(id, uint64_t, float))a7 + 2))(a7, v16, v18);
  os_unfair_recursive_lock_unlock();
}

- (void)setAudioUnit:(unsigned int)a3 property:(unsigned int)a4 onScope:(unsigned int)a5 element:(unsigned int)a6 value:(id)a7 withReply:(id)a8
{
  uint64_t v13 = *(void *)&a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  os_unfair_recursive_lock_lock_with_options();
  v15 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)&uint8_t buf[4] = a4;
    __int16 v20 = 1024;
    int v21 = v13;
    __int16 v22 = 1024;
    unsigned int v23 = a5;
    __int16 v24 = 1024;
    unsigned int v25 = a6;
    _os_log_debug_impl(&dword_18FEC0000, v15, OS_LOG_TYPE_DEBUG, "SetAUProp: Property=%d AU=0x%x scope=%u element=%u ", buf, 0x1Au);
  }
  if ([(AUPBServer *)self aupbFromAUHandle:v13])
  {
    if ([(AUPBServer *)self auRefFromHandle:v13])
    {
      uint64_t v16 = (const void *)[a7 bytes];
      [a7 length];
      PropertyMarshaller::PropertyMarshaller((PropertyMarshaller *)buf, v16);
    }
    uint64_t v17 = 1063351615;
  }
  else
  {
    uint64_t v17 = 1064329791;
  }
  float v18 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v17;
    _os_log_debug_impl(&dword_18FEC0000, v18, OS_LOG_TYPE_DEBUG, "result=%d\n", buf, 8u);
  }
  (*((void (**)(id, uint64_t))a8 + 2))(a8, v17);
  os_unfair_recursive_lock_unlock();
}

- (void)getAudioUnit:(unsigned int)a3 property:(unsigned int)a4 onScope:(unsigned int)a5 element:(unsigned int)a6 inReply:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  uint64_t v11 = *(void *)&a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v13 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)&uint8_t buf[4] = v10;
    __int16 v22 = 1024;
    int v23 = v11;
    __int16 v24 = 1024;
    int v25 = v9;
    __int16 v26 = 1024;
    LODWORD(v27) = v8;
    _os_log_debug_impl(&dword_18FEC0000, v13, OS_LOG_TYPE_DEBUG, "GetAUProp: Property=%d AU=0x%x scope=%u element=%u ", buf, 0x1Au);
  }
  v14 = [(AUPBServer *)self aupbFromAUHandle:v11];
  if (v14)
  {
    v15 = [(AUPBServer *)self auRefFromHandle:v11];
    if (v15)
    {
      char v20 = 0;
      unsigned int v19 = 0;
      uint64_t v16 = ((uint64_t (*)(void *, OpaqueRemoteAudioUnit *, uint64_t, uint64_t, uint64_t, unsigned int *, char *))v14->var0.var3)(v14->var1, v15, v10, v9, v8, &v19, &v20);
      if (!v16 && v19)
      {
        std::vector<unsigned char>::vector(__p, v19);
        uint64_t v16 = ((uint64_t (*)(void *, OpaqueRemoteAudioUnit *, uint64_t, uint64_t, uint64_t, void *, unsigned int *))v14->var0.var4)(v14->var1, v15, v10, v9, v8, __p[0], &v19);
        if (!v16) {
          PropertyMarshaller::PropertyMarshaller((PropertyMarshaller *)buf, 0);
        }
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
      }
    }
    else
    {
      uint64_t v16 = 1063351615;
    }
  }
  else
  {
    uint64_t v16 = 1064329791;
  }
  uint64_t v17 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v16;
    _os_log_debug_impl(&dword_18FEC0000, v17, OS_LOG_TYPE_DEBUG, "result=%d\n", buf, 8u);
  }
  (*((void (**)(id, uint64_t, void))a7 + 2))(a7, v16, 0);
  os_unfair_recursive_lock_unlock();
}

- (void)getAudioUnit:(unsigned int)a3 propertyInfo:(unsigned int)a4 onScope:(unsigned int)a5 element:(unsigned int)a6 inReply:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  uint64_t v11 = *(void *)&a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v13 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109888;
    int v23 = v10;
    __int16 v24 = 1024;
    int v25 = v11;
    __int16 v26 = 1024;
    int v27 = v9;
    __int16 v28 = 1024;
    int v29 = v8;
    _os_log_debug_impl(&dword_18FEC0000, v13, OS_LOG_TYPE_DEBUG, "GetAUPropInfo: Property=%d AU=0x%x scope=%u element=%u ", buf, 0x1Au);
  }
  unsigned __int8 v21 = 0;
  unsigned int v20 = 0;
  v14 = [(AUPBServer *)self aupbFromAUHandle:v11];
  if (v14)
  {
    v15 = [(AUPBServer *)self auRefFromHandle:v11];
    if (v15)
    {
      uint64_t v16 = ((uint64_t (*)(void *, OpaqueRemoteAudioUnit *, uint64_t, uint64_t, uint64_t, unsigned int *, unsigned __int8 *))v14->var0.var3)(v14->var1, v15, v10, v9, v8, &v20, &v21);
      uint64_t v17 = v20;
      uint64_t v18 = v21;
    }
    else
    {
      uint64_t v18 = 0;
      uint64_t v17 = 0;
      uint64_t v16 = 1063351615;
    }
  }
  else
  {
    uint64_t v18 = 0;
    uint64_t v17 = 0;
    uint64_t v16 = 1064329791;
  }
  unsigned int v19 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109632;
    int v23 = v16;
    __int16 v24 = 1024;
    int v25 = v17;
    __int16 v26 = 1024;
    int v27 = v18;
    _os_log_debug_impl(&dword_18FEC0000, v19, OS_LOG_TYPE_DEBUG, "result=%d, size=%d, writable=%d\n", buf, 0x14u);
    uint64_t v17 = v20;
    uint64_t v18 = v21;
  }
  (*((void (**)(id, uint64_t, uint64_t, uint64_t))a7 + 2))(a7, v16, v17, v18);
  os_unfair_recursive_lock_unlock();
}

- (void)setProcessingBlock:(unsigned int)a3 property:(unsigned int)a4 value:(id)a5 withReply:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v11 = a3;
  uint64_t v12 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    int v21 = 67109376;
    int v22 = v8;
    __int16 v23 = 2048;
    uint64_t v24 = a3;
    _os_log_debug_impl(&dword_18FEC0000, v12, OS_LOG_TYPE_DEBUG, "SetPBProp: Property=%d block=0x%p", (uint8_t *)&v21, 0x12u);
  }
  CFBooleanRef v13 = (const __CFBoolean *)CFPropertyListCreateWithData(0, (CFDataRef)a5, 0, 0, 0);
  CFBooleanRef v14 = v13;
  if (v13)
  {
    if (!a3 && v8 == 1952805748)
    {
      CFTypeID v15 = CFGetTypeID(v13);
      if (v15 == CFBooleanGetTypeID())
      {
        if (CFBooleanGetValue(v14)) {
          goto LABEL_8;
        }
        goto LABEL_13;
      }
      CFTypeID v17 = CFGetTypeID(v14);
      if (v17 == CFNumberGetTypeID())
      {
        int v21 = 0;
        CFNumberGetValue(v14, kCFNumberSInt32Type, &v21);
        if (v21)
        {
LABEL_8:
          if (!self->mTestBlock.__ptr_.__value_) {
            operator new();
          }
          goto LABEL_15;
        }
LABEL_13:
        value = self->mTestBlock.__ptr_.__value_;
        self->mTestBlock.__ptr_.__value_ = 0;
        if (value) {
          (*(void (**)(TestAUProcessingBlock *))(*(void *)value + 8))(value);
        }
      }
    }
LABEL_15:
    unsigned int v19 = [(AUPBServer *)self aupbFromRef:v11];
    if (v19) {
      uint64_t v16 = ((uint64_t (*)(void *, uint64_t, const __CFBoolean *))v19->var0.var2)(v19->var1, v8, v14);
    }
    else {
      uint64_t v16 = 1064329791;
    }
    CFRelease(v14);
    goto LABEL_19;
  }
  uint64_t v16 = 1886806380;
LABEL_19:
  unsigned int v20 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    int v21 = 67109120;
    int v22 = v16;
    _os_log_debug_impl(&dword_18FEC0000, v20, OS_LOG_TYPE_DEBUG, "result=%d\n", (uint8_t *)&v21, 8u);
  }
  (*((void (**)(id, uint64_t))a6 + 2))(a6, v16);
  os_unfair_recursive_lock_unlock();
}

- (void)copyProcessingBlock:(unsigned int)a3 property:(unsigned int)a4 intoReply:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  v64[5] = *MEMORY[0x1E4F143B8];
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v8 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    buffer[0].componentType = 67109376;
    buffer[0].componentSubType = v5;
    LOWORD(buffer[0].componentManufacturer) = 2048;
    *(void *)((char *)&buffer[0].componentManufacturer + 2) = a3;
    _os_log_debug_impl(&dword_18FEC0000, v8, OS_LOG_TYPE_DEBUG, "CopyPBProp: Property=%d block=%p\n", (uint8_t *)buffer, 0x12u);
  }
  CFDataRef theData = 0;
  if (a3)
  {
    uint64_t v9 = [(AUPBServer *)self aupbFromRef:a3];
    if (!v9)
    {
      Data = 0;
      CFIndex Code = 1064329791;
      goto LABEL_85;
    }
    CFIndex Code = ((uint64_t (*)(void *, uint64_t, CFDataRef *))v9->var0.var1)(v9->var1, v5, &theData);
    CFDataRef v11 = theData;
    if (Code) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = theData == 0;
    }
    if (v12)
    {
      Data = 0;
      goto LABEL_85;
    }
    if (v5 == 1635087726)
    {
      BytePtr = CFDataGetBytePtr(theData);
      unint64_t Length = CFDataGetLength(theData);
      if (Length >= 0x18)
      {
        uint64_t v18 = 0;
        unsigned int v19 = 0;
        v32 = 0;
        uint64_t v33 = 0;
        unint64_t v34 = Length / 0x18;
        *(void *)&long long v17 = 134217984;
        long long v54 = v17;
        do
        {
          v35 = &BytePtr[24 * v33];
          unsigned int v36 = -[AUPBServer auHandleFromRef:](self, "auHandleFromRef:", *((void *)v35 + 2), v54);
          unsigned int v37 = v36;
          if (v36)
          {
            *(void *)&buffer[0].componentType = *(void *)v35;
            buffer[0].componentManufacturer = *((_DWORD *)v35 + 2);
            if (v19 >= v32)
            {
              uint64_t v41 = (v19 - v18) >> 4;
              unint64_t v42 = v41 + 1;
              if ((unint64_t)(v41 + 1) >> 60) {
                std::vector<float>::__throw_length_error[abi:ne180100]();
              }
              if ((v32 - v18) >> 3 > v42) {
                unint64_t v42 = (v32 - v18) >> 3;
              }
              if ((unint64_t)(v32 - v18) >= 0x7FFFFFFFFFFFFFF0) {
                unint64_t v43 = 0xFFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v43 = v42;
              }
              if (v43)
              {
                if (v43 >> 60) {
                  std::__throw_bad_array_new_length[abi:ne180100]();
                }
                v44 = (char *)operator new(16 * v43);
              }
              else
              {
                v44 = 0;
              }
              v45 = &v44[16 * v41];
              *(void *)v45 = *(void *)&buffer[0].componentType;
              *((_DWORD *)v45 + 2) = buffer[0].componentManufacturer;
              *((_DWORD *)v45 + 3) = v37;
              if (v19 == v18)
              {
                v47 = &v44[16 * v41];
              }
              else
              {
                v46 = &v44[16 * v41];
                do
                {
                  v47 = v46 - 16;
                  *((_OWORD *)v46 - 1) = *((_OWORD *)v19 - 1);
                  v19 -= 16;
                  v46 -= 16;
                }
                while (v19 != v18);
              }
              v32 = &v44[16 * v43];
              unsigned int v19 = v45 + 16;
              if (v18) {
                operator delete(v18);
              }
              uint64_t v18 = v47;
            }
            else
            {
              int v38 = *((_DWORD *)v35 + 2);
              *(void *)unsigned int v19 = *(void *)v35;
              *((_DWORD *)v19 + 2) = v38;
              *((_DWORD *)v19 + 3) = v36;
              v19 += 16;
            }
          }
          else
          {
            v39 = gAUPBServerLogCategory;
            if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_ERROR))
            {
              uint64_t v40 = *((void *)v35 + 2);
              buffer[0].componentType = v54;
              *(void *)&buffer[0].componentSubType = v40;
              _os_log_error_impl(&dword_18FEC0000, v39, OS_LOG_TYPE_ERROR, "#### Could not map from AU ref to handle - serious bug. AU = %p\n", (uint8_t *)buffer, 0xCu);
            }
          }
          ++v33;
        }
        while (v33 != v34);
      }
      else
      {
        uint64_t v18 = 0;
        unsigned int v19 = 0;
      }
      CFRelease(theData);
      CFDataRef v11 = CFDataCreate(0, (const UInt8 *)v18, v19 - v18);
      CFDataRef theData = v11;
      if (v18)
      {
        operator delete(v18);
        CFDataRef v11 = theData;
      }
    }
    *(void *)&error.componentType = 0;
    Data = CFPropertyListCreateData(0, v11, kCFPropertyListBinaryFormat_v1_0, 0, (CFErrorRef *)&error);
    v48 = *(const void **)&error.componentType;
    if (*(void *)&error.componentType)
    {
      v49 = gAUPBServerLogCategory;
      if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_ERROR))
      {
        buffer[0].componentType = 138412290;
        *(void *)&buffer[0].componentSubType = v48;
        _os_log_error_impl(&dword_18FEC0000, v49, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)buffer, 0xCu);
        v48 = *(const void **)&error.componentType;
      }
      CFRelease(v48);
    }
    goto LABEL_84;
  }
  Data = 0;
  CFIndex Code = 1064333936;
  if ((int)v5 <= 1886282092)
  {
    if (v5 == 1635148149)
    {
      id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      __int16 v26 = 0;
      buffer[0].componentFlagsMask = 0;
      *(_OWORD *)&buffer[0].componentType = *(_OWORD *)"xfua";
      while (1)
      {
        Next = AudioComponentFindNext(v26, buffer);
        __int16 v26 = Next;
        if (!Next) {
          break;
        }
        Impl_AudioGetComponentInfo(Next, &error, 0);
        CFTypeRef cf = 0;
        Impl_AudioGetComponentInfo(v26, 0, (const __CFString **)&cf);
        __int16 v28 = (uint64_t (***)(void))(**(uint64_t (***)(OpaqueAudioComponent *))v26)(v26);
        if (v28) {
          uint64_t v29 = *(unsigned int *)((**v28)(v28) + 56);
        }
        else {
          uint64_t v29 = 0;
        }
        v63[0] = @"type";
        v64[0] = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:error.componentType];
        v63[1] = @"subtype";
        v64[1] = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:error.componentSubType];
        v63[2] = @"manufacturer";
        v64[2] = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:error.componentManufacturer];
        v64[3] = cf;
        v63[3] = @"name";
        v63[4] = @"version";
        v64[4] = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v29];
        objc_msgSend(v25, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v64, v63, 5));
        if (cf) {
          CFRelease(cf);
        }
      }
      Data = (__CFData *)[v25 copy];
    }
    else
    {
      if (v5 != 1651272556) {
        goto LABEL_85;
      }
      Data = CFDataCreateMutable(0, 0);
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, AUProcessingBlock>, void *>>> *)self->mBlockHandlesToMethods.__tree_.__begin_node_;
      if (begin_node != &self->mBlockHandlesToMethods.__tree_.__pair1_)
      {
        do
        {
          CFDataAppendBytes(Data, (const UInt8 *)&begin_node[4], 4);
          left = (AUPBServer *)begin_node[1].__value_.__left_;
          if (left)
          {
            do
            {
              int v22 = left;
              left = (AUPBServer *)left->super.isa;
            }
            while (left);
          }
          else
          {
            do
            {
              int v22 = (AUPBServer *)begin_node[2].__value_.__left_;
              BOOL v12 = v22->super.isa == (Class)begin_node;
              begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, AUProcessingBlock>, void *>>> *)v22;
            }
            while (!v12);
          }
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, AUProcessingBlock>, void *>>> *)v22;
        }
        while (v22 != (AUPBServer *)&self->mBlockHandlesToMethods.__tree_.__pair1_);
      }
    }
  }
  else
  {
    if (v5 != 1886282093)
    {
      if (v5 == 1920299877)
      {
        pid_t v24 = getpid();
        if (proc_pid_rusage(v24, 6, (rusage_info_t *)buffer))
        {
          CFIndex Code = *__error();
LABEL_37:
          Data = theData;
          if (!theData) {
            goto LABEL_85;
          }
          goto LABEL_48;
        }
        applesauce::CF::TypeRef::TypeRef((applesauce::CF::TypeRef *)&cf, "ri_phys_footprint");
        uint64_t valuePtr = v62;
        CFTypeRef v60 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
        if (!v60)
        {
          exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(exception, "Could not construct");
        }
        *(void *)&error.componentType = &cf;
        *(void *)&error.componentManufacturer = 1;
        CFDataRef theData = applesauce::CF::details::make_CFDictionaryRef((uint64_t)&error);
        if (v60) {
          CFRelease(v60);
        }
        if (cf) {
          CFRelease(cf);
        }
      }
      else
      {
        if (v5 != 1952805748) {
          goto LABEL_85;
        }
        if (self->mTestBlock.__ptr_.__value_) {
          CFBooleanRef v14 = (CFDataRef *)MEMORY[0x1E4F1CFD0];
        }
        else {
          CFBooleanRef v14 = (CFDataRef *)MEMORY[0x1E4F1CFC8];
        }
        CFDataRef theData = *v14;
        CFRetain(theData);
      }
      CFIndex Code = 4294967246;
      goto LABEL_37;
    }
    __int16 v23 = getprogname();
    Data = (__CFData *)CFStringCreateWithCString(0, v23, 0x8000100u);
  }
  CFDataRef theData = Data;
  CFIndex Code = 4294967246;
  if (!Data) {
    goto LABEL_85;
  }
LABEL_48:
  *(void *)&error.componentType = 0;
  Data = CFPropertyListCreateData(0, Data, kCFPropertyListBinaryFormat_v1_0, 0, (CFErrorRef *)&error);
  if (!*(void *)&error.componentType)
  {
LABEL_84:
    CFRelease(theData);
    CFIndex Code = 0;
    goto LABEL_85;
  }
  CFIndex Code = CFErrorGetCode(*(CFErrorRef *)&error.componentType);
  uint64_t v30 = (__CFString *)CFErrorCopyDescription(*(CFErrorRef *)&error.componentType);
  v31 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_ERROR))
  {
    uint64_t v52 = [(__CFString *)v30 UTF8String];
    buffer[0].componentType = 136315394;
    *(void *)&buffer[0].componentSubType = v52;
    LOWORD(buffer[0].componentFlags) = 1024;
    *(UInt32 *)((char *)&buffer[0].componentFlags + 2) = Code;
    _os_log_error_impl(&dword_18FEC0000, v31, OS_LOG_TYPE_ERROR, "Error serializing property list to send: %s (err=%d)\n", (uint8_t *)buffer, 0x12u);
  }
  CFRelease(*(CFTypeRef *)&error.componentType);

LABEL_85:
  v50 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    if (Data) {
      CFIndex v51 = CFDataGetLength(Data);
    }
    else {
      CFIndex v51 = 0;
    }
    buffer[0].componentType = 67109376;
    buffer[0].componentSubType = Code;
    LOWORD(buffer[0].componentManufacturer) = 2048;
    *(void *)((char *)&buffer[0].componentManufacturer + 2) = v51;
    _os_log_debug_impl(&dword_18FEC0000, v50, OS_LOG_TYPE_DEBUG, "result=%d len=%ld\n", (uint8_t *)buffer, 0x12u);
  }
  (*((void (**)(id, CFIndex, __CFData *))a5 + 2))(a5, Code, Data);
  if (Data) {
    CFRelease(Data);
  }
  os_unfair_recursive_lock_unlock();
}

- (AUProcessingBlock)aupbFromRef:(OpaqueAUPB *)a3
{
  unsigned int v4 = [(AUPBServer *)self handleFromAUPBRef:a3];
  left = (char *)self->mBlockHandlesToMethods.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->mBlockHandlesToMethods.__tree_.__pair1_;
  uint64_t v5 = left;
  if (!left) {
    return 0;
  }
  uint64_t v8 = p_pair1;
  do
  {
    unsigned int v9 = *((_DWORD *)v5 + 8);
    BOOL v10 = v9 >= v4;
    if (v9 >= v4) {
      CFDataRef v11 = (void **)v5;
    }
    else {
      CFDataRef v11 = (void **)(v5 + 8);
    }
    if (v10) {
      uint64_t v8 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, AUProcessingBlock>, void *>>> *)v5;
    }
    uint64_t v5 = (char *)*v11;
  }
  while (*v11);
  if (v8 == p_pair1) {
    return 0;
  }
  unsigned int v12 = v8[4].__value_.__left_;
  CFBooleanRef v13 = (AUProcessingBlock *)&v8[5];
  if (v4 >= v12) {
    return v13;
  }
  else {
    return 0;
  }
}

- (unsigned)auHandleFromRef:(OpaqueRemoteAudioUnit *)a3
{
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, RemoteAUHandleInfo>, void *>>> *)self->mAUHandlesToInfo.__tree_.__begin_node_;
  if (begin_node == &self->mAUHandlesToInfo.__tree_.__pair1_) {
    return 0;
  }
  while (begin_node[6].__value_.__left_ != a3)
  {
    left = (AUPBServer *)begin_node[1].__value_.__left_;
    if (left)
    {
      do
      {
        uint64_t v5 = left;
        left = (AUPBServer *)left->super.isa;
      }
      while (left);
    }
    else
    {
      do
      {
        uint64_t v5 = (AUPBServer *)begin_node[2].__value_.__left_;
        BOOL v6 = v5->super.isa == (Class)begin_node;
        begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, RemoteAUHandleInfo>, void *>>> *)v5;
      }
      while (!v6);
    }
    begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, RemoteAUHandleInfo>, void *>>> *)v5;
    if (v5 == (AUPBServer *)&self->mAUHandlesToInfo.__tree_.__pair1_) {
      return 0;
    }
  }
  return begin_node[4].__value_.__left_;
}

- (OpaqueRemoteAudioUnit)auRefFromHandle:(unsigned int)a3
{
  left = (char *)self->mAUHandlesToInfo.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->mAUHandlesToInfo.__tree_.__pair1_;
  unsigned int v4 = left;
  if (!left) {
    return 0;
  }
  BOOL v6 = p_pair1;
  do
  {
    unsigned int v7 = *((_DWORD *)v4 + 8);
    BOOL v8 = v7 >= a3;
    if (v7 >= a3) {
      unsigned int v9 = (void **)v4;
    }
    else {
      unsigned int v9 = (void **)(v4 + 8);
    }
    if (v8) {
      BOOL v6 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, RemoteAUHandleInfo>, void *>>> *)v4;
    }
    unsigned int v4 = (char *)*v9;
  }
  while (*v9);
  if (v6 != p_pair1 && LODWORD(v6[4].__value_.__left_) <= a3) {
    return (OpaqueRemoteAudioUnit *)v6[6].__value_.__left_;
  }
  else {
    return 0;
  }
}

- (AUProcessingBlock)aupbFromAUHandle:(unsigned int)a3
{
  left = (char *)self->mAUHandlesToInfo.__tree_.__pair1_.__value_.__left_;
  if (!left) {
    return 0;
  }
  p_pair1 = &self->mAUHandlesToInfo.__tree_.__pair1_;
  do
  {
    unsigned int v5 = *((_DWORD *)left + 8);
    BOOL v6 = v5 >= a3;
    if (v5 >= a3) {
      unsigned int v7 = (char **)left;
    }
    else {
      unsigned int v7 = (char **)(left + 8);
    }
    if (v6) {
      p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, RemoteAUHandleInfo>, void *>>> *)left;
    }
    left = *v7;
  }
  while (*v7);
  if (p_pair1 == &self->mAUHandlesToInfo.__tree_.__pair1_) {
    return 0;
  }
  if (LODWORD(p_pair1[4].__value_.__left_) > a3) {
    return 0;
  }
  BOOL v10 = (char *)self->mBlockHandlesToMethods.__tree_.__pair1_.__value_.__left_;
  BOOL v8 = &self->mBlockHandlesToMethods.__tree_.__pair1_;
  unsigned int v9 = v10;
  if (!v10) {
    return 0;
  }
  unsigned int v11 = p_pair1[5].__value_.__left_;
  unsigned int v12 = v8;
  do
  {
    unsigned int v13 = *((_DWORD *)v9 + 8);
    BOOL v14 = v13 >= v11;
    if (v13 >= v11) {
      CFTypeID v15 = (void **)v9;
    }
    else {
      CFTypeID v15 = (void **)(v9 + 8);
    }
    if (v14) {
      unsigned int v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, AUProcessingBlock>, void *>>> *)v9;
    }
    unsigned int v9 = (char *)*v15;
  }
  while (*v15);
  if (v12 == v8) {
    return 0;
  }
  unsigned int v16 = v12[4].__value_.__left_;
  long long v17 = (AUProcessingBlock *)&v12[5];
  if (v11 >= v16) {
    return v17;
  }
  else {
    return 0;
  }
}

- (void)blockListChanged
{
}

- (void)processingBlock:(OpaqueAUPB *)a3 properties:(const unsigned int *)a4 count:(unsigned int)a5 changedWithQualifierData:(void *)a6 length:(unsigned int)a7
{
  __int16 v26 = a6;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (self->mConnectionAcknowledged)
  {
    unsigned int v12 = gAUPBServerLogCategory;
    if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      v35 = a3;
      __int16 v36 = 1024;
      unsigned int v37 = a5;
      _os_log_debug_impl(&dword_18FEC0000, v12, OS_LOG_TYPE_DEBUG, "PBPropsChanged: Block=%p #props=%u\n", buf, 0x12u);
    }
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (a5)
    {
      uint64_t v14 = a5;
      do
      {
        unsigned int v15 = *a4++;
        objc_msgSend(v13, "addObject:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", v15, v26));
        --v14;
      }
      while (v14);
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    obj = self->mClientConnections;
    uint64_t v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16, v26);
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v30;
      if (v27) {
        BOOL v19 = a7 == 0;
      }
      else {
        BOOL v19 = 1;
      }
      int v20 = !v19;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v30 != v18) {
            objc_enumerationMutation(obj);
          }
          int v22 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v23 = [(AUPBServer *)self handleFromAUPBRef:a3];
          pid_t v24 = (void *)[v22 proxyInterface];
          if (v20) {
            uint64_t v25 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v27 length:a7];
          }
          else {
            uint64_t v25 = 0;
          }
          [v24 processingBlock:v23 propertiesChanged:v13 withQualifierData:v25];
        }
        uint64_t v17 = [(NSMutableArray *)obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v17);
    }
  }
}

- (void)processingBlockRef:(OpaqueAUPB *)a3 propertyChanged:(unsigned int)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self->mConnectionAcknowledged)
  {
    uint64_t v4 = *(void *)&a4;
    unsigned int v7 = gAUPBServerLogCategory;
    if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      BOOL v19 = a3;
      __int16 v20 = 1024;
      int v21 = v4;
      _os_log_debug_impl(&dword_18FEC0000, v7, OS_LOG_TYPE_DEBUG, "PBPropChange: Block=%p property=%d\n", buf, 0x12u);
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    mClientConnections = self->mClientConnections;
    uint64_t v9 = [(NSMutableArray *)mClientConnections countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(mClientConnections);
          }
          objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "proxyInterface"), "processingBlock:propertyChanged:", -[AUPBServer handleFromAUPBRef:](self, "handleFromAUPBRef:", a3), v4);
        }
        uint64_t v10 = [(NSMutableArray *)mClientConnections countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (unsigned)handleFromAUPBRef:(OpaqueAUPB *)a3
{
  return a3;
}

- (int)unregisterAU:(OpaqueRemoteAudioUnit *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  os_unfair_recursive_lock_lock_with_options();
  begin_node = (uint64_t **)self->mAUHandlesToInfo.__tree_.__begin_node_;
  p_mAUHandlesToInfo = (uint64_t **)&self->mAUHandlesToInfo;
  BOOL v6 = begin_node;
  if (begin_node != p_mAUHandlesToInfo + 1)
  {
    while (v6[6] != (uint64_t *)a3)
    {
      BOOL v8 = v6[1];
      if (v8)
      {
        do
        {
          uint64_t v9 = (uint64_t **)v8;
          BOOL v8 = (uint64_t *)*v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          uint64_t v9 = (uint64_t **)v6[2];
          BOOL v10 = *v9 == (uint64_t *)v6;
          BOOL v6 = v9;
        }
        while (!v10);
      }
      BOOL v6 = v9;
      if (v9 == p_mAUHandlesToInfo + 1) {
        goto LABEL_13;
      }
    }
    uint64_t v11 = gAUPBServerLogCategory;
    if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
    {
      int v13 = *((_DWORD *)v6 + 8);
      int v14 = 134218240;
      long long v15 = a3;
      __int16 v16 = 1024;
      int v17 = v13;
      _os_log_debug_impl(&dword_18FEC0000, v11, OS_LOG_TYPE_DEBUG, "Unregistered AU %p, handle 0x%x\n", (uint8_t *)&v14, 0x12u);
    }
    std::__tree<std::__value_type<unsigned int,RemoteAUHandleInfo>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,RemoteAUHandleInfo>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,RemoteAUHandleInfo>>>::__remove_node_pointer(p_mAUHandlesToInfo, (uint64_t *)v6);
    operator delete(v6);
  }
LABEL_13:
  os_unfair_recursive_lock_unlock();
  return 0;
}

- (int)registerAU:(OpaqueRemoteAudioUnit *)a3 inBlock:(OpaqueAUPB *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  os_unfair_recursive_lock_lock_with_options();
  unsigned int v7 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    int v24 = 134218496;
    uint64_t v25 = a3;
    __int16 v26 = 1024;
    int v27 = (int)a3;
    __int16 v28 = 2048;
    long long v29 = a4;
    _os_log_debug_impl(&dword_18FEC0000, v7, OS_LOG_TYPE_DEBUG, "Registered AU %p -> handle 0x%x in block %p\n", (uint8_t *)&v24, 0x1Cu);
  }
  p_pair1 = &self->mAUHandlesToInfo.__tree_.__pair1_;
  left = (char *)self->mAUHandlesToInfo.__tree_.__pair1_.__value_.__left_;
  if (!left) {
    goto LABEL_14;
  }
  BOOL v10 = &self->mAUHandlesToInfo.__tree_.__pair1_;
  do
  {
    unsigned int v11 = *((_DWORD *)left + 8);
    BOOL v12 = v11 >= a3;
    if (v11 >= a3) {
      int v13 = (char **)left;
    }
    else {
      int v13 = (char **)(left + 8);
    }
    if (v12) {
      BOOL v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, RemoteAUHandleInfo>, void *>>> *)left;
    }
    left = *v13;
  }
  while (*v13);
  if (v10 != p_pair1 && LODWORD(v10[4].__value_.__left_) <= a3)
  {
    int v21 = 1886806380;
    uint64_t v22 = gAUPBServerLogCategory;
    if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_ERROR))
    {
      int v24 = 67109120;
      LODWORD(v25) = a3;
      _os_log_error_impl(&dword_18FEC0000, v22, OS_LOG_TYPE_ERROR, "### AU Handle 0x%x is already in handles to info map\n", (uint8_t *)&v24, 8u);
    }
  }
  else
  {
LABEL_14:
    unsigned int v14 = [(AUPBServer *)self handleFromAUPBRef:a4];
    long long v15 = p_pair1->__value_.__left_;
    __int16 v16 = &self->mAUHandlesToInfo.__tree_.__pair1_;
    if (p_pair1->__value_.__left_)
    {
      while (1)
      {
        while (1)
        {
          __int16 v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, RemoteAUHandleInfo>, void *>>> *)v15;
          unsigned int v17 = *((_DWORD *)v15 + 8);
          if (v17 <= a3) {
            break;
          }
          long long v15 = v16->__value_.__left_;
          p_pair1 = v16;
          if (!v16->__value_.__left_) {
            goto LABEL_21;
          }
        }
        if (v17 >= a3) {
          break;
        }
        long long v15 = v16[1].__value_.__left_;
        if (!v15)
        {
          p_pair1 = v16 + 1;
          goto LABEL_21;
        }
      }
      uint64_t v18 = v16;
    }
    else
    {
LABEL_21:
      uint64_t v18 = operator new(0x38uLL);
      v18[8] = a3;
      *((void *)v18 + 5) = 0;
      *((void *)v18 + 6) = 0;
      *(void *)uint64_t v18 = 0;
      *((void *)v18 + 1) = 0;
      *((void *)v18 + 2) = v16;
      p_pair1->__value_.__left_ = v18;
      BOOL v19 = *(void **)self->mAUHandlesToInfo.__tree_.__begin_node_;
      __int16 v20 = (uint64_t *)v18;
      if (v19)
      {
        self->mAUHandlesToInfo.__tree_.__begin_node_ = v19;
        __int16 v20 = (uint64_t *)p_pair1->__value_.__left_;
      }
      std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)self->mAUHandlesToInfo.__tree_.__pair1_.__value_.__left_, v20);
      ++self->mAUHandlesToInfo.__tree_.__pair3_.__value_;
    }
    int v21 = 0;
    v18[10] = v14;
    *((void *)v18 + 6) = a3;
  }
  os_unfair_recursive_lock_unlock();
  return v21;
}

- (int)unregisterBlock:(OpaqueAUPB *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  os_unfair_recursive_lock_lock_with_options();
  unsigned int v5 = [(AUPBServer *)self handleFromAUPBRef:a3];
  left = (char *)self->mBlockHandlesToMethods.__tree_.__pair1_.__value_.__left_;
  if (!left) {
    goto LABEL_12;
  }
  p_pair1 = &self->mBlockHandlesToMethods.__tree_.__pair1_;
  do
  {
    unsigned int v8 = *((_DWORD *)left + 8);
    BOOL v9 = v8 >= v5;
    if (v8 >= v5) {
      BOOL v10 = (char **)left;
    }
    else {
      BOOL v10 = (char **)(left + 8);
    }
    if (v9) {
      p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, AUProcessingBlock>, void *>>> *)left;
    }
    left = *v10;
  }
  while (*v10);
  if (p_pair1 != &self->mBlockHandlesToMethods.__tree_.__pair1_ && v5 >= LODWORD(p_pair1[4].__value_.__left_))
  {
    begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, RemoteAUHandleInfo>, void *>>> *)self->mAUHandlesToInfo.__tree_.__begin_node_;
    if (begin_node != &self->mAUHandlesToInfo.__tree_.__pair1_)
    {
      do
      {
        if (LODWORD(begin_node[5].__value_.__left_) == LODWORD(p_pair1[4].__value_.__left_))
        {
          unsigned int v14 = (AUPBServer *)std::__tree<std::__value_type<unsigned int,RemoteAUHandleInfo>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,RemoteAUHandleInfo>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,RemoteAUHandleInfo>>>::__remove_node_pointer((uint64_t **)&self->mAUHandlesToInfo, (uint64_t *)begin_node);
          operator delete(begin_node);
        }
        else
        {
          isa = (AUPBServer *)begin_node[1].__value_.__left_;
          if (isa)
          {
            do
            {
              unsigned int v14 = isa;
              isa = (AUPBServer *)isa->super.isa;
            }
            while (isa);
          }
          else
          {
            do
            {
              unsigned int v14 = (AUPBServer *)begin_node[2].__value_.__left_;
              BOOL v16 = v14->super.isa == (Class)begin_node;
              begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, RemoteAUHandleInfo>, void *>>> *)v14;
            }
            while (!v16);
          }
        }
        begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, RemoteAUHandleInfo>, void *>>> *)v14;
      }
      while (v14 != (AUPBServer *)&self->mAUHandlesToInfo.__tree_.__pair1_);
    }
    unsigned int v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, AUProcessingBlock>, void *>>> *)p_pair1[1].__value_.__left_;
    if (v17)
    {
      do
      {
        uint64_t v18 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, AUProcessingBlock>, void *>>> **)v17;
        unsigned int v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, AUProcessingBlock>, void *>>> *)v17->__value_.__left_;
      }
      while (v17);
    }
    else
    {
      BOOL v19 = p_pair1;
      do
      {
        uint64_t v18 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, AUProcessingBlock>, void *>>> **)v19[2].__value_.__left_;
        BOOL v16 = *v18 == v19;
        BOOL v19 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, AUProcessingBlock>, void *>>> *)v18;
      }
      while (!v16);
    }
    if (self->mBlockHandlesToMethods.__tree_.__begin_node_ == p_pair1) {
      self->mBlockHandlesToMethods.__tree_.__begin_node_ = v18;
    }
    __int16 v20 = (uint64_t *)self->mBlockHandlesToMethods.__tree_.__pair1_.__value_.__left_;
    --self->mBlockHandlesToMethods.__tree_.__pair3_.__value_;
    std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v20, (uint64_t *)p_pair1);
    operator delete(p_pair1);
    int v21 = gAUPBServerLogCategory;
    if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
    {
      int v22 = 134217984;
      uint64_t v23 = a3;
      _os_log_debug_impl(&dword_18FEC0000, v21, OS_LOG_TYPE_DEBUG, "Unregistered blockRef %p\n", (uint8_t *)&v22, 0xCu);
    }
    [(AUPBServer *)self blockListChanged];
    int v11 = 0;
  }
  else
  {
LABEL_12:
    int v11 = -50;
  }
  os_unfair_recursive_lock_unlock();
  return v11;
}

- (OpaqueAUPB)registerBlock:(const AUPBMethods *)a3 withUserData:(void *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  os_unfair_recursive_lock_lock_with_options();
  mAUPBRefCounter = (OpaqueAUPB *)self->mAUPBRefCounter;
  self->mAUPBRefCounter = mAUPBRefCounter + 1;
  unsigned int v8 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)int v22 = 67109376;
    *(_DWORD *)&v22[4] = mAUPBRefCounter;
    *(_WORD *)&v22[8] = 2048;
    *(void *)&v22[10] = a4;
    _os_log_debug_impl(&dword_18FEC0000, v8, OS_LOG_TYPE_DEBUG, "blockRef 0x%x assigned, userData: %p\n", v22, 0x12u);
  }
  long long v9 = *(_OWORD *)&a3->var2;
  *(_OWORD *)int v22 = *(_OWORD *)&a3->var0;
  *(_OWORD *)&v22[16] = v9;
  long long v10 = *(_OWORD *)&a3->var6;
  long long v23 = *(_OWORD *)&a3->var4;
  long long v24 = v10;
  p_pair1 = &self->mBlockHandlesToMethods.__tree_.__pair1_;
  left = self->mBlockHandlesToMethods.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    while (1)
    {
      while (1)
      {
        int v13 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, AUProcessingBlock>, void *>>> *)left;
        unsigned int v14 = *((_DWORD *)left + 8);
        if (mAUPBRefCounter >= v14) {
          break;
        }
        left = v13->__value_.__left_;
        p_pair1 = v13;
        if (!v13->__value_.__left_) {
          goto LABEL_11;
        }
      }
      if (v14 >= mAUPBRefCounter) {
        break;
      }
      left = v13[1].__value_.__left_;
      if (!left)
      {
        p_pair1 = v13 + 1;
        goto LABEL_11;
      }
    }
    long long v15 = (char *)v13;
  }
  else
  {
    int v13 = &self->mBlockHandlesToMethods.__tree_.__pair1_;
LABEL_11:
    long long v15 = (char *)operator new(0x70uLL);
    *((_DWORD *)v15 + 8) = mAUPBRefCounter;
    *(_OWORD *)(v15 + 40) = 0u;
    *(_OWORD *)(v15 + 56) = 0u;
    *(_OWORD *)(v15 + 72) = 0u;
    *(_OWORD *)(v15 + 88) = 0u;
    *((void *)v15 + 13) = 0;
    *(void *)long long v15 = 0;
    *((void *)v15 + 1) = 0;
    *((void *)v15 + 2) = v13;
    p_pair1->__value_.__left_ = v15;
    BOOL v16 = *(void **)self->mBlockHandlesToMethods.__tree_.__begin_node_;
    unsigned int v17 = (uint64_t *)v15;
    if (v16)
    {
      self->mBlockHandlesToMethods.__tree_.__begin_node_ = v16;
      unsigned int v17 = (uint64_t *)p_pair1->__value_.__left_;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)self->mBlockHandlesToMethods.__tree_.__pair1_.__value_.__left_, v17);
    ++self->mBlockHandlesToMethods.__tree_.__pair3_.__value_;
  }
  long long v19 = v23;
  long long v18 = v24;
  long long v20 = *(_OWORD *)&v22[16];
  *(_OWORD *)(v15 + 40) = *(_OWORD *)v22;
  *(_OWORD *)(v15 + 56) = v20;
  *(_OWORD *)(v15 + 72) = v19;
  *(_OWORD *)(v15 + 88) = v18;
  *((void *)v15 + 13) = a4;
  [(AUPBServer *)self blockListChanged];
  os_unfair_recursive_lock_unlock();
  return mAUPBRefCounter;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v6 = objc_msgSend((id)objc_msgSend(a4, "valueForEntitlement:", @"com.apple.private.coreaudio.rpbclient"), "BOOLValue");
  unsigned int v7 = gAUPBServerLogCategory;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = a4;
      _os_log_debug_impl(&dword_18FEC0000, v7, OS_LOG_TYPE_DEBUG, "New client connected (xpcCon=%p)\n", (uint8_t *)&buf, 0xCu);
    }
    unsigned int v8 = objc_alloc_init(AUPBClientConnection);
    [(AUPBClientConnection *)v8 setXpcconnection:a4];
    -[NSXPCConnection setExportedInterface:](-[AUPBClientConnection xpcconnection](v8, "xpcconnection"), "setExportedInterface:", [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDFB4D20]);
    [(NSXPCConnection *)[(AUPBClientConnection *)v8 xpcconnection] setExportedObject:self];
    -[NSXPCConnection setRemoteObjectInterface:](-[AUPBClientConnection xpcconnection](v8, "xpcconnection"), "setRemoteObjectInterface:", [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDFB8448]);
    [(AUPBClientConnection *)v8 setProxyInterface:[(NSXPCConnection *)[(AUPBClientConnection *)v8 xpcconnection] remoteObjectProxy]];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v15 = 0x3052000000;
    BOOL v16 = __Block_byref_object_copy__2666;
    unsigned int v17 = __Block_byref_object_dispose__2667;
    long long v18 = v8;
    long long v9 = [(AUPBClientConnection *)v8 xpcconnection];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __49__AUPBServer_listener_shouldAcceptNewConnection___block_invoke;
    v13[3] = &unk_1E5680FD8;
    v13[4] = a4;
    v13[5] = self;
    v13[6] = &buf;
    [(NSXPCConnection *)v9 setInterruptionHandler:v13];
    long long v10 = [(AUPBClientConnection *)v8 xpcconnection];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __49__AUPBServer_listener_shouldAcceptNewConnection___block_invoke_64;
    v12[3] = &unk_1E5680FD8;
    v12[4] = a4;
    v12[5] = self;
    v12[6] = &buf;
    [(NSXPCConnection *)v10 setInvalidationHandler:v12];
    [(NSMutableArray *)self->mClientConnections addObject:v8];

    [(NSXPCConnection *)[(AUPBClientConnection *)v8 xpcconnection] resume];
    _Block_object_dispose(&buf, 8);
  }
  else if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = [a4 description];
    _os_log_error_impl(&dword_18FEC0000, v7, OS_LOG_TYPE_ERROR, "Refusing connection without entitlement: %@", (uint8_t *)&buf, 0xCu);
  }
  return v6;
}

uint64_t __49__AUPBServer_listener_shouldAcceptNewConnection___block_invoke(void *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = a1[4];
    int v5 = 134217984;
    uint64_t v6 = v4;
    _os_log_debug_impl(&dword_18FEC0000, v2, OS_LOG_TYPE_DEBUG, "Client connection (xpcCon=%p) interrupted\n", (uint8_t *)&v5, 0xCu);
  }
  uint64_t result = [*(id *)(a1[5] + 32) containsObject:*(void *)(*(void *)(a1[6] + 8) + 40)];
  if (result) {
    return [*(id *)(a1[5] + 32) removeObject:*(void *)(*(void *)(a1[6] + 8) + 40)];
  }
  return result;
}

uint64_t __49__AUPBServer_listener_shouldAcceptNewConnection___block_invoke_64(void *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = a1[4];
    int v5 = 134217984;
    uint64_t v6 = v4;
    _os_log_debug_impl(&dword_18FEC0000, v2, OS_LOG_TYPE_DEBUG, "Client connection (xpcCon=%p) invalidated\n", (uint8_t *)&v5, 0xCu);
  }
  uint64_t result = [*(id *)(a1[5] + 32) containsObject:*(void *)(*(void *)(a1[6] + 8) + 40)];
  if (result) {
    return [*(id *)(a1[5] + 32) removeObject:*(void *)(*(void *)(a1[6] + 8) + 40)];
  }
  return result;
}

- (void)handleRegistrarCrash
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_debug_impl(&dword_18FEC0000, v3, OS_LOG_TYPE_DEBUG, "Registrar crashed - cancelling client connections\n", buf, 2u);
  }

  self->mRegistrarConnection = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  mClientConnections = self->mClientConnections;
  uint64_t v5 = [(NSMutableArray *)mClientConnections countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(mClientConnections);
        }
        objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "xpcconnection"), "invalidate");
      }
      uint64_t v6 = [(NSMutableArray *)mClientConnections countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v6);
  }
  [(NSMutableArray *)self->mClientConnections removeAllObjects];
  if (self->mConnectionAcknowledged)
  {
    long long v9 = gAUPBServerLogCategory;
    if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_debug_impl(&dword_18FEC0000, v9, OS_LOG_TYPE_DEBUG, "CheckconnectRegistrar after 2 sec:\n", buf, 2u);
    }
    dispatch_time_t v10 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __34__AUPBServer_handleRegistrarCrash__block_invoke;
    block[3] = &unk_1E5687F00;
    block[4] = self;
    dispatch_after(v10, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __34__AUPBServer_handleRegistrarCrash__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) checkConnectRegistrar];
}

- (void)startRegistrarConnection
{
  v3 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_debug_impl(&dword_18FEC0000, v3, OS_LOG_TYPE_DEBUG, "Starting registrar connection\n", buf, 2u);
  }
  self->mRegistrarConnection = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.internal.aupbregistrarservice"];
  -[NSXPCConnection setRemoteObjectInterface:](self->mRegistrarConnection, "setRemoteObjectInterface:", [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDFBB570]);
  *(void *)long long buf = 0;
  long long v12 = buf;
  uint64_t v13 = 0x3052000000;
  long long v14 = __Block_byref_object_copy__2666;
  long long v15 = __Block_byref_object_dispose__2667;
  BOOL v16 = self;
  mRegistrarConnection = self->mRegistrarConnection;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __38__AUPBServer_startRegistrarConnection__block_invoke;
  v10[3] = &unk_1E5688B80;
  v10[4] = buf;
  [(NSXPCConnection *)mRegistrarConnection setInterruptionHandler:v10];
  uint64_t v5 = self->mRegistrarConnection;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__AUPBServer_startRegistrarConnection__block_invoke_2;
  v9[3] = &unk_1E5688B80;
  v9[4] = buf;
  [(NSXPCConnection *)v5 setInvalidationHandler:v9];
  [(NSXPCConnection *)self->mRegistrarConnection resume];
  uint64_t v6 = [(NSXPCConnection *)self->mRegistrarConnection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_2681];
  self->mProxyInterface = v6;
  uint64_t v7 = [(NSXPCListener *)self->mListener endpoint];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__AUPBServer_startRegistrarConnection__block_invoke_33;
  v8[3] = &unk_1E5687ED8;
  v8[4] = self;
  [(AUPBRegistrarHosting *)v6 setListenerEndpoint:v7 withReply:v8];
  _Block_object_dispose(buf, 8);
}

uint64_t __38__AUPBServer_startRegistrarConnection__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) handleRegistrarCrash];
}

uint64_t __38__AUPBServer_startRegistrarConnection__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) handleRegistrarCrash];
}

void __38__AUPBServer_startRegistrarConnection__block_invoke_33(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!a2) {
    goto LABEL_7;
  }
  uint64_t v4 = [a2 code];
  char v5 = 1;
  if (v4 && v4 != 4)
  {
    if (v4 != 2) {
      goto LABEL_7;
    }
    char v5 = 0;
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 121) = v5;
LABEL_7:
  uint64_t v6 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315394;
    unsigned int v8 = "-[AUPBServer startRegistrarConnection]_block_invoke";
    __int16 v9 = 2080;
    uint64_t v10 = objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
    _os_log_debug_impl(&dword_18FEC0000, v6, OS_LOG_TYPE_DEBUG, "%s %s", (uint8_t *)&v7, 0x16u);
  }
}

void __38__AUPBServer_startRegistrarConnection__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = gAUPBServerLogCategory;
  if (os_log_type_enabled((os_log_t)gAUPBServerLogCategory, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315138;
    uint64_t v5 = objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
    _os_log_error_impl(&dword_18FEC0000, v3, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v4, 0xCu);
  }
}

- (void)checkConnectRegistrar
{
  if (self->mValidToken)
  {
    uint64_t state64 = 0;
    uint32_t state = notify_get_state(self->mNotifyToken, &state64);
    if (state64) {
      BOOL v4 = state == 0;
    }
    else {
      BOOL v4 = 0;
    }
    if (v4 && !self->mRegistrarConnection) {
      [(AUPBServer *)self startRegistrarConnection];
    }
  }
}

- (AUPBServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)AUPBServer;
  v2 = [(AUPBServer *)&v6 init];
  if (v2)
  {
    v3 = os_log_create("com.apple.coreaudio", "aupbs");
    gAUPBServerLogCategory = (uint64_t)v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_debug_impl(&dword_18FEC0000, v3, OS_LOG_TYPE_DEBUG, "Starting\n", buf, 2u);
    }
    v2->mAUPBRefCounter = 1;
    v2->mAUHandleCntr = 1;
    operator new();
  }
  return 0;
}

uint64_t __18__AUPBServer_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) checkConnectRegistrar];
}

- (void)dealloc
{
  if (self->mValidToken) {
    notify_cancel(self->mNotifyToken);
  }
  v3.receiver = self;
  v3.super_class = (Class)AUPBServer;
  [(AUPBServer *)&v3 dealloc];
}

- (unint64_t)retainCount
{
  return -1;
}

@end