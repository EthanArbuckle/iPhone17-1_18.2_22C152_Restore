@interface AFAudioPowerXPCProvider
- (AFAudioPowerXPCProvider)initWithXPCWrapper:(id)a3;
- (BOOL)getAveragePower:(float *)a3 andPeakPower:(float *)a4;
@end

@implementation AFAudioPowerXPCProvider

- (void).cxx_destruct
{
}

- (BOOL)getAveragePower:(float *)a3 andPeakPower:(float *)a4
{
  sharedMemory = self->_sharedMemory;
  if (!sharedMemory) {
    return 0;
  }
  BOOL v8 = a3 != 0;
  if (a3)
  {
    [(_AFAudioPowerXPCSharedMemory *)sharedMemory averagePower];
    *(_DWORD *)a3 = v9;
  }
  if (a4)
  {
    [(_AFAudioPowerXPCSharedMemory *)self->_sharedMemory peakPower];
    *(_DWORD *)a4 = v10;
    return 1;
  }
  return v8;
}

- (AFAudioPowerXPCProvider)initWithXPCWrapper:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AFAudioPowerXPCProvider;
  v5 = [(AFAudioPowerXPCProvider *)&v11 init];
  if (v5)
  {
    v6 = [_AFAudioPowerXPCSharedMemory alloc];
    v7 = [v4 xpcObject];
    uint64_t v8 = [(_AFAudioPowerXPCSharedMemory *)v6 initWithXPCObject:v7];
    sharedMemory = v5->_sharedMemory;
    v5->_sharedMemory = (_AFAudioPowerXPCSharedMemory *)v8;
  }
  return v5;
}

@end