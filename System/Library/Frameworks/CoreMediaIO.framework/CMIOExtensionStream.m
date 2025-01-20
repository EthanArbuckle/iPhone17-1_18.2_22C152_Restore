@interface CMIOExtensionStream
+ (CMIOExtensionStream)streamWithLocalizedName:(NSString *)localizedName streamID:(NSUUID *)streamID direction:(CMIOExtensionStreamDirection)direction clockType:(CMIOExtensionStreamClockType)clockType source:(id)source;
+ (CMIOExtensionStream)streamWithLocalizedName:(NSString *)localizedName streamID:(NSUUID *)streamID direction:(CMIOExtensionStreamDirection)direction customClockConfiguration:(CMIOExtensionStreamCustomClockConfiguration *)customClockConfiguration source:(id)source;
+ (id)internalProperties;
+ (id)internalWritableProperties;
- (CMIOExtensionDevice)parent;
- (CMIOExtensionStream)initWithLocalizedName:(NSString *)localizedName streamID:(NSUUID *)streamID direction:(CMIOExtensionStreamDirection)direction clockType:(CMIOExtensionStreamClockType)clockType source:(id)source;
- (CMIOExtensionStream)initWithLocalizedName:(NSString *)localizedName streamID:(NSUUID *)streamID direction:(CMIOExtensionStreamDirection)direction customClockConfiguration:(CMIOExtensionStreamCustomClockConfiguration *)customClockConfiguration source:(id)source;
- (CMIOExtensionStreamClockType)clockType;
- (CMIOExtensionStreamCustomClockConfiguration)customClockConfiguration;
- (CMIOExtensionStreamDirection)direction;
- (NSArray)streamingClients;
- (NSString)localizedName;
- (NSUUID)streamID;
- (id)_clientQueue_internalPropertyStatesForProperties:(id)a3;
- (id)_clientQueue_setAndRemoveInternalPropertyValuesForClient:(id)a3 propertyValues:(id)a4 error:(id *)a5;
- (id)_clientQueue_streamingClientsMap;
- (id)_initWithLocalizedName:(id)a3 streamID:(id)a4 direction:(int64_t)a5 clockType:(int64_t)a6 customClockConfiguration:(id)a7 source:(id)a8;
- (id)description;
- (id)source;
- (void)_clientQueue_addStreamingClient:(id)a3;
- (void)_clientQueue_removeStreamingClient:(id)a3;
- (void)clientQueue_updateMutableStreamPropertiesByPolicy;
- (void)consumeSampleBufferFromClient:(CMIOExtensionClient *)client completionHandler:(void *)completionHandler;
- (void)dealloc;
- (void)enqueueReactionEffect:(id)a3 completionHandler:(id)a4;
- (void)notifyPropertiesChanged:(NSDictionary *)propertyStates;
- (void)notifyScheduledOutputChanged:(CMIOExtensionScheduledOutput *)scheduledOutput;
- (void)sendSampleBuffer:(CMSampleBufferRef)sampleBuffer discontinuity:(CMIOExtensionStreamDiscontinuityFlags)discontinuity hostTimeInNanoseconds:(uint64_t)hostTimeInNanoseconds;
- (void)setParent:(id)a3;
- (void)setStreamingClients:(id)a3;
@end

@implementation CMIOExtensionStream

+ (id)internalProperties
{
  if (internalProperties_onceToken != -1) {
    dispatch_once(&internalProperties_onceToken, &__block_literal_global);
  }
  return (id)internalProperties_gInternalStreamProperties;
}

uint64_t __41__CMIOExtensionStream_internalProperties__block_invoke()
{
  uint64_t result = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", 0x26F89C530, 0x26F89C550, 0x26F89C570, 0x26F89C590, 0x26F89C5B0, 0x26F89C5D0, 0);
  internalProperties_gInternalStreamProperties = result;
  return result;
}

+ (id)internalWritableProperties
{
  return 0;
}

+ (CMIOExtensionStream)streamWithLocalizedName:(NSString *)localizedName streamID:(NSUUID *)streamID direction:(CMIOExtensionStreamDirection)direction clockType:(CMIOExtensionStreamClockType)clockType source:(id)source
{
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLocalizedName:localizedName streamID:streamID direction:direction clockType:clockType source:source];

  return (CMIOExtensionStream *)v7;
}

