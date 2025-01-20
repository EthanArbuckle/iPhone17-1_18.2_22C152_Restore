@interface VCPInterAssetAnalyzer
+ (BOOL)canUseLastFrameOfAsset:(id)a3 withResources:(id)a4;
+ (CGSize)thumbnailSizeForAsset:(id)a3 withResources:(id)a4;
- (VCPInterAssetAnalyzer)init;
- (__CVBuffer)_getThumbnailForAsset:(id)a3 withResouces:(id)a4 andPixelFormat:(int)a5;
- (int)_generateLastFrameDistanceDescriptor:(id *)a3 withDescriptorClass:(Class)a4 forAsset:(id)a5;
- (int)computeDistance:(float *)a3 fromArray:(id)a4 toArray:(id)a5;
- (int)computeDistance:(float *)a3 withDescriptorClass:(id)a4 fromAsset:(id)a5 toAsset:(id)a6;
- (int)generateDistanceDescriptor:(id *)a3 withDescriptorClass:(Class)a4 forAsset:(id)a5 withResources:(id)a6 lastFrame:(BOOL)a7;
@end

@implementation VCPInterAssetAnalyzer

- (VCPInterAssetAnalyzer)init
{
  v6.receiver = self;
  v6.super_class = (Class)VCPInterAssetAnalyzer;
  v2 = [(VCPInterAssetAnalyzer *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

+ (BOOL)canUseLastFrameOfAsset:(id)a3 withResources:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 mediaType] == 1)
  {
    LOBYTE(v7) = 1;
  }
  else if ([v5 mediaType] == 2 {
         && objc_msgSend(v6, "vcp_hasLocalMovie:", objc_msgSend(v5, "hasAdjustments")))
  }
  {
    int v7 = objc_msgSend(v5, "vcp_isVideoSlowmo") ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

+ (CGSize)thumbnailSizeForAsset:(id)a3 withResources:(id)a4
{
  id v5 = a3;
  id v6 = objc_msgSend(a4, "vcp_thumbnailResource");
  objc_msgSend(v6, "vcp_size");
  double v9 = v8;
  double v10 = v7;
  if (v8 == *MEMORY[0x1E4F1DB30] && v7 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    unint64_t v12 = [v5 pixelWidth];
    unint64_t v13 = [v5 pixelHeight];
    double v9 = (double)v12;
    double v10 = (double)v13;
    if ((double)v13 >= (double)v12) {
      double v14 = (double)v12;
    }
    else {
      double v14 = (double)v13;
    }
    if (v14 > 256.0)
    {
      float v15 = v9 * 256.0 / v14;
      double v9 = (double)(int)((vcvtps_s32_f32(v15) + 1) & 0xFFFFFFFE);
      float v16 = v10 * 256.0 / v14;
      double v10 = (double)(int)((vcvtps_s32_f32(v16) + 1) & 0xFFFFFFFE);
    }
  }

  double v17 = v9;
  double v18 = v10;
  result.height = v18;
  result.width = v17;
  return result;
}

- (int)_generateLastFrameDistanceDescriptor:(id *)a3 withDescriptorClass:(Class)a4 forAsset:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  if ([v7 mediaType] == 2)
  {
    double v8 = objc_msgSend(MEMORY[0x1E4F38F68], "vcp_allAcceptableResourcesForAsset:", v7);
    CFTypeRef v27 = 0;
    double v9 = objc_msgSend(v8, "vcp_avAsset:", objc_msgSend(v7, "hasAdjustments"));
    double v10 = objc_msgSend(v9, "vcp_firstEnabledTrackWithMediaType:", *MEMORY[0x1E4F15C18]);
    v11 = v10;
    if (v10)
    {
      memset(&v26, 0, sizeof(v26));
      [v10 timeRange];
      CMTime lhs = buf[0];
      [v11 timeRange];
      CMTime rhs = *(CMTime *)&v23[56];
      CMTimeAdd(&v26, &lhs, &rhs);
      unint64_t v12 = (void *)MEMORY[0x1E4F16368];
      unint64_t v13 = [v11 asset];
      double v14 = [v12 assetImageGeneratorWithAsset:v13];

      +[VCPInterAssetAnalyzer thumbnailSizeForAsset:v7 withResources:v8];
      objc_msgSend(v14, "setMaximumSize:");
      [v14 setAppliesPreferredTrackTransform:1];
      buf[0] = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
      *(CMTime *)v23 = v26;
      float v15 = (const void *)[v14 copyCGImageAtTime:v23 actualTime:buf error:0];
      if (v15)
      {
        float v16 = [[VCPImageConverter alloc] initWithPixelFormat:[(objc_class *)a4 preferredPixelFormat]];
        double v17 = v16;
        if (v16)
        {
          int v18 = [(VCPImageConverter *)v16 convertImage:v15 yuvFrame:&v27];
          if (!v18)
          {
            id v21 = [(objc_class *)a4 descriptorWithImage:v27];
            *a3 = v21;
            if (v21) {
              int v18 = 0;
            }
            else {
              int v18 = -108;
            }
          }
        }
        else
        {
          int v18 = -50;
        }
      }
      else
      {

        float v15 = 0;
        int v18 = -108;
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v19 = VCPLogInstance();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v20 = [v7 localIdentifier];
          LODWORD(buf[0].value) = 138412290;
          *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v20;
          _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_ERROR, "  [%@] Invalid videoTrack", (uint8_t *)buf, 0xCu);
        }
      }
      float v15 = 0;
      int v18 = -18;
    }
    if (v27) {
      CFRelease(v27);
    }
    if (v15) {
      CFRelease(v15);
    }
  }
  else
  {
    int v18 = -50;
  }

  return v18;
}

