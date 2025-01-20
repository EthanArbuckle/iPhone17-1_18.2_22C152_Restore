@interface ARVideoFormat
+ (BOOL)isCaptureDeviceTypeAvailable:(id)a3 position:(int64_t)a4;
+ (BOOL)supportsSecureCoding;
+ (CGSize)hiResVideoDimensions;
+ (id)_querySupportedVideoFormatsForDevicePosition:(int64_t)a3 deviceType:(id)a4 videoBinned:(BOOL)a5 frameRate:(double)a6;
+ (id)bestDepthFormatForDeviceFormat:(id)a3;
+ (id)bestTimeOfFlightFormatForDevicePosition:(int64_t)a3 depthSensorNumberOfPointsMode:(int64_t)a4 frameRates:(id)a5;
+ (id)bestVideoFormatForDevicePosition:(int64_t)a3 deviceType:(id)a4 resolution:(id)a5 frameRate:(double)a6 videoBinned:(BOOL)a7;
+ (id)bestVideoFormatForDevicePosition:(int64_t)a3 deviceType:(id)a4 resolution:(id)a5 frameRate:(double)a6 videoBinned:(BOOL)a7 needsHDRSupport:(BOOL)a8;
+ (id)bestVideoFormatForDevicePosition:(int64_t)a3 deviceType:(id)a4 resolution:(id)a5 frameRate:(double)a6 videoBinned:(BOOL)a7 needsHDRSupport:(BOOL)a8 pixelFormat:(unsigned int)a9;
+ (id)bestVideoFormatForDevicePosition:(int64_t)a3 deviceType:(id)a4 resolution:(id)a5 frameRates:(id)a6 videoBinned:(BOOL)a7;
+ (id)bestVideoFormatForDevicePosition:(int64_t)a3 deviceType:(id)a4 resolution:(id)a5 frameRates:(id)a6 videoBinned:(BOOL)a7 needsHDRSupport:(BOOL)a8 pixelFormat:(unsigned int)a9;
+ (id)supportedVideoFormatsForDevicePosition:(int64_t)a3 deviceType:(id)a4;
+ (id)supportedVideoFormatsForDevicePosition:(int64_t)a3 deviceType:(id)a4 frameRate:(double)a5;
+ (id)supportedVideoFormatsForDevicePosition:(int64_t)a3 deviceType:(id)a4 videoBinned:(BOOL)a5;
+ (id)supportedVideoFormatsForDevicePosition:(int64_t)a3 deviceType:(id)a4 videoBinned:(BOOL)a5 frameRate:(double)a6;
+ (id)supportedVideoFormatsForHiResOrX420;
+ (id)supportedVideoFormatsForHiResOrX420ForDevicePosition:(int64_t)a3 deviceType:(id)a4;
+ (id)supportedVideoFormatsForStillImageCapture;
+ (id)supportedVideoFormatsForStillImageCaptureForDevicePosition:(int64_t)a3 deviceType:(id)a4;
- (ARVideoFormat)initWithCaptureDevice:(id)a3 format:(id)a4;
- (ARVideoFormat)initWithCoder:(id)a3;
- (ARVideoFormat)initWithImageResolution:(CGSize)a3 captureDevicePosition:(int64_t)a4 captureDeviceType:(id)a5;
- (ARVideoFormat)initWithImageResolution:(CGSize)a3 captureDevicePosition:(int64_t)a4 captureDeviceType:(id)a5 frameRatesByPowerUsage:(id)a6;
- (ARVideoFormat)initWithImageResolution:(CGSize)a3 captureDevicePosition:(int64_t)a4 captureDeviceType:(id)a5 frameRatesByPowerUsage:(id)a6 pixelFormat:(unsigned int)a7;
- (ARVideoFormat)videoFormatWithDepthDataFormat:(id)a3;
- (ARVideoFormat)videoFormatWithUnthrottledLowPowerUsageFramerate;
- (AVCaptureDevice)device;
- (AVCaptureDeviceFormat)depthDataFormat;
- (AVCaptureDeviceFormat)deviceFormat;
- (AVCaptureDevicePosition)captureDevicePosition;
- (AVCaptureDeviceType)captureDeviceType;
- (BOOL)has4KVideoResolution;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRecommendedForHighResolutionFrameCapturing;
- (BOOL)isVideoHDRSupported;
- (BOOL)isX420PixelFormat;
- (CGSize)imageResolution;
- (NSArray)frameRatesByPowerUsage;
- (NSInteger)framesPerSecond;
- (NSString)pixelFormat;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDepthDataFormat:(id)a3;
- (void)setFrameRatesByPowerUsage:(id)a3;
@end

@implementation ARVideoFormat

- (ARVideoFormat)initWithCaptureDevice:(id)a3 format:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ARVideoFormat;
  v9 = [(ARVideoFormat *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v10->_deviceFormat, a4);
    frameRatesByPowerUsage = v10->_frameRatesByPowerUsage;
    v10->_frameRatesByPowerUsage = (NSArray *)&unk_1F125BCD8;

    v10->_captureDevicePosition = [v7 position];
    uint64_t v12 = [v7 deviceType];
    captureDeviceType = v10->_captureDeviceType;
    v10->_captureDeviceType = (NSString *)v12;
  }
  return v10;
}

- (ARVideoFormat)initWithImageResolution:(CGSize)a3 captureDevicePosition:(int64_t)a4 captureDeviceType:(id)a5
{
  return -[ARVideoFormat initWithImageResolution:captureDevicePosition:captureDeviceType:frameRatesByPowerUsage:](self, "initWithImageResolution:captureDevicePosition:captureDeviceType:frameRatesByPowerUsage:", a4, a5, &unk_1F125BCF0, a3.width, a3.height);
}

- (ARVideoFormat)initWithImageResolution:(CGSize)a3 captureDevicePosition:(int64_t)a4 captureDeviceType:(id)a5 frameRatesByPowerUsage:(id)a6
{
  return -[ARVideoFormat initWithImageResolution:captureDevicePosition:captureDeviceType:frameRatesByPowerUsage:pixelFormat:](self, "initWithImageResolution:captureDevicePosition:captureDeviceType:frameRatesByPowerUsage:pixelFormat:", a4, a5, &unk_1F125BD08, 875704422, a3.width, a3.height);
}