+ (CMIOExtensionStream)streamWithLocalizedName:(NSString *)localizedName streamID:(NSUUID *)streamID direction:(CMIOExtensionStreamDirection)direction customClockConfiguration:(CMIOExtensionStreamCustomClockConfiguration *)customClockConfiguration source:(id)source
{
  id v12 = objc_alloc((Class)objc_opt_class());

  return (CMIOExtensionStream *)[v12 initWithLocalizedName:localizedName streamID:streamID direction:direction customClockConfiguration:customClockConfiguration source:source];
}

- (CMIOExtensionStream)initWithLocalizedName:(NSString *)localizedName streamID:(NSUUID *)streamID direction:(CMIOExtensionStreamDirection)direction clockType:(CMIOExtensionStreamClockType)clockType source:(id)source
{
  return (CMIOExtensionStream *)[(CMIOExtensionStream *)self _initWithLocalizedName:localizedName streamID:streamID direction:direction clockType:clockType customClockConfiguration:0 source:source];
}

- (CMIOExtensionStream)initWithLocalizedName:(NSString *)localizedName streamID:(NSUUID *)streamID direction:(CMIOExtensionStreamDirection)direction customClockConfiguration:(CMIOExtensionStreamCustomClockConfiguration *)customClockConfiguration source:(id)source
{
  return (CMIOExtensionStream *)[(CMIOExtensionStream *)self _initWithLocalizedName:localizedName streamID:streamID direction:direction clockType:2 customClockConfiguration:customClockConfiguration source:source];
}

