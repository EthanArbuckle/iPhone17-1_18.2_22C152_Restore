@interface AUAudioUnit
+ (BOOL)_deleteUserPreset:(id)a3 error:(id *)a4;
+ (BOOL)_saveUserPreset:(id)a3 state:(id)a4 error:(id *)a5;
+ (id)__presetFromPath:(id)a3;
+ (id)__sanitizeFileName:(id)a3;
+ (id)__userPresetPath:(id)a3 error:(id *)a4;
+ (id)_monitorUserPresets:(id)a3 callback:(id)a4;
+ (id)_presetStateFor:(id)a3 error:(id *)a4;
+ (id)auAudioUnitForAudioUnit:(OpaqueAudioComponentInstance *)a3;
+ (id)keyPathsForValuesAffectingAllParameterValues;
+ (void)__sanitizePresetNumber:(id)a3;
+ (void)_loadUserPresets:(id)a3 error:(id *)a4;
+ (void)instantiateWithComponentDescription:(AudioComponentDescription *)a3 options:(unsigned int)a4 connectionProvider:(function<NSXPCConnection *(NSUUID *) completionHandler:;
+ (void)instantiateWithComponentDescription:(AudioComponentDescription *)componentDescription options:(AudioComponentInstantiationOptions)options completionHandler:(void *)completionHandler;
+ (void)registerSubclass:(Class)cls asComponentDescription:(AudioComponentDescription *)componentDescription name:(NSString *)name version:(UInt32)version;
- ($115C4C562B26FF47E01F9F4EA65B5887)remoteProcessAuditToken;
- (AUAudioFrameCount)maximumFramesToRender;
- (AUAudioUnit)init;
- (AUAudioUnit)initWithComponentDescription:(AudioComponentDescription *)componentDescription error:(NSError *)outError;
- (AUAudioUnit)initWithComponentDescription:(AudioComponentDescription *)componentDescription options:(AudioComponentInstantiationOptions)options error:(NSError *)outError;
- (AUAudioUnitBusArray)inputBusses;
- (AUAudioUnitBusArray)outputBusses;
- (AUAudioUnitPreset)currentPreset;
- (AUHostMusicalContextBlock)musicalContextBlock;
- (AUHostTransportStateBlock)transportStateBlock;
- (AUInternalRenderBlock)internalRenderBlock;
- (AUMIDICIProfileChangedBlock)profileChangedBlock;
- (AUMIDIEventListBlock)MIDIOutputEventListBlock;
- (AUMIDIEventListBlock)scheduleMIDIEventListBlock;
- (AUMIDIOutputEventBlock)MIDIOutputEventBlock;
- (AUParameterTree)parameterTree;
- (AURenderBlock)renderBlock;
- (AURenderContextObserver)renderContextObserver;
- (AUScheduleMIDIEventBlock)scheduleMIDIEventBlock;
- (AUScheduleParameterBlock)scheduleParameterBlock;
- (AUv3HostIdentifier)hostIdentifier;
- (AudioComponent)component;
- (AudioComponentDescription)componentDescription;
- (BOOL)allParameterValues;
- (BOOL)allocateRenderResourcesAndReturnError:(NSError *)outError;
- (BOOL)canProcessInPlace;
- (BOOL)deleteUserPreset:(AUAudioUnitPreset *)userPreset error:(NSError *)outError;
- (BOOL)disableProfile:(MIDICIProfile *)profile cable:(uint8_t)cable onChannel:(MIDIChannelNumber)channel error:(NSError *)outError;
- (BOOL)enableProfile:(MIDICIProfile *)profile cable:(uint8_t)cable onChannel:(MIDIChannelNumber)channel error:(NSError *)outError;
- (BOOL)isLoadedInProcess;
- (BOOL)isLocalCachingDisabled;
- (BOOL)isMusicDeviceOrEffect;
- (BOOL)isRenderingOffline;
- (BOOL)isSpeechSynthesisProvider;
- (BOOL)providesUserInterface;
- (BOOL)renderResourcesAllocated;
- (BOOL)requestViewControllerSynchronously;
- (BOOL)saveUserPreset:(AUAudioUnitPreset *)userPreset error:(NSError *)outError;
- (BOOL)shouldBypassEffect;
- (BOOL)shouldChangeToFormat:(AVAudioFormat *)format forBus:(AUAudioUnitBus *)bus;
- (BOOL)supportsMPE;
- (BOOL)supportsUserPresets;
- (MIDICIProfileState)profileStateForCable:(uint8_t)cable channel:(MIDIChannelNumber)channel;
- (MIDIProtocolID)AudioUnitMIDIProtocol;
- (MIDIProtocolID)hostMIDIProtocol;
- (NSArray)MIDIOutputNames;
- (NSArray)channelCapabilities;
- (NSArray)channelMap;
- (NSArray)factoryPresets;
- (NSArray)migrateFromPlugin;
- (NSArray)parametersForOverviewWithCount:(NSInteger)count;
- (NSArray)userPresets;
- (NSDictionary)fullState;
- (NSDictionary)presetStateFor:(AUAudioUnitPreset *)userPreset error:(NSError *)outError;
- (NSIndexSet)supportedViewConfigurations:(NSArray *)availableViewConfigurations;
- (NSInteger)MIDIOutputBufferSizeHint;
- (NSInteger)renderQuality;
- (NSInteger)tokenByAddingRenderObserver:(AURenderObserver)observer;
- (NSInteger)virtualMIDICableCount;
- (NSString)audioUnitName;
- (NSString)audioUnitShortName;
- (NSString)componentName;
- (NSString)contextName;
- (NSString)manufacturerName;
- (NSTimeInterval)latency;
- (NSTimeInterval)tailTime;
- (NSURL)iconURL;
- (OpaqueAudioComponentInstance)audioUnit;
- (float)getV2Parameter:(unint64_t)a3 sequenceNumber:(unsigned int)a4;
- (id).cxx_construct;
- (id)_valueForProperty:(id)a3 error:(id *)a4;
- (id)cachedViewController;
- (id)messageChannelFor:(NSString *)channelName;
- (id)valueForUndefinedKey:(id)a3;
- (int)remoteProcessIdentifier;
- (os_workgroup_t)osWorkgroup;
- (uint32_t)componentVersion;
- (void)addRenderObserver:(void *)a3 userData:(void *)a4;
- (void)auv2GetParameterSynchronizer;
- (void)dealloc;
- (void)deallocateRenderResources;
- (void)deliverV2Parameters:(const AURenderEvent *)next;
- (void)eventSchedule;
- (void)flushEventSchedule;
- (void)internalDeallocateRenderResources;
- (void)invalidateAudioUnit;
- (void)removeRenderObserver:(NSInteger)token;
- (void)removeRenderObserver:(void *)a3 userData:(void *)a4;
- (void)requestViewControllerWithCompletionHandler:(void *)completionHandler;
- (void)resolveComponent;
- (void)scheduledParameterRefresher;
- (void)setCachedViewController:(id)a3;
- (void)setChannelMap:(NSArray *)channelMap;
- (void)setContextName:(NSString *)contextName;
- (void)setCurrentPreset:(AUAudioUnitPreset *)currentPreset;
- (void)setFullState:(NSDictionary *)fullState;
- (void)setHostIdentifier:(id)a3;
- (void)setHostMIDIProtocol:(MIDIProtocolID)hostMIDIProtocol;
- (void)setLoadedOutOfProcess;
- (void)setLocalCachingDisabled:(BOOL)a3;
- (void)setMIDIOutputBufferSizeHint:(NSInteger)MIDIOutputBufferSizeHint;
- (void)setMIDIOutputEventBlock:(AUMIDIOutputEventBlock)MIDIOutputEventBlock;
- (void)setMIDIOutputEventListBlock:(AUMIDIEventListBlock)MIDIOutputEventListBlock;
- (void)setMaximumFramesToRender:(AUAudioFrameCount)maximumFramesToRender;
- (void)setMusicalContextBlock:(AUHostMusicalContextBlock)musicalContextBlock;
- (void)setParameterTree:(AUParameterTree *)parameterTree;
- (void)setProfileChangedBlock:(AUMIDICIProfileChangedBlock)profileChangedBlock;
- (void)setRenderQuality:(NSInteger)renderQuality;
- (void)setRenderResourcesAllocated:(BOOL)flag;
- (void)setRenderingOffline:(BOOL)renderingOffline;
- (void)setRequestViewControllerSynchronously:(BOOL)a3;
- (void)setShouldBypassEffect:(BOOL)shouldBypassEffect;
- (void)setTransportStateBlock:(AUHostTransportStateBlock)transportStateBlock;
- (void)setV2Parameter:(unint64_t)a3 value:(float)a4 bufferOffset:(unsigned int)a5 sequenceNumber:(unsigned int)a6;
- (void)setupMIDIConversion;
- (void)startUserPresetFolderMonitoring;
@end

@implementation AUAudioUnit

+ (id)_monitorUserPresets:(id)a3 callback:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v5 = a3;
  id v6 = a4;
  if (!v5) {
    __assert_rtn("+[AUAudioUnit(PresetHandling) _monitorUserPresets:callback:]", "AUAudioUnitPresetHandling.mm", 177, "presetMonitoringQueue");
  }
  id v7 = +[AUAudioUnit __userPresetPath:0 error:0];
  int v8 = open((const char *)[v7 fileSystemRepresentation], 0x8000);
  unsigned int v9 = v8;
  if ((v8 & 0x80000000) == 0)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__AUAudioUnit_PresetHandling___monitorUserPresets_callback___block_invoke;
    aBlock[3] = &__block_descriptor_36_e5_v8__0l;
    int v17 = v8;
    v10 = _Block_copy(aBlock);
    v11 = dispatch_source_create(MEMORY[0x1E4F144A8], v9, 2uLL, v5);
    if (v11)
    {
LABEL_19:
      dispatch_source_set_event_handler(v11, v6);
      dispatch_source_set_cancel_handler(v11, v10);
      dispatch_resume(v11);
      goto LABEL_20;
    }
    if (kAUExtensionScope)
    {
      v12 = *(id *)kAUExtensionScope;
      if (!v12)
      {
LABEL_18:
        ((void (*))v10[2].isa)(v10);
        goto LABEL_19;
      }
    }
    else
    {
      v12 = MEMORY[0x1E4F14500];
      id v14 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v19 = "AUAudioUnitPresetHandling.mm";
      __int16 v20 = 1024;
      int v21 = 191;
      __int16 v22 = 2112;
      id v23 = v7;
      _os_log_impl(&dword_18FEC0000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: Could not create dispatch source to monitor folder: %@", buf, 0x1Cu);
    }

    goto LABEL_18;
  }
  if (kAUExtensionScope)
  {
    v10 = *(id *)kAUExtensionScope;
    if (!v10)
    {
      v11 = 0;
      goto LABEL_21;
    }
  }
  else
  {
    v10 = MEMORY[0x1E4F14500];
    id v13 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "AUAudioUnitPresetHandling.mm";
    __int16 v20 = 1024;
    int v21 = 181;
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl(&dword_18FEC0000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: Could not open preset folder: %@", buf, 0x1Cu);
  }
  v11 = 0;
LABEL_20:

LABEL_21:
  return v11;
}

uint64_t __60__AUAudioUnit_PresetHandling___monitorUserPresets_callback___block_invoke(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

+ (void)_loadUserPresets:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (a4)
  {
    id v6 = +[AUAudioUnit __userPresetPath:0 error:a4];
    id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v8 = [v7 contentsOfDirectoryAtPath:v6 error:a4];

    if (!*a4)
    {
      unsigned int v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF ENDSWITH '.aupreset'"];
      v10 = [v8 filteredArrayUsingPredicate:v9];

      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __54__AUAudioUnit_PresetHandling___loadUserPresets_error___block_invoke;
      v15[3] = &unk_1E56803E0;
      id v11 = v6;
      id v16 = v11;
      int v8 = [v10 sortedArrayUsingComparator:v15];

      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __54__AUAudioUnit_PresetHandling___loadUserPresets_error___block_invoke_2;
      v12[3] = &unk_1E5680408;
      id v13 = v11;
      id v14 = v5;
      [v8 enumerateObjectsUsingBlock:v12];
    }
  }
}

uint64_t __54__AUAudioUnit_PresetHandling___loadUserPresets_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v8 = [*(id *)(a1 + 32) stringByAppendingPathComponent:v5];
  id v22 = 0;
  unsigned int v9 = [v7 attributesOfItemAtPath:v8 error:&v22];
  id v10 = v22;

  id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  v12 = [*(id *)(a1 + 32) stringByAppendingPathComponent:v6];
  id v21 = v10;
  id v13 = [v11 attributesOfItemAtPath:v12 error:&v21];
  id v14 = v21;

  if (v14)
  {
    uint64_t v15 = -1;
  }
  else
  {
    uint64_t v16 = *MEMORY[0x1E4F282C0];
    int v17 = [v9 objectForKey:*MEMORY[0x1E4F282C0]];
    v18 = [v13 objectForKey:v16];
    uint64_t v19 = [v17 compare:v18];

    if (v19 == 1) {
      uint64_t v15 = -1;
    }
    else {
      uint64_t v15 = 1;
    }
  }

  return v15;
}

void __54__AUAudioUnit_PresetHandling___loadUserPresets_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) stringByAppendingPathComponent:a2];
  id v4 = +[AUAudioUnit __presetFromPath:v3];

  if (v4) {
    [*(id *)(a1 + 40) addObject:v4];
  }
}

+ (id)_presetStateFor:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (a4)
  {
    id v6 = +[AUAudioUnit __userPresetPath:v5 error:a4];
    id v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    id v13 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(), 0);
    id v14 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v6 options:0 error:a4];
    if (*a4)
    {
      a4 = 0;
    }
    else
    {
      a4 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v13 fromData:v14 error:a4];
    }
  }
  return a4;
}

+ (BOOL)_deleteUserPreset:(id)a3 error:(id *)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a4)
  {
    id v6 = +[AUAudioUnit __userPresetPath:v5 error:a4];
    if (v6)
    {
      id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
      LOBYTE(a4) = [v7 removeItemAtPath:v6 error:a4];
    }
    else
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = *MEMORY[0x1E4F28568];
      v12[0] = @"Illegal file name for user preset!";
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
      *a4 = [v8 errorWithDomain:*MEMORY[0x1E4F28760] code:-66742 userInfo:v9];

      LOBYTE(a4) = 0;
    }
  }
  return (char)a4;
}

+ (BOOL)_saveUserPreset:(id)a3 state:(id)a4 error:(id *)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (a5)
  {
    uint64_t v10 = (void *)[v8 mutableCopy];
    uint64_t v11 = [v10 allKeys];
    uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EDFB2DE8];
    id v13 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];
    char v14 = [v12 isSubsetOfSet:v13];

    if (v14)
    {
      uint64_t v15 = +[AUAudioUnit __userPresetPath:v7 error:a5];
      if (v15)
      {
        uint64_t v16 = [v7 name];
        [v10 setObject:v16 forKeyedSubscript:@"name"];

        int v17 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLong:", objc_msgSend(v7, "number"));
        [v10 setObject:v17 forKeyedSubscript:@"preset-number"];

        v18 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:a5];
        [v18 writeToFile:v15 options:1 error:a5];

        BOOL v19 = *a5 == 0;
      }
      else
      {
        id v21 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v24 = *MEMORY[0x1E4F28568];
        v25 = @"Illegal file name for user preset!";
        id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
        *a5 = [v21 errorWithDomain:*MEMORY[0x1E4F28760] code:-66742 userInfo:v22];

        uint64_t v15 = 0;
        BOOL v19 = 0;
      }
    }
    else
    {
      __int16 v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v26 = *MEMORY[0x1E4F28568];
      v27[0] = @"Missing key in preset state map!";
      uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
      [v20 errorWithDomain:*MEMORY[0x1E4F28760] code:-66741 userInfo:v15];
      BOOL v19 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

+ (id)__userPresetPath:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
  id v7 = [v6 objectAtIndex:0];
  id v8 = [v7 stringByAppendingPathComponent:@"/AUPresets"];
  uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v10 = [v9 fileExistsAtPath:v8];

  if ((v10 & 1) != 0
    || (([MEMORY[0x1E4F28CB8] defaultManager],
         uint64_t v11 = objc_claimAutoreleasedReturnValue(),
         v12 = [v11 createDirectoryAtPath:v8 withIntermediateDirectories:0 attributes:0 error:a4], v11, !a4)? (char v13 = v12): (char v13 = 0), (v13 & 1) != 0))
  {
    if (v5)
    {
      char v14 = [v5 name];
      uint64_t v15 = +[AUAudioUnit __sanitizeFileName:v14];

      if (v15 && [v15 length])
      {
        +[AUAudioUnit __sanitizePresetNumber:v5];
        uint64_t v16 = NSString;
        if ([v5 number] < 0) {
          uint64_t v17 = -[v5 number];
        }
        else {
          uint64_t v17 = [v5 number];
        }
        id v18 = [v16 stringWithFormat:@"%@/%@_%ld.aupreset", v8, v15, v17];
      }
      else
      {
        id v18 = 0;
      }
    }
    else
    {
      id v18 = v8;
    }
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

+ (void)__sanitizePresetNumber:(id)a3
{
  id v4 = a3;
  if ([v4 number])
  {
    if ([v4 number] < 1) {
      goto LABEL_6;
    }
    uint64_t v3 = -[v4 number];
  }
  else
  {
    uint64_t v3 = -1;
  }
  [v4 setNumber:v3];
LABEL_6:
}

+ (id)__sanitizeFileName:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 length] <= 0x50)
  {
    id v5 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
    id v6 = (void *)[v5 mutableCopy];

    id v7 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"/\\""];
    [v6 formUnionWithCharacterSet:v7];

    id v8 = [MEMORY[0x1E4F28B88] illegalCharacterSet];
    [v6 formUnionWithCharacterSet:v8];

    uint64_t v9 = [MEMORY[0x1E4F28B88] controlCharacterSet];
    [v6 formUnionWithCharacterSet:v9];

    if ([v3 rangeOfCharacterFromSet:v6] == 0x7FFFFFFFFFFFFFFFLL)
    {
      char v10 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      [v6 formUnionWithCharacterSet:v10];

      uint64_t v11 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"|$()<>{}.#'\""];
      [v6 formUnionWithCharacterSet:v11];

      char v12 = [v6 invertedSet];
      id v4 = [v3 stringByAddingPercentEncodingWithAllowedCharacters:v12];
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)__presetFromPath:(id)a3
{
  id v3 = a3;
  id v4 = [v3 pathExtension];
  if (([v4 isEqualToString:@"aupreset"] & 1) == 0) {
    __assert_rtn("+[AUAudioUnit(PresetHandling) __presetFromPath:]", "AUAudioUnitPresetHandling.mm", 14, "[[pathString pathExtension] isEqualToString:@\"aupreset\"]");
  }

  id v5 = [v3 lastPathComponent];
  id v6 = [v5 stringByDeletingPathExtension];

  id v7 = [v6 componentsSeparatedByString:@"_"];
  id v8 = (void *)[v7 mutableCopy];

  if ((unint64_t)[v8 count] <= 1) {
    __assert_rtn("+[AUAudioUnit(PresetHandling) __presetFromPath:]", "AUAudioUnitPresetHandling.mm", 18, "chunks.count > 1");
  }
  uint64_t v9 = [v8 lastObject];
  objc_msgSend(v8, "removeObjectAtIndex:", objc_msgSend(v8, "count") - 1);
  char v10 = [v8 componentsJoinedByString:@"_"];
  uint64_t v11 = [v10 stringByRemovingPercentEncoding];

  char v12 = objc_opt_new();
  [v12 setName:v11];
  objc_msgSend(v12, "setNumber:", (int)-objc_msgSend(v9, "intValue"));

  return v12;
}

float __32__AUAudioUnit_XPC_parameterTree__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},float>::sync_message((uint64_t)&v10, WeakRetained);

  id v5 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},float>::sync_proxy(&v10);
  uint64_t v6 = [v3 address];
  id v7 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},float>::reply((uint64_t)&v10);
  [v5 getParameter:v6 sequenceNumber:0 reply:v7];

  float v8 = v12;
  std::__function::__value_func<void ()(NSError *,std::tuple<float> &&)>::~__value_func[abi:ne180100](v11);

  return v8;
}

id __32__AUAudioUnit_XPC_parameterTree__block_invoke_2(uint64_t a1, void *a2, int *a3)
{
  v15[6] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSString * {__strong}>::sync_message(&v14, WeakRetained);

  id v7 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSString * {__strong}>::sync_proxy(&v14);
  if (a3) {
    int v8 = *a3;
  }
  else {
    int v8 = 0;
  }
  uint64_t v9 = [v5 address];
  char v10 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSString * {__strong}>::reply((uint64_t)&v14);
  LODWORD(v11) = v8;
  [v7 parameterStringFromValue:a3 == 0 currentValue:v9 address:v10 reply:v11];

  id v12 = (id)v15[5];
  std::__function::__value_func<void ()(NSError *,std::tuple<NSString * {__strong}> &&)>::~__value_func[abi:ne180100](v15);

  return v12;
}

float __32__AUAudioUnit_XPC_parameterTree__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},float>::sync_message((uint64_t)&v13, WeakRetained);

  int v8 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},float>::sync_proxy(&v13);
  uint64_t v9 = [v5 address];
  char v10 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},float>::reply((uint64_t)&v13);
  [v8 parameterValueFromString:v6 address:v9 reply:v10];

  float v11 = v15;
  std::__function::__value_func<void ()(NSError *,std::tuple<float> &&)>::~__value_func[abi:ne180100](v14);

  return v11;
}

id __32__AUAudioUnit_XPC_parameterTree__block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  v13[6] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSString * {__strong}>::sync_message(&v12, WeakRetained);

  id v7 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSString * {__strong}>::sync_proxy(&v12);
  int v8 = [v5 keyPath];
  uint64_t v9 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSString * {__strong}>::reply((uint64_t)&v12);
  [v7 parameterNode:v8 displayNameWithLength:a3 reply:v9];

  id v10 = (id)v13[5];
  std::__function::__value_func<void ()(NSError *,std::tuple<NSString * {__strong}> &&)>::~__value_func[abi:ne180100](v13);

  return v10;
}