- (__CVBuffer)_getThumbnailForAsset:(id)a3 withResouces:(id)a4 andPixelFormat:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  double v9 = objc_msgSend(v8, "vcp_thumbnailResource");
  if (objc_msgSend(v9, "vcp_isLocallyAvailable"))
  {
    double v10 = +[VCPImageManager sharedImageManager];
    v11 = (__CVBuffer *)[v10 imageForResource:v9 pixelFormat:v5];
  }
  else
  {
    unint64_t v12 = objc_msgSend(v8, "vcp_localPhotoResourcesSorted:", objc_msgSend(v7, "hasAdjustments"));
    if ([v12 count])
    {
      +[VCPInterAssetAnalyzer thumbnailSizeForAsset:v7 withResources:v8];
      double v15 = v13;
      double v16 = v14;
      if (v13 >= v14) {
        double v17 = v13;
      }
      else {
        double v17 = v14;
      }
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v18 = v12;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v30;
        double v21 = v15 * v16;
        while (2)
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v30 != v20) {
              objc_enumerationMutation(v18);
            }
            v23 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            objc_msgSend(v23, "vcp_size");
            if (v24 * v25 >= v21)
            {
              CFTypeRef v27 = +[VCPImageManager sharedImageManager];
              v11 = (__CVBuffer *)[v27 imageForResource:v23 pixelFormat:v5 maxDimension:(unint64_t)v17];
              goto LABEL_17;
            }
          }
          uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
          if (v19) {
            continue;
          }
          break;
        }
      }

      CMTime v26 = +[VCPImageManager sharedImageManager];
      CFTypeRef v27 = [v18 lastObject];
      v11 = (__CVBuffer *)[v26 imageForResource:v27 pixelFormat:v5];
      id v18 = v26;
LABEL_17:
    }
    else
    {
      v11 = 0;
    }
  }
  return v11;
}

- (int)generateDistanceDescriptor:(id *)a3 withDescriptorClass:(Class)a4 forAsset:(id)a5 withResources:(id)a6 lastFrame:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a6;
  if (v7
    && [v12 mediaType] == 2
    && +[VCPInterAssetAnalyzer canUseLastFrameOfAsset:v12 withResources:v13])
  {
    if (![(VCPInterAssetAnalyzer *)self _generateLastFrameDistanceDescriptor:a3 withDescriptorClass:a4 forAsset:v12])
    {
      int v18 = 0;
      goto LABEL_15;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      double v14 = VCPLogInstance();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        double v15 = [v12 localIdentifier];
        int v20 = 138412290;
        double v21 = v15;
        _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_DEBUG, "  [%@] Failed to decode last frame of video, fall back to thumbnail ", (uint8_t *)&v20, 0xCu);
      }
    }
  }
  double v16 = [(VCPInterAssetAnalyzer *)self _getThumbnailForAsset:v12 withResouces:v13 andPixelFormat:[(objc_class *)a4 preferredPixelFormat]];
  if (v16)
  {
    id v17 = [(objc_class *)a4 descriptorWithImage:v16];
    *a3 = v17;
    if (v17) {
      int v18 = 0;
    }
    else {
      int v18 = -108;
    }
    CFRelease(v16);
  }
  else
  {
    int v18 = -18;
  }
