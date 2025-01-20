@interface PADAVAssetReader
- (id)_frameFromVideo:(id)a3 timestamp:(id *)a4 size:(CGSize)a5 error:(id *)a6;
- (id)_imageDataFromVideo:(id)a3 timestamp:(id *)a4 size:(CGSize)a5 error:(id *)a6;
- (id)framesFromVideoURL:(id)a3 timestamps:(id)a4 error:(id *)a5;
- (id)framesFromVideoURL:(id)a3 timestamps:(id)a4 size:(CGSize)a5 error:(id *)a6;
- (id)imagesFromVideoURL:(id)a3 timestamps:(id)a4 error:(id *)a5;
- (id)imagesFromVideoURL:(id)a3 timestamps:(id)a4 size:(CGSize)a5 error:(id *)a6;
- (opaqueCMSampleBuffer)_newSampleBufferFromVideo:(id)a3 timestamp:(id *)a4 size:(CGSize)a5 error:(id *)a6;
@end

@implementation PADAVAssetReader

- (id)imagesFromVideoURL:(id)a3 timestamps:(id)a4 error:(id *)a5
{
  return -[PADAVAssetReader imagesFromVideoURL:timestamps:size:error:](self, "imagesFromVideoURL:timestamps:size:error:", a3, a4, a5, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
}

- (id)imagesFromVideoURL:(id)a3 timestamps:(id)a4 size:(CGSize)a5 error:(id *)a6
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v24 = (id)[MEMORY[0x263EFFA68] mutableCopy];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    id v15 = 0;
    uint64_t v16 = *(void *)v29;
    do
    {
      uint64_t v17 = 0;
      v18 = v15;
      do
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v12);
        }
        CFDictionaryRef v19 = *(const __CFDictionary **)(*((void *)&v28 + 1) + 8 * v17);
        v20 = (void *)MEMORY[0x223C42C60]();
        memset(&v27, 0, sizeof(v27));
        CMTimeMakeFromDictionary(&v27, v19);
        id v26 = v18;
        CMTime v25 = v27;
        v21 = -[PADAVAssetReader _imageDataFromVideo:timestamp:size:error:](self, "_imageDataFromVideo:timestamp:size:error:", v10, &v25, &v26, width, height);
        id v15 = v26;

        if (v21) {
          [v24 addObject:v21];
        }

        ++v17;
        v18 = v15;
      }
      while (v14 != v17);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v14);
  }
  else
  {
    id v15 = 0;
  }

  if (a6) {
    *a6 = v15;
  }

  return v24;
}

- (id)framesFromVideoURL:(id)a3 timestamps:(id)a4 error:(id *)a5
{
  return -[PADAVAssetReader framesFromVideoURL:timestamps:size:error:](self, "framesFromVideoURL:timestamps:size:error:", a3, a4, a5, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
}

- (id)framesFromVideoURL:(id)a3 timestamps:(id)a4 size:(CGSize)a5 error:(id *)a6
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v24 = (id)[MEMORY[0x263EFFA68] mutableCopy];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    id v15 = 0;
    uint64_t v16 = *(void *)v29;
    do
    {
      uint64_t v17 = 0;
      v18 = v15;
      do
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v12);
        }
        CFDictionaryRef v19 = *(const __CFDictionary **)(*((void *)&v28 + 1) + 8 * v17);
        v20 = (void *)MEMORY[0x223C42C60]();
        memset(&v27, 0, sizeof(v27));
        CMTimeMakeFromDictionary(&v27, v19);
        id v26 = v18;
        CMTime v25 = v27;
        v21 = -[PADAVAssetReader _frameFromVideo:timestamp:size:error:](self, "_frameFromVideo:timestamp:size:error:", v10, &v25, &v26, width, height);
        id v15 = v26;

        if (v21) {
          [v24 addObject:v21];
        }

        ++v17;
        v18 = v15;
      }
      while (v14 != v17);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v14);
  }
  else
  {
    id v15 = 0;
  }

  if (a6) {
    *a6 = v15;
  }

  return v24;
}

