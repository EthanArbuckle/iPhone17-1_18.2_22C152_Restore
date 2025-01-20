@interface MKPlaceCollectionImageGradientOperation
- (BOOL)isRTL;
- (CGSize)desiredSize;
- (MKPlaceCollectionImageGradientOperation)initWithUrl:(id)a3 size:(CGSize)a4 contentSizeCategory:(id)a5 name:(id)a6 downloadCache:(id)a7 gradientCache:(id)a8 isRTL:(BOOL)a9 screenScale:(double)a10 cacheId:(id)a11;
- (NSCache)blurringCache;
- (NSCache)downloadCache;
- (NSString)cacheId;
- (NSString)contentSizeCategory;
- (NSString)debugName;
- (NSURL)url;
- (UIImage)blurredImage;
- (UIImage)sourceImage;
- (double)screenScale;
- (void)main;
- (void)setBlurringCache:(id)a3;
- (void)setCacheId:(id)a3;
- (void)setContentSizeCategory:(id)a3;
- (void)setDebugName:(id)a3;
- (void)setDesiredSize:(CGSize)a3;
- (void)setDownloadCache:(id)a3;
- (void)setIsRTL:(BOOL)a3;
- (void)setScreenScale:(double)a3;
- (void)setSourceImage:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation MKPlaceCollectionImageGradientOperation

