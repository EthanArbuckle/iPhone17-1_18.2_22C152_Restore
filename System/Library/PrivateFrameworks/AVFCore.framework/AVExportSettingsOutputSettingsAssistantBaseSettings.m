@interface AVExportSettingsOutputSettingsAssistantBaseSettings
- (AVExportSettingsOutputSettingsAssistantBaseSettings)init;
- (AVExportSettingsOutputSettingsAssistantBaseSettings)initWithOutputSettingsPreset:(id)a3;
- (NSDictionary)baseAudioSettings;
- (NSDictionary)baseVideoSettings;
- (void)dealloc;
@end

@implementation AVExportSettingsOutputSettingsAssistantBaseSettings

- (AVExportSettingsOutputSettingsAssistantBaseSettings)init
{
  return [(AVExportSettingsOutputSettingsAssistantBaseSettings *)self initWithOutputSettingsPreset:0];
}

- (AVExportSettingsOutputSettingsAssistantBaseSettings)initWithOutputSettingsPreset:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVExportSettingsOutputSettingsAssistantBaseSettings;
  v4 = [(AVExportSettingsOutputSettingsAssistantBaseSettings *)&v7 init];
  if (v4)
  {
    uint64_t v5 = [(id)AVExportSettingsForOutputSettingsPreset((uint64_t)a3) copy];
    v4->_exportSettings = (NSDictionary *)v5;
    if (!v5)
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVExportSettingsOutputSettingsAssistantBaseSettings;
  [(AVExportSettingsOutputSettingsAssistantBaseSettings *)&v3 dealloc];
}

- (NSDictionary)baseAudioSettings
{
  id v2 = [(NSDictionary *)self->_exportSettings objectForKey:*MEMORY[0x1E4F32A58]];
  if (!v2) {
    return 0;
  }
  objc_super v3 = v2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if (![v3 objectForKey:*MEMORY[0x1E4F32A60]]) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || FigAudioCompressionOptionsGetPreset()) {
    return 0;
  }
  double v4 = MEMORY[0];
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:MEMORY[8]];
  uint64_t v7 = *MEMORY[0x1E4F151E0];
  uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithDouble:v4];
  uint64_t v9 = *MEMORY[0x1E4F15270];
  uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithInteger:0];
  return (NSDictionary *)objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v6, v7, v8, v9, v10, *MEMORY[0x1E4F15228], 0);
}

