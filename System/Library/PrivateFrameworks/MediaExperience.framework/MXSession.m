@interface MXSession
+ (BOOL)isCoreSessionFormatValidForMaxOutputChannels:(id)a3;
+ (BOOL)isNonSerializedCopyProperty:(id)a3;
+ (BOOL)isNonSerializedSetProperty:(id)a3;
+ (BOOL)isNonSerializedSetPropertyWhenSessionIsInactive:(id)a3;
+ (BOOL)isSessionMuted:(unint64_t)a3;
+ (id)copyMXSessionForID:(unint64_t)a3;
+ (id)getSetPropertiesOrder;
+ (int)updateDoesntActuallyPlayAudio:(id)a3;
+ (int)updateIsPlaying:(id)a3;
+ (int)updateIsPlayingOutput:(id)a3;
+ (int)updateIsRecording:(id)a3;
+ (int)updatePreferredAudioHardwareFormat:(id)a3 withMaxOutputChannels:(unsigned int)a4 andCalledFromDealloc:(BOOL)a5;
+ (int)updatePreferredNumberOfOutputChannels:(id)a3;
+ (int)updatePreferredOutputSampleRate:(id)a3;
+ (unsigned)getResolvedPreferredNumberOfOutputChannels:(id)a3;
+ (void)initialize;
- (BOOL)getActuallyPlaysAudio;
- (BOOL)getCurrentlyPlayingContentIsEligibleForSpatialization;
- (BOOL)getDoesntActuallyPlayAudio;
- (BOOL)getIAmPiP;
- (BOOL)getIsMuted;
- (BOOL)getIsPlaying;
- (BOOL)getIsPlayingOutput;
- (BOOL)getIsRecording;
- (MXSession)initWithSession:(opaqueCMSession *)a3;
- (double)getPreferredOutputSampleRate;
- (id)copyCurrentlyPlayingBufferedAudioSourceFormatInfo;
- (id)copyProperties:(id)a3 outPropertyErrors:(id *)a4;
- (id)copyPropertiesInternal:(id)a3 outPropertyErrors:(id *)a4;
- (id)getBestAvailableContentType;
- (id)getClientTypeAsString;
- (id)getCoreSession;
- (id)getCurrentlyPlayingSourceFormatInfo;
- (id)getMutePriority;
- (id)getPreferredAudioHardwareFormat;
- (id)getSourceFormatInfo;
- (id)info;
- (int)_addResource:(__CFString *)a3 resourceInfo:(__CFDictionary *)a4 token:(OpaqueCMSessionResourceToken *)a5;
- (int)_beginInterruptionWithSecTask:(__SecTask *)a3 andFlags:(unint64_t)a4;
- (int)_endInterruptionWithSecTask:(__SecTask *)a3 andStatus:(__CFString *)a4;
- (int)_removeResourceWithToken:(OpaqueCMSessionResourceToken *)a3;
- (int)_setPropertyForKey:(id)a3 value:(id)a4;
- (int)copyPropertyForKey:(id)a3 valueOut:(id *)a4;
- (int)copyPropertyForKeyInternal:(id)a3 valueOut:(id *)a4;
- (int)getClientType;
- (int)resetIsPlayingStates;
- (int)setBestAvailableContentType:(id)a3;
- (int)setClientType:(int)a3;
- (int)setCurrentlyPlayingBufferedAudioFormatInfo:(id)a3;
- (int)setCurrentlyPlayingContentIsEligibleForSpatialization:(BOOL)a3;
- (int)setCurrentlyPlayingSourceFormatInfo:(id)a3;
- (int)setDoesntActuallyPlayAudio:(BOOL)a3;
- (int)setIAmPiP:(BOOL)a3;
- (int)setID:(unint64_t)a3;
- (int)setIsMuted:(BOOL)a3;
- (int)setIsPlaying:(BOOL)a3;
- (int)setIsPlayingOutput:(BOOL)a3;
- (int)setIsRecording:(BOOL)a3;
- (int)setMutePriority:(id)a3;
- (int)setOrderedProperties:(id)a3 usingErrorHandlingStrategy:(unsigned __int8)a4 outPropertiesErrors:(id *)a5;
- (int)setOrderedPropertiesInternal:(id)a3 usingErrorHandlingStrategy:(unsigned __int8)a4 outPropertiesErrors:(id *)a5;
- (int)setPreferredAudioHardwareFormat:(id)a3;
- (int)setPreferredNumberOfOutputChannels:(unsigned int)a3;
- (int)setPreferredOutputSampleRate:(double)a3;
- (int)setProperties:(id)a3 usingErrorHandlingStrategy:(unsigned __int8)a4 outPropertiesErrors:(id *)a5;
- (int)setPropertiesInternal:(id)a3 usingErrorHandlingStrategy:(unsigned __int8)a4 outPropertiesErrors:(id *)a5;
- (int)setPropertyForKey:(id)a3 value:(id)a4;
- (int)setPropertyForKeyInternal:(id)a3 value:(id)a4 fromPropertiesBatch:(id)a5;
- (int)setSourceFormatInfo:(id)a3;
- (unint64_t)getID;
- (unsigned)getPreferredNumberOfOutputChannels;
- (void)_dealloc;
- (void)dealloc;
- (void)dumpInfo;
- (void)mute;
- (void)postIsMutedDidChange;
- (void)setInterruptionCalledOffAudioControlQueue:(BOOL)a3;
- (void)unmute;
- (void)updateBadgeType;
@end

@implementation MXSession

- (BOOL)getIsPlaying
{
  return self->mIsPlaying;
}

