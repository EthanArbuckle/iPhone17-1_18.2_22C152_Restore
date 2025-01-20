@interface ARImageData
+ (BOOL)supportsSecureCoding;
+ (id)captureDateFromPresentationTimestamp:(id *)a3 session:(id)a4;
- (ADCameraCalibration)adCameraCalibration;
- (ARFaceData)faceData;
- (ARImageData)init;
- (ARImageData)initWithCoder:(id)a3;
- (ARImageData)initWithDictionary:(id)a3;
- (ARImageData)initWithImageData:(id)a3;
- (ARImageData)initWithSampleBuffer:(opaqueCMSampleBuffer *)a3 captureFramePerSecond:(int64_t)a4 captureDevice:(id)a5 captureSession:(id)a6;
- (ARImageData)latestUltraWideImage;
- (ARPointCloud)pointCloud;
- (AVCameraCalibrationData)calibrationData;
- (AVCaptureDevice)captureDevice;
- (AVDepthData)depthData;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHighResolution;
- (BOOL)isMirrored;
- (BOOL)isSecondary;
- (BOOL)matchesPixelBufferPointerRecursively:(void *)a3;
- (CGSize)imageResolution;
- (NSDate)captureDate;
- (NSDictionary)exifData;
- (NSDictionary)tiffData;
- (NSDictionary)tracingEntry;
- (NSMutableDictionary)extrinsicsMap;
- (NSString)cameraType;
- (NSString)description;
- (__CVBuffer)pixelBuffer;
- (__CVBuffer)visionData;
- (__n128)cameraIntrinsics;
- (__n128)extrinsicMatrix4x4ToDeviceType:(uint64_t)a1;
- (__n128)radialDistortion;
- (__n128)setCameraIntrinsics:(__n128)a3;
- (__n128)setVisionTransform:(__n128)a3;
- (__n128)tangentialDistortion;
- (__n128)visionTransform;
- (double)currentCaptureTimestamp;
- (double)depthDataTimestamp;
- (double)exposureDuration;
- (double)timestamp;
- (double)timestampOfSynchronizedWideImageData;
- (float)ISO;
- (float)exposureTargetOffset;
- (float)signalToNoiseRatio;
- (float)temperature;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugQuickLookObject;
- (id)encodeToDictionary;
- (int64_t)cameraPosition;
- (int64_t)captureFramesPerSecond;
- (int64_t)deviceOrientation;
- (uint64_t)extrinsicMatrixToDeviceType:(void *)a1;
- (uint64_t)initWithPixelBuffer:(__n128)a3 captureFramePerSecond:(__n128)a4 captureDevice:(uint64_t)a5 captureSession:(__CVBuffer *)a6 timestamp:(uint64_t)a7 intrinsics:(void *)a8 exif:(void *)a9 tiff:(CMTime *)a10 captureLens:(void *)a11;
- (uint64_t)initWithPixelBuffer:(void *)a1 captureFramePerSecond:(uint64_t)a2 captureDevice:(uint64_t)a3 captureSession:(uint64_t)a4 timestamp:(uint64_t)a5 intrinsics:(uint64_t)a6 exif:(long long *)a7;
- (unint64_t)captureLens;
- (unint64_t)hash;
- (unint64_t)lensType;
- (void)addExtrinsicMatrix4x4:(double)a3 toDeviceType:(double)a4;
- (void)addExtrinsicMatrix:(void *)a3 toDeviceType:;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAdCameraCalibration:(id)a3;
- (void)setCalibrationData:(id)a3;
- (void)setCameraPosition:(int64_t)a3;
- (void)setCameraType:(id)a3;
- (void)setCaptureDate:(id)a3;
- (void)setCaptureDevice:(id)a3;
- (void)setCaptureFramesPerSecond:(int64_t)a3;
- (void)setCaptureLens:(unint64_t)a3;
- (void)setCurrentCaptureTimestamp:(double)a3;
- (void)setDepthData:(id)a3;
- (void)setDepthDataTimestamp:(double)a3;
- (void)setDeviceOrientation:(int64_t)a3;
- (void)setExifData:(id)a3;
- (void)setExposureDuration:(double)a3;
- (void)setExposureTargetOffset:(float)a3;
- (void)setExtrinsicsMap:(id)a3;
- (void)setFaceData:(id)a3;
- (void)setHighResolution:(BOOL)a3;
- (void)setISO:(float)a3;
- (void)setImageResolution:(CGSize)a3;
- (void)setLatestUltraWideImage:(id)a3;
- (void)setLensType:(unint64_t)a3;
- (void)setMirrored:(BOOL)a3;
- (void)setPixelBuffer:(__CVBuffer *)a3;
- (void)setPointCloud:(id)a3;
- (void)setRadialDistortion:(ARImageData *)self;
- (void)setSecondary:(BOOL)a3;
- (void)setSignalToNoiseRatio:(float)a3;
- (void)setTangentialDistortion:(ARImageData *)self;
- (void)setTemperature:(float)a3;
- (void)setTimestamp:(double)a3;
- (void)setTimestampOfSynchronizedWideImageData:(double)a3;
- (void)setVisionData:(__CVBuffer *)a3;
@end

@implementation ARImageData

- (ARImageData)init
{
  v9.receiver = self;
  v9.super_class = (Class)ARImageData;
  v2 = [(ARImageData *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    extrinsicsMap = v2->_extrinsicsMap;
    v2->_extrinsicsMap = (NSMutableDictionary *)v3;

    uint64_t v5 = MEMORY[0x1E4F149A0];
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 16);
    *(_OWORD *)&v2[1].super.isa = *MEMORY[0x1E4F149A0];
    *(_OWORD *)&v2[1]._temperature = v6;
    long long v7 = *(_OWORD *)(v5 + 48);
    *(_OWORD *)&v2[1]._timestamp = *(_OWORD *)(v5 + 32);
    *(_OWORD *)&v2[1]._currentCaptureTimestamp = v7;
  }
  return v2;
}