uint64_t __38__AUAudioUnit_XPC_internalRenderBlock__block_invoke(uint64_t a1, int *a2, const AudioTimeStamp *a3, uint64_t a4, unsigned int a5, unsigned int *a6, AURenderEventAllocator *a7, uint64_t a8)
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v8 + 72))
  {
    int v14 = *(unsigned __int8 *)(a1 + 40);
    unint64_t v132 = (unint64_t)audioipc::current_render_context((audioipc *)a1);
    float v15 = *(auoop::PipeSubPool **)v8;
    uint64_t v16 = auoop::PipeSubPool::acquirePipeSlot(*(auoop::PipeSubPool **)v8, &v132, 1);
    uint64_t v17 = *(void *)(v16 + 8);
    if (!*(unsigned char *)v17)
    {
      uint64_t v23 = 4294956429;
      goto LABEL_18;
    }
    unint64_t v18 = v132;
    unsigned __int8 v19 = atomic_load((unsigned __int8 *)(v17 + 2));
    if (v19)
    {
      unint64_t v24 = *a6;
      uint64_t v23 = 4294900547;
      if (v24)
      {
        unint64_t v25 = 0;
        uint64_t v26 = (void **)(a6 + 4);
        do
        {
          if (*v26)
          {
            bzero(*v26, *((unsigned int *)v26 - 1));
            unint64_t v24 = *a6;
          }
          ++v25;
          v26 += 2;
        }
        while (v25 < v24);
      }
      goto LABEL_18;
    }
    if (*(_DWORD *)(v17 + 220) <= a5)
    {
      uint64_t v23 = 4294956419;
      goto LABEL_18;
    }
    uint64_t v20 = *(void *)(v17 + 80);
    int v21 = *(_DWORD *)(v8 + 56);
    *(_DWORD *)(v20 + 4108) = v21;
    uint64_t v129 = v20;
    *(void *)(v20 + 4112) = v18;
    int v22 = *a2;
    if ((*a2 & 0x8000) != 0)
    {
      double v27 = AUOOPRenderingClient::computeTimeoutSeconds((AUOOPRenderingClient *)v17, (const AUOOPRenderClientUser *)*(unsigned __int8 *)(v8 + 60), a3, a4);
      *(_DWORD *)(v129 + 4168 + 4 * *(unsigned int *)(v17 + 216) + 148) = *a2;
      long long v28 = *(_OWORD *)&a3->mSampleTime;
      long long v29 = *(_OWORD *)&a3->mRateScalar;
      long long v30 = *(_OWORD *)&a3->mSMPTETime.mHours;
      *(_OWORD *)(v129 + 4200) = *(_OWORD *)&a3->mSMPTETime.mSubframes;
      *(_OWORD *)(v129 + 4216) = v30;
      *(_OWORD *)(v129 + 4168) = v28;
      *(_OWORD *)(v129 + 4184) = v29;
      *(_DWORD *)(v129 + 4312) = a4;
      AUOOPRenderingClient::copyEventsToSharedMemory(v17, a7, v27, 1);
      uint64_t v23 = 0;
      goto LABEL_18;
    }
    if (*(_DWORD *)(v17 + 224) < a4)
    {
      uint64_t v23 = 4294956422;
LABEL_18:
      atomic_store(0, (unsigned __int8 *)v16);
      caulk::semaphore::signal((auoop::PipeSubPool *)((char *)v15 + 100));
      return v23;
    }
    if (a3->mSampleTime == *(double *)(v17 + 232) && v21 == *(_DWORD *)(v17 + 240)) {
      goto LABEL_37;
    }
    *(void *)(v17 + 208) = a8;
    if (v14)
    {
      v32 = (caulk::pooled_semaphore_mutex *)(v17 + 164);
      caulk::pooled_semaphore_mutex::_lock((caulk::pooled_semaphore_mutex *)(v17 + 164));
      *(Float64 *)(v17 + 232) = a3->mSampleTime;
      *(_DWORD *)(v17 + 240) = *(_DWORD *)(v8 + 56);
      if (*(_DWORD *)(v17 + 216))
      {
        unsigned int v33 = 0;
        char v34 = 0;
        do
        {
          v34 |= AUOOPRenderingClient::pullOneInput((AUOOPRenderingClient *)v17, v33++, a3, a4) == 0;
          unsigned int v35 = *(_DWORD *)(v17 + 216);
        }
        while (v33 < v35);
        char v36 = (v35 == 0) | v34;
        v32 = (caulk::pooled_semaphore_mutex *)(v17 + 164);
        if ((v36 & 1) == 0 && !*(unsigned char *)(v8 + 61))
        {
          caulk::pooled_semaphore_mutex::_unlock((caulk::pooled_semaphore_mutex *)(v17 + 164));
          uint64_t v23 = 4294956420;
          goto LABEL_18;
        }
      }
      caulk::pooled_semaphore_mutex::_unlock(v32);
      unsigned int v37 = a5;
      int v22 = *a2;
      int v120 = -1;
    }
    else
    {
      unsigned int v37 = a5;
      int v120 = a5;
    }
    *(_DWORD *)(v129 + 4 * (*(_DWORD *)(v17 + 216) + v37) + 4316) = v22;
    caulk::pooled_semaphore_mutex::_lock((caulk::pooled_semaphore_mutex *)(v17 + 160));
    if (!*(unsigned char *)v17)
    {
      LODWORD(v39) = 0;
      uint64_t v23 = 4294956421;
      goto LABEL_35;
    }
    uint64_t v23 = 4294900551;
    uint64_t v38 = *(void *)(v17 + 80);
    if (*(unsigned char *)(v38 + 4304))
    {
      LODWORD(v39) = 0;
      uint64_t v23 = 4294900549;
      goto LABEL_35;
    }
    *(_DWORD *)(v38 + 4248) = 0;
    uint64_t v55 = *(void *)(v8 + 24);
    if (v55)
    {
      uint64_t v135 = 0;
      v136.float mSampleTime = 4.0;
      uint64_t v134 = 0;
      if (!(*(unsigned int (**)(uint64_t, uint64_t, AudioTimeStamp *, uint64_t *, uint64_t, uint64_t *, uint64_t))(v55 + 16))(v55, v38 + 4240, &v136, &v135, v38 + 4232, &v134, v38 + 4264))goto LABEL_101; {
      float mSampleTime = v136.mSampleTime;
      }
      *(float *)(v38 + 4256) = mSampleTime;
      *(_DWORD *)(v38 + 4260) = v135;
      *(_DWORD *)(v38 + 4252) = v134;
      int v57 = *(_DWORD *)(v38 + 4248) | 0x300;
    }
    else
    {
      v87 = *(unsigned int (**)(void, uint64_t, uint64_t))(v17 + 176);
      if (v87 && !v87(*(void *)(v17 + 168), v38 + 4232, v38 + 4240)) {
        *(_DWORD *)(v38 + 4248) |= 0x100u;
      }
      v88 = *(unsigned int (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 184);
      if (!v88 || v88(*(void *)(v17 + 168), v38 + 4252, v38 + 4256, v38 + 4260, v38 + 4264))
      {
LABEL_101:
        uint64_t v89 = *(void *)(v8 + 32);
        if (v89)
        {
          v136.float mSampleTime = 0.0;
          if (!(*(unsigned int (**)(uint64_t, AudioTimeStamp *, uint64_t, uint64_t, uint64_t))(v89 + 16))(v89, &v136, v38 + 4272, v38 + 4280, v38 + 4288))goto LABEL_120; {
          int v90 = *(_DWORD *)(v38 + 4248) | LOBYTE(v136.mSampleTime) & 0xF | 0x400;
          }
          goto LABEL_119;
        }
        LOBYTE(v136.mSampleTime) = 0;
        LOBYTE(v135) = 0;
        LOBYTE(v134) = 0;
        char v133 = 0;
        v91 = *(unsigned int (**)(void, AudioTimeStamp *, uint64_t *, uint64_t *, uint64_t, char *, uint64_t, uint64_t))(v17 + 200);
        if (v91 && !v91(*(void *)(v17 + 168), &v136, &v135, &v134, v38 + 4272, &v133, v38 + 4280, v38 + 4288))
        {
          int v95 = *(_DWORD *)(v38 + 4248);
          int v94 = v95 | 0x400;
          *(_DWORD *)(v38 + 4248) = v95 | 0x400;
          if (LOBYTE(v136.mSampleTime))
          {
            int v94 = v95 | 0x402;
            *(_DWORD *)(v38 + 4248) = v95 | 0x402;
          }
          if ((_BYTE)v135)
          {
            v94 |= 4u;
            goto LABEL_114;
          }
        }
        else
        {
          v92 = *(unsigned int (**)(void, AudioTimeStamp *, uint64_t *, uint64_t, char *, uint64_t, uint64_t))(v17 + 192);
          if (!v92 || v92(*(void *)(v17 + 168), &v136, &v134, v38 + 4272, &v133, v38 + 4280, v38 + 4288)) {
            goto LABEL_120;
          }
          int v93 = *(_DWORD *)(v38 + 4248);
          int v94 = v93 | 0x400;
          *(_DWORD *)(v38 + 4248) = v93 | 0x400;
          if (LOBYTE(v136.mSampleTime))
          {
            int v94 = v93 | 0x402;
LABEL_114:
            *(_DWORD *)(v38 + 4248) = v94;
          }
        }
        if ((_BYTE)v134)
        {
          v94 |= 1u;
          *(_DWORD *)(v38 + 4248) = v94;
        }
        if (v133)
        {
          int v90 = v94 | 8;
LABEL_119:
          *(_DWORD *)(v38 + 4248) = v90;
        }
LABEL_120:
        *(void *)(v38 + 4296) = mach_absolute_time();
        long long v96 = *(_OWORD *)&a3->mSampleTime;
        long long v97 = *(_OWORD *)&a3->mRateScalar;
        long long v98 = *(_OWORD *)&a3->mSMPTETime.mHours;
        *(_OWORD *)(v38 + 4200) = *(_OWORD *)&a3->mSMPTETime.mSubframes;
        *(_OWORD *)(v38 + 4216) = v98;
        *(_OWORD *)(v38 + 4168) = v96;
        *(_OWORD *)(v38 + 4184) = v97;
        *(_DWORD *)(v38 + 4312) = a4;
        double v99 = AUOOPRenderingClient::computeTimeoutSeconds((AUOOPRenderingClient *)v17, (const AUOOPRenderClientUser *)*(unsigned __int8 *)(v8 + 60), a3, a4);
        AUOOPRenderingClient::copyEventsToSharedMemory(v17, a7, v99, 0);
        if ((v120 & 0x80000000) == 0)
        {
          kdebug_trace();
          uint64_t v100 = *(void *)(v17 + 80);
          uint64_t v125 = v17 + 8;
          if (!audioipc::ipc_node_base<(audioipc::ipcnode_options)0,audioipc::eventlink_primitive,caulk::ipc::mapped_memory>::can_send(v17 + 8, v101)|| ((*(unsigned char *)(v100 + 4104) = 2, *(_DWORD *)(v100 + 4120) = v120, v99 <= 0.0)? (char v102 = audioipc::ipc_node_base<(audioipc::ipcnode_options)0,audioipc::eventlink_primitive,caulk::ipc::mapped_memory>::signal_wait(v125)): (char v102 = audioipc::ipc_node_base<(audioipc::ipcnode_options)0,audioipc::eventlink_primitive,caulk::ipc::mapped_memory>::signal_wait_with_timeout(v125, v99)), (v102 & 1) == 0))
          {
            uint64_t v110 = _os_log_pack_size();
            uint64_t message = caulk::deferred_logger::create_message((caulk::deferred_logger *)gCADefaultDeferredLog, v110 + 88, 2);
            if (message)
            {
              v112 = (caulk::concurrent::message *)message;
              v113 = (_DWORD *)_os_log_pack_fill();
              _DWORD *v113 = 67109120;
              v113[1] = -66745;
              caulk::concurrent::messenger::enqueue(*(caulk::concurrent::messenger **)(gCADefaultDeferredLog + 16), v112);
            }
            kdebug_trace();
            LODWORD(v39) = 0;
LABEL_35:
            caulk::pooled_semaphore_mutex::_unlock((caulk::pooled_semaphore_mutex *)(v17 + 160));
            if (v23) {
              goto LABEL_18;
            }
            unsigned int v40 = a5;
            if (v39)
            {
LABEL_38:
              v41 = audioipc::SharedAudioBuffers::immutableBufferList((audioipc::SharedAudioBuffers *)(v17 + 104), v40, a4);
              unsigned int v42 = **(_DWORD **)v41;
              if (*a6 >= v42) {
                uint64_t v43 = v42;
              }
              else {
                uint64_t v43 = *a6;
              }
              if (v43)
              {
                v44 = (const void **)(*(void *)v41 + 16);
                v45 = (void **)(a6 + 4);
                do
                {
                  v46 = *v45;
                  v47 = (void *)*v44;
                  if (*v45)
                  {
                    if (v46 != v47) {
                      memcpy(v46, v47, *((unsigned int *)v44 - 1));
                    }
                  }
                  else
                  {
                    *v45 = v47;
                  }
                  v44 += 2;
                  v45 += 2;
                  --v43;
                }
                while (v43);
              }
              uint64_t v48 = *(void *)(v17 + 88);
              unsigned int v127 = *(_DWORD *)(v48 + 4);
              if (v127 && *(void *)(v8 + 40))
              {
                char v49 = 0;
                uint64_t v50 = 0;
                uint64_t v51 = 0;
                uint64_t v52 = v48 + 8;
                while (1)
                {
                  char v53 = *(unsigned char *)(v52 + v50);
                  v51 |= (unint64_t)(v53 & 0x7F) << v49;
                  ++v50;
                  if ((v53 & 0x80) == 0) {
                    break;
                  }
                  v49 += 7;
                  if (v50 == 10)
                  {
                    unsigned int v54 = 10;
                    goto LABEL_58;
                  }
                }
                unsigned int v54 = v50;
LABEL_58:
                unsigned int v58 = 0;
                uint64_t v121 = *(void *)(v17 + 88);
                uint64_t v123 = v48 + 9;
                do
                {
                  if (v58)
                  {
                    char v59 = 0;
                    uint64_t v60 = 0;
                    uint64_t v61 = 0;
                    while (1)
                    {
                      char v62 = *(unsigned char *)(v52 + v58 + v60);
                      v61 |= (unint64_t)(v62 & 0x7F) << v59;
                      ++v60;
                      if ((v62 & 0x80) == 0) {
                        break;
                      }
                      v59 += 7;
                      if (v60 == 10)
                      {
                        unsigned int v54 = 10;
                        goto LABEL_65;
                      }
                    }
                    unsigned int v54 = v60;
                  }
LABEL_65:
                  char v63 = 0;
                  uint64_t v64 = 0;
                  int v65 = 0;
                  unsigned int v66 = v58;
                  while (1)
                  {
                    int v67 = *(char *)(v123 + v58 + (unint64_t)v54 + v64);
                    v65 |= (unint64_t)(v67 & 0x7F) << v63;
                    ++v64;
                    if ((v67 & 0x80000000) == 0) {
                      break;
                    }
                    v63 += 7;
                    if (v64 == 5)
                    {
                      int v68 = 5;
                      goto LABEL_70;
                    }
                  }
                  int v68 = v64;
LABEL_70:
                  (*(void (**)(void))(*(void *)(v8 + 40) + 16))();
                  unsigned int v58 = v66 + v54 + v68 + v65 + 1;
                }
                while (v58 < v127);
                *(_DWORD *)(v121 + 4) = 0;
              }
              uint64_t v69 = *(void *)(v17 + 96);
              unsigned int v128 = *(_DWORD *)(v69 + 4);
              if (v128 && *(void *)(v8 + 48))
              {
                char v70 = 0;
                uint64_t v71 = 0;
                uint64_t v72 = 0;
                uint64_t v73 = v69 + 8;
                while (1)
                {
                  char v74 = *(unsigned char *)(v73 + v71);
                  v72 |= (unint64_t)(v74 & 0x7F) << v70;
                  ++v71;
                  if ((v74 & 0x80) == 0) {
                    break;
                  }
                  v70 += 7;
                  if (v71 == 10)
                  {
                    unsigned int v75 = 10;
                    goto LABEL_79;
                  }
                }
                unsigned int v75 = v71;
LABEL_79:
                unsigned int v76 = 0;
                uint64_t v122 = *(void *)(v17 + 96);
                uint64_t v124 = v69 + 9;
                do
                {
                  if (v76)
                  {
                    char v77 = 0;
                    uint64_t v78 = 0;
                    uint64_t v79 = 0;
                    while (1)
                    {
                      char v80 = *(unsigned char *)(v73 + v76 + v78);
                      v79 |= (unint64_t)(v80 & 0x7F) << v77;
                      ++v78;
                      if ((v80 & 0x80) == 0) {
                        break;
                      }
                      v77 += 7;
                      if (v78 == 10)
                      {
                        unsigned int v75 = 10;
                        goto LABEL_86;
                      }
                    }
                    unsigned int v75 = v78;
                  }
LABEL_86:
                  char v81 = 0;
                  uint64_t v82 = 0;
                  int v83 = 0;
                  unsigned int v84 = v76;
                  while (1)
                  {
                    int v85 = *(char *)(v124 + v76 + (unint64_t)v75 + v82);
                    v83 |= (unint64_t)(v85 & 0x7F) << v81;
                    ++v82;
                    if ((v85 & 0x80000000) == 0) {
                      break;
                    }
                    v81 += 7;
                    if (v82 == 5)
                    {
                      int v86 = 5;
                      goto LABEL_91;
                    }
                  }
                  int v86 = v82;
LABEL_91:
                  (*(void (**)(void))(*(void *)(v8 + 48) + 16))();
                  unsigned int v76 = v84 + v75 + v86 + v83 + 1;
                }
                while (v76 < v128);
                *(_DWORD *)(v122 + 4) = 0;
              }
              uint64_t v23 = 0;
              *a2 = *(_DWORD *)(v129 + 4 * (*(_DWORD *)(v17 + 216) + a5) + 4316);
              goto LABEL_18;
            }
LABEL_37:
            unsigned int v40 = *(_DWORD *)(v17 + 216) + a5;
            goto LABEL_38;
          }
          kdebug_trace();
          while (1)
          {
            int v106 = *(unsigned __int8 *)(v100 + 4105);
            if (v106 != 102) {
              break;
            }
            *(void *)&v136.mFlags = 0;
            memset(&v136.mWordClockTime, 0, 32);
            v136.float mSampleTime = (double)*(uint64_t *)(v100 + 4136);
            v136.mHostTime = *(void *)(v100 + 4144);
            v136.mRateScalar = *(Float64 *)(v100 + 4152);
            v136.mFlags = *(_DWORD *)(v100 + 4160);
            AUOOPRenderingClient::pullOneInput((AUOOPRenderingClient *)v17, *(_DWORD *)(v100 + 4128), &v136, *(unsigned int *)(v100 + 4132));
            uint64_t v107 = *(void *)(v17 + 80);
            if (audioipc::ipc_node_base<(audioipc::ipcnode_options)0,audioipc::eventlink_primitive,caulk::ipc::mapped_memory>::can_send(v125, v108))
            {
              *(unsigned char *)(v107 + 4104) = 3;
              char v109 = v99 <= 0.0
                   ? audioipc::ipc_node_base<(audioipc::ipcnode_options)0,audioipc::eventlink_primitive,caulk::ipc::mapped_memory>::signal_wait(v125)
                   : audioipc::ipc_node_base<(audioipc::ipcnode_options)0,audioipc::eventlink_primitive,caulk::ipc::mapped_memory>::signal_wait_with_timeout(v125, v99);
              if (v109) {
                continue;
              }
            }
            LODWORD(v39) = 0;
            goto LABEL_35;
          }
          if (v106 != 101)
          {
            uint64_t v119 = _os_log_pack_size();
            v39 = (caulk::concurrent::message *)caulk::deferred_logger::create_message((caulk::deferred_logger *)gCADefaultDeferredLog, v119 + 88, 2);
            if (v39)
            {
              *(_WORD *)_os_log_pack_fill() = 0;
              caulk::concurrent::messenger::enqueue(*(caulk::concurrent::messenger **)(gCADefaultDeferredLog + 16), v39);
              LODWORD(v39) = 0;
            }
            uint64_t v114 = 4294967246;
LABEL_156:
            *(_DWORD *)(*(void *)(v17 + 80) + 4) = 0;
            uint64_t v23 = v114;
            goto LABEL_35;
          }
          LODWORD(v39) = 0;
          uint64_t v114 = *(unsigned int *)(v100 + 4124);
LABEL_151:
          if (v114 == -66745) {
            goto LABEL_35;
          }
          goto LABEL_156;
        }
        kdebug_trace();
        uint64_t v103 = *(void *)(v17 + 80);
        if (audioipc::ipc_node_base<(audioipc::ipcnode_options)0,audioipc::eventlink_primitive,caulk::ipc::mapped_memory>::can_send(v17 + 8, v104)&& ((*(unsigned char *)(v103 + 4104) = 1, v99 <= 0.0)? (int v105 = audioipc::ipc_node_base<(audioipc::ipcnode_options)0,audioipc::eventlink_primitive,caulk::ipc::mapped_memory>::signal_wait(v17 + 8)): (int v105 = audioipc::ipc_node_base<(audioipc::ipcnode_options)0,audioipc::eventlink_primitive,caulk::ipc::mapped_memory>::signal_wait_with_timeout(v17 + 8, v99)), v105))
        {
          LODWORD(v39) = *(unsigned __int8 *)(v103 + 4106);
          uint64_t v114 = *(unsigned int *)(v103 + 4124);
          if (!v114)
          {
LABEL_150:
            kdebug_trace();
            goto LABEL_151;
          }
          uint64_t v126 = v114;
        }
        else
        {
          LODWORD(v39) = 0;
          uint64_t v126 = 4294900551;
        }
        uint64_t v115 = _os_log_pack_size();
        uint64_t v116 = caulk::deferred_logger::create_message((caulk::deferred_logger *)gCADefaultDeferredLog, v115 + 88, 2);
        if (v116)
        {
          v117 = (caulk::concurrent::message *)v116;
          v118 = (_DWORD *)_os_log_pack_fill();
          _DWORD *v118 = 67109120;
          uint64_t v114 = v126;
          v118[1] = v126;
          caulk::concurrent::messenger::enqueue(*(caulk::concurrent::messenger **)(gCADefaultDeferredLog + 16), v117);
        }
        else
        {
          uint64_t v114 = v126;
        }
        goto LABEL_150;
      }
      int v57 = *(_DWORD *)(v38 + 4248) | 0x200;
    }
    *(_DWORD *)(v38 + 4248) = v57;
    goto LABEL_101;
  }
  return 4294956429;
}

void __28__AUAudioUnit_XPC_didCrash___block_invoke(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 40));
  postNotificationIfNotPosted<caulk::weak_ref<AUAudioUnit_XPC>>(&to, *(void **)(a1 + 32));
}

void __32__AUAudioUnit_XPC_didInvalidate__block_invoke(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 40));
  postNotificationIfNotPosted<caulk::weak_ref<AUAudioUnit_XPC>>(&to, *(void **)(a1 + 32));
}

void __45__AUAudioUnit_XPC__invalidatePipePoolAndUser__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained[109];
    if (v2)
    {
      uint64_t v8 = WeakRetained;
      std::recursive_mutex::lock((std::recursive_mutex *)v2);
      uint64_t v3 = *(void *)(v2 + 80);
      for (uint64_t i = *(void *)(v2 + 88); v3 != i; v3 += 8)
      {
        uint64_t v5 = *(void *)(*(void *)v3 + 120);
        uint64_t v6 = *(void *)(*(void *)v3 + 128);
        while (v5 != v6)
        {
          uint64_t v7 = *(void *)(v5 + 8);
          if (v7)
          {
            atomic_store(1u, (unsigned __int8 *)(v7 + 2));
            audioipc::rt_sender<(audioipc::ipcnode_options)0,audioipc::eventlink_primitive,caulk::ipc::mapped_memory>::stop(v7 + 8);
          }
          v5 += 32;
        }
      }
      std::recursive_mutex::unlock((std::recursive_mutex *)v2);
      id WeakRetained = v8;
    }
  }
}

void __38__AUAudioUnit_XPC__doOpen_completion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = caulk::strong<AURemoteMessageChannel>((id *)(a1 + 32));
  id v4 = v3;
  if (v3) {
    [v3 didCrash:v5];
  }
}

