@interface CHDefaultHapticDeviceCapability
- (BOOL)supportsAudio;
- (BOOL)supportsHaptics;
- (CHDefaultHapticDeviceCapability)init;
- (float)defaultValueForDynamicParameter:(id)a3;
- (float)defaultValueForEventParameter:(id)a3 eventType:(id)a4;
- (float)maximumValueForDynamicParameter:(id)a3;
- (float)maximumValueForEventParameter:(id)a3;
- (float)minimumValueForDynamicParameter:(id)a3;
- (float)minimumValueForEventParameter:(id)a3;
- (id)attributesForDynamicParameter:(id)a3 error:(id *)a4;
- (id)attributesForEventParameter:(id)a3 eventType:(id)a4 error:(id *)a5;
- (id)initPrivate;
- (unint64_t)maximumNumberOfAudioChannels;
- (unint64_t)maximumNumberOfHapticChannels;
@end

@implementation CHDefaultHapticDeviceCapability

- (id)attributesForEventParameter:(id)a3 eventType:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  [(CHDefaultHapticDeviceCapability *)self minimumValueForEventParameter:v8];
  float v11 = v10;
  [(CHDefaultHapticDeviceCapability *)self maximumValueForEventParameter:v8];
  float v13 = v12;
  [(CHDefaultHapticDeviceCapability *)self defaultValueForEventParameter:v8 eventType:v9];
  float v15 = v14;
  if (v11 != -999.0 && v13 != -999.0 && v14 != -999.0)
  {
    v16 = [CHHapticParameterAttributesImpl alloc];
    *(float *)&double v17 = v11;
    *(float *)&double v18 = v13;
    *(float *)&double v19 = v15;
    v20 = [(CHHapticParameterAttributesImpl *)v16 initWithMinValue:v17 maxValue:v18 defaultValue:v19];
    goto LABEL_15;
  }
  if (!kHAPIScope)
  {
    v21 = MEMORY[0x1E4F14500];
    id v22 = MEMORY[0x1E4F14500];
    goto LABEL_9;
  }
  v21 = *(id *)kHAPIScope;
  if (v21)
  {
LABEL_9:
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v24 = 136315906;
      v25 = "CHDeviceCapability.mm";
      __int16 v26 = 1024;
      int v27 = 355;
      __int16 v28 = 2080;
      v29 = "-[CHDefaultHapticDeviceCapability attributesForEventParameter:eventType:error:]";
      __int16 v30 = 2112;
      id v31 = v8;
      _os_log_impl(&dword_1BA902000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: In parameter %@ is not a valid CHHapticEventParameter", (uint8_t *)&v24, 0x26u);
    }
  }
  if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4820 userInfo:0];
    v20 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
LABEL_15:

  return v20;
}

- (float)minimumValueForEventParameter:(id)a3
{
  v11[10] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v10[0] = CHHapticEventParameterIDHapticIntensity;
  v10[1] = CHHapticEventParameterIDHapticSharpness;
  v11[0] = &unk_1F145A478;
  v11[1] = &unk_1F145A478;
  v10[2] = CHHapticEventParameterIDAttackTime;
  v10[3] = CHHapticEventParameterIDDecayTime;
  v11[2] = &unk_1F145A478;
  v11[3] = &unk_1F145A478;
  v10[4] = CHHapticEventParameterIDReleaseTime;
  v10[5] = CHHapticEventParameterIDSustained;
  v11[4] = &unk_1F145A478;
  v11[5] = &unk_1F145A478;
  v10[6] = CHHapticEventParameterIDAudioVolume;
  v10[7] = CHHapticEventParameterIDAudioPitch;
  v11[6] = &unk_1F145A478;
  v11[7] = &unk_1F145A488;
  v10[8] = CHHapticEventParameterIDAudioPan;
  v10[9] = CHHapticEventParameterIDAudioBrightness;
  v11[8] = &unk_1F145A488;
  v11[9] = &unk_1F145A478;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:10];
  v5 = [v4 objectForKey:v3];
  v6 = v5;
  if (v5)
  {
    [v5 floatValue];
    float v8 = v7;
  }
  else
  {
    float v8 = -999.0;
  }

  return v8;
}