- (ARImageData)initWithImageData:(id)a3
{
  v4 = (id *)a3;
  uint64_t v5 = [(ARImageData *)self init];
  long long v6 = v5;
  if (v5)
  {
    anon_120 = v5->_anon_120;
    -[ARImageData setPixelBuffer:](v5, "setPixelBuffer:", [v4 pixelBuffer]);
    -[ARImageData setVisionData:](v6, "setVisionData:", [v4 visionData]);
    [v4 timestamp];
    v6->_timestamp = v8;
    [v4 currentCaptureTimestamp];
    v6->_currentCaptureTimestamp = v9;
    uint64_t v10 = [v4 captureDate];
    captureDate = v6->_captureDate;
    v6->_captureDate = (NSDate *)v10;

    [v4 cameraIntrinsics];
    *(_DWORD *)&v6->_anon_120[8] = v12;
    *(_DWORD *)&v6->_anon_120[24] = v13;
    *(void *)anon_120 = v14;
    *(void *)&v6->_anon_120[16] = v15;
    *(_DWORD *)&v6->_anon_120[40] = v16;
    *(void *)&v6->_anon_120[32] = v17;
    v6->_mirrored = [v4 isMirrored];
    v6->_lensType = [v4 lensType];
    if (v4)
    {
      [v4 radialDistortion];
      long long v18 = v48;
      long long v19 = v49;
    }
    else
    {
      long long v18 = 0uLL;
      long long v19 = 0uLL;
    }
    *(_OWORD *)v6->_radialDistortion = v18;
    *(_OWORD *)&v6->_radialDistortion[16] = v19;
    [v4 tangentialDistortion];
    *(_OWORD *)v6->_tangentialDistortion = v20;
    [v4 exposureDuration];
    v6->_exposureDuration = v21;
    [v4 exposureTargetOffset];
    v6->_exposureTargetOffset = v22;
    [v4 temperature];
    v6->_temperature = v23;
    [v4 signalToNoiseRatio];
    v6->_signalToNoiseRatio = v24;
    [v4 ISO];
    v6->_ISO = v25;
    uint64_t v26 = [v4 faceData];
    faceData = v6->_faceData;
    v6->_faceData = (ARFaceData *)v26;

    uint64_t v28 = [v4 depthData];
    depthData = v6->_depthData;
    v6->_depthData = (AVDepthData *)v28;

    [v4 depthDataTimestamp];
    v6->_depthDataTimestamp = v30;
    v6->_cameraPosition = [v4 cameraPosition];
    v31 = [v4 cameraType];
    uint64_t v32 = [v31 copy];
    cameraType = v6->_cameraType;
    v6->_cameraType = (NSString *)v32;

    v6->_captureFramesPerSecond = [v4 captureFramesPerSecond];
    v6->_deviceOrientation = [v4 deviceOrientation];
    v6->_secondary = [v4 isSecondary];
    objc_storeStrong((id *)&v6->_exifData, v4[10]);
    objc_storeStrong((id *)&v6->_tiffData, v4[25]);
    v6->_captureLens = (unint64_t)v4[27];
    v6->_highResolution = [v4 isHighResolution];
    uint64_t v34 = [v4 latestUltraWideImage];
    latestUltraWideImage = v6->_latestUltraWideImage;
    v6->_latestUltraWideImage = (ARImageData *)v34;

    [v4 visionTransform];
    *(_OWORD *)&v6[1].super.isa = v36;
    *(_OWORD *)&v6[1]._temperature = v37;
    *(_OWORD *)&v6[1]._timestamp = v38;
    *(_OWORD *)&v6[1]._currentCaptureTimestamp = v39;
    [v4 timestampOfSynchronizedWideImageData];
    v6->_timestampOfSynchronizedWideImageData = v40;
    uint64_t v41 = [v4 pointCloud];
    pointCloud = v6->_pointCloud;
    v6->_pointCloud = (ARPointCloud *)v41;

    uint64_t v43 = [v4 calibrationData];
    calibrationData = v6->_calibrationData;
    v6->_calibrationData = (AVCameraCalibrationData *)v43;

    uint64_t v45 = [v4 adCameraCalibration];
    adCameraCalibration = v6->_adCameraCalibration;
    v6->_adCameraCalibration = (ADCameraCalibration *)v45;

    objc_storeStrong((id *)&v6->_extrinsicsMap, v4[24]);
    kdebug_trace();
  }

  return v6;
}

- (ARImageData)initWithSampleBuffer:(opaqueCMSampleBuffer *)a3 captureFramePerSecond:(int64_t)a4 captureDevice:(id)a5 captureSession:(id)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  if (a3 && (CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3)) != 0)
  {
    CVImageBufferRef v13 = ImageBuffer;
    uint64_t v14 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F1F218], 0);
    memset(&v47, 0, sizeof(v47));
    CMSampleBufferGetPresentationTimeStamp(&v47, a3);
    uint64_t v15 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F2F800], 0);
    uint64_t v16 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F2FD40], 0);
    uint64_t v17 = (void *)v16;
    if (v14)
    {
      double v18 = ARMatrix3x3FromNSData(v14);
      double v44 = v19;
      double v45 = v18;
      double v43 = v20;
    }
    else
    {
      uint64_t v41 = (void *)v16;
      v42 = v15;
      float v22 = [v10 activeFormat];
      int64_t v23 = a4;
      uint64_t v24 = initWithSampleBuffer_captureFramePerSecond_captureDevice_captureSession__format;

      BOOL v25 = v22 == (void *)v24;
      a4 = v23;
      if (!v25)
      {
        uint64_t v26 = [v10 activeFormat];
        v27 = (void *)initWithSampleBuffer_captureFramePerSecond_captureDevice_captureSession__format;
        initWithSampleBuffer_captureFramePerSecond_captureDevice_captureSession__format = v26;

        *(float *)&uint64_t v28 = ARIntrinsicsFromDeviceFormat((void *)initWithSampleBuffer_captureFramePerSecond_captureDevice_captureSession__format);
        DWORD2(initWithSampleBuffer_captureFramePerSecond_captureDevice_captureSession__fallbackIntrinsics) = v29;
        DWORD2(xmmword_1E9EED200) = v30;
        *(void *)&initWithSampleBuffer_captureFramePerSecond_captureDevice_captureSession__fallbackIntrinsics = v28;
        *(void *)&xmmword_1E9EED200 = v31;
        DWORD2(xmmword_1E9EED210) = v32;
        *(void *)&xmmword_1E9EED210 = v33;
        uint64_t v34 = _ARLogGeneral_3();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          v35 = (objc_class *)objc_opt_class();
          v46 = NSStringFromClass(v35);
          uint64_t v36 = ARMatrix3x3Description((__n128)initWithSampleBuffer_captureFramePerSecond_captureDevice_captureSession__fallbackIntrinsics, (__n128)xmmword_1E9EED200, (__n128)xmmword_1E9EED210);
          LODWORD(buf.value) = 138543874;
          *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v46;
          LOWORD(buf.flags) = 2048;
          *(void *)((char *)&buf.flags + 2) = self;
          HIWORD(buf.epoch) = 2112;
          uint64_t v49 = v36;
          long long v37 = (void *)v36;
          _os_log_impl(&dword_1B88A2000, v34, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Using fallback intrinsics %@", (uint8_t *)&buf, 0x20u);
        }
      }
      double v44 = *(double *)&xmmword_1E9EED200;
      double v45 = *(double *)&initWithSampleBuffer_captureFramePerSecond_captureDevice_captureSession__fallbackIntrinsics;
      double v43 = *(double *)&xmmword_1E9EED210;
      uint64_t v17 = v41;
      uint64_t v15 = v42;
    }
    long long v38 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F2FC20], 0);
    uint64_t v39 = ARCaptureLensFromMakerNotesDictionary(v38);
    CMTime buf = v47;
    self = -[ARImageData initWithPixelBuffer:captureFramePerSecond:captureDevice:captureSession:timestamp:intrinsics:exif:tiff:captureLens:](self, "initWithPixelBuffer:captureFramePerSecond:captureDevice:captureSession:timestamp:intrinsics:exif:tiff:captureLens:", v13, a4, v10, v11, &buf, v15, v45, v44, v43, v17, v39);

    double v21 = self;
  }
  else
  {
    double v21 = 0;
  }

  return v21;
}