- (id).cxx_construct
{
  self->_component.__ptr_ = 0;
  self->_component.__cntrl_ = 0;
  caulk::pooled_semaphore_mutex::pooled_semaphore_mutex((caulk::pooled_semaphore_mutex *)&self->_realtimeState);
  caulk::pooled_semaphore_mutex::pooled_semaphore_mutex((caulk::pooled_semaphore_mutex *)((char *)&self->_realtimeState.renderObserverList.mObservers.mActiveList.mHead
                                                                                        + 4));
  self->_realtimeState.eventSchedule.mScheduledParameterRefresher = (AUScheduledParameterRefresher2 *)&self->_anon_f8[24];
  self->_realtimeState.renderObserverList.mObservers.mPendingList.mHead = 0;
  LOBYTE(self->_realtimeState.eventSchedule.mAUv2GetParameterSynchronizer) = 0;
  self->_realtimeState.renderObserverList.mObservers.mFreeList.mHead = 0;
  *(void *)&self->_realtimeState.renderObserverList.mTouched = 0;
  uint64_t v3 = (AURenderEventNode *)CADeprecated::TSingleton<AURenderEventAllocator>::instance();
  self->_realtimeState.eventSchedule.mScheduleHead = 0;
  LOBYTE(self->_realtimeState.auv2GetParameterSynchronizer.mSyncGetParamSema.mMachSem) = 0;
  *(void *)&self->_anon_f8[8] = 0;
  *(void *)&self->_anon_f8[16] = 0;
  *(void *)self->_realtimeState.eventSchedule.mAddedEventQueue.mDequeueHead.padding = 0;
  *(void *)&self->_realtimeState.eventSchedule.mAddedEventQueue.mDequeueHead.padding[8] = 0;
  self->_realtimeState.eventSchedule.mAddedEventQueue.mEnqueueHead.__a_.__a_value = v3;
  self->_realtimeState.contextChangeGenerator.var0 = 0u;
  *(_OWORD *)&self->_realtimeState.contextChangeGenerator.__engaged_ = 0u;
  MEMORY[0x192FC7EE0]();
  *(void *)&self->_anon_f8[24] = 0;
  caulk::semaphore::semaphore((caulk::semaphore *)&self->_anon_f8[32]);
  self->_anon_f8[48] = 0;
  self->_anon_f8[64] = 0;
  *(void *)&self->_anon_f8[72] = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostIdentifier, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong(&self->_profileChangedBlock, 0);
  objc_storeStrong((id *)&self->_channelMap, 0);
  objc_storeStrong((id *)&self->_migrateFromPlugin, 0);
  objc_storeStrong((id *)&self->_contextName, 0);
  objc_storeStrong(&self->_transportStateBlock, 0);
  objc_storeStrong(&self->_musicalContextBlock, 0);
  objc_storeStrong((id *)&self->_currentPreset, 0);
  objc_storeStrong((id *)&self->_factoryPresets, 0);
  objc_storeStrong((id *)&self->_audioUnitShortName, 0);
  objc_storeStrong(&self->_MIDIOutputEventListHostBlock, 0);
  objc_storeStrong(&self->_MIDIOutputEventHostBlock, 0);
  objc_storeStrong(&self->_MIDIOutputEventListBlock, 0);
  objc_storeStrong(&self->_MIDIOutputEventBlock, 0);
  objc_storeStrong((id *)&self->_presetFolderWatcher, 0);
  objc_storeStrong((id *)&self->_presetMonitoringQueue, 0);
  objc_storeStrong((id *)&self->_userPresets, 0);
  objc_storeStrong((id *)&self->_parameterTree, 0);
  if (self->_anon_f8[64]) {
    RenderContextChangeGenerator::~RenderContextChangeGenerator((RenderContextChangeGenerator *)&self->_anon_f8[48]);
  }
  MEMORY[0x192FC8070](&self->_anon_f8[32]);
  AUEventSchedule::~AUEventSchedule((AUEventSchedule *)&self->_realtimeState.eventSchedule.mScheduledParameterRefresher);
  TThreadSafeList<RenderObserver>::NodeStack::free_all((uint64_t *)&self->_realtimeState.renderObserverList.mObservers.mPendingList);
  TThreadSafeList<RenderObserver>::NodeStack::free_all((uint64_t *)&self->_realtimeState.renderObserverList.mObservers.mFreeList);
  TThreadSafeList<RenderObserver>::NodeStack::free_all((uint64_t *)&self->_realtimeState.renderObserverList.mTouched);
  objc_storeStrong((id *)&self->_cachedViewController, 0);
  objc_storeStrong((id *)&self->_componentName, 0);
  cntrl = self->_component.__cntrl_;
  if (cntrl)
  {
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (void)setRequestViewControllerSynchronously:(BOOL)a3
{
  self->_requestViewControllerSynchronously = a3;
}

- (BOOL)requestViewControllerSynchronously
{
  return self->_requestViewControllerSynchronously;
}

- (void)setHostIdentifier:(id)a3
{
}

- (AUv3HostIdentifier)hostIdentifier
{
  return self->_hostIdentifier;
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (void)setProfileChangedBlock:(AUMIDICIProfileChangedBlock)profileChangedBlock
{
}

- (AUMIDICIProfileChangedBlock)profileChangedBlock
{
  return self->_profileChangedBlock;
}

- (void)setChannelMap:(NSArray *)channelMap
{
}

- (NSArray)channelMap
{
  return self->_channelMap;
}

- (BOOL)supportsMPE
{
  return self->_supportsMPE;
}

- (NSArray)migrateFromPlugin
{
  return self->_migrateFromPlugin;
}

- (void)setContextName:(NSString *)contextName
{
}

- (NSString)contextName
{
  return self->_contextName;
}

- (void)setTransportStateBlock:(AUHostTransportStateBlock)transportStateBlock
{
}

- (AUHostTransportStateBlock)transportStateBlock
{
  return self->_transportStateBlock;
}

- (void)setMusicalContextBlock:(AUHostMusicalContextBlock)musicalContextBlock
{
}

- (AUHostMusicalContextBlock)musicalContextBlock
{
  return self->_musicalContextBlock;
}

- (void)setRenderingOffline:(BOOL)renderingOffline
{
  self->_renderingOffline = renderingOffline;
}

- (BOOL)isRenderingOffline
{
  return self->_renderingOffline;
}

- (BOOL)canProcessInPlace
{
  return self->_canProcessInPlace;
}

- (void)setShouldBypassEffect:(BOOL)shouldBypassEffect
{
  self->_shouldBypassEffect = shouldBypassEffect;
}

- (BOOL)shouldBypassEffect
{
  return self->_shouldBypassEffect;
}

- (void)setRenderQuality:(NSInteger)renderQuality
{
  self->_renderQuality = renderQuality;
}

- (NSInteger)renderQuality
{
  return self->_renderQuality;
}

- (NSTimeInterval)tailTime
{
  return self->_tailTime;
}

- (NSTimeInterval)latency
{
  return self->_latency;
}

- (void)setCurrentPreset:(AUAudioUnitPreset *)currentPreset
{
}

- (AUAudioUnitPreset)currentPreset
{
  return self->_currentPreset;
}

- (NSArray)factoryPresets
{
  return self->_factoryPresets;
}

- (void)setHostMIDIProtocol:(MIDIProtocolID)hostMIDIProtocol
{
  self->_hostMIDIProtocol = hostMIDIProtocol;
}

- (MIDIProtocolID)hostMIDIProtocol
{
  return self->_hostMIDIProtocol;
}

- (MIDIProtocolID)AudioUnitMIDIProtocol
{
  return self->_AudioUnitMIDIProtocol;
}

- (NSInteger)virtualMIDICableCount
{
  return self->_virtualMIDICableCount;
}

- (BOOL)allParameterValues
{
  return self->_allParameterValues;
}

- (BOOL)renderResourcesAllocated
{
  return self->_renderResourcesAllocated;
}

- (NSString)audioUnitShortName
{
  return self->_audioUnitShortName;
}

- (AudioComponentDescription)componentDescription
{
  *retstr = *(AudioComponentDescription *)((char *)self + 552);
  return self;
}

- (id)messageChannelFor:(NSString *)channelName
{
  return 0;
}

- (void)setLocalCachingDisabled:(BOOL)a3
{
  self->_localCachingDisabled = a3;
}

- (BOOL)isLocalCachingDisabled
{
  return self->_localCachingDisabled;
}

- (BOOL)isSpeechSynthesisProvider
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2050000000;
  uint64_t v2 = (void *)getAVSpeechSynthesisProviderAudioUnitClass(void)::softClass;
  uint64_t v9 = getAVSpeechSynthesisProviderAudioUnitClass(void)::softClass;
  if (!getAVSpeechSynthesisProviderAudioUnitClass(void)::softClass)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = ___ZL42getAVSpeechSynthesisProviderAudioUnitClassv_block_invoke;
    v5[3] = &unk_1E5688B80;
    v5[4] = &v6;
    ___ZL42getAVSpeechSynthesisProviderAudioUnitClassv_block_invoke((uint64_t)v5);
    uint64_t v2 = (void *)v7[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);
  return objc_opt_isKindOfClass() & 1;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)remoteProcessAuditToken
{
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  return self;
}

- (int)remoteProcessIdentifier
{
  return 0;
}

- (BOOL)isLoadedInProcess
{
  return self->_isLoadedInProcess;
}

- (os_workgroup_t)osWorkgroup
{
  return 0;
}

- (NSArray)userPresets
{
  if ([(AUAudioUnit *)self supportsUserPresets])
  {
    userPresets = self->_userPresets;
    if (self->_isLoadedInProcess || userPresets)
    {
      id v4 = userPresets;
    }
    else
    {
      uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v7 = self->_userPresets;
      self->_userPresets = v6;

      uint64_t v8 = self->_userPresets;
      id v10 = 0;
      +[AUAudioUnit _loadUserPresets:v8 error:&v10];
      id v9 = v10;
      [(AUAudioUnit *)self startUserPresetFolderMonitoring];
      id v4 = self->_userPresets;
    }
  }
  else
  {
    id v4 = (NSMutableArray *)MEMORY[0x1E4F1CBF0];
  }
  return (NSArray *)v4;
}

- (void)startUserPresetFolderMonitoring
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!self->_presetFolderWatcher)
  {
    if (self->_presetMonitoringQueue)
    {
LABEL_5:
      objc_initWeak((id *)location, self);
      presetMonitoringQueue = self->_presetMonitoringQueue;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __46__AUAudioUnit_startUserPresetFolderMonitoring__block_invoke;
      v11[3] = &unk_1E5688E10;
      objc_copyWeak(&v12, (id *)location);
      uint64_t v7 = +[AUAudioUnit _monitorUserPresets:presetMonitoringQueue callback:v11];
      presetFolderWatcher = self->_presetFolderWatcher;
      self->_presetFolderWatcher = v7;

      objc_destroyWeak(&v12);
      objc_destroyWeak((id *)location);
      return;
    }
    id v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    id v4 = (OS_dispatch_queue *)dispatch_queue_create("AUExtension.PresetMonitoring", v3);
    id v5 = self->_presetMonitoringQueue;
    self->_presetMonitoringQueue = v4;

    if (self->_presetMonitoringQueue)
    {

      goto LABEL_5;
    }
    if (kAUExtensionScope)
    {
      id v9 = *(id *)kAUExtensionScope;
      if (!v9)
      {
LABEL_14:

        return;
      }
    }
    else
    {
      id v9 = MEMORY[0x1E4F14500];
      id v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315394;
      *(void *)&location[4] = "AUAudioUnit.mm";
      __int16 v14 = 1024;
      int v15 = 1665;
      _os_log_impl(&dword_18FEC0000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to create AUExtension.PresetMonitoring queue!", location, 0x12u);
    }

    goto LABEL_14;
  }
}

void __46__AUAudioUnit_startUserPresetFolderMonitoring__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = (void *)WeakRetained[43];
    WeakRetained[43] = 0;

    [WeakRetained willChangeValueForKey:@"userPresets"];
    [WeakRetained didChangeValueForKey:@"userPresets"];
  }
}

- (BOOL)deleteUserPreset:(AUAudioUnitPreset *)userPreset error:(NSError *)outError
{
  uint64_t v6 = userPreset;
  if ([(AUAudioUnit *)self supportsUserPresets])
  {
    if (self->_isLoadedInProcess)
    {
      LOBYTE(outError) = 1;
    }
    else
    {
      [(AUAudioUnit *)self startUserPresetFolderMonitoring];
      LOBYTE(outError) = +[AUAudioUnit _deleteUserPreset:v6 error:outError];
    }
  }
  else if (outError)
  {
    uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-10850 userInfo:0];
    *outError = v7;

    LOBYTE(outError) = 0;
  }

  return (char)outError;
}

- (NSDictionary)presetStateFor:(AUAudioUnitPreset *)userPreset error:(NSError *)outError
{
  uint64_t v6 = userPreset;
  if ([(AUAudioUnit *)self supportsUserPresets])
  {
    if (!self->_isLoadedInProcess)
    {
      outError = +[AUAudioUnit _presetStateFor:v6 error:outError];
      goto LABEL_7;
    }
  }
  else
  {
    if (!outError) {
      goto LABEL_7;
    }
    uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-10850 userInfo:0];
    *outError = v7;
  }
  outError = 0;
LABEL_7:

  return (NSDictionary *)outError;
}

- (BOOL)saveUserPreset:(AUAudioUnitPreset *)userPreset error:(NSError *)outError
{
  uint64_t v6 = userPreset;
  if (![(AUAudioUnit *)self supportsUserPresets])
  {
    if (!outError)
    {
      BOOL v7 = 0;
      goto LABEL_9;
    }
    uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-10850 userInfo:0];
    BOOL v7 = 0;
    *outError = v8;
    goto LABEL_7;
  }
  if (!self->_isLoadedInProcess)
  {
    [(AUAudioUnit *)self startUserPresetFolderMonitoring];
    uint64_t v8 = [(AUAudioUnit *)self fullStateForDocument];
    BOOL v7 = +[AUAudioUnit _saveUserPreset:v6 state:v8 error:outError];
LABEL_7:

    goto LABEL_9;
  }
  BOOL v7 = 1;
LABEL_9:

  return v7;
}

- (BOOL)disableProfile:(MIDICIProfile *)profile cable:(uint8_t)cable onChannel:(MIDIChannelNumber)channel error:(NSError *)outError
{
  if (outError)
  {
    BOOL v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-10850 userInfo:0];
    *outError = v7;
  }
  return 0;
}

- (BOOL)enableProfile:(MIDICIProfile *)profile cable:(uint8_t)cable onChannel:(MIDIChannelNumber)channel error:(NSError *)outError
{
  if (outError)
  {
    BOOL v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-10850 userInfo:0];
    *outError = v7;
  }
  return 0;
}

- (MIDICIProfileState)profileStateForCable:(uint8_t)cable channel:(MIDIChannelNumber)channel
{
  uint64_t v4 = channel;
  id v5 = (objc_class *)self;
  if (v5)
  {
    id v6 = [v5 alloc];
    id v5 = (objc_class *)[v6 initWithChannel:v4 enabledProfiles:MEMORY[0x1E4F1CBF0] disabledProfiles:MEMORY[0x1E4F1CBF0]];
  }
  return (MIDICIProfileState *)v5;
}

- (NSIndexSet)supportedViewConfigurations:(NSArray *)availableViewConfigurations
{
  id v3 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSet", availableViewConfigurations);
  return (NSIndexSet *)v3;
}

- (id)_valueForProperty:(id)a3 error:(id *)a4
{
  uint64_t v4 = -[AUAudioUnit valueForKey:](self, "valueForKey:", *((void *)a3 + 1), a4);
  return v4;
}

- (id)valueForUndefinedKey:(id)a3
{
  return 0;
}

- (NSInteger)MIDIOutputBufferSizeHint
{
  return self->_MIDIOutputBufferSizeHint;
}

- (void)setMIDIOutputBufferSizeHint:(NSInteger)MIDIOutputBufferSizeHint
{
  self->_MIDIOutputBufferSizeHint = MIDIOutputBufferSizeHint;
}

- (AUAudioFrameCount)maximumFramesToRender
{
  return self->_maximumFramesToRender;
}

- (void)setMaximumFramesToRender:(AUAudioFrameCount)maximumFramesToRender
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!self->_renderResourcesAllocated)
  {
    self->_maximumFramesToRender = maximumFramesToRender;
    return;
  }
  if (kAUExtensionScope)
  {
    id v3 = *(id *)kAUExtensionScope;
    if (!v3) {
      return;
    }
  }
  else
  {
    id v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    id v6 = "AUAudioUnit.mm";
    __int16 v7 = 1024;
    int v8 = 1417;
    _os_log_impl(&dword_18FEC0000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d Cannot set maximumFramesToRender while render resources allocated.", (uint8_t *)&v5, 0x12u);
  }
}

- (AUMIDIEventListBlock)MIDIOutputEventListBlock
{
  uint64_t v2 = _Block_copy(self->_MIDIOutputEventListBlock);
  return v2;
}

- (void)setMIDIOutputEventListBlock:(AUMIDIEventListBlock)MIDIOutputEventListBlock
{
  AUMIDIEventListBlock v4 = MIDIOutputEventListBlock;
  id v13 = v4;
  if (self->_shouldUseMIDI2)
  {
    id MIDIOutputEventListHostBlock = self->_MIDIOutputEventListHostBlock;
    if (MIDIOutputEventListHostBlock) {
      BOOL v6 = MIDIOutputEventListHostBlock == v4;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6)
    {
      self->_id MIDIOutputEventListHostBlock = 0;

      AUMIDIEventListBlock v4 = v13;
    }
    __int16 v7 = (void *)[v4 copy];
    id v8 = self->_MIDIOutputEventListHostBlock;
    self->_id MIDIOutputEventListHostBlock = v7;

    [(AUAudioUnit *)self setupMIDIConversion];
  }
  else
  {
    id v9 = self->_MIDIOutputEventListBlock;
    if (v9) {
      BOOL v10 = v9 == v4;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10)
    {
      self->_MIDIOutputEventListBlock = 0;

      AUMIDIEventListBlock v4 = v13;
    }
    float v11 = (void *)[v4 copy];
    id v12 = self->_MIDIOutputEventListBlock;
    self->_MIDIOutputEventListBlock = v11;
  }
}

- (AUMIDIOutputEventBlock)MIDIOutputEventBlock
{
  uint64_t v2 = _Block_copy(self->_MIDIOutputEventBlock);
  return v2;
}

- (void)setMIDIOutputEventBlock:(AUMIDIOutputEventBlock)MIDIOutputEventBlock
{
  AUMIDIOutputEventBlock v4 = MIDIOutputEventBlock;
  id v13 = v4;
  if (self->_shouldUseMIDI2)
  {
    id MIDIOutputEventHostBlock = self->_MIDIOutputEventHostBlock;
    if (MIDIOutputEventHostBlock) {
      BOOL v6 = MIDIOutputEventHostBlock == v4;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6)
    {
      self->_id MIDIOutputEventHostBlock = 0;

      AUMIDIOutputEventBlock v4 = v13;
    }
    __int16 v7 = (void *)[v4 copy];
    id v8 = self->_MIDIOutputEventHostBlock;
    self->_id MIDIOutputEventHostBlock = v7;

    [(AUAudioUnit *)self setupMIDIConversion];
  }
  else
  {
    id v9 = self->_MIDIOutputEventBlock;
    if (v9) {
      BOOL v10 = v9 == v4;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10)
    {
      self->_MIDIOutputEventBlock = 0;

      AUMIDIOutputEventBlock v4 = v13;
    }
    float v11 = (void *)[v4 copy];
    id v12 = self->_MIDIOutputEventBlock;
    self->_MIDIOutputEventBlock = v11;
  }
}

- (void)setupMIDIConversion
{
  MIDIProtocolID v3 = [(AUAudioUnit *)self hostMIDIProtocol];
  AUMIDIOutputEventBlock v4 = _Block_copy(self->_MIDIOutputEventHostBlock);
  int v5 = _Block_copy(self->_MIDIOutputEventListHostBlock);
  id MIDIOutputEventBlock = self->_MIDIOutputEventBlock;
  if (MIDIOutputEventBlock)
  {
    self->_id MIDIOutputEventBlock = 0;
  }
  if (v3 == kMIDIProtocol_2_0)
  {
    if (!v5) {
      goto LABEL_17;
    }
    BOOL v10 = (std::__shared_weak_count *)operator new(0x840uLL);
    v10->__shared_weak_owners_ = 0;
    v10->__shared_owners_ = 0;
    v10->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDFA2930;
    bzero(&v10[1], 0x824uLL);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3321888768;
    v30[2] = __34__AUAudioUnit_setupMIDIConversion__block_invoke_70;
    v30[3] = &unk_1EDFA33B8;
    v32 = v10 + 1;
    unsigned int v33 = v10;
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
    id v31 = v5;
    float v11 = _Block_copy(v30);
    id v12 = self->_MIDIOutputEventBlock;
    self->_id MIDIOutputEventBlock = v11;

    id v13 = v33;
    if (!v33) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (v3 == kMIDIProtocol_1_0)
  {
    if (!v5) {
      goto LABEL_17;
    }
    BOOL v10 = (std::__shared_weak_count *)operator new(0x20uLL);
    v10->__shared_owners_ = 0;
    v10->__shared_weak_owners_ = 0;
    v10->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDFA28F8;
    LOBYTE(v10[1].__vftable) = 0;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3321888768;
    v34[2] = __34__AUAudioUnit_setupMIDIConversion__block_invoke_2;
    v34[3] = &unk_1EDFA3380;
    char v36 = v10 + 1;
    unsigned int v37 = v10;
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
    id v35 = v5;
    __int16 v14 = _Block_copy(v34);
    id v15 = self->_MIDIOutputEventBlock;
    self->_id MIDIOutputEventBlock = v14;

    id v13 = v37;
    if (!v37) {
      goto LABEL_14;
    }
LABEL_13:
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
LABEL_14:
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
    goto LABEL_17;
  }
  if (v3)
  {
    id v9 = self->_MIDIOutputEventBlock;
    self->_id MIDIOutputEventBlock = &__block_literal_global_73;
  }
  else
  {
    if (!v4) {
      goto LABEL_17;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __34__AUAudioUnit_setupMIDIConversion__block_invoke;
    aBlock[3] = &unk_1E5687A18;
    id v39 = v4;
    __int16 v7 = _Block_copy(aBlock);
    id v8 = self->_MIDIOutputEventBlock;
    self->_id MIDIOutputEventBlock = v7;

    id v9 = v39;
  }

LABEL_17:
  id MIDIOutputEventListBlock = self->_MIDIOutputEventListBlock;
  if (MIDIOutputEventListBlock)
  {
    self->_id MIDIOutputEventListBlock = 0;
  }
  if ((v3 - 1) >= 2)
  {
    if (v3)
    {
      id v22 = self->_MIDIOutputEventListBlock;
      self->_id MIDIOutputEventListBlock = &__block_literal_global_77;
    }
    else
    {
      if (!v4) {
        goto LABEL_29;
      }
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __34__AUAudioUnit_setupMIDIConversion__block_invoke_2_74;
      v28[3] = &unk_1E5687A60;
      id v29 = v4;
      uint64_t v20 = _Block_copy(v28);
      id v21 = self->_MIDIOutputEventListBlock;
      self->_id MIDIOutputEventListBlock = v20;

      id v22 = v29;
    }

    goto LABEL_29;
  }
  if (v5)
  {
    uint64_t v17 = (std::__shared_weak_count *)operator new(0xB40uLL);
    v17->__shared_weak_owners_ = 0;
    v17->__shared_owners_ = 0;
    v17->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDFA2968;
    bzero(&v17[1], 0xB24uLL);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3321888768;
    v23[2] = __34__AUAudioUnit_setupMIDIConversion__block_invoke_3;
    v23[3] = &unk_1EDFA3480;
    unint64_t v25 = v17 + 1;
    uint64_t v26 = v17;
    atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
    MIDIProtocolID v27 = v3;
    id v24 = v5;
    unint64_t v18 = _Block_copy(v23);
    id v19 = self->_MIDIOutputEventListBlock;
    self->_id MIDIOutputEventListBlock = v18;

    if (v26) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v26);
    }
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
LABEL_29:
}

uint64_t __34__AUAudioUnit_setupMIDIConversion__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __34__AUAudioUnit_setupMIDIConversion__block_invoke_2(uint64_t a1, void *a2, char a3, unsigned int a4, uint64_t a5)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unsigned int v11 = 0;
  uint64_t v8 = a4;
  id v9 = _Block_copy(*(const void **)(a1 + 32));
  id v12 = _ZN5caulk16inplace_functionIFvPKN4MIDI9EventListEELm48ELm8ENS_23inplace_function_detail6vtableEE16k_wrapper_vtableIZZ34__AUAudioUnit_setupMIDIConversion_EUb3_E3__5EE;
  v13[0] = _Block_copy(v9);
  v13[1] = a2;
  char v14 = a3;
  id v15 = &v11;
  MIDI::LegacyMIDIConverter<MIDI::IdentityTranslator>::convertLegacyDataToEventList(a5, v8, 0, (uint64_t *)&v12);
  ((void (*)(id *))v12[3])(v13);

  return v11;
}

