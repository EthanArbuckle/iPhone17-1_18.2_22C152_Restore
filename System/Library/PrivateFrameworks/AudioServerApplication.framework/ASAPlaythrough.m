@interface ASAPlaythrough
- (ASAAudioDevice)audioDevice;
- (ASAPlaythrough)initWithDevice:(id)a3 usingChannelMapping:(id)a4;
- (ASAPlaythrough)initWithDevices:(id)a3 usingMainDevice:(id)a4 andClockDevice:(id)a5 withName:(id)a6 isPrivate:(BOOL)a7 usingChannelMapping:(id)a8;
- (ASAPlaythrough)initWithDevices:(id)a3 usingMainDevice:(id)a4 andClockDeviceUID:(id)a5 withName:(id)a6 isPrivate:(BOOL)a7 usingChannelMapping:(id)a8;
- (BOOL)playing;
- (BOOL)start;
- (BOOL)stop;
- (void)_createIOContext;
- (void)_destroyIOContext;
- (void)_freeIOContext:(id *)a3;
- (void)dealloc;
- (void)setAudioDevice:(id)a3;
- (void)setPlaying:(BOOL)a3;
@end

@implementation ASAPlaythrough

- (ASAPlaythrough)initWithDevice:(id)a3 usingChannelMapping:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ASAPlaythrough;
  v8 = [(ASAPlaythrough *)&v13 init];
  if (v8)
  {
    v9 = +[ASACoreAudio sharedCoreAudioObject];
    uint64_t v10 = [v9 audioDeviceWithUID:v6];
    audioDevice = v8->_audioDevice;
    v8->_audioDevice = (ASAAudioDevice *)v10;

    if (v8->_audioDevice)
    {
      objc_storeStrong((id *)&v8->_channelMapping, a4);
      v8->_aggregateID = 0;
    }
    else
    {

      v8 = 0;
    }
  }
  return v8;
}

- (ASAPlaythrough)initWithDevices:(id)a3 usingMainDevice:(id)a4 andClockDevice:(id)a5 withName:(id)a6 isPrivate:(BOOL)a7 usingChannelMapping:(id)a8
{
  BOOL v61 = a7;
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v65 = a5;
  CFDictionaryRef v64 = (const __CFDictionary *)a6;
  id v63 = a8;
  v67 = [MEMORY[0x263EFF980] array];
  v14 = [MEMORY[0x263F089D8] string];
  v15 = [v12 firstObject];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v16 = v12;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v72 objects:v83 count:16];
  v62 = v13;
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v73;
    while (2)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v73 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        int v22 = [v15 clockDomain];
        if (v22 != [v21 clockDomain])
        {
          char v23 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v72 objects:v83 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }
  char v23 = 1;