- (int)setPropertyForKeyInternal:(id)a3 value:(id)a4 fromPropertiesBatch:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if ([a3 isEqualToString:@"BestAvailableContentType"])
  {
    if (!a4 || (CFTypeID v9 = CFGetTypeID(a4), v9 == CFStringGetTypeID()))
    {
      int v10 = [(MXSession *)self setBestAvailableContentType:a4];
      goto LABEL_75;
    }
    goto LABEL_87;
  }
  if ([a3 isEqualToString:@"ClientType"])
  {
    CFTypeID v11 = CFGetTypeID(a4);
    if (v11 == CFNumberGetTypeID())
    {
      valuePtr[0] = 1;
      CFNumberGetValue((CFNumberRef)a4, kCFNumberSInt32Type, valuePtr);
      if ((valuePtr[0] - 5) > 0xFFFFFFFB)
      {
        int v10 = -[MXSession setClientType:](self, "setClientType:");
        goto LABEL_75;
      }
    }
    goto LABEL_87;
  }
  if ([a3 isEqualToString:@"CurrentlyPlayingContentIsEligibleForSpatialization"])
  {
    if (a4)
    {
      CFTypeID v12 = CFGetTypeID(a4);
      if (v12 == CFBooleanGetTypeID())
      {
        int v10 = [(MXSession *)self setCurrentlyPlayingContentIsEligibleForSpatialization:*MEMORY[0x1E4F1CFD0] == (void)a4];
        goto LABEL_75;
      }
    }
    goto LABEL_87;
  }
  if ([a3 isEqualToString:@"CurrentlyPlayingSourceFormatInfo"])
  {
    if (!a4 || (CFTypeID v13 = CFGetTypeID(a4), v13 == CFDictionaryGetTypeID()))
    {
      int v10 = [(MXSession *)self setCurrentlyPlayingSourceFormatInfo:a4];
      goto LABEL_75;
    }
    goto LABEL_87;
  }
  if ([a3 isEqualToString:@"CurrentlyPlayingBufferedAudioFormatInfo"])
  {
    if (!a4 || (CFTypeID v14 = CFGetTypeID(a4), v14 == CFDictionaryGetTypeID()))
    {
      int v10 = [(MXSession *)self setCurrentlyPlayingBufferedAudioFormatInfo:a4];
      goto LABEL_75;
    }
    goto LABEL_87;
  }
  if ([a3 isEqualToString:@"IAmPiP"])
  {
    if (a4)
    {
      CFTypeID v15 = CFGetTypeID(a4);
      if (v15 == CFBooleanGetTypeID())
      {
        int v10 = [(MXSession *)self setIAmPiP:*MEMORY[0x1E4F1CFD0] == (void)a4];
        goto LABEL_75;
      }
    }
    goto LABEL_87;
  }
  if ([a3 isEqualToString:@"SourceFormatInfo"])
  {
    if (!a4 || (CFTypeID v16 = CFGetTypeID(a4), v16 == CFDictionaryGetTypeID()))
    {
      int v10 = [(MXSession *)self setSourceFormatInfo:a4];
      goto LABEL_75;
    }
    goto LABEL_87;
  }
  if ([a3 isEqualToString:@"AudioToolboxIsPlaying"])
  {
    if (a4)
    {
      CFTypeID v17 = CFGetTypeID(a4);
      if (v17 == CFBooleanGetTypeID())
      {
        BOOL v18 = *MEMORY[0x1E4F1CFD0] == (void)a4;
        if (self->mAudioToolboxIsPlaying == v18) {
          return 0;
        }
        self->BOOL mAudioToolboxIsPlaying = v18;
        if (dword_1E9359ED0)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        if (self->mClientIsPlaying) {
          goto LABEL_56;
        }
        BOOL mAudioToolboxIsPlaying = self->mAudioToolboxIsPlaying;
        goto LABEL_73;
      }
    }
    goto LABEL_87;
  }
  if ([a3 isEqualToString:@"DoesntActuallyPlayAudio"])
  {
    if (a4)
    {
      CFTypeID v20 = CFGetTypeID(a4);
      if (v20 == CFBooleanGetTypeID())
      {
        int v10 = [(MXSession *)self setDoesntActuallyPlayAudio:*MEMORY[0x1E4F1CFD0] == (void)a4];
        goto LABEL_75;
      }
    }
    goto LABEL_87;
  }
  if ([a3 isEqualToString:@"IsPlaying"])
  {
    if (a4)
    {
      CFTypeID v21 = CFGetTypeID(a4);
      if (v21 == CFBooleanGetTypeID())
      {
        BOOL mClientIsPlaying = *MEMORY[0x1E4F1CFD0] == (void)a4;
        if (self->mClientIsPlaying == mClientIsPlaying) {
          return 0;
        }
        self->BOOL mClientIsPlaying = mClientIsPlaying;
        if (dword_1E9359ED0)
        {
          v23 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          BOOL mClientIsPlaying = self->mClientIsPlaying;
        }
        if (mClientIsPlaying)
        {
LABEL_56:
          BOOL v29 = 1;
LABEL_74:
          int v10 = -[MXSession setIsPlaying:](self, "setIsPlaying:", v29, v36, v37);
          goto LABEL_75;
        }
        BOOL mAudioToolboxIsPlaying = self->mAudioToolboxIsPlaying;
LABEL_73:
        BOOL v29 = mAudioToolboxIsPlaying;
        goto LABEL_74;
      }
    }
LABEL_87:
    int v10 = FigSignalErrorAt();
    goto LABEL_75;
  }
  if ([a3 isEqualToString:@"IsPlayingOutput"])
  {
    if (a4)
    {
      CFTypeID v25 = CFGetTypeID(a4);
      if (v25 == CFBooleanGetTypeID())
      {
        int v10 = -[MXSession setIsPlayingOutput:](self, "setIsPlayingOutput:", [a4 BOOLValue]);
        goto LABEL_75;
      }
    }
    goto LABEL_87;
  }
  if ([a3 isEqualToString:@"IsRecording"])
  {
    if (a4)
    {
      CFTypeID v26 = CFGetTypeID(a4);
      if (v26 == CFBooleanGetTypeID())
      {
        id v27 = (id)*MEMORY[0x1E4F1CFD0];
        BOOL v28 = *MEMORY[0x1E4F1CFD0] == (void)a4;
        if (v28 != [(MXSession *)self getIsRecording])
        {
          int v10 = [(MXSession *)self setIsRecording:v27 == a4];
          goto LABEL_75;
        }
        return 0;
      }
    }
    goto LABEL_87;
  }
  if ([a3 isEqualToString:@"MutePriority"])
  {
    if (a4
      && (CFEqual(a4, @"MutePriority_One")
       || CFEqual(a4, @"MutePriority_Two")
       || CFEqual(a4, @"MutePriority_Three")
       || CFEqual(a4, @"MutePriority_Four")))
    {
      int v10 = [(MXSession *)self setMutePriority:a4];
      goto LABEL_75;
    }
    goto LABEL_87;
  }
  if ([a3 isEqualToString:@"PreferredAudioHardwareFormat"])
  {
    if (a4 && (CFEqual(a4, @"LPCM") || CFEqual(a4, @"AC-3") || CFEqual(a4, @"MATAtmos")))
    {
      int v10 = [(MXSession *)self setPreferredAudioHardwareFormat:a4];
      goto LABEL_75;
    }
    goto LABEL_87;
  }
  if ([a3 isEqualToString:@"PreferredNumberOfOutputChannels"])
  {
    if (!a4 || (CFTypeID v33 = CFGetTypeID(a4), v33 == CFNumberGetTypeID()))
    {
      valuePtr[0] = 0;
      CFNumberGetValue((CFNumberRef)a4, kCFNumberSInt32Type, valuePtr);
      int v10 = [(MXSession *)self setPreferredNumberOfOutputChannels:valuePtr[0]];
      goto LABEL_75;
    }
    goto LABEL_87;
  }
  if (([a3 isEqualToString:@"PreferredOutputSampleRate"] & 1) != 0
    || [a3 isEqualToString:@"PreferredAudioHardwareSampleRate"])
  {
    if (a4)
    {
      CFTypeID v34 = CFGetTypeID(a4);
      if (v34 == CFNumberGetTypeID())
      {
        [a4 floatValue];
        int v10 = [(MXSession *)self setPreferredOutputSampleRate:v35];
        goto LABEL_75;
      }
    }
    goto LABEL_87;
  }
  int v10 = MXCoreSessionSetProperty(self->mCoreSession, (__CFString *)a3, (NSDictionary *)a4, a5);
LABEL_75:
  int v19 = v10;
  if (v10)
  {
    v31 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v19;
}

- (int)copyPropertyForKeyInternal:(id)a3 valueOut:(id *)a4
{
  if (!a3)
  {
    LODWORD(v9) = -15682;
    return (int)v9;
  }
  if ([a3 isEqualToString:@"AudioToolboxIsPlaying"])
  {
    v7 = &OBJC_IVAR___MXSession_mAudioToolboxIsPlaying;
    goto LABEL_4;
  }
  if ([a3 isEqualToString:@"BestAvailableContentType"])
  {
    CFNumberRef v9 = [(MXSession *)self getBestAvailableContentType];
    goto LABEL_18;
  }
  if ([a3 isEqualToString:@"CurrentlyPlayingContentIsEligibleForSpatialization"])
  {
    BOOL v10 = [(MXSession *)self getCurrentlyPlayingContentIsEligibleForSpatialization];
    goto LABEL_12;
  }
  if ([a3 isEqualToString:@"CurrentlyPlayingSourceFormatInfo"])
  {
    CFNumberRef v9 = [(MXSession *)self getCurrentlyPlayingSourceFormatInfo];
    goto LABEL_18;
  }
  if ([a3 isEqualToString:@"CurrentlyPlayingBufferedAudioFormatInfo"])
  {
    CFNumberRef v9 = [(MXSession *)self copyCurrentlyPlayingBufferedAudioSourceFormatInfo];
LABEL_28:
    CFTypeID v13 = v9;
    LODWORD(v9) = 0;
LABEL_29:
    *a4 = v13;
    return (int)v9;
  }
  if ([a3 isEqualToString:@"DoesntActuallyPlayAudio"])
  {
    BOOL v10 = [(MXSession *)self getDoesntActuallyPlayAudio];
    goto LABEL_12;
  }
  if ([a3 isEqualToString:@"MXSessionID"])
  {
    unint64_t valuePtr = [(MXSession *)self getID];
    CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFNumberType v12 = kCFNumberSInt64Type;
LABEL_27:
    CFNumberRef v9 = CFNumberCreate(v11, v12, &valuePtr);
    goto LABEL_28;
  }
  if ([a3 isEqualToString:@"IsMuted"])
  {
    BOOL v10 = [(MXSession *)self getIsMuted];
LABEL_12:
    v8 = (CFNumberRef *)MEMORY[0x1E4F1CFD0];
    if (!v10) {
      v8 = (CFNumberRef *)MEMORY[0x1E4F1CFC8];
    }
    goto LABEL_14;
  }
  if ([a3 isEqualToString:@"IsPlaying"])
  {
    v7 = &OBJC_IVAR___MXSession_mClientIsPlaying;
    goto LABEL_4;
  }
  if ([a3 isEqualToString:@"IsPlayingOutput"])
  {
    v7 = &OBJC_IVAR___MXSession_mIsPlayingOutput;
    goto LABEL_4;
  }
  if ([a3 isEqualToString:@"IsRecording"])
  {
    v7 = &OBJC_IVAR___MXSession_mIsRecording;
LABEL_4:
    if (*((unsigned char *)&self->super.isa + *v7)) {
      v8 = (CFNumberRef *)MEMORY[0x1E4F1CFD0];
    }
    else {
      v8 = (CFNumberRef *)MEMORY[0x1E4F1CFC8];
    }
LABEL_14:
    CFNumberRef v9 = *v8;
LABEL_15:
    *a4 = v9;
LABEL_19:
    CFRetain(v9);
    LODWORD(v9) = 0;
    return (int)v9;
  }
  if ([a3 isEqualToString:@"PreferredAudioHardwareFormat"])
  {
    CFNumberRef v9 = [(MXSession *)self getPreferredAudioHardwareFormat];
    goto LABEL_15;
  }
  if ([a3 isEqualToString:@"PreferredNumberOfOutputChannels"])
  {
    int v14 = [(MXSession *)self getPreferredNumberOfOutputChannels];
LABEL_42:
    LODWORD(valuePtr) = v14;
    CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFNumberType v12 = kCFNumberSInt32Type;
    goto LABEL_27;
  }
  if (([a3 isEqualToString:@"PreferredOutputSampleRate"] & 1) != 0
    || [a3 isEqualToString:@"PreferredAudioHardwareSampleRate"])
  {
    [(MXSession *)self getPreferredOutputSampleRate];
    unint64_t valuePtr = v15;
    CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFNumberType v12 = kCFNumberFloat64Type;
    goto LABEL_27;
  }
  if (![a3 isEqualToString:@"SourceFormatInfo"])
  {
    if ([a3 isEqualToString:@"AudioQueueOptions"])
    {
      unint64_t valuePtr = 0;
      LODWORD(v9) = MXCoreSessionCopyProperty(self->mCoreSession, a3, (const __CFAllocator *)*MEMORY[0x1E4F1CF80], &valuePtr);
      CFTypeID v13 = (void *)valuePtr;
      goto LABEL_29;
    }
    if ([a3 isEqualToString:@"ConsolidatedSourceFormatInfo"])
    {
      CFNumberRef v9 = CMSUtility_CopyConsolidatedSourceFormatInfo(self->mCoreSession);
      goto LABEL_28;
    }
    if (![a3 isEqualToString:@"TestOnly_ClientType"])
    {
      mCoreSession = self->mCoreSession;
      CFAllocatorRef v17 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      LODWORD(v9) = MXCoreSessionCopyProperty(mCoreSession, a3, v17, a4);
      return (int)v9;
    }
    int v14 = [(MXSession *)self getClientType];
    goto LABEL_42;
  }
  CFNumberRef v9 = [(MXSession *)self getSourceFormatInfo];
LABEL_18:
  *a4 = v9;
  if (v9) {
    goto LABEL_19;
  }
  return (int)v9;
}