uint64_t __34__AUAudioUnit_setupMIDIConversion__block_invoke_70(uint64_t a1, void *a2, char a3, unsigned int a4, uint64_t a5)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unsigned int v12 = 0;
  uint64_t v8 = a4;
  id v9 = *(int **)(a1 + 40);
  BOOL v10 = _Block_copy(*(const void **)(a1 + 32));
  id v13 = _ZN5caulk16inplace_functionIFvPKN4MIDI9EventListEELm48ELm8ENS_23inplace_function_detail6vtableEE16k_wrapper_vtableIZZ34__AUAudioUnit_setupMIDIConversion_EUb4_E3__6EE;
  v14[0] = _Block_copy(v10);
  v14[1] = a2;
  char v15 = a3;
  uint64_t v16 = &v12;
  MIDI::LegacyMIDIConverter<MIDI::MIDI_1_to_2_Translator>::convertLegacyDataToEventList(v9, a5, v8, 0, (uint64_t *)&v13);
  ((void (*)(id *))v13[3])(v14);

  return v12;
}

uint64_t __34__AUAudioUnit_setupMIDIConversion__block_invoke_2_74(uint64_t a1, uint64_t a2, char a3, _DWORD *a4)
{
  v19[102] = *MEMORY[0x1E4F143B8];
  unsigned int v9 = 0;
  __int16 v7 = _Block_copy(*(const void **)(a1 + 32));
  BOOL v10 = _ZN5caulk16inplace_functionIFvPKN4MIDI16LegacyPacketListEELm48ELm8ENS_23inplace_function_detail6vtableEE16k_wrapper_vtableIZZ34__AUAudioUnit_setupMIDIConversion_EUb5_E3__7EE;
  *(void *)&long long v11 = &v9;
  BYTE8(v11) = a3;
  uint64_t v12 = a2;
  id v13 = _Block_copy(v7);
  char v14 = _ZN5caulk16inplace_functionIFvPKN4MIDI16LegacyPacketListEELm48ELm8ENS_23inplace_function_detail6vtableEE16k_wrapper_vtableIZZ34__AUAudioUnit_setupMIDIConversion_EUb5_E3__7EE;
  long long v15 = v11;
  uint64_t v16 = v12;
  uint64_t v17 = _Block_copy(v13);
  MIDI::MIDIPacketList_Deliverer::MIDIPacketList_Deliverer(v18, (uint64_t *)&v14);
  ((void (*)(uint64_t))v14[3])((uint64_t)&v15);
  MIDI::MIDIPacketList_Deliverer::operator()((uint64_t)v18, a4);
  v18[0] = &unk_1EDF95120;
  (*(void (**)(void *))(v18[1] + 24))(v19);
  ((void (*)(long long *))v10[3])(&v11);

  return v9;
}

uint64_t __34__AUAudioUnit_setupMIDIConversion__block_invoke_3(uint64_t a1, uint64_t a2, unsigned int a3, int *a4)
{
  MIDIProtocolID v5 = *(_DWORD *)(a1 + 56);
  uint64_t v122 = *(int **)(a1 + 40);
  aBlock = (uint64_t (**)(void *, uint64_t, void, int *))_Block_copy(*(const void **)(a1 + 32));
  int v6 = *a4;
  if (*a4 == v5)
  {
    uint64_t v7 = a4[1];
    if (v7)
    {
      if (v7 == 1 && a4[4] <= 0x40)
      {
        uint64_t v7 = aBlock[2](aBlock, a2, a3, a4);
      }
      else
      {
        uint64_t v7 = 0;
        unsigned int v49 = 0;
        uint64_t v50 = a4 + 2;
        do
        {
          uint64_t v51 = v50[2];
          v130 = v50 + 3;
          uint64_t v131 = v51;
          uint64_t v132 = *(void *)v50;
          uint64_t v133 = 0;
          uint64_t v52 = (uint64_t (**)(void *, uint64_t, void, MIDIEventList *))_Block_copy(aBlock);
          char v53 = MIDIEventListInit(&evtlist, v5);
          *(void *)words = 0;
          *(void *)uint64_t v137 = 0;
          uint64_t v138 = 0;
          while (MIDI::EventList::PacketReader::read((uint64_t *)&v130, words, v137))
          {
            char v53 = MIDIEventListAdd(&evtlist, 0x114uLL, v53, *(MIDITimeStamp *)words, MIDI::UniversalPacket::word_sizes[(unint64_t)v137[0] >> 28], v137);
            if (!v53)
            {
              if (!v7) {
                uint64_t v7 = v52[2](v52, a2, a3, &evtlist);
              }
              memset(&evtlist, 0, sizeof(evtlist));
              unsigned int v54 = MIDIEventListInit(&evtlist, v5);
              char v53 = MIDIEventListAdd(&evtlist, 0x114uLL, v54, *(MIDITimeStamp *)words, MIDI::UniversalPacket::word_sizes[(unint64_t)v137[0] >> 28], v137);
            }
          }
          if (evtlist.numPackets) {
            BOOL v55 = v7 == 0;
          }
          else {
            BOOL v55 = 0;
          }
          if (v55) {
            uint64_t v7 = v52[2](v52, a2, a3, &evtlist);
          }

          v50 += v50[2] + 3;
          ++v49;
        }
        while (v49 < a4[1]);
      }
    }
    goto LABEL_239;
  }
  if (v5 != kMIDIProtocol_2_0 || v6 != 1)
  {
    BOOL v9 = v5 == kMIDIProtocol_1_0 && v6 == 2;
    if (v9 && a4[1])
    {
      uint64_t v7 = 0;
      int v10 = 0;
      uint64_t v11 = (uint64_t)(a4 + 2);
      uint64_t v114 = v122 + 521;
      while (1)
      {
        int v120 = v10;
        uint64_t v12 = *(unsigned int *)(v11 + 8);
        v130 = (_DWORD *)(v11 + 12);
        uint64_t v131 = v12;
        uint64_t v118 = v11;
        uint64_t v132 = *(void *)v11;
        uint64_t v133 = 0;
        id v13 = _Block_copy(aBlock);
        char v14 = MIDIEventListInit(&evtlist, kMIDIProtocol_1_0);
        time[0] = 0;
        uint64_t v123 = (uint64_t (**)(void, void, void, void))v13;
        *(void *)words = 0;
        uint64_t v135 = 0;
        while (MIDI::EventList::PacketReader::read((uint64_t *)&v130, time, words))
        {
          unint64_t v15 = (unint64_t)words[0] >> 28;
          if (((1 << v15) & 0xA02F) != 0)
          {
            char v14 = MIDIEventListAdd(&evtlist, 0x114uLL, v14, time[0], MIDI::UniversalPacket::word_sizes[v15], words);
            if (!v14)
            {
              if (!v7) {
                uint64_t v7 = ((uint64_t (**)(void, uint64_t, void, MIDIEventList *))v123)[2](v123, a2, a3, &evtlist);
              }
              memset(&evtlist, 0, sizeof(evtlist));
              uint64_t v16 = MIDIEventListInit(&evtlist, kMIDIProtocol_1_0);
              char v14 = MIDIEventListAdd(&evtlist, 0x114uLL, v16, time[0], MIDI::UniversalPacket::word_sizes[(unint64_t)words[0] >> 28], words);
            }
          }
          else if (v15 == 4)
          {
            UInt32 v17 = HIBYTE(words[0]) & 0xF | 0x20;
            UInt32 v18 = words[1];
            switch(BYTE2(words[0]) >> 4)
            {
              case 2:
              case 3:
                uint64_t v20 = &v114[12 * (HIBYTE(words[0]) & 0xF)];
                unint64_t v21 = ((unint64_t)words[0] >> 16) & 0xF;
                id v22 = (unsigned __int8 *)v20 + 3 * v21;
                UInt32 v23 = (words[0] >> 8) & 0x7F;
                int v121 = words[0] & 0x7F;
                if ((words[0] & 0x100000) != 0) {
                  int v24 = 2;
                }
                else {
                  int v24 = 1;
                }
                if (v24 != *v22 || v23 != v22[1])
                {
                  int v25 = v21 | 0xB0;
LABEL_40:
                  char v115 = v24;
                  uint64_t v116 = (char *)v20 + 3 * v21;
                  unint64_t v117 = ((unint64_t)words[0] >> 16) & 0xF;
                  if ((words[0] & 0x100000) != 0) {
                    int v28 = 25344;
                  }
                  else {
                    int v28 = 25856;
                  }
                  uint64_t v138 = 0;
                  int v26 = (v17 << 24) | (v25 << 16);
                  char v29 = BYTE1(words[0]) & 0x7F;
                  *(void *)uint64_t v137 = v28 | v23 | v26;
                  long long v30 = MIDIEventListAdd(&evtlist, 0x114uLL, v14, time[0], 1uLL, v137);
                  if (v30)
                  {
                    MIDITimeStamp v27 = time[0];
                  }
                  else
                  {
                    if (!v7) {
                      uint64_t v7 = ((uint64_t (**)(void, uint64_t, void, MIDIEventList *))v123)[2](v123, a2, a3, &evtlist);
                    }
                    memset(&evtlist, 0, sizeof(evtlist));
                    char v34 = MIDIEventListInit(&evtlist, kMIDIProtocol_1_0);
                    MIDITimeStamp v27 = time[0];
                    long long v30 = MIDIEventListAdd(&evtlist, 0x114uLL, v34, time[0], MIDI::UniversalPacket::word_sizes[(unint64_t)v137[0] >> 28], v137);
                  }
                  uint64_t v138 = 0;
                  *(void *)uint64_t v137 = v26 | (v28 - 256) | v121;
                  char v14 = MIDIEventListAdd(&evtlist, 0x114uLL, v30, v27, 1uLL, v137);
                  if (!v14)
                  {
                    if (!v7) {
                      uint64_t v7 = ((uint64_t (**)(void, uint64_t, void, MIDIEventList *))v123)[2](v123, a2, a3, &evtlist);
                    }
                    memset(&evtlist, 0, sizeof(evtlist));
                    id v35 = MIDIEventListInit(&evtlist, kMIDIProtocol_1_0);
                    char v14 = MIDIEventListAdd(&evtlist, 0x114uLL, v35, v27, MIDI::UniversalPacket::word_sizes[(unint64_t)v137[0] >> 28], v137);
                  }
                  *uint64_t v116 = v115;
                  uint64_t v36 = (uint64_t)v20 + 3 * v117;
                  *(unsigned char *)(v36 + 1) = v29;
                  *(unsigned char *)(v36 + 2) = v121;
                  goto LABEL_63;
                }
                int v25 = v21 | 0xB0;
                if (v121 != *((unsigned __int8 *)v20 + 3 * v21 + 2)) {
                  goto LABEL_40;
                }
                int v26 = (v25 << 16) | (v17 << 24);
                MIDITimeStamp v27 = time[0];
LABEL_63:
                uint64_t v138 = 0;
                *(void *)uint64_t v137 = v26 | (v18 >> 25) | 0x600;
                char v14 = MIDIEventListAdd(&evtlist, 0x114uLL, v14, v27, 1uLL, v137);
                if (!v14)
                {
                  if (!v7) {
                    uint64_t v7 = ((uint64_t (**)(void, uint64_t, void, MIDIEventList *))v123)[2](v123, a2, a3, &evtlist);
                  }
                  memset(&evtlist, 0, sizeof(evtlist));
                  unsigned int v37 = MIDIEventListInit(&evtlist, kMIDIProtocol_1_0);
                  char v14 = MIDIEventListAdd(&evtlist, 0x114uLL, v37, time[0], MIDI::UniversalPacket::word_sizes[(unint64_t)v137[0] >> 28], v137);
                }
                int v38 = (v18 >> 18) & 0x7F;
                if (v38)
                {
                  uint64_t v138 = 0;
                  *(void *)uint64_t v137 = v38 | v26 | 0x2600u;
                  MIDITimeStamp v39 = time[0];
                  char v14 = MIDIEventListAdd(&evtlist, 0x114uLL, v14, time[0], 1uLL, v137);
                  if (!v14)
                  {
                    if (!v7) {
                      uint64_t v7 = ((uint64_t (**)(void, uint64_t, void, MIDIEventList *))v123)[2](v123, a2, a3, &evtlist);
                    }
                    memset(&evtlist, 0, sizeof(evtlist));
                    unsigned int v40 = MIDIEventListInit(&evtlist, kMIDIProtocol_1_0);
                    v41 = MIDIEventListAdd(&evtlist, 0x114uLL, v40, v39, MIDI::UniversalPacket::word_sizes[(unint64_t)v137[0] >> 28], v137);
                    goto LABEL_86;
                  }
                }
                break;
              case 8:
              case 9:
              case 10:
              case 11:
                UInt32 v19 = BYTE2(words[0]) >> 4 == 9;
                if (words[1] >> 25) {
                  UInt32 v19 = words[1] >> 25;
                }
                uint64_t v138 = 0;
                *(void *)uint64_t v137 = words[0] & 0x7F00 | (BYTE2(words[0]) << 16) | (v17 << 24) | v19;
                char v14 = MIDIEventListAdd(&evtlist, 0x114uLL, v14, time[0], 1uLL, v137);
                if (!v14)
                {
                  if (!v7) {
                    uint64_t v7 = ((uint64_t (**)(void, uint64_t, void, MIDIEventList *))v123)[2](v123, a2, a3, &evtlist);
                  }
                  goto LABEL_85;
                }
                continue;
              case 12:
                if (words[0])
                {
                  uint64_t v138 = 0;
                  int v32 = BYTE2(words[0]) << 16;
                  unint64_t v42 = (v32 - 0x100000) | (v17 << 24);
                  *(void *)uint64_t v137 = (v32 - 0x100000) & 0xFFFFFF80 | (v17 << 24) | (words[1] >> 8) & 0x7F;
                  ByteCount v43 = MIDI::UniversalPacket::word_sizes[v42 >> 28];
                  v44 = MIDIEventListAdd(&evtlist, 0x114uLL, v14, time[0], v43, v137);
                  if (v44)
                  {
                    MIDITimeStamp v33 = time[0];
                  }
                  else
                  {
                    if (!v7) {
                      uint64_t v7 = ((uint64_t (**)(void, uint64_t, void, MIDIEventList *))v123)[2](v123, a2, a3, &evtlist);
                    }
                    memset(&evtlist, 0, sizeof(evtlist));
                    v45 = MIDIEventListInit(&evtlist, kMIDIProtocol_1_0);
                    MIDITimeStamp v33 = time[0];
                    v44 = MIDIEventListAdd(&evtlist, 0x114uLL, v45, time[0], MIDI::UniversalPacket::word_sizes[(unint64_t)v137[0] >> 28], v137);
                  }
                  uint64_t v138 = 0;
                  *(void *)uint64_t v137 = v42 | v18 & 0x7F | 0x2000;
                  char v14 = MIDIEventListAdd(&evtlist, 0x114uLL, v44, v33, v43, v137);
                  if (!v14)
                  {
                    if (!v7) {
                      uint64_t v7 = ((uint64_t (**)(void, uint64_t, void, MIDIEventList *))v123)[2](v123, a2, a3, &evtlist);
                    }
                    memset(&evtlist, 0, sizeof(evtlist));
                    v46 = MIDIEventListInit(&evtlist, kMIDIProtocol_1_0);
                    char v14 = MIDIEventListAdd(&evtlist, 0x114uLL, v46, v33, MIDI::UniversalPacket::word_sizes[(unint64_t)v137[0] >> 28], v137);
                  }
                  UInt32 v31 = v17 << 24;
                }
                else
                {
                  UInt32 v31 = v17 << 24;
                  int v32 = BYTE2(words[0]) << 16;
                  MIDITimeStamp v33 = time[0];
                }
                uint64_t v138 = 0;
                *(void *)uint64_t v137 = v32 | v31 | HIWORD(v18) & 0x7F00;
                char v14 = MIDIEventListAdd(&evtlist, 0x114uLL, v14, v33, 1uLL, v137);
                if (!v14)
                {
                  if (!v7) {
                    uint64_t v7 = ((uint64_t (**)(void, uint64_t, void, MIDIEventList *))v123)[2](v123, a2, a3, &evtlist);
                  }
                  goto LABEL_85;
                }
                continue;
              case 13:
                uint64_t v138 = 0;
                *(void *)uint64_t v137 = (BYTE2(words[0]) << 16) | (v17 << 24) | (words[1] >> 25 << 8);
                char v14 = MIDIEventListAdd(&evtlist, 0x114uLL, v14, time[0], 1uLL, v137);
                if (!v14)
                {
                  if (!v7) {
                    uint64_t v7 = ((uint64_t (**)(void, uint64_t, void, MIDIEventList *))v123)[2](v123, a2, a3, &evtlist);
                  }
                  goto LABEL_85;
                }
                continue;
              case 14:
                uint64_t v138 = 0;
                *(void *)uint64_t v137 = (words[1] >> 10) & 0x7F00 | (words[1] >> 25) | (BYTE2(words[0]) << 16) | (v17 << 24);
                char v14 = MIDIEventListAdd(&evtlist, 0x114uLL, v14, time[0], 1uLL, v137);
                if (!v14)
                {
                  if (!v7) {
                    uint64_t v7 = ((uint64_t (**)(void, uint64_t, void, MIDIEventList *))v123)[2](v123, a2, a3, &evtlist);
                  }
LABEL_85:
                  memset(&evtlist, 0, sizeof(evtlist));
                  v47 = MIDIEventListInit(&evtlist, kMIDIProtocol_1_0);
                  v41 = MIDIEventListAdd(&evtlist, 0x114uLL, v47, time[0], MIDI::UniversalPacket::word_sizes[(unint64_t)v137[0] >> 28], v137);
LABEL_86:
                  char v14 = v41;
                }
                continue;
              default:
                continue;
            }
          }
        }
        if (evtlist.numPackets) {
          BOOL v48 = v7 == 0;
        }
        else {
          BOOL v48 = 0;
        }
        if (v48) {
          uint64_t v7 = ((uint64_t (**)(void, uint64_t, void, MIDIEventList *))v123)[2](v123, a2, a3, &evtlist);
        }

        uint64_t v11 = v118 + 4 * *(unsigned int *)(v118 + 8) + 12;
        int v10 = v120 + 1;
        if (v120 + 1 >= a4[1]) {
          goto LABEL_239;
        }
      }
    }
LABEL_238:
    uint64_t v7 = 0;
    goto LABEL_239;
  }
  if (!a4[1]) {
    goto LABEL_238;
  }
  uint64_t v7 = 0;
  unsigned int v56 = 0;
  int v57 = a4 + 2;
  uint64_t v119 = v122 + 4;
  do
  {
    uint64_t v58 = v57[2];
    v130 = v57 + 3;
    uint64_t v131 = v58;
    uint64_t v132 = *(void *)v57;
    uint64_t v133 = 0;
    char v59 = (uint64_t (**)(void *, uint64_t, void, MIDIEventList *))_Block_copy(aBlock);
    uint64_t v60 = MIDIEventListInit(&evtlist, kMIDIProtocol_2_0);
    time[1] = 0;
    MIDITimeStamp v129 = 0;
    time[0] = 0;
    while (MIDI::EventList::PacketReader::read((uint64_t *)&v130, &v129, time))
    {
      unint64_t v61 = LODWORD(time[0]);
      if (LODWORD(time[0]) >> 28 == 2)
      {
        *(void *)words = 0;
        uint64_t v135 = 0;
        int v63 = BYTE2(time[0]);
        int v64 = *((unsigned __int8 *)v122 + 32);
        int v65 = *v122;
        int v66 = BYTE2(time[0]) >> 4;
        if (!*((unsigned char *)v122 + 32))
        {
          if ((v65 & 0xFF0000) != 0)
          {
            if (((v65 ^ LODWORD(time[0])) & 0xF0000) != 0)
            {
              int v64 = 1;
              *((unsigned char *)v122 + 32) = 1;
            }
            else
            {
              if (v66 == 11)
              {
                switch(BYTE1(v65))
                {
                  case 'b':
                    int v98 = time[0] & 0xFF00;
                    int v99 = 25344;
                    goto LABEL_225;
                  case 'c':
                    int v98 = time[0] & 0xFF00;
                    int v99 = 25088;
                    goto LABEL_225;
                  case 'd':
                    int v98 = time[0] & 0xFF00;
                    int v99 = 25856;
                    goto LABEL_225;
                  case 'e':
                    int v98 = time[0] & 0xFF00;
                    int v99 = 25600;
LABEL_225:
                    if (v98 != v99 && (time[0] & 0xF0DF00) != 0xB00600) {
                      break;
                    }
                    goto LABEL_229;
                  default:
                    if (BYTE1(v65) == 32)
                    {
                      if ((time[0] & 0xFF00) != 0) {
                        break;
                      }
LABEL_229:
                      int v64 = 0;
                      *uint64_t v119 = *(_OWORD *)time;
                      goto LABEL_120;
                    }
                    if (!BYTE1(v65) && (time[0] & 0xFF00) == 0x2000) {
                      goto LABEL_229;
                    }
                    break;
                }
LABEL_227:
                int v64 = 1;
                goto LABEL_120;
              }
              int v64 = (v65 & 0xDF00) != 0 || v66 != 12;
            }
          }
          else
          {
            int v64 = 1;
            if ((time[0] & 0xF00000) == 0xB00000 && v66 == 11)
            {
              if (BYTE1(time[0]) - 98 >= 4 && BYTE1(time[0]) != 32 && BYTE1(time[0])) {
                goto LABEL_227;
              }
              int v64 = 0;
              *(_OWORD *)uint64_t v122 = *(_OWORD *)time;
              int v65 = *v122;
            }
          }
        }
LABEL_120:
        uint64_t v67 = BYTE3(v61) & 0xF;
        unsigned int v68 = BYTE3(v61) & 0xF | 0x40;
        if (BYTE2(v65) && v64)
        {
          *((unsigned char *)v122 + 32) = 1;
          uint64_t v138 = 0;
          v137[0] = v65 & 0xFF00 | (BYTE2(v65) << 16) & 0x80FFFFFF | ((BYTE3(v61) & 0xF | 0x40) << 24);
          unsigned int v69 = v65;
          UInt32 v70 = v65 << 25;
          if (v69 >= 0x41)
          {
            unsigned int v71 = (v69 & 0x3F) << 19;
            if (v71)
            {
              do
              {
                v70 |= v71;
                BOOL v72 = v71 > 0x3F;
                v71 >>= 6;
              }
              while (v72);
            }
          }
          v137[1] = v70;
          uint64_t v60 = MIDIEventListAdd(&evtlist, 0x114uLL, v60, v129, 2uLL, v137);
          if (!v60)
          {
            if (!v7) {
              uint64_t v7 = v59[2](v59, a2, a3, &evtlist);
            }
            memset(&evtlist, 0, sizeof(evtlist));
            uint64_t v73 = MIDIEventListInit(&evtlist, kMIDIProtocol_2_0);
            uint64_t v60 = MIDIEventListAdd(&evtlist, 0x114uLL, v73, v129, MIDI::UniversalPacket::word_sizes[(unint64_t)v137[0] >> 28], v137);
          }
          *uint64_t v122 = 0;
          uint64_t v138 = 0;
          int v74 = v122[4];
          int v66 = BYTE2(v61) >> 4;
          uint64_t v67 = BYTE3(v61) & 0xF;
          if (BYTE2(v74))
          {
            LOWORD(v137[0]) = v74 & 0xFF00;
            BYTE2(v137[0]) = BYTE2(v74);
            HIBYTE(v137[0]) = BYTE3(v61) & 0xF | 0x40;
            unsigned int v75 = v74;
            UInt32 v76 = v74 << 25;
            if (v75 >= 0x41)
            {
              unsigned int v77 = (v75 & 0x3F) << 19;
              if (v77)
              {
                do
                {
                  v76 |= v77;
                  BOOL v72 = v77 > 0x3F;
                  v77 >>= 6;
                }
                while (v72);
              }
            }
            v137[1] = v76;
            MIDITimeStamp v78 = v129;
            uint64_t v60 = MIDIEventListAdd(&evtlist, 0x114uLL, v60, v129, 2uLL, v137);
            if (!v60)
            {
              if (!v7) {
                uint64_t v7 = v59[2](v59, a2, a3, &evtlist);
              }
              memset(&evtlist, 0, sizeof(evtlist));
              uint64_t v79 = MIDIEventListInit(&evtlist, kMIDIProtocol_2_0);
              uint64_t v60 = MIDIEventListAdd(&evtlist, 0x114uLL, v79, v78, MIDI::UniversalPacket::word_sizes[(unint64_t)v137[0] >> 28], v137);
            }
            *(_DWORD *)uint64_t v119 = 0;
            int v63 = BYTE2(v61);
            int v66 = BYTE2(v61) >> 4;
            uint64_t v67 = BYTE3(v61) & 0xF;
          }
          else
          {
            int v63 = BYTE2(v61);
          }
          *(void *)((char *)&v122[32 * v67 + 8 + 2 * ((v61 >> 16) & 0xF)] + 1) = 0;
        }
        unsigned int v80 = (v61 >> 8) & 0x7F;
        unsigned int v81 = v61 & 0x7F;
        switch(v66)
        {
          case 8:
            goto LABEL_146;
          case 9:
            if ((v61 & 0x7F) == 0)
            {
              v63 -= 16;
              unsigned int v81 = 64;
            }
LABEL_146:
            UInt32 v82 = (v68 << 24) | (v63 << 16) | (v80 << 8);
            words[0] = v82;
            unsigned int v83 = v81 << 9;
            if (v81 >= 0x41)
            {
              unsigned int v84 = 8 * (v81 & 0x3F);
              if (v84)
              {
                do
                {
                  v83 |= v84;
                  BOOL v72 = v84 > 0x3F;
                  v84 >>= 6;
                }
                while (v72);
              }
            }
            UInt32 v85 = v83 << 16;
            goto LABEL_150;
          case 10:
            UInt32 v82 = (v63 << 16) | (v68 << 24) | (v80 << 8);
            words[0] = v82;
            UInt32 v85 = v61 << 25;
            if (v81 >= 0x41)
            {
              unsigned int v87 = (v61 & 0x3F) << 19;
              if (v87)
              {
                do
                {
                  v85 |= v87;
                  BOOL v72 = v87 > 0x3F;
                  v87 >>= 6;
                }
                while (v72);
              }
            }
            goto LABEL_150;
          case 11:
            int v88 = v63;
            uint64_t v89 = (uint64_t)&v122[32 * v67 + 8] + 1;
            uint64_t v90 = (v61 >> 16) & 0xF;
            if (((v61 >> 8) & 0x7F) > 0x25)
            {
              switch(v80)
              {
                case 'b':
                  uint64_t v100 = v89 + 8 * v90;
                  *(unsigned char *)(v100 + 1) = 2;
                  goto LABEL_214;
                case 'c':
                  uint64_t v110 = v89 + 8 * v90;
                  *(unsigned char *)(v110 + 1) = 2;
                  goto LABEL_216;
                case 'd':
                  uint64_t v100 = v89 + 8 * v90;
                  *(unsigned char *)(v100 + 1) = 1;
LABEL_214:
                  *(unsigned char *)(v100 + 5) = v81;
                  break;
                case 'e':
                  uint64_t v110 = v89 + 8 * v90;
                  *(unsigned char *)(v110 + 1) = 1;
LABEL_216:
                  *(unsigned char *)(v110 + 4) = v81;
                  break;
                default:
                  if (v80 != 38) {
                    goto LABEL_218;
                  }
                  char v102 = v61 & 0x7F;
                  int v103 = v61 & 0x7F;
                  goto LABEL_203;
              }
              goto LABEL_217;
            }
            if (!v80)
            {
              *(unsigned char *)(v89 + 8 * v90 + 2) = v81;
              goto LABEL_199;
            }
            if (v80 != 6)
            {
              if (v80 != 32) {
                goto LABEL_218;
              }
              *(unsigned char *)(v89 + 8 * v90 + 3) = v81;
LABEL_199:
              *(unsigned char *)(v89 + 8 * v90) = 1;
LABEL_217:
              if (!*((unsigned char *)v122 + 32)) {
                continue;
              }
              goto LABEL_218;
            }
            char v102 = 0;
            int v103 = 0;
            *(unsigned char *)(v89 + 8 * v90 + 6) = v81;
LABEL_203:
            uint64_t v104 = v89 + 8 * v90;
            *(unsigned char *)(v104 + 7) = v102;
            if (!*((unsigned char *)v122 + 32) && *(unsigned char *)(v104 + 1))
            {
              if (*(unsigned char *)(v104 + 1) == 1) {
                int v105 = 32;
              }
              else {
                int v105 = 48;
              }
              int v106 = (unsigned __int8 *)(v89 + 8 * v90);
              UInt32 v82 = (v68 << 24) | ((v105 | v90) << 16) | (v106[4] << 8) | v106[5];
              words[0] = v82;
              unsigned int v107 = v103 | (v106[6] << 7);
              UInt32 v108 = v107 << 18;
              if (v107 > 0x2000)
              {
                for (unsigned int i = 32 * (v107 & 0x1FFF); i; i >>= 13)
                  v108 |= i;
              }
              words[1] = v108;
              *(_OWORD *)uint64_t v122 = 0u;
              *((_OWORD *)v122 + 1) = 0u;
              goto LABEL_151;
            }
LABEL_218:
            UInt32 v82 = (v88 << 16) | (v68 << 24) | (v80 << 8);
            words[0] = v82;
            UInt32 v85 = v61 << 25;
            if (v81 >= 0x41)
            {
              unsigned int v111 = (v61 & 0x3F) << 19;
              if (v111)
              {
                do
                {
                  v85 |= v111;
                  BOOL v72 = v111 > 0x3F;
                  v111 >>= 6;
                }
                while (v72);
              }
            }
LABEL_150:
            words[1] = v85;
LABEL_151:
            uint64_t v60 = MIDIEventListAdd(&evtlist, 0x114uLL, v60, v129, MIDI::UniversalPacket::word_sizes[(unint64_t)v82 >> 28], words);
            if (!v60)
            {
              if (!v7) {
                uint64_t v7 = v59[2](v59, a2, a3, &evtlist);
              }
              memset(&evtlist, 0, sizeof(evtlist));
              int v86 = MIDIEventListInit(&evtlist, kMIDIProtocol_2_0);
              uint64_t v60 = MIDIEventListAdd(&evtlist, 0x114uLL, v86, v129, MIDI::UniversalPacket::word_sizes[(unint64_t)words[0] >> 28], words);
            }
            break;
          case 12:
            v91 = &v122[32 * v67 + 2 * (WORD1(v61) & 0xF)];
            int v92 = v63;
            unsigned __int8 v93 = *((unsigned char *)v122 + 32) ^ 1;
            if (!*((unsigned char *)v91 + 33)) {
              unsigned __int8 v93 = 0;
            }
            UInt32 v82 = (v92 << 16) | (v68 << 24) | v93;
            words[0] = v82;
            HIBYTE(words[1]) = BYTE1(v61) & 0x7F;
            BYTE1(words[1]) = *((unsigned char *)v91 + 35);
            LOBYTE(words[1]) = *((unsigned char *)v91 + 36);
            *(void *)((char *)v91 + 33) = 0;
            *(_OWORD *)uint64_t v122 = 0u;
            *((_OWORD *)v122 + 1) = 0u;
            goto LABEL_151;
          case 13:
            UInt32 v82 = (v63 << 16) | (v68 << 24);
            words[0] = v82;
            unsigned int v94 = v61 >> 8 << 25;
            if (v80 >= 0x41)
            {
              unsigned int v95 = ((v61 >> 8) & 0x3F) << 19;
              if (v95)
              {
                do
                {
                  v94 |= v95;
                  BOOL v72 = v95 > 0x3F;
                  v95 >>= 6;
                }
                while (v72);
              }
            }
            words[1] = v94;
            goto LABEL_151;
          case 14:
            UInt32 v82 = (v63 << 16) | (v68 << 24);
            words[0] = v82;
            unsigned int v96 = v80 | (v81 << 7);
            UInt32 v85 = v96 << 18;
            if (v96 > 0x2000)
            {
              for (unsigned int j = 32 * (v96 & 0x1FFF); j; j >>= 13)
                v85 |= j;
            }
            goto LABEL_150;
          default:
            UInt32 v82 = words[0];
            goto LABEL_151;
        }
      }
      else
      {
        uint64_t v60 = MIDIEventListAdd(&evtlist, 0x114uLL, v60, v129, MIDI::UniversalPacket::word_sizes[(unint64_t)LODWORD(time[0]) >> 28], (const UInt32 *)time);
        if (!v60)
        {
          if (!v7) {
            uint64_t v7 = v59[2](v59, a2, a3, &evtlist);
          }
          memset(&evtlist, 0, sizeof(evtlist));
          char v62 = MIDIEventListInit(&evtlist, kMIDIProtocol_2_0);
          uint64_t v60 = MIDIEventListAdd(&evtlist, 0x114uLL, v62, v129, MIDI::UniversalPacket::word_sizes[(unint64_t)LODWORD(time[0]) >> 28], (const UInt32 *)time);
        }
      }
    }
    if (evtlist.numPackets) {
      BOOL v112 = v7 == 0;
    }
    else {
      BOOL v112 = 0;
    }
    if (v112) {
      uint64_t v7 = v59[2](v59, a2, a3, &evtlist);
    }

    v57 += v57[2] + 3;
    ++v56;
  }
  while (v56 < a4[1]);
LABEL_239:

  return v7;
}