- (ARVideoFormat)initWithImageResolution:(CGSize)a3 captureDevicePosition:(int64_t)a4 captureDeviceType:(id)a5 frameRatesByPowerUsage:(id)a6 pixelFormat:(unsigned int)a7
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v14 = a5;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ARVideoFormat;
  v16 = [(ARVideoFormat *)&v19 init];
  v17 = v16;
  if (v16)
  {
    v16->_imageResolution.CGFloat width = width;
    v16->_imageResolution.CGFloat height = height;
    objc_storeStrong((id *)&v16->_frameRatesByPowerUsage, a6);
    v17->_captureDevicePosition = a4;
    objc_storeStrong((id *)&v17->_captureDeviceType, a5);
    v17->_pixelFormat = a7;
  }

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)(v5 + 8), self->_device);
    objc_storeStrong((id *)(v6 + 16), self->_deviceFormat);
    objc_storeStrong((id *)(v6 + 72), self->_depthDataFormat);
    uint64_t v7 = [(NSArray *)self->_frameRatesByPowerUsage copyWithZone:a3];
    id v8 = *(void **)(v6 + 64);
    *(void *)(v6 + 64) = v7;

    *(CGSize *)(v6 + 32) = self->_imageResolution;
    *(void *)(v6 + 48) = self->_captureDevicePosition;
    objc_storeStrong((id *)(v6 + 56), self->_captureDeviceType);
    *(_DWORD *)(v6 + 24) = self->_pixelFormat;
  }
  return (id)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARVideoFormat)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ARVideoFormat;
  uint64_t v5 = [(ARVideoFormat *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"frameRatesByPowerUsage"];
    frameRatesByPowerUsage = v5->_frameRatesByPowerUsage;
    v5->_frameRatesByPowerUsage = (NSArray *)v6;

    [v4 decodeSizeForKey:@"imageResolution"];
    v5->_imageResolution.CGFloat width = v8;
    v5->_imageResolution.CGFloat height = v9;
    v5->_captureDevicePosition = [v4 decodeIntegerForKey:@"captureDevicePosition"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"captureDeviceType"];
    captureDeviceType = v5->_captureDeviceType;
    v5->_captureDeviceType = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pixelFormat"];
    v5->_pixelFormat = [v12 unsignedIntValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  frameRatesByPowerUsage = self->_frameRatesByPowerUsage;
  id v5 = a3;
  [v5 encodeObject:frameRatesByPowerUsage forKey:@"frameRatesByPowerUsage"];
  [(ARVideoFormat *)self imageResolution];
  objc_msgSend(v5, "encodeSize:forKey:", @"imageResolution");
  [v5 encodeInteger:self->_captureDevicePosition forKey:@"captureDevicePosition"];
  [v5 encodeObject:self->_captureDeviceType forKey:@"captureDeviceType"];
  id v6 = [NSNumber numberWithUnsignedInt:self->_pixelFormat];
  [v5 encodeObject:v6 forKey:@"pixelFormat"];
}

- (unint64_t)hash
{
  v3 = NSString;
  id v4 = [(AVCaptureDevice *)self->_device description];
  id v5 = [(AVCaptureDeviceFormat *)self->_deviceFormat description];
  id v6 = [v3 stringWithFormat:@"%@|%@|%li", v4, v5, -[ARVideoFormat framesPerSecond](self, "framesPerSecond")];

  unint64_t v7 = [v6 hash];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    id v6 = v5;
    if (self->_device == (AVCaptureDevice *)*((void *)v5 + 1)
      && self->_deviceFormat == (AVCaptureDeviceFormat *)*((void *)v5 + 2)
      && self->_depthDataFormat == (AVCaptureDeviceFormat *)*((void *)v5 + 9)
      && [(NSArray *)self->_frameRatesByPowerUsage isEqualToArray:*((void *)v5 + 8)])
    {
      [(ARVideoFormat *)self imageResolution];
      double v8 = v7;
      double v10 = v9;
      [v6 imageResolution];
      BOOL v12 = 0;
      if (v8 != v13 || v10 != v11) {
        goto LABEL_13;
      }
      int64_t captureDevicePosition = self->_captureDevicePosition;
      if (captureDevicePosition == [v6 captureDevicePosition])
      {
        captureDeviceType = self->_captureDeviceType;
        v16 = [v6 captureDeviceType];
        if ([(NSString *)captureDeviceType isEqual:v16]) {
          BOOL v12 = self->_pixelFormat == v6[6];
        }
        else {
          BOOL v12 = 0;
        }

        goto LABEL_13;
      }
    }
    BOOL v12 = 0;
LABEL_13:

    goto LABEL_14;
  }
  BOOL v12 = 0;
LABEL_14:

  return v12;
}

- (NSInteger)framesPerSecond
{
  v2 = [(NSArray *)self->_frameRatesByPowerUsage firstObject];
  NSInteger v3 = [v2 integerValue];

  return v3;
}

- (id)description
{
  [(ARVideoFormat *)self imageResolution];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  double v7 = NSString;
  double v8 = (objc_class *)objc_opt_class();
  double v9 = NSStringFromClass(v8);
  double v10 = [(ARVideoFormat *)self pixelFormat];
  NSInteger v11 = [(ARVideoFormat *)self framesPerSecond];
  BOOL v12 = [(ARVideoFormat *)self captureDeviceType];
  double v13 = [v7 stringWithFormat:@"<%@: %p imageResolution=(%.0f, %.0f) pixelFormat=(%@) framesPerSecond=(%li) captureDeviceType=%@ captureDevicePosition=(%li)>", v9, self, v4, v6, v10, v11, v12, -[ARVideoFormat captureDevicePosition](self, "captureDevicePosition")];

  return v13;
}

- (AVCaptureDevice)device
{
  return self->_device;
}

- (AVCaptureDeviceFormat)deviceFormat
{
  return self->_deviceFormat;
}

