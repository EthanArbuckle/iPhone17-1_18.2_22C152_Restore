@interface ASDTIOA2BlockControl
- (ASDTIOA2BlockControl)initWithIOA2Device:(id)a3 userClientID:(unsigned int)a4 isSettable:(BOOL)a5 forElement:(unsigned int)a6 inScope:(unsigned int)a7 objectClassID:(unsigned int)a8;
- (ASDTIOA2Device)ioa2Device;
- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8;
- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3;
- (BOOL)isPropertySettable:(const AudioObjectPropertyAddress *)a3;
- (BOOL)marked;
- (BOOL)setProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8;
- (BOOL)settable;
- (BOOL)synchronizeWithRegistryDictionary:(id)a3;
- (NSArray)properties;
- (NSArray)propertySelectorInfo;
- (char)blockMap;
- (id).cxx_construct;
- (unsigned)blockSize;
- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5;
- (unsigned)userClientID;
- (void)dealloc;
- (void)setBlockMap:(char *)a3;
- (void)setBlockSize:(unsigned int)a3;
- (void)setIoa2Device:(id)a3;
- (void)setMarked:(BOOL)a3;
- (void)setProperties:(id)a3;
- (void)setSettable:(BOOL)a3;
- (void)setUserClientID:(unsigned int)a3;
@end

@implementation ASDTIOA2BlockControl

- (ASDTIOA2BlockControl)initWithIOA2Device:(id)a3 userClientID:(unsigned int)a4 isSettable:(BOOL)a5 forElement:(unsigned int)a6 inScope:(unsigned int)a7 objectClassID:(unsigned int)a8
{
  uint64_t v8 = *(void *)&a8;
  uint64_t v9 = *(void *)&a7;
  uint64_t v10 = *(void *)&a6;
  BOOL v11 = a5;
  uint64_t v12 = *(void *)&a4;
  id v14 = a3;
  v15 = [v14 plugin];
  v18.receiver = self;
  v18.super_class = (Class)ASDTIOA2BlockControl;
  v16 = [(ASDTIOA2BlockControl *)&v18 initWithElement:v10 inScope:v9 withPlugin:v15 andObjectClassID:v8];

  if (v16)
  {
    [(ASDTIOA2BlockControl *)v16 setSettable:v11];
    [(ASDTIOA2BlockControl *)v16 setIoa2Device:v14];
    [(ASDTIOA2BlockControl *)v16 setUserClientID:v12];
  }

  return v16;
}

- (void)dealloc
{
  [(ASDControl *)self asdtRemoveControlProperties];
  v3 = [(ASDTIOA2BlockControl *)self ioa2Device];
  v4 = (ASDT::IOUserClient *)[v3 ioa2UserClient];

  if ([(ASDTIOA2BlockControl *)self blockMap] && v4) {
    ASDT::IOUserClient::ReleaseMemory(v4, [(ASDTIOA2BlockControl *)self blockMap]);
  }
  v5.receiver = self;
  v5.super_class = (Class)ASDTIOA2BlockControl;
  [(ASDTIOA2BlockControl *)&v5 dealloc];
}

- (NSArray)propertySelectorInfo
{
  v10[2] = *MEMORY[0x263EF8340];
  v8[0] = @"selector";
  v8[1] = @"dataType";
  v9[0] = &unk_26FCB1F38;
  v9[1] = &unk_26FCB1F50;
  v2 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  v10[0] = v2;
  v6[0] = @"selector";
  v6[1] = @"dataType";
  v7[0] = &unk_26FCB1F68;
  v7[1] = &unk_26FCB1F80;
  v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  v10[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];

  return (NSArray *)v4;
}

