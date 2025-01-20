@interface FigCaptureIrisPreparedSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (FigCaptureIrisPreparedSettings)init;
- (FigCaptureIrisPreparedSettings)initWithCoder:(id)a3;
- (FigCaptureIrisPreparedSettings)initWithXPCEncoding:(id)a3;
- (NSArray)bravoConstituentImageDeliveryDeviceTypes;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (id)figCaptureStillImageSettingsRepresentation;
- (int)HDRMode;
- (int)digitalFlashMode;
- (int)qualityPrioritization;
- (int64_t)settingsID;
- (unsigned)bracketedImageCount;
- (unsigned)outputHeight;
- (unsigned)outputWidth;
- (unsigned)processedOutputFormat;
- (unsigned)rawOutputFormat;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setBracketedImageCount:(unsigned int)a3;
- (void)setBravoConstituentImageDeliveryDeviceTypes:(id)a3;
- (void)setDigitalFlashMode:(int)a3;
- (void)setHDRMode:(int)a3;
- (void)setOutputHeight:(unsigned int)a3;
- (void)setOutputWidth:(unsigned int)a3;
- (void)setProcessedOutputFormat:(unsigned int)a3;
- (void)setQualityPrioritization:(int)a3;
- (void)setRawOutputFormat:(unsigned int)a3;
- (void)setSettingsID:(int64_t)a3;
@end

@implementation FigCaptureIrisPreparedSettings

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setSettingsID:self->_settingsID];
  [v4 setProcessedOutputFormat:self->_processedOutputFormat];
  [v4 setRawOutputFormat:self->_rawOutputFormat];
  [v4 setOutputWidth:self->_outputWidth];
  [v4 setOutputHeight:self->_outputHeight];
  [v4 setBracketedImageCount:self->_bracketedImageCount];
  [v4 setQualityPrioritization:self->_qualityPrioritization];
  [v4 setHDRMode:self->_HDRMode];
  [v4 setDigitalFlashMode:self->_digitalFlashMode];
  [v4 setBravoConstituentImageDeliveryDeviceTypes:self->_bravoConstituentImageDeliveryDeviceTypes];
  return v4;
}

- (void)setQualityPrioritization:(int)a3
{
  self->_qualityPrioritization = a3;
}

- (void)setOutputWidth:(unsigned int)a3
{
  self->_outputWidth = a3;
}

- (void)setOutputHeight:(unsigned int)a3
{
  self->_outputHeight = a3;
}

- (void)setProcessedOutputFormat:(unsigned int)a3
{
  self->_processedOutputFormat = a3;
}

- (void)setSettingsID:(int64_t)a3
{
  self->_settingsID = a3;
}

- (void)setHDRMode:(int)a3
{
  self->_HDRMode = a3;
}

- (void)setDigitalFlashMode:(int)a3
{
  self->_digitalFlashMode = a3;
}

- (void)setRawOutputFormat:(unsigned int)a3
{
  self->_rawOutputFormat = a3;
}

- (FigCaptureIrisPreparedSettings)init
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureIrisPreparedSettings;
  return [(FigCaptureIrisPreparedSettings *)&v3 init];
}

- (void)setBravoConstituentImageDeliveryDeviceTypes:(id)a3
{
}

