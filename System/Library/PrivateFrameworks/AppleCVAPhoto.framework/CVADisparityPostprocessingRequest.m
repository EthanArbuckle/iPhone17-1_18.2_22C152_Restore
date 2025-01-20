@interface CVADisparityPostprocessingRequest
- (BOOL)isFocalPlaneLocked;
- (CVAQuaternion)sourceColorPixelBufferOrientation;
- (CVAVector)sourceColorPixelBufferGlobalMotion;
- (CVAVector)sourceColorPixelBufferGravity;
- (NSArray)facesArray;
- (NSArray)focusRegion;
- (NSData)focusTileData;
- (NSDictionary)faceModel;
- (__CVBuffer)destinationDisparityPixelBuffer;
- (__CVBuffer)fixedPointDisparityPixelBuffer;
- (__CVBuffer)networkDisparityPixelBuffer;
- (__CVBuffer)segmentationPixelBuffer;
- (__CVBuffer)sourceColorPixelBuffer;
- (float)currentFocusPosition;
- (float)disparityNormalizationMultiplier;
- (float)disparityNormalizationOffset;
- (float)focusDistanceToMaxAllowedFocusDistanceRatio;
- (float)phaseToBlurFactor;
- (int)focusRegionType;
- (signed)focusTileXOffset;
- (signed)focusTileYOffset;
- (signed)totalSensorCropXOffset;
- (signed)totalSensorCropYOffset;
- (uint64_t)initWithSourceColorPixelBuffer:(float)a3 segmentationPixelBuffer:(float)a4 focusTileData:(double)a5 focusTileXOffset:(double)a6 focusTileYOffset:(double)a7 focusTileWidth:(double)a8 focusTileHeight:(uint64_t)a9 focusMapWidth:(__CVBuffer *)a10 focusMapHeight:(__CVBuffer *)a11 totalSensorCropXOffset:(void *)a12 totalSensorCropYOffset:(__int16)a13 totalSensorCropWidth:(__int16)a14 totalSensorCropHeight:(__int16)a15 phaseToBlurFactor:(__int16)a16 destinationDisparityPixelBuffer:(__int16)a17 focusRegion:(__int16)a18 focusRegionType:(__int16)a19 currentFocusPosition:(__int16)a20 lockFocalPlane:(__int16)a21 focusDistanceToMaxAllowedFocusDistanceRatio:(__int16)a22 sourceColorPixelBufferOrientation:(__CVBuffer *)texture sourceColorPixelBufferGravity:(void *)a24 sourceColorPixelBufferGlobalMotion:(int)a25 facesArray:(char)a26;
- (unsigned)focusMapHeight;
- (unsigned)focusMapWidth;
- (unsigned)focusTileHeight;
- (unsigned)focusTileWidth;
- (unsigned)totalSensorCropHeight;
- (unsigned)totalSensorCropWidth;
- (void)dealloc;
- (void)initWithSourceColorPixelBuffer:(double)a3 fixedPointDisparityPixelBuffer:(double)a4 destinationDisparityPixelBuffer:(double)a5 focusRegion:(double)a6 focusRegionType:(double)a7 currentFocusPosition:(double)a8 lockFocalPlane:(double)a9 sourceColorPixelBufferOrientation:(uint64_t)a10 sourceColorPixelBufferGravity:(__CVBuffer *)a11 sourceColorPixelBufferGlobalMotion:(__CVBuffer *)a12 facesArray:(__CVBuffer *)a13 disparityNormalizationMultiplier:(void *)a14 disparityNormalizationOffset:(int)a15;
- (void)initWithSourceColorPixelBuffer:(double)a3 segmentationPixelBuffer:(double)a4 networkDisparityPixelBuffer:(double)a5 destinationDisparityPixelBuffer:(double)a6 focusRegion:(double)a7 focusRegionType:(double)a8 currentFocusPosition:(double)a9 lockFocalPlane:(uint64_t)a10 sourceColorPixelBufferOrientation:(__CVBuffer *)a11 sourceColorPixelBufferGravity:(__CVBuffer *)a12 sourceColorPixelBufferGlobalMotion:(__CVBuffer *)a13 facesArray:(__CVBuffer *)a14 disparityNormalizationMultiplier:(void *)a15 disparityNormalizationOffset:(int)a16;
@end

@implementation CVADisparityPostprocessingRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusTileData, 0);
  objc_storeStrong((id *)&self->_faceModel, 0);
  objc_storeStrong((id *)&self->_facesArray, 0);

  objc_storeStrong((id *)&self->_focusRegion, 0);
}

- (float)phaseToBlurFactor
{
  return self->_phaseToBlurFactor;
}

- (unsigned)totalSensorCropHeight
{
  return self->_totalSensorCropHeight;
}

- (unsigned)totalSensorCropWidth
{
  return self->_totalSensorCropWidth;
}

- (signed)totalSensorCropYOffset
{
  return self->_totalSensorCropYOffset;
}

- (signed)totalSensorCropXOffset
{
  return self->_totalSensorCropXOffset;
}

- (unsigned)focusMapHeight
{
  return self->_focusMapHeight;
}

- (unsigned)focusMapWidth
{
  return self->_focusMapWidth;
}

- (unsigned)focusTileHeight
{
  return self->_focusTileHeight;
}

- (unsigned)focusTileWidth
{
  return self->_focusTileWidth;
}

- (signed)focusTileYOffset
{
  return self->_focusTileYOffset;
}

- (signed)focusTileXOffset
{
  return self->_focusTileXOffset;
}

- (NSData)focusTileData
{
  return (NSData *)objc_getProperty(self, a2, 120, 1);
}

- (float)disparityNormalizationOffset
{
  return self->_disparityNormalizationOffset;
}

- (float)disparityNormalizationMultiplier
{
  return self->_disparityNormalizationMultiplier;
}

