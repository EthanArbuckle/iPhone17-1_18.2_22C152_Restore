@interface MRUImageUtilities
+ (BOOL)imageIsEfficientFormat:(id)a3;
+ (BOOL)imageIsJPEG:(id)a3;
+ (BOOL)shouldResizeImage:(id)a3 forFittingSize:(CGSize)a4;
+ (BOOL)shouldTranscodeImage:(id)a3;
+ (CGSize)sizeFromSource:(CGImageSource *)a3;
+ (MSVLRUDictionary)cache;
+ (id)derivedSourceImageForImage:(id)a3;
+ (id)formatImage:(id)a3 forDisplayAtSize:(CGSize)a4;
+ (id)formatImage:(id)a3 withIdentifier:(id)a4 forDisplayAtSize:(CGSize)a5;
+ (id)formatImage:(id)a3 withIdentifier:(id)a4 forDisplayAtSize:(CGSize)a5 useCache:(BOOL)a6;
+ (id)formattedImageForIdentifier:(id)a3 size:(CGSize)a4;
+ (id)jpegDataForImage:(id)a3;
+ (id)resizedImage:(id)a3 forFittingSize:(CGSize)a4;
+ (id)sourceDataForImage:(id)a3;
+ (int64_t)subsampleFactorForMaxPixelSize:(int64_t)a3 imageSize:(CGSize)a4;
+ (void)clearCache;
@end

@implementation MRUImageUtilities

+ (MSVLRUDictionary)cache
{
  if (cache_onceToken != -1) {
    dispatch_once(&cache_onceToken, &__block_literal_global_26);
  }
  v2 = (void *)cache___cache;

  return (MSVLRUDictionary *)v2;
}

void __26__MRUImageUtilities_cache__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F77998]) initWithMaximumCapacity:5];
  v1 = (void *)cache___cache;
  cache___cache = v0;

  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v2 = (id)[v3 addObserverForName:0x1F0653660 object:0 queue:0 usingBlock:&__block_literal_global_40_0];
}