- (void)setBracketedImageCount:(unsigned int)a3
{
  self->_bracketedImageCount = a3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [a3 settingsID] == self->_settingsID
      && [a3 processedOutputFormat] == self->_processedOutputFormat
      && [a3 rawOutputFormat] == self->_rawOutputFormat
      && [a3 outputWidth] == self->_outputWidth
      && [a3 outputHeight] == self->_outputHeight
      && [a3 bracketedImageCount] == self->_bracketedImageCount
      && [a3 qualityPrioritization] == self->_qualityPrioritization
      && [a3 HDRMode] == self->_HDRMode
      && [a3 digitalFlashMode] == self->_digitalFlashMode)
    {
      bravoConstituentImageDeliveryDeviceTypes = self->_bravoConstituentImageDeliveryDeviceTypes;
      if (bravoConstituentImageDeliveryDeviceTypes == (NSArray *)[a3 bravoConstituentImageDeliveryDeviceTypes]|| (int v6 = -[NSArray isEqual:](self->_bravoConstituentImageDeliveryDeviceTypes, "isEqual:", objc_msgSend(a3, "bravoConstituentImageDeliveryDeviceTypes"))) != 0)
      {
        LOBYTE(v6) = 1;
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (unsigned)processedOutputFormat
{
  return self->_processedOutputFormat;
}

- (int)qualityPrioritization
{
  return self->_qualityPrioritization;
}

- (int)digitalFlashMode
{
  return self->_digitalFlashMode;
}

- (int)HDRMode
{
  return self->_HDRMode;
}

- (int64_t)settingsID
{
  return self->_settingsID;
}

- (NSArray)bravoConstituentImageDeliveryDeviceTypes
{
  return self->_bravoConstituentImageDeliveryDeviceTypes;
}

- (unsigned)bracketedImageCount
{
  return self->_bracketedImageCount;
}

- (unsigned)rawOutputFormat
{
  return self->_rawOutputFormat;
}

- (unsigned)outputWidth
{
  return self->_outputWidth;
}

- (unsigned)outputHeight
{
  return self->_outputHeight;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, "settingsID", self->_settingsID);
  xpc_dictionary_set_int64(v3, "processedOutputFormat", self->_processedOutputFormat);
  xpc_dictionary_set_int64(v3, "rawOutputFormat", self->_rawOutputFormat);
  xpc_dictionary_set_int64(v3, "outputWidth", self->_outputWidth);
  xpc_dictionary_set_int64(v3, "outputHeight", self->_outputHeight);
  xpc_dictionary_set_int64(v3, "bracketedImageCount", self->_bracketedImageCount);
  xpc_dictionary_set_int64(v3, "qualityPrioritization", self->_qualityPrioritization);
  xpc_dictionary_set_int64(v3, "HDRMode", self->_HDRMode);
  xpc_dictionary_set_int64(v3, "DigitalFlashMode", self->_digitalFlashMode);
  if ([(NSArray *)self->_bravoConstituentImageDeliveryDeviceTypes count]) {
    FigXPCMessageSetCFArray();
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureIrisPreparedSettings;
  [(FigCaptureIrisPreparedSettings *)&v3 dealloc];
}

- (FigCaptureIrisPreparedSettings)initWithXPCEncoding:(id)a3
{
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)FigCaptureIrisPreparedSettings;
    v4 = [(FigCaptureIrisPreparedSettings *)&v6 init];
    if (v4)
    {
      v4->_settingsID = xpc_dictionary_get_int64(a3, "settingsID");
      v4->_processedOutputFormat = xpc_dictionary_get_int64(a3, "processedOutputFormat");
      v4->_rawOutputFormat = xpc_dictionary_get_int64(a3, "rawOutputFormat");
      v4->_outputWidth = xpc_dictionary_get_int64(a3, "outputWidth");
      v4->_outputHeight = xpc_dictionary_get_int64(a3, "outputHeight");
      v4->_bracketedImageCount = xpc_dictionary_get_int64(a3, "bracketedImageCount");
      v4->_qualityPrioritization = xpc_dictionary_get_int64(a3, "qualityPrioritization");
      v4->_HDRMode = xpc_dictionary_get_int64(a3, "HDRMode");
      v4->_digitalFlashMode = xpc_dictionary_get_int64(a3, "DigitalFlashMode");
      FigXPCMessageCopyCFArray();
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FigCaptureIrisPreparedSettings)initWithCoder:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v4 = [(FigCaptureIrisPreparedSettings *)self init];
  if (v4)
  {
    v4->_settingsID = objc_msgSend(a3, "decodeInt64ForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "settingsID"));
    v4->_processedOutputFormat = objc_msgSend(a3, "decodeInt32ForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "processedOutputFormat"));
    v4->_rawOutputFormat = objc_msgSend(a3, "decodeInt32ForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "rawOutputFormat"));
    v4->_outputWidth = objc_msgSend(a3, "decodeInt32ForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "outputWidth"));
    v4->_outputHeight = objc_msgSend(a3, "decodeInt32ForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "outputHeight"));
    v4->_bracketedImageCount = objc_msgSend(a3, "decodeInt32ForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "bracketedImageCount"));
    v4->_qualityPrioritization = objc_msgSend(a3, "decodeInt32ForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "qualityPrioritization"));
    v4->_HDRMode = objc_msgSend(a3, "decodeInt32ForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "HDRMode"));
    v4->_digitalFlashMode = objc_msgSend(a3, "decodeInt32ForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "DigitalFlashMode"));
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    v8[0] = objc_opt_class();
    v8[1] = objc_opt_class();
    uint64_t v6 = objc_msgSend(v5, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v8, 2));
    v4->_bravoConstituentImageDeliveryDeviceTypes = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "bravoConstituentImageDeliveryDeviceTypes"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt64:forKey:", self->_settingsID, objc_msgSend(NSString, "stringWithUTF8String:", "settingsID"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_processedOutputFormat, objc_msgSend(NSString, "stringWithUTF8String:", "processedOutputFormat"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_rawOutputFormat, objc_msgSend(NSString, "stringWithUTF8String:", "rawOutputFormat"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_outputWidth, objc_msgSend(NSString, "stringWithUTF8String:", "outputWidth"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_outputHeight, objc_msgSend(NSString, "stringWithUTF8String:", "outputHeight"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_bracketedImageCount, objc_msgSend(NSString, "stringWithUTF8String:", "bracketedImageCount"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_qualityPrioritization, objc_msgSend(NSString, "stringWithUTF8String:", "qualityPrioritization"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_HDRMode, objc_msgSend(NSString, "stringWithUTF8String:", "HDRMode"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_digitalFlashMode, objc_msgSend(NSString, "stringWithUTF8String:", "DigitalFlashMode"));
  bravoConstituentImageDeliveryDeviceTypes = self->_bravoConstituentImageDeliveryDeviceTypes;
  uint64_t v6 = [NSString stringWithUTF8String:"bravoConstituentImageDeliveryDeviceTypes"];
  [a3 encodeObject:bravoConstituentImageDeliveryDeviceTypes forKey:v6];
}

- (NSString)description
{
  unsigned int v3 = bswap32(self->_processedOutputFormat);
  unsigned int v7 = bswap32(self->_rawOutputFormat);
  unsigned int v8 = v3;
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @" DIGITALFLASH:%d", self->_digitalFlashMode);
  if ([(NSArray *)self->_bravoConstituentImageDeliveryDeviceTypes count]) {
    v5 = (__CFString *)_shortStringForFigCaptureSourceDeviceTypes(self->_bravoConstituentImageDeliveryDeviceTypes);
  }
  else {
    v5 = &stru_1EFA403E0;
  }
  return (NSString *)[NSString stringWithFormat:@"%@ %p: captureID:%lld '%.4s' %dx%d RAW:'%.4s' HDR:%d QUAL:%d%@ BRCK:%d%@", objc_opt_class(), self, self->_settingsID, &v8, self->_outputWidth, self->_outputHeight, &v7, self->_HDRMode, self->_qualityPrioritization, v4, self->_bracketedImageCount, v5];
}

- (id)figCaptureStillImageSettingsRepresentation
{
  unsigned int v3 = [[FigCaptureStillImageSettings alloc] initWithSettingsID:self->_settingsID];
  [(FigCaptureStillImageSettings *)v3 setSettingsProvider:1];
  [(FigCaptureStillImageSettings *)v3 setOutputFormat:self->_processedOutputFormat];
  [(FigCaptureStillImageSettings *)v3 setOutputWidth:self->_outputWidth];
  [(FigCaptureStillImageSettings *)v3 setOutputHeight:self->_outputHeight];
  [(FigCaptureStillImageSettings *)v3 setRawOutputFormat:self->_rawOutputFormat];
  [(FigCaptureStillImageSettings *)v3 setBracketType:2 imageCount:self->_bracketedImageCount];
  [(FigCaptureStillImageSettings *)v3 setQualityPrioritization:self->_qualityPrioritization];
  [(FigCaptureStillImageSettings *)v3 setHDRMode:self->_HDRMode];
  [(FigCaptureStillImageSettings *)v3 setDigitalFlashMode:self->_digitalFlashMode];
  [(FigCaptureStillImageSettings *)v3 setBravoConstituentImageDeliveryDeviceTypes:self->_bravoConstituentImageDeliveryDeviceTypes];
  return v3;
}

@end