- (unint64_t)getID
{
  return self->mID;
}

- (int)setIsPlayingOutput:(BOOL)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->mIsPlayingOutput == a3) {
    return 0;
  }
  self->mIsPlayingOutput = a3;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return +[MXSession updateIsPlayingOutput:](MXSession, "updateIsPlayingOutput:", self->mCoreSession, v6, v7);
}

- (int)setMutePriority:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = [(MXSession *)self getMutePriority];
  if ([a3 isEqualToString:v5]) {
    return 0;
  }
  __int16 IsAnyMXSessionPlayingWithEachMutePriority = CMSMUtility_IsAnyMXSessionPlayingWithEachMutePriority();
  if ((_BYTE)IsAnyMXSessionPlayingWithEachMutePriority
    && [a3 isEqualToString:@"MutePriority_One"])
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  [(NSRecursiveLock *)self->mRecursiveLock lock];

  self->mMutePriority = (NSString *)a3;
  [(NSRecursiveLock *)self->mRecursiveLock unlock];
  if (dword_1E9359ED0)
  {
    CFNumberRef v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if ((objc_msgSend(v5, "isEqualToString:", @"MutePriority_One", v11, v13) & 1) == 0
    && ![v5 isEqualToString:@"MutePriority_Three"])
  {
    return MX_FeatureFlags_IsMandrakeEverywhereEnabled();
  }
  if (![a3 isEqualToString:@"MutePriority_Two"]) {
    return MX_FeatureFlags_IsMandrakeEverywhereEnabled();
  }
  if ((IsAnyMXSessionPlayingWithEachMutePriority & 0xFF00) == 0) {
    return MX_FeatureFlags_IsMandrakeEverywhereEnabled();
  }
  if (!self->mIsPlaying) {
    return MX_FeatureFlags_IsMandrakeEverywhereEnabled();
  }
  int result = cmsBeginInterruptionGuts(self->mCoreSession, 0, 2);
  if (!result) {
    return MX_FeatureFlags_IsMandrakeEverywhereEnabled();
  }
  return result;
}

uint64_t __41__MXSession_copyPropertyForKey_valueOut___block_invoke(uint64_t a1)
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
  CFTypeID v25 = &v24;
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
        if (!+[MXSession isNonSerializedSetProperty:v12]
          && (!+[MXSession isNonSerializedSetPropertyWhenSessionIsInactive:](MXSession, "isNonSerializedSetPropertyWhenSessionIsInactive:", v12)|| (objc_msgSend(-[MXSession getCoreSession](self, "getCoreSession"), "isActive") & 1) != 0))
        {
          uint64_t v14 = MXGetSerialQueue();
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __74__MXSession_setProperties_usingErrorHandlingStrategy_outPropertiesErrors___block_invoke;
          v18[3] = &unk_1E57C5830;
          v18[4] = self;
          v18[5] = a3;
          char v19 = v6;
          v18[6] = &v24;
          v18[7] = a5;
          MXDispatchAsyncAndWait((uint64_t)"-[MXSession setProperties:usingErrorHandlingStrategy:outPropertiesErrors:]", (uint64_t)"MXSession_ObjCInterface.m", 78, 0, 0, v14, (uint64_t)v18);
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
  int v13 = [(MXSession *)self setPropertiesInternal:a3 usingErrorHandlingStrategy:v6 outPropertiesErrors:a5];
  *((_DWORD *)v25 + 6) = v13;
LABEL_14:
  int v16 = *((_DWORD *)v25 + 6);
  _Block_object_dispose(&v24, 8);
  return v16;
}

- (int)setOrderedProperties:(id)a3 usingErrorHandlingStrategy:(unsigned __int8)a4 outPropertiesErrors:(id *)a5
{
  uint64_t v6 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  +[MXInitialization waitUntilMXIsFullyInitialized];
  uint64_t v24 = 0;
  CFTypeID v25 = &v24;
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
        if (!+[MXSession isNonSerializedSetProperty:v12]
          && (!+[MXSession isNonSerializedSetPropertyWhenSessionIsInactive:](MXSession, "isNonSerializedSetPropertyWhenSessionIsInactive:", v12)|| (objc_msgSend(-[MXSession getCoreSession](self, "getCoreSession"), "isActive") & 1) != 0))
        {
          uint64_t v14 = MXGetSerialQueue();
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __81__MXSession_setOrderedProperties_usingErrorHandlingStrategy_outPropertiesErrors___block_invoke;
          v18[3] = &unk_1E57C5830;
          v18[4] = self;
          v18[5] = a3;
          char v19 = v6;
          v18[6] = &v24;
          v18[7] = a5;
          MXDispatchAsyncAndWait((uint64_t)"-[MXSession setOrderedProperties:usingErrorHandlingStrategy:outPropertiesErrors:]", (uint64_t)"MXSession_ObjCInterface.m", 120, 0, 0, v14, (uint64_t)v18);
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
  int v13 = [(MXSession *)self setOrderedPropertiesInternal:a3 usingErrorHandlingStrategy:v6 outPropertiesErrors:a5];
  *((_DWORD *)v25 + 6) = v13;
LABEL_14:
  int v16 = *((_DWORD *)v25 + 6);
  _Block_object_dispose(&v24, 8);
  return v16;
}

+ (BOOL)isNonSerializedSetPropertyWhenSessionIsInactive:(id)a3
{
  return [(id)sNonSerializedSetPropertiesWhenSessionIsInactive containsObject:a3];
}

- (id)getCoreSession
{
  return self->mCoreSession;
}

- (id)copyProperties:(id)a3 outPropertyErrors:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  +[MXInitialization waitUntilMXIsFullyInitialized];
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x3052000000;
  long long v23 = __Block_byref_object_copy__12;
  uint64_t v24 = __Block_byref_object_dispose__12;
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
        if (!+[MXSession isNonSerializedCopyProperty:*(void *)(*((void *)&v16 + 1) + 8 * v9)])
        {
          uint64_t v11 = MXGetSerialQueue();
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __46__MXSession_copyProperties_outPropertyErrors___block_invoke;
          v15[3] = &unk_1E57C5808;
          v15[4] = self;
          v15[5] = a3;
          v15[6] = &v20;
          v15[7] = a4;
          MXDispatchAsyncAndWait((uint64_t)"-[MXSession copyProperties:outPropertyErrors:]", (uint64_t)"MXSession_ObjCInterface.m", 160, 0, 0, v11, (uint64_t)v15);
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
  id v10 = [(MXSession *)self copyPropertiesInternal:a3 outPropertyErrors:a4];
  v21[5] = (uint64_t)v10;
LABEL_12:
  int v13 = (void *)v21[5];
  _Block_object_dispose(&v20, 8);
  return v13;
}

- (int)copyPropertyForKey:(id)a3 valueOut:(id *)a4
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  if (+[MXSession isNonSerializedCopyProperty:](MXSession, "isNonSerializedCopyProperty:"))
  {
    int v7 = [(MXSession *)self copyPropertyForKeyInternal:a3 valueOut:a4];
    *((_DWORD *)v12 + 6) = v7;
  }
  else
  {
    uint64_t v8 = MXGetSerialQueue();
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __41__MXSession_copyPropertyForKey_valueOut___block_invoke;
    v10[3] = &unk_1E57C5808;
    v10[4] = self;
    v10[5] = a3;
    v10[6] = &v11;
    v10[7] = a4;
    MXDispatchAsyncAndWait((uint64_t)"-[MXSession copyPropertyForKey:valueOut:]", (uint64_t)"MXSession_ObjCInterface.m", 297, 0, 0, v8, (uint64_t)v10);
    int v7 = *((_DWORD *)v12 + 6);
  }
  _Block_object_dispose(&v11, 8);
  return v7;
}

+ (BOOL)isNonSerializedCopyProperty:(id)a3
{
  return [(id)sNonSerializedCopyProperties containsObject:a3];
}

