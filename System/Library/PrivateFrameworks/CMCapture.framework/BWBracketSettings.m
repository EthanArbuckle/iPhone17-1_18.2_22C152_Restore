@interface BWBracketSettings
+ (BOOL)supportsSecureCoding;
+ (id)bracketSettingsForBracketingMode:(int)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)lensStabilizationEnabledForClientBracket;
- (BOOL)providePreBracketedEV0;
- (BWBracketSettings)initWithCoder:(id)a3;
- (NSArray)exposureValues;
- (NSArray)manualExposureBracketedCaptureParams;
- (NSDictionary)oisBracketedCaptureParams;
- (id)description;
- (int)bracketFrameCount;
- (int)bracketingMode;
- (uint64_t)classesForExposureValues;
- (uint64_t)classesForManualExposureBracketedCaptureParams;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setExposureValues:(id)a3;
- (void)setLensStabilizationEnabledForClientBracket:(BOOL)a3;
- (void)setManualExposureBracketedCaptureParams:(id)a3;
- (void)setOisBracketedCaptureParams:(id)a3;
- (void)setProvidePreBracketedEV0:(BOOL)a3;
@end

@implementation BWBracketSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)bracketSettingsForBracketingMode:(int)a3
{
  v4 = [BWBracketSettings alloc];
  if (v4)
  {
    v6.receiver = v4;
    v6.super_class = (Class)BWBracketSettings;
    v4 = objc_msgSendSuper2(&v6, sel_init);
    if (v4) {
      v4->_bracketingMode = a3;
    }
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWBracketSettings;
  [(BWBracketSettings *)&v3 dealloc];
}

- (BWBracketSettings)initWithCoder:(id)a3
{
  v4 = [(BWBracketSettings *)self init];
  if (v4)
  {
    v4->_bracketingMode = [a3 decodeInt32ForKey:@"bracketingMode"];
    v4->_providePreBracketedEV0 = [a3 decodeBoolForKey:@"providePreBracketedEV0"];
    v4->_lensStabilizationEnabledForClientBracket = [a3 decodeBoolForKey:@"lensStabilizationEnabledForClientBracket"];
    v4->_exposureValues = (NSArray *)(id)[a3 decodeObjectOfClasses:-[BWBracketSettings classesForExposureValues]((uint64_t)v4) forKey:@"exposureValues"];
    v4->_manualExposureBracketedCaptureParams = (NSArray *)(id)[a3 decodeObjectOfClasses:-[BWBracketSettings classesForManualExposureBracketedCaptureParams]((uint64_t)v4) forKey:@"manualExposureBracketedCaptureParams"];
    v4->_oisBracketedCaptureParams = (NSDictionary *)(id)[a3 decodeObjectOfClasses:-[BWBracketSettings classesForManualExposureBracketedCaptureParams]((uint64_t)v4) forKey:@"oisBracketedCaptureParams"];
  }
  return v4;
}

- (uint64_t)classesForExposureValues
{
  if (result)
  {
    v1 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v2 = objc_opt_class();
    return objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  }
  return result;
}

- (uint64_t)classesForManualExposureBracketedCaptureParams
{
  if (result)
  {
    v1 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v2 = objc_opt_class();
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = objc_opt_class();
    return objc_msgSend(v1, "setWithObjects:", v2, v3, v4, objc_opt_class(), 0);
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInt32:self->_bracketingMode forKey:@"bracketingMode"];
  [a3 encodeBool:self->_providePreBracketedEV0 forKey:@"providePreBracketedEV0"];
  [a3 encodeBool:self->_lensStabilizationEnabledForClientBracket forKey:@"lensStabilizationEnabledForClientBracket"];
  [a3 encodeObject:self->_exposureValues forKey:@"exposureValues"];
  [a3 encodeObject:self->_manualExposureBracketedCaptureParams forKey:@"manualExposureBracketedCaptureParams"];
  oisBracketedCaptureParams = self->_oisBracketedCaptureParams;
  [a3 encodeObject:oisBracketedCaptureParams forKey:@"oisBracketedCaptureParams"];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v15) = 1;
  }
  else
  {
    uint64_t v19 = v5;
    uint64_t v20 = v4;
    uint64_t v21 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (int bracketingMode = self->_bracketingMode, bracketingMode == [a3 bracketingMode])
      && (int providePreBracketedEV0 = self->_providePreBracketedEV0,
          providePreBracketedEV0 == [a3 providePreBracketedEV0])
      && (int lensStabilizationEnabledForClientBracket = self->_lensStabilizationEnabledForClientBracket,
          lensStabilizationEnabledForClientBracket == [a3 lensStabilizationEnabledForClientBracket]))
    {
      exposureValues = self->_exposureValues;
      if (exposureValues == (NSArray *)[a3 exposureValues]
        || (int v15 = -[NSArray isEqual:](self->_exposureValues, "isEqual:", [a3 exposureValues])) != 0)
      {
        manualExposureBracketedCaptureParams = self->_manualExposureBracketedCaptureParams;
        if (manualExposureBracketedCaptureParams == (NSArray *)objc_msgSend(a3, "manualExposureBracketedCaptureParams", v6, v19, v20, v21, v7, v8)|| (int v15 = -[NSArray isEqual:](self->_manualExposureBracketedCaptureParams, "isEqual:", objc_msgSend(a3, "manualExposureBracketedCaptureParams"))) != 0)
        {
          oisBracketedCaptureParams = self->_oisBracketedCaptureParams;
          if (oisBracketedCaptureParams == (NSDictionary *)[a3 oisBracketedCaptureParams]
            || (int v15 = -[NSDictionary isEqual:](self->_oisBracketedCaptureParams, "isEqual:", [a3 oisBracketedCaptureParams])) != 0)
          {
            LOBYTE(v15) = 1;
          }
        }
      }
    }
    else
    {
      LOBYTE(v15) = 0;
    }
  }
  return v15;
}

