@interface FigCaptureStillImageProcessingSettings
+ (BOOL)supportsSecureCoding;
- ($2825F4736939C4A6D3AD43837233062D)sensorRawDimensions;
- ($2825F4736939C4A6D3AD43837233062D)ultraHighResSensorRawDimensions;
- (FigCaptureStillImageProcessingSettings)initWithCoder:(id)a3;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)moduleCalibrationByPortType;
- (float)uiZoomFactor;
- (unsigned)sensorRawPixelFormat;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setModuleCalibrationByPortType:(id)a3;
- (void)setSensorRawDimensions:(id)a3;
- (void)setSensorRawPixelFormat:(unsigned int)a3;
- (void)setUiZoomFactor:(float)a3;
- (void)setUltraHighResSensorRawDimensions:(id)a3;
@end

@implementation FigCaptureStillImageProcessingSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  *(float *)&double v3 = self->_uiZoomFactor;
  [a3 encodeFloat:@"uiZoomFactor" forKey:v3];
  uint64_t sensorRawPixelFormat = self->_sensorRawPixelFormat;
  if (sensorRawPixelFormat)
  {
    [a3 encodeInt:sensorRawPixelFormat forKey:@"sensorRawPixelFormat"];
    [a3 encodeInt32:self->_sensorRawDimensions.width forKey:@"sensorRawDimensionWidth"];
    [a3 encodeInt32:self->_sensorRawDimensions.height forKey:@"sensorRawDimensionHeight"];
    [a3 encodeInt32:self->_ultraHighResSensorRawDimensions.width forKey:@"ultraHighResSensorRawDimensionWidth"];
    [a3 encodeInt32:self->_ultraHighResSensorRawDimensions.height forKey:@"ultraHighResSensorRawDimensionHeight"];
  }
  [a3 encodeObject:self->_cameraInfoByPortType forKey:@"cameraInfoByPortType"];
  moduleCalibrationByPortType = self->_moduleCalibrationByPortType;
  [a3 encodeObject:moduleCalibrationByPortType forKey:@"moduleCalibrationByPortType"];
}

- ($2825F4736939C4A6D3AD43837233062D)ultraHighResSensorRawDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_ultraHighResSensorRawDimensions;
}

- (unsigned)sensorRawPixelFormat
{
  return self->_sensorRawPixelFormat;
}

- ($2825F4736939C4A6D3AD43837233062D)sensorRawDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_sensorRawDimensions;
}

- (void)setUltraHighResSensorRawDimensions:(id)a3
{
  self->_ultraHighResSensorRawDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setUiZoomFactor:(float)a3
{
  self->_uiZoomFactor = a3;
}

- (void)setSensorRawPixelFormat:(unsigned int)a3
{
  self->_uint64_t sensorRawPixelFormat = a3;
}

- (void)setSensorRawDimensions:(id)a3
{
  self->_sensorRawDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setModuleCalibrationByPortType:(id)a3
{
}

- (void)setCameraInfoByPortType:(id)a3
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureStillImageProcessingSettings;
  [(FigCaptureStillImageProcessingSettings *)&v3 dealloc];
}

- (FigCaptureStillImageProcessingSettings)initWithCoder:(id)a3
{
  v23.receiver = self;
  v23.super_class = (Class)FigCaptureStillImageProcessingSettings;
  v4 = [(FigCaptureStillImageProcessingSettings *)&v23 init];
  if (v4)
  {
    [a3 decodeFloatForKey:@"uiZoomFactor"];
    v4->_uiZoomFactor = v5;
    unsigned int v6 = [a3 decodeIntForKey:@"sensorRawPixelFormat"];
    if (v6)
    {
      v4->_uint64_t sensorRawPixelFormat = v6;
      int v7 = [a3 decodeInt32ForKey:@"sensorRawDimensionWidth"];
      int v8 = [a3 decodeInt32ForKey:@"sensorRawDimensionHeight"];
      v4->_sensorRawDimensions.width = v7;
      v4->_sensorRawDimensions.height = v8;
      int v9 = [a3 decodeInt32ForKey:@"ultraHighResSensorRawDimensionWidth"];
      int v10 = [a3 decodeInt32ForKey:@"ultraHighResSensorRawDimensionHeight"];
      v4->_ultraHighResSensorRawDimensions.width = v9;
      v4->_ultraHighResSensorRawDimensions.height = v10;
    }
    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    v4->_cameraInfoByPortType = (NSDictionary *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, v16, v17, objc_opt_class(), 0), @"cameraInfoByPortType"), "copy");
    if ([a3 error]
      || (v18 = (void *)MEMORY[0x1E4F1CAD0],
          uint64_t v19 = objc_opt_class(),
          uint64_t v20 = objc_opt_class(),
          uint64_t v21 = objc_opt_class(),
          v4->_moduleCalibrationByPortType = (NSDictionary *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v18, "setWithObjects:", v19, v20, v21, objc_opt_class(), 0), @"moduleCalibrationByPortType"), "copy"), objc_msgSend(a3, "error")))
    {

      return 0;
    }
  }
  return v4;
}

- (float)uiZoomFactor
{
  return self->_uiZoomFactor;
}

- (NSDictionary)moduleCalibrationByPortType
{
  return self->_moduleCalibrationByPortType;
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

@end