- (int)setPropertyForKey:(id)a3 value:(id)a4
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  if (+[MXSession isNonSerializedSetProperty:](MXSession, "isNonSerializedSetProperty:")
    || +[MXSession isNonSerializedSetPropertyWhenSessionIsInactive:](MXSession, "isNonSerializedSetPropertyWhenSessionIsInactive:", a3)&& (objc_msgSend(-[MXSession getCoreSession](self, "getCoreSession"), "isActive") & 1) == 0|| MX_FeatureFlags_IsSessionBasedMutingEnabled()&& objc_msgSend(a3, "isEqualToString:", @"IsRecordingMuted"))
  {
    int v7 = [(MXSession *)self setPropertyForKeyInternal:a3 value:a4 fromPropertiesBatch:0];
    *((_DWORD *)v12 + 6) = v7;
  }
  else
  {
    uint64_t v8 = MXGetSerialQueue();
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __37__MXSession_setPropertyForKey_value___block_invoke;
    v10[3] = &unk_1E57C57E0;
    v10[4] = self;
    v10[5] = a3;
    v10[6] = a4;
    v10[7] = &v11;
    MXDispatchAsyncAndWait((uint64_t)"-[MXSession setPropertyForKey:value:]", (uint64_t)"MXSession_ObjCInterface.m", 268, 0, 0, v8, (uint64_t)v10);
    int v7 = *((_DWORD *)v12 + 6);
  }
  _Block_object_dispose(&v11, 8);
  return v7;
}

+ (BOOL)isNonSerializedSetProperty:(id)a3
{
  return [(id)sNonSerializedSetProperties containsObject:a3];
}

- (MXSession)initWithSession:(opaqueCMSession *)a3
{
  location[16] = *(id *)MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)MXSession;
  v4 = [(MXSession *)&v8 init];
  if (v4)
  {
    if (a3)
    {
      v4->mRecursiveLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
      v4->mCoreSession = (MXCoreSession *)a3->var1;
      v4->mPreferredOutputSampleRate = 0.0;
      v4->mPreferredAudioHardwareFormat = (NSString *)@"LPCM";
      v4->mIsPlaying = 0;
      v4->BOOL mClientIsPlaying = 0;
      v4->BOOL mAudioToolboxIsPlaying = 0;
      v4->mPreferredNumberOfOutputChannels = 0;
      v4->mMutePriority = (NSString *)@"MutePriority_Two";
      v4->mIAmPiP = 0;
      v4->mIsMuted = 0;
      v4->mDoesntActuallyPlayAudio = 0;
      v4->mIsPlayingOutput = 0;
      v4->mClientType = 1;
      v4->mCoreSessionID = [(NSNumber *)[(MXCoreSessionBase *)v4->mCoreSession ID] unsignedLongLongValue];
      v4->mID = FigAtomicIncrement64();
      v4->mSourceFormatInfo = 0;
      v4->mBestAvailableContentType = 0;
      v4->mCurrentlyPlayingSourceFormatInfo = 0;
      v4->mCurrentlyPlayingBufferedAudioFormatInfo = 0;
      v4->mCurrentlyPlayingContentIsEligibleForSpatialization = 0;
      if (dword_1E9359ED0)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v4->mDescription = (NSString *)[[NSString alloc] initWithFormat:@"<MXSessionID = %llx, CoreSessionID = %lld>", v4->mID, v4->mCoreSessionID];
      objc_initWeak(location, v4);
      [(MXCoreSession *)v4->mCoreSession mxSessionListAddSession:objc_loadWeak(location)];
      objc_destroyWeak(location);
    }
    else
    {
      uint64_t v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      return 0;
    }
  }
  return v4;
}

- (id)info
{
  unint64_t mID = self->mID;
  unint64_t mCoreSessionID = self->mCoreSessionID;
  id v5 = NSString;
  uint64_t v6 = [(MXCoreSessionBase *)self->mCoreSession clientName];
  if (self->mIsMuted) {
    int v7 = @"YES";
  }
  else {
    int v7 = @"NO";
  }
  if (self->mClientIsPlaying) {
    objc_super v8 = @"PLAYING";
  }
  else {
    objc_super v8 = @"STOPPED";
  }
  if (self->mAudioToolboxIsPlaying) {
    uint64_t v9 = @"PLAYING";
  }
  else {
    uint64_t v9 = @"STOPPED";
  }
  id v10 = [(MXSession *)self getMutePriority];
  if (self->mIAmPiP) {
    uint64_t v11 = @"YES";
  }
  else {
    uint64_t v11 = @"NO";
  }
  if (self->mDoesntActuallyPlayAudio) {
    id v12 = @"YES";
  }
  else {
    id v12 = @"NO";
  }
  if (self->mIsPlayingOutput) {
    uint64_t v13 = @"YES";
  }
  else {
    uint64_t v13 = @"NO";
  }
  return (id)[v5 stringWithFormat:@"<ID: %llx, CoreSessionID = %lld Name = %@, Muted = %@, ClientIsPlaying = %@, AudioToolboxIsPlaying = %@, MutePriority = %@, PiP = %@, DoesntActuallyPlayAudio = %@, clientType = %x, IsPlayingOutput = %@", mID, mCoreSessionID, v6, v7, v8, v9, v10, v11, v12, self->mClientType, v13];
}

- (id)getMutePriority
{
  [(NSRecursiveLock *)self->mRecursiveLock lock];
  v3 = self->mMutePriority;
  [(NSRecursiveLock *)self->mRecursiveLock unlock];
  return v3;
}

- (int)_setPropertyForKey:(id)a3 value:(id)a4
{
  return [(MXSession *)self setPropertyForKeyInternal:a3 value:a4 fromPropertiesBatch:0];
}

- (int)setPropertiesInternal:(id)a3 usingErrorHandlingStrategy:(unsigned __int8)a4 outPropertiesErrors:(id *)a5
{
  int v6 = a4;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  float v35 = a5;
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
    id v10 = (void *)sOrderedMXSessionProperties;
    uint64_t v11 = [(id)sOrderedMXSessionProperties countByEnumeratingWithState:&v47 objects:v61 count:16];
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
          if (([(id)sOrderedMXSessionProperties containsObject:v21] & 1) == 0)
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
          uint64_t v26 = *(void **)(*((void *)&v39 + 1) + 8 * k);
          uint64_t v27 = (void *)MEMORY[0x1997179E0]();
          uint64_t v28 = objc_msgSend((id)objc_msgSend(v26, "allKeys"), "firstObject");
          uint64_t v29 = [v26 objectForKey:v28];
          if (v29 == [MEMORY[0x1E4F1CA98] null]) {
            uint64_t v30 = 0;
          }
          else {
            uint64_t v30 = v29;
          }
          uint64_t v31 = [(MXSession *)self setPropertyForKeyInternal:v28 value:v30 fromPropertiesBatch:a3];
          uint64_t v53 = v28;
          uint64_t v54 = [MEMORY[0x1E4F28ED0] numberWithInt:v31];
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
    *float v35 = v38;
  }
  else {

  }
  return v36;
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
          int v14 = *(void **)(*((void *)&v26 + 1) + 8 * v13);
          uint64_t v15 = (void *)MEMORY[0x1997179E0](v9, v10);
          uint64_t v16 = objc_msgSend((id)objc_msgSend(v14, "allKeys"), "firstObject");
          uint64_t v17 = [v14 objectForKey:v16];
          if (v17 == [MEMORY[0x1E4F1CA98] null]) {
            uint64_t v18 = 0;
          }
          else {
            uint64_t v18 = v17;
          }
          uint64_t v19 = -[MXSession setPropertyForKeyInternal:value:fromPropertiesBatch:](self, "setPropertyForKeyInternal:value:fromPropertiesBatch:", v16, v18, 0, v21, v22);
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

id __46__MXSession_copyProperties_outPropertyErrors___block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(a1 + 32) _copyProperties:*(void *)(a1 + 40) outPropertyErrors:*(void *)(a1 + 56)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  v3 = *(void ***)(a1 + 56);
  if (v3)
  {
    v4 = *v3;
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
        uint64_t v12 = (void *)MEMORY[0x1997179E0]();
        id v18 = 0;
        uint64_t v13 = [(MXSession *)self copyPropertyForKeyInternal:v11 valueOut:&v18];
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

id __74__MXSession_setProperties_usingErrorHandlingStrategy_outPropertiesErrors___block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(a1 + 32) _setProperties:*(void *)(a1 + 40) usingErrorHandlingStrategy:*(unsigned __int8 *)(a1 + 64) outPropertiesErrors:*(void *)(a1 + 56)];
  v3 = *(void ***)(a1 + 56);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  if (v3)
  {
    v4 = *v3;
    return v4;
  }
  return result;
}

id __81__MXSession_setOrderedProperties_usingErrorHandlingStrategy_outPropertiesErrors___block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(a1 + 32) _setOrderedProperties:*(void *)(a1 + 40) usingErrorHandlingStrategy:*(unsigned __int8 *)(a1 + 64) outPropertiesErrors:*(void *)(a1 + 56)];
  v3 = *(void ***)(a1 + 56);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  if (v3)
  {
    v4 = *v3;
    return v4;
  }
  return result;
}