- (void)main
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  v3 = [(MKPlaceCollectionImageGradientOperation *)self downloadCache];
  v4 = [(MKPlaceCollectionImageGradientOperation *)self url];
  v5 = [v4 absoluteString];
  v6 = [v3 objectForKey:v5];
  [(MKPlaceCollectionImageGradientOperation *)self setSourceImage:v6];

  if ([(MKPlaceCollectionImageGradientOperation *)self isCancelled])
  {
    v7 = MKGetCuratedCollectionsLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = [(MKPlaceCollectionImageGradientOperation *)self cacheId];
      *(_DWORD *)buf = 138412290;
      v89 = v8;
      v9 = "[Step-1]Blurring Operation is cancelled for: %@";
LABEL_8:
      _os_log_impl(&dword_18BAEC000, v7, OS_LOG_TYPE_DEBUG, v9, buf, 0xCu);
LABEL_11:
    }
  }
  else
  {
    v10 = [(MKPlaceCollectionImageGradientOperation *)self sourceImage];

    if (v10)
    {
      int v11 = [(MKPlaceCollectionImageGradientOperation *)self isCancelled];
      v7 = MKGetCuratedCollectionsLog();
      BOOL v12 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
      if (v11)
      {
        if (v12)
        {
          v8 = [(MKPlaceCollectionImageGradientOperation *)self cacheId];
          *(_DWORD *)buf = 138412290;
          v89 = v8;
          v9 = "[Step-2]Gradient Operation is cancelled for: %@";
          goto LABEL_8;
        }
      }
      else
      {
        if (v12)
        {
          v14 = [(MKPlaceCollectionImageGradientOperation *)self sourceImage];
          [(MKPlaceCollectionImageGradientOperation *)self desiredSize];
          v15 = NSStringFromCGSize(v93);
          *(_DWORD *)buf = 138412546;
          v89 = v14;
          __int16 v90 = 2112;
          uint64_t v91 = (uint64_t)v15;
          _os_log_impl(&dword_18BAEC000, v7, OS_LOG_TYPE_DEBUG, "Starting gradient for Image: %@ with size: %@", buf, 0x16u);
        }
        v7 = [MEMORY[0x1E4F1C9C8] date];
        v16 = +[MKSystemController sharedInstance];
        [v16 screenScale];
        double v18 = v17;

        if (qword_1EB315AC8 != -1) {
          dispatch_once(&qword_1EB315AC8, &__block_literal_global_54);
        }
        id v19 = objc_alloc(MEMORY[0x1E4F1E050]);
        v20 = [(MKPlaceCollectionImageGradientOperation *)self sourceImage];
        v21 = (void *)[v19 initWithImage:v20];

        [(MKPlaceCollectionImageGradientOperation *)self desiredSize];
        double v23 = v22;
        [v21 extent];
        double v25 = v23 / v24;
        [(MKPlaceCollectionImageGradientOperation *)self desiredSize];
        double v27 = v26;
        [v21 extent];
        if (v25 <= v27 / v28) {
          double v29 = v27 / v28;
        }
        else {
          double v29 = v25;
        }
        v30 = [MEMORY[0x1E4F1E040] filterWithName:@"CILanczosScaleTransform"];
        uint64_t v82 = *MEMORY[0x1E4F1E480];
        v87 = v21;
        objc_msgSend(v30, "setValue:forKey:", v21);
        v31 = [NSNumber numberWithDouble:v29];
        [v30 setValue:v31 forKey:*MEMORY[0x1E4F1E4F0]];

        [v30 setValue:&unk_1ED97DF80 forKey:*MEMORY[0x1E4F1E410]];
        v86 = v30;
        v32 = [v30 outputImage];
        [v32 extent];
        double v34 = v33;
        double v36 = v35 * 0.5;
        [(MKPlaceCollectionImageGradientOperation *)self desiredSize];
        double v38 = v36 - v37 * 0.5;
        double v39 = v34 * 0.5;
        [(MKPlaceCollectionImageGradientOperation *)self desiredSize];
        double v41 = v34 * 0.5 - v40 * 0.5;
        [(MKPlaceCollectionImageGradientOperation *)self desiredSize];
        double v43 = v42;
        [(MKPlaceCollectionImageGradientOperation *)self desiredSize];
        double v45 = v44;
        v85 = v32;
        uint64_t v83 = objc_msgSend(v32, "imageByClampingToRect:", v38, v41, v43, v44);
        v46 = [MEMORY[0x1E4F1E040] filterWithName:@"CISmoothLinearGradient"];
        v47 = [MEMORY[0x1E4F1E080] vectorWithX:0.5 Y:v39];
        [v46 setValue:v47 forKey:@"inputPoint0"];

        v48 = [MEMORY[0x1E4F1E008] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
        [v46 setValue:v48 forKey:@"inputColor0"];

        v49 = [MEMORY[0x1E4F1E080] vectorWithX:0.5 Y:v39 * 0.66];
        [v46 setValue:v49 forKey:@"inputPoint1"];

        v50 = [MEMORY[0x1E4F1E008] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
        [v46 setValue:v50 forKey:@"inputColor1"];

        v51 = [MEMORY[0x1E4F1E040] filterWithName:@"CISmoothLinearGradient"];
        v52 = [MEMORY[0x1E4F1E080] vectorWithX:0.5 Y:v39];
        [v51 setValue:v52 forKey:@"inputPoint0"];

        v53 = [MEMORY[0x1E4F1E008] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
        [v51 setValue:v53 forKey:@"inputColor0"];

        v54 = [MEMORY[0x1E4F1E080] vectorWithX:0.5 Y:v39 * 0.38];
        [v51 setValue:v54 forKey:@"inputPoint1"];

        v55 = [MEMORY[0x1E4F1E008] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.6];
        [v51 setValue:v55 forKey:@"inputColor1"];

        v56 = [MEMORY[0x1E4F1E040] filterWithName:@"CIMultiplyBlendMode"];
        v57 = [v51 outputImage];
        [v56 setValue:v57 forKey:v82];

        v84 = v46;
        v58 = [v46 outputImage];
        uint64_t v59 = *MEMORY[0x1E4F1E418];
        [v56 setValue:v58 forKey:*MEMORY[0x1E4F1E418]];

        if ([(MKPlaceCollectionImageGradientOperation *)self isCancelled])
        {
          v60 = (void *)v83;
          v61 = MKGetCuratedCollectionsLog();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
          {
            v62 = [(MKPlaceCollectionImageGradientOperation *)self cacheId];
            *(_DWORD *)buf = 138412290;
            v89 = v62;
            _os_log_impl(&dword_18BAEC000, v61, OS_LOG_TYPE_DEBUG, "[Step-3]Gradient Operation is cancelled for: %@", buf, 0xCu);
          }
        }
        else
        {
          v61 = [MEMORY[0x1E4F1E040] filterWithName:@"CISourceAtopCompositing"];
          v81 = v56;
          v63 = [v56 outputImage];
          [v61 setValue:v63 forKey:v82];

          v60 = (void *)v83;
          [v61 setValue:v83 forKey:v59];
          v64 = [v61 outputImage];
          v65 = (CGImage *)objc_msgSend((id)_MergedGlobals_3_2, "createCGImage:fromRect:", v38, v41, v43, v45);
          v66 = [(MKPlaceCollectionImageGradientOperation *)self blurringCache];
          v67 = [MEMORY[0x1E4F42A80] imageWithCGImage:v65 scale:0 orientation:v18];
          v68 = [(MKPlaceCollectionImageGradientOperation *)self cacheId];
          [v66 setObject:v67 forKey:v68];

          CGImageRelease(v65);
          v69 = MKGetCuratedCollectionsLog();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
          {
            v70 = [(MKPlaceCollectionImageGradientOperation *)self blurringCache];
            v71 = [(MKPlaceCollectionImageGradientOperation *)self blurringCache];
            v72 = [v71 allObjects];
            uint64_t v73 = [v72 count];
            *(_DWORD *)buf = 138412546;
            v89 = v70;
            __int16 v90 = 2048;
            uint64_t v91 = v73;
            _os_log_impl(&dword_18BAEC000, v69, OS_LOG_TYPE_DEBUG, "Gradient cache %@ has %ld items.", buf, 0x16u);
          }
          v74 = MKGetCuratedCollectionsLog();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
          {
            v75 = [MEMORY[0x1E4F1C9C8] date];
            [v75 timeIntervalSinceDate:v7];
            v77 = v76;
            v78 = [(MKPlaceCollectionImageGradientOperation *)self blurringCache];
            v79 = [(MKPlaceCollectionImageGradientOperation *)self cacheId];
            v80 = [v78 objectForKey:v79];
            *(_DWORD *)buf = 134218242;
            v89 = v77;
            __int16 v90 = 2112;
            uint64_t v91 = (uint64_t)v80;
            _os_log_impl(&dword_18BAEC000, v74, OS_LOG_TYPE_DEBUG, "[⌛]Completed applying gradient in: %f seconds. Image: %@", buf, 0x16u);
          }
          v56 = v81;
        }
      }
    }
    else
    {
      v7 = MKGetCuratedCollectionsLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = [(MKPlaceCollectionImageGradientOperation *)self url];
        v13 = [v8 absoluteString];
        *(_DWORD *)buf = 138412290;
        v89 = v13;
        _os_log_impl(&dword_18BAEC000, v7, OS_LOG_TYPE_ERROR, "[!]Operation shouldn't start unless we have source image. URL: %@", buf, 0xCu);

        goto LABEL_11;
      }
    }
  }
}

- (CGSize)desiredSize
{
  double width = self->_desiredSize.width;
  double height = self->_desiredSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSURL)url
{
  return self->_url;
}

- (UIImage)sourceImage
{
  return self->_sourceImage;
}

- (void)setSourceImage:(id)a3
{
}

- (MKPlaceCollectionImageGradientOperation)initWithUrl:(id)a3 size:(CGSize)a4 contentSizeCategory:(id)a5 name:(id)a6 downloadCache:(id)a7 gradientCache:(id)a8 isRTL:(BOOL)a9 screenScale:(double)a10 cacheId:(id)a11
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v20 = a3;
  id v29 = a5;
  id v28 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a11;
  v30.receiver = self;
  v30.super_class = (Class)MKPlaceCollectionImageGradientOperation;
  uint64_t v24 = [(MKPlaceCollectionImageGradientOperation *)&v30 self];

  if (v24)
  {
    objc_storeStrong((id *)(v24 + 272), a3);
    *(CGFloat *)(v24 + 328) = width;
    *(CGFloat *)(v24 + 336) = height;
    objc_storeStrong((id *)(v24 + 296), a5);
    objc_storeStrong((id *)(v24 + 280), a6);
    objc_storeWeak((id *)(v24 + 312), v21);
    objc_storeWeak((id *)(v24 + 320), v22);
    *(unsigned char *)(v24 + 248) = a9;
    *(double *)(v24 + 288) = a10;
    objc_storeStrong((id *)(v24 + 304), a11);
    double v25 = [v20 absoluteString];
    [(id)v24 setName:v25];
  }
  return (MKPlaceCollectionImageGradientOperation *)v24;
}

