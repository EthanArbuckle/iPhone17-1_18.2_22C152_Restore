@interface IMTranscoderImageCMPhotoSizeEstimator
- (IMTranscoderImageCMPhotoSizeEstimator)initWithURL:(id)a3 uti:(id)a4 imageSource:(CGImageSource *)a5;
- (unint64_t)estimatedSizeForOutputUTI:(id)a3 maximumDimension:(int64_t)a4 quality:(double)a5;
- (unint64_t)optimizedEstimatedSizeForOutputUTI:(id)a3 maximumDimension:(int64_t)a4 quality:(double)a5;
- (void)dealloc;
@end

@implementation IMTranscoderImageCMPhotoSizeEstimator

- (IMTranscoderImageCMPhotoSizeEstimator)initWithURL:(id)a3 uti:(id)a4 imageSource:(CGImageSource *)a5
{
  v8.receiver = self;
  v8.super_class = (Class)IMTranscoderImageCMPhotoSizeEstimator;
  v5 = [(IMTranscoderImageSizeEstimator *)&v8 initWithUTI:a4 imageSource:a5];
  if (CMPhotoDecompressionSessionCreate()
    || (int Container = CMPhotoDecompressionSessionCreateContainer(), CFRelease(0), Container))
  {

    return 0;
  }
  else
  {
    v5->_container = 0;
  }
  return v5;
}

- (void)dealloc
{
  container = self->_container;
  if (container) {
    CFRelease(container);
  }
  v4.receiver = self;
  v4.super_class = (Class)IMTranscoderImageCMPhotoSizeEstimator;
  [(IMTranscoderImageCMPhotoSizeEstimator *)&v4 dealloc];
}

- (unint64_t)optimizedEstimatedSizeForOutputUTI:(id)a3 maximumDimension:(int64_t)a4 quality:(double)a5
{
  v38[4] = *MEMORY[0x263EF8340];
  if (UTTypeConformsTo((CFStringRef)a3, (CFStringRef)*MEMORY[0x263F01A80])) {
    uint64_t v12 = 1785750887;
  }
  else {
    uint64_t v12 = 1752589105;
  }
  v37[0] = *MEMORY[0x263F2F948];
  v38[0] = objc_msgSend_numberWithInteger_(NSNumber, v7, a4, v8, v9, v10, v11, 0);
  v37[1] = *MEMORY[0x263F2F888];
  uint64_t v18 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v13, v12, v14, v15, v16, v17);
  uint64_t v19 = *MEMORY[0x263F2F8D0];
  v38[1] = v18;
  v38[2] = &unk_26DE895E0;
  uint64_t v20 = *MEMORY[0x263F2F8C8];
  v37[2] = v19;
  v37[3] = v20;
  uint64_t v35 = *MEMORY[0x263F2F980];
  uint64_t v36 = objc_msgSend_numberWithDouble_(NSNumber, v21, v22, v23, v24, v25, v26, a5);
  v38[3] = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v27, (uint64_t)&v36, (uint64_t)&v35, 1, v28, v29);
  objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v30, (uint64_t)v38, (uint64_t)v37, 4, v31, v32);
  if (CMPhotoDecompressionContainerPredictTranscodedSize()) {
    return 0;
  }
  else {
    return (unint64_t)(double)v34;
  }
}

- (unint64_t)estimatedSizeForOutputUTI:(id)a3 maximumDimension:(int64_t)a4 quality:(double)a5
{
  if (!UTTypeConformsTo((CFStringRef)a3, (CFStringRef)*MEMORY[0x263F01A80])
    && !UTTypeConformsTo((CFStringRef)a3, @"public.heif-standard")
    || (unint64_t result = objc_msgSend_optimizedEstimatedSizeForOutputUTI_maximumDimension_quality_(self, v9, (uint64_t)a3, a4, v10, v11, v12, a5)) == 0)
  {
    v14.receiver = self;
    v14.super_class = (Class)IMTranscoderImageCMPhotoSizeEstimator;
    return [(IMTranscoderImageSizeEstimator *)&v14 estimatedSizeForOutputUTI:a3 maximumDimension:a4 quality:a5];
  }
  return result;
}

@end