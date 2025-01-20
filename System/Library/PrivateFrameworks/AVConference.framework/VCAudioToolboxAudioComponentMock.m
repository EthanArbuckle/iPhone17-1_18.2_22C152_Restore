@interface VCAudioToolboxAudioComponentMock
+ (id)sharedInstance;
- (BOOL)copyName:(OpaqueAudioComponent *)a3 outName:(const __CFString *)a4 outStatus:(int *)a5;
- (BOOL)findNextComponent:(OpaqueAudioComponent *)a3 description:(const AudioComponentDescription *)a4 outComponent:(OpaqueAudioComponent *)a5;
- (BOOL)getVersion:(OpaqueAudioComponent *)a3 outVersion:(unsigned int *)a4 outStatus:(int *)a5;
- (BOOL)instanceDispose:(OpaqueAudioComponentInstance *)a3 outStatus:(int *)a4;
- (BOOL)instanceNew:(OpaqueAudioComponent *)a3 outInstance:(OpaqueAudioComponentInstance *)a4 outStatus:(int *)a5;
- (void)start;
- (void)stop;
@end

@implementation VCAudioToolboxAudioComponentMock

+ (id)sharedInstance
{
  if (sharedInstance_token_2 != -1) {
    dispatch_once(&sharedInstance_token_2, &__block_literal_global_54);
  }
  return (id)sharedInstance__audioComponentMock;
}

VCAudioToolboxAudioComponentMock *__50__VCAudioToolboxAudioComponentMock_sharedInstance__block_invoke()
{
  result = objc_alloc_init(VCAudioToolboxAudioComponentMock);
  sharedInstance__audioComponentMock = (uint64_t)result;
  return result;
}

- (void)start
{
  objc_sync_enter(self);
  if (!self->_isMockingEnabled)
  {
    _audioComponentStub = (uint64_t (*)(void))VCAudioToolboxAudioComponentMock_FindNext;
    off_1EB5E6330 = (uint64_t (*)(void))VCAudioToolboxAudioComponentMock_InstanceNew;
    off_1EB5E6338 = (uint64_t (*)(void))VCAudioToolboxAudioComponentMock_InstanceDispose;
    qword_1EB5E6340 = (uint64_t)VCAudioToolboxAudioComponentMock_GetVersion;
    off_1EB5E6348 = (uint64_t (*)(void))VCAudioToolboxAudioComponentMock_CopyName;
    self->_isMockingEnabled = 1;
  }

  objc_sync_exit(self);
}

- (void)stop
{
  objc_sync_enter(self);
  if (self->_isMockingEnabled)
  {
    _audioComponentStub = (uint64_t (*)(void))MEMORY[0x1E4F18980];
    off_1EB5E6330 = (uint64_t (*)(void))MEMORY[0x1E4F18998];
    off_1EB5E6338 = (uint64_t (*)(void))MEMORY[0x1E4F18990];
    qword_1EB5E6340 = MEMORY[0x1E4F18988];
    off_1EB5E6348 = (uint64_t (*)(void))MEMORY[0x1E4F18978];
    self->_isMockingEnabled = 0;
  }

  objc_sync_exit(self);
}

- (BOOL)findNextComponent:(OpaqueAudioComponent *)a3 description:(const AudioComponentDescription *)a4 outComponent:(OpaqueAudioComponent *)a5
{
  if (a3 || a4->componentType != 1635086197 || a4->componentFlags || a4->componentFlagsMask) {
    return 0;
  }
  BOOL result = 0;
  signed int componentSubType = a4->componentSubType;
  if (componentSubType > 1919512418)
  {
    if (componentSubType == 1919512419)
    {
      uint64_t v7 = 1919512419;
      goto LABEL_16;
    }
    if (componentSubType == 1987078511)
    {
      uint64_t v7 = 1987078511;
      goto LABEL_16;
    }
  }
  else
  {
    if (componentSubType == 1635017072)
    {
      uint64_t v7 = 1635017072;
      goto LABEL_16;
    }
    if (componentSubType == 1768907362)
    {
      uint64_t v7 = 1650616687;
LABEL_16:
      *a5 = (OpaqueAudioComponent *)v7;
      return 1;
    }
  }
  return result;
}

