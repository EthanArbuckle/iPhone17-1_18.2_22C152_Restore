@interface CBPreset
+ (id)newActive:(unint64_t)a3;
- (BOOL)autoBrighnessDisabled;
- (BOOL)brightnessDisabled;
- (BOOL)nightShiftDisabled;
- (BOOL)referenceMode;
- (BOOL)trueToneDisabled;
- (CBPreset)initWithCAPreset:(id)a3;
- (float)maxSDRLuminance;
@end

@implementation CBPreset

+ (id)newActive:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  Class v18 = (Class)a1;
  SEL v17 = a2;
  unint64_t v16 = a3;
  uint64_t v15 = 0;
  memset(__b, 0, sizeof(__b));
  id obj = (id)[MEMORY[0x1E4F39B60] displays];
  uint64_t v12 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
  if (v12)
  {
    uint64_t v8 = *(void *)__b[2];
    uint64_t v9 = 0;
    unint64_t v10 = v12;
    while (1)
    {
      uint64_t v7 = v9;
      if (*(void *)__b[2] != v8) {
        objc_enumerationMutation(obj);
      }
      id v14 = 0;
      id v14 = *(id *)(__b[1] + 8 * v9);
      int v3 = [v14 displayId];
      if (v3 == v16) {
        uint64_t v15 = [v14 currentPreset];
      }
      ++v9;
      if (v7 + 1 >= v10)
      {
        uint64_t v9 = 0;
        unint64_t v10 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
        if (!v10) {
          break;
        }
      }
    }
  }
  if (!v15) {
    return 0;
  }
  id v4 = [v18 alloc];
  return (id)[v4 initWithCAPreset:v15];
}

- (CBPreset)initWithCAPreset:(id)a3
{
  id v14 = self;
  SEL v13 = a2;
  id v12 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CBPreset;
  id v14 = [(CBPreset *)&v11 init];
  if (v14)
  {
    char v3 = [v12 allowAutoBrightness];
    v14->_autoBrighnessDisabled = (v3 ^ 1) & 1;
    char v4 = [v12 allowTrueTone];
    v14->_trueToneDisabled = (v4 ^ 1) & 1;
    char v5 = [v12 allowNightShift];
    v14->_nightShiftDisabled = (v5 ^ 1) & 1;
    [v12 minSliderBrightness];
    double v10 = v6;
    [v12 maxSliderBrightness];
    v14->_brightnessDisabled = vabdd_f64(v10, v7) < 0.5;
    char v8 = [v12 isReference];
    v14->_referenceMode = v8 & 1;
  }
  return v14;
}

- (float)maxSDRLuminance
{
  return -1.0;
}

- (BOOL)trueToneDisabled
{
  return self->_trueToneDisabled;
}

- (BOOL)nightShiftDisabled
{
  return self->_nightShiftDisabled;
}

- (BOOL)autoBrighnessDisabled
{
  return self->_autoBrighnessDisabled;
}

- (BOOL)brightnessDisabled
{
  return self->_brightnessDisabled;
}

- (BOOL)referenceMode
{
  return self->_referenceMode;
}

@end