- (id)_initWithLocalizedName:(id)a3 streamID:(id)a4 direction:(int64_t)a5 clockType:(int64_t)a6 customClockConfiguration:(id)a7 source:(id)a8
{
  if (a3 && a4 && a8 && (a6 != 2 || a7))
  {
    v24.receiver = self;
    v24.super_class = (Class)CMIOExtensionStream;
    v14 = [(CMIOExtensionStream *)&v24 init];
    if (v14)
    {
      *((void *)v14 + 21) = [a3 copy];
      *((void *)v14 + 22) = [a4 copy];
      *((void *)v14 + 23) = a5;
      *((void *)v14 + 24) = a6;
      *((void *)v14 + 25) = [a7 copy];
      objc_storeWeak((id *)v14 + 19, a8);
      *((_DWORD *)v14 + 2) = 0;
      *((void *)v14 + 2) = objc_opt_new();
      *((void *)v14 + 3) = -1;
      *((void *)v14 + 4) = -1;
      *((void *)v14 + 15) = objc_opt_new();
      *((_DWORD *)v14 + 32) = 0;
      *((void *)v14 + 17) = objc_opt_new();
      *((void *)v14 + 20) = [[NSString alloc] initWithFormat:@"<CMIOExtensionStream: name %@, ID %@>", *((void *)v14 + 21), *((void *)v14 + 22)];
      uint64_t v16 = MEMORY[0x263F01090];
      *(_OWORD *)(v14 + 40) = *MEMORY[0x263F01090];
      *((void *)v14 + 7) = *(void *)(v16 + 16);
      v17 = objc_msgSend(+[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider"), "clientQueue");
      v18 = dispatch_source_create(MEMORY[0x263EF8400], 0, 1uLL, v17);
      *((void *)v14 + 14) = v18;
      dispatch_time_t v19 = dispatch_time(0, 1000000000);
      dispatch_source_set_timer(v18, v19, 0x3B9ACA00uLL, 0);
      objc_initWeak(&location, v14);
      v20 = *((void *)v14 + 14);
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __107__CMIOExtensionStream__initWithLocalizedName_streamID_direction_clockType_customClockConfiguration_source___block_invoke;
      handler[3] = &unk_26517BED8;
      objc_copyWeak(&v22, &location);
      dispatch_source_set_event_handler(v20, handler);
      dispatch_source_set_cancel_handler(*((dispatch_source_t *)v14 + 14), &__block_literal_global_136);
      dispatch_resume(*((dispatch_object_t *)v14 + 14));
      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
  }
  else
  {

    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Invalid argument"];
    return 0;
  }
  return v14;
}

void __107__CMIOExtensionStream__initWithLocalizedName_streamID_direction_clockType_customClockConfiguration_source___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  WeakRetained = (unsigned int *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    v3 = objc_msgSend(WeakRetained, "_clientQueue_streamingClientsMap");
    if ([v3 count])
    {
      id v4 = objc_alloc_init(MEMORY[0x263F089D8]);
      unsigned int v5 = v2[16];
      v23 = v2;
      [v4 appendString:objc_msgSend(NSString, "stringWithFormat:", @"Stats for %@ streaming type %c%c%c%c subtype %c%c%c%c %dx%d ", v2, HIBYTE(v5), BYTE2(v5), BYTE1(v5), v5, HIBYTE(v2[17]), BYTE2(v2[17]), BYTE1(v2[17]), v2[17], v2[26], v2[27])];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      v6 = (void *)[v3 allValues];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v31 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v25;
        char v10 = 1;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v25 != v9) {
              objc_enumerationMutation(v6);
            }
            id v12 = NSString;
            uint64_t v13 = [*(id *)(*((void *)&v24 + 1) + 8 * i) pid];
            if (v10) {
              v14 = @"clients [%d";
            }
            else {
              v14 = @", %d";
            }
            [v4 appendString:objc_msgSend(v12, "stringWithFormat:", v14, v13)];
            char v10 = 0;
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v31 count:16];
          char v10 = 0;
        }
        while (v8);
      }
      [v4 appendString:objc_msgSend(NSString, "stringWithFormat:", @"] "];
      v2 = v23;
      *(_OWORD *)time = *(_OWORD *)(v23 + 18);
      *(void *)&time[16] = *((void *)v23 + 11);
      double Seconds = CMTimeGetSeconds((CMTime *)time);
      unint64_t v16 = *((void *)v23 + 12);
      double v17 = 0.0;
      if (v16 && Seconds > 0.0)
      {
        double v18 = (double)v16;
        *(_OWORD *)time = *(_OWORD *)(v23 + 18);
        *(void *)&time[16] = *((void *)v23 + 11);
        double Seconds = CMTimeGetSeconds((CMTime *)time);
        unint64_t v16 = *((void *)v23 + 12);
        double v17 = v18 / Seconds;
      }
      [v4 appendString:objc_msgSend(NSString, "stringWithFormat:", @"received %lld fps %f ", Seconds, v16, *(void *)&v17)];
      dispatch_time_t v19 = CMIOLog();
      if (v19)
      {
        v20 = v19;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v21 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
          *(_DWORD *)time = 136315907;
          *(void *)&time[4] = v21;
          *(_WORD *)&time[12] = 1024;
          *(_DWORD *)&time[14] = 924;
          *(_WORD *)&time[18] = 2080;
          *(void *)&time[20] = "-[CMIOExtensionStream _initWithLocalizedName:streamID:direction:clockType:customClockCo"
                                 "nfiguration:source:]_block_invoke";
          __int16 v29 = 2113;
          id v30 = v4;
          _os_log_impl(&dword_2432B6000, v20, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", time, 0x26u);
        }
      }
    }
    uint64_t v22 = MEMORY[0x263F010E0];
    *(_OWORD *)(v2 + 18) = *MEMORY[0x263F010E0];
    *((void *)v2 + 11) = *(void *)(v22 + 16);
    *((void *)v2 + 12) = 0;
  }
}

- (void)dealloc
{
  statsTimer = self->_statsTimer;
  if (statsTimer)
  {
    dispatch_source_cancel(statsTimer);
  }
  v4.receiver = self;
  v4.super_class = (Class)CMIOExtensionStream;
  [(CMIOExtensionStream *)&v4 dealloc];
}

- (id)description
{
  v2 = self->_description;

  return v2;
}

- (NSArray)streamingClients
{
  p_streamingClientsLock = &self->_streamingClientsLock;
  os_unfair_lock_lock(&self->_streamingClientsLock);
  objc_super v4 = self->_streamingClients;
  os_unfair_lock_unlock(p_streamingClientsLock);

  return v4;
}