- (BOOL)instanceNew:(OpaqueAudioComponent *)a3 outInstance:(OpaqueAudioComponentInstance *)a4 outStatus:(int *)a5
{
  BOOL result = 0;
  if ((uint64_t)a3 <= 1684366946)
  {
    if (a3 == (OpaqueAudioComponent *)1635017072)
    {
      v6 = "isys";
    }
    else
    {
      if (a3 != (OpaqueAudioComponent *)1650616687) {
        return result;
      }
      v6 = "nibb";
    }
  }
  else if (a3 == (OpaqueAudioComponent *)1684366947)
  {
    v6 = "ifed";
  }
  else if (a3 == (OpaqueAudioComponent *)1919512419)
  {
    v6 = "ioir";
  }
  else
  {
    if (a3 != (OpaqueAudioComponent *)1987078511) {
      return result;
    }
    v6 = "nipv";
  }
  *a4 = *(OpaqueAudioComponentInstance **)v6;
  *a5 = 0;
  [+[VCCoreAudio_AudioUnitMock sharedInstance] registerAudioUnitMockInstance:*a4];
  return 1;
}

- (BOOL)instanceDispose:(OpaqueAudioComponentInstance *)a3 outStatus:(int *)a4
{
  BOOL v7 = *(OpaqueAudioComponentInstance **)"nipv" == a3
    || *(void *)"nibb" == (void)a3
    || *(void *)"ioir" == (void)a3
    || *(void *)"ifed" == (void)a3
    || *(void *)"isys" == (void)a3;
  BOOL v8 = v7;
  if (v7)
  {
    *a4 = 0;
    [+[VCCoreAudio_AudioUnitMock sharedInstance] unregisterAudioUnitMockInstance:a3];
  }
  return v8;
}

- (BOOL)getVersion:(OpaqueAudioComponent *)a3 outVersion:(unsigned int *)a4 outStatus:(int *)a5
{
  BOOL result = 0;
  if ((uint64_t)a3 <= 1684366946)
  {
    if (a3 == (OpaqueAudioComponent *)1635017072)
    {
      unsigned int v6 = 1937339254;
    }
    else
    {
      if (a3 != (OpaqueAudioComponent *)1650616687) {
        return result;
      }
      unsigned int v6 = 1650620019;
    }
  }
  else if (a3 == (OpaqueAudioComponent *)1684366947)
  {
    unsigned int v6 = 1734700918;
  }
  else if (a3 == (OpaqueAudioComponent *)1919512419)
  {
    unsigned int v6 = 1919512438;
  }
  else
  {
    if (a3 != (OpaqueAudioComponent *)1987078511) {
      return result;
    }
    unsigned int v6 = 1987081843;
  }
  *a4 = v6;
  *a5 = 0;
  return 1;
}

- (BOOL)copyName:(OpaqueAudioComponent *)a3 outName:(const __CFString *)a4 outStatus:(int *)a5
{
  BOOL result = 0;
  if ((uint64_t)a3 <= 1684366946)
  {
    if (a3 == (OpaqueAudioComponent *)1635017072)
    {
      BOOL v7 = &VCAudioToolboxAudioComponentMock_SystemAudioOutputName;
    }
    else
    {
      if (a3 != (OpaqueAudioComponent *)1650616687) {
        return result;
      }
      BOOL v7 = &VCAudioToolboxAudioComponentMock_BasebandName;
    }
  }
  else if (a3 == (OpaqueAudioComponent *)1684366947)
  {
    BOOL v7 = &VCAudioToolboxAudioComponentMock_DefaultOutputName;
  }
  else if (a3 == (OpaqueAudioComponent *)1919512419)
  {
    BOOL v7 = &VCAudioToolboxAudioComponentMock_RemoteIOName;
  }
  else
  {
    if (a3 != (OpaqueAudioComponent *)1987078511) {
      return result;
    }
    BOOL v7 = &VCAudioToolboxAudioComponentMock_VoiceProcessorName;
  }
  *a4 = (const __CFString *)[[NSString alloc] initWithUTF8String:*v7];
  *a5 = 0;
  return 1;
}

@end