- (NSDictionary)faceModel
{
  return (NSDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (NSArray)facesArray
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (CVAVector)sourceColorPixelBufferGlobalMotion
{
  objc_copyStruct(dest, &self->_sourceColorPixelBufferGlobalMotion, 24, 1, 0);
  double v2 = *(double *)dest;
  double v3 = *(double *)&dest[1];
  double v4 = *(double *)&dest[2];
  result.z = v4;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CVAVector)sourceColorPixelBufferGravity
{
  objc_copyStruct(dest, &self->_sourceColorPixelBufferGravity, 24, 1, 0);
  double v2 = *(double *)dest;
  double v3 = *(double *)&dest[1];
  double v4 = *(double *)&dest[2];
  result.z = v4;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CVAQuaternion)sourceColorPixelBufferOrientation
{
  objc_copyStruct(v6, &self->_sourceColorPixelBufferOrientation, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.z = v5;
  result.y = v4;
  result.x = v3;
  result.w = v2;
  return result;
}

- (float)focusDistanceToMaxAllowedFocusDistanceRatio
{
  return self->_focusDistanceToMaxAllowedFocusDistanceRatio;
}

- (BOOL)isFocalPlaneLocked
{
  return self->_isFocalPlaneLocked;
}

- (float)currentFocusPosition
{
  return self->_currentFocusPosition;
}

- (int)focusRegionType
{
  return self->_focusRegionType;
}

- (NSArray)focusRegion
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (__CVBuffer)networkDisparityPixelBuffer
{
  return self->_networkDisparityPixelBuffer;
}

- (__CVBuffer)destinationDisparityPixelBuffer
{
  return self->_destinationDisparityPixelBuffer;
}

- (__CVBuffer)fixedPointDisparityPixelBuffer
{
  return self->_fixedPointDisparityPixelBuffer;
}

- (__CVBuffer)segmentationPixelBuffer
{
  return self->_segmentationPixelBuffer;
}

- (__CVBuffer)sourceColorPixelBuffer
{
  return self->_sourceColorPixelBuffer;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_sourceColorPixelBuffer);
  CVPixelBufferRelease(self->_fixedPointDisparityPixelBuffer);
  CVPixelBufferRelease(self->_destinationDisparityPixelBuffer);
  CVPixelBufferRelease(self->_segmentationPixelBuffer);
  CVPixelBufferRelease(self->_networkDisparityPixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)CVADisparityPostprocessingRequest;
  [(CVADisparityPostprocessingRequest *)&v3 dealloc];
}

- (uint64_t)initWithSourceColorPixelBuffer:(float)a3 segmentationPixelBuffer:(float)a4 focusTileData:(double)a5 focusTileXOffset:(double)a6 focusTileYOffset:(double)a7 focusTileWidth:(double)a8 focusTileHeight:(uint64_t)a9 focusMapWidth:(__CVBuffer *)a10 focusMapHeight:(__CVBuffer *)a11 totalSensorCropXOffset:(void *)a12 totalSensorCropYOffset:(__int16)a13 totalSensorCropWidth:(__int16)a14 totalSensorCropHeight:(__int16)a15 phaseToBlurFactor:(__int16)a16 destinationDisparityPixelBuffer:(__int16)a17 focusRegion:(__int16)a18 focusRegionType:(__int16)a19 currentFocusPosition:(__int16)a20 lockFocalPlane:(__int16)a21 focusDistanceToMaxAllowedFocusDistanceRatio:(__int16)a22 sourceColorPixelBufferOrientation:(__CVBuffer *)texture sourceColorPixelBufferGravity:(void *)a24 sourceColorPixelBufferGlobalMotion:(int)a25 facesArray:(char)a26
{
  id v51 = a12;
  id v53 = a24;
  id v54 = a33;
  *(void *)(a1 + 56) = a10;
  CVPixelBufferRetain(a10);
  *(void *)(a1 + 64) = a11;
  CVPixelBufferRetain(a11);
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = texture;
  CVPixelBufferRetain(texture);
  v38 = *(void **)(a1 + 120);
  *(void *)(a1 + 120) = v51;
  id v52 = v51;

  *(_WORD *)(a1 + 10) = a13;
  *(_WORD *)(a1 + 12) = a14;
  *(_WORD *)(a1 + 14) = a15;
  *(_WORD *)(a1 + 16) = a16;
  *(_WORD *)(a1 + 18) = a17;
  *(_WORD *)(a1 + 20) = a18;
  *(_WORD *)(a1 + 22) = a19;
  *(_WORD *)(a1 + 24) = a20;
  *(_WORD *)(a1 + 26) = a21;
  *(_WORD *)(a1 + 28) = a22;
  *(float *)(a1 + 52) = a2;
  v39 = *(void **)(a1 + 96);
  *(void *)(a1 + 96) = v53;
  id v40 = v53;

  *(_DWORD *)(a1 + 32) = a25;
  *(unsigned char *)(a1 + 8) = a26;
  *(float *)(a1 + 36) = a3;
  *(float *)(a1 + 40) = a4;
  *(double *)(a1 + 176) = a5;
  *(double *)(a1 + 184) = a6;
  *(double *)(a1 + 192) = a7;
  *(double *)(a1 + 200) = a8;
  *(void *)(a1 + 128) = a27;
  *(void *)(a1 + 136) = a28;
  *(void *)(a1 + 144) = a29;
  *(void *)(a1 + 152) = a30;
  *(void *)(a1 + 160) = a31;
  *(void *)(a1 + 168) = a32;
  v41 = *(void **)(a1 + 104);
  *(void *)(a1 + 104) = v54;

  return a1;
}

- (void)initWithSourceColorPixelBuffer:(double)a3 segmentationPixelBuffer:(double)a4 networkDisparityPixelBuffer:(double)a5 destinationDisparityPixelBuffer:(double)a6 focusRegion:(double)a7 focusRegionType:(double)a8 currentFocusPosition:(double)a9 lockFocalPlane:(uint64_t)a10 sourceColorPixelBufferOrientation:(__CVBuffer *)a11 sourceColorPixelBufferGravity:(__CVBuffer *)a12 sourceColorPixelBufferGlobalMotion:(__CVBuffer *)a13 facesArray:(__CVBuffer *)a14 disparityNormalizationMultiplier:(void *)a15 disparityNormalizationOffset:(int)a16
{
  id v32 = a15;
  id v33 = a21;
  v44.receiver = a1;
  v44.super_class = (Class)CVADisparityPostprocessingRequest;
  v34 = objc_msgSendSuper2(&v44, sel_init);
  v34[7] = a11;
  CVPixelBufferRetain(a11);
  v34[8] = a12;
  v34[9] = 0;
  CVPixelBufferRetain(a12);
  v34[11] = a13;
  CVPixelBufferRetain(a13);
  v34[10] = a14;
  CVPixelBufferRetain(a14);
  v35 = (void *)v34[12];
  v34[12] = v32;
  id v36 = v32;

  *((_DWORD *)v34 + 8) = a16;
  *((float *)v34 + 9) = a2;
  *((unsigned char *)v34 + 8) = a17;
  *((double *)v34 + 22) = a3;
  *((double *)v34 + 23) = a4;
  *((double *)v34 + 24) = a5;
  *((double *)v34 + 25) = a6;
  *((double *)v34 + 16) = a7;
  *((double *)v34 + 17) = a8;
  *((double *)v34 + 18) = a9;
  v34[19] = a18;
  v34[20] = a19;
  v34[21] = a20;
  v37 = (void *)v34[13];
  v34[13] = v33;

  *((_DWORD *)v34 + 11) = a22;
  *((_DWORD *)v34 + 12) = a23;
  return v34;
}

- (void)initWithSourceColorPixelBuffer:(double)a3 fixedPointDisparityPixelBuffer:(double)a4 destinationDisparityPixelBuffer:(double)a5 focusRegion:(double)a6 focusRegionType:(double)a7 currentFocusPosition:(double)a8 lockFocalPlane:(double)a9 sourceColorPixelBufferOrientation:(uint64_t)a10 sourceColorPixelBufferGravity:(__CVBuffer *)a11 sourceColorPixelBufferGlobalMotion:(__CVBuffer *)a12 facesArray:(__CVBuffer *)a13 disparityNormalizationMultiplier:(void *)a14 disparityNormalizationOffset:(int)a15
{
  id v31 = a14;
  id v32 = a20;
  v43.receiver = a1;
  v43.super_class = (Class)CVADisparityPostprocessingRequest;
  id v33 = objc_msgSendSuper2(&v43, sel_init);
  v33[7] = a11;
  CVPixelBufferRetain(a11);
  v33[8] = 0;
  v33[9] = a12;
  CVPixelBufferRetain(a12);
  v33[10] = a13;
  CVPixelBufferRetain(a13);
  v34 = (void *)v33[12];
  v33[12] = v31;
  id v35 = v31;

  *((_DWORD *)v33 + 8) = a15;
  *((float *)v33 + 9) = a2;
  *((unsigned char *)v33 + 8) = a16;
  *((double *)v33 + 22) = a3;
  *((double *)v33 + 23) = a4;
  *((double *)v33 + 24) = a5;
  *((double *)v33 + 25) = a6;
  *((double *)v33 + 16) = a7;
  *((double *)v33 + 17) = a8;
  *((double *)v33 + 18) = a9;
  v33[19] = a17;
  v33[20] = a18;
  v33[21] = a19;
  id v36 = (void *)v33[13];
  v33[13] = v32;

  *((_DWORD *)v33 + 11) = a21;
  *((_DWORD *)v33 + 12) = a22;
  return v33;
}

@end