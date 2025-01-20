@interface SLImageDownsampling
+ ($0AC6E346AE4835514AAA8AC86D8F4844)imageSizeWithData:(id)a3;
+ (id)createThumbnailWithData:(id)a3 adjustSmallestSideToSize:(unint64_t)a4;
+ (id)downsampleImageData:(id)a3 toMaxByteSize:(unint64_t)a4;
+ (void)downsampleImageData:(id)a3 toMaxByteSize:(unint64_t)a4 resultsHandler:(id)a5;
+ (void)generateThumbnailFromImageData:(id)a3 adjustSmallestSideToSize:(unint64_t)a4 resultsHandler:(id)a5;
@end

@implementation SLImageDownsampling

+ (id)downsampleImageData:(id)a3 toMaxByteSize:(unint64_t)a4
{
  id v6 = a3;
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
  v33 = [NSNumber numberWithUnsignedInteger:a4];
  _SLLog(v4, 7, @"SLImageDownsampling downsampleImageData: length %@ toMaxByteSize: %@");

  if (objc_msgSend(v6, "length", v7, v33) < a4)
  {
    _SLLog(v4, 6, @"SLImageDownsampling image is below threshold, returning original data");
    id v8 = v6;
    goto LABEL_21;
  }
  if (!v6)
  {
    v29 = @"SLImageDownsampling image data is nil";
LABEL_20:
    _SLLog(v4, 3, v29);
    id v8 = 0;
    goto LABEL_21;
  }
  uint64_t v9 = +[SLImageDownsampling imageSizeWithData:v6];
  if (!v9 || (uint64_t v11 = v10) == 0)
  {
    v29 = @"Image width and/or height is 0, returning nil";
    goto LABEL_20;
  }
  uint64_t v12 = v9;
  v13 = [NSNumber numberWithInteger:v9];
  v34 = [NSNumber numberWithInteger:v11];
  _SLLog(v4, 7, @"SLImageDownsampling original image size width %@ height %@");

  double v14 = (double)a4;
  double v15 = sqrt((double)a4 / (double)(unint64_t)objc_msgSend(v6, "length", v13, v34)) * 0.95;
  v31 = [NSNumber numberWithDouble:v15];
  _SLLog(v4, 7, @"SLImageDownsampling scale %@");

  double v17 = (double)v12;
  double v18 = (double)v11;
  do
  {
    v19 = (void *)MEMORY[0x1C876A440](v16);
    double v20 = ceil(v15 * v17);
    if (v20 < 1.0) {
      double v20 = 1.0;
    }
    uint64_t v21 = (uint64_t)v20;
    double v22 = ceil(v15 * v18);
    if (v22 < 1.0) {
      double v22 = 1.0;
    }
    unint64_t v23 = a4;
    uint64_t v24 = (uint64_t)v22;
    v25 = objc_msgSend(NSNumber, "numberWithDouble:", v15, v31);
    v26 = [NSNumber numberWithInteger:v21];
    v36 = [NSNumber numberWithInteger:v24];
    _SLLog(v4, 7, @"SLImageDownsampling trying scale %@ width %@ height %@");

    SLDownSampledImageData(v6, v21, v24);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(NSNumber, "numberWithDouble:", v15, v25, v26, v36);
    v35 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "length"));
    _SLLog(v4, 7, @"SLImageDownsampling scale %@ produced image data length %@");

    a4 = v23;
    if (objc_msgSend(v8, "length", v27, v35) > v23)
    {
      if ((double)(unint64_t)[v8 length] * 0.9 <= v14) {
        double v28 = 0.95;
      }
      else {
        double v28 = 0.5;
      }
      double v15 = v15 * v28;

      id v8 = 0;
    }
  }
  while (!v8);
  v32 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "length"));
  _SLLog(v4, 7, @"SLImageDownsampling returning final downsampled image data of length %@");

LABEL_21:

  return v8;
}

+ ($0AC6E346AE4835514AAA8AC86D8F4844)imageSizeWithData:(id)a3
{
  uint64_t v4 = CGImageSourceCreateWithData((CFDataRef)a3, 0);
  CFDictionaryRef v5 = CGImageSourceCopyPropertiesAtIndex(v4, 0, 0);
  _SLLog(v3, 6, @"image props: %@");
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v5, (const void *)*MEMORY[0x1E4F2FD00]);
  CFNumberRef v7 = (const __CFNumber *)CFDictionaryGetValue(v5, (const void *)*MEMORY[0x1E4F2FCE8]);
  int64_t valuePtr = 0;
  int64_t v11 = 0;
  if (Value) {
    CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
  }
  if (v7) {
    CFNumberGetValue(v7, kCFNumberIntType, &v11);
  }
  CFRelease(v4);
  CFRelease(v5);
  int64_t v8 = valuePtr;
  int64_t v9 = v11;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

+ (id)createThumbnailWithData:(id)a3 adjustSmallestSideToSize:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = +[SLImageDownsampling imageSizeWithData:v6];
  uint64_t v9 = v8;
  _SLLog(v4, 6, @"Thumbnail source is %i x %i");
  if (v7 >= v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = v7;
  }
  double v11 = (double)a4 / (double)v10;
  double v12 = v11 * (double)v7;
  if ((uint64_t)v12 <= 1) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = (uint64_t)v12;
  }
  double v14 = v11 * (double)v9;
  if ((uint64_t)v14 <= 1) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = (uint64_t)v14;
  }
  _SLLog(v4, 6, @"Thumbnail destination is %i x %i");
  uint64_t v16 = SLDownSampledImageData(v6, v13, v15);

  return v16;
}

+ (void)downsampleImageData:(id)a3 toMaxByteSize:(unint64_t)a4 resultsHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__SLImageDownsampling_downsampleImageData_toMaxByteSize_resultsHandler___block_invoke;
  block[3] = &unk_1E6467DE0;
  id v14 = v8;
  unint64_t v15 = a4;
  id v13 = v7;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

void __72__SLImageDownsampling_downsampleImageData_toMaxByteSize_resultsHandler___block_invoke(void *a1)
{
  id v2 = +[SLImageDownsampling downsampleImageData:a1[4] toMaxByteSize:a1[6]];
  (*(void (**)(void))(a1[5] + 16))();
}

+ (void)generateThumbnailFromImageData:(id)a3 adjustSmallestSideToSize:(unint64_t)a4 resultsHandler:(id)a5
{
  id v7 = a3;
  id v8 = (void *)[a5 copy];
  uint64_t v9 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__SLImageDownsampling_generateThumbnailFromImageData_adjustSmallestSideToSize_resultsHandler___block_invoke;
  block[3] = &unk_1E6467DE0;
  id v13 = v7;
  id v14 = v8;
  unint64_t v15 = a4;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

void __94__SLImageDownsampling_generateThumbnailFromImageData_adjustSmallestSideToSize_resultsHandler___block_invoke(void *a1)
{
  uint64_t v3 = a1[4];
  if (v3)
  {
    id v5 = +[SLImageDownsampling createThumbnailWithData:v3 adjustSmallestSideToSize:a1[6]];
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    _SLLog(v1, 3, @"Cannot generate thumbnail - image data is nil");
    uint64_t v4 = *(void (**)(void))(a1[5] + 16);
    v4();
  }
}

@end