- (int)setIsRecording:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL mIsRecording = self->mIsRecording;
  if (mIsRecording == a3) {
    return 0;
  }
  if ([+[MXSessionManager sharedInstance] isSpeechDetectCategory:[(MXCoreSessionBase *)self->mCoreSession audioCategory]])
  {
    if (dword_1E9359ED0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return -15685;
  }
  else
  {
    self->BOOL mIsRecording = a3;
    if (dword_1E9359ED0)
    {
      uint64_t v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    int result = +[MXSession updateIsRecording:](MXSession, "updateIsRecording:", self->mCoreSession, v9, v10);
    if (result) {
      self->BOOL mIsRecording = mIsRecording;
    }
  }
  return result;
}

- (int)setIsPlaying:(BOOL)a3
{
  if (self->mIsPlaying == a3) {
    return 0;
  }
  BOOL mIsPlaying = a3;
  if (![+[MXSessionManager sharedInstance] isSpeechDetectCategory:[(MXCoreSessionBase *)self->mCoreSession audioCategory]])
  {
    self->BOOL mIsPlaying = mIsPlaying;
    if (dword_1E9359ED0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      BOOL mIsPlaying = self->mIsPlaying;
    }
    mCoreSession = self->mCoreSession;
    if (mIsPlaying)
    {
      int result = +[MXSession updateDoesntActuallyPlayAudio:mCoreSession];
      if (result) {
        return result;
      }
      int result = +[MXSession updateIsPlaying:self->mCoreSession];
      if (result) {
        return result;
      }
      [(MXSession *)self updateBadgeType];
    }
    else
    {
      int result = +[MXSession updateIsPlaying:mCoreSession];
      if (result) {
        return result;
      }
      int result = +[MXSession updateDoesntActuallyPlayAudio:self->mCoreSession];
      if (result) {
        return result;
      }
      -[MXSession setCurrentlyPlayingBufferedAudioFormatInfo:](self, "setCurrentlyPlayingBufferedAudioFormatInfo:", [MEMORY[0x1E4F1C9E8] dictionary]);
    }
    CMSMNotificationUtility_PostSourceFormatInfoDidChange();
    return 0;
  }
  if (dword_1E9359ED0)
  {
    id v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return -15685;
}

- (int)setDoesntActuallyPlayAudio:(BOOL)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->mDoesntActuallyPlayAudio == a3) {
    return 0;
  }
  self->mDoesntActuallyPlayAudio = a3;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  int result = +[MXSession updateDoesntActuallyPlayAudio:](MXSession, "updateDoesntActuallyPlayAudio:", self->mCoreSession, v6, v7);
  if (!result)
  {
    if (!self->mDoesntActuallyPlayAudio && self->mIsPlaying) {
      return MX_FeatureFlags_IsMandrakeEverywhereEnabled();
    }
    return 0;
  }
  return result;
}

- (int)setClientType:(int)a3
{
  self->mClientType = a3;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return 0;
}

- (id)getClientTypeAsString
{
  unsigned int v2 = self->mClientType - 1;
  if (v2 > 3) {
    return @"Invalid";
  }
  else {
    return off_1E57CAE00[v2];
  }
}

+ (int)updateDoesntActuallyPlayAudio:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = (void *)[a3 copyMXSessionList];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    char v6 = 0;
    uint64_t v7 = *(void *)v16;
    int v8 = 1;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v10 getIsPlaying])
        {
          v8 &= [v10 getDoesntActuallyPlayAudio];
          char v6 = 1;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
    char v11 = v6 & v8;
    if ((v11 & 1) == [a3 doesntActuallyPlayAudio])
    {
      LODWORD(v5) = 0;
      goto LABEL_18;
    }
  }
  else
  {
    char v11 = 0;
    if (([a3 doesntActuallyPlayAudio] & 1) == 0) {
      goto LABEL_18;
    }
  }
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v13 = (NSDictionary **)MEMORY[0x1E4F1CFC8];
  if (v11) {
    uint64_t v13 = (NSDictionary **)MEMORY[0x1E4F1CFD0];
  }
  LODWORD(v5) = MXCoreSessionSetProperty(a3, @"DoesntActuallyPlayAudio", *v13, 0);
LABEL_18:

  return v5;
}

- (void)updateBadgeType
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = CMSUtility_SessionCanBeAndAllowedToBeNowPlayingApp(self->mCoreSession);
  mCoreSession = self->mCoreSession;
  if (v3)
  {
    id v5 = [(MXCoreSession *)mCoreSession copyMXSessionList];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v32 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      id v8 = 0;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v5);
          }
          if ([*(id *)(*((void *)&v20 + 1) + 8 * i) getIsPlaying])
          {
            if (![(MXSession *)self getIsMuted])
            {
              [(NSRecursiveLock *)self->mRecursiveLock lock];
              id v11 = [(NSDictionary *)self->mCurrentlyPlayingBufferedAudioFormatInfo objectForKey:@"ContentType"];
              [(NSRecursiveLock *)self->mRecursiveLock unlock];
              if (v11) {
                id v8 = v11;
              }
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v32 count:16];
      }
      while (v7);
    }
    else
    {
      id v8 = 0;
    }
    id v13 = [+[MXSessionManager sharedInstance] copyEvaluatedBadgeType:v8];
    if (dword_1E9359ED0)
    {
      unsigned int v25 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v15 = v25;
      if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
        unsigned int v16 = v15;
      }
      else {
        unsigned int v16 = v15 & 0xFFFFFFFE;
      }
      if (v16)
      {
        id v17 = [(MXCoreSessionBase *)self->mCoreSession info];
        int v26 = 136315650;
        long long v27 = "-[MXSession(InternalUse) updateBadgeType]";
        __int16 v28 = 2114;
        id v29 = v13;
        __int16 v30 = 2114;
        id v31 = v17;
        LODWORD(v19) = 32;
        long long v18 = &v26;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[MXCoreSession setBadgeType:](self->mCoreSession, "setBadgeType:", v13, v18, v19);
  }
  else
  {
    [(MXCoreSession *)mCoreSession setBadgeType:@"NotApplicable"];
    if (dword_1E9359ED0)
    {
      unsigned int v25 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

- (BOOL)getDoesntActuallyPlayAudio
{
  return self->mDoesntActuallyPlayAudio;
}

+ (int)updateIsRecording:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = (void *)[a3 copyMXSessionList];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v14 + 1) + 8 * i) getIsRecording]) {
          char v6 = 1;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
    char v6 = 0;
  }
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v10 = (NSDictionary **)MEMORY[0x1E4F1CFC8];
  if (v6) {
    uint64_t v10 = (NSDictionary **)MEMORY[0x1E4F1CFD0];
  }
  int v11 = MXCoreSessionSetProperty(a3, @"IsRecording", *v10, 0);

  return v11;
}

- (BOOL)getIsRecording
{
  return self->mIsRecording;
}

+ (int)updateIsPlaying:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = (void *)[a3 copyMXSessionList];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v15 + 1) + 8 * i) getIsPlaying]) {
          char v6 = 1;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  else
  {
    char v6 = 0;
  }
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v10 = (NSDictionary **)MEMORY[0x1E4F1CFC8];
  if (v6) {
    uint64_t v10 = (NSDictionary **)MEMORY[0x1E4F1CFD0];
  }
  int IsMandrakeEverywhereEnabled = MXCoreSessionSetProperty(a3, @"SomeMXSessionIsPlaying", *v10, 0);
  if (IsMandrakeEverywhereEnabled
    || (v6 & 1) != 0 && (int IsMandrakeEverywhereEnabled = MX_FeatureFlags_IsMandrakeEverywhereEnabled()) != 0)
  {
    int v12 = IsMandrakeEverywhereEnabled;
  }
  else
  {
    CMSMNotificationUtility_PostSomeSessionIsPlayingDidChange();
    if (CMSUtility_IsAudioCategoryPrimary(a3))
    {
      CMSMNotificationUtility_PostSomePrimaryAudioCategoryIsPlayingDidChange(a3);
      CMSMNotificationUtility_PostSomeOtherPrimaryAudioCategoryIsPlayingDidChange(a3);
    }
    int v12 = 0;
  }

  return v12;
}

- (int)getClientType
{
  return self->mClientType;
}

- (id)getBestAvailableContentType
{
  [(NSRecursiveLock *)self->mRecursiveLock lock];
  unsigned int v3 = self->mBestAvailableContentType;
  [(NSRecursiveLock *)self->mRecursiveLock unlock];
  return v3;
}

- (id)getCurrentlyPlayingSourceFormatInfo
{
  [(NSRecursiveLock *)self->mRecursiveLock lock];
  unsigned int v3 = self->mCurrentlyPlayingSourceFormatInfo;
  [(NSRecursiveLock *)self->mRecursiveLock unlock];
  return v3;
}

- (void)setInterruptionCalledOffAudioControlQueue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[MXCoreSession setIsInterruptionCalledOffAudioControlQueue:](self->mCoreSession, "setIsInterruptionCalledOffAudioControlQueue:", v3, v6, v7);
}

- (int)_beginInterruptionWithSecTask:(__SecTask *)a3 andFlags:(unint64_t)a4
{
  return MXCoreSessionBeginInterruption_WithSecTaskAndFlags(self->mCoreSession, a3, a4, 0);
}

- (BOOL)getIsMuted
{
  return self->mIsMuted;
}

- (unsigned)getPreferredNumberOfOutputChannels
{
  return self->mPreferredNumberOfOutputChannels;
}

- (double)getPreferredOutputSampleRate
{
  return self->mPreferredOutputSampleRate;
}

- (id)getPreferredAudioHardwareFormat
{
  [(NSRecursiveLock *)self->mRecursiveLock lock];
  BOOL v3 = self->mPreferredAudioHardwareFormat;
  [(NSRecursiveLock *)self->mRecursiveLock unlock];
  return v3;
}