- (void)setStreamingClients:(id)a3
{
  p_streamingClientsLock = &self->_streamingClientsLock;
  os_unfair_lock_lock(&self->_streamingClientsLock);
  streamingClients = self->_streamingClients;
  self->_streamingClients = (NSArray *)a3;
  os_unfair_lock_unlock(p_streamingClientsLock);
  [(CMIOExtensionStream *)self clientQueue_updateMutableStreamPropertiesByPolicy];
}

- (void)clientQueue_updateMutableStreamPropertiesByPolicy
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_4(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s exception %@", v9, v10);
}

- (id)_clientQueue_internalPropertyStatesForProperties:(id)a3
{
  uint64_t v5 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (a3)
  {
    if ([a3 containsObject:0x26F89C530])
    {
      uint64_t v6 = [[CMIOExtensionPropertyState alloc] initWithValue:self->_localizedName attributes:+[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute]];
      [v5 setObject:v6 forKey:0x26F89C530];
    }
    if (([a3 containsObject:0x26F89C550] & 1) == 0)
    {
LABEL_8:
      if (![a3 containsObject:0x26F89C570]) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v7 = [[CMIOExtensionPropertyState alloc] initWithValue:self->_localizedName attributes:+[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute]];
    [v5 setObject:v7 forKey:0x26F89C530];
  }
  uint64_t v8 = [[CMIOExtensionPropertyState alloc] initWithValue:[(NSUUID *)self->_streamID UUIDString] attributes:+[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute]];
  [v5 setObject:v8 forKey:0x26F89C550];

  if (a3) {
    goto LABEL_8;
  }
LABEL_9:
  uint64_t v9 = [CMIOExtensionPropertyState alloc];
  char v10 = -[CMIOExtensionPropertyState initWithValue:attributes:](v9, "initWithValue:attributes:", [NSNumber numberWithInteger:self->_direction], +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute](CMIOExtensionPropertyAttributes, "readOnlyPropertyAttribute"));
  [v5 setObject:v10 forKey:0x26F89C570];

  if (!a3) {
    goto LABEL_11;
  }
LABEL_10:
  if ([a3 containsObject:0x26F89C590])
  {
LABEL_11:
    v11 = [CMIOExtensionPropertyState alloc];
    id v12 = -[CMIOExtensionPropertyState initWithValue:attributes:](v11, "initWithValue:attributes:", [NSNumber numberWithInteger:self->_clockType], +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute](CMIOExtensionPropertyAttributes, "readOnlyPropertyAttribute"));
    [v5 setObject:v12 forKey:0x26F89C590];

    if (!a3) {
      goto LABEL_13;
    }
  }
  if (![a3 containsObject:0x26F89C5B0]) {
    goto LABEL_17;
  }
LABEL_13:
  if (self->_clockType == 2 && self->_customClockConfiguration)
  {
    uint64_t v13 = [[CMIOExtensionPropertyState alloc] initWithValue:self->_customClockConfiguration attributes:+[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute]];
    [v5 setObject:v13 forKey:0x26F89C5B0];
  }
  if (a3)
  {
LABEL_17:
    if (![a3 containsObject:0x26F89C5D0]) {
      goto LABEL_22;
    }
  }
  p_source = &self->_source;
  v15 = -[CMIOExtensionPropertyAttributes initWithMinValue:maxValue:validValues:readOnly:]([CMIOExtensionPropertyAttributes alloc], "initWithMinValue:maxValue:validValues:readOnly:", 0, 0, [objc_loadWeak((id *)&self->_source) formats], 1);
  if (objc_msgSend((id)objc_msgSend(objc_loadWeak((id *)p_source), "formats"), "count")) {
    uint64_t v16 = objc_msgSend((id)objc_msgSend(objc_loadWeak((id *)p_source), "formats"), "objectAtIndexedSubscript:", 0);
  }
  else {
    uint64_t v16 = 0;
  }
  double v17 = [[CMIOExtensionPropertyState alloc] initWithValue:v16 attributes:v15];

  [v5 setObject:v17 forKey:0x26F89C5D0];