void __26__MRUImageUtilities_cache__block_invoke_2()
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = +[MRUImageLoaderCoordinator sharedCoordinator];
  v1 = [v0 registeredLoaderArtworkIdentifiers];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = objc_msgSend((id)cache___cache, "allValues", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        v8 = [v7 identifier];
        int v9 = [v1 containsObject:v8];

        if (v9)
        {
          [v7 cancelEvictionTimer];
        }
        else
        {
          v10 = [v7 evictionTimer];

          if (!v10) {
            [v7 startEvictionTimer];
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

+ (void)clearCache
{
  id v2 = +[MRUImageUtilities cache];
  [v2 removeAllObjects];
}

+ (id)sourceDataForImage:(id)a3
{
  [a3 CGImage];
  uint64_t v3 = (void *)CGImageCopySourceData();

  return v3;
}

+ (BOOL)imageIsJPEG:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3 && (id v5 = v3, [v5 CGImage]))
  {
    [v5 CGImage];
    v6 = MSVImageUtilitiesCopyUTTypeForImage();
    char v7 = [v6 isEqualToString:@"public.jpeg"];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (BOOL)imageIsEfficientFormat:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3 && (id v5 = v3, [v5 CGImage]))
  {
    [v5 CGImage];
    v6 = MSVImageUtilitiesCopyUTTypeForImage();
    if (([v6 isEqualToString:@"public.jpeg"] & 1) != 0
      || ([v6 isEqualToString:@"public.heic"] & 1) != 0)
    {
      char v7 = 1;
    }
    else
    {
      char v7 = [v6 isEqualToString:@"public.heif"];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (id)jpegDataForImage:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = (UIImage *)a3;
  if (!+[MRUImageUtilities imageIsJPEG:v3]
    || (+[MRUImageUtilities sourceDataForImage:v3],
        (uint64_t v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v4 = UIImageJPEGRepresentation(v3, 0.9);
    if (!v4)
    {
      id v5 = MCLogCategoryDefault();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 138412290;
        v8 = v3;
        _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_ERROR, "[MRUImageUtilities] Failed to produce JPEG data for image %@.", (uint8_t *)&v7, 0xCu);
      }

      uint64_t v4 = 0;
    }
  }

  return v4;
}

+ (id)formatImage:(id)a3 forDisplayAtSize:(CGSize)a4
{
  return +[MRUImageUtilities formatImage:withIdentifier:forDisplayAtSize:useCache:](MRUImageUtilities, "formatImage:withIdentifier:forDisplayAtSize:useCache:", a3, 0, 0, a4.width, a4.height);
}

+ (id)formatImage:(id)a3 withIdentifier:(id)a4 forDisplayAtSize:(CGSize)a5
{
  return +[MRUImageUtilities formatImage:withIdentifier:forDisplayAtSize:useCache:](MRUImageUtilities, "formatImage:withIdentifier:forDisplayAtSize:useCache:", a3, a4, 1, a5.width, a5.height);
}

+ (id)formatImage:(id)a3 withIdentifier:(id)a4 forDisplayAtSize:(CGSize)a5 useCache:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a5.height;
  double width = a5.width;
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  long long v12 = [MEMORY[0x1E4F29128] UUID];
  long long v13 = [v12 UUIDString];

  long long v14 = [MEMORY[0x1E4F770F0] currentSettings];
  int v15 = [v14 verboseImageLoadingLogging];

  if (v15)
  {
    uint64_t v16 = MCLogCategoryDefault();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v87.double width = width;
      v87.double height = height;
      v17 = NSStringFromCGSize(v87);
      *(_DWORD *)buf = 138412802;
      v80 = v13;
      __int16 v81 = 2112;
      id v82 = v10;
      __int16 v83 = 2112;
      v84 = v17;
      _os_log_impl(&dword_1AE7DF000, v16, OS_LOG_TYPE_DEFAULT, "[MRUImageUtilities] formatImageForDisplay<%@> %@ at size: %@", buf, 0x20u);
    }
  }
  if (v10)
  {
    if (!v6)
    {
      id v26 = v10;
      v20 = 0;
      goto LABEL_47;
    }
    v18 = [v11 copy];
    if (!v18)
    {
      v27 = [MEMORY[0x1E4F770F0] currentSettings];
      int v28 = [v27 verboseImageLoadingLogging];

      if (v28)
      {
        v29 = MCLogCategoryDefault();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v80 = v13;
          _os_log_impl(&dword_1AE7DF000, v29, OS_LOG_TYPE_DEFAULT, "[MRUImageUtilities] formatImageForDisplay<%@> cannot generate derived image for nil identifier. Will format original.", buf, 0xCu);
        }
      }
      id v26 = v10;
      v20 = 0;
      goto LABEL_46;
    }
    v19 = +[MRUImageUtilities cache];
    v20 = [v19 objectForKey:v18];

    uint64_t v21 = [v20 image];
    if (v21)
    {
      v22 = (void *)v21;
    }
    else
    {
      uint64_t v30 = +[MRUImageUtilities derivedSourceImageForImage:v10];
      if (!v30)
      {
        v77 = MCLogCategoryDefault();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v80 = v13;
          _os_log_impl(&dword_1AE7DF000, v77, OS_LOG_TYPE_ERROR, "[MRUImageUtilities] formatImageForDisplay<%@> returning nil because unable to create derived image.", buf, 0xCu);
        }
        v22 = 0;
        goto LABEL_82;
      }
      v22 = (void *)v30;
      v31 = [MEMORY[0x1E4F770F0] currentSettings];
      int v32 = [v31 verboseImageLoadingLogging];

      if (v32)
      {
        v33 = MCLogCategoryDefault();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          [v22 size];
          v34 = NSStringFromCGSize(v88);
          *(_DWORD *)buf = 138412802;
          v80 = v13;
          __int16 v81 = 2112;
          id v82 = v34;
          __int16 v83 = 2112;
          v84 = v18;
          _os_log_impl(&dword_1AE7DF000, v33, OS_LOG_TYPE_DEFAULT, "[MRUImageUtilities] formatImageForDisplay<%@> setting derived image of size %@ for identifier %@.", buf, 0x20u);
        }
      }
      v35 = objc_opt_new();

      [v35 setImage:v22];
      [v35 setIdentifier:v18];
      -[NSObject setFittingSize:](v35, "setFittingSize:", width, height);
      [v35 startEvictionTimer];
      v36 = +[MRUImageUtilities cache];
      [v36 setObject:v35 forKey:v18];

      v20 = v35;
    }
    [v22 size];
    if (v37 >= width && ([v22 size], v38 >= height)
      || ([v22 size], double v40 = v39, objc_msgSend(v10, "size"), v40 >= v41)
      && ([v22 size], double v43 = v42, objc_msgSend(v10, "size"), v43 >= v44))
    {
      id v26 = v22;
LABEL_42:
      if (v20)
      {
        [v20 fittingSize];
        if (v55 < width || ([v20 fittingSize], v56 < height)) {
          -[NSObject setFittingSize:](v20, "setFittingSize:", width, height);
        }
      }
LABEL_46:

LABEL_47:
      [v26 size];
      double v58 = v57;
      [v10 size];
      if (v58 > v59 || ([v26 size], double v61 = v60, objc_msgSend(v10, "size"), v61 > v62))
      {
        [v10 size];
        if (v63 >= width || ([v10 size], v64 >= height))
        {
          if (!+[MRUImageUtilities shouldTranscodeImage:v10])
          {
            id v65 = v10;

            id v26 = v65;
          }
        }
      }
      BOOL v66 = +[MRUImageUtilities shouldResizeImage:forFittingSize:](MRUImageUtilities, "shouldResizeImage:forFittingSize:", v26, width, height);
      BOOL v67 = +[MRUImageUtilities shouldTranscodeImage:v26];
      v68 = [MEMORY[0x1E4F770F0] currentSettings];
      int v69 = [v68 verboseImageLoadingLogging];

      if (v66)
      {
        if (v69)
        {
          v70 = MCLogCategoryDefault();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v80 = v13;
            _os_log_impl(&dword_1AE7DF000, v70, OS_LOG_TYPE_DEFAULT, "[MRUImageUtilities] formatImageForDisplay<%@> resizing image.", buf, 0xCu);
          }
        }
        +[MRUImageUtilities resizedImage:forFittingSize:](MRUImageUtilities, "resizedImage:forFittingSize:", v26, width, height);
        id v71 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v67)
        {
          if (v69)
          {
            v72 = MCLogCategoryDefault();
            if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v80 = v13;
              _os_log_impl(&dword_1AE7DF000, v72, OS_LOG_TYPE_DEFAULT, "[MRUImageUtilities] formatImageForDisplay<%@> transcoding image.", buf, 0xCu);
            }
          }
          v73 = +[MRUImageUtilities jpegDataForImage:v26];
          if (v73)
          {
            v25 = [MEMORY[0x1E4FB1818] imageWithData:v73];
          }
          else
          {
            v25 = 0;
          }

          goto LABEL_74;
        }
        if (v69)
        {
          v74 = MCLogCategoryDefault();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v80 = v13;
            _os_log_impl(&dword_1AE7DF000, v74, OS_LOG_TYPE_DEFAULT, "[MRUImageUtilities] formatImageForDisplay<%@> derived image is appropriate for display.", buf, 0xCu);
          }
        }
        id v71 = v26;
      }
      v25 = v71;