- (BOOL)getIAmPiP
{
  return self->mIAmPiP;
}

- (BOOL)getActuallyPlaysAudio
{
  return !self->mDoesntActuallyPlayAudio;
}

- (BOOL)getIsPlayingOutput
{
  return self->mIsPlayingOutput;
}

+ (void)initialize
{
  if (self == a1)
  {
    sNonSerializedCopyProperties = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"ActivationContext", @"AirPlayVideoIsActive", @"AllowedRouteTypes", @"AllowedToUseHardwareAudioCodec", @"AllowMixableAudioWhileRecording", @"AllowSystemSoundsWhileRecording", @"AudioBehaviour", @"AudioCategory", @"AudioHardwareControlFlags", @"AudioMode", @"AudioOnlyAirPlayVideoIsActive", @"AudioToolboxIsPlaying", @"BestAvailableContentType", @"BadgeType", @"DoesGameAudioNeedToBeSpatialized", @"CanBeginInterruption", @"DefaultBuiltInRoute",
                                     @"EnableBluetoothRecording",
                                     @"ClientName",
                                     @"ClientPID",
                                     @"ClientPriority",
                                     @"ConstantOutputVolumeLeveldB",
                                     @"ControlsRoute",
                                     @"AudioSessionID",
                                     @"CurrentAudioHardwareSampleRate",
                                     @"CurrentInputSampleRate",
                                     @"CurrentlyPlayingContentIsEligibleForSpatialization",
                                     @"CurrentlyPlayingSourceFormatInfo",
                                     @"CurrentlyPlayingBufferedAudioFormatInfo",
                                     @"CurrentOutputSampleRate",
                                     @"CurrentSpeechDetectionDeviceSampleRate",
                                     @"DefaultVPChatMode",
                                     @"DetailedActiveAudioRoute",
                                     @"DoesntActuallyPlayAudio",
                                     @"DoNotNotifyOtherSessionsOnNextInactive",
                                     @"DoNotResetAudioCategoryOnNextInactive",
                                     @"DuckFadeDuration",
                                     @"DuckToLevelDB",
                                     @"DuckToLevelScalar",
                                     @"ForceSoundCheck",
                                     @"HapticEngineIsPlaying",
                                     @"HandsOverInterruptionsToInterruptor",
                                     @"HostApplicationDisplayID",
                                     @"HostProcessAttribution",
                                     @"IAmTheAssistant",
                                     @"MXSessionID",
                                     @"InterruptionFadeDuration",
                                     @"InterruptionStyle",
                                     @"IsActive",
                                     @"IsAirPlayReceiverSession",
                                     @"BypassSystemSpatialAudioForGame",
                                     @"IsAudioSession",
                                     @"IsEligibleForBTSmartRoutingConsideration",
                                     @"IsEligibleForNowPlayingAppConsideration",
                                     @"IsEligibleForBTTriangleConsideration",
                                     @"IsExpanseCallSession",
                                     @"IsExpanseMediaSession",
                                     @"IsFigInstantiatedAudioSession",
                                     @"IsInterrupted",
                                     @"IsLongFormAudio",
                                     @"IsMuted");
    sNonSerializedSetProperties = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"AirPlayVideoIsActive", @"AllowMixableAudioWhileRecording", @"AudioOnlyAirPlayVideoIsActive", @"AuditToken", @"AllowSystemSoundsWhileRecording", @"BestAvailableContentType", @"ClientName", @"ClientPID", @"ClientSecTask", @"ClientType", @"CurrentlyPlayingContentIsEligibleForSpatialization", @"CurrentlyPlayingSourceFormatInfo", @"DisallowAudioFormatChanges", @"DoesInterAppAudio", @"DoNotNotifyOtherSessionsOnNextInactive", @"DoNotResetAudioCategoryOnNextInactive", @"DuckFadeDuration",
                                    @"DuckToLevelDB",
                                    @"ForceSoundCheck",
                                    @"HandsOverInterruptionsToInterruptor",
                                    @"HostProcessAttribution",
                                    @"IAmIDSMXCoreSession",
                                    @"IAmHardwareSafetySession",
                                    @"IAmPiP",
                                    @"IAmCar",
                                    @"InterruptionFadeDuration",
                                    @"IsAirPlayReceiverSession",
                                    @"IsAudioSession",
                                    @"IsEligibleForNowPlayingAppConsideration",
                                    @"IsFigInstantiatedAudioSession",
                                    @"IsLongFormAudio",
                                    @"IsSharedAVAudioSessionInstance",
                                    @"IsSharePlayCapableCallSession",
                                    @"IsUsingBuiltInMicForRecording",
                                    @"IsRecordingMutedForRemoteDevice",
                                    @"IsUsingCamera",
                                    @"NeroSuspended",
                                    @"OptOutOfMutePriority",
                                    @"PrefersBeingInterruptedByNextActiveRecordingClient",
                                    @"PrefersBluetoothAccessoryMuting",
                                    @"PrefersConcurrentAirPlayAudio",
                                    @"PrefersNoDucking",
                                    @"PrefersNoInterruptions",
                                    @"PrefersNoInterruptionsByMixableSessions",
                                    @"PrefersNoInterruptionsDuringRemoteDeviceControl",
                                    @"PrefersSpeechDetectEnabled",
                                    @"PrefersToOptOutOfHardwareSafetyInterruptions",
                                    @"PrefersToPlayDuringWombat",
                                    @"PrefersToTakeHWControlFlagsFromAnotherSession",
                                    @"PrefersToVibeWhenVibrationsAreDisabled",
                                    @"ProcessAssertionAuditTokens",
                                    @"ReporterIDs",
                                    @"SourceFormatInfo",
                                    @"SubscribeToNotifications",
                                    @"TemporaryAssertionEnabled",
                                    @"UnduckFadeDuration",
                                    @"VibrationData",
                                    @"WantsAutomaticClusterPairingOnPlaybackStart",
                                    @"WantsToBeVolumeButtonClient",
                                    @"WantsToPauseSpokenAudio",
                                    @"WantsToSendResumableEndInterruptionWhenBackgrounded");
    sNonSerializedSetPropertiesWhenSessionIsInactive = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"AllowedRouteTypes", @"AudioClockDevice", @"AudioCategory", @"AudioMode", @"AudioHardwareControlFlags", @"CameraParameters", @"CaptureOrientationOverride", @"DefaultBuiltInRoute", @"EnableBluetoothRecording", @"ClientPriority", @"ConstantOutputVolumeLeveldB", @"AudioSessionID", @"CreateSpeakerDevice", @"DefaultVPChatMode", @"DeselectedInputs", @"DuckToLevelScalar", @"ExcludedRoutes",
                                                         @"IAmTheAssistant",
                                                         @"IgnoreRingerSwitch",
                                                         @"InputGainScalar",
                                                         @"InterruptionStyle",
                                                         @"IsEligibleForBTSmartRoutingConsideration",
                                                         @"IsEligibleForBTTriangleConsideration",
                                                         @"MutesAudioBasedOnRingerSwitchState",
                                                         @"OrientationOverride",
                                                         @"PreferredAudioHardwareFormat",
                                                         @"PreferredAudioHardwareIOBufferFrameDuration",
                                                         @"PreferredAudioHardwareIOBufferFrames",
                                                         @"PreferredDecoupledInputOutput",
                                                         @"PreferredInputs",
                                                         @"PreferredInputSampleRate",
                                                         @"PreferredPersistentRoute",
                                                         @"PreferredStereoInputOrientation",
                                                         @"PrefersEchoCancelledInput",
                                                         @"PrefersInterruptionOnRouteDisconnect",
                                                         @"PrefersNoInterruptionsByRingtonesAndAlerts",
                                                         @"PreferredRouteControlFeatures",
                                                         @"RequiresAggregatedInputOutput",
                                                         @"SelectedInputs",
                                                         @"SelectedOutputs",
                                                         @"UnduckToLevelScalar",
                                                         @"VPBlockConfiguration",
                                                         0);
    sOrderedMXSessionProperties = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAA0]), "initWithObjects:", @"ClientType", @"ClientName", @"IsAudioSession", @"AudioSessionID", @"ClientPID", @"ClientSecTask", @"AuditToken", @"IAmTheAssistant", @"IAmCar", @"IAmIDSMXCoreSession", @"IAmHardwareSafetySession", @"AudioCategory", @"AudioMode", @"EnableBluetoothRecording", @"DefaultBuiltInRoute", @"ClientPriority", @"InterruptionStyle",
                                    @"RouteSharingPolicy",
                                    @"ActivationContext",
                                    @"DoesntActuallyPlayAudio",
                                    @"IsSharePlayCapableCallSession",
                                    @"IsExpanseCallSession",
                                    @"IsExpanseMediaSession",
                                    @"IsEligibleForBTTriangleConsideration",
                                    @"IsEligibleForBTSmartRoutingConsideration",
                                    @"VibrationData",
                                    @"VibratorOn",
                                    0);
  }
}

+ (unsigned)getResolvedPreferredNumberOfOutputChannels:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)[a3 copyMXSessionList];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unsigned int v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        unsigned int v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) getPreferredNumberOfOutputChannels];
        if (v9 > v6) {
          unsigned int v6 = v9;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    unsigned int v6 = 0;
  }

  return v6;
}