LABEL_22:
  if ([v5 count]) {
    return v5;
  }
  else {
    return 0;
  }
}

- (id)_clientQueue_setAndRemoveInternalPropertyValuesForClient:(id)a3 propertyValues:(id)a4 error:(id *)a5
{
  id v5 = a4;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  id v7 = +[CMIOExtensionStream internalWritableProperties];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __101__CMIOExtensionStream__clientQueue_setAndRemoveInternalPropertyValuesForClient_propertyValues_error___block_invoke;
  v10[3] = &unk_26517BF00;
  v10[4] = v7;
  v10[5] = &v11;
  [v5 enumerateKeysAndObjectsUsingBlock:v10];
  if (!*((unsigned char *)v12 + 24))
  {
    id v5 = (id)[v5 mutableCopy];
    uint64_t v8 = objc_opt_new();
    [(CMIOExtensionStream *)self notifyPropertiesChanged:v8];
  }
  _Block_object_dispose(&v11, 8);
  return v5;
}

uint64_t __101__CMIOExtensionStream__clientQueue_setAndRemoveInternalPropertyValuesForClient_propertyValues_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) containsObject:a2];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (void)notifyPropertiesChanged:(NSDictionary *)propertyStates
{
  p_changedPropertiesLock = &self->_changedPropertiesLock;
  os_unfair_lock_lock(&self->_changedPropertiesLock);
  [(NSMutableDictionary *)self->_changedProperties addEntriesFromDictionary:propertyStates];
  os_unfair_lock_unlock(p_changedPropertiesLock);
  uint64_t v6 = objc_msgSend(+[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider"), "clientQueue");
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__CMIOExtensionStream_notifyPropertiesChanged___block_invoke;
  block[3] = &unk_26517BF28;
  block[4] = self;
  dispatch_async(v6, block);
}

void __47__CMIOExtensionStream_notifyPropertiesChanged___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  id v2 = (id)[*(id *)(*(void *)(a1 + 32) + 16) copy];
  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  if ([v2 count]) {
    objc_msgSend(+[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider"), "_clientQueue_notifyStreamPropertiesChangedWithStreamID:propertyStates:", *(void *)(*(void *)(a1 + 32) + 176), v2);
  }
}

- (void)sendSampleBuffer:(CMSampleBufferRef)sampleBuffer discontinuity:(CMIOExtensionStreamDiscontinuityFlags)discontinuity hostTimeInNanoseconds:(uint64_t)hostTimeInNanoseconds
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  uint64_t v54 = hostTimeInNanoseconds;
  if (self->_direction == 1) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"%@ You can't send sample from a sink stream.", self format];
  }
  if (sampleBuffer)
  {
    FormatDescription = CMSampleBufferGetFormatDescription(sampleBuffer);
    char v10 = FormatDescription;
    if (FormatDescription && CMFormatDescriptionGetMediaType(FormatDescription) == 1936684398)
    {
      unint64_t v11 = self->_audioSequenceNumber + 1;
      self->_audioSequenceNumber = v11;
    }
    else
    {
      unint64_t v11 = self->_sequenceNumber + 1;
      self->_sequenceNumber = v11;
    }
    unint64_t valuePtr = v11;
    CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFNumberRef v13 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
    CMSetAttachment(sampleBuffer, kCMIOSampleBufferAttachmentKey_SequenceNumber, v13, 1u);
    CFRelease(v13);
    if (hostTimeInNanoseconds)
    {
      CFNumberRef v14 = CFNumberCreate(v12, kCFNumberSInt64Type, &v54);
      CMSetAttachment(sampleBuffer, kCMIOSampleBufferAttachmentKey_HostTime, v14, 1u);
      CFRelease(v14);
    }
    CMIOExtensionStreamDiscontinuityFlags v52 = discontinuity;
    CFNumberRef v15 = (const __CFNumber *)CMGetAttachment(sampleBuffer, kCMIOSampleBufferAttachmentKey_DiscontinuityFlags, 0);
    if (v15)
    {
      CFNumberRef v16 = v15;
      CFTypeID TypeID = CFNumberGetTypeID();
      if (TypeID == CFGetTypeID(v16))
      {
        *(_DWORD *)time = 0;
        int Value = CFNumberGetValue(v16, kCFNumberSInt32Type, time);
        int v19 = *(_DWORD *)time;
        if (!Value) {
          int v19 = 0;
        }
        CMIOExtensionStreamDiscontinuityFlags v52 = v19 | discontinuity;
      }
    }
    CFNumberRef v20 = CFNumberCreate(v12, kCFNumberSInt32Type, &v52);
    CMSetAttachment(sampleBuffer, kCMIOSampleBufferAttachmentKey_DiscontinuityFlags, v20, 1u);
    CFRelease(v20);
    memset(&v51, 0, sizeof(v51));
    HostTimeClock = CMClockGetHostTimeClock();
    CMClockGetTime(&v51, HostTimeClock);
    *(CMTime *)time = v51;
    CFDictionaryRef v22 = CMTimeCopyAsDictionary((CMTime *)time, v12);
    CMSetAttachment(sampleBuffer, @"com.apple.cmio.buffer_attachment.deliver_time", v22, 1u);
    CFRelease(v22);
    uint64_t v23 = CMIOLogLevel(2);
    if (v10)
    {
      if (v23)
      {
        memset(&v50, 0, sizeof(v50));
        CMSampleBufferGetPresentationTimeStamp(&v50, sampleBuffer);
        memset(&v49, 0, sizeof(v49));
        *(CMTime *)time = v51;
        CMTime rhs = v50;
        CMTimeSubtract(&v49, (CMTime *)time, &rhs);
        if (CMFormatDescriptionGetMediaType(v10) == 1986618469)
        {
          long long v24 = CMIOLogLevel(2);
          if (!v24) {
            goto LABEL_26;
          }
          long long v25 = v24;
          if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_26;
          }
          long long v26 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
          *(CMTime *)time = v50;
          Float64 Seconds = CMTimeGetSeconds((CMTime *)time);
          *(CMTime *)time = v49;
          Float64 v28 = CMTimeGetSeconds((CMTime *)time);
          *(_DWORD *)time = 136316418;
          *(void *)&time[4] = v26;
          *(_WORD *)&time[12] = 1024;
          *(_DWORD *)&time[14] = 1203;
          *(_WORD *)&time[18] = 2080;
          *(void *)&time[20] = "-[CMIOExtensionStream sendSampleBuffer:discontinuity:hostTimeInNanoseconds:]";
          __int16 v56 = 2048;
          Float64 v57 = Seconds;
          __int16 v58 = 2048;
          Float64 v59 = v28;
          __int16 v60 = 2048;
          unint64_t v61 = valuePtr;
          __int16 v29 = "%s:%d:%s video [time %.3f diff %.3f] %lld";
        }
        else
        {
          if (CMFormatDescriptionGetMediaType(v10) != 1936684398) {
            goto LABEL_26;
          }
          id v30 = CMIOLogLevel(2);
          if (!v30) {
            goto LABEL_26;
          }
          long long v25 = v30;
          if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_26;
          }
          v31 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
          *(CMTime *)time = v50;
          Float64 v32 = CMTimeGetSeconds((CMTime *)time);
          *(CMTime *)time = v49;
          Float64 v33 = CMTimeGetSeconds((CMTime *)time);
          *(_DWORD *)time = 136316418;
          *(void *)&time[4] = v31;
          *(_WORD *)&time[12] = 1024;
          *(_DWORD *)&time[14] = 1206;
          *(_WORD *)&time[18] = 2080;
          *(void *)&time[20] = "-[CMIOExtensionStream sendSampleBuffer:discontinuity:hostTimeInNanoseconds:]";
          __int16 v56 = 2048;
          Float64 v57 = v32;
          __int16 v58 = 2048;
          Float64 v59 = v33;
          __int16 v60 = 2048;
          unint64_t v61 = valuePtr;
          __int16 v29 = "%s:%d:%s audio [time %.3f diff %.3f] %lld";
        }
        _os_log_impl(&dword_2432B6000, v25, OS_LOG_TYPE_DEFAULT, v29, time, 0x3Au);
      }
    }
  }
