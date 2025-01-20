@interface INUIImageSizeProvider
+ ($F24F406B2B787EFB06265DBA3D28CBD5)imageSizeForImage:(id)a3;
+ (id)downscaledPNGImageForImage:(id)a3 size:(id)a4 error:(id *)a5;
@end

@implementation INUIImageSizeProvider

+ (id)downscaledPNGImageForImage:(id)a3 size:(id)a4 error:(id *)a5
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  v83[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = v8;
  if (var0 == 0.0 || var1 == 0.0)
  {
    if (!a5)
    {
      id v16 = 0;
      goto LABEL_43;
    }
    v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F0F768];
    uint64_t v82 = *MEMORY[0x263F07F80];
    CFDataRef v10 = [NSString stringWithFormat:@"Image size is zero"];
    v83[0] = v10;
    CFURLRef v12 = [NSDictionary dictionaryWithObjects:v83 forKeys:&v82 count:1];
    [v14 errorWithDomain:v15 code:6009 userInfo:v12];
    id v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_42;
  }
  CFDataRef v10 = [v8 _imageData];
  CFURLRef v11 = [v9 _uri];
  CFURLRef v12 = v11;
  if (v10)
  {
    CGImageSourceRef v13 = CGImageSourceCreateWithData(v10, 0);
    goto LABEL_10;
  }
  if (v11)
  {
    CGImageSourceRef v13 = CGImageSourceCreateWithURL(v11, 0);
LABEL_10:
    v17 = v13;
    if (v13)
    {
      uint64_t v78 = *MEMORY[0x263F0F600];
      uint64_t v79 = MEMORY[0x263EFFA80];
      CFDictionaryRef v18 = [NSDictionary dictionaryWithObjects:&v79 forKeys:&v78 count:1];
      CFDictionaryRef v19 = CGImageSourceCopyPropertiesAtIndex(v17, 0, v18);
      v20 = v19;
      if (!v19)
      {
        CFRelease(v17);
        if (!a5)
        {
          v20 = 0;
          id v16 = 0;
          goto LABEL_41;
        }
        v30 = (void *)MEMORY[0x263F087E8];
        uint64_t v31 = *MEMORY[0x263F0F768];
        uint64_t v76 = *MEMORY[0x263F07F80];
        v21 = [NSString stringWithFormat:@"Current image size unknown"];
        v77 = v21;
        v57 = [NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
        objc_msgSend(v30, "errorWithDomain:code:userInfo:", v31, 6009);
        id v16 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_40;
      }
      v21 = [(__CFDictionary *)v19 objectForKey:*MEMORY[0x263F0F4F8]];
      uint64_t v22 = [v20 objectForKey:*MEMORY[0x263F0F4F0]];
      v57 = (void *)v22;
      if (!v21 || (v23 = (void *)v22) == 0)
      {
        CFRelease(v17);
        if (a5)
        {
          v32 = (void *)MEMORY[0x263F087E8];
          uint64_t v33 = *MEMORY[0x263F0F768];
          uint64_t v74 = *MEMORY[0x263F07F80];
          [NSString stringWithFormat:@"Current image size unknown"];
          v34 = v55 = v21;
          v75 = v34;
          v35 = [NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
          *a5 = [v32 errorWithDomain:v33 code:6009 userInfo:v35];

          v21 = v55;
        }
        id v16 = 0;
        goto LABEL_40;
      }
      [v21 doubleValue];
      double v25 = v24;
      [v23 doubleValue];
      if (var0 >= v25 || var1 >= v26)
      {
        CFRelease(v17);
        id v16 = v9;
LABEL_40:

        goto LABEL_41;
      }
      double v36 = v26;
      v56 = v21;
      v72[0] = *MEMORY[0x263F0F638];
      if (v25 <= v26) {
        double v37 = var1;
      }
      else {
        double v37 = var0;
      }
      v38 = [NSNumber numberWithDouble:v37];
      v72[1] = *MEMORY[0x263F0F5A8];
      uint64_t v39 = *MEMORY[0x263EFFB40];
      v73[0] = v38;
      v73[1] = v39;
      CFDictionaryRef v40 = [NSDictionary dictionaryWithObjects:v73 forKeys:v72 count:2];

      ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v17, 0, v40);
      if (v10)
      {
        CFDictionaryRef v54 = v40;
        v42 = (__CFData *)objc_alloc_init(MEMORY[0x263EFF990]);
        v43 = [(id)*MEMORY[0x263F1DC08] identifier];
        v44 = ThumbnailAtIndex;
        v45 = CGImageDestinationCreateWithData(v42, v43, 1uLL, 0);

        v46 = v42;
        v47 = v44;
        CGImageDestinationAddImage(v45, v44, 0);
        CGImageDestinationFinalize(v45);
        id v16 = [MEMORY[0x263F0FB88] imageWithImageData:v46];
        if (v45) {
          CFRelease(v45);
        }
      }
      else
      {
        if (!v12)
        {
          id v16 = 0;
          v21 = v56;
          goto LABEL_35;
        }
        CFDictionaryRef v54 = v40;
        v51 = [(id)*MEMORY[0x263F1DC08] identifier];
        v52 = ThumbnailAtIndex;
        v53 = CGImageDestinationCreateWithURL(v12, v51, 1uLL, 0);

        v47 = v52;
        CGImageDestinationAddImage(v53, v52, 0);
        CGImageDestinationFinalize(v53);
        id v16 = [MEMORY[0x263F0FB88] imageWithURL:v12];
        if (v53) {
          CFRelease(v53);
        }
      }
      ThumbnailAtIndex = v47;
      CFDictionaryRef v40 = v54;
      v21 = v56;
LABEL_35:
      objc_msgSend(v16, "_setImageSize:", var0, var1);
      CGImageRelease(ThumbnailAtIndex);
      CFRelease(v17);
      v48 = *MEMORY[0x263F0F810];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_INFO))
      {
        v49 = @"data";
        *(_DWORD *)buf = 136316674;
        v59 = "+[INUIImageSizeProvider downscaledPNGImageForImage:size:error:]";
        if (!v10) {
          v49 = @"URL";
        }
        __int16 v60 = 2112;
        v61 = v49;
        __int16 v62 = 2112;
        v63 = v9;
        __int16 v64 = 2048;
        double v65 = v25;
        __int16 v66 = 2048;
        double v67 = v36;
        __int16 v68 = 2048;
        double v69 = var0;
        __int16 v70 = 2048;
        double v71 = var1;
        _os_log_impl(&dword_20A3EB000, v48, OS_LOG_TYPE_INFO, "%s Scaled %@ image %@ from size {%f, %f} to size {%f, %f}", buf, 0x48u);
      }

      goto LABEL_40;
    }
  }
  if (a5)
  {
    v28 = (void *)MEMORY[0x263F087E8];
    uint64_t v29 = *MEMORY[0x263F0F768];
    uint64_t v80 = *MEMORY[0x263F07F80];
    CFDictionaryRef v18 = [NSString stringWithFormat:@"Image is invalid"];
    CFDictionaryRef v81 = v18;
    v20 = [NSDictionary dictionaryWithObjects:&v81 forKeys:&v80 count:1];
    [v28 errorWithDomain:v29 code:6009 userInfo:v20];
    id v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_41:

    goto LABEL_42;
  }
  id v16 = 0;
