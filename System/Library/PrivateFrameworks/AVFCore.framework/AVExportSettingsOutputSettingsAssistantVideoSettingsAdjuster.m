@interface AVExportSettingsOutputSettingsAssistantVideoSettingsAdjuster
- (AVExportSettingsOutputSettingsAssistantVideoSettingsAdjuster)initWithOutputSettingsPreset:(id)a3;
- (id)colorSpaceFromSourceFormatDescriptions:(id)a3 andRendererColorSpace:(id)a4;
- (int64_t)averageBitRateForSourceFormatDescription:(opaqueCMFormatDescription *)a3 andTargetFrameRate:(float)a4 andEncoderSpecification:(id)a5;
- (void)dealloc;
@end

@implementation AVExportSettingsOutputSettingsAssistantVideoSettingsAdjuster

- (AVExportSettingsOutputSettingsAssistantVideoSettingsAdjuster)initWithOutputSettingsPreset:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVExportSettingsOutputSettingsAssistantVideoSettingsAdjuster;
  v4 = [(AVExportSettingsOutputSettingsAssistantVideoSettingsAdjuster *)&v7 init];
  if (v4)
  {
    v4->_outputSettingsPresetIdentifier = (NSString *)[a3 copy];
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
  v3.super_class = (Class)AVExportSettingsOutputSettingsAssistantVideoSettingsAdjuster;
  [(AVExportSettingsOutputSettingsAssistantVideoSettingsAdjuster *)&v3 dealloc];
}

- (int64_t)averageBitRateForSourceFormatDescription:(opaqueCMFormatDescription *)a3 andTargetFrameRate:(float)a4 andEncoderSpecification:(id)a5
{
  id v8 = [(NSDictionary *)self->_exportSettings objectForKey:*MEMORY[0x1E4F32AD0]];
  if (!v8) {
    return 0;
  }
  int v9 = (int)v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if (a5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
  }
  outputSettingsPresetIdentifier = self->_outputSettingsPresetIdentifier;
  return AVExportSettingsAverageBitRateForSourceAndOutputSettingsPreset(v9, (int)a5, (uint64_t)outputSettingsPresetIdentifier, a3);
}

- (id)colorSpaceFromSourceFormatDescriptions:(id)a3 andRendererColorSpace:(id)a4
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id result = [(NSDictionary *)self->_exportSettings objectForKey:*MEMORY[0x1E4F32AD0]];
  if (result)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
    id result = AVExportSettingsEffectiveColorPropertyForPresetAndInputOutputFormat();
    if (!result) {
      return result;
    }
    id v5 = result;
    uint64_t v6 = [result objectForKeyedSubscript:*MEMORY[0x1E4F32A68]];
    uint64_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F32AB8]];
    uint64_t v8 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F32AE0]];
    BOOL v9 = !v6 || v7 == 0;
    if (v9 || v8 == 0)
    {
      return 0;
    }
    else
    {
      v11[0] = @"ColorPrimaries";
      v11[1] = @"TransferFunction";
      v12[0] = v6;
      v12[1] = v7;
      v11[2] = @"YCbCrMatrix";
      v12[2] = v8;
      return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
    }
  }
  return result;
}

@end