- (id)getSourceFormatInfo
{
  [(NSRecursiveLock *)self->mRecursiveLock lock];
  BOOL v3 = self->mSourceFormatInfo;
  [(NSRecursiveLock *)self->mRecursiveLock unlock];
  return v3;
}

- (id)copyCurrentlyPlayingBufferedAudioSourceFormatInfo
{
  [(NSRecursiveLock *)self->mRecursiveLock lock];
  BOOL v3 = self->mCurrentlyPlayingBufferedAudioFormatInfo;
  [(NSRecursiveLock *)self->mRecursiveLock unlock];
  return v3;
}

- (BOOL)getCurrentlyPlayingContentIsEligibleForSpatialization
{
  return self->mCurrentlyPlayingContentIsEligibleForSpatialization;
}

- (int)setID:(unint64_t)a3
{
  self->unint64_t mID = a3;
  return 0;
}

- (int)setIAmPiP:(BOOL)a3
{
  if (self->mIAmPiP != a3)
  {
    self->mIAmPiP = a3;
    if (dword_1E9359ED0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return 0;
}

- (int)resetIsPlayingStates
{
  self->BOOL mIsPlaying = 0;
  self->BOOL mClientIsPlaying = 0;
  self->BOOL mAudioToolboxIsPlaying = 0;
  self->mIsPlayingOutput = 0;
  return 0;
}

- (int)setPreferredNumberOfOutputChannels:(unsigned int)a3
{
  self->mPreferredNumberOfOutputChannels = a3;
  return +[MXSession updatePreferredNumberOfOutputChannels:self->mCoreSession];
}

- (int)setPreferredAudioHardwareFormat:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", -[MXSession getPreferredAudioHardwareFormat](self, "getPreferredAudioHardwareFormat")))return 0; {
  [(NSRecursiveLock *)self->mRecursiveLock lock];
  }

  self->mPreferredAudioHardwareFormat = (NSString *)a3;
  [(NSRecursiveLock *)self->mRecursiveLock unlock];
  mCoreSession = self->mCoreSession;
  return +[MXSession updatePreferredAudioHardwareFormat:mCoreSession withMaxOutputChannels:0 andCalledFromDealloc:0];
}

- (int)setPreferredOutputSampleRate:(double)a3
{
  if (self->mPreferredOutputSampleRate == a3) {
    return 0;
  }
  self->mPreferredOutputSampleRate = a3;
  return +[MXSession updatePreferredOutputSampleRate:self->mCoreSession];
}

- (int)setIsMuted:(BOOL)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->mIsMuted != a3)
  {
    self->mIsMuted = a3;
    if (dword_1E9359ED0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (CMSUtility_IsAudioCategoryPrimary(self->mCoreSession))
    {
      CMSMNotificationUtility_PostSomePrimaryAudioCategoryIsPlayingDidChange(self->mCoreSession);
      CMSMNotificationUtility_PostSomeOtherPrimaryAudioCategoryIsPlayingDidChange(self->mCoreSession);
    }
    [(MXSession *)self updateBadgeType];
  }
  return 0;
}

- (int)setSourceFormatInfo:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(NSRecursiveLock *)self->mRecursiveLock lock];

  self->mSourceFormatInfo = (NSDictionary *)a3;
  [(NSRecursiveLock *)self->mRecursiveLock unlock];
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if ([(MXSession *)self getIsPlaying]) {
    CMSMNotificationUtility_PostSourceFormatInfoDidChange();
  }
  return 0;
}

- (int)setBestAvailableContentType:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ((objc_msgSend(a3, "isEqualToString:", -[MXSession getBestAvailableContentType](self, "getBestAvailableContentType")) & 1) == 0)
  {
    [(NSRecursiveLock *)self->mRecursiveLock lock];

    self->mBestAvailableContentType = (NSString *)a3;
    [(NSRecursiveLock *)self->mRecursiveLock unlock];
    if (dword_1E9359ED0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if ([(MXSession *)self getIsPlaying]
      || [(MXSession *)self getClientType] == 2)
    {
      CMSMNotificationUtility_PostSourceFormatInfoDidChange();
    }
  }
  return 0;
}

- (int)setCurrentlyPlayingSourceFormatInfo:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(NSRecursiveLock *)self->mRecursiveLock lock];

  self->mCurrentlyPlayingSourceFormatInfo = (NSDictionary *)a3;
  [(NSRecursiveLock *)self->mRecursiveLock unlock];
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if ([(MXSession *)self getIsPlaying]) {
    CMSMNotificationUtility_PostSourceFormatInfoDidChange();
  }
  return 0;
}

- (int)setCurrentlyPlayingBufferedAudioFormatInfo:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(NSRecursiveLock *)self->mRecursiveLock lock];

  self->mCurrentlyPlayingBufferedAudioFormatInfo = (NSDictionary *)a3;
  [(NSRecursiveLock *)self->mRecursiveLock unlock];
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  [(MXSession *)self updateBadgeType];
  return 0;
}

- (int)setCurrentlyPlayingContentIsEligibleForSpatialization:(BOOL)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->mCurrentlyPlayingContentIsEligibleForSpatialization != a3)
  {
    self->mCurrentlyPlayingContentIsEligibleForSpatialization = a3;
    if (dword_1E9359ED0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if ([(MXSession *)self getIsPlaying]) {
      CMSMNotificationUtility_PostSourceFormatInfoDidChange();
    }
  }
  return 0;
}

+ (int)updatePreferredNumberOfOutputChannels:(id)a3
{
  int result = +[MXSession isCoreSessionFormatValidForMaxOutputChannels:](MXSession, "isCoreSessionFormatValidForMaxOutputChannels:", [a3 preferredHardwareFormat]);
  if (result)
  {
    uint64_t v5 = +[MXSession getResolvedPreferredNumberOfOutputChannels:a3];
    if ([a3 preferredNumberOfOutputChannels] == v5)
    {
      return 0;
    }
    else
    {
      uint64_t v6 = (NSDictionary *)[MEMORY[0x1E4F28ED0] numberWithInt:v5];
      if (dword_1E9359ED0)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      return MXCoreSessionSetProperty(a3, @"PreferredNumberOfOutputChannels", v6, 0);
    }
  }
  return result;
}

+ (int)updatePreferredAudioHardwareFormat:(id)a3 withMaxOutputChannels:(unsigned int)a4 andCalledFromDealloc:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)[a3 copyMXSessionList];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v7)
  {
    uint64_t v10 = @"LPCM";
    if (!v5) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v20;
  uint64_t v10 = @"LPCM";
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v20 != v9) {
        objc_enumerationMutation(v6);
      }
      long long v12 = (void *)[*(id *)(*((void *)&v19 + 1) + 8 * i) getPreferredAudioHardwareFormat];
      if ([v12 isEqualToString:@"MATAtmos"])
      {
        uint64_t v10 = @"MATAtmos";
        goto LABEL_14;
      }
      if ([v12 isEqualToString:@"AC-3"]
        && [(__CFString *)v10 isEqualToString:@"LPCM"])
      {
        uint64_t v10 = @"AC-3";
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8) {
      continue;
    }
    break;
  }
LABEL_14:
  if (v5)
  {
LABEL_15:
    UpdatedHardwareFormatBasedOnPreferredNumberOfOutputChannelsAndPreferredHardwareFormat = CMSessionMgrGetUpdatedHardwareFormatBasedOnPreferredNumberOfOutputChannelsAndPreferredHardwareFormat(a4, (uint64_t)v10);
    if (!FigCFEqual()) {
      uint64_t v10 = UpdatedHardwareFormatBasedOnPreferredNumberOfOutputChannelsAndPreferredHardwareFormat;
    }
  }
LABEL_17:
  if (objc_msgSend((id)objc_msgSend(a3, "preferredHardwareFormat"), "isEqualToString:", v10))
  {
    int v14 = 0;
  }
  else
  {
    if (dword_1E9359ED0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    int v14 = MXCoreSessionSetProperty(a3, @"PreferredAudioHardwareFormat", (NSDictionary *)v10, 0);
  }

  return v14;
}

+ (int)updatePreferredOutputSampleRate:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[a3 copyMXSessionList];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    double v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * i) getPreferredOutputSampleRate];
        if (v10 > v8) {
          double v8 = v10;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
    *(float *)&double v11 = v8;
  }
  else
  {
    double v11 = 0.0;
  }
  long long v12 = (NSDictionary *)[MEMORY[0x1E4F28ED0] numberWithFloat:v11];
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  int v14 = MXCoreSessionSetProperty(a3, @"PreferredOutputSampleRate", v12, 0);

  return v14;
}

+ (int)updateIsPlayingOutput:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[a3 copyMXSessionList];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v16 != v7) {
        objc_enumerationMutation(v4);
      }
      if ([*(id *)(*((void *)&v15 + 1) + 8 * v8) getIsPlayingOutput]) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    if ([a3 isPlayingOutput])
    {
      int v10 = 0;
      goto LABEL_20;
    }
    int v9 = 1;
  }
  else
  {
LABEL_9:
    int v9 = 0;
    int v10 = 0;
    if (([a3 isPlayingOutput] & 1) == 0) {
      goto LABEL_20;
    }
  }
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  long long v12 = (NSDictionary **)MEMORY[0x1E4F1CFC8];
  if (v9) {
    long long v12 = (NSDictionary **)MEMORY[0x1E4F1CFD0];
  }
  int v10 = MXCoreSessionSetProperty(a3, @"IsPlayingOutput", *v12, 0);
  if (v10)
  {
    long long v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_20:

  return v10;
}