- (CGSize)imageResolution
{
  deviceFormat = self->_deviceFormat;
  if (deviceFormat)
  {
    if (CMFormatDescriptionGetMediaSubType([(AVCaptureDeviceFormat *)deviceFormat formatDescription]) == 1785950320)
    {
      double width = *MEMORY[0x1E4F1DB30];
      double height = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
    else
    {
      CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions([(AVCaptureDeviceFormat *)self->_deviceFormat formatDescription]);
      double width = (double)Dimensions.width;
      double height = (double)Dimensions.height;
    }
  }
  else
  {
    double width = self->_imageResolution.width;
    double height = self->_imageResolution.height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isRecommendedForHighResolutionFrameCapturing
{
  uint64_t v3 = [(ARVideoFormat *)self captureDeviceType];
  if ([v3 isEqualToString:*MEMORY[0x1E4F15830]])
  {
    int v4 = 1;
  }
  else
  {
    uint64_t v5 = [(ARVideoFormat *)self captureDeviceType];
    if ([v5 isEqualToString:*MEMORY[0x1E4F157F0]])
    {
      int v4 = 1;
    }
    else
    {
      uint64_t v6 = [(ARVideoFormat *)self captureDeviceType];
      int v4 = [v6 isEqualToString:*MEMORY[0x1E4F15818]];
    }
  }

  LOBYTE(v3) = 0;
  if ([(ARVideoFormat *)self captureDevicePosition] == AVCaptureDevicePositionBack && v4)
  {
    double v7 = [(ARVideoFormat *)self deviceFormat];
    LODWORD(v3) = [v7 isVideoBinned] ^ 1;
  }
  return (char)v3;
}

- (BOOL)isVideoHDRSupported
{
  v2 = [(ARVideoFormat *)self deviceFormat];
  char v3 = [v2 isVideoHDRSupported];

  return v3;
}

- (NSString)pixelFormat
{
  deviceFormat = self->_deviceFormat;
  if (deviceFormat) {
    FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType([(AVCaptureDeviceFormat *)deviceFormat formatDescription]);
  }
  else {
    FourCharCode MediaSubType = self->_pixelFormat;
  }
  uint64_t v5 = AROSTypeToString(MediaSubType);
  return (NSString *)v5;
}

- (BOOL)isX420PixelFormat
{
  v2 = [(ARVideoFormat *)self pixelFormat];
  char v3 = AROSTypeToString(0x78343230u);
  char v4 = [v2 isEqualToString:v3];

  return v4;
}

- (BOOL)has4KVideoResolution
{
  [(ARVideoFormat *)self imageResolution];
  double v3 = v2;
  double v5 = v4;
  [(id)objc_opt_class() hiResVideoDimensions];
  return v5 == v7 && v3 == v6;
}

- (void)setFrameRatesByPowerUsage:(id)a3
{
}

- (void)setDepthDataFormat:(id)a3
{
}

- (ARVideoFormat)videoFormatWithUnthrottledLowPowerUsageFramerate
{
  v10[3] = *MEMORY[0x1E4F143B8];
  double v3 = (void *)[(ARVideoFormat *)self copy];
  double v4 = [(NSArray *)self->_frameRatesByPowerUsage objectAtIndexedSubscript:0];
  double v5 = -[NSArray objectAtIndexedSubscript:](self->_frameRatesByPowerUsage, "objectAtIndexedSubscript:", 0, v4);
  v10[1] = v5;
  double v6 = [(NSArray *)self->_frameRatesByPowerUsage objectAtIndexedSubscript:2];
  v10[2] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
  double v8 = (void *)v3[8];
  v3[8] = v7;

  return (ARVideoFormat *)v3;
}

- (ARVideoFormat)videoFormatWithDepthDataFormat:(id)a3
{
  id v4 = a3;
  double v5 = (void *)[(ARVideoFormat *)self copy];
  double v6 = (void *)v5[9];
  v5[9] = v4;

  return (ARVideoFormat *)v5;
}

+ (id)bestVideoFormatForDevicePosition:(int64_t)a3 deviceType:(id)a4 resolution:(id)a5 frameRate:(double)a6 videoBinned:(BOOL)a7
{
  return (id)[a1 bestVideoFormatForDevicePosition:a3 deviceType:a4 resolution:a5 frameRate:a7 videoBinned:0 needsHDRSupport:875704422 pixelFormat:a6];
}

+ (id)bestVideoFormatForDevicePosition:(int64_t)a3 deviceType:(id)a4 resolution:(id)a5 frameRate:(double)a6 videoBinned:(BOOL)a7 needsHDRSupport:(BOOL)a8
{
  return (id)[a1 bestVideoFormatForDevicePosition:a3 deviceType:a4 resolution:a5 frameRate:a7 videoBinned:a8 needsHDRSupport:875704422 pixelFormat:a6];
}

+ (id)bestVideoFormatForDevicePosition:(int64_t)a3 deviceType:(id)a4 resolution:(id)a5 frameRate:(double)a6 videoBinned:(BOOL)a7 needsHDRSupport:(BOOL)a8 pixelFormat:(unsigned int)a9
{
  BOOL v63 = a8;
  BOOL v62 = a7;
  v89[1] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  double v13 = (void *)MEMORY[0x1E4F16448];
  id v66 = v12;
  v89[0] = v12;
  objc_super v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:1];
  id v15 = [v13 discoverySessionWithDeviceTypes:v14 mediaType:*MEMORY[0x1E4F15C18] position:a3];

  v16 = [v15 devices];
  if (![v16 count])
  {
    v17 = _ARLogGeneral_10();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v51 = (objc_class *)objc_opt_class();
      v52 = NSStringFromClass(v51);
      v53 = NSStringFromAVCaptureDevicePosition(a3);
      *(_DWORD *)buf = 138544130;
      v82 = v52;
      __int16 v83 = 2048;
      id v84 = a1;
      __int16 v85 = 2114;
      id v86 = v66;
      __int16 v87 = 2114;
      v88 = v53;
      _os_log_impl(&dword_1B88A2000, v17, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: No image capture device found in bestVideoFormatForDevicePosition. (%{public}@ / %{public}@)", buf, 0x2Au);
    }
    v45 = 0;
    goto LABEL_56;
  }
  if ARDeviceSupportsMulticamMode() && (ARUserDefaultsMulticamModeEnabled()) {
    int v61 = 1;
  }
  else {
    int v61 = ARDeviceSupportsJasper();
  }
  v17 = [v16 firstObject];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  v18 = [v17 formats];
  uint64_t v67 = [v18 countByEnumeratingWithState:&v74 objects:v80 count:16];
  if (!v67)
  {
    v21 = 0;
    v20 = 0;
    objc_super v19 = 0;
    v45 = 0;
LABEL_53:

    goto LABEL_55;
  }
  v55 = v17;
  v56 = v16;
  v57 = v15;
  objc_super v19 = 0;
  v20 = 0;
  v21 = 0;
  uint64_t v60 = *(void *)v75;
  v58 = v18;
  id v59 = (id)*MEMORY[0x1E4F15820];
  do
  {
    uint64_t v22 = 0;
    do
    {
      if (*(void *)v75 != v60) {
        objc_enumerationMutation(v18);
      }
      uint64_t v69 = v22;
      v23 = *(void **)(*((void *)&v74 + 1) + 8 * v22);
      CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(v23, "formatDescription", v55));
      if (v63) {
        int v25 = [v23 isVideoHDRSupported];
      }
      else {
        int v25 = 1;
      }
      if (CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)[v23 formatDescription]) == a9
        && Dimensions.width == a5.var0
        && Dimensions.height == a5.var1)
      {
        int v28 = v25;
      }
      else
      {
        int v28 = 0;
      }
      int v29 = v28 & ([v23 isVideoBinned] ^ v62 ^ 1);
      if (v61) {
        v29 &= [v23 isMultiCamSupported];
      }
      if (v29) {
        BOOL v30 = v59 == v66;
      }
      else {
        BOOL v30 = 0;
      }
      if (v30)
      {
        uint64_t v31 = +[ARVideoFormat bestDepthFormatForDeviceFormat:v23];

        v20 = (void *)v31;
        if (!v31) {
          goto LABEL_45;
        }
      }
      else if (!v29)
      {
        goto LABEL_45;
      }
      v68 = v20;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      v32 = [v23 videoSupportedFrameRateRanges];
      uint64_t v33 = [v32 countByEnumeratingWithState:&v70 objects:v79 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v71;
        do
        {
          for (uint64_t i = 0; i != v34; ++i)
          {
            if (*(void *)v71 != v35) {
              objc_enumerationMutation(v32);
            }
            v37 = *(void **)(*((void *)&v70 + 1) + 8 * i);
            [v37 maxFrameRate];
            if (v38 >= a6)
            {
              [v37 maxFrameRate];
              if (v39 <= 120.0)
              {
                if (!v21
                  || ([v37 maxFrameRate], double v41 = v40, objc_msgSend(v21, "maxFrameRate"), v41 <= v42))
                {
                  id v43 = v23;

                  id v44 = v37;
                  objc_super v19 = v43;
                  v21 = v44;
                }
              }
            }
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v70 objects:v79 count:16];
        }
        while (v34);
      }

      v20 = v68;
      v18 = v58;
LABEL_45:
      uint64_t v22 = v69 + 1;
    }
    while (v69 + 1 != v67);
    uint64_t v67 = [v18 countByEnumeratingWithState:&v74 objects:v80 count:16];
  }
  while (v67);

  if (v19)
  {
    v17 = v55;
    v45 = [[ARVideoFormat alloc] initWithCaptureDevice:v55 format:v19];
    objc_storeStrong((id *)&v45->_depthDataFormat, v20);
    uint64_t v46 = [NSNumber numberWithDouble:a6];
    v78[0] = v46;
    v47 = [NSNumber numberWithDouble:a6];
    v78[1] = v47;
    v48 = [NSNumber numberWithDouble:a6];
    v78[2] = v48;
    uint64_t v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:3];
    frameRatesByPowerUsage = v45->_frameRatesByPowerUsage;
    v45->_frameRatesByPowerUsage = (NSArray *)v49;

    v18 = (void *)v46;
    v16 = v56;
    id v15 = v57;
    goto LABEL_53;
  }
  v45 = 0;
  v16 = v56;
  id v15 = v57;
  v17 = v55;
LABEL_55:

LABEL_56:
  return v45;
}

+ (id)bestVideoFormatForDevicePosition:(int64_t)a3 deviceType:(id)a4 resolution:(id)a5 frameRates:(id)a6 videoBinned:(BOOL)a7
{
  LODWORD(v8) = 875704422;
  return +[ARVideoFormat bestVideoFormatForDevicePosition:a3 deviceType:a4 resolution:a5 frameRates:a6 videoBinned:a7 needsHDRSupport:0 pixelFormat:v8];
}

+ (id)bestVideoFormatForDevicePosition:(int64_t)a3 deviceType:(id)a4 resolution:(id)a5 frameRates:(id)a6 videoBinned:(BOOL)a7 needsHDRSupport:(BOOL)a8 pixelFormat:(unsigned int)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  id v16 = a6;
  id v17 = a4;
  v18 = [v16 firstObject];
  [v18 doubleValue];
  objc_msgSend(a1, "bestVideoFormatForDevicePosition:deviceType:resolution:frameRate:videoBinned:needsHDRSupport:pixelFormat:", a3, v17, a5, v10, v9, a9);
  objc_super v19 = (id *)objc_claimAutoreleasedReturnValue();

  if (v19) {
    objc_storeStrong(v19 + 8, a6);
  }

  return v19;
}