- (BOOL)synchronizeWithRegistryDictionary:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [(ASDTIOA2BlockControl *)self ioa2Device];
  v6 = (ASDT::IOUserClient *)[v5 ioa2UserClient];

  if (v6)
  {
    id v7 = v4;
    uint64_t v8 = v7;
    if (v7) {
      CFRetain(v7);
    }
    applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)&cf, v8);

    if (cf)
    {
      uint64_t v9 = (std::mutex *)((char *)self + 80);
      std::mutex::lock((std::mutex *)((char *)self + 80));
      if ([(ASDTIOA2BlockControl *)self blockMap])
      {
        ASDT::IOUserClient::ReleaseMemory(v6, [(ASDTIOA2BlockControl *)self blockMap]);
        [(ASDTIOA2BlockControl *)self setBlockMap:0];
        [(ASDTIOA2BlockControl *)self setBlockSize:0];
      }
      if (ASDT::IOA2UserClient::MapBlockControlBuffer(v6, (const applesauce::CF::DictionaryRef *)&cf, (unsigned int *)self + 38, (unsigned __int8 **)self + 22))
      {
        uint64_t v10 = [v8 objectForKeyedSubscript:@"property selectors"];
        BOOL v11 = [(ASDControl *)self asdtAddControlProperties:v10];
      }
      else
      {
        uint64_t v10 = ASDTIOA2LogType();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v15 = (objc_class *)objc_opt_class();
          v16 = NSStringFromClass(v15);
          [(ASDTIOA2BlockControl *)v16 synchronizeWithRegistryDictionary:v10];
        }
        BOOL v11 = 0;
      }

      std::mutex::unlock(v9);
    }
    else
    {
      uint64_t v12 = ASDTIOA2LogType();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (objc_class *)objc_opt_class();
        id v14 = NSStringFromClass(v13);
        *(_DWORD *)buf = 138412290;
        v20 = v14;
        _os_log_impl(&dword_248A1B000, v12, OS_LOG_TYPE_DEFAULT, "%@: Couldn't synchronize with registry", buf, 0xCu);
      }
      BOOL v11 = 0;
    }
    if (cf) {
      CFRelease(cf);
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3
{
  if (!a3) {
    return 0;
  }
  if (a3->mSelector == 1651272546 || a3->mSelector == 1651272548) {
    return 1;
  }
  v5.receiver = self;
  v5.super_class = (Class)ASDTIOA2BlockControl;
  return -[ASDTIOA2BlockControl hasProperty:](&v5, sel_hasProperty_);
}

- (BOOL)isPropertySettable:(const AudioObjectPropertyAddress *)a3
{
  if (!a3) {
    return 0;
  }
  if (a3->mSelector == 1651272546)
  {
    return [(ASDTIOA2BlockControl *)self settable];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)ASDTIOA2BlockControl;
    return -[ASDTIOA2BlockControl isPropertySettable:](&v4, sel_isPropertySettable_);
  }
}

- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5
{
  if (!a3) {
    return 0;
  }
  if (a3->mSelector == 1651272548) {
    return 8;
  }
  if (a3->mSelector == 1651272546)
  {
    v6 = (std::mutex *)((char *)self + 80);
    std::mutex::lock((std::mutex *)((char *)self + 80));
    unsigned int v7 = [(ASDTIOA2BlockControl *)self blockSize];
    std::mutex::unlock(v6);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)ASDTIOA2BlockControl;
    return -[ASDTIOA2BlockControl dataSizeForProperty:withQualifierSize:andQualifierData:](&v9, sel_dataSizeForProperty_withQualifierSize_andQualifierData_);
  }
  return v7;
}

- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8
{
  LOBYTE(v8) = 0;
  if (a6 && a3 && a7)
  {
    if (a3->mSelector == 1651272548)
    {
      v16 = [(ASDTIOA2BlockControl *)self ioa2Device];
      v17 = (ASDT::IOA2UserClient *)[v16 ioa2UserClient];

      if (!v17)
      {
        LOBYTE(v8) = 0;
        return (char)v8;
      }
      v13 = (std::mutex *)((char *)self + 80);
      std::mutex::lock((std::mutex *)((char *)self + 80));
      LOBYTE(v8) = *a6 > 7;
      if (*a6 >= 8)
      {
        *a6 = 8;
        ASDT::IOA2UserClient::CopyControlDictionaryByID(v17, (const applesauce::CF::ArrayRef *)[(ASDTIOA2BlockControl *)self userClientID], (applesauce::CF::DictionaryRef *)&v22);
        ASDT::IOA2UserClient::CopyBlockControlInfo_Descriptor(&v22, &v21);
        CFDictionaryRef v18 = v22;
        *(void *)a7 = v21;
        if (v18) {
          CFRelease(v18);
        }
      }
      goto LABEL_18;
    }
    if (a3->mSelector == 1651272546)
    {
      uint64_t v12 = [(ASDTIOA2BlockControl *)self ioa2Device];
      uint64_t v8 = (ASDT::IOA2UserClient *)[v12 ioa2UserClient];

      if (v8)
      {
        v13 = (std::mutex *)((char *)self + 80);
        std::mutex::lock((std::mutex *)((char *)self + 80));
        if (![(ASDTIOA2BlockControl *)self blockMap]) {
          goto LABEL_17;
        }
        unsigned int v14 = [(ASDTIOA2BlockControl *)self blockSize];
        unsigned int v15 = *a6;
        if (v14 < *a6) {
          unsigned int v15 = v14;
        }
        *a6 = v15;
        if (ASDT::IOA2UserClient::MoveBlockControlData(v8, [(ASDTIOA2BlockControl *)self userClientID], 0, *a6))
        {
          memcpy(a7, [(ASDTIOA2BlockControl *)self blockMap], *a6);
          LOBYTE(v8) = 1;
        }
        else
        {
LABEL_17:
          LOBYTE(v8) = 0;
        }
LABEL_18:
        std::mutex::unlock(v13);
      }
    }
    else
    {
      v20.receiver = self;
      v20.super_class = (Class)ASDTIOA2BlockControl;
      LOBYTE(v8) = -[ASDTIOA2BlockControl getProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v20, sel_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_);
    }
  }
  return (char)v8;
}