- (void)mute
{
  if (!self->mIsMuted)
  {
    CMSMUtility_AudioToolboxHandleInterruptionCommandWithMXSessionID(self->mCoreSession, self->mID, 8);
    [(MXSession *)self setIsMuted:1];
    [(MXSession *)self postIsMutedDidChange];
  }
}

- (void)unmute
{
  if (self->mIsMuted)
  {
    CMSMUtility_AudioToolboxHandleInterruptionCommandWithMXSessionID(self->mCoreSession, self->mID, 9);
    [(MXSession *)self setIsMuted:0];
    [(MXSession *)self postIsMutedDidChange];
  }
}

- (void)postIsMutedDidChange
{
  if (self)
  {
    BOOL v3 = self;
    uint64_t v4 = MXGetNotificationSenderQueue();
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __46__MXSession_InternalUse__postIsMutedDidChange__block_invoke;
    v5[3] = &unk_1E57C6368;
    v5[4] = self;
    MXDispatchAsync((uint64_t)"-[MXSession(InternalUse) postIsMutedDidChange]", (uint64_t)"MXSession_Impl_Embedded.m", 1368, 0, 0, v4, (uint64_t)v5);
  }
}

void __46__MXSession_InternalUse__postIsMutedDidChange__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  BOOL v3 = objc_msgSend(v2, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "getIsMuted")), @"Muted", 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"IsMutedDidChange", *(void *)(a1 + 32), v3);

  uint64_t v4 = *(void **)(a1 + 32);
}

+ (id)copyMXSessionForID:(unint64_t)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1997179E0](a1, a2);
  unint64_t v5 = 0x1EB3B9000uLL;
  [+[MXSessionManager sharedInstance] mxCoreSessionListBeginIteration];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = [+[MXSessionManager sharedInstance] mxCoreSessionList];
  uint64_t v6 = [(NSPointerArray *)obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    long long v19 = v4;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(obj);
        }
        int v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        objc_msgSend(v10, "mxSessionListBeginIteration", v19);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        double v11 = (void *)[v10 mxSessionList];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v22;
LABEL_8:
          uint64_t v15 = 0;
          while (1)
          {
            if (*(void *)v22 != v14) {
              objc_enumerationMutation(v11);
            }
            long long v16 = *(void **)(*((void *)&v21 + 1) + 8 * v15);
            if ([v16 getID] == a3) {
              break;
            }
            if (v13 == ++v15)
            {
              uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
              if (v13) {
                goto LABEL_8;
              }
              goto LABEL_14;
            }
          }
          id v17 = v16;
          [v10 mxSessionListEndIteration];
          if (v17) {
            goto LABEL_19;
          }
        }
        else
        {
LABEL_14:
          [v10 mxSessionListEndIteration];
        }
      }
      uint64_t v7 = [(NSPointerArray *)obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v7);
    id v17 = 0;
LABEL_19:
    uint64_t v4 = v19;
    unint64_t v5 = 0x1EB3B9000;
  }
  else
  {
    id v17 = 0;
  }
  objc_msgSend((id)objc_msgSend((id)(v5 + 3392), "sharedInstance"), "mxCoreSessionListEndIteration");
  return v17;
}

+ (BOOL)isCoreSessionFormatValidForMaxOutputChannels:(id)a3
{
  if ([a3 isEqualToString:@"AC-3"]) {
    return 0;
  }
  else {
    return [a3 isEqualToString:@"MATAtmos"] ^ 1;
  }
}

+ (id)getSetPropertiesOrder
{
  return (id)sOrderedMXSessionProperties;
}

- (void)dumpInfo
{
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)_dealloc
{
  v26[16] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(MXCoreSession *)self->mCoreSession mxSessionListAddSession:0];
  unint64_t mID = self->mID;
  unint64_t v5 = NSString;
  unint64_t mCoreSessionID = self->mCoreSessionID;
  uint64_t v7 = [(MXCoreSessionBase *)self->mCoreSession clientName];
  uint64_t v8 = @"YES";
  if (self->mIsMuted) {
    int v9 = @"YES";
  }
  else {
    int v9 = @"NO";
  }
  if (self->mIsPlaying) {
    int v10 = @"YES";
  }
  else {
    int v10 = @"NO";
  }
  if (self->mIAmPiP) {
    double v11 = @"YES";
  }
  else {
    double v11 = @"NO";
  }
  if (self->mDoesntActuallyPlayAudio) {
    uint64_t v12 = @"YES";
  }
  else {
    uint64_t v12 = @"NO";
  }
  if (!self->mIsPlayingOutput) {
    uint64_t v8 = @"NO";
  }
  [v5 stringWithFormat:@"<MXSessionID: %llx, CoreSessionID = %lld Name = %@, Muted = %@, Playing = %@, MutePriority = %@, PiP = %@, DoesntActuallyPlayAudio = %@, clientType = %x, IsPlayingOutput = %@", mID, mCoreSessionID, v7, v9, v10, self->mMutePriority, v11, v12, self->mClientType, v8];
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  BOOL v13 = [(NSString *)self->mMutePriority isEqualToString:@"MutePriority_One"];
  if (v3) {
    BOOL v14 = 0;
  }
  else {
    BOOL v14 = v13;
  }
  if (v14)
  {
    if (dword_1E9359ED0)
    {
      int v21 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    *((unsigned char *)v23 + 24) = 1;
  }
  else if (dword_1E9359ED0)
  {
    int v21 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    long long v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3052000000;
  v26[3] = __Block_byref_object_copy__9;
  mCoreSession = self->mCoreSession;
  v26[4] = __Block_byref_object_dispose__9;
  v26[5] = mCoreSession;
  long long v18 = MXGetSerialQueue();
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __36__MXSession_InterfaceImpl___dealloc__block_invoke;
  v19[3] = &unk_1E57C9240;
  v19[4] = v26;
  v19[5] = &v22;
  v19[6] = v3;
  MXDispatchAsync((uint64_t)"-[MXSession(InterfaceImpl) _dealloc]", (uint64_t)"MXSession_Impl_Embedded.m", 1566, 0, 0, v18, (uint64_t)v19);

  self->mDescription = 0;
  self->mPreferredAudioHardwareFormat = 0;

  self->mMutePriority = 0;
  self->mSourceFormatInfo = 0;

  self->mCurrentlyPlayingSourceFormatInfo = 0;
  self->mCurrentlyPlayingBufferedAudioFormatInfo = 0;

  self->mBestAvailableContentType = 0;
  self->mRecursiveLocuint64_t k = 0;
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v22, 8);
}

void __36__MXSession_InterfaceImpl___dealloc__block_invoke(void *a1)
{
  id v2 = *(void **)(*(void *)(a1[4] + 8) + 40);
  if (a1[6])
  {
    +[MXSession updateIsPlaying:v2];
    +[MXSession updateIsRecording:v2];
    +[MXSession updatePreferredAudioHardwareFormat:withMaxOutputChannels:andCalledFromDealloc:](MXSession, "updatePreferredAudioHardwareFormat:withMaxOutputChannels:andCalledFromDealloc:", v2, +[MXSession getResolvedPreferredNumberOfOutputChannels:v2], 1);
    if (+[MXSession isCoreSessionFormatValidForMaxOutputChannels:](MXSession, "isCoreSessionFormatValidForMaxOutputChannels:", [v2 preferredHardwareFormat]))
    {
      +[MXSession updatePreferredNumberOfOutputChannels:v2];
    }
    +[MXSession updatePreferredOutputSampleRate:v2];
    +[MXSession updateDoesntActuallyPlayAudio:v2];
  }
  else
  {
    MXCoreSessionTeardown(*(void **)(*(void *)(a1[4] + 8) + 40));
  }

  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    MX_FeatureFlags_IsMandrakeEverywhereEnabled();
  }
}

- (int)_addResource:(__CFString *)a3 resourceInfo:(__CFDictionary *)a4 token:(OpaqueCMSessionResourceToken *)a5
{
  return MXCoreSessionAddResource(self->mCoreSession, (uint64_t)a3, (uint64_t)a4, a5);
}

- (int)_removeResourceWithToken:(OpaqueCMSessionResourceToken *)a3
{
  return MXCoreSessionRemoveResource((uint64_t)self->mCoreSession, a3);
}

- (int)_endInterruptionWithSecTask:(__SecTask *)a3 andStatus:(__CFString *)a4
{
  return MXCoreSessionEndInterruption_WithSecTaskAndStatus(self->mCoreSession, a3, a4, 0);
}

+ (BOOL)isSessionMuted:(unint64_t)a3
{
  +[MXInitialization waitUntilMXIsFullyInitialized];
  id v4 = +[MXSession copyMXSessionForID:a3];
  char v5 = [v4 getIsMuted];
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }

  return v5;
}

uint64_t __37__MXSession_setPropertyForKey_value___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _setPropertyForKey:*(void *)(a1 + 40) value:*(void *)(a1 + 48)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (void)dealloc
{
  unint64_t v3 = (void *)MEMORY[0x1997179E0](self, a2);
  [(MXSession *)self _dealloc];
  v4.receiver = self;
  v4.super_class = (Class)MXSession;
  [(MXSession *)&v4 dealloc];
}

@end