- (id)_imageDataFromVideo:(id)a3 timestamp:(id *)a4 size:(CGSize)a5 error:(id *)a6
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE buf = *a4;
  v6 = -[PADAVAssetReader _newSampleBufferFromVideo:timestamp:size:error:](self, "_newSampleBufferFromVideo:timestamp:size:error:", a3, &buf, a6, a5.width, a5.height);
  if (v6)
  {
    v7 = v6;
    v8 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
    if (os_signpost_enabled(v8))
    {
      LOWORD(buf.var0) = 0;
      _os_signpost_emit_with_name_impl(&dword_21F07C000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AV.FrameImageData", "", (uint8_t *)&buf, 2u);
    }

    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __61__PADAVAssetReader__imageDataFromVideo_timestamp_size_error___block_invoke;
    v12[3] = &__block_descriptor_40_e13___NSData_8__0l;
    v12[4] = v7;
    v9 = __61__PADAVAssetReader__imageDataFromVideo_timestamp_size_error___block_invoke((uint64_t)v12);
    id v10 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
    if (os_signpost_enabled(v10))
    {
      LOWORD(buf.var0) = 0;
      _os_signpost_emit_with_name_impl(&dword_21F07C000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AV.FrameImageData", "", (uint8_t *)&buf, 2u);
    }

    CFRelease(v7);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

id __61__PADAVAssetReader__imageDataFromVideo_timestamp_size_error___block_invoke(uint64_t a1)
{
  ImageBuffer = CMSampleBufferGetImageBuffer(*(CMSampleBufferRef *)(a1 + 32));
  CVPixelBufferLockBaseAddress(ImageBuffer, 0);
  BaseAddress = CVPixelBufferGetBaseAddress(ImageBuffer);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(ImageBuffer);
  size_t Width = CVPixelBufferGetWidth(ImageBuffer);
  size_t Height = CVPixelBufferGetHeight(ImageBuffer);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v7 = CGBitmapContextCreate(BaseAddress, Width, Height, 8uLL, BytesPerRow, DeviceRGB, 0x2002u);
  Image = CGBitmapContextCreateImage(v7);
  CVPixelBufferUnlockBaseAddress(ImageBuffer, 0);
  CGContextRelease(v7);
  CGColorSpaceRelease(DeviceRGB);
  v9 = [MEMORY[0x263F00650] imageWithCGImage:Image];
  id v10 = [MEMORY[0x263F00628] context];
  id v11 = CGColorSpaceCreateDeviceRGB();
  id v12 = [v10 JPEGRepresentationOfImage:v9 colorSpace:v11 options:MEMORY[0x263EFFA78]];
  CGColorSpaceRelease(v11);

  CGImageRelease(Image);
  return v12;
}

- (id)_frameFromVideo:(id)a3 timestamp:(id *)a4 size:(CGSize)a5 error:(id *)a6
{
  double height = a5.height;
  double width = a5.width;
  id v11 = a3;
  id v12 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
  if (os_signpost_enabled(v12))
  {
    LOWORD(buf.var0) = 0;
    _os_signpost_emit_with_name_impl(&dword_21F07C000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AV.ReadFrame", "", (uint8_t *)&buf, 2u);
  }

  $3CC8671D27C23BF42ADDB32F2B5E48AE buf = *a4;
  uint64_t v13 = -[PADAVAssetReader _newSampleBufferFromVideo:timestamp:size:error:](self, "_newSampleBufferFromVideo:timestamp:size:error:", v11, &buf, a6, width, height);

  if (v13)
  {
    CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(v13);
    memset(&buf, 0, sizeof(buf));
    CMSampleBufferGetPresentationTimeStamp((CMTime *)&buf, v13);
    CFRelease(v13);
    id v15 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
    if (os_signpost_enabled(v15))
    {
      *(_WORD *)v20 = 0;
      _os_signpost_emit_with_name_impl(&dword_21F07C000, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AV.ReadFrame", "", v20, 2u);
    }

    uint64_t v16 = objc_alloc_init(PADAVFrame);
    [(PADAVFrame *)v16 setPixelBuffer:ImageBuffer];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v19 = buf;
    [(PADAVFrame *)v16 setTimestamp:&v19];
  }
  else
  {
    uint64_t v17 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
    if (os_signpost_enabled(v17))
    {
      LOWORD(buf.var0) = 0;
      _os_signpost_emit_with_name_impl(&dword_21F07C000, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AV.ReadFrame", "", (uint8_t *)&buf, 2u);
    }

    uint64_t v16 = 0;
  }
  return v16;
}

- (opaqueCMSampleBuffer)_newSampleBufferFromVideo:(id)a3 timestamp:(id *)a4 size:(CGSize)a5 error:(id *)a6
{
  double height = a5.height;
  double width = a5.width;
  v43[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = [MEMORY[0x263EFA470] assetWithURL:v10];
  id v12 = [v11 tracksWithMediaType:*MEMORY[0x263EF9D48]];
  uint64_t v13 = [v12 firstObject];

  if (v13)
  {
    uint64_t v40 = *MEMORY[0x263F04180];
    v41 = &unk_26D0AB6C0;
    uint64_t v14 = [NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    id v15 = (void *)[v14 mutableCopy];

    if (width != *MEMORY[0x263F001B0] || height != *(double *)(MEMORY[0x263F001B0] + 8))
    {
      uint64_t v17 = [NSNumber numberWithDouble:width];
      [v15 setObject:v17 forKeyedSubscript:*MEMORY[0x263F04240]];

      v18 = [NSNumber numberWithDouble:height];
      [v15 setObject:v18 forKeyedSubscript:*MEMORY[0x263F04118]];
    }
    $3CC8671D27C23BF42ADDB32F2B5E48AE v19 = (void *)[objc_alloc(MEMORY[0x263EFA4D8]) initWithTrack:v13 outputSettings:v15];
    [v19 setAlwaysCopiesSampleData:0];
    v20 = (void *)[objc_alloc(MEMORY[0x263EFA4C0]) initWithAsset:v11 error:0];
    v21 = v20;
    if (v20)
    {
      if ([v20 canAddOutput:v19])
      {
        CMTimeMake(&duration, 1000000, a4->var1);
        CMTime start = (CMTime)*a4;
        CMTimeRangeMake(&v35, &start, &duration);
        CMTimeRange v32 = v35;
        [v21 setTimeRange:&v32];
        [v21 addOutput:v19];
        [v21 startReading];
        v22 = (opaqueCMSampleBuffer *)[v19 copyNextSampleBuffer];
        [v21 cancelReading];
LABEL_17:

        goto LABEL_18;
      }
      if (a6)
      {
        long long v29 = (void *)MEMORY[0x263F087E8];
        uint64_t v36 = *MEMORY[0x263F07F80];
        v37 = @"Unable to add output to AVAssetReader";
        long long v30 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
        *a6 = [v29 errorWithDomain:@"com.apple.coreidv.CoreIDVPAD.PADErrorDomain" code:1 userInfo:v30];
      }
    }
    else if (a6)
    {
      id v24 = [NSString alloc];
      CMTime v25 = [v10 path];
      id v26 = (void *)[v24 initWithFormat:@"Unable to create AVAssetReader with file at URL %@", v25];

      CMTime v27 = (void *)MEMORY[0x263F087E8];
      uint64_t v38 = *MEMORY[0x263F07F80];
      v39 = v26;
      long long v28 = [NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      *a6 = [v27 errorWithDomain:@"com.apple.coreidv.CoreIDVPAD.PADErrorDomain" code:1 userInfo:v28];
    }
    v22 = 0;
    goto LABEL_17;
  }
  if (!a6)
  {
    v22 = 0;
    goto LABEL_19;
  }
  v23 = (void *)MEMORY[0x263F087E8];
  uint64_t v42 = *MEMORY[0x263F07F80];
  v43[0] = @"Unable to create asset track from asset";
  id v15 = [NSDictionary dictionaryWithObjects:v43 forKeys:&v42 count:1];
  [v23 errorWithDomain:@"com.apple.coreidv.CoreIDVPAD.PADErrorDomain" code:1 userInfo:v15];
  v22 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

LABEL_19:
  return v22;
}

@end