- (uint64_t)initWithPixelBuffer:(void *)a1 captureFramePerSecond:(uint64_t)a2 captureDevice:(uint64_t)a3 captureSession:(uint64_t)a4 timestamp:(uint64_t)a5 intrinsics:(uint64_t)a6 exif:(long long *)a7
{
  long long v8 = *a7;
  uint64_t v9 = *((void *)a7 + 2);
  return objc_msgSend(a1, "initWithPixelBuffer:captureFramePerSecond:captureDevice:captureSession:timestamp:intrinsics:exif:tiff:captureLens:", a3, a4, a5, a6, &v8, 0, 0);
}

- (uint64_t)initWithPixelBuffer:(__n128)a3 captureFramePerSecond:(__n128)a4 captureDevice:(uint64_t)a5 captureSession:(__CVBuffer *)a6 timestamp:(uint64_t)a7 intrinsics:(void *)a8 exif:(void *)a9 tiff:(CMTime *)a10 captureLens:(void *)a11
{
  id v20 = a8;
  id v21 = a9;
  id v22 = a11;
  id v23 = a12;
  uint64_t v24 = [a1 init];
  if (v24)
  {
    CMTime time = *a10;
    Float64 Seconds = CMTimeGetSeconds(&time);
    *(Float64 *)(v24 + 32) = Seconds;
    *(Float64 *)(v24 + 48) = Seconds;
    objc_storeStrong((id *)(v24 + 208), a8);
    if (v21)
    {
      uint64_t v26 = objc_opt_class();
      CMTime time = *a10;
      [v26 captureDateFromPresentationTimestamp:&time session:v21];
    }
    else
    {
      [MEMORY[0x1E4F1C9C8] now];
    uint64_t v27 = };
    uint64_t v28 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v27;

    *(void *)(v24 + 56) = CVPixelBufferRetain(a6);
    *(unsigned char *)(v24 + 9) = 0;
    [v20 deviceWhiteBalanceGains];
    objc_msgSend(v20, "temperatureAndTintValuesForDeviceWhiteBalanceGains:");
    *(_DWORD *)(v24 + 16) = v29;
    [v20 exposureTargetOffset];
    *(_DWORD *)(v24 + 12) = v30;
    *(void *)(v24 + 136) = [v20 position];
    uint64_t v31 = [v20 deviceType];
    int v32 = *(void **)(v24 + 144);
    *(void *)(v24 + 144) = v31;

    *(void *)(v24 + 168) = a7;
    *(_DWORD *)(v24 + 20) = 2139095040;
    CFDictionaryRef v33 = CVBufferCopyAttachments(a6, kCVAttachmentMode_ShouldPropagate);
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v55 = __129__ARImageData_initWithPixelBuffer_captureFramePerSecond_captureDevice_captureSession_timestamp_intrinsics_exif_tiff_captureLens___block_invoke;
    v56 = &__block_descriptor_40_e5_v8__0l;
    CFDictionaryRef v57 = v33;
    if (v33)
    {
      CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v33, (const void *)*MEMORY[0x1E4F51480]);
      if (Value)
      {
        v35 = CFDictionaryGetValue(Value, (const void *)*MEMORY[0x1E4F52408]);
        uint64_t v36 = v35;
        if (v35)
        {
          [v35 floatValue];
          *(_DWORD *)(v24 + 20) = v37;
        }
      }
    }
    long long v38 = objc_msgSend(v22, "valueForKey:", @"ExposureTime", *(_OWORD *)&a2, *(_OWORD *)&a3, *(_OWORD *)&a4);
    uint64_t v39 = v38;
    if (v38)
    {
      [v38 doubleValue];
      *(void *)(v24 + 72) = v40;
    }
    [v20 ISO];
    *(_DWORD *)(v24 + 24) = v41;
    *(_OWORD *)(v24 + 288) = v49;
    *(_OWORD *)(v24 + 304) = v51;
    *(_OWORD *)(v24 + 320) = v53;
    uint64_t v42 = [v22 copy];
    double v43 = *(void **)(v24 + 80);
    *(void *)(v24 + 80) = v42;

    uint64_t v44 = [v23 copy];
    double v45 = *(void **)(v24 + 200);
    *(void *)(v24 + 200) = v44;

    *(void *)(v24 + 216) = a13;
    v46 = +[ARBKSAccelerometer sharedWeakAccelerometerHandle];
    *(void *)(v24 + 88) = [v46 currentOrientation];
    kdebug_trace();

    v55((uint64_t)v54);
  }

  return v24;
}

void __129__ARImageData_initWithPixelBuffer_captureFramePerSecond_captureDevice_captureSession_timestamp_intrinsics_exif_tiff_captureLens___block_invoke(uint64_t a1)
{
  v1 = *(const void **)(a1 + 32);
  if (v1) {
    CFRelease(v1);
  }
}

- (void)dealloc
{
  kdebug_trace();
  CVPixelBufferRelease(self->_pixelBuffer);
  CVPixelBufferRelease(self->_visionData);
  v3.receiver = self;
  v3.super_class = (Class)ARImageData;
  [(ARImageData *)&v3 dealloc];
}