LABEL_74:
      v75 = [MEMORY[0x1E4F770F0] currentSettings];
      int v76 = [v75 verboseImageLoadingLogging];

      if (!v76)
      {
LABEL_84:

        goto LABEL_85;
      }
      v18 = MCLogCategoryDefault();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v80 = v13;
        __int16 v81 = 2112;
        id v82 = v25;
        _os_log_impl(&dword_1AE7DF000, v18, OS_LOG_TYPE_DEFAULT, "[MRUImageUtilities] formatImageForDisplay<%@> Result: %@", buf, 0x16u);
      }
LABEL_83:

      goto LABEL_84;
    }
    v45 = [MEMORY[0x1E4F770F0] currentSettings];
    int v46 = [v45 verboseImageLoadingLogging];

    if (v46)
    {
      v47 = MCLogCategoryDefault();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v80 = v13;
        _os_log_impl(&dword_1AE7DF000, v47, OS_LOG_TYPE_DEFAULT, "[MRUImageUtilities] formatImageForDisplay<%@> regenerating derived image.", buf, 0xCu);
      }
    }
    uint64_t v48 = +[MRUImageUtilities derivedSourceImageForImage:v10];
    if (v48)
    {
      id v26 = (id)v48;
      v49 = [MEMORY[0x1E4F770F0] currentSettings];
      int v50 = [v49 verboseImageLoadingLogging];

      if (v50)
      {
        v51 = MCLogCategoryDefault();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          [v26 size];
          v52 = NSStringFromCGSize(v89);
          *(_DWORD *)buf = 138412802;
          v80 = v13;
          __int16 v81 = 2112;
          id v82 = v52;
          __int16 v83 = 2112;
          v84 = v18;
          _os_log_impl(&dword_1AE7DF000, v51, OS_LOG_TYPE_DEFAULT, "[MRUImageUtilities] formatImageForDisplay<%@> setting regenerated derived image of size %@ for identifier %@.", buf, 0x20u);
        }
      }
      v53 = objc_opt_new();

      [v53 setImage:v26];
      [v53 setIdentifier:v18];
      -[NSObject setFittingSize:](v53, "setFittingSize:", width, height);
      [v53 startEvictionTimer];
      v54 = +[MRUImageUtilities cache];
      [v54 setObject:v53 forKey:v18];

      v20 = v53;
      goto LABEL_42;
    }
    v77 = MCLogCategoryDefault();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v80 = v13;
      _os_log_impl(&dword_1AE7DF000, v77, OS_LOG_TYPE_ERROR, "[MRUImageUtilities] formatImageForDisplay<%@> returning nil due to error in regenerating derived image", buf, 0xCu);
    }