uint64_t __34__AUAudioUnit_setupMIDIConversion__block_invoke_75()
{
  return 4294967292;
}

uint64_t __34__AUAudioUnit_setupMIDIConversion__block_invoke_71()
{
  return 0;
}

- (BOOL)providesUserInterface
{
  uint64_t v2 = [(AUAudioUnit *)self methodForSelector:sel_requestViewControllerWithCompletionHandler_];
  return v2 != +[AUAudioUnit instanceMethodForSelector:sel_requestViewControllerWithCompletionHandler_];
}

- (void)requestViewControllerWithCompletionHandler:(void *)completionHandler
{
}

- (void)setCachedViewController:(id)a3
{
  MIDIProtocolID v5 = (UIViewController *)a3;
  cachedViewController = self->_cachedViewController;
  p_cachedViewController = &self->_cachedViewController;
  if (cachedViewController != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_cachedViewController, a3);
    MIDIProtocolID v5 = v8;
  }
}

- (id)cachedViewController
{
  return self->_cachedViewController;
}

- (void)setFullState:(NSDictionary *)fullState
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  AUMIDIOutputEventBlock v4 = fullState;
  MIDIProtocolID v5 = [(NSDictionary *)v4 objectForKeyedSubscript:@"type"];
  if ([v5 unsignedIntValue] != self->_componentDescription.componentType) {
    goto LABEL_8;
  }
  int v6 = [(NSDictionary *)v4 objectForKeyedSubscript:@"subtype"];
  if ([v6 unsignedIntValue] != self->_componentDescription.componentSubType)
  {

LABEL_8:
    goto LABEL_9;
  }
  uint64_t v7 = [(NSDictionary *)v4 objectForKeyedSubscript:@"manufacturer"];
  int v8 = [v7 unsignedIntValue];
  OSType componentManufacturer = self->_componentDescription.componentManufacturer;

  if (v8 != componentManufacturer)
  {
LABEL_9:
    if (kAUExtensionScope)
    {
      int v10 = *(id *)kAUExtensionScope;
      if (!v10) {
        goto LABEL_16;
      }
    }
    else
    {
      int v10 = MEMORY[0x1E4F14500];
      id v12 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      unint64_t v15 = "AUAudioUnit.mm";
      __int16 v16 = 1024;
      int v17 = 1166;
      _os_log_impl(&dword_18FEC0000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d setFullState: preset type/subtype/manufacturer does not match", (uint8_t *)&v14, 0x12u);
    }
    goto LABEL_15;
  }
  int v10 = [(NSDictionary *)v4 objectForKeyedSubscript:@"data"];
  if (v10)
  {
    uint64_t v11 = [(AUAudioUnit *)self parameterTree];
    [(AUAudioUnit *)self willChangeValueForKey:@"allParameterValues"];
    MEMORY[0x192FC7A70](&v14, v10);
    [v11 _deserialize:&v14 fromSetFullState:1];
    [(AUAudioUnit *)self didChangeValueForKey:@"allParameterValues"];
    MEMORY[0x192FC7A90](&v14);
  }
  else
  {
    if (kAUExtensionScope)
    {
      uint64_t v11 = *(id *)kAUExtensionScope;
      if (!v11)
      {
        int v10 = 0;
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v11 = MEMORY[0x1E4F14500];
      id v13 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      unint64_t v15 = "AUAudioUnit.mm";
      __int16 v16 = 1024;
      int v17 = 1171;
      _os_log_impl(&dword_18FEC0000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d setFullState: no data", (uint8_t *)&v14, 0x12u);
    }
  }

LABEL_15:
LABEL_16:
}

- (NSDictionary)fullState
{
  MIDIProtocolID v3 = objc_opt_new();
  [v3 setObject:&unk_1EDFB2E60 forKeyedSubscript:@"version"];
  AUMIDIOutputEventBlock v4 = [MEMORY[0x1E4F28ED0] numberWithInt:self->_componentDescription.componentType];
  [v3 setObject:v4 forKeyedSubscript:@"type"];

  MIDIProtocolID v5 = [MEMORY[0x1E4F28ED0] numberWithInt:self->_componentDescription.componentSubType];
  [v3 setObject:v5 forKeyedSubscript:@"subtype"];

  int v6 = [MEMORY[0x1E4F28ED0] numberWithInt:self->_componentDescription.componentManufacturer];
  [v3 setObject:v6 forKeyedSubscript:@"manufacturer"];

  CASerializer::CASerializer(&v9, 0);
  uint64_t v7 = [(AUAudioUnit *)self parameterTree];
  [v7 _serialize:&v9];

  [v3 setObject:v9.var0 forKeyedSubscript:@"data"];
  MEMORY[0x192FC7960](&v9);
  return (NSDictionary *)v3;
}

- (AUAudioUnitBusArray)outputBusses
{
  return 0;
}

- (AUAudioUnitBusArray)inputBusses
{
  return 0;
}

- (NSArray)channelCapabilities
{
  return 0;
}

- (void)flushEventSchedule
{
  p_mScheduledParameterRefresher = &self->_realtimeState.eventSchedule.mScheduledParameterRefresher;
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_realtimeState.auv2GetParameterSynchronizer);
  if (v4)
  {
    int v20 = 0x8000;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v16 = 0u;
    unint64_t v15 = (char *)0xC200000000000000;
    uint64_t v19 = 1;
    memset(v14, 0, sizeof(v14));
    (*(void (**)(void, int *, char **, uint64_t, void, void *, void))(*(void *)&self->_realtimeState.contextChangeGenerator.__engaged_
                                                                                      + 16))(*(void *)&self->_realtimeState.contextChangeGenerator.__engaged_, &v20, &v15, 0x1000000, 0, v14, 0);
  }
  unint64_t v15 = (char *)&self->_realtimeState.renderObserverList.mObservers.mActiveList.mHead + 4;
  LOBYTE(v16) = 1;
  caulk::pooled_semaphore_mutex::_lock((caulk::pooled_semaphore_mutex *)((char *)&self->_realtimeState.renderObserverList.mObservers.mActiveList.mHead
                                                                       + 4));
  MIDIProtocolID v5 = (AURenderEvent *)AUEventSchedule::preRender((AUEventSchedule *)p_mScheduledParameterRefresher, 0x7FFFFFFFFFFFFFFEuLL, 1u, 0);
  AUEventSchedule::postRender((AUEventSchedule *)p_mScheduledParameterRefresher, v5);
  uint64_t v6 = *(void *)&self->_anon_f8[8];
  do
  {
    _X2 = 0;
    _X5 = *(void *)&self->_anon_f8[16];
    __asm { CASPAL          X4, X5, X2, X3, [X8] }
    _ZF = _X4 == v6;
    uint64_t v6 = _X4;
  }
  while (!_ZF);
  std::unique_lock<caulk::pooled_semaphore_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v15);
}

- (NSArray)parametersForOverviewWithCount:(NSInteger)count
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E4F1C978], "array", count);
}

- (BOOL)supportsUserPresets
{
  return 0;
}

- (AUParameterTree)parameterTree
{
  return self->_parameterTree;
}

- (void)setParameterTree:(AUParameterTree *)parameterTree
{
}

- (void)internalDeallocateRenderResources
{
  UInt32 v23 = (char *)&self->_realtimeState.renderObserverList.mObservers.mActiveList.mHead + 4;
  LOBYTE(v24) = 1;
  caulk::pooled_semaphore_mutex::_lock((caulk::pooled_semaphore_mutex *)((char *)&self->_realtimeState.renderObserverList.mObservers.mActiveList.mHead
                                                                       + 4));
  AUEventSchedule::uninitialize((AUEventSchedule *)&self->_realtimeState.eventSchedule.mScheduledParameterRefresher);
  MIDIProtocolID v3 = [(AUAudioUnit *)self scheduledParameterRefresher];
  unsigned __int8 v4 = self;
  AUScheduledParameterRefresher::performPendingMessages((AUScheduledParameterRefresher *)v3);
  v25.__m_ = (std::unique_lock<std::mutex>::mutex_type *)(v3 + 368);
  v25.__owns_ = 1;
  std::mutex::lock((std::mutex *)(v3 + 368));
  unint64_t v5 = atomic_load((unint64_t *)v3 + 41);
  if (v5)
  {
    unint64_t SlotForKey = caulk::concurrent::guarded_lookup_hash_table<void *,int,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(void *)>>::table_impl::findSlotForKey((uint64_t *)v5, (uint64_t)v4);
    if (SlotForKey)
    {
      int v8 = v7;
      atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)(v5 + 8 * HIDWORD(SlotForKey) + 16));
      if (v7)
      {
        int v9 = atomic_load((unsigned int *)v3 + 84);
        if (v9 >= 1)
        {
          do
          {
            std::this_thread::sleep_for[abi:ne180100]<long long,std::ratio<1l,1000000l>>(50);
            int v10 = atomic_load((unsigned int *)v3 + 84);
          }
          while (v10 > 0);
        }
        if ((unsigned __int16)atomic_load(v8))
        {
          std::unique_lock<std::mutex>::unlock(&v25);
          while ((unsigned __int16)atomic_load(v8))
            std::this_thread::sleep_for[abi:ne180100]<long long,std::ratio<1l,1000000l>>(500);
          std::unique_lock<std::mutex>::lock(&v25);
          unint64_t v5 = atomic_load((unint64_t *)v3 + 41);
        }
        caulk::concurrent::guarded_lookup_hash_table<void *,int,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(void *)>>::element_t::release(v8);
        int v13 = *((_DWORD *)v3 + 80) - 1;
        *((_DWORD *)v3 + 80) = v13;
        if (v5)
        {
          unsigned int v14 = 16 * v13;
          unsigned int v15 = *(_DWORD *)(v5 + 8);
          if (v14 / v15 <= 2 && v15 >= 9) {
            caulk::concurrent::guarded_lookup_hash_table<void *,int,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(void *)>>::rehash((unint64_t *)v3 + 36, v15 >> 1);
          }
        }
      }
    }
  }
  caulk::concurrent::guarded_lookup_hash_table<void *,int,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(void *)>>::emptyReleasePool((uint64_t)(v3 + 288));
  if (v25.__owns_) {
    std::mutex::unlock(v25.__m_);
  }

  id transportStateBlock = v4->_transportStateBlock;
  v4->_id transportStateBlock = 0;

  id musicalContextBlock = v4->_musicalContextBlock;
  v4->_id musicalContextBlock = 0;

  id MIDIOutputEventBlock = v4->_MIDIOutputEventBlock;
  v4->_id MIDIOutputEventBlock = 0;

  id MIDIOutputEventListBlock = v4->_MIDIOutputEventListBlock;
  v4->_id MIDIOutputEventListBlock = 0;

  id MIDIOutputEventHostBlock = v4->_MIDIOutputEventHostBlock;
  v4->_id MIDIOutputEventHostBlock = 0;

  id MIDIOutputEventListHostBlock = v4->_MIDIOutputEventListHostBlock;
  v4->_id MIDIOutputEventListHostBlock = 0;

  std::unique_lock<caulk::pooled_semaphore_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v23);
}

- (void)deallocateRenderResources
{
  if (self->_renderResourcesAllocated)
  {
    self->_renderResourcesAllocated = 0;
    [(AUAudioUnit *)self internalDeallocateRenderResources];
  }
}

- (BOOL)allocateRenderResourcesAndReturnError:(NSError *)outError
{
  if (self->_renderResourcesAllocated) {
    return 1;
  }
  unsigned __int8 v4 = [(AUAudioUnit *)self outputBusses];
  unint64_t v5 = v4;
  uint64_t v6 = 0;
  if (v4 && [v4 count])
  {
    uint64_t v7 = [v5 objectAtIndexedSubscript:0];
    int v8 = [v7 format];
    [v8 sampleRate];
    uint64_t v6 = v9;
  }
  int v10 = [(AUAudioUnit *)self scheduledParameterRefresher];
  std::mutex::lock((std::mutex *)(v10 + 368));
  uint64_t v11 = (uint64_t *)atomic_load((unint64_t *)v10 + 41);
  int v12 = *((_DWORD *)v10 + 80) + 1;
  *((_DWORD *)v10 + 80) = v12;
  if (!v11)
  {
    unsigned int v15 = 8;
    goto LABEL_9;
  }
  unsigned int v13 = 16 * v12;
  unsigned int v14 = *((_DWORD *)v11 + 2);
  if (v13 / v14 >= 0xB)
  {
    unsigned int v15 = 2 * v14;
LABEL_9:
    uint64_t v11 = (uint64_t *)caulk::concurrent::guarded_lookup_hash_table<void *,int,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(void *)>>::rehash((unint64_t *)v10 + 36, v15);
  }
  if ((caulk::concurrent::guarded_lookup_hash_table<void *,int,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(void *)>>::table_impl::findSlotForKey(v11, (uint64_t)self) & 1) == 0)operator new(); {
  --*((_DWORD *)v10 + 80);
  }
  std::mutex::unlock((std::mutex *)(v10 + 368));
  long long v16 = [(AUAudioUnit *)self scheduledParameterRefresher];
  long long v17 = self;
  v17->_realtimeState.contextChangeGenerator.var0.__val_.mObserver = v17;
  uint64_t v18 = [(AUAudioUnit *)v17 renderBlock];
  uint64_t v19 = *(void **)&v17->_realtimeState.contextChangeGenerator.__engaged_;
  *(void *)&v17->_realtimeState.contextChangeGenerator.__engaged_ = v18;

  *(void *)&v17->_realtimeState.renderBlockType = v6;
  *(void *)v17->_realtimeState.eventSchedule.mAddedEventQueue.mDequeueHead.padding = v16;
  a_value = (int *)v17->_realtimeState.eventSchedule.mAddedEventQueue.mEnqueueHead.__a_.__a_value;
  if (a_value[24] <= 511)
  {
    do
      XAtomicPoolAllocator::allocChunk((XAtomicPoolAllocator *)a_value);
    while (a_value[24] < 512);
  }
  if (a_value[52] <= 511)
  {
    do
      XAtomicPoolAllocator::allocChunk((XAtomicPoolAllocator *)(a_value + 28));
    while (a_value[52] < 512);
  }
  if (a_value[80] <= 511)
  {
    do
      XAtomicPoolAllocator::allocChunk((XAtomicPoolAllocator *)(a_value + 56));
    while (a_value[80] < 512);
  }
  uint64_t v21 = *(void *)&v17->_anon_f8[8];
  do
  {
    _X2 = 0;
    _X5 = *(void *)&v17->_anon_f8[16];
    __asm { CASPAL          X4, X5, X2, X3, [X8] }
    _ZF = _X4 == v21;
    uint64_t v21 = _X4;
  }
  while (!_ZF);

  *(_DWORD *)&v17->_anon_f8[76] = [(AUAudioUnit *)v17 AudioUnitMIDIProtocol];
  self->_renderResourcesAllocated = 1;

  return 1;
}

- (void)removeRenderObserver:(void *)a3 userData:(void *)a4
{
  p_mPendingList = &self->_realtimeState.renderObserverList.mObservers.mPendingList;
  RenderObserver::RenderObserver(&v6, 0, 0, (uint64_t)a3, (uint64_t)a4);
  TThreadSafeList<RenderObserver>::deferred_remove((uint64_t)p_mPendingList, (uint64_t)&v6);
  id v5 = v7;
  id v7 = 0;
}