- (void)setPixelBuffer:(__CVBuffer *)a3
{
  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer != a3)
  {
    CVPixelBufferRelease(pixelBuffer);
    self->_pixelBuffer = CVPixelBufferRetain(a3);
  }
}

- (void)setVisionData:(__CVBuffer *)a3
{
  visionData = self->_visionData;
  if (visionData != a3)
  {
    CVPixelBufferRelease(visionData);
    self->_visionData = a3;
    CVPixelBufferRetain(a3);
  }
}

- (NSMutableDictionary)extrinsicsMap
{
  v2 = (void *)[(NSMutableDictionary *)self->_extrinsicsMap copy];
  return (NSMutableDictionary *)v2;
}

- (CGSize)imageResolution
{
  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer)
  {
    double Width = (double)CVPixelBufferGetWidth(self->_pixelBuffer);
    double Height = (double)CVPixelBufferGetHeight(pixelBuffer);
  }
  else
  {
    double Width = *MEMORY[0x1E4F1DB30];
    double Height = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v5 = Width;
  result.height = Height;
  result.width = v5;
  return result;
}

- (BOOL)matchesPixelBufferPointerRecursively:(void *)a3
{
  if ([(ARImageData *)self pixelBuffer] == a3) {
    return 1;
  }
  double v5 = [(ARImageData *)self originalImage];

  if (v5 == self) {
    return 0;
  }
  long long v6 = [(ARImageData *)self originalImage];
  char v7 = [v6 matchesPixelBufferPointerRecursively:a3];

  return v7;
}

- (void)setDeviceOrientation:(int64_t)a3
{
  self->_deviceOrientation = a3;
}

- (unint64_t)hash
{
  return (unint64_t)(self->_timestamp * 1000.0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    double v5 = (double *)v4;
    long long v6 = v5;
    if (vabdd_f64(self->_timestamp, v5[4]) >= 2.22044605e-16) {
      goto LABEL_33;
    }
    if (vabdd_f64(self->_currentCaptureTimestamp, v5[6]) >= 2.22044605e-16) {
      goto LABEL_33;
    }
    captureDate = self->_captureDate;
    if (captureDate != *((NSDate **)v6 + 5) && !-[NSDate isEqual:](captureDate, "isEqual:")) {
      goto LABEL_33;
    }
    v8.i64[0] = 0x3400000034000000;
    v8.i64[1] = 0x3400000034000000;
    uint32x4_t v9 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vcgeq_f32(v8, vabdq_f32(*(float32x4_t *)&self->_anon_120[16], *(float32x4_t *)(v6 + 38))), (int8x16_t)vcgeq_f32(v8, vabdq_f32(*(float32x4_t *)self->_anon_120, *(float32x4_t *)(v6 + 36)))), (int8x16_t)vcgeq_f32(v8, vabdq_f32(*(float32x4_t *)&self->_anon_120[32], *(float32x4_t *)(v6 + 40))));
    v9.i32[3] = v9.i32[2];
    if ((vminvq_u32(v9) & 0x80000000) == 0) {
      goto LABEL_33;
    }
    if (self->_pixelBuffer != (__CVBuffer *)*((void *)v6 + 7)) {
      goto LABEL_33;
    }
    if (self->_mirrored != *((unsigned __int8 *)v6 + 8)) {
      goto LABEL_33;
    }
    if (self->_lensType != *((void *)v6 + 8)) {
      goto LABEL_33;
    }
    int64x2_t v10 = (int64x2_t)vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)self->_radialDistortion, *(float64x2_t *)(v6 + 32)), (int8x16_t)vceqq_f64(*(float64x2_t *)&self->_radialDistortion[16], *(float64x2_t *)(v6 + 34)));
    if ((vandq_s8((int8x16_t)v10, (int8x16_t)vdupq_laneq_s64(v10, 1)).u64[0] & 0x8000000000000000) == 0) {
      goto LABEL_33;
    }
    int64x2_t v11 = vceqq_f64(*(float64x2_t *)self->_tangentialDistortion, *(float64x2_t *)(v6 + 30));
    if ((vandq_s8((int8x16_t)vdupq_laneq_s64(v11, 1), (int8x16_t)v11).u64[0] & 0x8000000000000000) == 0) {
      goto LABEL_33;
    }
    if (vabdd_f64(self->_exposureDuration, v6[9]) >= 2.22044605e-16) {
      goto LABEL_33;
    }
    if (vabds_f32(self->_exposureTargetOffset, *((float *)v6 + 3)) >= 0.00000011921) {
      goto LABEL_33;
    }
    if (vabds_f32(self->_temperature, *((float *)v6 + 4)) >= 0.00000011921) {
      goto LABEL_33;
    }
    if (vabds_f32(self->_signalToNoiseRatio, *((float *)v6 + 5)) >= 0.00000011921) {
      goto LABEL_33;
    }
    if (vabds_f32(self->_ISO, *((float *)v6 + 6)) >= 0.00000011921) {
      goto LABEL_33;
    }
    faceData = self->_faceData;
    if (faceData != *((ARFaceData **)v6 + 12) && !-[ARFaceData isEqual:](faceData, "isEqual:")) {
      goto LABEL_33;
    }
    if (((depthData = self->_depthData, depthData == *((AVDepthData **)v6 + 13))
       || -[AVDepthData isEqual:](depthData, "isEqual:"))
      && vabdd_f64(self->_depthDataTimestamp, v6[15]) < 2.22044605e-16
      && self->_visionData == (__CVBuffer *)*((void *)v6 + 16)
      && self->_cameraPosition == *((void *)v6 + 17)
      && ((cameraType = self->_cameraType, cameraType == *((NSString **)v6 + 18))
       || -[NSString isEqualToString:](cameraType, "isEqualToString:"))
      && self->_captureFramesPerSecond == *((void *)v6 + 21)
      && self->_deviceOrientation == *((void *)v6 + 11)
      && self->_secondary == *((unsigned __int8 *)v6 + 9)
      && self->_highResolution == *((unsigned __int8 *)v6 + 10)
      && ((latestUltraWideImage = self->_latestUltraWideImage, latestUltraWideImage == *((ARImageData **)v6 + 22))
       || -[ARImageData isEqual:](latestUltraWideImage, "isEqual:"))
      && (v16.i64[0] = 0x3400000034000000,
          v16.i64[1] = 0x3400000034000000,
          (vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vcgeq_f32(v16, vabdq_f32(*(float32x4_t *)&self[1]._temperature, *(float32x4_t *)(v6 + 44))), (int8x16_t)vcgeq_f32(v16, vabdq_f32(*(float32x4_t *)&self[1].super.isa, *(float32x4_t *)(v6 + 42)))), vandq_s8((int8x16_t)vcgeq_f32(v16, vabdq_f32(*(float32x4_t *)&self[1]._timestamp, *(float32x4_t *)(v6 + 46))), (int8x16_t)vcgeq_f32(v16,
                                                   vabdq_f32(*(float32x4_t *)&self[1]._currentCaptureTimestamp, *(float32x4_t *)(v6 + 48)))))) & 0x80000000) != 0)&& self->_timestampOfSynchronizedWideImageData == v6[23]&& -[NSMutableDictionary isEqualToDictionary:](self->_extrinsicsMap, "isEqualToDictionary:", *((void *)v6 + 24))&& -[NSDictionary isEqualToDictionary:](self->_exifData, "isEqualToDictionary:", *((void *)v6 + 10))&& ((pointCloud = self->_pointCloud, pointCloud == *((ARPointCloud **)v6 + 14))|| -[ARPointCloud isEqual:](pointCloud, "isEqual:")))
    {
      BOOL v17 = self->_captureLens == *((void *)v6 + 27);
    }
    else
    {
LABEL_33:
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<ARImageData: %p timestamp=%f device=%@>", self, *(void *)&self->_timestamp, self->_cameraType];
}