LABEL_82:

    v25 = 0;
    id v26 = v22;
    goto LABEL_83;
  }
  v23 = [MEMORY[0x1E4F770F0] currentSettings];
  int v24 = [v23 verboseImageLoadingLogging];

  if (!v24)
  {
    v25 = 0;
    goto LABEL_86;
  }
  v20 = MCLogCategoryDefault();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v80 = v13;
    _os_log_impl(&dword_1AE7DF000, v20, OS_LOG_TYPE_DEFAULT, "[MRUImageUtilities] formatImageForDisplay<%@> returning nil for nil image.", buf, 0xCu);
  }
  v25 = 0;
LABEL_85:

LABEL_86:

  return v25;
}

+ (id)formattedImageForIdentifier:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  BOOL v6 = (void *)[a3 copy];
  int v7 = +[MRUImageUtilities cache];
  v8 = [v7 objectForKey:v6];

  uint64_t v9 = [v8 image];
  [v9 size];
  if (width >= height) {
    double v11 = width;
  }
  else {
    double v11 = height;
  }
  if (v11 <= 180.0) {
    double v12 = 4.0;
  }
  else {
    double v12 = 6.0;
  }
  if (v10 >= width - v12)
  {
    BOOL v14 = 1;
  }
  else
  {
    [v9 size];
    BOOL v14 = v13 >= height - v12;
  }
  [v8 fittingSize];
  if (v15 >= width)
  {
    BOOL v17 = 1;
  }
  else
  {
    [v8 fittingSize];
    BOOL v17 = v16 >= height;
  }
  int v18 = v14 || v17;
  if (v9) {
    BOOL v19 = v18 == 0;
  }
  else {
    BOOL v19 = 1;
  }
  if (v19)
  {
    v20 = 0;
  }
  else
  {
    v20 = +[MRUImageUtilities formatImage:withIdentifier:forDisplayAtSize:useCache:](MRUImageUtilities, "formatImage:withIdentifier:forDisplayAtSize:useCache:", v9, v6, 0, width, height);
  }

  return v20;
}