LABEL_26:
  v34 = [[CMIOExtensionSample alloc] initWithCMSampleBuffer:sampleBuffer];
  if (v34)
  {
    v35 = v34;
    memset(time, 0, 24);
    CMSampleBufferGetPresentationTimeStamp((CMTime *)time, sampleBuffer);
    memset(&v51, 0, sizeof(v51));
    CMSampleBufferGetDuration(&v51, sampleBuffer);
    v36 = CMSampleBufferGetFormatDescription(sampleBuffer);
    CMMediaType MediaType = CMFormatDescriptionGetMediaType(v36);
    FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType(v36);
    CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(v36);
    v40 = objc_msgSend(+[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider"), "clientQueue");
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__CMIOExtensionStream_sendSampleBuffer_discontinuity_hostTimeInNanoseconds___block_invoke;
    block[3] = &unk_26517BF50;
    CMTime v42 = v51;
    long long v43 = *(_OWORD *)time;
    uint64_t v44 = *(void *)&time[16];
    CMMediaType v45 = MediaType;
    FourCharCode v46 = MediaSubType;
    CMVideoDimensions v47 = Dimensions;
    block[4] = self;
    void block[5] = v35;
    dispatch_async(v40, block);
  }
}

void __76__CMIOExtensionStream_sendSampleBuffer_discontinuity_hostTimeInNanoseconds___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 60))
  {
    ++*(void *)(*(void *)(a1 + 32) + 96);
    id v7 = *(CMTime **)(a1 + 32);
    CMTime time2 = v7[3];
    CMTime rhs = *(CMTime *)(a1 + 48);
    CMTimeAdd(&time1, &time2, &rhs);
    v7[3] = time1;
    uint64_t v2 = *(void *)(a1 + 32);
    goto LABEL_6;
  }
  uint64_t v2 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v2 + 52) & 1) == 0)
  {
LABEL_6:
    long long v5 = *(_OWORD *)(a1 + 72);
    uint64_t v6 = *(void *)(a1 + 88);
    goto LABEL_7;
  }
  ++*(void *)(v2 + 96);
  CMTime time1 = *(CMTime *)(*(void *)(a1 + 32) + 40);
  CMTime time2 = *(CMTime *)(a1 + 72);
  if (CMTimeCompare(&time1, &time2) < 0)
  {
    memset(&time1, 0, sizeof(time1));
    uint64_t v3 = *(void *)(a1 + 32);
    CMTime time2 = *(CMTime *)(a1 + 72);
    CMTime rhs = *(CMTime *)(v3 + 40);
    CMTimeSubtract(&time1, &time2, &rhs);
    uint64_t v4 = *(CMTime **)(a1 + 32);
    CMTime rhs = v4[3];
    CMTime v8 = time1;
    CMTimeAdd(&time2, &rhs, &v8);
    v4[3] = time2;
    uint64_t v2 = *(void *)(a1 + 32);
    long long v5 = *(_OWORD *)(a1 + 72);
    uint64_t v6 = *(void *)(a1 + 88);
LABEL_7:
    *(void *)(v2 + 56) = v6;
    *(_OWORD *)(v2 + 40) = v5;
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 64) = *(_DWORD *)(a1 + 96);
  *(_DWORD *)(*(void *)(a1 + 32) + 68) = *(_DWORD *)(a1 + 100);
  *(void *)(*(void *)(a1 + 32) + 104) = *(void *)(a1 + 104);
  objc_msgSend(+[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider"), "_clientQueue_sendSampleForStream:sample:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)consumeSampleBufferFromClient:(CMIOExtensionClient *)client completionHandler:(void *)completionHandler
{
  if (self->_direction != 1) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"%@ You can't consume sample if the steam is not sink.", self format];
  }
  id v7 = +[CMIOExtensionProvider sharedProvider];

  [v7 consumeSampleBufferForStream:self client:client reply:completionHandler];
}