- (NSDictionary)baseVideoSettings
{
  objc_super v3 = (NSDictionary *)[MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(NSDictionary *)self->_exportSettings objectForKey:*MEMORY[0x1E4F32AD0]];
  if (v4)
  {
    uint64_t v5 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v5 objectForKey:*MEMORY[0x1E4F32AC8]];
      if (v6)
      {
        uint64_t v7 = (void *)v6;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unsigned int v8 = [v7 unsignedIntValue];
          if (v8 == 1752589105)
          {
            CFBooleanRef v9 = (const __CFBoolean *)[v5 objectForKey:*MEMORY[0x1E4F32A48]];
            if (v9)
            {
              CFBooleanRef v10 = v9;
              CFTypeID v11 = CFGetTypeID(v9);
              unsigned int v8 = 1752589105;
              if (v11 == CFBooleanGetTypeID())
              {
                if (CFBooleanGetValue(v10)) {
                  unsigned int v8 = 1836415073;
                }
                else {
                  unsigned int v8 = 1752589105;
                }
              }
            }
            else
            {
              unsigned int v8 = 1752589105;
            }
          }
          [(NSDictionary *)v3 setObject:AVStringForOSType(v8) forKey:@"AVVideoCodecKey"];
          uint64_t v12 = [v5 objectForKey:*MEMORY[0x1E4F32AD8]];
          uint64_t v13 = [v5 objectForKey:*MEMORY[0x1E4F32A88]];
          v14 = (void *)[v5 objectForKey:*MEMORY[0x1E4F32AA0]];
          uint64_t v15 = [v5 objectForKey:*MEMORY[0x1E4F32A98]];
          if (v14 && (uint64_t v16 = v15) != 0)
          {
            if ([v14 isEqual:v15])
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                return v3;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                return v3;
              }
              uint64_t v17 = [v14 integerValue];
              if (v17 == 640) {
                uint64_t v18 = 480;
              }
              else {
                uint64_t v18 = 9 * v17 / 16;
              }
              uint64_t v16 = [MEMORY[0x1E4F28ED0] numberWithInteger:v18];
            }
          }
          else
          {
            BOOL v19 = v12 != 0;
            BOOL v20 = v13 != 0;
            if (v19 && v20) {
              v14 = (void *)v12;
            }
            else {
              v14 = 0;
            }
            if (v19 && v20) {
              uint64_t v16 = v13;
            }
            else {
              uint64_t v16 = 0;
            }
          }
          if (v14) {
            BOOL v21 = v16 == 0;
          }
          else {
            BOOL v21 = 1;
          }
          if (!v21)
          {
            [(NSDictionary *)v3 setObject:v14 forKey:@"AVVideoWidthKey"];
            [(NSDictionary *)v3 setObject:v16 forKey:@"AVVideoHeightKey"];
            [(NSDictionary *)v3 setObject:@"AVVideoScalingModeResizeAspect" forKey:@"AVVideoScalingModeKey"];
            v22 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
            uint64_t v23 = [v5 objectForKey:*MEMORY[0x1E4F32AC0]];
            if (v23) {
              [v22 setObject:v23 forKey:@"AverageBitRate"];
            }
            uint64_t v24 = [v5 objectForKey:*MEMORY[0x1E4F32AA8]];
            if (v24) {
              [v22 setObject:v24 forKey:@"ProfileLevel"];
            }
            uint64_t v25 = [v5 objectForKey:*MEMORY[0x1E4F32A78]];
            if (v25) {
              [v22 setObject:v25 forKey:@"H264EntropyMode"];
            }
            uint64_t v26 = [v5 objectForKey:*MEMORY[0x1E4F32A90]];
            if (v26) {
              [v22 setObject:v26 forKey:@"MaxKeyFrameInterval"];
            }
            uint64_t v27 = [v5 objectForKey:*MEMORY[0x1E4F32A80]];
            if (v27) {
              [v22 setObject:v27 forKey:@"AllowFrameReordering"];
            }
            uint64_t v28 = [v5 objectForKey:*MEMORY[0x1E4F32A50]];
            if (v28) {
              [v22 setObject:v28 forKey:*MEMORY[0x1E4F44B30]];
            }
            if (v8 == 1752589105)
            {
              CFBooleanRef v29 = (const __CFBoolean *)[v5 objectForKey:*MEMORY[0x1E4F32AB0]];
              if (v29)
              {
                CFBooleanRef v30 = v29;
                CFTypeID v31 = CFGetTypeID(v29);
                if (v31 == CFBooleanGetTypeID())
                {
                  if (CFBooleanGetValue(v30))
                  {
                    [v22 setObject:&unk_1EE5E1B90 forKey:*MEMORY[0x1E4F449A0]];
                    [v22 setObject:&unk_1EE5E1BA8 forKey:*MEMORY[0x1E4F449A8]];
                    [v22 setObject:&unk_1EE5E1BC0 forKey:*MEMORY[0x1E4F44998]];
                  }
                }
              }
            }
            [(NSDictionary *)v3 setObject:v22 forKey:@"AVVideoCompressionPropertiesKey"];
            uint64_t v32 = *MEMORY[0x1E4F32A68];
            uint64_t v33 = [v5 objectForKey:*MEMORY[0x1E4F32A68]];
            uint64_t v34 = *MEMORY[0x1E4F32AB8];
            uint64_t v35 = [v5 objectForKey:*MEMORY[0x1E4F32AB8]];
            uint64_t v36 = *MEMORY[0x1E4F32AE0];
            uint64_t v37 = [v5 objectForKey:*MEMORY[0x1E4F32AE0]];
            if (v33 && v35 && v37)
            {
              uint64_t v38 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v33, @"ColorPrimaries", v35, @"TransferFunction", v37, @"YCbCrMatrix", 0);
LABEL_55:
              [(NSDictionary *)v3 setObject:v38 forKey:@"AVVideoColorPropertiesKey"];
              return v3;
            }
            v39 = (void *)[v5 objectForKey:*MEMORY[0x1E4F32A70]];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && [v39 count])
            {
              uint64_t v40 = objc_msgSend((id)objc_msgSend(v39, "objectAtIndexedSubscript:", 0), "objectForKey:", v32);
              uint64_t v41 = objc_msgSend((id)objc_msgSend(v39, "objectAtIndexedSubscript:", 0), "objectForKey:", v34);
              uint64_t v43 = objc_msgSend((id)objc_msgSend(v39, "objectAtIndexedSubscript:", 0), "objectForKey:", v36);
              uint64_t v38 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v40, @"ColorPrimaries", v41, @"TransferFunction", v43, @"YCbCrMatrix", 0);
              goto LABEL_55;
            }
          }
        }
      }
    }
  }
  return v3;
}

@end