LABEL_15:

  return v18;
}

- (int)computeDistance:(float *)a3 withDescriptorClass:(id)a4 fromAsset:(id)a5 toAsset:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_msgSend(MEMORY[0x1E4F38F68], "vcp_allAcceptableResourcesForAsset:", v11);
  double v14 = objc_msgSend(MEMORY[0x1E4F38F68], "vcp_allAcceptableResourcesForAsset:", v12);
  id v20 = 0;
  int v15 = [(VCPInterAssetAnalyzer *)self generateDistanceDescriptor:&v20 withDescriptorClass:v10 forAsset:v11 withResources:v13 lastFrame:1];
  id v16 = v20;
  if (v15)
  {
    id v17 = 0;
  }
  else
  {
    id v19 = 0;
    int v15 = [(VCPInterAssetAnalyzer *)self generateDistanceDescriptor:&v19 withDescriptorClass:v10 forAsset:v12 withResources:v14 lastFrame:0];
    id v17 = v19;
    if (!v15) {
      int v15 = [v16 computeDistance:a3 toDescriptor:v17];
    }
  }

  return v15;
}

- (int)computeDistance:(float *)a3 fromArray:(id)a4 toArray:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  double v9 = v8;
  id v10 = 0;
  int v11 = -50;
  if (a3 && v7)
  {
    id v12 = 0;
    if (v8)
    {
      if ([v7 count] && objc_msgSend(v9, "count"))
      {
        if ([v7 count] == 1 && objc_msgSend(v9, "count") == 1)
        {
          id v13 = [v7 objectAtIndexedSubscript:0];
          id v10 = [v13 objectForKeyedSubscript:@"attributes"];

          double v14 = [v9 objectAtIndexedSubscript:0];
          id v12 = [v14 objectForKeyedSubscript:@"attributes"];

          int v11 = [v10 computeDistance:a3 toDescriptor:v12];
        }
        else
        {
          int v15 = [v7 count];
          int v16 = [v9 count] * v15;
          if (v16 < 0) {
            size_t v17 = -1;
          }
          else {
            size_t v17 = 4 * v16;
          }
          v33 = (char *)operator new[](v17, MEMORY[0x1E4FBA2D0]);
          if (v33)
          {
            long long v30 = a3;
            int v31 = v16;
            unint64_t v18 = 0;
            id v19 = 0;
            id v20 = 0;
            int v21 = 0;
            float v22 = 0.0;
            float v23 = 3.4028e38;
            while ([v7 count] > v18)
            {
              double v24 = [v7 objectAtIndexedSubscript:v18];
              id v10 = [v24 objectForKeyedSubscript:@"attributes"];

              unint64_t v25 = 0;
              int v32 = v21;
              CMTime v26 = &v33[4 * v21];
              while ([v9 count] > v25)
              {
                float v34 = 0.0;
                CFTypeRef v27 = [v9 objectAtIndexedSubscript:v25];
                id v12 = [v27 objectForKeyedSubscript:@"attributes"];

                int v11 = [v10 computeDistance:&v34 toDescriptor:v12];
                if (v11) {
                  goto LABEL_26;
                }
                float v28 = v34;
                *(float *)&v26[4 * v25] = v34;
                float v22 = v22 + v28;
                if (v28 < v23) {
                  float v23 = v28;
                }
                ++v25;
                id v20 = v12;
              }
              ++v18;
              int v21 = v32 + v25;
              id v19 = v10;
            }
            int v11 = 0;
            *long long v30 = (float)((float)(v22 / (float)v31) * 0.4) + (float)(v23 * 0.6);
            id v10 = v19;
            id v12 = v20;
LABEL_26:
            MEMORY[0x1C186C790](v33, 0x1000C8052888210);
          }
          else
          {
            id v10 = 0;
            id v12 = 0;
            int v11 = -108;
          }
        }
      }
      else
      {
        id v10 = 0;
        id v12 = 0;
      }
    }
  }
  else
  {
    id v12 = 0;
  }

  return v11;
}

@end