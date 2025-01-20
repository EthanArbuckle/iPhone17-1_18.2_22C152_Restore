@interface VNDepthRepresentation
+ (id)depthRepresentationForDepthData:(id)a3 orientation:(unsigned int)a4;
+ (id)depthRepresentationForImageSource:(CGImageSource *)a3 orientation:(unsigned int)a4;
- (BOOL)absoluteAccuracy;
- (BOOL)highQuality;
- (NSData)lensDistortionData;
- (__CVBuffer)depthBuffer;
- (__n128)cameraIntrinsics;
- (id)_initWithAVDepthData:(id)a3 orientation:(unsigned int)a4;
- (unsigned)orientation;
@end

@implementation VNDepthRepresentation

- (void).cxx_destruct
{
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (__CVBuffer)depthBuffer
{
  return [(AVDepthData *)self->_depthData depthDataMap];
}

- (NSData)lensDistortionData
{
  v2 = [(AVDepthData *)self->_depthData cameraCalibrationData];
  v3 = [v2 lensDistortionLookupTable];

  return (NSData *)v3;
}

- (BOOL)absoluteAccuracy
{
  return [(AVDepthData *)self->_depthData depthDataAccuracy] == AVDepthDataAccuracyAbsolute;
}

- (BOOL)highQuality
{
  return [(AVDepthData *)self->_depthData depthDataQuality] == AVDepthDataQualityHigh;
}

- (__n128)cameraIntrinsics
{
  v1 = [*(id *)(a1 + 8) cameraCalibrationData];
  [v1 intrinsicMatrix];
  long long v4 = v2;

  return (__n128)v4;
}

- (id)_initWithAVDepthData:(id)a3 orientation:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VNDepthRepresentation;
  v7 = [(VNDepthRepresentation *)&v13 init];
  if (v7)
  {
    uint64_t v8 = [v6 depthDataByConvertingToDepthDataType:1717855600];
    depthData = v7->_depthData;
    v7->_depthData = (AVDepthData *)v8;

    uint64_t v10 = [(AVDepthData *)v7->_depthData depthDataByApplyingExifOrientation:v4];
    v11 = v7->_depthData;
    v7->_depthData = (AVDepthData *)v10;

    v7->_orientation = v4;
  }

  return v7;
}

+ (id)depthRepresentationForImageSource:(CGImageSource *)a3 orientation:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  CFDictionaryRef v6 = CGImageSourceCopyAuxiliaryDataInfoAtIndex(a3, 0, (CFStringRef)*MEMORY[0x1E4F2F3B0]);
  if (v6 || (CFDictionaryRef v6 = CGImageSourceCopyAuxiliaryDataInfoAtIndex(a3, 0, (CFStringRef)*MEMORY[0x1E4F2F3B8])) != 0)
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2050000000;
    v7 = (void *)getAVDepthDataClass_softClass;
    uint64_t v16 = getAVDepthDataClass_softClass;
    if (!getAVDepthDataClass_softClass)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __getAVDepthDataClass_block_invoke;
      v12[3] = &unk_1E5B20220;
      v12[4] = &v13;
      __getAVDepthDataClass_block_invoke((uint64_t)v12);
      v7 = (void *)v14[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v13, 8);
    v9 = [v8 depthDataFromDictionaryRepresentation:v6 error:0];
    id v10 = [[VNDepthRepresentation alloc] _initWithAVDepthData:v9 orientation:v4];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)depthRepresentationForDepthData:(id)a3 orientation:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  id v6 = [[VNDepthRepresentation alloc] _initWithAVDepthData:v5 orientation:v4];

  return v6;
}

@end