LABEL_11:

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  obuint64_t j = v16;
  uint64_t v24 = [obj countByEnumeratingWithState:&v68 objects:v82 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    v26 = v14;
    uint64_t v27 = *(void *)v69;

    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v69 != v27) {
          objc_enumerationMutation(obj);
        }
        v29 = *(void **)(*((void *)&v68 + 1) + 8 * j);
        if (v23)
        {
          uint64_t v30 = 0;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            CFDictionaryRef v81 = v64;
            _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "All devices in aggregate %@ share a clock domain, disabling drift compensation", buf, 0xCu);
            uint64_t v30 = 0;
          }
        }
        else
        {
          v31 = [v65 deviceUID];
          v32 = [v29 deviceUID];
          int v33 = [v31 isEqualToString:v32];

          uint64_t v30 = v33 ^ 1u;
        }
        v78[0] = @"uid";
        v34 = [v29 deviceUID];
        v79[0] = v34;
        v78[1] = @"drift";
        v35 = [NSNumber numberWithUnsignedInt:v30];
        v79[1] = v35;
        v78[2] = @"drift quality";
        v36 = [NSNumber numberWithUnsignedInt:127];
        v79[2] = v36;
        v37 = [NSDictionary dictionaryWithObjects:v79 forKeys:v78 count:3];

        [v67 addObject:v37];
        v38 = [v29 deviceUID];
        [v26 appendFormat:@"%@%@", &stru_26DD12328, v38];
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v68 objects:v82 count:16];
    }
    while (v25);
    v15 = 0;
    v14 = v26;
  }

  v39 = NSString;
  v40 = [v65 deviceUID];
  if (v40)
  {
    v41 = [v65 deviceUID];
    v42 = [v39 stringWithFormat:@"%@", v41];
  }
  else
  {
    v42 = [v39 stringWithFormat:@"%@", &stru_26DD12328];
  }

  v43 = NSString;
  v44 = [v62 deviceUID];
  if (v44)
  {
    v45 = [v62 deviceUID];
    v46 = [v43 stringWithFormat:@"%@", v45];
  }
  else
  {
    v46 = [v43 stringWithFormat:@"%@", &stru_26DD12328];
  }

  v76[0] = @"name";
  v76[1] = @"uid";
  v77[0] = v64;
  v77[1] = v14;
  v76[2] = @"clock";
  v76[3] = @"master";
  v77[2] = v42;
  v77[3] = v46;
  v77[4] = v67;
  v76[4] = @"subdevices";
  v76[5] = @"private";
  v47 = [NSNumber numberWithBool:v61];
  v77[5] = v47;
  CFDictionaryRef v48 = [NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:6];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFDictionaryRef v81 = v48;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Aggregate %@", buf, 0xCu);
  }
  v49 = +[ASACoreAudio sharedCoreAudioObject];
  id v50 = [v49 pluginWithBundleID:@"com.apple.audio.V5"];
  AudioObjectID v51 = [v50 audioDeviceObjectIDWithUID:v14];
  *(_DWORD *)buf = v51;
  if (v51 && !AudioHardwareDestroyAggregateDevice(v51))
  {
    while (1)
    {
      *(_DWORD *)buf = [v50 audioDeviceObjectIDWithUID:v14];
      if (!*(_DWORD *)buf) {
        break;
      }
      usleep(0x186A0u);
    }
  }
  OSStatus AggregateDevice = AudioHardwareCreateAggregateDevice(v48, (AudioObjectID *)buf);
  if (AggregateDevice)
  {
    int v53 = AggregateDevice;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ASAPlaythrough initWithDevices:usingMainDevice:andClockDevice:withName:isPrivate:usingChannelMapping:](v53);
    }
    v54 = 0;
    aggregateUID = self;
    goto LABEL_44;
  }
  while (1)
  {
    int v56 = *(_DWORD *)buf;
    if (v56 == [v50 audioDeviceObjectIDWithUID:v14]) {
      break;
    }
    usleep(0x2710u);
  }
  v57 = [(ASAPlaythrough *)self initWithDevice:v14 usingChannelMapping:v63];
  v54 = v57;
  if (v57)
  {
    v57->_aggregateID = *(_DWORD *)buf;
    v58 = v14;
    aggregateUID = (ASAPlaythrough *)v54->_aggregateUID;
    v54->_aggregateUID = v58;
LABEL_44:
  }
  return v54;
}

- (ASAPlaythrough)initWithDevices:(id)a3 usingMainDevice:(id)a4 andClockDeviceUID:(id)a5 withName:(id)a6 isPrivate:(BOOL)a7 usingChannelMapping:(id)a8
{
  BOOL v29 = a7;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v30 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a8;
  id v16 = objc_opt_new();
  uint64_t v17 = +[ASACoreAudio sharedCoreAudioObject];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v18 = v12;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v32;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v32 != v21) {
          objc_enumerationMutation(v18);
        }
        char v23 = [v17 audioDeviceWithUID:*(void *)(*((void *)&v31 + 1) + 8 * v22)];
        if (v23) {
          [v16 addObject:v23];
        }

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v20);
  }

  uint64_t v24 = [v17 audioDeviceWithUID:v30];
  uint64_t v25 = [v17 clockDeviceWithUID:v13];
  v26 = [(ASAPlaythrough *)self initWithDevices:v16 usingMainDevice:v24 andClockDevice:v25 withName:v14 isPrivate:v29 usingChannelMapping:v15];

  return v26;
}