- (id)debugQuickLookObject
{
  return (id)[MEMORY[0x1E4F1E050] imageWithCVImageBuffer:self->_pixelBuffer];
}

+ (id)captureDateFromPresentationTimestamp:(id *)a3 session:(id)a4
{
  memset(&v10, 0, sizeof(v10));
  CMClockGetTime(&v10, (CMClockRef)[a4 synchronizationClock]);
  memset(&v9, 0, sizeof(v9));
  CMTime lhs = v10;
  CMTime v7 = *(CMTime *)a3;
  CMTimeSubtract(&v9, &lhs, &v7);
  CMTime lhs = v9;
  double v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-CMTimeGetSeconds(&lhs)];
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARImageData)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [(ARImageData *)self init];
  if (!v5) {
    goto LABEL_33;
  }
  [v4 decodeDoubleForKey:@"timestamp"];
  double v7 = v6;
  double v8 = 0.0;
  if (v7 >= 0.0) {
    objc_msgSend(v4, "decodeDoubleForKey:", @"timestamp", 0.0);
  }
  [(ARImageData *)v5 setTimestamp:v8];
  [(ARImageData *)v5 timestamp];
  -[ARImageData setCurrentCaptureTimestamp:](v5, "setCurrentCaptureTimestamp:");
  [v4 decodeDoubleForKey:@"exposureDuration"];
  -[ARImageData setExposureDuration:](v5, "setExposureDuration:");
  [v4 decodeFloatForKey:@"exposureTargetOffset"];
  -[ARImageData setExposureTargetOffset:](v5, "setExposureTargetOffset:");
  [v4 decodeFloatForKey:@"signalToNoiseRatio"];
  -[ARImageData setSignalToNoiseRatio:](v5, "setSignalToNoiseRatio:");
  [v4 decodeFloatForKey:@"ISO"];
  -[ARImageData setISO:](v5, "setISO:");
  CMTime v9 = self;
  CMTime v10 = [v4 decodeObjectOfClass:v9 forKey:@"cameraParameters"];

  if (v10)
  {
    [v10 focalLength];
    *(float *)&double v11 = v11;
    *(void *)&double v58 = LODWORD(v11);
    [v10 focalLength];
    float v13 = v12;
    LODWORD(v12) = 0;
    *((float *)&v12 + 1) = v13;
    double v57 = v12;
    [v10 principalPoint];
    *(float *)&double v14 = v14;
    unsigned int v56 = LODWORD(v14);
    [v10 principalPoint];
    *(float *)&unsigned int v16 = v15;
    double v17 = COERCE_DOUBLE(__PAIR64__(v16, v56));
    double v18 = v5;
    double v20 = v57;
    double v19 = v58;
  }
  else
  {
    if (![v4 containsValueForKey:@"cameraIntrinsics"])
    {
      id v21 = [v4 decodeDataObject];
      [(ARImageData *)v5 setCameraIntrinsics:ARMatrix3x3FromNSData(v21)];

      goto LABEL_10;
    }
    objc_msgSend(v4, "ar_decodeMatrix3x3ForKey:", @"cameraIntrinsics");
    double v18 = v5;
  }
  -[ARImageData setCameraIntrinsics:](v18, "setCameraIntrinsics:", v19, v20, v17);