LABEL_42:

LABEL_43:

  return v16;
}

+ ($F24F406B2B787EFB06265DBA3D28CBD5)imageSizeForImage:(id)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  CFDataRef v4 = [v3 _imageData];
  CFURLRef v5 = [v3 _uri];

  if (v4)
  {
    CGImageSourceRef v6 = CGImageSourceCreateWithData(v4, 0);
  }
  else
  {
    if (!v5)
    {
LABEL_8:
      double v13 = 0.0;
      double v15 = 0.0;
      goto LABEL_11;
    }
    CGImageSourceRef v6 = CGImageSourceCreateWithURL(v5, 0);
  }
  v7 = v6;
  if (!v6) {
    goto LABEL_8;
  }
  uint64_t v18 = *MEMORY[0x263F0F600];
  v19[0] = MEMORY[0x263EFFA80];
  CFDictionaryRef v8 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
  CFDictionaryRef v9 = CGImageSourceCopyPropertiesAtIndex(v7, 0, v8);
  CFRelease(v7);
  if (v9)
  {
    CFDataRef v10 = [(__CFDictionary *)v9 objectForKey:*MEMORY[0x263F0F4F8]];
    CFURLRef v11 = [(__CFDictionary *)v9 objectForKey:*MEMORY[0x263F0F4F0]];
    [v10 doubleValue];
    double v13 = v12;
    [v11 doubleValue];
    double v15 = v14;
  }
  else
  {
    double v13 = 0.0;
    double v15 = 0.0;
  }

LABEL_11:
  double v16 = v13;
  double v17 = v15;
  result.double var1 = v17;
  result.double var0 = v16;
  return result;
}

@end