- (BOOL)setProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8
{
  BOOL result = 0;
  if (a3 && a7)
  {
    uint64_t v11 = *(void *)&a8;
    size_t v12 = *(void *)&a6;
    uint64_t v14 = *(void *)&a4;
    if (a3->mSelector == 1651272546)
    {
      v16 = [(ASDTIOA2BlockControl *)self ioa2Device];
      v17 = (ASDT::IOA2UserClient *)[v16 ioa2UserClient];

      if (!v17) {
        return 0;
      }
      std::mutex::lock((std::mutex *)((char *)self + 80));
      if ([(ASDTIOA2BlockControl *)self blockMap])
      {
        unsigned int v18 = [(ASDTIOA2BlockControl *)self blockSize];
        if (v18 >= v12) {
          size_t v12 = v12;
        }
        else {
          size_t v12 = v18;
        }
        memcpy([(ASDTIOA2BlockControl *)self blockMap], a7, v12);
        BOOL v19 = ASDT::IOA2UserClient::MoveBlockControlData(v17, [(ASDTIOA2BlockControl *)self userClientID], 1u, v12);
        std::mutex::unlock((std::mutex *)((char *)self + 80));
        if (v19) {
          return 1;
        }
      }
      else
      {
        std::mutex::unlock((std::mutex *)((char *)self + 80));
      }
    }
    v20.receiver = self;
    v20.super_class = (Class)ASDTIOA2BlockControl;
    return [(ASDTIOA2BlockControl *)&v20 setProperty:a3 withQualifierSize:v14 qualifierData:a5 dataSize:v12 andData:a7 forClient:v11];
  }
  return result;
}

- (BOOL)marked
{
  return *((unsigned char *)self + 144);
}

- (void)setMarked:(BOOL)a3
{
  *((unsigned char *)self + 144) = a3;
}

- (NSArray)properties
{
  return (NSArray *)*((void *)self + 20);
}

- (void)setProperties:(id)a3
{
}

- (ASDTIOA2Device)ioa2Device
{
  id WeakRetained = objc_loadWeakRetained((id *)self + 21);
  return (ASDTIOA2Device *)WeakRetained;
}

- (void)setIoa2Device:(id)a3
{
}

- (BOOL)settable
{
  return *((unsigned char *)self + 145);
}

- (void)setSettable:(BOOL)a3
{
  *((unsigned char *)self + 145) = a3;
}

- (unsigned)userClientID
{
  return *((_DWORD *)self + 37);
}

- (void)setUserClientID:(unsigned int)a3
{
  *((_DWORD *)self + 37) = a3;
}

- (char)blockMap
{
  return (char *)*((void *)self + 22);
}

- (void)setBlockMap:(char *)a3
{
  *((void *)self + 22) = a3;
}

- (unsigned)blockSize
{
  return *((_DWORD *)self + 38);
}

- (void)setBlockSize:(unsigned int)a3
{
  *((_DWORD *)self + 38) = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)self + 21);
  objc_storeStrong((id *)self + 20, 0);
  std::mutex::~mutex((std::mutex *)((char *)self + 80));
}

- (id).cxx_construct
{
  *((void *)self + 10) = 850045863;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *((void *)self + 17) = 0;
  return self;
}

- (void)synchronizeWithRegistryDictionary:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_248A1B000, log, OS_LOG_TYPE_ERROR, "%@: Failed to map block memory.", buf, 0xCu);
}

@end