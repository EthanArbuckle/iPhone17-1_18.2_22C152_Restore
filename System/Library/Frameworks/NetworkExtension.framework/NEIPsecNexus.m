@interface NEIPsecNexus
- (BOOL)setDefaultInputHandler:(nw_protocol *)a3;
- (NEIPsecNexus)initWithName:(id)a3 delegate:(id)a4 enableWithChannelCount:(unsigned int)a5;
- (NEIPsecNexus)initWithName:(id)a3 delegate:(id)a4 enableWithChannelCount:(unsigned int)a5 netifRingSize:(unsigned int)a6 kernelPipeTxRingSize:(unsigned int)a7 kernelPipeRxRingSize:(unsigned int)a8;
- (NEIPsecNexus)initWithName:(id)a3 delegate:(id)a4 enableWithChannelCount:(unsigned int)a5 netifRingSize:(unsigned int)a6 kernelPipeTxRingSize:(unsigned int)a7 kernelPipeRxRingSize:(unsigned int)a8 execUUID:(id)a9;
- (NEIPsecNexus)initWithName:(id)a3 delegate:(id)a4 shouldCreateKernelChannel:(BOOL)a5;
- (NSArray)nexusInstances;
- (uint64_t)initializeWithCount:(void *)a1;
- (void)setNexusInstances:(id)a3;
- (void)setRemotePacketProxy:(id)a3;
@end

@implementation NEIPsecNexus

- (void).cxx_destruct
{
}

- (void)setNexusInstances:(id)a3
{
}

- (NSArray)nexusInstances
{
  return self->_nexusInstances;
}

- (void)setRemotePacketProxy:(id)a3
{
  id v4 = a3;
  [(NEInternetNexus *)self setPacketProxy:v4];
  if (v4)
  {
    -[NEIPsecNexus setDefaultInputHandler:](self, "setDefaultInputHandler:", [v4 protocol]);
    if (self)
    {
      Property = (NEIPsecNexus *)objc_getProperty(self, v5, 112, 1);
      self = Property;
      if (Property) {
        Property = (NEIPsecNexus *)objc_getProperty(Property, v7, 8, 1);
      }
    }
    else
    {
      Property = 0;
    }
    v8 = Property;
    uint64_t protocol_handler = nw_channel_get_protocol_handler();

    if (protocol_handler)
    {
      [v4 setDefaultOutputProtocolHandler:protocol_handler];
    }
    else
    {
      v10 = ne_log_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_error_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_ERROR, "Could not get kernel channel protocol", v11, 2u);
      }
    }
  }
}

- (BOOL)setDefaultInputHandler:(nw_protocol *)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (self)
    {
      id Property = objc_getProperty(self, a2, 112, 1);
      v6 = Property;
      if (Property) {
        id Property = objc_getProperty(Property, v5, 8, 1);
      }
    }
    else
    {
      v6 = 0;
      id Property = 0;
    }
    id v7 = Property;
    uint64_t protocol_handler = nw_channel_get_protocol_handler();

    if (protocol_handler)
    {
      (**(void (***)(uint64_t, nw_protocol *))(protocol_handler + 24))(protocol_handler, a3);
      return 1;
    }
    v10 = ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_error_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_ERROR, "Could not get kernel channel protocol", (uint8_t *)&v11, 2u);
    }
  }
  else
  {
    v10 = ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      int v11 = 136315138;
      v12 = "-[NEIPsecNexus setDefaultInputHandler:]";
      _os_log_fault_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_FAULT, "%s called with null inputHandler", (uint8_t *)&v11, 0xCu);
    }
  }

  return 0;
}

- (NEIPsecNexus)initWithName:(id)a3 delegate:(id)a4 enableWithChannelCount:(unsigned int)a5 netifRingSize:(unsigned int)a6 kernelPipeTxRingSize:(unsigned int)a7 kernelPipeRxRingSize:(unsigned int)a8 execUUID:(id)a9
{
  v16.receiver = self;
  v16.super_class = (Class)NEIPsecNexus;
  v10 = -[NENexus initWithLevel:name:virtualInterfaceType:delegate:channelCount:netifRingSize:kernelPipeTxRingSize:kernelPipeRxRingSize:execUUID:](&v16, sel_initWithLevel_name_virtualInterfaceType_delegate_channelCount_netifRingSize_kernelPipeTxRingSize_kernelPipeRxRingSize_execUUID_, 2, a3, 2, a4, *(void *)&a5, *(void *)&a6, __PAIR64__(a8, a7), a9);
  int v11 = v10;
  if (!v10)
  {
    uint64_t v13 = ne_log_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_FAULT, "[super initWithLevel:name:delegate:] failed", buf, 2u);
    }

    goto LABEL_7;
  }
  if (!-[NEIPsecNexus initializeWithCount:](v10, a5))
  {
LABEL_7:
    v12 = 0;
    goto LABEL_8;
  }
  v12 = v11;