- (void)addRenderObserver:(void *)a3 userData:(void *)a4
{
  p_mPendingList = &self->_realtimeState.renderObserverList.mObservers.mPendingList;
  RenderObserver::RenderObserver(&v7, 0, 0, (uint64_t)a3, (uint64_t)a4);
  TThreadSafeList<RenderObserver>::deferred_add((uint64_t)p_mPendingList, (uint64_t)&v7);
  LOBYTE(self->_realtimeState.eventSchedule.mAUv2GetParameterSynchronizer) = 1;
  id v6 = v8;
  id v8 = 0;
}

- (void)removeRenderObserver:(NSInteger)token
{
  p_mPendingList = &self->_realtimeState.renderObserverList.mObservers.mPendingList;
  RenderObserver::RenderObserver(&v5, token, 0, 0, 0);
  TThreadSafeList<RenderObserver>::deferred_remove((uint64_t)p_mPendingList, (uint64_t)&v5);
  id v4 = v6;
  id v6 = 0;
}

- (NSInteger)tokenByAddingRenderObserver:(AURenderObserver)observer
{
  p_mPendingList = &self->_realtimeState.renderObserverList.mObservers.mPendingList;
  RenderObserver::RenderObserver(&v8, (int)(atomic_fetch_add_explicit(RenderObserverList::sToken, 1u, memory_order_relaxed) + 1), observer, 0, 0);
  TThreadSafeList<RenderObserver>::deferred_add((uint64_t)p_mPendingList, (uint64_t)&v8);
  LOBYTE(self->_realtimeState.eventSchedule.mAUv2GetParameterSynchronizer) = 1;
  NSInteger v6 = v8;
  id v5 = v9;
  id v9 = 0;

  return v6;
}

- (NSArray)MIDIOutputNames
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (AUMIDIEventListBlock)scheduleMIDIEventListBlock
{
  if (!self->_shouldUseMIDI2 || ![(AUAudioUnit *)self isMusicDeviceOrEffect])
  {
    uint64_t v7 = 0;
    goto LABEL_9;
  }
  p_realtimeState = &self->_realtimeState;
  if (!self->_renderResourcesAllocated)
  {
    MIDIProtocolID v4 = [(AUAudioUnit *)self AudioUnitMIDIProtocol];
    if (v4) {
      goto LABEL_5;
    }
LABEL_13:
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    id v14[2] = __41__AUAudioUnit_scheduleMIDIEventListBlock__block_invoke;
    void v14[3] = &__block_descriptor_40_e61_i28__0q8C16r__MIDIEventList_iI_1_MIDIEventPacket_QI_64I____20l;
    v14[4] = &self->_realtimeState;
    id v9 = _Block_copy(v14);
    uint64_t v7 = _Block_copy(v9);

    goto LABEL_9;
  }
  MIDIProtocolID v4 = *(_DWORD *)&self->_anon_f8[76];
  if (!v4) {
    goto LABEL_13;
  }
LABEL_5:
  id v5 = (std::__shared_weak_count *)operator new(0xB40uLL);
  v5->__shared_weak_owners_ = 0;
  v5->__shared_owners_ = 0;
  v5->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDFA2968;
  bzero(&v5[1], 0xB24uLL);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3321888768;
  aBlock[2] = __41__AUAudioUnit_scheduleMIDIEventListBlock__block_invoke_2;
  aBlock[3] = &__block_descriptor_60_ea8_32c55_ZTSNSt3__110shared_ptrIN4MIDI20DynamicMIDIConverterEEE_e61_i28__0q8C16r__MIDIEventList_iI_1_MIDIEventPacket_QI_64I____20l;
  void aBlock[4] = v5 + 1;
  uint64_t v11 = v5;
  atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  MIDIProtocolID v13 = v4;
  int v12 = p_realtimeState;
  NSInteger v6 = _Block_copy(aBlock);
  uint64_t v7 = _Block_copy(v6);

  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v5);
LABEL_9:
  return v7;
}

uint64_t __41__AUAudioUnit_scheduleMIDIEventListBlock__block_invoke(uint64_t a1, uint64_t a2, char a3, _DWORD *a4)
{
  v12[102] = *MEMORY[0x1E4F143B8];
  if (!a4) {
    return 4294967246;
  }
  *(void *)&long long v6 = *(void *)(a1 + 32);
  *((void *)&v6 + 1) = a2;
  LOBYTE(v7) = a3;
  NSInteger v8 = _ZN5caulk16inplace_functionIFvPKN4MIDI16LegacyPacketListEELm48ELm8ENS_23inplace_function_detail6vtableEE16k_wrapper_vtableIZZ41__AUAudioUnit_scheduleMIDIEventListBlock_EUb1_E3__3EE;
  long long v9 = v6;
  uint64_t v10 = v7;
  MIDI::MIDIPacketList_Deliverer::MIDIPacketList_Deliverer(v11, (uint64_t *)&v8);
  ((void (*)(long long *))v8[3])(&v9);
  MIDI::MIDIPacketList_Deliverer::operator()((uint64_t)v11, a4);
  v11[0] = &unk_1EDF95120;
  (*(void (**)(void *))(v11[1] + 24))(v12);
  ((void (*)(long long *))off_1EDF8BB00)(&v6);
  return 0;
}

uint64_t __41__AUAudioUnit_scheduleMIDIEventListBlock__block_invoke_2(uint64_t a1, uint64_t a2, char a3, MIDI::EventList *this)
{
  if (!this) {
    return 4294967246;
  }
  unsigned int v138 = 0;
  MIDIProtocolID v4 = *(_DWORD *)(a1 + 56);
  uint64_t v126 = *(void *)(a1 + 48);
  int v5 = *(_DWORD *)this;
  if (*(_DWORD *)this == v4)
  {
    int v6 = *((_DWORD *)this + 1);
    if (!v6) {
      return v138;
    }
    if (v6 == 1 && *((_DWORD *)this + 4) <= 0x40u)
    {
      uint64_t v7 = MIDI::EventList::size(this);
      NSInteger v8 = (MIDIProtocolID *)this;
      if (*((_DWORD *)this + 1))
      {
        unsigned int v9 = 0;
        uint64_t v10 = (unsigned int *)((char *)this + 8);
        uint64_t v11 = (unsigned int *)((char *)this + v7 + 8);
        do
        {
          if (v10 > v11) {
            unsigned int v138 = -50;
          }
          v156.protocol = *v8;
          v156.numPackets = 1;
          memcpy(v156.packet, v10, sizeof(v156.packet));
          AUEventSchedule::midiEventList((AUEventSchedule *)(v126 + 48), a2, a3, &v156);
          NSInteger v8 = (MIDIProtocolID *)this;
          v10 += v10[2] + 3;
          ++v9;
        }
        while (v9 < *((_DWORD *)this + 1));
      }
      return v138;
    }
    int v45 = 0;
    v46 = (char *)this + 8;
    v47 = (AUEventSchedule *)(v126 + 48);
    MIDIProtocolID protocola = *(_DWORD *)(a1 + 56);
LABEL_66:
    int v129 = v45;
    uint64_t v48 = *((unsigned int *)v46 + 2);
    v147 = v46 + 12;
    uint64_t v148 = v48;
    unsigned int v127 = v46;
    uint64_t v149 = *(void *)v46;
    uint64_t v150 = 0;
    unsigned int v49 = MIDIEventListInit(&evtlist, v4);
    *(void *)&long long v155 = 0;
    *(void *)words = 0;
    uint64_t v143 = 0;
    while (1)
    {
      int v50 = MIDI::EventList::PacketReader::read((uint64_t *)&v147, &v155, words);
      char v51 = v50;
      if (v50)
      {
        unsigned int v49 = MIDIEventListAdd(&evtlist, 0x114uLL, v49, v155, MIDI::UniversalPacket::word_sizes[(unint64_t)words[0] >> 28], words);
        if (!v49)
        {
          uint64_t v52 = MIDI::EventList::size((MIDI::EventList *)&evtlist);
          if (evtlist.numPackets)
          {
            UInt32 v53 = 0;
            packet = evtlist.packet;
            BOOL v55 = (MIDIEventPacket *)((char *)evtlist.packet + v52);
            do
            {
              if (packet > v55) {
                unsigned int v138 = -50;
              }
              v156.protocol = evtlist.protocol;
              v156.numPackets = 1;
              memcpy(v156.packet, packet, sizeof(v156.packet));
              AUEventSchedule::midiEventList(v47, a2, a3, &v156);
              packet = (MIDIEventPacket *)((char *)packet + 4 * packet->wordCount + 12);
              ++v53;
            }
            while (v53 < evtlist.numPackets);
          }
          memset(&evtlist, 0, sizeof(evtlist));
          unsigned int v56 = MIDIEventListInit(&evtlist, protocola);
          unsigned int v49 = MIDIEventListAdd(&evtlist, 0x114uLL, v56, v155, MIDI::UniversalPacket::word_sizes[(unint64_t)words[0] >> 28], words);
        }
      }
      else
      {
        if (!evtlist.numPackets || (uint64_t v57 = MIDI::EventList::size((MIDI::EventList *)&evtlist), !evtlist.numPackets))
        {
LABEL_82:
          v46 = &v127[4 * *((unsigned int *)v127 + 2) + 12];
          int v45 = v129 + 1;
          MIDIProtocolID v4 = protocola;
          if ((v129 + 1) >= *((_DWORD *)this + 1)) {
            return v138;
          }
          goto LABEL_66;
        }
        UInt32 v58 = 0;
        char v59 = evtlist.packet;
        uint64_t v60 = (MIDIEventPacket *)((char *)evtlist.packet + v57);
        do
        {
          if (v59 > v60) {
            unsigned int v138 = -50;
          }
          v156.protocol = evtlist.protocol;
          v156.numPackets = 1;
          memcpy(v156.packet, v59, sizeof(v156.packet));
          AUEventSchedule::midiEventList(v47, a2, a3, &v156);
          char v59 = (MIDIEventPacket *)((char *)v59 + 4 * v59->wordCount + 12);
          ++v58;
        }
        while (v58 < evtlist.numPackets);
      }
      if ((v51 & 1) == 0) {
        goto LABEL_82;
      }
    }
  }
  MIDIProtocolID v13 = *(_DWORD **)(a1 + 32);
  if (v4 == kMIDIProtocol_2_0 && v5 == 1)
  {
    if (!*((_DWORD *)this + 1)) {
      return v138;
    }
    int v61 = 0;
    char v62 = (char *)this + 8;
    protocolb = *(_DWORD **)(a1 + 32);
    uint64_t v125 = v13 + 4;
    while (1)
    {
      int v130 = v61;
      uint64_t v63 = *((unsigned int *)v62 + 2);
      v147 = v62 + 12;
      uint64_t v148 = v63;
      unsigned int v128 = v62;
      uint64_t v149 = *(void *)v62;
      uint64_t v150 = 0;
      *(void *)words = v126;
      uint64_t v143 = a2;
      unsigned __int8 v144 = a3;
      *(_DWORD *)v145 = *(_DWORD *)v137;
      *(_DWORD *)&v145[3] = *(_DWORD *)&v137[3];
      v146 = &v138;
      int v141 = 2;
      v153 = MIDIEventListInit(&evtlist, kMIDIProtocol_2_0);
      uint64_t v140 = 0;
      long long v139 = 0uLL;
      while (1)
      {
        int v64 = MIDI::EventList::PacketReader::read((uint64_t *)&v147, &v140, &v139);
        char v65 = v64;
        if (!v64) {
          break;
        }
        *(void *)&v156.protocol = &v153;
        v156.packet[0].timeStamp = (MIDITimeStamp)&evtlist;
        *(void *)&v156.packet[0].wordCount = &v140;
        *(void *)&v156.packet[0].words[1] = words;
        *(void *)&v156.packet[0].words[3] = &v141;
        unint64_t v66 = v139;
        if (v139 >> 28 != 2)
        {
          UInt32 v82 = (UInt32 *)&v139;
LABEL_126:
          _ZZN4MIDI27readUMPToSegmentedEventListINS_22MIDI_1_to_2_TranslatorENS_9EventList12PacketReaderEZZ41__AUAudioUnit_scheduleMIDIEventListBlock_EUb2_E3__4EEv14MIDIProtocolIDRT_RT0_T1_ENKUlRKNS_15UniversalPacketEE_clESD_((uint64_t)&v156, v82);
          goto LABEL_127;
        }
        *(void *)v151 = 0;
        uint64_t v152 = 0;
        int v67 = BYTE2(v139);
        int v68 = *((unsigned __int8 *)v13 + 32);
        int v69 = *v13;
        int v70 = BYTE2(v139) >> 4;
        if (!*((unsigned char *)v13 + 32))
        {
          if ((v69 & 0xFF0000) != 0)
          {
            if (((v69 ^ v139) & 0xF0000) != 0)
            {
              int v68 = 1;
              *((unsigned char *)v13 + 32) = 1;
              goto LABEL_90;
            }
            if (v70 != 11)
            {
              int v68 = (v69 & 0xDF00) != 0 || v70 != 12;
              goto LABEL_90;
            }
            switch(BYTE1(v69))
            {
              case 'b':
                int v103 = v139 & 0xFF00;
                int v104 = 25344;
                goto LABEL_200;
              case 'c':
                int v103 = v139 & 0xFF00;
                int v104 = 25088;
                goto LABEL_200;
              case 'd':
                int v103 = v139 & 0xFF00;
                int v104 = 25856;
                goto LABEL_200;
              case 'e':
                int v103 = v139 & 0xFF00;
                int v104 = 25600;
LABEL_200:
                if (v103 != v104 && (v139 & 0xF0DF00) != 0xB00600) {
                  break;
                }
                goto LABEL_204;
              default:
                if (BYTE1(v69) == 32)
                {
                  if ((v139 & 0xFF00) != 0) {
                    break;
                  }
LABEL_204:
                  int v68 = 0;
                  *uint64_t v125 = v139;
                  goto LABEL_90;
                }
                if (!BYTE1(v69) && (v139 & 0xFF00) == 0x2000) {
                  goto LABEL_204;
                }
                break;
            }
          }
          else
          {
            int v68 = 1;
            if ((v139 & 0xF00000) != 0xB00000 || v70 != 11) {
              goto LABEL_90;
            }
            if (BYTE1(v139) - 98 < 4 || BYTE1(v139) == 32 || !BYTE1(v139))
            {
              int v68 = 0;
              *(_OWORD *)MIDIProtocolID v13 = v139;
              int v69 = *v13;
              goto LABEL_90;
            }
          }
          int v68 = 1;
        }
LABEL_90:
        uint64_t v71 = BYTE3(v66) & 0xF;
        unsigned int v72 = BYTE3(v66) & 0xF | 0x40;
        if (BYTE2(v69) && v68)
        {
          *((unsigned char *)v13 + 32) = 1;
          *((void *)&v155 + 1) = 0;
          LODWORD(v155) = v69 & 0xFF00 | (BYTE2(v69) << 16) & 0x80FFFFFF | ((BYTE3(v66) & 0xF | 0x40) << 24);
          unsigned int v73 = v69;
          int v74 = v69 << 25;
          if (v73 >= 0x41 && (unsigned int v75 = (v73 & 0x3F) << 19) != 0)
          {
            int v76 = BYTE2(v66) >> 4;
            do
            {
              v74 |= v75;
              BOOL v77 = v75 > 0x3F;
              v75 >>= 6;
            }
            while (v77);
          }
          else
          {
            int v76 = BYTE2(v66) >> 4;
          }
          DWORD1(v155) = v74;
          _ZZN4MIDI27readUMPToSegmentedEventListINS_22MIDI_1_to_2_TranslatorENS_9EventList12PacketReaderEZZ41__AUAudioUnit_scheduleMIDIEventListBlock_EUb2_E3__4EEv14MIDIProtocolIDRT_RT0_T1_ENKUlRKNS_15UniversalPacketEE_clESD_((uint64_t)&v156, (UInt32 *)&v155);
          _DWORD *protocolb = 0;
          *((void *)&v155 + 1) = 0;
          int v83 = protocolb[4];
          if (BYTE2(v83))
          {
            LODWORD(v155) = protocolb[4] & 0xFF00 | (BYTE2(protocolb[4]) << 16) | (v72 << 24);
            unsigned int v84 = v83;
            int v85 = v83 << 25;
            BOOL v86 = v84 >= 0x41;
            unsigned int v87 = (v84 & 0x3F) << 19;
            if (v86 && v87 != 0)
            {
              do
              {
                v85 |= v87;
                BOOL v77 = v87 > 0x3F;
                v87 >>= 6;
              }
              while (v77);
            }
            DWORD1(v155) = v85;
            _ZZN4MIDI27readUMPToSegmentedEventListINS_22MIDI_1_to_2_TranslatorENS_9EventList12PacketReaderEZZ41__AUAudioUnit_scheduleMIDIEventListBlock_EUb2_E3__4EEv14MIDIProtocolIDRT_RT0_T1_ENKUlRKNS_15UniversalPacketEE_clESD_((uint64_t)&v156, (UInt32 *)&v155);
            *(_DWORD *)uint64_t v125 = 0;
          }
          *(void *)((char *)&protocolb[32 * v71 + 8 + 2 * ((v66 >> 16) & 0xF)] + 1) = 0;
          int v70 = v76;
          MIDIProtocolID v13 = protocolb;
        }
        unsigned int v89 = (v66 >> 8) & 0x7F;
        unsigned int v90 = v66 & 0x7F;
        switch(v70)
        {
          case 8:
            goto LABEL_120;
          case 9:
            if ((v66 & 0x7F) == 0)
            {
              int v67 = BYTE2(v66) - 16;
              unsigned int v90 = 64;
            }
LABEL_120:
            v151[0] = (v72 << 24) | (v67 << 16) | (v89 << 8);
            unsigned int v91 = v90 << 9;
            if (v90 >= 0x41)
            {
              unsigned int v92 = 8 * (v90 & 0x3F);
              if (v92)
              {
                do
                {
                  v91 |= v92;
                  BOOL v77 = v92 > 0x3F;
                  v92 >>= 6;
                }
                while (v77);
              }
            }
            UInt32 v93 = v91 << 16;
            goto LABEL_124;
          case 10:
            v151[0] = (BYTE2(v66) << 16) | (v72 << 24) | (v89 << 8);
            UInt32 v93 = v66 << 25;
            if (v90 >= 0x41)
            {
              unsigned int v94 = (v66 & 0x3F) << 19;
              if (v94)
              {
                do
                {
                  v93 |= v94;
                  BOOL v77 = v94 > 0x3F;
                  v94 >>= 6;
                }
                while (v77);
              }
            }
            goto LABEL_124;
          case 11:
            uint64_t v95 = (uint64_t)&v13[32 * v71 + 8] + 1;
            uint64_t v96 = (v66 >> 16) & 0xF;
            if (((v66 >> 8) & 0x7F) > 0x25)
            {
              switch(v89)
              {
                case 'b':
                  uint64_t v105 = v95 + 8 * v96;
                  *(unsigned char *)(v105 + 1) = 2;
                  goto LABEL_189;
                case 'c':
                  uint64_t v115 = v95 + 8 * v96;
                  *(unsigned char *)(v115 + 1) = 2;
                  goto LABEL_191;
                case 'd':
                  uint64_t v105 = v95 + 8 * v96;
                  *(unsigned char *)(v105 + 1) = 1;
LABEL_189:
                  *(unsigned char *)(v105 + 5) = v90;
                  break;
                case 'e':
                  uint64_t v115 = v95 + 8 * v96;
                  *(unsigned char *)(v115 + 1) = 1;
LABEL_191:
                  *(unsigned char *)(v115 + 4) = v90;
                  break;
                default:
                  if (v89 != 38) {
                    goto LABEL_193;
                  }
                  char v107 = v66 & 0x7F;
                  int v108 = v66 & 0x7F;
                  goto LABEL_178;
              }
            }
            else
            {
              if (v89)
              {
                if (v89 == 6)
                {
                  char v107 = 0;
                  int v108 = 0;
                  *(unsigned char *)(v95 + 8 * v96 + 6) = v90;
LABEL_178:
                  uint64_t v109 = v95 + 8 * v96;
                  *(unsigned char *)(v109 + 7) = v107;
                  if (*((unsigned char *)v13 + 32) || !*(unsigned char *)(v109 + 1))
                  {
LABEL_193:
                    v151[0] = (BYTE2(v66) << 16) | (v72 << 24) | (v89 << 8);
                    UInt32 v93 = v66 << 25;
                    if (v90 >= 0x41)
                    {
                      unsigned int v116 = (v66 & 0x3F) << 19;
                      if (v116)
                      {
                        do
                        {
                          v93 |= v116;
                          BOOL v77 = v116 > 0x3F;
                          v116 >>= 6;
                        }
                        while (v77);
                      }
                    }
LABEL_124:
                    v151[1] = v93;
                  }
                  else
                  {
                    if (*(unsigned char *)(v109 + 1) == 1) {
                      int v110 = 32;
                    }
                    else {
                      int v110 = 48;
                    }
                    unsigned int v111 = (unsigned __int8 *)(v95 + 8 * v96);
                    v151[0] = (v72 << 24) | ((v110 | v96) << 16) | (v111[4] << 8) | v111[5];
                    unsigned int v112 = v108 | (v111[6] << 7);
                    UInt32 v113 = v112 << 18;
                    if (v112 > 0x2000)
                    {
                      for (unsigned int i = 32 * (v112 & 0x1FFF); i; i >>= 13)
                        v113 |= i;
                    }
                    v151[1] = v113;
LABEL_146:
                    *(_OWORD *)MIDIProtocolID v13 = 0u;
                    *((_OWORD *)v13 + 1) = 0u;
                  }
LABEL_125:
                  UInt32 v82 = v151;
                  goto LABEL_126;
                }
                if (v89 != 32) {
                  goto LABEL_193;
                }
                *(unsigned char *)(v95 + 8 * v96 + 3) = v90;
              }
              else
              {
                *(unsigned char *)(v95 + 8 * v96 + 2) = v90;
              }
              *(unsigned char *)(v95 + 8 * v96) = 1;
            }
            if (*((unsigned char *)v13 + 32)) {
              goto LABEL_193;
            }
            break;
          case 12:
            long long v97 = &v13[32 * v71 + 2 * (WORD1(v66) & 0xF)];
            if (v97[33]) {
              char v98 = *((unsigned char *)v13 + 32) ^ 1;
            }
            else {
              char v98 = 0;
            }
            BYTE2(v151[0]) = BYTE2(v66);
            HIBYTE(v151[0]) = BYTE3(v66) & 0xF | 0x40;
            LOBYTE(v151[0]) = v98;
            HIBYTE(v151[1]) = BYTE1(v66) & 0x7F;
            BYTE1(v151[1]) = v97[35];
            LOBYTE(v151[1]) = v97[36];
            *(void *)(v97 + 33) = 0;
            goto LABEL_146;
          case 13:
            BYTE2(v151[0]) = BYTE2(v66);
            HIBYTE(v151[0]) = BYTE3(v66) & 0xF | 0x40;
            unsigned int v99 = v66 >> 8 << 25;
            if (v89 >= 0x41)
            {
              unsigned int v100 = ((v66 >> 8) & 0x3F) << 19;
              if (v100)
              {
                do
                {
                  v99 |= v100;
                  BOOL v77 = v100 > 0x3F;
                  v100 >>= 6;
                }
                while (v77);
              }
            }
            v151[1] = v99;
            goto LABEL_125;
          case 14:
            BYTE2(v151[0]) = BYTE2(v66);
            HIBYTE(v151[0]) = BYTE3(v66) & 0xF | 0x40;
            unsigned int v101 = v89 | (v90 << 7);
            UInt32 v93 = v101 << 18;
            if (v101 > 0x2000)
            {
              for (unsigned int j = 32 * (v101 & 0x1FFF); j; j >>= 13)
                v93 |= j;
            }
            goto LABEL_124;
          default:
            goto LABEL_125;
        }
LABEL_127:
        if ((v65 & 1) == 0) {
          goto LABEL_205;
        }
      }
      if (evtlist.numPackets)
      {
        uint64_t v78 = MIDI::EventList::size((MIDI::EventList *)&evtlist);
        if (evtlist.numPackets)
        {
          UInt32 v79 = 0;
          unsigned int v80 = evtlist.packet;
          unsigned int v81 = (MIDIEventPacket *)((char *)evtlist.packet + v78);
          do
          {
            if (v80 > v81) {
              unsigned int *v146 = -50;
            }
            v156.protocol = evtlist.protocol;
            v156.numPackets = 1;
            memcpy(v156.packet, v80, sizeof(v156.packet));
            AUEventSchedule::midiEventList((AUEventSchedule *)(*(void *)words + 48), v143, v144, &v156);
            unsigned int v80 = (MIDIEventPacket *)((char *)v80 + 4 * v80->wordCount + 12);
            ++v79;
          }
          while (v79 < evtlist.numPackets);
          goto LABEL_127;
        }
      }
LABEL_205:
      char v62 = &v128[4 * *((unsigned int *)v128 + 2) + 12];
      int v61 = v130 + 1;
      if ((v130 + 1) >= *((_DWORD *)this + 1)) {
        return v138;
      }
    }
  }
  BOOL v15 = v4 == kMIDIProtocol_1_0 && v5 == 2;
  if (v15 && *((_DWORD *)this + 1))
  {
    int v16 = 0;
    long long v17 = (char *)this + 8;
    uint64_t v118 = v13 + 521;
    while (1)
    {
      uint64_t v18 = *((unsigned int *)v17 + 2);
      v147 = v17 + 12;
      uint64_t v148 = v18;
      *(void *)protocol = v17;
      uint64_t v149 = *(void *)v17;
      uint64_t v150 = 0;
      *(void *)words = v126;
      uint64_t v143 = a2;
      unsigned __int8 v144 = a3;
      *(_DWORD *)v145 = *(_DWORD *)v137;
      *(_DWORD *)&v145[3] = *(_DWORD *)&v137[3];
      v146 = &v138;
      LODWORD(v140) = 1;
      *(void *)&long long v139 = MIDIEventListInit(&evtlist, kMIDIProtocol_1_0);
      uint64_t v152 = 0;
      v153 = 0;
      *(void *)v151 = 0;
      while (1)
      {
        int v19 = MIDI::EventList::PacketReader::read((uint64_t *)&v147, &v153, v151);
        char v20 = v19;
        if (!v19) {
          break;
        }
        *(void *)&v156.protocol = &v139;
        v156.packet[0].timeStamp = (MIDITimeStamp)&evtlist;
        *(void *)&v156.packet[0].wordCount = &v153;
        *(void *)&v156.packet[0].words[1] = words;
        *(void *)&v156.packet[0].words[3] = &v140;
        if (((1 << (v151[0] >> 28)) & 0xA02F) != 0)
        {
          uint64_t v21 = v151;
LABEL_28:
          _ZZN4MIDI27readUMPToSegmentedEventListINS_22MIDI_1_to_2_TranslatorENS_9EventList12PacketReaderEZZ41__AUAudioUnit_scheduleMIDIEventListBlock_EUb2_E3__4EEv14MIDIProtocolIDRT_RT0_T1_ENKUlRKNS_15UniversalPacketEE_clESD_((uint64_t)&v156, v21);
        }
        else if (v151[0] >> 28 == 4)
        {
          UInt32 v26 = HIBYTE(v151[0]) & 0xF | 0x20;
          UInt32 v27 = v151[1];
          switch(BYTE2(v151[0]) >> 4)
          {
            case 2:
            case 3:
              long long v30 = &v118[12 * (HIBYTE(v151[0]) & 0xF)];
              unint64_t v31 = ((unint64_t)v151[0] >> 16) & 0xF;
              int v32 = (unsigned __int8 *)v30 + 3 * v31;
              UInt32 v33 = (v151[0] >> 8) & 0x7F;
              int v34 = v151[0] & 0x7F;
              if ((v151[0] & 0x100000) != 0) {
                int v35 = 2;
              }
              else {
                int v35 = 1;
              }
              if (v35 == *v32 && v33 == v32[1])
              {
                int v36 = v31 | 0xB0;
                if (v34 == *((unsigned __int8 *)v30 + 3 * v31 + 2))
                {
                  int v37 = (v36 << 16) | (v26 << 24);
                  goto LABEL_54;
                }
              }
              else
              {
                int v36 = v31 | 0xB0;
              }
              if ((v151[0] & 0x100000) != 0) {
                int v38 = 25344;
              }
              else {
                int v38 = 25856;
              }
              int v124 = (v26 << 24) | (v36 << 16);
              int v39 = v38 | v124;
              long long v155 = v38 | v124 | v33;
              unint64_t v121 = ((unint64_t)v151[0] >> 16) & 0xF;
              uint64_t v122 = &v118[12 * (HIBYTE(v151[0]) & 0xF)];
              char v123 = BYTE1(v151[0]) & 0x7F;
              int v120 = (char *)v30 + 3 * v31;
              char v119 = v35;
              _ZZN4MIDI27readUMPToSegmentedEventListINS_22MIDI_1_to_2_TranslatorENS_9EventList12PacketReaderEZZ41__AUAudioUnit_scheduleMIDIEventListBlock_EUb2_E3__4EEv14MIDIProtocolIDRT_RT0_T1_ENKUlRKNS_15UniversalPacketEE_clESD_((uint64_t)&v156, (UInt32 *)&v155);
              long long v155 = (v39 | v34) - 256;
              _ZZN4MIDI27readUMPToSegmentedEventListINS_22MIDI_1_to_2_TranslatorENS_9EventList12PacketReaderEZZ41__AUAudioUnit_scheduleMIDIEventListBlock_EUb2_E3__4EEv14MIDIProtocolIDRT_RT0_T1_ENKUlRKNS_15UniversalPacketEE_clESD_((uint64_t)&v156, (UInt32 *)&v155);
              *int v120 = v119;
              uint64_t v40 = (uint64_t)v122 + 3 * v121;
              *(unsigned char *)(v40 + 1) = v123;
              *(unsigned char *)(v40 + 2) = v34;
              int v37 = v124;
LABEL_54:
              int v41 = (v27 >> 18) & 0x7F;
              long long v155 = v37 | (v27 >> 25) | 0x600;
              _ZZN4MIDI27readUMPToSegmentedEventListINS_22MIDI_1_to_2_TranslatorENS_9EventList12PacketReaderEZZ41__AUAudioUnit_scheduleMIDIEventListBlock_EUb2_E3__4EEv14MIDIProtocolIDRT_RT0_T1_ENKUlRKNS_15UniversalPacketEE_clESD_((uint64_t)&v156, (UInt32 *)&v155);
              if (v41)
              {
                HIDWORD(v155) = 0;
                *(void *)((char *)&v155 + 4) = 0;
                UInt32 v29 = v41 | v37 | 0x2600;
                goto LABEL_60;
              }
              break;
            case 8:
            case 9:
            case 10:
            case 11:
              UInt32 v28 = BYTE2(v151[0]) >> 4 == 9;
              if (v151[1] >> 25) {
                UInt32 v28 = v151[1] >> 25;
              }
              HIDWORD(v155) = 0;
              *(void *)((char *)&v155 + 4) = 0;
              UInt32 v29 = v28 | (BYTE2(v151[0]) << 16) | (v26 << 24) | v151[0] & 0x7F00;
              goto LABEL_60;
            case 12:
              int v117 = v16;
              UInt32 v42 = v26 << 24;
              int v43 = BYTE2(v151[0]) << 16;
              if (v151[0])
              {
                int v44 = (v43 - 0x100000) | (v26 << 24);
                long long v155 = (v43 - 0x100000) & 0xFFFFFF80 | (v26 << 24) | (v151[1] >> 8) & 0x7F;
                _ZZN4MIDI27readUMPToSegmentedEventListINS_22MIDI_1_to_2_TranslatorENS_9EventList12PacketReaderEZZ41__AUAudioUnit_scheduleMIDIEventListBlock_EUb2_E3__4EEv14MIDIProtocolIDRT_RT0_T1_ENKUlRKNS_15UniversalPacketEE_clESD_((uint64_t)&v156, (UInt32 *)&v155);
                long long v155 = v44 & 0xFFFFFF80 | v27 & 0x7F | 0x2000;
                _ZZN4MIDI27readUMPToSegmentedEventListINS_22MIDI_1_to_2_TranslatorENS_9EventList12PacketReaderEZZ41__AUAudioUnit_scheduleMIDIEventListBlock_EUb2_E3__4EEv14MIDIProtocolIDRT_RT0_T1_ENKUlRKNS_15UniversalPacketEE_clESD_((uint64_t)&v156, (UInt32 *)&v155);
              }
              long long v155 = v43 | v42 | HIWORD(v27) & 0x7F00;
              _ZZN4MIDI27readUMPToSegmentedEventListINS_22MIDI_1_to_2_TranslatorENS_9EventList12PacketReaderEZZ41__AUAudioUnit_scheduleMIDIEventListBlock_EUb2_E3__4EEv14MIDIProtocolIDRT_RT0_T1_ENKUlRKNS_15UniversalPacketEE_clESD_((uint64_t)&v156, (UInt32 *)&v155);
              int v16 = v117;
              break;
            case 13:
              HIDWORD(v155) = 0;
              *(void *)((char *)&v155 + 4) = 0;
              UInt32 v29 = (BYTE2(v151[0]) << 16) | (v26 << 24) | (v151[1] >> 25 << 8);
              goto LABEL_60;
            case 14:
              HIDWORD(v155) = 0;
              *(void *)((char *)&v155 + 4) = 0;
              UInt32 v29 = (v151[1] >> 10) & 0x7F00 | (BYTE2(v151[0]) << 16) | (v26 << 24) | (v151[1] >> 25);
LABEL_60:
              LODWORD(v155) = v29;
              uint64_t v21 = (UInt32 *)&v155;
              goto LABEL_28;
            default:
              break;
          }
        }
LABEL_35:
        if ((v20 & 1) == 0) {
          goto LABEL_63;
        }
      }
      if (evtlist.numPackets)
      {
        uint64_t v22 = MIDI::EventList::size((MIDI::EventList *)&evtlist);
        if (evtlist.numPackets) {
          break;
        }
      }
LABEL_63:
      long long v17 = (char *)(*(void *)protocol + 4 * *(unsigned int *)(*(void *)protocol + 8) + 12);
      if (++v16 >= *((_DWORD *)this + 1)) {
        return v138;
      }
    }
    UInt32 v23 = 0;
    uint64_t v24 = evtlist.packet;
    std::unique_lock<std::mutex> v25 = (MIDIEventPacket *)((char *)evtlist.packet + v22);
    do
    {
      if (v24 > v25) {
        unsigned int *v146 = -50;
      }
      v156.protocol = evtlist.protocol;
      v156.numPackets = 1;
      memcpy(v156.packet, v24, sizeof(v156.packet));
      AUEventSchedule::midiEventList((AUEventSchedule *)(*(void *)words + 48), v143, v144, &v156);
      uint64_t v24 = (MIDIEventPacket *)((char *)v24 + 4 * v24->wordCount + 12);
      ++v23;
    }
    while (v23 < evtlist.numPackets);
    goto LABEL_35;
  }
  return v138;
}