+ (id)bestTimeOfFlightFormatForDevicePosition:(int64_t)a3 depthSensorNumberOfPointsMode:(int64_t)a4 frameRates:(id)a5
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  double v6 = (NSArray *)a5;
  id v7 = (id)*MEMORY[0x1E4F15810];
  if (v6)
  {
    uint64_t v8 = _ARLogSensor_2();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = (objc_class *)objc_opt_class();
      BOOL v10 = NSStringFromClass(v9);
      NSInteger v11 = [(NSArray *)v6 objectAtIndexedSubscript:0];
      [v11 doubleValue];
      int64_t v13 = v12;
      objc_super v14 = [(NSArray *)v6 objectAtIndexedSubscript:1];
      [v14 doubleValue];
      uint64_t v16 = v15;
      id v17 = [(NSArray *)v6 objectAtIndexedSubscript:2];
      [v17 doubleValue];
      *(_DWORD *)buf = 138544386;
      v94 = v10;
      __int16 v95 = 2048;
      id v96 = a1;
      __int16 v97 = 2048;
      int64_t v98 = v13;
      __int16 v99 = 2048;
      uint64_t v100 = v16;
      __int16 v101 = 2048;
      uint64_t v102 = v18;
      _os_log_impl(&dword_1B88A2000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: ARVideoFormat jasper frame rates set to %f, %f, %f", buf, 0x34u);
    }
  }
  else
  {
    double v6 = (NSArray *)&unk_1F125BD20;
  }
  objc_super v19 = (void *)MEMORY[0x1E4F16448];
  id v92 = v7;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v92 count:1];
  v21 = [v19 discoverySessionWithDeviceTypes:v20 mediaType:*MEMORY[0x1E4F15BF8] position:a3];

  uint64_t v22 = [v21 devices];
  if ([v22 count])
  {
    long long v71 = v22;
    long long v72 = v21;
    [v22 firstObject];
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v73 = v88 = 0u;
    frameRatesByPowerUsage = [v73 formats];
    uint64_t v24 = [frameRatesByPowerUsage countByEnumeratingWithState:&v85 objects:v91 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v69 = v6;
      id v70 = v7;
      v26 = 0;
      v80 = 0;
      uint64_t v27 = *(void *)v86;
      int v28 = -1;
      uint64_t v75 = *(void *)v86;
      long long v76 = frameRatesByPowerUsage;
      do
      {
        uint64_t v29 = 0;
        uint64_t v78 = v25;
        do
        {
          if (*(void *)v86 != v27) {
            objc_enumerationMutation(frameRatesByPowerUsage);
          }
          BOOL v30 = *(void **)(*((void *)&v85 + 1) + 8 * v29);
          if (CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)objc_msgSend(v30, "formatDescription", v69)) == 1785950320)
          {
            uint64_t v79 = v29;
            [v30 formatDescription];
            int NumberOfPoints = CMPointCloudFormatDescriptionGetNumberOfPoints();
            int v32 = NumberOfPoints;
            if (v28 == -1) {
              int v28 = NumberOfPoints;
            }
            long long v81 = 0u;
            long long v82 = 0u;
            if (a4 == 1) {
              BOOL v33 = NumberOfPoints > v28;
            }
            else {
              BOOL v33 = NumberOfPoints < v28;
            }
            long long v83 = 0uLL;
            long long v84 = 0uLL;
            uint64_t v34 = [v30 videoSupportedFrameRateRanges];
            uint64_t v35 = [v34 countByEnumeratingWithState:&v81 objects:v90 count:16];
            if (v35)
            {
              uint64_t v36 = v35;
              uint64_t v37 = *(void *)v82;
              do
              {
                for (uint64_t i = 0; i != v36; ++i)
                {
                  if (*(void *)v82 != v37) {
                    objc_enumerationMutation(v34);
                  }
                  double v39 = *(void **)(*((void *)&v81 + 1) + 8 * i);
                  if (v26) {
                    char v40 = v33;
                  }
                  else {
                    char v40 = 1;
                  }
                  if (v40) {
                    goto LABEL_27;
                  }
                  if (v32 == v28)
                  {
                    [*(id *)(*((void *)&v81 + 1) + 8 * i) maxFrameRate];
                    double v44 = v43;
                    [v80 maxFrameRate];
                    if (v44 > v45)
                    {
LABEL_27:
                      id v41 = v30;

                      id v42 = v39;
                      v26 = v41;
                      v80 = v42;
                    }
                    int v28 = v32;
                    continue;
                  }
                }
                uint64_t v36 = [v34 countByEnumeratingWithState:&v81 objects:v90 count:16];
              }
              while (v36);
            }

            uint64_t v27 = v75;
            frameRatesByPowerUsage = v76;
            uint64_t v25 = v78;
            uint64_t v29 = v79;
          }
          ++v29;
        }
        while (v29 != v25);
        uint64_t v25 = [frameRatesByPowerUsage countByEnumeratingWithState:&v85 objects:v91 count:16];
      }
      while (v25);

      if (!v26)
      {
        v64 = 0;
        double v6 = v69;
        id v7 = v70;
        goto LABEL_49;
      }
      [v80 maxFrameRate];
      double v47 = v46;
      v48 = v69;
      uint64_t v49 = [(NSArray *)v69 objectAtIndexedSubscript:0];
      [v49 doubleValue];
      double v51 = v50;

      id v7 = v70;
      if (v47 < v51)
      {
        v52 = NSNumber;
        [v80 maxFrameRate];
        v53 = objc_msgSend(v52, "numberWithDouble:");
        v54 = _ARLogSensor_2();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          v55 = (objc_class *)objc_opt_class();
          v56 = NSStringFromClass(v55);
          v57 = [(NSArray *)v69 objectAtIndexedSubscript:0];
          [v57 doubleValue];
          int64_t v59 = v58;
          [v53 doubleValue];
          *(_DWORD *)buf = 138544130;
          v94 = v56;
          __int16 v95 = 2048;
          id v96 = a1;
          __int16 v97 = 2048;
          int64_t v98 = v59;
          __int16 v99 = 2048;
          uint64_t v100 = v60;
          _os_log_impl(&dword_1B88A2000, v54, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Requested time of flight framerate: %f. Returning best available framerate: %f.", buf, 0x2Au);
        }
        v89[0] = v53;
        int v61 = [(NSArray *)v69 objectAtIndexedSubscript:1];
        v89[1] = v61;
        BOOL v62 = [(NSArray *)v69 objectAtIndexedSubscript:2];
        v89[2] = v62;
        uint64_t v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:3];

        v48 = (void *)v63;
      }
      v64 = [[ARVideoFormat alloc] initWithCaptureDevice:v73 format:v26];
      double v6 = v48;
      frameRatesByPowerUsage = v64->_frameRatesByPowerUsage;
      v64->_frameRatesByPowerUsage = v6;
    }
    else
    {
      v80 = 0;
      v26 = 0;
      v64 = 0;
    }

LABEL_49:
    uint64_t v22 = v71;
    v21 = v72;
    v65 = v73;
    goto LABEL_50;
  }
  v65 = _ARLogGeneral_10();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
  {
    id v66 = (objc_class *)objc_opt_class();
    uint64_t v67 = NSStringFromClass(v66);
    *(_DWORD *)buf = 138543874;
    v94 = v67;
    __int16 v95 = 2048;
    id v96 = a1;
    __int16 v97 = 2048;
    int64_t v98 = a3;
    _os_log_impl(&dword_1B88A2000, v65, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: No point cloud capture device found. (%ld)", buf, 0x20u);
  }
  v64 = 0;
LABEL_50:

  return v64;
}

+ (id)supportedVideoFormatsForDevicePosition:(int64_t)a3 deviceType:(id)a4
{
  id v5 = a4;
  double v6 = [(id)objc_opt_class() supportedVideoFormatsForDevicePosition:a3 deviceType:v5 frameRate:0.0];

  return v6;
}