+ (id)derivedSourceImageForImage:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F29128] UUID];
  id v5 = [v4 UUIDString];

  BOOL v6 = +[MRUImageLoaderCoordinator sharedCoordinator];
  [v6 requestSize];
  double v8 = v7;

  uint64_t v9 = +[MRUImageLoaderCoordinator sharedCoordinator];
  [v9 requestSize];
  double v11 = v10;

  if (v8 < v11) {
    double v8 = v11;
  }
  BOOL v12 = +[MRUImageUtilities shouldResizeImage:forFittingSize:](MRUImageUtilities, "shouldResizeImage:forFittingSize:", v3, v8, v8);
  BOOL v13 = +[MRUImageUtilities shouldTranscodeImage:v3];
  BOOL v14 = [MEMORY[0x1E4F770F0] currentSettings];
  int v15 = [v14 verboseImageLoadingLogging];

  if (v12)
  {
    if (v15)
    {
      double v16 = MCLogCategoryDefault();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 138412290;
        int v24 = v5;
        _os_log_impl(&dword_1AE7DF000, v16, OS_LOG_TYPE_DEFAULT, "[MRUImageUtilities] derivedSourceImageForImage<%@> resizing image.", (uint8_t *)&v23, 0xCu);
      }
    }
    +[MRUImageUtilities resizedImage:forFittingSize:](MRUImageUtilities, "resizedImage:forFittingSize:", v3, v8, v8);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:
    v20 = v17;
    goto LABEL_24;
  }
  if (!v13)
  {
    if (v15)
    {
      uint64_t v21 = MCLogCategoryDefault();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 138412290;
        int v24 = v5;
        _os_log_impl(&dword_1AE7DF000, v21, OS_LOG_TYPE_DEFAULT, "[MRUImageUtilities] derivedSourceImageForImage<%@> returning original.", (uint8_t *)&v23, 0xCu);
      }
    }
    id v17 = v3;
    goto LABEL_21;
  }
  if (v15)
  {
    int v18 = MCLogCategoryDefault();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412290;
      int v24 = v5;
      _os_log_impl(&dword_1AE7DF000, v18, OS_LOG_TYPE_DEFAULT, "[MRUImageUtilities] derivedSourceImageForImage<%@> transcoding image.", (uint8_t *)&v23, 0xCu);
    }
  }
  BOOL v19 = +[MRUImageUtilities jpegDataForImage:v3];
  if (v19)
  {
    v20 = [MEMORY[0x1E4FB1818] imageWithData:v19];
  }
  else
  {
    v20 = 0;
  }

LABEL_24:

  return v20;
}

+ (BOOL)shouldTranscodeImage:(id)a3
{
  return !+[MRUImageUtilities imageIsEfficientFormat:a3];
}

+ (BOOL)shouldResizeImage:(id)a3 forFittingSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  [a3 size];
  double v8 = v6 / width;
  if (v6 / width < v7 / height) {
    double v8 = v7 / height;
  }
  double v9 = v6 - width;
  double v10 = v7 - height;
  if (v9 < v10) {
    double v9 = v10;
  }
  return v8 > 1.25 && v9 > 100.0;
}