LABEL_10:
  -[ARImageData setCameraPosition:](v5, "setCameraPosition:", [v4 decodeIntegerForKey:@"cameraPosition"]);
  id v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cameraType"];
  [(ARImageData *)v5 setCameraType:v22];

  -[ARImageData setMirrored:](v5, "setMirrored:", [v4 decodeBoolForKey:@"pixelBufferIsMirrored"]);
  -[ARImageData setLensType:](v5, "setLensType:", [v4 decodeIntegerForKey:@"lensType"]);
  id v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"radialDistortion"];
  uint64_t v24 = v23;
  if (v23)
  {
    long long v60 = 0u;
    long long v61 = 0u;
    [v23 getBytes:&v60 length:32];
    v59[0] = v60;
    v59[1] = v61;
    [(ARImageData *)v5 setRadialDistortion:v59];
  }
  BOOL v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tangentialDistortion"];

  if (v25)
  {
    long long v60 = 0uLL;
    [v25 getBytes:&v60 length:16];
    [(ARImageData *)v5 setTangentialDistortion:*(double *)&v60];
  }
  -[ARImageData setCaptureFramesPerSecond:](v5, "setCaptureFramesPerSecond:", [v4 decodeIntegerForKey:@"targetFramesPerSecond"]);
  uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"captureDate"];
  [(ARImageData *)v5 setCaptureDate:v26];

  [(ARImageData *)v5 setPixelBuffer:0];
  [v4 decodeFloatForKey:@"temperature"];
  if (*(float *)&v27 == 0.0) {
    *(float *)&double v27 = 6500.0;
  }
  [(ARImageData *)v5 setTemperature:v27];
  uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"faceData"];
  [(ARImageData *)v5 setFaceData:v28];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v29 = v4;
    v5->_pixelBuffer = (__CVBuffer *)objc_msgSend(v29, "ar_decodePixelBufferForKey:", @"pixelBuffer");
    uint64_t v30 = objc_msgSend(v29, "ar_decodePixelBufferForKey:", @"visionData");

    v5->_visionData = (__CVBuffer *)v30;
  }
  uint64_t v31 = ARDepthRepresentationDictionaryClassList();
  int v32 = [v4 decodeObjectOfClasses:v31 forKey:@"AVDepthData"];

  if (v32)
  {
    CFDictionaryRef v33 = (void *)[objc_alloc(MEMORY[0x1E4F164F8]) initWithPixelBuffer:0 depthMetadataDictionary:v32];
    [(ARImageData *)v5 setDepthData:v33];

    [v4 decodeDoubleForKey:@"depthDataTimeStamp"];
    double v35 = v34;
    double v36 = 0.0;
    if (v35 >= 0.0) {
      objc_msgSend(v4, "decodeDoubleForKey:", @"depthDataTimeStamp", 0.0);
    }
    [(ARImageData *)v5 setDepthDataTimestamp:v36];
  }
  -[ARImageData setDeviceOrientation:](v5, "setDeviceOrientation:", [v4 decodeIntegerForKey:@"deviceOrientation"]);
  -[ARImageData setSecondary:](v5, "setSecondary:", [v4 decodeBoolForKey:@"secondary"]);
  if ([v4 containsValueForKey:@"visionTransform"])
  {
    objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", @"visionTransform");
  }
  else
  {
    long long v37 = *MEMORY[0x1E4F149A0];
    long long v38 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 16);
    long long v39 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 32);
    long long v40 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 48);
  }
  -[ARImageData setVisionTransform:](v5, "setVisionTransform:", *(double *)&v37, *(double *)&v38, *(double *)&v39, *(double *)&v40);
  v5->_highResolution = [v4 decodeBoolForKey:@"highResolution"];
  [(ARImageData *)v5 setLatestUltraWideImage:0];
  [v4 decodeDoubleForKey:@"timestampOfSynchronizedWideImageData"];
  -[ARImageData setTimestampOfSynchronizedWideImageData:](v5, "setTimestampOfSynchronizedWideImageData:");
  int v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pointCloud"];
  [(ARImageData *)v5 setPointCloud:v41];

  uint64_t v42 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v43 = objc_opt_class();
  uint64_t v44 = objc_opt_class();
  uint64_t v45 = objc_opt_class();
  v46 = objc_msgSend(v42, "setWithObjects:", v43, v44, v45, objc_opt_class(), 0);
  CMTime v47 = [v4 decodeObjectOfClasses:v46 forKey:@"extrinsicsMap"];

  if (v47) {
    objc_storeStrong((id *)&v5->_extrinsicsMap, v47);
  }
  long long v48 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v49 = objc_opt_class();
  uint64_t v50 = objc_opt_class();
  uint64_t v51 = objc_opt_class();
  v52 = objc_msgSend(v48, "setWithObjects:", v49, v50, v51, objc_opt_class(), 0);
  long long v53 = [v4 decodeObjectOfClasses:v52 forKey:@"exifData"];

  if (v53) {
    objc_storeStrong((id *)&v5->_exifData, v53);
  }
  if ([v4 containsValueForKey:@"captureLens"]) {
    uint64_t v54 = [v4 decodeIntegerForKey:@"captureLens"];
  }
  else {
    uint64_t v54 = 0;
  }
  v5->_captureLens = v54;

LABEL_33:
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v15 = a3;
  [v15 encodeDouble:@"timestamp" forKey:self->_timestamp];
  [v15 encodeDouble:@"exposureDuration" forKey:self->_exposureDuration];
  *(float *)&double v4 = self->_exposureTargetOffset;
  [v15 encodeFloat:@"exposureTargetOffset" forKey:v4];
  *(float *)&double v5 = self->_signalToNoiseRatio;
  [v15 encodeFloat:@"signalToNoiseRatio" forKey:v5];
  *(float *)&double v6 = self->_ISO;
  [v15 encodeFloat:@"ISO" forKey:v6];
  *(float *)&double v7 = self->_temperature;
  [v15 encodeFloat:@"temperature" forKey:v7];
  objc_msgSend(v15, "ar_encodeMatrix3x3:forKey:", @"cameraIntrinsics", *(double *)self->_anon_120, *(double *)&self->_anon_120[16], *(double *)&self->_anon_120[32]);
  [v15 encodeInteger:self->_cameraPosition forKey:@"cameraPosition"];
  [v15 encodeObject:self->_cameraType forKey:@"cameraType"];
  [v15 encodeBool:self->_mirrored forKey:@"pixelBufferIsMirrored"];
  [v15 encodeInteger:self->_lensType forKey:@"lensType"];
  double v8 = [MEMORY[0x1E4F1C9B8] dataWithBytes:self->_radialDistortion length:32];
  [v15 encodeObject:v8 forKey:@"radialDistortion"];
  CMTime v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:self->_tangentialDistortion length:16];

  [v15 encodeObject:v9 forKey:@"tangentialDistortion"];
  [v15 encodeInteger:self->_captureFramesPerSecond forKey:@"targetFramesPerSecond"];
  [v15 encodeObject:self->_captureDate forKey:@"captureDate"];
  [v15 encodeObject:self->_faceData forKey:@"faceData"];
  CMTime v10 = [(ARImageData *)self depthData];

  if (v10)
  {
    double v11 = [(ARImageData *)self depthData];
    double v12 = ARDepthRepresentationDictionary(v11);

    if (v12) {
      [v15 encodeObject:v12 forKey:@"AVDepthData"];
    }
    [v15 encodeDouble:@"depthDataTimeStamp" forKey:self->_depthDataTimestamp];
  }
  objc_msgSend(v15, "encodeInteger:forKey:", -[ARImageData deviceOrientation](self, "deviceOrientation"), @"deviceOrientation");
  objc_msgSend(v15, "encodeBool:forKey:", -[ARImageData isSecondary](self, "isSecondary"), @"secondary");
  objc_msgSend(v15, "ar_encodeMatrix4x4:forKey:", @"visionTransform", *(double *)&self[1].super.isa, *(double *)&self[1]._temperature, self[1]._timestamp, self[1]._currentCaptureTimestamp);
  objc_msgSend(v15, "encodeBool:forKey:", -[ARImageData isHighResolution](self, "isHighResolution"), @"highResolution");
  [(ARImageData *)self timestampOfSynchronizedWideImageData];
  objc_msgSend(v15, "encodeDouble:forKey:", @"timestampOfSynchronizedWideImageData");
  [v15 encodeObject:self->_pointCloud forKey:@"pointCloud"];
  [v15 encodeObject:self->_extrinsicsMap forKey:@"extrinsicsMap"];
  [v15 encodeObject:self->_exifData forKey:@"exifData"];
  [v15 encodeInteger:self->_captureLens forKey:@"captureLens"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    pixelBuffer = self->_pixelBuffer;
    id v14 = v15;
    objc_msgSend(v14, "ar_encodePixelBuffer:forKey:", pixelBuffer, @"pixelBuffer");
    objc_msgSend(v14, "ar_encodePixelBuffer:forKey:", self->_visionData, @"visionData");
  }
  else
  {
    id v14 = [MEMORY[0x1E4F1C9B8] dataWithBytes:self->_anon_120 length:48];
    [v15 encodeDataObject:v14];
  }
}