- (float)maximumValueForEventParameter:(id)a3
{
  v11[10] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v10[0] = CHHapticEventParameterIDHapticIntensity;
  v10[1] = CHHapticEventParameterIDHapticSharpness;
  v11[0] = &unk_1F145A468;
  v11[1] = &unk_1F145A468;
  v10[2] = CHHapticEventParameterIDAttackTime;
  v10[3] = CHHapticEventParameterIDDecayTime;
  v11[2] = &unk_1F145A468;
  v11[3] = &unk_1F145A468;
  v10[4] = CHHapticEventParameterIDReleaseTime;
  v10[5] = CHHapticEventParameterIDSustained;
  v11[4] = &unk_1F145A468;
  v11[5] = &unk_1F145A468;
  v10[6] = CHHapticEventParameterIDAudioVolume;
  v10[7] = CHHapticEventParameterIDAudioPitch;
  v11[6] = &unk_1F145A468;
  v11[7] = &unk_1F145A468;
  v10[8] = CHHapticEventParameterIDAudioPan;
  v10[9] = CHHapticEventParameterIDAudioBrightness;
  v11[8] = &unk_1F145A468;
  v11[9] = &unk_1F145A468;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:10];
  v5 = [v4 objectForKey:v3];
  v6 = v5;
  if (v5)
  {
    [v5 floatValue];
    float v8 = v7;
  }
  else
  {
    float v8 = -999.0;
  }

  return v8;
}

- (float)defaultValueForEventParameter:(id)a3 eventType:(id)a4
{
  v14[10] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (![v5 isEqualToString:CHHapticEventParameterIDHapticIntensity]
    || (float v7 = 0.75, ([v6 isEqualToString:CHHapticEventTypeHapticTransient] & 1) == 0))
  {
    if (![v5 isEqualToString:CHHapticEventParameterIDHapticSharpness]
      || (float v7 = 0.5, ([v6 isEqualToString:CHHapticEventTypeHapticTransient] & 1) == 0))
    {
      v13[0] = CHHapticEventParameterIDHapticIntensity;
      v13[1] = CHHapticEventParameterIDHapticSharpness;
      v14[0] = &unk_1F145A498;
      v14[1] = &unk_1F145A4A8;
      v13[2] = CHHapticEventParameterIDAttackTime;
      v13[3] = CHHapticEventParameterIDDecayTime;
      v14[2] = &unk_1F145A478;
      v14[3] = &unk_1F145A478;
      v13[4] = CHHapticEventParameterIDReleaseTime;
      v13[5] = CHHapticEventParameterIDSustained;
      v14[4] = &unk_1F145A478;
      v14[5] = &unk_1F145A478;
      v13[6] = CHHapticEventParameterIDAudioVolume;
      v13[7] = CHHapticEventParameterIDAudioPitch;
      v14[6] = &unk_1F145A468;
      v14[7] = &unk_1F145A478;
      v13[8] = CHHapticEventParameterIDAudioPan;
      v13[9] = CHHapticEventParameterIDAudioBrightness;
      v14[8] = &unk_1F145A478;
      v14[9] = &unk_1F145A468;
      float v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:10];
      id v9 = [v8 objectForKey:v5];
      float v10 = v9;
      if (v9)
      {
        [v9 floatValue];
        float v7 = v11;
      }
      else
      {
        float v7 = -999.0;
      }
    }
  }

  return v7;
}

- (id)initPrivate
{
  setupHapticLogScopes();
  v5.receiver = self;
  v5.super_class = (Class)CHDefaultHapticDeviceCapability;
  id v3 = [(CHDefaultHapticDeviceCapability *)&v5 init];
  if (v3)
  {
    v3->_supportsAudio = +[AVHapticPlayer supportsAudio];
    v3->_supportsHaptics = +[AVHapticPlayer supportsHaptics];
  }
  return v3;
}