+ (id)resizedImage:(id)a3 forFittingSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [MEMORY[0x1E4F29128] UUID];
  double v8 = [v7 UUIDString];

  double v9 = [MEMORY[0x1E4F770F0] currentSettings];
  int v10 = [v9 verboseImageLoadingLogging];

  if (v10)
  {
    double v11 = MCLogCategoryDefault();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v46.CGFloat width = width;
      v46.CGFloat height = height;
      BOOL v12 = NSStringFromCGSize(v46);
      *(_DWORD *)buf = 138412802;
      double v39 = v8;
      __int16 v40 = 2112;
      id v41 = v6;
      __int16 v42 = 2112;
      double v43 = v12;
      _os_log_impl(&dword_1AE7DF000, v11, OS_LOG_TYPE_DEFAULT, "[MRUImageUtilities] resizedImage<%@> %@ to fitting size %@", buf, 0x20u);
    }
  }
  [v6 size];
  MSVImageUtilitiesMakeBoundingBoxSize();
  double v14 = v13;
  double v16 = v15;
  CFDataRef v17 = +[MRUImageUtilities sourceDataForImage:v6];
  if (v17)
  {
    uint64_t v18 = *MEMORY[0x1E4F2FF08];
    uint64_t v36 = *MEMORY[0x1E4F2FF08];
    uint64_t v19 = MEMORY[0x1E4F1CC28];
    uint64_t v37 = MEMORY[0x1E4F1CC28];
    v20 = CGImageSourceCreateWithData(v17, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1]);
    +[MRUImageUtilities sizeFromSource:v20];
    if (v14 >= v16) {
      double v21 = v14;
    }
    else {
      double v21 = v16;
    }
    uint64_t v22 = (uint64_t)v21;
    int64_t v23 = +[MRUImageUtilities subsampleFactorForMaxPixelSize:imageSize:](MRUImageUtilities, "subsampleFactorForMaxPixelSize:imageSize:", (uint64_t)v21);
    v35[0] = v19;
    int v24 = objc_msgSend(NSNumber, "numberWithInteger:", v23, v18, *MEMORY[0x1E4F2FF58]);
    v35[1] = v24;
    v34[2] = *MEMORY[0x1E4F2F428];
    uint64_t v25 = [NSNumber numberWithInteger:v22];
    v34[3] = *MEMORY[0x1E4F2F430];
    v35[2] = v25;
    v35[3] = &unk_1F069F418;
    CFDictionaryRef v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:4];

    v27 = (__CFData *)objc_opt_new();
    int v28 = CGImageDestinationCreateWithData(v27, @"public.jpeg", 1uLL, v26);
    CGImageDestinationAddImageFromSource(v28, v20, 0, v26);
    CGImageDestinationFinalize(v28);
    v29 = [MEMORY[0x1E4FB1818] imageWithData:v27];
    uint64_t v30 = [MEMORY[0x1E4F770F0] currentSettings];
    int v31 = [v30 verboseImageLoadingLogging];

    if (v31)
    {
      int v32 = MCLogCategoryDefault();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        double v39 = v8;
        __int16 v40 = 2112;
        id v41 = v29;
        _os_log_impl(&dword_1AE7DF000, v32, OS_LOG_TYPE_DEFAULT, "[MRUImageUtilities] resizedImage<%@> Result: %@", buf, 0x16u);
      }
    }
    CFRelease(v20);
    CFRelease(v28);
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

+ (CGSize)sizeFromSource:(CGImageSource *)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = *MEMORY[0x1E4F2FF08];
  v11[0] = MEMORY[0x1E4F1CC28];
  CFDictionaryRef v3 = CGImageSourceCopyPropertiesAtIndex(a3, 0, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1]);
  uint64_t v4 = [(__CFDictionary *)v3 objectForKeyedSubscript:*MEMORY[0x1E4F2FD00]];
  id v5 = [(__CFDictionary *)v3 objectForKeyedSubscript:*MEMORY[0x1E4F2FCE8]];
  uint64_t v6 = [v4 integerValue];
  uint64_t v7 = [v5 integerValue];

  double v8 = (double)v6;
  double v9 = (double)v7;
  result.CGFloat height = v9;
  result.CGFloat width = v8;
  return result;
}

+ (int64_t)subsampleFactorForMaxPixelSize:(int64_t)a3 imageSize:(CGSize)a4
{
  if (a4.width < a4.height) {
    a4.CGFloat width = a4.height;
  }
  return vcvtmd_s64_f64(a4.width / (double)a3);
}

@end