- (ARImageData)initWithDictionary:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(ARImageData *)self init];
  if (v5)
  {
    CFDictionaryRef v6 = [v4 objectForKeyedSubscript:@"CMSampleBufferPresentationTime"];
    if (v6
      || ([v4 objectForKeyedSubscript:@"OriginalTimestampWhenWrittenToFile"],
          (CFDictionaryRef v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        memset(&v21, 0, sizeof(v21));
        CMTimeMakeFromDictionary(&v21, v6);
        CMTime v20 = v21;
        Float64 Seconds = CMTimeGetSeconds(&v20);
        v5->_timestamp = Seconds;
        v5->_currentCaptureTimestamp = Seconds;
      }
    }
    double v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F1F218]];
    if ((v8
       || ([v4 objectForKeyedSubscript:@"IntrinsicsMatrix"],
           (double v8 = objc_claimAutoreleasedReturnValue()) != 0))
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      __n128 v9 = ARMatrix3x3FromColumnMajorFlatArray(v8);
      *(_DWORD *)&v5->_anon_120[8] = v9.n128_u32[2];
      *(_DWORD *)&v5->_anon_120[24] = v10;
      *(void *)v5->_anon_120 = v9.n128_u64[0];
      *(void *)&v5->_anon_120[16] = v11;
      *(_DWORD *)&v5->_anon_120[40] = v12;
      *(void *)&v5->_anon_120[32] = v13;
    }
    else
    {
      id v14 = _ARLogGeneral_3();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        id v15 = (objc_class *)objc_opt_class();
        unsigned int v16 = NSStringFromClass(v15);
        LODWORD(v21.value) = 138543618;
        *(CMTimeValue *)((char *)&v21.value + 4) = (CMTimeValue)v16;
        LOWORD(v21.flags) = 2048;
        *(void *)((char *)&v21.flags + 2) = v5;
        _os_log_impl(&dword_1B88A2000, v14, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Creating imageData without cameraIntrinsics", (uint8_t *)&v21, 0x16u);
      }
    }
    double v17 = [v4 objectForKeyedSubscript:@"ExposureTime"];
    [v17 doubleValue];
    v5->_exposureDuration = v18;

    v5->_deviceOrientation = 0;
    *(_WORD *)&v5->_secondary = 0;
  }
  return v5;
}

- (id)encodeToDictionary
{
  v17[3] = *MEMORY[0x1E4F143B8];
  memset(&v15, 0, sizeof(v15));
  [(ARImageData *)self timestamp];
  CMTimeMakeWithSeconds(&v15, v3, 1000000);
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CMTime v14 = v15;
  CFDictionaryRef v5 = CMTimeCopyAsDictionary(&v14, v4);
  v17[0] = v5;
  v16[0] = @"CMSampleBufferPresentationTime";
  v16[1] = @"IntrinsicsMatrix";
  [(ARImageData *)self cameraIntrinsics];
  __n128 v9 = ARMatrix3x3ToColumnMajorFlatArray(v6, v7, v8);
  v17[1] = v9;
  v16[2] = @"ExposureTime";
  int v10 = NSNumber;
  [(ARImageData *)self exposureDuration];
  uint64_t v11 = objc_msgSend(v10, "numberWithDouble:");
  v17[2] = v11;
  int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CFAllocatorRef v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithImageData:self];
}

- (__n128)extrinsicMatrix4x4ToDeviceType:(uint64_t)a1
{
  v1 = objc_msgSend(*(id *)(a1 + 192), "objectForKeyedSubscript:");
  v2 = v1;
  if (v1)
  {
    [v1 matrix];
    long long v5 = v3;
  }
  else
  {
    long long v5 = *MEMORY[0x1E4F149A0];
  }

  return (__n128)v5;
}

- (uint64_t)extrinsicMatrixToDeviceType:(void *)a1
{
  uint64_t v1 = objc_msgSend(a1, "extrinsicMatrix4x4ToDeviceType:");
  return ARMatrix4x3FromMatrix4x4(v1);
}

- (void)addExtrinsicMatrix:(void *)a3 toDeviceType:
{
  id v4 = a3;
  ARMatrix4x4FromMatrix4x3();
  objc_msgSend(a1, "addExtrinsicMatrix4x4:toDeviceType:", v4);
}

- (void)addExtrinsicMatrix4x4:(double)a3 toDeviceType:(double)a4
{
  id v8 = a7;
  uint64_t v13 = -[ARExtrinsicsWrapper initWithMatrix:]([ARExtrinsicsWrapper alloc], "initWithMatrix:", a2, a3, a4, a5);
  [*(id *)(a1 + 192) setObject:v13 forKeyedSubscript:v8];
}