+ (id)supportedVideoFormatsForDevicePosition:(int64_t)a3 deviceType:(id)a4 videoBinned:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  uint64_t v8 = [(id)objc_opt_class() supportedVideoFormatsForDevicePosition:a3 deviceType:v7 videoBinned:v5 frameRate:0.0];

  return v8;
}

+ (id)supportedVideoFormatsForDevicePosition:(int64_t)a3 deviceType:(id)a4 frameRate:(double)a5
{
  id v7 = a4;
  uint64_t v8 = v7;
  if (a3 == 2)
  {
    BOOL v9 = ARFrontFacingImageSensorVideoBinnedUserDefaultsKey;
  }
  else
  {
    if (a3 != 1) {
      goto LABEL_10;
    }
    if ((id)*MEMORY[0x1E4F15830] == v7)
    {
      BOOL v9 = ARBackFacingWideImageSensorVideoBinnedUserDefaultsKey;
    }
    else
    {
      if ((id)*MEMORY[0x1E4F15828] != v7) {
        goto LABEL_10;
      }
      BOOL v9 = ARBackFacingUltraWideImageSensorVideoBinnedUserDefaultsKey;
    }
  }
  BOOL v10 = +[ARKitUserDefaults objectForKey:*v9];
  if (v10)
  {
    NSInteger v11 = v10;
    uint64_t v12 = [v10 BOOLValue];

    goto LABEL_11;
  }
LABEL_10:
  uint64_t v12 = 1;
LABEL_11:
  int64_t v13 = [(id)objc_opt_class() supportedVideoFormatsForDevicePosition:a3 deviceType:v8 videoBinned:v12 frameRate:a5];

  return v13;
}

+ (id)supportedVideoFormatsForDevicePosition:(int64_t)a3 deviceType:(id)a4 videoBinned:(BOOL)a5 frameRate:(double)a6
{
  BOOL v7 = a5;
  id v9 = a4;
  if (supportedVideoFormatsForDevicePosition_deviceType_videoBinned_frameRate__onceToken != -1) {
    dispatch_once(&supportedVideoFormatsForDevicePosition_deviceType_videoBinned_frameRate__onceToken, &__block_literal_global_31);
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)supportedVideoFormatsForDevicePosition_deviceType_videoBinned_frameRate__semaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (!supportedVideoFormatsForDevicePosition_deviceType_videoBinned_frameRate__cachedSupportedVideoFormats)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    NSInteger v11 = (void *)supportedVideoFormatsForDevicePosition_deviceType_videoBinned_frameRate__cachedSupportedVideoFormats;
    supportedVideoFormatsForDevicePosition_deviceType_videoBinned_frameRate__cachedSupportedVideoFormats = v10;
  }
  uint64_t v12 = @"non-binned";
  if (v7) {
    uint64_t v12 = @"binned";
  }
  int64_t v13 = [NSString stringWithFormat:@"%@-%@:%li:%f", v9, v12, a3, *(void *)&a6];
  objc_super v14 = [(id)supportedVideoFormatsForDevicePosition_deviceType_videoBinned_frameRate__cachedSupportedVideoFormats objectForKey:v13];
  if (v14)
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)supportedVideoFormatsForDevicePosition_deviceType_videoBinned_frameRate__semaphore);
    id v15 = v14;
  }
  else
  {
    id v15 = [(id)objc_opt_class() _querySupportedVideoFormatsForDevicePosition:a3 deviceType:v9 videoBinned:v7 frameRate:a6];
    if ([v15 count]) {
      [(id)supportedVideoFormatsForDevicePosition_deviceType_videoBinned_frameRate__cachedSupportedVideoFormats setObject:v15 forKey:v13];
    }
    dispatch_semaphore_signal((dispatch_semaphore_t)supportedVideoFormatsForDevicePosition_deviceType_videoBinned_frameRate__semaphore);
  }

  return v15;
}

void __89__ARVideoFormat_supportedVideoFormatsForDevicePosition_deviceType_videoBinned_frameRate___block_invoke()
{
  dispatch_semaphore_t v0 = dispatch_semaphore_create(1);
  v1 = (void *)supportedVideoFormatsForDevicePosition_deviceType_videoBinned_frameRate__semaphore;
  supportedVideoFormatsForDevicePosition_deviceType_videoBinned_frameRate__semaphore = (uint64_t)v0;
}