- (void)notifyScheduledOutputChanged:(CMIOExtensionScheduledOutput *)scheduledOutput
{
  id v5 = +[CMIOExtensionProvider sharedProvider];

  [v5 notifyScheduledOutputChangedForStream:self scheduledOutput:scheduledOutput];
}

- (void)enqueueReactionEffect:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v5 = CMIOLog();
  if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[CMIOExtensionStream enqueueReactionEffect:completionHandler:]();
  }
  FigCopyBacktrace();
  if (a4) {
    (*((void (**)(id, uint64_t))a4 + 2))(a4, 4294967293);
  }
}

- (id)_clientQueue_streamingClientsMap
{
  return self->_streamingClientsMap;
}

- (void)_clientQueue_addStreamingClient:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  -[NSMutableDictionary setObject:forKey:](self->_streamingClientsMap, "setObject:forKey:", a3, [a3 clientID]);
  id v5 = CMIOLog();
  if (v5)
  {
    uint64_t v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 136316163;
      CMTime v8 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v9 = 1024;
      int v10 = 1288;
      __int16 v11 = 2080;
      CFAllocatorRef v12 = "-[CMIOExtensionStream _clientQueue_addStreamingClient:]";
      __int16 v13 = 2114;
      CFNumberRef v14 = self;
      __int16 v15 = 1025;
      int v16 = [a3 pid];
      _os_log_impl(&dword_2432B6000, v6, OS_LOG_TYPE_INFO, "%s:%d:%s %{public}@, adding streaming client with %{private}d pid", (uint8_t *)&v7, 0x2Cu);
    }
  }
  [(CMIOExtensionStream *)self setStreamingClients:[(NSMutableDictionary *)self->_streamingClientsMap allValues]];
}