- (BOOL)start
{
  if ([(ASAPlaythrough *)self playing]) {
    [(ASAPlaythrough *)self stop];
  }
  [(ASAPlaythrough *)self _createIOContext];
  if (!self->_ioContext) {
    return 0;
  }
  v3 = [(ASAPlaythrough *)self audioDevice];
  int v4 = [v3 createAudioProcID:&self->_procID forIOProc:InputOutputProc withClientData:self->_ioContext error:0];

  if (!v4) {
    return 0;
  }
  size_t v5 = 4 * self->_ioContext->var2 + 12;
  id v6 = malloc_type_calloc(1uLL, v5, 0x945B8045uLL);
  id v7 = v6;
  if (v6)
  {
    *id v6 = self->_procID;
    ioContext = self->_ioContext;
    unsigned int var2 = ioContext->var2;
    *((_DWORD *)v6 + 2) = var2;
    if (var2)
    {
      unint64_t v10 = 0;
      do
        *((_DWORD *)v6 + v10++ + 3) = 1;
      while (v10 < ioContext->var2);
    }
    v11 = [(ASAPlaythrough *)self audioDevice];
    [v11 setMainOutputProperty:1937077093 withData:v7 ofSize:v5 withQualifier:0 ofSize:0];
  }
  free(v7);
  size_t v12 = 4 * self->_ioContext->var1 + 12;
  id v13 = malloc_type_calloc(1uLL, v12, 0x4AF65C22uLL);
  id v14 = v13;
  if (v13)
  {
    *id v13 = self->_procID;
    id v15 = self->_ioContext;
    unsigned int var1 = v15->var1;
    *((_DWORD *)v13 + 2) = var1;
    if (var1)
    {
      unint64_t v17 = 0;
      do
        *((_DWORD *)v13 + v17++ + 3) = 1;
      while (v17 < v15->var1);
    }
    id v18 = [(ASAPlaythrough *)self audioDevice];
    [v18 setMainInputProperty:1937077093 withData:v14 ofSize:v12 withQualifier:0 ofSize:0];
  }
  free(v14);
  uint64_t v19 = [(ASAPlaythrough *)self audioDevice];
  int v20 = [v19 startAudioProc:self->_procID error:0];

  if (!v20)
  {
    uint64_t v22 = [(ASAPlaythrough *)self audioDevice];
    [v22 destroyAudioProcID:self->_procID error:0];

    self->_procID = 0;
    [(ASAPlaythrough *)self _destroyIOContext];
    return 0;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v24 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Audio Proc Started\n", v24, 2u);
  }
  BOOL v21 = 1;
  [(ASAPlaythrough *)self setPlaying:1];
  return v21;
}

- (BOOL)stop
{
  BOOL v3 = [(ASAPlaythrough *)self playing];
  if (v3)
  {
    int v4 = [(ASAPlaythrough *)self audioDevice];
    [v4 stopAudioProc:self->_procID error:0];

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Audio Proc Stoped\n", v7, 2u);
    }
    size_t v5 = [(ASAPlaythrough *)self audioDevice];
    [v5 destroyAudioProcID:self->_procID error:0];

    self->_procID = 0;
    [(ASAPlaythrough *)self _destroyIOContext];
    [(ASAPlaythrough *)self setPlaying:0];
  }
  return v3;
}