+ (id)_querySupportedVideoFormatsForDevicePosition:(int64_t)a3 deviceType:(id)a4 videoBinned:(BOOL)a5 frameRate:(double)a6
{
  BOOL v146 = a5;
  v194[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = objc_opt_new();
  uint64_t v10 = (void *)MEMORY[0x1E4F16448];
  v194[0] = v8;
  NSInteger v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v194 count:1];
  uint64_t v12 = [v10 discoverySessionWithDeviceTypes:v11 mediaType:*MEMORY[0x1E4F15C18] position:a3];

  v136 = v12;
  int64_t v13 = [v12 devices];
  int64_t v141 = a3;
  if ([v13 count])
  {
    id v147 = v8;
    v152 = [v13 firstObject];
    objc_super v14 = (void *)MEMORY[0x1E4F15828];
    v134 = v13;
    if (a3 == 1)
    {
      if ((id)*MEMORY[0x1E4F15830] == v8)
      {
        id v15 = +[ARKitUserDefaults resolutionDictionaryForKey:@"com.apple.arkit.imagesensor.back.wide.resolution"];
        uint64_t v16 = ARBackFacingWideImageSensorFrameRateUserDefaultsKey;
        goto LABEL_14;
      }
      if ((id)*MEMORY[0x1E4F15828] == v8)
      {
        id v15 = +[ARKitUserDefaults resolutionDictionaryForKey:@"com.apple.arkit.imagesensor.back.ultrawide.resolution"];
        uint64_t v16 = ARBackFacingUltraWideImageSensorFrameRateUserDefaultsKey;
LABEL_14:
        v23 = +[ARKitUserDefaults valueForKey:*v16];
        v143 = 0;
        goto LABEL_23;
      }
    }
    else if (a3 == 2)
    {
      id v15 = +[ARKitUserDefaults resolutionDictionaryForKey:@"com.apple.arkit.imagesensor.front.resolution"];
      uint64_t v21 = +[ARKitUserDefaults valueForKey:@"com.apple.arkit.imagesensor.front.frameRate"];
      ARFaceTrackingDevice();
      id v22 = (id)objc_claimAutoreleasedReturnValue();

      if (v22 == v8)
      {
        uint64_t v24 = +[ARKitUserDefaults numberForKey:@"com.apple.arkit.imagesensor.face.frameRateNormal"];
        uint64_t v25 = +[ARKitUserDefaults numberForKey:@"com.apple.arkit.imagesensor.face.frameRateLow"];
        uint64_t v26 = +[ARKitUserDefaults numberForKey:@"com.apple.arkit.imagesensor.face.frameRateLowest"];
        uint64_t v27 = (void *)v26;
        v143 = 0;
        if (v24 && v25 && v26)
        {
          v193[0] = v24;
          v193[1] = v25;
          v193[2] = v26;
          v143 = [MEMORY[0x1E4F1C978] arrayWithObjects:v193 count:3];
          int v28 = _ARLogSensor_2();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v29 = (objc_class *)objc_opt_class();
            NSStringFromClass(v29);
            id v30 = (id)objc_claimAutoreleasedReturnValue();
            [v24 doubleValue];
            uint64_t v32 = v31;
            [v25 doubleValue];
            int64_t v34 = v33;
            [v27 doubleValue];
            *(_DWORD *)buf = 138544386;
            id v185 = v30;
            __int16 v186 = 2048;
            id v187 = a1;
            __int16 v188 = 2048;
            *(void *)v189 = v32;
            *(_WORD *)&v189[8] = 2048;
            int64_t v190 = v34;
            __int16 v191 = 2048;
            uint64_t v192 = v35;
            _os_log_impl(&dword_1B88A2000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: ARVideoFormat face tracking frame rates set to %f, %f, %f by user defaults", buf, 0x34u);

            objc_super v14 = (void *)MEMORY[0x1E4F15828];
          }
        }
      }
      else
      {
        v143 = 0;
      }
      a3 = v141;
      v23 = (void *)v21;
LABEL_23:
      objc_opt_class();
      v133 = v15;
      if (objc_opt_isKindOfClass())
      {
        id v36 = v15;
        uint64_t v37 = [v36 objectForKeyedSubscript:@"width"];
        uint64_t v38 = [v36 objectForKeyedSubscript:@"height"];
        double v39 = (void *)v38;
        int v40 = 0;
        int v155 = 0;
        if (v37 && v38)
        {
          int v40 = [v37 intValue];
          int v155 = [v39 intValue];
          id v41 = _ARLogSensor_2();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            id v42 = (objc_class *)objc_opt_class();
            NSStringFromClass(v42);
            double v43 = v14;
            id v44 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            id v185 = v44;
            __int16 v186 = 2048;
            id v187 = a1;
            __int16 v188 = 1024;
            *(_DWORD *)v189 = v40;
            *(_WORD *)&v189[4] = 1024;
            *(_DWORD *)&v189[6] = v155;
            _os_log_impl(&dword_1B88A2000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: ARVideoFormat resolution set to %i, %i by user defaults", buf, 0x22u);

            objc_super v14 = v43;
          }
        }
        a3 = v141;
      }
      else
      {
        int v155 = 0;
        int v40 = 0;
      }
      v132 = v23;
      if (v23)
      {
        [v23 doubleValue];
        double v46 = v45;
        double v47 = _ARLogSensor_2();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          v48 = (objc_class *)objc_opt_class();
          NSStringFromClass(v48);
          id v49 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          id v185 = v49;
          __int16 v186 = 2048;
          id v187 = a1;
          a3 = v141;
          __int16 v188 = 2048;
          *(double *)v189 = v46;
          _os_log_impl(&dword_1B88A2000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: ARVideoFormat frame rate set to %f by user defaults", buf, 0x20u);
        }
      }
      else
      {
        double v46 = 0.0;
        if (a6 <= 0.0) {
          goto LABEL_39;
        }
        double v47 = _ARLogSensor_2();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          double v50 = (objc_class *)objc_opt_class();
          NSStringFromClass(v50);
          id v51 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          id v185 = v51;
          __int16 v186 = 2048;
          id v187 = a1;
          a3 = v141;
          __int16 v188 = 2048;
          *(double *)v189 = a6;
          _os_log_impl(&dword_1B88A2000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: ARVideoFormat frame rate set to %f by SPI", buf, 0x20u);
        }
        double v46 = a6;
      }

LABEL_39:
      uint64_t v52 = [MEMORY[0x1E4F1CA80] set];
      if (a3 == 1) {
        char v53 = ARDeviceIsiPad();
      }
      else {
        char v53 = 0;
      }
      uint64_t v54 = ARDeviceString();
      v153 = (void *)v52;
      v131 = (void *)v54;
      if (a3 == 2)
      {
        v55 = (void *)v54;
        ARFaceTrackingDevice();
        id v56 = (id)objc_claimAutoreleasedReturnValue();
        if (v56 == v147) {
          int v57 = [v55 hasPrefix:@"D22"] ^ 1;
        }
        else {
          LOBYTE(v57) = 0;
        }
        v53 |= v57;
      }
      id v8 = v147;
      uint64_t v130 = *v14;
      if (a3 == 2 && *v14 == (void)v147) {
        char v59 = 1;
      }
      else {
        char v59 = v53;
      }
      char v60 = ARShouldSupport1440pAndAutofocus();
      if (a3 == 1)
      {
        int v150 = ARShouldSupport1440pAndAutofocus() ^ 1;
        int v61 = ARShouldSupport1440pAndAutofocus() ^ 1;
      }
      else
      {
        LOBYTE(v61) = 1;
        LOBYTE(v150) = 1;
      }
      unsigned __int8 v149 = v61;
      int v62 = v155;
      v140 = objc_opt_new();
      if (v46 <= 0.0)
      {
        BOOL v64 = v146;
        if (v143)
        {
          v65 = [v143 firstObject];
          [v65 doubleValue];
          double v63 = v66;

          int v145 = 0;
          double v46 = v63;
        }
        else
        {
          double v63 = 30.0;
          int v145 = 1;
        }
      }
      else
      {
        int v145 = 0;
        double v63 = v46;
        BOOL v64 = v146;
      }
      if ARDeviceSupportsMulticamMode() && (ARUserDefaultsMulticamModeEnabled()) {
        int v159 = 1;
      }
      else {
        int v159 = ARDeviceSupportsJasper();
      }
      long long v177 = 0u;
      long long v178 = 0u;
      long long v175 = 0u;
      long long v176 = 0u;
      uint64_t v138 = [&unk_1F125BD38 countByEnumeratingWithState:&v175 objects:v183 count:16];
      if (v138)
      {
        v142 = 0;
        char v148 = v60 & v59 ^ 1;
        uint64_t v137 = *(void *)v176;
        id v158 = (id)*MEMORY[0x1E4F15820];
        int v157 = v40;
        v144 = v9;
LABEL_67:
        uint64_t v67 = 0;
        while (1)
        {
          if (*(void *)v176 != v137) {
            objc_enumerationMutation(&unk_1F125BD38);
          }
          uint64_t v139 = v67;
          v161 = *(void **)(*((void *)&v175 + 1) + 8 * v67);
          long long v171 = 0u;
          long long v172 = 0u;
          long long v173 = 0u;
          long long v174 = 0u;
          obuint64_t j = [v152 formats];
          uint64_t v162 = [obj countByEnumeratingWithState:&v171 objects:v182 count:16];
          if (v162)
          {
            uint64_t v160 = *(void *)v172;
            do
            {
              uint64_t v68 = 0;
              do
              {
                if (*(void *)v172 != v160) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v69 = *(void **)(*((void *)&v171 + 1) + 8 * v68);
                FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)[v69 formatDescription]);
                uint64_t v71 = [v161 unsignedIntegerValue];
                unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)[v69 formatDescription]);
                int32_t v73 = Dimensions;
                unint64_t v74 = HIDWORD(Dimensions);
                if (v40)
                {
                  BOOL v76 = v40 == Dimensions && v62 == HIDWORD(Dimensions);
                }
                else
                {
                  BOOL v77 = Dimensions == 1280 && HIDWORD(Dimensions) == 720;
                  BOOL v76 = v77;
                  char v78 = v148;
                  if (v77) {
                    char v78 = 1;
                  }
                  BOOL v80 = Dimensions == 1440 && HIDWORD(Dimensions) == 1080;
                  if ((v78 & 1) == 0) {
                    BOOL v76 = v80;
                  }
                  BOOL v82 = Dimensions == 1920 && HIDWORD(Dimensions) == 1080;
                  if (((v76 | v150) & 1) == 0) {
                    BOOL v76 = v82;
                  }
                  BOOL v84 = Dimensions == 1920 && HIDWORD(Dimensions) == 1440;
                  if (((v76 | v149) & 1) == 0) {
                    BOOL v76 = v84;
                  }
                }
                BOOL v85 = v71 == MediaSubType && v76;
                int v86 = v85 & ([v69 isVideoBinned] ^ v64 ^ 1);
                if (v159) {
                  v86 &= [v69 isMultiCamSupported];
                }
                if (v86) {
                  BOOL v87 = v158 == v8;
                }
                else {
                  BOOL v87 = 0;
                }
                if (v87)
                {
                  long long v88 = +[ARVideoFormat bestDepthFormatForDeviceFormat:v69];
                  if (!v88) {
                    goto LABEL_170;
                  }
                }
                else
                {
                  if (!v86) {
                    goto LABEL_171;
                  }
                  long long v88 = 0;
                }
                long long v169 = 0u;
                long long v170 = 0u;
                long long v167 = 0u;
                long long v168 = 0u;
                v89 = [v69 videoSupportedFrameRateRanges];
                uint64_t v90 = [v89 countByEnumeratingWithState:&v167 objects:v181 count:16];
                if (!v90) {
                  goto LABEL_169;
                }
                uint64_t v91 = v90;
                uint64_t v92 = *(void *)v168;
                while (2)
                {
                  for (uint64_t i = 0; i != v91; ++i)
                  {
                    if (*(void *)v168 != v92) {
                      objc_enumerationMutation(v89);
                    }
                    v94 = *(void **)(*((void *)&v167 + 1) + 8 * i);
                    [v94 maxFrameRate];
                    if (v95 >= v63)
                    {
                      if (v46 > 0.0 || ([v94 maxFrameRate], v96 <= 120.0))
                      {
                        __int16 v97 = [[ARVideoFormat alloc] initWithCaptureDevice:v152 format:v69];
                        objc_storeStrong((id *)&v97->_depthDataFormat, v88);
                        v156 = v88;
                        if (v46 > 0.0)
                        {
                          __int16 v99 = v153;
                          if (v143)
                          {
                            __int16 v101 = v143;
                            frameRatesByPowerUsage = v97->_frameRatesByPowerUsage;
                            v97->_frameRatesByPowerUsage = v101;
                          }
                          else
                          {
                            frameRatesByPowerUsage = [NSNumber numberWithDouble:v46];
                            v180[0] = frameRatesByPowerUsage;
                            uint64_t v102 = [NSNumber numberWithDouble:v46];
                            v180[1] = v102;
                            uint64_t v103 = [NSNumber numberWithDouble:v46];
                            v180[2] = v103;
                            uint64_t v104 = [MEMORY[0x1E4F1C978] arrayWithObjects:v180 count:3];
                            v105 = v97->_frameRatesByPowerUsage;
                            v97->_frameRatesByPowerUsage = (NSArray *)v104;

                            __int16 v99 = v153;
                          }
                        }
                        else
                        {
                          frameRatesByPowerUsage = v97->_frameRatesByPowerUsage;
                          __int16 v99 = v153;
                          if (v63 == 30.0)
                          {
                            uint64_t v100 = (NSArray *)&unk_1F125BD50;
                          }
                          else if (v141 == 2)
                          {
                            uint64_t v100 = (NSArray *)&unk_1F125BD68;
                          }
                          else
                          {
                            uint64_t v100 = (NSArray *)&unk_1F125BD80;
                          }
                          v97->_frameRatesByPowerUsage = v100;
                        }

                        uint64_t v151 = v73 * (int)v74;
                        v106 = objc_msgSend(NSNumber, "numberWithInteger:", -[ARVideoFormat framesPerSecond](v97, "framesPerSecond") * v151);
                        if ([v99 containsObject:v106])
                        {
                          id v8 = v147;
                          long long v88 = v156;
                        }
                        else
                        {
                          [v144 addObject:v97];
                          [v99 addObject:v106];
                          long long v88 = v156;
                          if (v73 == 1920 && v74 == 1440)
                          {
                            v107 = v97;

                            v142 = v107;
                          }
                          else if (v73 == 1440)
                          {
                            id v8 = v147;
                            if (v74 == 1080) {
                              [v140 addObject:v97];
                            }
                            goto LABEL_157;
                          }
                          id v8 = v147;
                        }
LABEL_157:
                        if (v145)
                        {
                          [v94 maxFrameRate];
                          if (v108 >= 60.0)
                          {
                            v109 = [[ARVideoFormat alloc] initWithCaptureDevice:v152 format:v69];
                            objc_storeStrong((id *)&v109->_depthDataFormat, v88);
                            if (v141 == 2
                              && (ARFaceTrackingDevice(),
                                  id v110 = (id)objc_claimAutoreleasedReturnValue(),
                                  v110,
                                  v110 == v8))
                            {
                              v111 = v109->_frameRatesByPowerUsage;
                              v112 = (NSArray *)&unk_1F125BD98;
                            }
                            else
                            {
                              v111 = v109->_frameRatesByPowerUsage;
                              v112 = (NSArray *)&unk_1F125BDB0;
                            }
                            v109->_frameRatesByPowerUsage = v112;

                            v113 = objc_msgSend(NSNumber, "numberWithInteger:", -[ARVideoFormat framesPerSecond](v109, "framesPerSecond") * v151);
                            if (([v153 containsObject:v113] & 1) == 0)
                            {
                              [v144 addObject:v109];
                              [v153 addObject:v113];
                              if (v73 == 1440 && v74 == 1080) {
                                [v140 addObject:v109];
                              }
                            }
                          }
                        }

                        goto LABEL_168;
                      }
                    }
                  }
                  uint64_t v91 = [v89 countByEnumeratingWithState:&v167 objects:v181 count:16];
                  if (v91) {
                    continue;
                  }
                  break;
                }
                id v8 = v147;
LABEL_168:
                BOOL v64 = v146;
LABEL_169:

                int v62 = v155;
LABEL_170:
                int v40 = v157;
LABEL_171:
                ++v68;
              }
              while (v68 != v162);
              uint64_t v114 = [obj countByEnumeratingWithState:&v171 objects:v182 count:16];
              uint64_t v162 = v114;
            }
            while (v114);
          }

          id v9 = v144;
          if ([v144 count]) {
            break;
          }
          uint64_t v67 = v139 + 1;
          if (v139 + 1 == v138)
          {
            uint64_t v138 = [&unk_1F125BD38 countByEnumeratingWithState:&v175 objects:v183 count:16];
            if (v138) {
              goto LABEL_67;
            }
            break;
          }
        }
        int64_t v13 = v134;
        v115 = v142;
        if (v142)
        {
          v116 = v140;
          if ([v140 count])
          {
            long long v165 = 0u;
            long long v166 = 0u;
            long long v163 = 0u;
            long long v164 = 0u;
            id v117 = v140;
            uint64_t v118 = [v117 countByEnumeratingWithState:&v163 objects:v179 count:16];
            if (v118)
            {
              uint64_t v119 = v118;
              uint64_t v120 = *(void *)v164;
              do
              {
                for (uint64_t j = 0; j != v119; ++j)
                {
                  if (*(void *)v164 != v120) {
                    objc_enumerationMutation(v117);
                  }
                  [v144 removeObject:*(void *)(*((void *)&v163 + 1) + 8 * j)];
                }
                uint64_t v119 = [v117 countByEnumeratingWithState:&v163 objects:v179 count:16];
              }
              while (v119);
            }

            v122 = _ARLogGeneral_10();
            if (os_log_type_enabled(v122, OS_LOG_TYPE_INFO))
            {
              v123 = (objc_class *)objc_opt_class();
              NSStringFromClass(v123);
              id v124 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              id v185 = v124;
              __int16 v186 = 2048;
              id v187 = a1;
              _os_log_impl(&dword_1B88A2000, v122, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Removing 1440x1080 video format, because 1920x1440 is supported", buf, 0x16u);
            }
            int64_t v13 = v134;
          }
LABEL_192:
          [v9 sortUsingComparator:&__block_literal_global_83];
          uint64_t v125 = ARFaceTrackingDevice();
          v126 = (void *)v125;
          if (v141 == 2
            && (id)v125 == v8
            && [v152 isGeometricDistortionCorrectionSupported])
          {
            int v127 = ARLinkedOnOrAfterAzulE();

            if (!v127)
            {
LABEL_198:
              id v128 = v9;

              goto LABEL_199;
            }
            v126 = [(id)objc_opt_class() _querySupportedVideoFormatsForDevicePosition:2 deviceType:v130 videoBinned:v64 frameRate:a6];
            [v9 addObjectsFromArray:v126];
          }

          goto LABEL_198;
        }
      }
      else
      {
        v115 = 0;
        int64_t v13 = v134;
      }
      v116 = v140;
      goto LABEL_192;
    }
    v143 = 0;
    v23 = 0;
    id v15 = 0;
    goto LABEL_23;
  }
  id v17 = _ARLogGeneral_10();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    uint64_t v18 = (objc_class *)objc_opt_class();
    objc_super v19 = NSStringFromClass(v18);
    *(_DWORD *)buf = 138544130;
    id v185 = v19;
    __int16 v186 = 2048;
    id v187 = a1;
    __int16 v188 = 2114;
    *(void *)v189 = v8;
    *(_WORD *)&v189[8] = 2048;
    int64_t v190 = a3;
    _os_log_impl(&dword_1B88A2000, v17, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: No image capture device found in supportedVideoFormatsForDevicePosition. (%{public}@ / %ld)", buf, 0x2Au);
  }
  id v20 = v9;
