@interface VCTuningParameters
- (VCTuningParameters)init;
- (VCTuningParameters)initWithDictionary:(id)a3;
- (float)cameraResetDuration;
- (float)oneShotFramingDuration;
- (float)superWideToWideSwitchMargin;
- (float)wideToSuperWideSwitchMargin;
- (void)setCameraResetDuration:(float)a3;
- (void)setOneShotFramingDuration:(float)a3;
- (void)setSuperWideToWideSwitchMargin:(float)a3;
- (void)setWideToSuperWideSwitchMargin:(float)a3;
@end

@implementation VCTuningParameters

- (VCTuningParameters)init
{
  v8.receiver = self;
  v8.super_class = (Class)VCTuningParameters;
  v2 = [(VCTuningParameters *)&v8 init];
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [v3 pathForResource:@"virtualCameraParameters" ofType:@"plist"];
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v4];
  if (v4)
  {
    v2 = [(VCTuningParameters *)v2 initWithDictionary:v5];
    v6 = v2;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (VCTuningParameters)initWithDictionary:(id)a3
{
  v4 = (NSDictionary *)a3;
  v20.receiver = self;
  v20.super_class = (Class)VCTuningParameters;
  v5 = [(VCTuningParameters *)&v20 init];
  plist = v5->_plist;
  v5->_plist = v4;
  v7 = v4;

  objc_super v8 = v5->_plist;
  char v21 = 0;
  LODWORD(v9) = 1.0;
  [(NSDictionary *)v8 cmi_floatValueForKey:@"OneShotFramingDuration" defaultValue:&v21 found:v9];
  v5->_oneShotFramingDuration = v10;
  v11 = v5->_plist;
  char v21 = 0;
  LODWORD(v12) = 1.0;
  [(NSDictionary *)v11 cmi_floatValueForKey:@"CameraResetDuration" defaultValue:&v21 found:v12];
  v5->_cameraResetDuration = v13;
  v14 = [(NSDictionary *)v5->_plist objectForKeyedSubscript:@"CameraSwitchingMargin"];

  char v21 = 0;
  LODWORD(v15) = 1008981770;
  objc_msgSend(v14, "cmi_floatValueForKey:defaultValue:found:", @"WideToSuperWide", &v21, v15);
  v5->_wideToSuperWideSwitchMargin = v16;
  char v21 = 0;
  LODWORD(v17) = 1028443341;
  objc_msgSend(v14, "cmi_floatValueForKey:defaultValue:found:", @"SuperWideToWide", &v21, v17);
  v5->_superWideToWideSwitchMargin = v18;

  return v5;
}

- (float)oneShotFramingDuration
{
  return self->_oneShotFramingDuration;
}

- (void)setOneShotFramingDuration:(float)a3
{
  self->_oneShotFramingDuration = a3;
}

- (float)cameraResetDuration
{
  return self->_cameraResetDuration;
}

- (void)setCameraResetDuration:(float)a3
{
  self->_cameraResetDuration = a3;
}

- (float)wideToSuperWideSwitchMargin
{
  return self->_wideToSuperWideSwitchMargin;
}

- (void)setWideToSuperWideSwitchMargin:(float)a3
{
  self->_wideToSuperWideSwitchMargin = a3;
}

- (float)superWideToWideSwitchMargin
{
  return self->_superWideToWideSwitchMargin;
}

- (void)setSuperWideToWideSwitchMargin:(float)a3
{
  self->_superWideToWideSwitchMargin = a3;
}

- (void).cxx_destruct
{
}

@end