- (NSDictionary)tracingEntry
{
  v16[2] = *MEMORY[0x1E4F143B8];
  long long v3 = ARQATraceableDefaultEntryForResultData(self);
  id v4 = (void *)[v3 mutableCopy];

  v15[0] = @"width";
  long long v5 = NSNumber;
  [(ARImageData *)self imageResolution];
  __n128 v6 = objc_msgSend(v5, "numberWithDouble:");
  v15[1] = @"height";
  v16[0] = v6;
  __n128 v7 = NSNumber;
  [(ARImageData *)self imageResolution];
  __n128 v9 = [v7 numberWithDouble:v8];
  v16[1] = v9;
  int v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  [v4 setObject:v10 forKeyedSubscript:@"imageResolution"];

  OSType PixelFormatType = CVPixelBufferGetPixelFormatType([(ARImageData *)self pixelBuffer]);
  int v12 = AROSTypeToString(PixelFormatType);
  [v4 setObject:v12 forKeyedSubscript:@"pixelBufferFormat"];

  [(ARImageData *)self cameraIntrinsics];
  uint64_t v13 = +[ARQAHelper arrayWithMatrix3x3:](ARQAHelper, "arrayWithMatrix3x3:");
  [v4 setObject:v13 forKeyedSubscript:@"cameraIntrinsics"];

  return (NSDictionary *)v4;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (NSDate)captureDate
{
  return self->_captureDate;
}

- (void)setCaptureDate:(id)a3
{
}

- (double)currentCaptureTimestamp
{
  return self->_currentCaptureTimestamp;
}

- (void)setCurrentCaptureTimestamp:(double)a3
{
  self->_currentCaptureTimestamp = a3;
}

- (__n128)cameraIntrinsics
{
  return a1[18];
}

- (__n128)setCameraIntrinsics:(__n128)a3
{
  result[18] = a2;
  result[19] = a3;
  result[20] = a4;
  return result;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (BOOL)isMirrored
{
  return self->_mirrored;
}

- (void)setMirrored:(BOOL)a3
{
  self->_mirrored = a3;
}

- (void)setImageResolution:(CGSize)a3
{
  self->_imageResolution = a3;
}

- (unint64_t)lensType
{
  return self->_lensType;
}

- (void)setLensType:(unint64_t)a3
{
  self->_lensType = a3;
}

- (__n128)radialDistortion
{
  __n128 result = *(__n128 *)(a1 + 256);
  long long v3 = *(_OWORD *)(a1 + 272);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (void)setRadialDistortion:(ARImageData *)self
{
  long long v3 = v2[1];
  *(_OWORD *)self->_radialDistortion = *v2;
  *(_OWORD *)&self->_radialDistortion[16] = v3;
}

- (__n128)tangentialDistortion
{
  return a1[15];
}

- (void)setTangentialDistortion:(ARImageData *)self
{
  *(_OWORD *)self->_tangentialDistortion = v2;
}

- (double)exposureDuration
{
  return self->_exposureDuration;
}

- (void)setExposureDuration:(double)a3
{
  self->_exposureDuration = a3;
}

- (float)exposureTargetOffset
{
  return self->_exposureTargetOffset;
}

- (void)setExposureTargetOffset:(float)a3
{
  self->_exposureTargetOffset = a3;
}

- (float)temperature
{
  return self->_temperature;
}

- (void)setTemperature:(float)a3
{
  self->_temperature = a3;
}

- (float)signalToNoiseRatio
{
  return self->_signalToNoiseRatio;
}

- (void)setSignalToNoiseRatio:(float)a3
{
  self->_signalToNoiseRatio = a3;
}

- (float)ISO
{
  return self->_ISO;
}

- (void)setISO:(float)a3
{
  self->_ISO = a3;
}

- (NSDictionary)exifData
{
  return self->_exifData;
}

- (void)setExifData:(id)a3
{
}

- (int64_t)deviceOrientation
{
  return self->_deviceOrientation;
}

- (ARFaceData)faceData
{
  return self->_faceData;
}

- (void)setFaceData:(id)a3
{
}

- (AVDepthData)depthData
{
  return self->_depthData;
}

- (void)setDepthData:(id)a3
{
}

- (ARPointCloud)pointCloud
{
  return self->_pointCloud;
}

- (void)setPointCloud:(id)a3
{
}

- (double)depthDataTimestamp
{
  return self->_depthDataTimestamp;
}

- (void)setDepthDataTimestamp:(double)a3
{
  self->_depthDataTimestamp = a3;
}

- (__CVBuffer)visionData
{
  return self->_visionData;
}

- (int64_t)cameraPosition
{
  return self->_cameraPosition;
}

- (void)setCameraPosition:(int64_t)a3
{
  self->_cameraPosition = a3;
}

- (NSString)cameraType
{
  return self->_cameraType;
}

- (void)setCameraType:(id)a3
{
}

- (AVCameraCalibrationData)calibrationData
{
  return self->_calibrationData;
}

- (void)setCalibrationData:(id)a3
{
}

- (ADCameraCalibration)adCameraCalibration
{
  return self->_adCameraCalibration;
}

- (void)setAdCameraCalibration:(id)a3
{
}

- (int64_t)captureFramesPerSecond
{
  return self->_captureFramesPerSecond;
}

- (void)setCaptureFramesPerSecond:(int64_t)a3
{
  self->_captureFramesPerSecond = a3;
}

- (BOOL)isSecondary
{
  return self->_secondary;
}

- (void)setSecondary:(BOOL)a3
{
  self->_secondary = a3;
}

- (BOOL)isHighResolution
{
  return self->_highResolution;
}

- (void)setHighResolution:(BOOL)a3
{
  self->_highResolution = a3;
}

- (ARImageData)latestUltraWideImage
{
  return self->_latestUltraWideImage;
}

- (void)setLatestUltraWideImage:(id)a3
{
}

- (__n128)visionTransform
{
  return a1[21];
}

- (__n128)setVisionTransform:(__n128)a3
{
  result[21] = a2;
  result[22] = a3;
  result[23] = a4;
  result[24] = a5;
  return result;
}

- (double)timestampOfSynchronizedWideImageData
{
  return self->_timestampOfSynchronizedWideImageData;
}

- (void)setTimestampOfSynchronizedWideImageData:(double)a3
{
  self->_timestampOfSynchronizedWideImageData = a3;
}

- (void)setExtrinsicsMap:(id)a3
{
}

- (NSDictionary)tiffData
{
  return self->_tiffData;
}

- (AVCaptureDevice)captureDevice
{
  return self->_captureDevice;
}

- (void)setCaptureDevice:(id)a3
{
}

- (unint64_t)captureLens
{
  return self->_captureLens;
}

- (void)setCaptureLens:(unint64_t)a3
{
  self->_captureLens = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureDevice, 0);
  objc_storeStrong((id *)&self->_tiffData, 0);
  objc_storeStrong((id *)&self->_extrinsicsMap, 0);
  objc_storeStrong((id *)&self->_latestUltraWideImage, 0);
  objc_storeStrong((id *)&self->_adCameraCalibration, 0);
  objc_storeStrong((id *)&self->_calibrationData, 0);
  objc_storeStrong((id *)&self->_cameraType, 0);
  objc_storeStrong((id *)&self->_pointCloud, 0);
  objc_storeStrong((id *)&self->_depthData, 0);
  objc_storeStrong((id *)&self->_faceData, 0);
  objc_storeStrong((id *)&self->_exifData, 0);
  objc_storeStrong((id *)&self->_captureDate, 0);
}

@end