- (AUScheduleMIDIEventBlock)scheduleMIDIEventBlock
{
  if (![(AUAudioUnit *)self isMusicDeviceOrEffect])
  {
    int v5 = 0;
    goto LABEL_18;
  }
  p_realtimeState = &self->_realtimeState;
  if (self->_renderResourcesAllocated) {
    MIDIProtocolID v4 = *(_DWORD *)&self->_anon_f8[76];
  }
  else {
    MIDIProtocolID v4 = [(AUAudioUnit *)self AudioUnitMIDIProtocol];
  }
  if (self->_shouldUseMIDI2 && v4)
  {
    if (v4 == kMIDIProtocol_2_0)
    {
      int v6 = (std::__shared_weak_count *)operator new(0x840uLL);
      v6->__shared_weak_owners_ = 0;
      v6->__shared_owners_ = 0;
      v6->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDFA2930;
      bzero(&v6[1], 0x824uLL);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3321888768;
      v10[2] = __37__AUAudioUnit_scheduleMIDIEventBlock__block_invoke_29;
      v10[3] = &__block_descriptor_56_ea8_32c85_ZTSNSt3__110shared_ptrIN4MIDI19LegacyMIDIConverterINS1_22MIDI_1_to_2_TranslatorEEEEE_e18_v36__0q8C16q20r_28l;
      v10[4] = v6 + 1;
      uint64_t v11 = v6;
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
      int v12 = p_realtimeState;
      uint64_t v7 = _Block_copy(v10);
      NSInteger v8 = v11;
      if (!v11)
      {
LABEL_15:
        std::__shared_weak_count::__release_shared[abi:ne180100](v6);
        goto LABEL_17;
      }
    }
    else
    {
      if (v4 != kMIDIProtocol_1_0)
      {
        uint64_t v7 = &__block_literal_global_6696;
        goto LABEL_17;
      }
      int v6 = (std::__shared_weak_count *)operator new(0x20uLL);
      v6->__shared_weak_owners_ = 0;
      v6->__shared_owners_ = 0;
      v6->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDFA28F8;
      LOBYTE(v6[1].__vftable) = 0;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3321888768;
      aBlock[2] = __37__AUAudioUnit_scheduleMIDIEventBlock__block_invoke_2;
      aBlock[3] = &__block_descriptor_56_ea8_32c81_ZTSNSt3__110shared_ptrIN4MIDI19LegacyMIDIConverterINS1_18IdentityTranslatorEEEEE_e18_v36__0q8C16q20r_28l;
      void aBlock[4] = v6 + 1;
      unsigned int v14 = v6;
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
      BOOL v15 = p_realtimeState;
      uint64_t v7 = _Block_copy(aBlock);
      NSInteger v8 = v14;
      if (!v14) {
        goto LABEL_15;
      }
    }
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    goto LABEL_15;
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __37__AUAudioUnit_scheduleMIDIEventBlock__block_invoke;
  v16[3] = &__block_descriptor_40_e18_v36__0q8C16q20r_28l;
  v16[4] = &self->_realtimeState;
  uint64_t v7 = _Block_copy(v16);
LABEL_17:
  int v5 = _Block_copy(v7);

LABEL_18:
  return v5;
}

AUEventSchedule *__37__AUAudioUnit_scheduleMIDIEventBlock__block_invoke(uint64_t a1, uint64_t a2, char a3, int64_t a4, AUEventSchedule *a5)
{
  return AUEventSchedule::midiEvents((AUEventSchedule *)(*(void *)(a1 + 32) + 48), a2, a3, a4, a5);
}

uint64_t __37__AUAudioUnit_scheduleMIDIEventBlock__block_invoke_2(uint64_t a1, uint64_t a2, char a3, unsigned int a4, uint64_t a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v7 = _ZN5caulk16inplace_functionIFvPKN4MIDI9EventListEELm48ELm8ENS_23inplace_function_detail6vtableEE16k_wrapper_vtableIZZ37__AUAudioUnit_scheduleMIDIEventBlock_EUb_E3__1EE;
  v8[0] = v5;
  v8[1] = a2;
  char v9 = a3;
  MIDI::LegacyMIDIConverter<MIDI::IdentityTranslator>::convertLegacyDataToEventList(a5, a4, 0, (uint64_t *)&v7);
  return ((uint64_t (*)(void *))v7[3])(v8);
}

uint64_t __37__AUAudioUnit_scheduleMIDIEventBlock__block_invoke_29(uint64_t a1, uint64_t a2, char a3, unsigned int a4, uint64_t a5)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(int **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  NSInteger v8 = _ZN5caulk16inplace_functionIFvPKN4MIDI9EventListEELm48ELm8ENS_23inplace_function_detail6vtableEE16k_wrapper_vtableIZZ37__AUAudioUnit_scheduleMIDIEventBlock_EUb0_E3__2EE;
  v9[0] = v6;
  v9[1] = a2;
  char v10 = a3;
  MIDI::LegacyMIDIConverter<MIDI::MIDI_1_to_2_Translator>::convertLegacyDataToEventList(v5, a5, a4, 0, (uint64_t *)&v8);
  return ((uint64_t (*)(void *))v8[3])(v9);
}

- (BOOL)isMusicDeviceOrEffect
{
  OSType componentType = self->_componentDescription.componentType;
  BOOL result = 1;
  if ((componentType - 1635085670 > 0xF || ((1 << (componentType - 102)) & 0x8009) == 0)
    && componentType != 1635086953
    && componentType != 1635086957)
  {
    return 0;
  }
  return result;
}

- (float)getV2Parameter:(unint64_t)a3 sequenceNumber:(unsigned int)a4
{
  if (a4)
  {
    unint64_t explicit = *(void *)&self->_anon_f8[24];
    if (HIDWORD(explicit)) {
LABEL_14:
    }
      std::terminate();
    uint64_t v7 = *(void *)&a4;
    if ((int)(explicit - a4) < 0)
    {
      unint64_t v8 = 0;
      do
      {
        unint64_t v9 = explicit | (unint64_t)(v7 << 32);
        unint64_t v10 = v8 & 0xFFFFFFFF00000000 | explicit;
        unint64_t explicit = v10;
        atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_anon_f8[24], &explicit, v9);
        if (explicit == v10)
        {
          caulk::semaphore::timed_wait((caulk::semaphore *)&self->_anon_f8[32], -1.0);
          unint64_t explicit = atomic_load_explicit((atomic_ullong *volatile)&self->_anon_f8[24], memory_order_acquire);
          unint64_t v8 = HIDWORD(explicit);
          if (HIDWORD(explicit)) {
            goto LABEL_14;
          }
        }
        else
        {
          unint64_t v8 = explicit & 0xFFFFFFFF00000000;
        }
      }
      while ((int)explicit - (int)v7 < 0);
    }
  }
  uint64_t v11 = [(AUAudioUnit *)self parameterTree];
  int v12 = [v11 parameterWithAddress:a3];

  if (v12)
  {
    [v12 setLocalValueStale:1];
    [v12 value];
    float v14 = v13;
  }
  else
  {
    float v14 = 0.0;
  }

  return v14;
}

- (void)setV2Parameter:(unint64_t)a3 value:(float)a4 bufferOffset:(unsigned int)a5 sequenceNumber:(unsigned int)a6
{
  unint64_t v10 = a5 | 0xFFFFFFFE00000000;
  uint64_t v11 = (char *)XAtomicPoolAllocator::alloc((XAtomicPoolAllocator *)self->_realtimeState.eventSchedule.mAddedEventQueue.mEnqueueHead.__a_.__a_value);
  *(void *)uint64_t v11 = 0;
  *((void *)v11 + 1) = v10;
  v11[16] = 1;
  *(_DWORD *)(v11 + 17) = 0;
  *((_DWORD *)v11 + 5) = 0;
  *((void *)v11 + 3) = a3;
  *((float *)v11 + 8) = a4;
  *((_DWORD *)v11 + 9) = a6;
  *((void *)v11 + 5) = pthread_self();
  unint64_t v12 = *(void *)&self->_realtimeState.eventSchedule.mAddedEventQueue.mDequeueHead.padding[8];
  atomic_store(v12, (unint64_t *)v11);
  unint64_t v13 = v12;
  atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_realtimeState.eventSchedule.mAddedEventQueue.mDequeueHead.padding[8], &v13, (unint64_t)v11);
  if (v13 != v12)
  {
    unint64_t v14 = v13;
    do
    {
      atomic_store(v13, (unint64_t *)v11);
      atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_realtimeState.eventSchedule.mAddedEventQueue.mDequeueHead.padding[8], &v14, (unint64_t)v11);
      BOOL v15 = v14 == v13;
      unint64_t v13 = v14;
    }
    while (!v15);
  }
  if ((atomic_exchange((atomic_uchar *volatile)&self->_realtimeState.auv2GetParameterSynchronizer, 1u) & 1) == 0)
  {
    p_mScheduledParameterRefresher = &self->_realtimeState.eventSchedule.mScheduledParameterRefresher;
    uint64_t v17 = *(void *)self->_realtimeState.eventSchedule.mAddedEventQueue.mDequeueHead.padding;
    id mObserver = self->_realtimeState.contextChangeGenerator.var0.__val_.mObserver;
    uint64_t v19 = PreviousRenderTime::parameterWatchdogFireTime((PreviousRenderTime *)&self->_realtimeState.renderBlockType);
    uint64_t v21 = v20;
    uint64_t v22 = (*(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)*MEMORY[0x1E4FB7E90] + 16))(*MEMORY[0x1E4FB7E90], 72, 8);
    *(_DWORD *)(v22 + 16) = 0;
    *(void *)(v22 + 24) = v17;
    *(void *)(v22 + 32) = mObserver;
    *(void *)(v22 + 40) = p_mScheduledParameterRefresher;
    *(void *)(v22 + 48) = v19;
    *(void *)(v22 + 56) = v21;
    *(void *)uint64_t v22 = &unk_1EDF962C8;
    *(void *)(v22 + 8) = 0;
    caulk::concurrent::messenger::enqueue((caulk::concurrent::messenger *)(v17 + 128), (caulk::concurrent::message *)v22);
  }
}

- (AUScheduleParameterBlock)scheduleParameterBlock
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__AUAudioUnit_scheduleParameterBlock__block_invoke;
  aBlock[3] = &__block_descriptor_40_e17_v32__0q8I16Q20f28l;
  void aBlock[4] = &self->_realtimeState;
  uint64_t v2 = _Block_copy(aBlock);
  MIDIProtocolID v3 = _Block_copy(v2);

  return v3;
}

char *__37__AUAudioUnit_scheduleParameterBlock__block_invoke(uint64_t a1, uint64_t a2, int a3, uint64_t a4, float a5)
{
  uint64_t v9 = *(void *)(a1 + 32);
  BOOL result = (char *)XAtomicPoolAllocator::alloc(*(XAtomicPoolAllocator **)(v9 + 56));
  *(void *)BOOL result = 0;
  *((void *)result + 1) = a2;
  if (a3) {
    char v11 = 2;
  }
  else {
    char v11 = 1;
  }
  result[16] = v11;
  *(_WORD *)(result + 17) = 0;
  result[19] = 0;
  *((_DWORD *)result + 5) = a3;
  *((void *)result + 3) = a4;
  *((float *)result + 8) = a5;
  *((_DWORD *)result + 9) = 0;
  *((void *)result + 5) = 0;
  unint64_t v12 = *(void *)(v9 + 72);
  atomic_store(v12, (unint64_t *)result);
  unint64_t v13 = v12;
  atomic_compare_exchange_strong((atomic_ullong *volatile)(v9 + 72), &v13, (unint64_t)result);
  if (v13 != v12)
  {
    unint64_t v14 = v13;
    do
    {
      atomic_store(v13, (unint64_t *)result);
      atomic_compare_exchange_strong((atomic_ullong *volatile)(v9 + 72), &v14, (unint64_t)result);
      BOOL v15 = v14 == v13;
      unint64_t v13 = v14;
    }
    while (!v15);
  }
  return result;
}

- (AUInternalRenderBlock)internalRenderBlock
{
  return 0;
}