- (NSCache)downloadCache
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_downloadCache);

  return (NSCache *)WeakRetained;
}

- (NSCache)blurringCache
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_blurringCache);

  return (NSCache *)WeakRetained;
}

void __47__MKPlaceCollectionImageGradientOperation_main__block_invoke()
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1E018];
  uint64_t v1 = *MEMORY[0x1E4F1E390];
  v6[0] = *MEMORY[0x1E4F1E238];
  v6[1] = v1;
  v7[0] = MEMORY[0x1E4F1CC28];
  v2 = [MEMORY[0x1E4F1CA98] null];
  v7[1] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  uint64_t v4 = [v0 contextWithOptions:v3];
  v5 = (void *)_MergedGlobals_3_2;
  _MergedGlobals_3_2 = v4;
}

- (NSString)cacheId
{
  return self->_cacheId;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_blurringCache);
  objc_destroyWeak((id *)&self->_downloadCache);
  objc_storeStrong((id *)&self->_cacheId, 0);
  objc_storeStrong((id *)&self->_contentSizeCategory, 0);
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_blurredImage, 0);

  objc_storeStrong((id *)&self->_sourceImage, 0);
}

- (UIImage)blurredImage
{
  return self->_blurredImage;
}

- (void)setUrl:(id)a3
{
}

- (void)setDesiredSize:(CGSize)a3
{
  self->_desiredSize = a3;
}

- (NSString)debugName
{
  return self->_debugName;
}

- (void)setDebugName:(id)a3
{
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (double)screenScale
{
  return self->_screenScale;
}

- (void)setScreenScale:(double)a3
{
  self->_screenScale = a3;
}

- (NSString)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (void)setContentSizeCategory:(id)a3
{
}

- (void)setCacheId:(id)a3
{
}

- (void)setDownloadCache:(id)a3
{
}

- (void)setBlurringCache:(id)a3
{
}

@end