- (void)_createIOContext
{
  uint64_t v119 = *MEMORY[0x263EF8340];
  BOOL v3 = ($3CF287503559622E07D78CA61CDBEDC6 *)malloc_type_calloc(1uLL, 0x48uLL, 0x10A0040D5B763B2uLL);
  if (v3)
  {
    int v4 = v3;
    size_t v5 = [(ASAPlaythrough *)self audioDevice];
    id v6 = [v5 inputStreamObjectIDs];

    v95 = [MEMORY[0x263EFF980] array];
    long long v110 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    obuint64_t j = v6;
    uint64_t v7 = [obj countByEnumeratingWithState:&v110 objects:v118 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      UInt32 v9 = 0;
      uint64_t v10 = *(void *)v111;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v111 != v10) {
            objc_enumerationMutation(obj);
          }
          size_t v12 = -[ASAObject initWithAudioObjectID:]([ASAStream alloc], "initWithAudioObjectID:", [*(id *)(*((void *)&v110 + 1) + 8 * i) unsignedIntValue]);
          [v95 addObject:v12];
          id v13 = [(ASAStream *)v12 virtualFormat];
          v9 += [v13 channelsPerFrame];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v110 objects:v118 count:16];
      }
      while (v8);
    }
    else
    {
      UInt32 v9 = 0;
    }

    id v14 = [(ASAPlaythrough *)self audioDevice];
    id v15 = [v14 outputStreamObjectIDs];

    v94 = [MEMORY[0x263EFF980] array];
    long long v106 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    id v91 = v15;
    uint64_t v16 = [v91 countByEnumeratingWithState:&v106 objects:v117 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      UInt32 v18 = 0;
      uint64_t v19 = *(void *)v107;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v107 != v19) {
            objc_enumerationMutation(v91);
          }
          BOOL v21 = -[ASAObject initWithAudioObjectID:]([ASAStream alloc], "initWithAudioObjectID:", [*(id *)(*((void *)&v106 + 1) + 8 * j) unsignedIntValue]);
          [v94 addObject:v21];
          uint64_t v22 = [(ASAStream *)v21 virtualFormat];
          v18 += [v22 channelsPerFrame];
        }
        uint64_t v17 = [v91 countByEnumeratingWithState:&v106 objects:v117 count:16];
      }
      while (v17);
    }
    else
    {
      UInt32 v18 = 0;
    }

    memset(&v105, 0, sizeof(v105));
    char v23 = [v95 firstObject];
    uint64_t v24 = [v23 virtualFormat];
    uint64_t v25 = v24;
    if (v24) {
      [v24 audioStreamBasicDescription];
    }
    else {
      memset(&v105, 0, sizeof(v105));
    }

    v105.mFormatFlags |= 0x20u;
    v105.mBytesPerPacket = 4;
    v105.UInt32 mChannelsPerFrame = v18;
    v105.mBytesPerFrame = 4;
    v26 = [(ASAPlaythrough *)self audioDevice];
    v4->unsigned int var0 = [v26 ioBufferFrameSize];

    if (v9 <= v18) {
      UInt32 v27 = v18;
    }
    else {
      UInt32 v27 = v9;
    }
    size_t v28 = 4 * v27 * v4->var0;
    v4->var3 = v28;
    BOOL v29 = (float *)malloc_type_calloc(1uLL, v28, 0x88B34020uLL);
    v4->var4 = v29;
    if (!v29) {
      goto LABEL_94;
    }
    unsigned int v30 = [obj count];
    v4->unsigned int var1 = v30;
    v4->var5 = (OpaqueAudioConverter **)malloc_type_calloc(v30, 8uLL, 0x2004093837F09uLL);
    v4->var7 = (AudioBufferList **)malloc_type_calloc(v4->var1, 8uLL, 0x2004093837F09uLL);
    long long v31 = (AudioBufferList **)malloc_type_calloc(v4->var1, 8uLL, 0x2004093837F09uLL);
    v4->var9 = v31;
    if (v4->var5)
    {
      int v32 = 0;
      if (v4->var7 && v31)
      {
        v86 = self;
        long long v103 = 0u;
        long long v104 = 0u;
        long long v101 = 0u;
        long long v102 = 0u;
        id v88 = v95;
        uint64_t v33 = [v88 countByEnumeratingWithState:&v101 objects:v116 count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          int v35 = 0;
          int v36 = 0;
          char v90 = 0;
          uint64_t v93 = *(void *)v102;
          do
          {
            uint64_t v37 = 0;
            long long v38 = 0uLL;
            do
            {
              if (*(void *)v102 != v93)
              {
                objc_enumerationMutation(v88);
                long long v38 = 0uLL;
              }
              v39 = *(void **)(*((void *)&v101 + 1) + 8 * v37);
              *(void *)&inSourceFormat.mBitsPerChannel = 0;
              *(_OWORD *)&inSourceFormat.mSampleRate = v38;
              *(_OWORD *)&inSourceFormat.mBytesPerPacket = v38;
              v40 = [v39 virtualFormat];
              v41 = v40;
              if (v40) {
                [v40 audioStreamBasicDescription];
              }
              else {
                memset(&inSourceFormat, 0, sizeof(inSourceFormat));
              }

              AudioStreamBasicDescription inDestinationFormat = inSourceFormat;
              inDestinationFormat.mFormatFlags = inSourceFormat.mFormatFlags | 0x20;
              inDestinationFormat.mBytesPerPacket = 4;
              inDestinationFormat.mBytesPerFrame = 4;
              AudioConverterNew(&inSourceFormat, &inDestinationFormat, &v4->var5[v35]);
              UInt32 mChannelsPerFrame = inSourceFormat.mChannelsPerFrame;
              UInt32 v43 = inSourceFormat.mChannelsPerFrame - 1;
              UInt32 v44 = (inSourceFormat.mChannelsPerFrame - 1) & ((int)(inSourceFormat.mFormatFlags << 26) >> 31);
              v4->var7[v35] = (AudioBufferList *)malloc_type_calloc(1uLL, 16 * v44 + 24, 0x706C4E01uLL);
              v4->var9[v35] = (AudioBufferList *)malloc_type_calloc(1uLL, 16 * v43 + 24, 0x15FCF6FBuLL);
              if (v4->var5[v35])
              {
                v45 = v4->var7[v35];
                long long v38 = 0uLL;
                if (v45 && (var9 = v4->var9, var9[v35]))
                {
                  unint64_t v47 = 0;
                  v45->mNumberBuffers = v44 + 1;
                  unsigned int var0 = v4->var0;
                  UInt32 v49 = v4->var0 * inDestinationFormat.mBytesPerFrame;
                  var4 = v4->var4;
                  if (mChannelsPerFrame <= 1) {
                    unsigned int v51 = 1;
                  }
                  else {
                    unsigned int v51 = mChannelsPerFrame;
                  }
                  unsigned int v52 = v36 * var0;
                  uint64_t v53 = 16 * v51;
                  do
                  {
                    p_mNumberBuffers = &var9[v35]->mNumberBuffers;
                    UInt32 *p_mNumberBuffers = mChannelsPerFrame;
                    v55 = &p_mNumberBuffers[v47 / 4];
                    v55[2] = 1;
                    v55[3] = v49;
                    *((void *)v55 + 2) = &var4[v52];
                    v52 += var0;
                    v47 += 16;
                  }
                  while (v53 != v47);
                }
                else
                {
                  char v90 = 1;
                }
              }
              else
              {
                char v90 = 1;
                long long v38 = 0uLL;
              }
              ++v35;
              v36 += inSourceFormat.mChannelsPerFrame;
              ++v37;
            }
            while (v37 != v34);
            uint64_t v34 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v101, v116, 16, 0.0);
          }
          while (v34);
        }
        else
        {
          char v90 = 0;
        }

        int v32 = v90 & 1;
        self = v86;
      }
    }
    else
    {
      int v32 = 0;
    }
    int v56 = malloc_type_calloc(1uLL, 16 * (v18 - 1) + 24, 0xA008C1ACuLL);
    v4->var10 = (AudioBufferList *)v56;
    if (v56)
    {
      *int v56 = v18;
      if (v18)
      {
        int v57 = 0;
        unsigned int v58 = v4->var0;
        UInt32 v59 = v4->var0 * v105.mBytesPerFrame;
        v60 = v4->var4;
        uint64_t v61 = v18;
        v62 = v56 + 4;
        do
        {
          *((_DWORD *)v62 - 2) = 1;
          *((_DWORD *)v62 - 1) = v59;
          void *v62 = &v60[v57];
          v62 += 2;
          v57 += v58;
          --v61;
        }
        while (v61);
      }
    }
    unsigned int v63 = [v91 count];
    v4->unsigned int var2 = v63;
    v4->var6 = (OpaqueAudioConverter **)malloc_type_calloc(v63, 8uLL, 0x2004093837F09uLL);
    CFDictionaryRef v64 = (AudioBufferList **)malloc_type_calloc(v4->var2, 8uLL, 0x2004093837F09uLL);
    v4->var8 = v64;
    if (v4->var6 && v64)
    {
      long long v98 = 0u;
      long long v99 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      id v85 = v94;
      id v89 = (id)[v85 countByEnumeratingWithState:&v96 objects:v114 count:16];
      if (v89)
      {
        unsigned int v66 = 0;
        uint64_t v87 = *(void *)v97;
        v67 = &_os_log_internal;
        *(void *)&long long v65 = 67109632;
        long long v83 = v65;
        do
        {
          long long v68 = 0;
          long long v69 = 0uLL;
          do
          {
            if (*(void *)v97 != v87)
            {
              objc_enumerationMutation(v85);
              long long v69 = 0uLL;
            }
            long long v70 = *(void **)(*((void *)&v96 + 1) + 8 * (void)v68);
            *(void *)&inSourceFormat.mBitsPerChannel = 0;
            *(_OWORD *)&inSourceFormat.mSampleRate = v69;
            *(_OWORD *)&inSourceFormat.mBytesPerPacket = v69;
            long long v71 = objc_msgSend(v70, "virtualFormat", v83);
            long long v72 = v71;
            if (v71) {
              [v71 audioStreamBasicDescription];
            }
            else {
              memset(&inSourceFormat, 0, sizeof(inSourceFormat));
            }

            AudioConverterNew(&v105, &inSourceFormat, &v4->var6[v66]);
            uint64_t v73 = (inSourceFormat.mChannelsPerFrame - 1) & ((int)(inSourceFormat.mFormatFlags << 26) >> 31);
            v4->var8[v66] = (AudioBufferList *)malloc_type_calloc(1uLL, 16 * v73 + 24, 0x9284C4C4uLL);
            if (v4->var6[v66] && (long long v74 = v4->var8[v66]) != 0)
            {
              v74->mNumberBuffers = v73 + 1;
              long long v75 = malloc_type_calloc(inSourceFormat.mChannelsPerFrame, 4uLL, 0x100004052888210uLL);
              if (v75)
              {
                v76 = v75;
                if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
                {
                  AudioFormatID v77 = [v70 startingChannel];
                  *(void *)&inDestinationFormat.mSampleRate = __PAIR64__(v66, v83);
                  LOWORD(inDestinationFormat.mFormatID) = 1024;
                  *(AudioFormatID *)((char *)&inDestinationFormat.mFormatID + 2) = v77;
                  HIWORD(inDestinationFormat.mFormatFlags) = 1024;
                  inDestinationFormat.mBytesPerPacket = inSourceFormat.mChannelsPerFrame;
                  _os_log_impl(&dword_2289FF000, v67, OS_LOG_TYPE_DEFAULT, "Output Audio Map for %u starting at %u with %u channels\n", (uint8_t *)&inDestinationFormat, 0x14u);
                }
                UInt32 v78 = inSourceFormat.mChannelsPerFrame;
                if (inSourceFormat.mChannelsPerFrame)
                {
                  int v84 = v32;
                  unint64_t v79 = 0;
                  do
                  {
                    int v80 = v79 + [v70 startingChannel] - 1;
                    if ([(NSArray *)self->_channelMapping count] <= v80)
                    {
                      v76[v79] = -1;
                    }
                    else
                    {
                      CFDictionaryRef v81 = [(NSArray *)self->_channelMapping objectAtIndexedSubscript:v80];
                      v76[v79] = [v81 intValue];
                    }
                    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
                    {
                      AudioFormatID v82 = v76[v79];
                      LODWORD(inDestinationFormat.mSampleRate) = 67109376;
                      HIDWORD(inDestinationFormat.mSampleRate) = v79;
                      LOWORD(inDestinationFormat.mFormatID) = 1024;
                      *(AudioFormatID *)((char *)&inDestinationFormat.mFormatID + 2) = v82;
                      _os_log_impl(&dword_2289FF000, v67, OS_LOG_TYPE_DEFAULT, "%d: %d\n", (uint8_t *)&inDestinationFormat, 0xEu);
                    }
                    ++v79;
                    UInt32 v78 = inSourceFormat.mChannelsPerFrame;
                  }
                  while (v79 < inSourceFormat.mChannelsPerFrame);
                  int v32 = v84;
                }
                AudioConverterSetProperty(v4->var6[v66], 0x63686D70u, 4 * v78, v76);
                free(v76);
              }
            }
            else
            {
              int v32 = 1;
            }
            ++v66;
            long long v68 = (char *)v68 + 1;
            long long v69 = 0uLL;
          }
          while (v68 != v89);
          id v89 = (id)objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v96, v114, 16, 0.0);
        }
        while (v89);
      }
    }
    if (v4->var5 && v4->var7 && v4->var9 && v4->var10 && v4->var6 && !((v4->var8 == 0) | v32 & 1)) {
      self->_ioContext = v4;
    }
    else {
LABEL_94:
    }
      [(ASAPlaythrough *)self _freeIOContext:v4];
  }
}