LABEL_8:

  return v12;
}

- (uint64_t)initializeWithCount:(void *)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (![a1 virtualInterface]) {
    return 1;
  }
  id v4 = NEVirtualInterfaceCopyNexusInstances([a1 virtualInterface], a2);
  if (v4)
  {
    CFArrayRef v5 = v4;
    int Count = CFArrayGetCount(v4);
    if (Count == a2)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if (a2)
      {
        CFIndex v8 = 0;
        CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        uint64_t v10 = a2;
        do
        {
          CFUUIDRef ValueAtIndex = (const __CFUUID *)CFArrayGetValueAtIndex(v5, v8);
          v12 = (__CFString *)CFUUIDCreateString(v9, ValueAtIndex);
          uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v12];
          [v7 addObject:v13];

          ++v8;
        }
        while (v10 != v8);
      }
      CFRelease(v5);
      [a1 setNexusInstances:v7];

      return 1;
    }
    objc_super v16 = ne_log_obj();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      v17[0] = 67109634;
      v17[1] = a2;
      __int16 v18 = 1024;
      int v19 = Count;
      __int16 v20 = 2112;
      CFArrayRef v21 = v5;
      _os_log_fault_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_FAULT, "Expected to create %u channels, created %u:%@", (uint8_t *)v17, 0x18u);
    }

    CFRelease(v5);
  }
  else
  {
    v15 = ne_log_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v17[0]) = 0;
      _os_log_fault_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_FAULT, "NEVirtualInterfaceCopyNexusInstances failed", (uint8_t *)v17, 2u);
    }
  }
  return 0;
}

- (NEIPsecNexus)initWithName:(id)a3 delegate:(id)a4 enableWithChannelCount:(unsigned int)a5 netifRingSize:(unsigned int)a6 kernelPipeTxRingSize:(unsigned int)a7 kernelPipeRxRingSize:(unsigned int)a8
{
  v15.receiver = self;
  v15.super_class = (Class)NEIPsecNexus;
  CFAllocatorRef v9 = -[NENexus initWithLevel:name:virtualInterfaceType:delegate:channelCount:netifRingSize:kernelPipeTxRingSize:kernelPipeRxRingSize:execUUID:](&v15, sel_initWithLevel_name_virtualInterfaceType_delegate_channelCount_netifRingSize_kernelPipeTxRingSize_kernelPipeRxRingSize_execUUID_, 2, a3, 2, a4, *(void *)&a5, *(void *)&a6, __PAIR64__(a8, a7), 0);
  uint64_t v10 = v9;
  if (!v9)
  {
    v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_FAULT, "[super initWithLevel:name:delegate:] failed", buf, 2u);
    }

    goto LABEL_7;
  }
  if (!-[NEIPsecNexus initializeWithCount:](v9, a5))
  {
LABEL_7:
    int v11 = 0;
    goto LABEL_8;
  }
  int v11 = v10;
LABEL_8:

  return v11;
}

- (NEIPsecNexus)initWithName:(id)a3 delegate:(id)a4 enableWithChannelCount:(unsigned int)a5
{
  return [(NEIPsecNexus *)self initWithName:a3 delegate:a4 enableWithChannelCount:*(void *)&a5 netifRingSize:0 kernelPipeTxRingSize:0 kernelPipeRxRingSize:0];
}

- (NEIPsecNexus)initWithName:(id)a3 delegate:(id)a4 shouldCreateKernelChannel:(BOOL)a5
{
  BOOL v5 = a5;
  v19.receiver = self;
  v19.super_class = (Class)NEIPsecNexus;
  v6 = [(NENexus *)&v19 initWithLevel:2 name:a3 virtualInterfaceType:2 delegate:a4 channelCount:a5];
  id v7 = v6;
  if (!v6)
  {
    objc_super v16 = ne_log_obj();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    *(_WORD *)__int16 v18 = 0;
    v17 = "[super initWithLevel:name:delegate:] failed";
    goto LABEL_12;
  }
  if (v5)
  {
    uint64_t Channel = NEVirtualInterfaceCreateChannel((uint64_t)[(NENexus *)v6 virtualInterface]);
    if (Channel)
    {
      uint64_t v10 = (void *)Channel;
      id v11 = objc_getProperty(v7, v9, 112, 1);
      uint64_t v13 = v11;
      if (v11) {
        objc_setProperty_atomic(v11, v12, v10, 8);
      }

      goto LABEL_7;
    }
    objc_super v16 = ne_log_obj();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
LABEL_10:

      v14 = 0;
      goto LABEL_8;
    }
    *(_WORD *)__int16 v18 = 0;
    v17 = "NEVirtualInterfaceCreateChannel failed";
LABEL_12:
    _os_log_fault_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_FAULT, v17, v18, 2u);
    goto LABEL_10;
  }
LABEL_7:
  v14 = v7;
LABEL_8:

  return v14;
}

@end