- (void)_clientQueue_removeStreamingClient:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  -[NSMutableDictionary removeObjectForKey:](self->_streamingClientsMap, "removeObjectForKey:", [a3 clientID]);
  id v5 = CMIOLog();
  if (v5)
  {
    uint64_t v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v9 = 136316163;
      int v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v11 = 1024;
      int v12 = 1297;
      __int16 v13 = 2080;
      CFNumberRef v14 = "-[CMIOExtensionStream _clientQueue_removeStreamingClient:]";
      __int16 v15 = 2114;
      int v16 = self;
      __int16 v17 = 1025;
      int v18 = [a3 pid];
      _os_log_impl(&dword_2432B6000, v6, OS_LOG_TYPE_INFO, "%s:%d:%s %{public}@, removing streaming client with %{private}d pid", (uint8_t *)&v9, 0x2Cu);
    }
  }
  if (![(NSMutableDictionary *)self->_streamingClientsMap count])
  {
    uint64_t v7 = MEMORY[0x263F01090];
    *(_OWORD *)&self->_statsLastSampleTime.value = *MEMORY[0x263F01090];
    self->_statsLastSampleTime.epoch = *(void *)(v7 + 16);
    *(void *)&self->_statsCMMediaType MediaType = 0;
    uint64_t v8 = MEMORY[0x263F010E0];
    self->_statsCMVideoDimensions Dimensions = 0;
    *(_OWORD *)&self->_statsTotalDuration.value = *(_OWORD *)v8;
    self->_statsTotalDuration.epoch = *(void *)(v8 + 16);
    self->_statsTotalSampleCount = 0;
  }
  [(CMIOExtensionStream *)self setStreamingClients:[(NSMutableDictionary *)self->_streamingClientsMap allValues]];
}

- (NSString)localizedName
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (NSUUID)streamID
{
  return (NSUUID *)objc_getProperty(self, a2, 176, 1);
}

- (CMIOExtensionStreamDirection)direction
{
  return self->_direction;
}

- (CMIOExtensionStreamClockType)clockType
{
  return self->_clockType;
}

- (CMIOExtensionStreamCustomClockConfiguration)customClockConfiguration
{
  return (CMIOExtensionStreamCustomClockConfiguration *)objc_getProperty(self, a2, 200, 1);
}

- (id)source
{
  return objc_loadWeak((id *)&self->_source);
}

- (CMIOExtensionDevice)parent
{
  return (CMIOExtensionDevice *)objc_loadWeak((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_source);

  objc_destroyWeak((id *)&self->_parent);
}

- (void)enqueueReactionEffect:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s %{public}@ Called base class stub of enqueueReactionEffect, this should not happen", v2, v3, v4, v5, v6);
}

@end