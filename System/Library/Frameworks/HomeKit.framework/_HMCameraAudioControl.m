@interface _HMCameraAudioControl
- (HMCharacteristic)mute;
- (HMCharacteristic)volume;
- (_HMCameraAudioControl)initWithCameraProfile:(id)a3 profileUniqueIdentifier:(id)a4 service:(id)a5;
@end

@implementation _HMCameraAudioControl

- (_HMCameraAudioControl)initWithCameraProfile:(id)a3 profileUniqueIdentifier:(id)a4 service:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v26.receiver = self;
  v26.super_class = (Class)_HMCameraAudioControl;
  v9 = [(_HMCameraControl *)&v26 initWithCameraProfile:a3 profileUniqueIdentifier:a4];
  if (v9)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v10 = [v8 characteristics];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          v16 = [v15 characteristicType];
          char v17 = [v16 isEqualToString:@"0000011A-0000-1000-8000-0026BB765291"];

          v18 = &OBJC_IVAR____HMCameraAudioControl__mute;
          if ((v17 & 1) == 0)
          {
            v19 = [v15 characteristicType];
            int v20 = [v19 isEqualToString:@"00000119-0000-1000-8000-0026BB765291"];

            v18 = &OBJC_IVAR____HMCameraAudioControl__volume;
            if (!v20) {
              continue;
            }
          }
          objc_storeStrong((id *)((char *)&v9->super.super.isa + *v18), v15);
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v12);
    }
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volume, 0);

  objc_storeStrong((id *)&self->_mute, 0);
}

- (HMCharacteristic)volume
{
  return self->_volume;
}

- (HMCharacteristic)mute
{
  return self->_mute;
}

@end