- (CHDefaultHapticDeviceCapability)init
{
  return 0;
}

- (BOOL)supportsHaptics
{
  return self->_supportsHaptics;
}

- (BOOL)supportsAudio
{
  return self->_supportsAudio;
}

- (unint64_t)maximumNumberOfHapticChannels
{
  return 1;
}

- (unint64_t)maximumNumberOfAudioChannels
{
  return 2;
}

- (float)maximumValueForDynamicParameter:(id)a3
{
  v11[12] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v10[0] = CHHapticDynamicParameterIDHapticIntensityControl;
  v10[1] = CHHapticDynamicParameterIDHapticSharpnessControl;
  v11[0] = &unk_1F145A468;
  v11[1] = &unk_1F145A468;
  v10[2] = CHHapticDynamicParameterIDHapticAttackTimeControl;
  v10[3] = CHHapticDynamicParameterIDHapticDecayTimeControl;
  v11[2] = &unk_1F145A468;
  v11[3] = &unk_1F145A468;
  v10[4] = CHHapticDynamicParameterIDHapticReleaseTimeControl;
  v10[5] = CHHapticDynamicParameterIDAudioVolumeControl;
  v11[4] = &unk_1F145A468;
  v11[5] = &unk_1F145A468;
  v10[6] = CHHapticDynamicParameterIDAudioPanControl;
  v10[7] = CHHapticDynamicParameterIDAudioBrightnessControl;
  v11[6] = &unk_1F145A468;
  v11[7] = &unk_1F145A468;
  v10[8] = CHHapticDynamicParameterIDAudioPitchControl;
  v10[9] = CHHapticDynamicParameterIDAudioAttackTimeControl;
  v11[8] = &unk_1F145A468;
  v11[9] = &unk_1F145A468;
  void v10[10] = CHHapticDynamicParameterIDAudioDecayTimeControl;
  v10[11] = CHHapticDynamicParameterIDAudioReleaseTimeControl;
  v11[10] = &unk_1F145A468;
  void v11[11] = &unk_1F145A468;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:12];
  objc_super v5 = [v4 objectForKey:v3];
  id v6 = v5;
  if (v5)
  {
    [v5 floatValue];
    float v8 = v7;
  }
  else
  {
    float v8 = -999.0;
  }

  return v8;
}

- (float)minimumValueForDynamicParameter:(id)a3
{
  v11[12] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v10[0] = CHHapticDynamicParameterIDHapticIntensityControl;
  v10[1] = CHHapticDynamicParameterIDHapticSharpnessControl;
  v11[0] = &unk_1F145A478;
  v11[1] = &unk_1F145A488;
  v10[2] = CHHapticDynamicParameterIDHapticAttackTimeControl;
  v10[3] = CHHapticDynamicParameterIDHapticDecayTimeControl;
  v11[2] = &unk_1F145A488;
  v11[3] = &unk_1F145A488;
  v10[4] = CHHapticDynamicParameterIDHapticReleaseTimeControl;
  v10[5] = CHHapticDynamicParameterIDAudioVolumeControl;
  v11[4] = &unk_1F145A488;
  v11[5] = &unk_1F145A478;
  v10[6] = CHHapticDynamicParameterIDAudioPanControl;
  v10[7] = CHHapticDynamicParameterIDAudioBrightnessControl;
  v11[6] = &unk_1F145A488;
  v11[7] = &unk_1F145A488;
  v10[8] = CHHapticDynamicParameterIDAudioPitchControl;
  v10[9] = CHHapticDynamicParameterIDAudioAttackTimeControl;
  v11[8] = &unk_1F145A488;
  v11[9] = &unk_1F145A488;
  void v10[10] = CHHapticDynamicParameterIDAudioDecayTimeControl;
  v10[11] = CHHapticDynamicParameterIDAudioReleaseTimeControl;
  v11[10] = &unk_1F145A488;
  void v11[11] = &unk_1F145A488;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:12];
  objc_super v5 = [v4 objectForKey:v3];
  id v6 = v5;
  if (v5)
  {
    [v5 floatValue];
    float v8 = v7;
  }
  else
  {
    float v8 = -999.0;
  }

  return v8;
}