- (void)deliverV2Parameters:(const AURenderEvent *)next
{
  for (id i = [(AUAudioUnit *)self parameterTree];
  {
    if (next->head.eventType == AURenderEventParameter && next->MIDIEventsList.eventList.packet[0].wordCount)
    {
      MIDIProtocolID v4 = [i parameterWithAddress:next->parameter.parameterAddress];
      uint64_t v6 = v4;
      if (v4)
      {
        *(AUValue *)&double v5 = next->parameter.value;
        [v4 setValue:10 originator:v5];
      }
    }
  }
}

- (AURenderBlock)renderBlock
{
  MIDIProtocolID v3 = [(AUAudioUnit *)self internalRenderBlock];
  if (v3)
  {
    MIDIProtocolID v4 = [(AUAudioUnit *)self renderContextObserver];
    unint64_t v13 = v4;
    if (v4)
    {
      std::optional<RenderContextChangeGenerator>::emplace[abi:ne180100]<void({block_pointer} {__strong}&)(AudioUnitRenderContext const*),void>((RenderContextChangeGenerator *)&self->_anon_f8[48], &v13);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v5 = 1;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        int v5 = 2;
      }
      else {
        int v5 = 3;
      }
    }
    *(_DWORD *)&self->_anon_f8[72] = v5;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __26__AUAudioUnit_renderBlock__block_invoke;
    v9[3] = &unk_1E5687990;
    p_realtimeState = &self->_realtimeState;
    unint64_t v12 = self;
    id v10 = v3;
    uint64_t v7 = _Block_copy(v9);
    uint64_t v6 = _Block_copy(v7);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __26__AUAudioUnit_renderBlock__block_invoke(uint64_t a1, unsigned int *a2, AudioTimeStamp *a3, uint64_t a4, uint64_t a5, AudioBufferList *a6)
{
  unsigned int v12 = *a2;
  if ((*a2 & 0x8000) == 0)
  {
    v22[0] = v12 | 4;
    RenderObserverList::callAll((RenderObserverList *)(*(void *)(a1 + 40) + 8), v22, a3, a4, a5, 0);
  }
  *(void *)uint64_t v22 = *(void *)(a1 + 40);
  char v23 = 1;
  caulk::pooled_semaphore_mutex::_lock(*(caulk::pooled_semaphore_mutex **)v22);
  uint64_t v20 = (caulk::pooled_semaphore_mutex *)(*(void *)(a1 + 40) + 4);
  int v13 = caulk::pooled_semaphore_mutex::try_lock(v20);
  char v21 = v13;
  if (v13)
  {
    uint64_t v14 = *(void *)(a1 + 40);
    if (*(unsigned char *)(v14 + 248))
    {
      RenderContextChangeGenerator::checkChange((RenderContextChangeGenerator *)(v14 + 232));
      uint64_t v14 = *(void *)(a1 + 40);
    }
    int v16 = (AURenderEvent *)AUEventSchedule::preRender((AUEventSchedule *)(v14 + 48), (uint64_t)a3->mSampleTime, a4, *(_DWORD *)(v14 + 256) == 3);
    if (v15) {
      AUEventSchedule::dispatchV2SetParamEvents((AUEventSchedule *)(*(void *)(a1 + 40) + 48), v15, (v12 >> 15) & 1);
    }
    if ((v12 & 0x8000) != 0 && *(_DWORD *)(*(void *)(a1 + 40) + 256) != 1)
    {
      [*(id *)(a1 + 48) deliverV2Parameters:v16];
      uint64_t v17 = 0;
    }
    else
    {
      uint64_t v17 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    AUEventSchedule::postRender((AUEventSchedule *)(*(void *)(a1 + 40) + 48), v16);
  }
  else
  {
    uint64_t v17 = 0;
  }
  std::unique_lock<caulk::pooled_semaphore_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v20);
  std::unique_lock<caulk::pooled_semaphore_mutex>::~unique_lock[abi:ne180100]((uint64_t)v22);
  if ((v12 & 0x8000) == 0)
  {
    if (v17) {
      int v18 = 264;
    }
    else {
      int v18 = 8;
    }
    v22[0] = *a2 | v18;
    RenderObserverList::callAll((RenderObserverList *)(*(void *)(a1 + 40) + 8), v22, a3, a4, a5, a6);
  }
  return v17;
}

- (void)auv2GetParameterSynchronizer
{
  return &self->_anon_f8[24];
}

- (void)scheduledParameterRefresher
{
  if (self->_isLoadedInProcess)
  {
    {
      return &AUScheduledParameterRefresher2::hostInstance(void)::global;
    }
    MIDIProtocolID v3 = &AUScheduledParameterRefresher2::hostInstance(void)::global;
    AUScheduledParameterRefresher2::AUScheduledParameterRefresher2((AUScheduledParameterRefresher2 *)&AUScheduledParameterRefresher2::hostInstance(void)::global);
  }
  else
  {
    {
      return &AUScheduledParameterRefresher2::remoteServiceInstance(void)::global;
    }
    MIDIProtocolID v3 = &AUScheduledParameterRefresher2::remoteServiceInstance(void)::global;
    AUScheduledParameterRefresher2::AUScheduledParameterRefresher2((AUScheduledParameterRefresher2 *)&AUScheduledParameterRefresher2::remoteServiceInstance(void)::global);
  }
  __cxa_guard_release(v4);
  return v3;
}

- (void)eventSchedule
{
  return &self->_realtimeState.eventSchedule.mScheduledParameterRefresher;
}

- (uint32_t)componentVersion
{
  uint32_t result = self->_componentVersion;
  if (!result)
  {
    UInt32 outVersion = 0;
    AudioComponentGetVersion([(AUAudioUnit *)self component], &outVersion);
    uint32_t result = outVersion;
    self->_componentVersion = outVersion;
  }
  return result;
}

- (NSString)manufacturerName
{
  uint64_t v2 = [(AUAudioUnit *)self componentName];
  uint64_t v3 = [v2 rangeOfString:@": "];
  if (v4)
  {
    int v5 = [v2 substringToIndex:v3];
  }
  else
  {
    int v5 = &stru_1EDFA53D0;
  }

  return (NSString *)v5;
}

- (NSString)audioUnitName
{
  uint64_t v2 = [(AUAudioUnit *)self componentName];
  uint64_t v3 = [v2 rangeOfString:@": "];
  if (v4)
  {
    id v5 = [v2 substringFromIndex:v3 + v4];
  }
  else
  {
    id v5 = v2;
  }
  uint64_t v6 = v5;

  return (NSString *)v6;
}

- (NSString)componentName
{
  componentName = self->_componentName;
  if (!componentName)
  {
    uint64_t v6 = 0;
    Impl_AudioGetComponentInfo([(AUAudioUnit *)self component], 0, (const __CFString **)&v6);
    if (v6)
    {
      uint64_t v4 = self->_componentName;
      self->_componentName = &v6->isa;
    }
    componentName = self->_componentName;
  }
  return componentName;
}

- (AudioComponent)component
{
  [(AUAudioUnit *)self resolveComponent];
  cntrl = self->_component.__cntrl_;
  if (!cntrl) {
    return 0;
  }
  uint64_t v4 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
  if (!v4) {
    return 0;
  }
  ptr = self->_component.__ptr_;
  std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  return (AudioComponent)ptr;
}

- (void)resolveComponent
{
  cntrl = self->_component.__cntrl_;
  if (!cntrl
    || (uint64_t v4 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl)) == 0
    || (ptr = self->_component.__ptr_, std::__shared_weak_count::__release_shared[abi:ne180100](v4), !ptr))
  {
    AudioComponent Next = AudioComponentFindNext(0, &self->_componentDescription);
    if (Next)
    {
      uint64_t v7 = (**(uint64_t (***)(AudioComponent))Next)(Next);
      if (v7)
      {
        uint64_t v9 = *(APComponent **)(v7 + 8);
        uint64_t v8 = *(void *)(v7 + 16);
        if (v8) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 16), 1uLL, memory_order_relaxed);
        }
        id v10 = self->_component.__cntrl_;
        self->_component.__ptr_ = v9;
        self->_component.__cntrl_ = (__shared_weak_count *)v8;
        if (v10)
        {
          std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v10);
        }
      }
    }
  }
}

- (OpaqueAudioComponentInstance)audioUnit
{
  return 0;
}

- (void)invalidateAudioUnit
{
  uint64_t v3 = (char *)&self->_realtimeState.renderObserverList.mObservers.mActiveList.mHead + 4;
  char v4 = 1;
  caulk::pooled_semaphore_mutex::_lock((caulk::pooled_semaphore_mutex *)((char *)&self->_realtimeState.renderObserverList.mObservers.mActiveList.mHead
                                                                       + 4));
  self->_realtimeState.contextChangeGenerator.var0.__val_.id mObserver = 0;
  std::unique_lock<caulk::pooled_semaphore_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v3);
}

- (void)dealloc
{
  if (self->_renderResourcesAllocated)
  {
    self->_renderResourcesAllocated = 0;
    [(AUAudioUnit *)self internalDeallocateRenderResources];
  }
  [(AUAudioUnit *)self resolveComponent];
  cntrl = self->_component.__cntrl_;
  if (cntrl)
  {
    char v4 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v4)
    {
      ptr = self->_component.__ptr_;
      if (ptr) {
        atomic_fetch_add((atomic_uint *volatile)ptr + 34, 0xFFFFFFFF);
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
  }
  [(AUAudioUnit *)self tearDownExtension];

  v6.receiver = self;
  v6.super_class = (Class)AUAudioUnit;
  [(AUAudioUnit *)&v6 dealloc];
}

- (AUAudioUnit)initWithComponentDescription:(AudioComponentDescription *)componentDescription error:(NSError *)outError
{
  AudioComponentDescription v5 = *componentDescription;
  return [(AUAudioUnit *)self initWithComponentDescription:&v5 options:0 error:outError];
}

- (void)setLoadedOutOfProcess
{
  self->_isLoadedInProcess = 0;
}

- (AUAudioUnit)initWithComponentDescription:(AudioComponentDescription *)componentDescription options:(AudioComponentInstantiationOptions)options error:(NSError *)outError
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  CADeprecated::TSingleton<AUAudioUnitProperties>::instance();
  if ([(AUAudioUnit *)self isMemberOfClass:objc_opt_class()])
  {

    AudioComponent Next = AudioComponentFindNext(0, componentDescription);
    if (Next)
    {
      memset(&v40, 0, sizeof(v40));
      Impl_AudioGetComponentInfo(Next, &v40, 0);
      char componentFlags = v40.componentFlags;
      if ((v40.componentFlags & 8) == 0
        || AllowUnsafeMainThreadServicing("-[AUAudioUnit initWithComponentDescription:options:error:]"))
      {
        uint64_t v34 = 0;
        int v35 = &v34;
        uint64_t v36 = 0x3032000000;
        int v37 = __Block_byref_object_copy__6715;
        int v38 = __Block_byref_object_dispose__6716;
        id v39 = 0;
        uint64_t v28 = 0;
        UInt32 v29 = &v28;
        uint64_t v30 = 0x3032000000;
        unint64_t v31 = __Block_byref_object_copy__6715;
        int v32 = __Block_byref_object_dispose__6716;
        id v33 = 0;
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __58__AUAudioUnit_initWithComponentDescription_options_error___block_invoke;
        aBlock[3] = &unk_1E5687968;
        UInt32 componentFlagsMask = componentDescription->componentFlagsMask;
        long long v25 = *(_OWORD *)&componentDescription->componentType;
        UInt32 v26 = componentFlagsMask;
        AudioComponentInstantiationOptions v27 = options;
        void aBlock[4] = &v34;
        void aBlock[5] = &v28;
        unsigned int v12 = _Block_copy(aBlock);
        int v13 = v12;
        if ((componentFlags & 8) != 0) {
          BOOL v14 = Synchronously_ServicingMainRunLoop((uint64_t)v12);
        }
        else {
          BOOL v14 = Synchronously((uint64_t)v12);
        }
        if (!v14)
        {
          if (!gAudioComponentLogCategory) {
            operator new();
          }
          uint64_t v20 = *(id *)gAudioComponentLogCategory;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            UInt32 v42 = "AUAudioUnit.mm";
            __int16 v43 = 1024;
            int v44 = 551;
            _os_log_impl(&dword_18FEC0000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d Timeout running task synchronously", buf, 0x12u);
          }
        }
        if (outError) {
          *outError = (NSError *) (id) v29[5];
        }
        int v16 = (AUAudioUnit *)(id)v35[5];

        _Block_object_dispose(&v28, 8);
        _Block_object_dispose(&v34, 8);

        return v16;
      }
      if (outError)
      {
        uint64_t v19 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-10863 userInfo:0];
        goto LABEL_17;
      }
    }
    else if (outError)
    {
      uint64_t v19 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-3000 userInfo:0];
LABEL_17:
      int v16 = 0;
      *outError = v19;
      return v16;
    }
    return 0;
  }
  v23.receiver = self;
  v23.super_class = (Class)AUAudioUnit;
  BOOL v15 = [(AUAudioUnit *)&v23 init];
  int v16 = (AUAudioUnit *)v15;
  if (v15)
  {
    long long v17 = *(_OWORD *)&componentDescription->componentType;
    *((_DWORD *)v15 + 142) = componentDescription->componentFlagsMask;
    *(_OWORD *)(v15 + 552) = v17;
    *((_DWORD *)v15 + 12) = 512;
    *((void *)v15 + 7) = 128;
    int v18 = (void *)*((void *)v15 + 43);
    *((void *)v15 + 43) = 0;

    v16->_isLoadedInProcess = 1;
    v16->_requestViewControllerSynchronously = 0;
    v16->_hostMIDIProtocol = 0;
    v16->_shouldUseMIDI2 = 1;
  }
  return v16;
}

void __58__AUAudioUnit_initWithComponentDescription_options_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = *(_OWORD *)(a1 + 48);
  uint64_t v5 = *(unsigned int *)(a1 + 68);
  int v11 = *(_DWORD *)(a1 + 64);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__AUAudioUnit_initWithComponentDescription_options_error___block_invoke_2;
  v7[3] = &unk_1E5687940;
  long long v9 = *(_OWORD *)(a1 + 32);
  long long v10 = v4;
  id v8 = v3;
  id v6 = v3;
  +[AUAudioUnit instantiateWithComponentDescription:&v10 options:v5 completionHandler:v7];
}

void __58__AUAudioUnit_initWithComponentDescription_options_error___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  id v9 = v6;

  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
  id v8 = v7;

  (*(void (**)(void))(a1[4] + 16))();
}

- (AUAudioUnit)init
{
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  long long v4 = [NSString stringWithUTF8String:"-[AUAudioUnit init]"];
  [v3 raise:*MEMORY[0x1E4F1C3C8], @"Don't call %@.", v4 format];

  return 0;
}

+ (id)keyPathsForValuesAffectingAllParameterValues
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"fullState", @"fullStateForDocument", @"currentPreset", 0);
}

+ (id)auAudioUnitForAudioUnit:(OpaqueAudioComponentInstance *)a3
{
  Component = AudioComponentInstanceGetComponent(a3);
  int ComponentInfo = Impl_AudioGetComponentInfo(Component, &v17, 0);
  id v6 = 0;
  if (!ComponentInfo)
  {
    id outData = 0;
    UInt32 ioDataSize = 8;
    OSStatus Property = AudioUnitGetProperty(a3, 0x739u, 0, 0, &outData, &ioDataSize);
    if (Property == -10879)
    {
      if (v17.componentType == 1635086197)
      {
        long long v10 = (AUAudioUnitV2Bridge *)objc_alloc((Class)getAUOutputUnitClass((const AudioComponentDescription *)v17.componentSubType));
        AudioComponentDescription v14 = v17;
        int v11 = &v14;
      }
      else
      {
        long long v10 = [AUAudioUnitV2Bridge alloc];
        long long v12 = *(_OWORD *)&v17.componentType;
        LODWORD(v13) = v17.componentFlagsMask;
        int v11 = (AudioComponentDescription *)&v12;
      }
      id v6 = -[AUAudioUnitV2Bridge initWithAudioUnit:description:](v10, "initWithAudioUnit:description:", a3, v11, v12, v13);
    }
    else
    {
      OSStatus v9 = Property;
      id v6 = 0;
      if (!v9) {
        id v6 = (AUAudioUnitV2Bridge *)outData;
      }
    }
  }
  return v6;
}

+ (void)instantiateWithComponentDescription:(AudioComponentDescription *)componentDescription options:(AudioComponentInstantiationOptions)options completionHandler:(void *)completionHandler
{
  v6[4] = *MEMORY[0x1E4F143B8];
  AudioComponentDescription v5 = *componentDescription;
  v6[3] = 0;
  +[AUAudioUnit instantiateWithComponentDescription:&v5 options:*(void *)&options connectionProvider:v6 completionHandler:completionHandler];
  std::__function::__value_func<NSXPCConnection * ()(NSUUID *)>::~__value_func[abi:ne180100](v6);
}

+ (void)instantiateWithComponentDescription:(AudioComponentDescription *)a3 options:(unsigned int)a4 connectionProvider:(function<NSXPCConnection *(NSUUID *) completionHandler:
{
  uint64_t v7 = *(void *)&a4;
  v43[4] = *MEMORY[0x1E4F143B8];
  OSStatus v9 = (void (**)(id, uint64_t, id))a6;
  CADeprecated::TSingleton<AUAudioUnitProperties>::instance();
  AudioComponent Next = AudioComponentFindNext(0, a3);
  int v11 = Next;
  if (Next)
  {
    long long v12 = (atomic_uint *)(**(uint64_t (***)(AudioComponent))Next)(Next);
    uint64_t v13 = (**(uint64_t (***)(OpaqueAudioComponent *))v11)(v11);
    if (v13)
    {
      AudioComponentDescription v14 = (*(void (**)(uint64_t))(*(void *)v13 + 32))(v13);
      if (v14)
      {
        uint64_t v15 = 0;
        long long v40 = *(_OWORD *)&a3->componentType;
        UInt32 componentFlagsMask = a3->componentFlagsMask;
        +[AUAudioUnit_XH instantiateWithExtension:v14 componentDescription:&v40 instance:0 options:0 completionHandler:v9];
        id v16 = 0;
LABEL_27:
        atomic_fetch_add(v12 + 34, 1u);
        atomic_fetch_or(v12 + 35, v7 | 0x20000000);
        uint64_t v20 = (AUAudioUnit_RemoteV2 *)v15;
        id v21 = v16;
        goto LABEL_28;
      }
    }
    Impl_AudioGetComponentInfo(v11, &v42, 0);
    if ((v42.componentFlags & 4) != 0 && (uint64_t v17 = (**(uint64_t (***)(OpaqueAudioComponent *))v11)(v11)) != 0)
    {
      (*(void (**)(uint64_t))(*(void *)v17 + 40))(v17);
      int v18 = (objc_class *)(id)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        AUOutputUnitClass = v18;
        uint64_t v20 = 0;
        id v21 = 0;
LABEL_26:
        id v29 = [AUOutputUnitClass alloc];
        long long v31 = *(_OWORD *)&a3->componentType;
        UInt32 v32 = a3->componentFlagsMask;
        id v30 = v21;
        uint64_t v15 = [v29 initWithComponentDescription:&v31 options:v7 error:&v30];
        id v16 = v30;

        v9[2](v9, v15, v16);
        AudioComponentDescription v14 = 0;
        goto LABEL_27;
      }
    }
    else
    {
      id v23 = 0;
    }
    if (a3->componentType == 1635086197)
    {
      uint64_t v20 = 0;
      AUOutputUnitClass = (objc_class *)getAUOutputUnitClass((const AudioComponentDescription *)a3->componentSubType);
      id v21 = 0;
    }
    else
    {
      (*(void (**)(AudioComponentDescription *__return_ptr, atomic_uint *))(*(void *)v12 + 104))(&v42, v12);
      unsigned int V2OutOfProcess = shouldLoadV2OutOfProcess(a3, v7, (id *)&v42);
      char v25 = V2OutOfProcess;
      if (V2OutOfProcess)
      {
        AudioComponentDescription v38 = *a3;
        id v26 = *(id *)&v42.componentType;
        std::__function::__value_func<NSXPCConnection * ()(NSUUID *)>::__value_func[abi:ne180100]((uint64_t)v43, (uint64_t)a5);
        AUHostingServiceClient::create(&v39, &v38, v26, (uint64_t)v43, 0);

        std::__function::__value_func<NSXPCConnection * ()(NSUUID *)>::~__value_func[abi:ne180100](v43);
        AudioComponentInstantiationOptions v27 = v39;
        if (v39 && (AudioComponentDescription v37 = *a3, AUHostingServiceClient::loadRemotely(v39, &v37)))
        {
          uint64_t v28 = [AUAudioUnit_RemoteV2 alloc];
          id v39 = 0;
          uint64_t v36 = v27;
          long long v34 = *(_OWORD *)&a3->componentType;
          UInt32 v35 = a3->componentFlagsMask;
          id v33 = 0;
          uint64_t v20 = [(AUAudioUnit_RemoteV2 *)v28 initWithXPCService:&v36 componentDescription:&v34 instance:0 instanceUUID:0 error:&v33];
          id v21 = v33;
          std::unique_ptr<AUHostingServiceClient>::reset[abi:ne180100](&v36, 0);
          atomic_fetch_add(v12 + 34, 1u);
          atomic_fetch_or(v12 + 35, v7);
        }
        else
        {
          uint64_t v20 = 0;
          id v21 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-10875 userInfo:0];
        }
        v9[2](v9, (uint64_t)v20, v21);
        if (v39)
        {
          AUHostingServiceClient::~AUHostingServiceClient(v39);
          MEMORY[0x192FC8940]();
        }
        AUOutputUnitClass = 0;
      }
      else
      {
        self;
        AUOutputUnitClass = (objc_class *)objc_claimAutoreleasedReturnValue();

        uint64_t v20 = 0;
        id v21 = 0;
      }
      if (*(void *)&v42.componentType) {
        CFRelease(*(CFTypeRef *)&v42.componentType);
      }
      if (v25)
      {
        AudioComponentDescription v14 = 0;
LABEL_28:

        goto LABEL_29;
      }
    }
    goto LABEL_26;
  }
  uint64_t v22 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-3000 userInfo:0];
  v9[2](v9, 0, v22);

LABEL_29:
}

- (AURenderContextObserver)renderContextObserver
{
  return 0;
}

- (void)setRenderResourcesAllocated:(BOOL)flag
{
  self->_renderResourcesAllocated = flag;
}

- (BOOL)shouldChangeToFormat:(AVAudioFormat *)format forBus:(AUAudioUnitBus *)bus
{
  return !self->_renderResourcesAllocated;
}

+ (void)registerSubclass:(Class)cls asComponentDescription:(AudioComponentDescription *)componentDescription name:(NSString *)name version:(UInt32)version
{
  v12[6] = *(std::recursive_mutex **)MEMORY[0x1E4F143B8];
  uint64_t v7 = name;
  GlobalComponentPluginMgr((uint64_t *)v12);
  if (EmbeddedComponentManager::isComponentDescriptionVisible((EmbeddedComponentManager *)componentDescription->componentFlags, v8))
  {
    OSStatus v9 = v7;
    long long v10 = v9;
    if (v9) {
      CFRetain(v9);
    }
    applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&cf, v10);

    operator new();
  }
  if (v12[0]) {
    std::recursive_mutex::unlock(v12[0]);
  }
}

void __86__AUAudioUnit_XH__internalInitWithExtension_componentDescription_instance_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setStrongInstance:0];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __86__AUAudioUnit_XH__internalInitWithExtension_componentDescription_instance_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v14 = a2;
  id v7 = a3;
  id v8 = a4;
  OSStatus v9 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v11 = WeakRetained;
  if (v8)
  {
    long long v12 = [WeakRetained completionBlock];
    ((void (**)(void, id))v12)[2](v12, v8);
  }
  else
  {
    [WeakRetained setCachedViewController:v7];

    id v11 = objc_loadWeakRetained(v9);
    uint64_t v13 = [v11 completionBlock];
    [v11 _open:v14 completion:v13];

    long long v12 = (void (**)(void, void))v11;
  }
}

void __86__AUAudioUnit_XH__internalInitWithExtension_componentDescription_instance_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (v5)
  {
    id v8 = [WeakRetained completionBlock];
    v8[2](v8, v5);
  }
  else
  {
    id v8 = (void (**)(id, id))WeakRetained;
    OSStatus v9 = [v8 completionBlock];
    [v8 _open:v10 completion:v9];
  }
}

void __99__AUAudioUnit_XH_instantiateWithExtension_componentDescription_instance_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  if (v3)
  {
    (*(void (**)(uint64_t, void, id))(v4 + 16))(v4, 0, v3);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    (*(void (**)(uint64_t, id, void))(v4 + 16))(v4, WeakRetained, 0);
  }
}

void __92__AUAudioUnit_RemoteV2_initWithXPCService_componentDescription_instance_instanceUUID_error___block_invoke(uint64_t a1, void *a2)
{
}

@end