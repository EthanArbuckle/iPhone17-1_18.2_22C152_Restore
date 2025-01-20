@interface FigCaptureMicSourcePipelineConfiguration
- (__n128)setClientAuditToken:(uint64_t)a1;
- (uint64_t)setAudioSourceNodeShouldCallEndInterruption:(uint64_t)result;
- (uint64_t)setClientOSVersionSupportsDecoupledIO:(uint64_t)result;
- (uint64_t)setConfiguresAppAudioSession:(uint64_t)result;
- (uint64_t)setConfiguresAppAudioSessionToMixWithOthers:(uint64_t)result;
- (void)dealloc;
- (void)micConnectionConfigurationsForMicSourcePosition:(uint64_t)a1;
@end

@implementation FigCaptureMicSourcePipelineConfiguration

- (void)micConnectionConfigurationsForMicSourcePosition:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = *(void **)(a1 + 16);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 builtInMicrophonePosition] == a2) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  return v4;
}

- (uint64_t)setConfiguresAppAudioSessionToMixWithOthers:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 57) = a2;
  }
  return result;
}

- (uint64_t)setConfiguresAppAudioSession:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 56) = a2;
  }
  return result;
}

- (uint64_t)setClientOSVersionSupportsDecoupledIO:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 59) = a2;
  }
  return result;
}

- (__n128)setClientAuditToken:(uint64_t)a1
{
  if (a1)
  {
    __n128 result = *(__n128 *)a2;
    *(_OWORD *)(a1 + 76) = *(_OWORD *)(a2 + 16);
    *(__n128 *)(a1 + 60) = result;
  }
  return result;
}

- (uint64_t)setAudioSourceNodeShouldCallEndInterruption:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 58) = a2;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureMicSourcePipelineConfiguration;
  [(FigCaptureMicSourcePipelineConfiguration *)&v3 dealloc];
}

@end