- (void)_destroyIOContext
{
  self->_ioContext = 0;
}

- (void)_freeIOContext:(id *)a3
{
  if (a3)
  {
    var6 = a3->var6;
    if (var6)
    {
      unint64_t var2 = a3->var2;
      if (var2)
      {
        for (unint64_t i = 0; i < var2; ++i)
        {
          uint64_t v7 = a3->var6[i];
          if (v7)
          {
            AudioConverterDispose(v7);
            unint64_t var2 = a3->var2;
          }
        }
        var6 = a3->var6;
      }
      free(var6);
    }
    var5 = a3->var5;
    if (var5)
    {
      unint64_t var1 = a3->var1;
      if (var1)
      {
        for (unint64_t j = 0; j < var1; ++j)
        {
          v11 = a3->var5[j];
          if (v11)
          {
            AudioConverterDispose(v11);
            unint64_t var1 = a3->var1;
          }
        }
        var5 = a3->var5;
      }
      free(var5);
    }
    var7 = a3->var7;
    if (var7)
    {
      if (a3->var1)
      {
        unint64_t v13 = 0;
        do
          free(a3->var7[v13++]);
        while (v13 < a3->var1);
        var7 = a3->var7;
      }
      free(var7);
    }
    var9 = a3->var9;
    if (var9)
    {
      if (a3->var1)
      {
        unint64_t v15 = 0;
        do
          free(a3->var9[v15++]);
        while (v15 < a3->var1);
        var9 = a3->var9;
      }
      free(var9);
    }
    var8 = a3->var8;
    if (var8)
    {
      if (a3->var2)
      {
        unint64_t v17 = 0;
        do
          free(a3->var8[v17++]);
        while (v17 < a3->var2);
        var8 = a3->var8;
      }
      free(var8);
    }
    free(a3->var10);
    free(a3->var4);
    free(a3);
  }
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  v3[0] = 67109376;
  v3[1] = v2;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to destroy aggregate device with object ID %d, error: 0x%x", (uint8_t *)v3, 0xEu);
}

- (ASAAudioDevice)audioDevice
{
  return (ASAAudioDevice *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAudioDevice:(id)a3
{
}

- (BOOL)playing
{
  return self->_playing;
}

- (void)setPlaying:(BOOL)a3
{
  self->_playing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioDevice, 0);
  objc_storeStrong((id *)&self->_aggregateUID, 0);
  objc_storeStrong((id *)&self->_channelMapping, 0);
}

- (void)initWithDevices:(int)a1 usingMainDevice:andClockDevice:withName:isPrivate:usingChannelMapping:.cold.1(int a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to create aggregate with error 0x%x", (uint8_t *)v1, 8u);
}

@end