- (unint64_t)hash
{
  return self->_bracketingMode;
}

- (int)bracketFrameCount
{
  int v3 = [(NSArray *)self->_exposureValues count];
  int v4 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_oisBracketedCaptureParams, "objectForKeyedSubscript:", *MEMORY[0x1E4F54448]), "count");
  return v4 + v3 + [(NSArray *)self->_manualExposureBracketedCaptureParams count];
}

- (id)description
{
  int v3 = (void *)[MEMORY[0x1E4F28E78] string];
  int v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p>: pre-bracket: %d, frame count: %d, bracketingMode: %@", v5, self, self->_providePreBracketedEV0, -[BWBracketSettings bracketFrameCount](self, "bracketFrameCount"), BWPhotoEncoderStringFromEncodingScheme(self->_bracketingMode)];
  exposureValues = self->_exposureValues;
  if (exposureValues)
  {
    uint64_t v7 = @", exposureValues: %@";
LABEL_7:
    objc_msgSend(v3, "appendFormat:", v7, objc_msgSend(exposureValues, "description"));
    return v3;
  }
  exposureValues = self->_oisBracketedCaptureParams;
  if (exposureValues)
  {
    uint64_t v7 = @", oisBracketedCaptureParams: %@";
    goto LABEL_7;
  }
  exposureValues = self->_manualExposureBracketedCaptureParams;
  if (exposureValues)
  {
    uint64_t v7 = @", manualExposureBracketedCaptureParams: %@";
    goto LABEL_7;
  }
  return v3;
}

- (int)bracketingMode
{
  return self->_bracketingMode;
}

- (BOOL)providePreBracketedEV0
{
  return self->_providePreBracketedEV0;
}

- (void)setProvidePreBracketedEV0:(BOOL)a3
{
  self->_int providePreBracketedEV0 = a3;
}

- (BOOL)lensStabilizationEnabledForClientBracket
{
  return self->_lensStabilizationEnabledForClientBracket;
}

- (void)setLensStabilizationEnabledForClientBracket:(BOOL)a3
{
  self->_int lensStabilizationEnabledForClientBracket = a3;
}

- (NSArray)exposureValues
{
  return self->_exposureValues;
}

- (void)setExposureValues:(id)a3
{
}

- (NSArray)manualExposureBracketedCaptureParams
{
  return self->_manualExposureBracketedCaptureParams;
}

- (void)setManualExposureBracketedCaptureParams:(id)a3
{
}

- (NSDictionary)oisBracketedCaptureParams
{
  return self->_oisBracketedCaptureParams;
}

- (void)setOisBracketedCaptureParams:(id)a3
{
}

@end