LABEL_199:

  return v9;
}

uint64_t __95__ARVideoFormat__querySupportedVideoFormatsForDevicePosition_deviceType_videoBinned_frameRate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 imageResolution];
  double v7 = v6;
  [v4 imageResolution];
  double v9 = v7 * v8;
  [v5 imageResolution];
  double v11 = v10;
  [v5 imageResolution];
  if (v9 >= v11 * v12)
  {
    uint64_t v14 = [v4 framesPerSecond];
    if (v14 < [v5 framesPerSecond]) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = -1;
    }
  }
  else
  {
    uint64_t v13 = 1;
  }

  return v13;
}

+ (id)bestDepthFormatForDeviceFormat:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 supportedDepthDataFormats];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    double v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        double v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)[v10 formatDescription]) == 1717855600)
        {
          int32_t width = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)[v10 formatDescription]).width;
          if (!v7
            || width > CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)[v7 formatDescription]).width)
          {
            id v12 = v10;

            double v7 = v12;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

+ (id)supportedVideoFormatsForStillImageCapture
{
  double v2 = objc_opt_class();
  uint64_t v3 = *MEMORY[0x1E4F15830];
  return (id)[v2 supportedVideoFormatsForStillImageCaptureForDevicePosition:1 deviceType:v3];
}

+ (id)supportedVideoFormatsForStillImageCaptureForDevicePosition:(int64_t)a3 deviceType:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(id)objc_opt_class() supportedVideoFormatsForDevicePosition:a3 deviceType:v5 videoBinned:0];

  return v6;
}