- (float)defaultValueForDynamicParameter:(id)a3
{
  v11[12] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v10[0] = CHHapticDynamicParameterIDHapticIntensityControl;
  v10[1] = CHHapticDynamicParameterIDHapticSharpnessControl;
  v11[0] = &unk_1F145A468;
  v11[1] = &unk_1F145A478;
  v10[2] = CHHapticDynamicParameterIDHapticAttackTimeControl;
  v10[3] = CHHapticDynamicParameterIDHapticDecayTimeControl;
  v11[2] = &unk_1F145A478;
  v11[3] = &unk_1F145A478;
  v10[4] = CHHapticDynamicParameterIDHapticReleaseTimeControl;
  v10[5] = CHHapticDynamicParameterIDAudioVolumeControl;
  v11[4] = &unk_1F145A478;
  v11[5] = &unk_1F145A468;
  v10[6] = CHHapticDynamicParameterIDAudioPanControl;
  v10[7] = CHHapticDynamicParameterIDAudioBrightnessControl;
  v11[6] = &unk_1F145A478;
  v11[7] = &unk_1F145A478;
  v10[8] = CHHapticDynamicParameterIDAudioPitchControl;
  v10[9] = CHHapticDynamicParameterIDAudioAttackTimeControl;
  v11[8] = &unk_1F145A478;
  v11[9] = &unk_1F145A478;
  void v10[10] = CHHapticDynamicParameterIDAudioDecayTimeControl;
  v10[11] = CHHapticDynamicParameterIDAudioReleaseTimeControl;
  v11[10] = &unk_1F145A478;
  void v11[11] = &unk_1F145A478;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:12];
  objc_super v5 = [v4 objectForKey:v3];
  id v6 = v5;
  if (v5)
  {
    [v5 floatValue];
    float v8 = v7;
  }
  else
  {
    float v8 = -999.0;
  }

  return v8;
}

- (id)attributesForDynamicParameter:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(CHDefaultHapticDeviceCapability *)self minimumValueForDynamicParameter:v6];
  float v8 = v7;
  [(CHDefaultHapticDeviceCapability *)self maximumValueForDynamicParameter:v6];
  float v10 = v9;
  [(CHDefaultHapticDeviceCapability *)self defaultValueForDynamicParameter:v6];
  float v12 = v11;
  if (v8 != -999.0 && v10 != -999.0 && v11 != -999.0)
  {
    float v13 = [CHHapticParameterAttributesImpl alloc];
    *(float *)&double v14 = v8;
    *(float *)&double v15 = v10;
    *(float *)&double v16 = v12;
    double v17 = [(CHHapticParameterAttributesImpl *)v13 initWithMinValue:v14 maxValue:v15 defaultValue:v16];
    goto LABEL_15;
  }
  if (!kHAPIScope)
  {
    double v18 = MEMORY[0x1E4F14500];
    id v19 = MEMORY[0x1E4F14500];
    goto LABEL_9;
  }
  double v18 = *(id *)kHAPIScope;
  if (v18)
  {
LABEL_9:
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136315906;
      id v22 = "CHDeviceCapability.mm";
      __int16 v23 = 1024;
      int v24 = 370;
      __int16 v25 = 2080;
      __int16 v26 = "-[CHDefaultHapticDeviceCapability attributesForDynamicParameter:error:]";
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_impl(&dword_1BA902000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: In parameter %@ is not a valid CHHapticDynamicParameter", (uint8_t *)&v21, 0x26u);
    }
  }
  if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4820 userInfo:0];
    double v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v17 = 0;
  }
LABEL_15:

  return v17;
}

@end