+ (CGSize)hiResVideoDimensions
{
  double v2 = 3840.0;
  double v3 = 2160.0;
  result.double height = v3;
  result.int32_t width = v2;
  return result;
}

+ (id)supportedVideoFormatsForHiResOrX420
{
  double v2 = objc_opt_class();
  uint64_t v3 = *MEMORY[0x1E4F15830];
  return (id)[v2 supportedVideoFormatsForHiResOrX420ForDevicePosition:1 deviceType:v3];
}

+ (id)supportedVideoFormatsForHiResOrX420ForDevicePosition:(int64_t)a3 deviceType:(id)a4
{
  v57[3] = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v40 = (id)objc_opt_new();
  if (([v4 isEqualToString:*MEMORY[0x1E4F157F0]] & 1) == 0
    && ([v4 isEqualToString:*MEMORY[0x1E4F15818]] & 1) == 0)
  {
    [(id)objc_opt_class() hiResVideoDimensions];
    double v6 = v5;
    double v8 = v7;
    unint64_t v9 = (int)v5 | ((unint64_t)(int)v7 << 32);
    uint64_t v10 = [(id)objc_opt_class() bestVideoFormatForDevicePosition:a3 deviceType:v4 resolution:v9 frameRate:0 videoBinned:1 needsHDRSupport:30.0];
    if (v10) {
      [v40 addObject:v10];
    }
    double v11 = +[ARKitUserDefaults valueForKey:@"com.apple.arkit.imagesensor.back.wide.frameRate"];
    if (v11)
    {
      id v12 = objc_opt_class();
      [v11 floatValue];
      long long v14 = [v12 bestVideoFormatForDevicePosition:a3 deviceType:v4 resolution:v9 frameRate:0 videoBinned:1 needsHDRSupport:v13];
      if (v14) {
        [v40 addObject:v14];
      }
    }
    int64_t v34 = v11;
    uint64_t v35 = (void *)v10;
    *(double *)uint64_t v54 = v6;
    *(double *)&v54[1] = v8;
    long long v15 = [MEMORY[0x1E4F29238] valueWithBytes:v54 objCType:"{CGSize=dd}"];
    v57[0] = v15;
    long long v53 = xmmword_1B8A2EA40;
    long long v16 = [MEMORY[0x1E4F29238] valueWithBytes:&v53 objCType:"{CGSize=dd}"];
    v57[1] = v16;
    long long v52 = xmmword_1B8A2EA50;
    long long v17 = [MEMORY[0x1E4F29238] valueWithBytes:&v52 objCType:"{CGSize=dd}"];
    v57[2] = v17;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:3];

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    obuint64_t j = v18;
    uint64_t v38 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
    if (v38)
    {
      uint64_t v37 = *(void *)v49;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v49 != v37) {
            objc_enumerationMutation(obj);
          }
          uint64_t v39 = v19;
          id v20 = *(void **)(*((void *)&v48 + 1) + 8 * v19);
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          uint64_t v21 = [&unk_1F125BDF8 countByEnumeratingWithState:&v44 objects:v55 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v45;
            do
            {
              for (uint64_t i = 0; i != v22; ++i)
              {
                id v25 = v4;
                if (*(void *)v45 != v23) {
                  objc_enumerationMutation(&unk_1F125BDF8);
                }
                uint64_t v26 = *(void *)(*((void *)&v44 + 1) + 8 * i);
                double v42 = 0.0;
                double v43 = 0.0;
                [v20 getValue:&v42 size:16];
                uint64_t v27 = (int)v42;
                uint64_t v28 = (int)v43;
                uint64_t v29 = objc_opt_class();
                uint64_t v30 = v27 | (v28 << 32);
                LODWORD(v33) = 2016686640;
                id v4 = v25;
                uint64_t v31 = [v29 bestVideoFormatForDevicePosition:a3 deviceType:v25 resolution:v30 frameRates:v26 videoBinned:0 needsHDRSupport:0 pixelFormat:v33];
                if (v31) {
                  [v40 addObject:v31];
                }
              }
              uint64_t v22 = [&unk_1F125BDF8 countByEnumeratingWithState:&v44 objects:v55 count:16];
            }
            while (v22);
          }
          uint64_t v19 = v39 + 1;
        }
        while (v39 + 1 != v38);
        uint64_t v38 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
      }
      while (v38);
    }
  }
  return v40;
}

+ (BOOL)isCaptureDeviceTypeAvailable:(id)a3 position:(int64_t)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  double v5 = (void *)MEMORY[0x1E4F16448];
  id v12 = a3;
  double v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a3;
  double v8 = [v6 arrayWithObjects:&v12 count:1];
  unint64_t v9 = objc_msgSend(v5, "discoverySessionWithDeviceTypes:mediaType:position:", v8, *MEMORY[0x1E4F15C18], a4, v12, v13);

  uint64_t v10 = [v9 devices];
  LOBYTE(a4) = [v10 count] != 0;

  return a4;
}

- (AVCaptureDevicePosition)captureDevicePosition
{
  return self->_captureDevicePosition;
}

- (AVCaptureDeviceType)captureDeviceType
{
  return self->_captureDeviceType;
}

- (NSArray)frameRatesByPowerUsage
{
  return self->_frameRatesByPowerUsage;
}

- (AVCaptureDeviceFormat)depthDataFormat
{
  return self->_depthDataFormat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_depthDataFormat, 0);
  objc_storeStrong((id *)&self->_frameRatesByPowerUsage, 0);
  objc_storeStrong((id *)&self->_captureDeviceType, 0);
  objc_storeStrong((id *)&self->_deviceFormat, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end