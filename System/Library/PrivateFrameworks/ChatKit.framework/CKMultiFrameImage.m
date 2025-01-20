@interface CKMultiFrameImage
+ (BOOL)_writeASTCImagesWithCount:(unint64_t)a3 imageProvider:(id)a4 durations:(id)a5 toOutputStream:(id)a6 error:(id *)a7;
+ (BOOL)writeASTCImagesWithCount:(unint64_t)a3 imageProvider:(id)a4 durations:(id)a5 toFileURL:(id)a6 error:(id *)a7;
+ (BOOL)writeCPBitmapImagesWithCount:(unint64_t)a3 imageProvider:(id)a4 frameDurations:(id)a5 frameScales:(id)a6 toFileURL:(id)a7 error:(id *)a8;
+ (id)ASTCDataForImagesWithCount:(unint64_t)a3 imageProvider:(id)a4 durations:(id)a5 error:(id *)a6;
+ (id)firstFrameImageWithContentsOfCPBitmapURL:(id)a3 error:(id *)a4;
+ (id)multiFrameImageFromOptimizedBitmapAtFileURL:(id)a3 error:(id *)a4;
+ (id)multiFrameImageWithASTCData:(id)a3 error:(id *)a4;
+ (id)multiFrameImageWithContentsOfASTCURL:(id)a3 error:(id *)a4;
+ (id)multiFrameImageWithContentsOfCPBitmapURL:(id)a3 error:(id *)a4;
- (BOOL)writeAsASTCToURL:(id)a3 error:(id *)a4;
- (BOOL)writeAsCPBitmapToURL:(id)a3 error:(id *)a4;
- (BOOL)writeAsOptimizedBitmapToFileURL:(id)a3 error:(id *)a4;
- (CKMultiFrameImage)initWithFrameCount:(unint64_t)a3 frameProvider:(id)a4 frameDurations:(id)a5;
- (CKMultiFrameImage)initWithFrameImages:(id)a3 frameDurations:(id)a4;
- (NSArray)frameDurations;
- (id)_calculateFrameScales;
- (id)createASTCDataRepresentationWithError:(id *)a3;
- (id)frameProvider;
- (id)loadAllFrameImages;
- (unint64_t)frameCount;
@end

@implementation CKMultiFrameImage

- (CKMultiFrameImage)initWithFrameImages:(id)a3 frameDurations:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 count];
  v9 = (void *)[v7 copy];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__CKMultiFrameImage_initWithFrameImages_frameDurations___block_invoke;
  aBlock[3] = &unk_1E5628330;
  id v16 = v9;
  id v10 = v9;
  v11 = _Block_copy(aBlock);
  v12 = [(CKMultiFrameImage *)self initWithFrameCount:v8 frameProvider:v11 frameDurations:v6];

  v13 = v12;
  return v13;
}

uint64_t __56__CKMultiFrameImage_initWithFrameImages_frameDurations___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
}

- (CKMultiFrameImage)initWithFrameCount:(unint64_t)a3 frameProvider:(id)a4 frameDurations:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v9 && [v9 count] != a3)
  {
    v18 = IMLogHandleForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[CKMultiFrameImage initWithFrameCount:frameProvider:frameDurations:]();
    }

    v17 = 0;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)CKMultiFrameImage;
    v11 = [(CKMultiFrameImage *)&v20 init];
    v12 = v11;
    if (v11)
    {
      v11->_frameCount = a3;
      v13 = _Block_copy(v8);
      id frameProvider = v12->_frameProvider;
      v12->_id frameProvider = v13;

      uint64_t v15 = [v10 copy];
      frameDurations = v12->_frameDurations;
      v12->_frameDurations = (NSArray *)v15;
    }
    self = v12;
    v17 = self;
  }

  return v17;
}

- (id)loadAllFrameImages
{
  v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:self->_frameCount];
  if (self->_frameCount)
  {
    unint64_t v4 = 0;
    do
    {
      v5 = (*((void (**)(void))self->_frameProvider + 2))();
      if (v5) {
        [v3 addObject:v5];
      }

      ++v4;
    }
    while (v4 < self->_frameCount);
  }
  id v6 = (void *)[v3 copy];

  return v6;
}

- (unint64_t)frameCount
{
  return self->_frameCount;
}

- (id)frameProvider
{
  return self->_frameProvider;
}

- (NSArray)frameDurations
{
  return self->_frameDurations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameDurations, 0);

  objc_storeStrong(&self->_frameProvider, 0);
}

+ (id)multiFrameImageFromOptimizedBitmapAtFileURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (+[CKImageData supportsASTC]) {
    +[CKMultiFrameImage multiFrameImageWithContentsOfASTCURL:v5 error:a4];
  }
  else {
  id v6 = +[CKMultiFrameImage multiFrameImageWithContentsOfCPBitmapURL:v5 error:a4];
  }

  return v6;
}

- (BOOL)writeAsOptimizedBitmapToFileURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (+[CKImageData supportsASTC]) {
    BOOL v7 = [(CKMultiFrameImage *)self writeAsASTCToURL:v6 error:a4];
  }
  else {
    BOOL v7 = [(CKMultiFrameImage *)self writeAsCPBitmapToURL:v6 error:a4];
  }
  BOOL v8 = v7;

  return v8;
}

+ (id)multiFrameImageWithContentsOfASTCURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    id v15 = 0;
    BOOL v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v6 options:1 error:&v15];
    BOOL v8 = v15;
    if (v7)
    {
      id v9 = [a1 multiFrameImageWithASTCData:v7 error:a4];
      id v10 = v9;
      if (v9)
      {
        id v11 = v9;
      }
      else
      {
        v13 = IMLogHandleForCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          +[CKMultiFrameImage(ASTC_Persistence) multiFrameImageWithContentsOfASTCURL:error:]();
        }
      }
    }
    else
    {
      v12 = IMLogHandleForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[CKMultiFrameImage(ASTC_Persistence) multiFrameImageWithContentsOfASTCURL:error:]();
      }

      id v10 = 0;
      if (a4) {
        *a4 = v8;
      }
    }
  }
  else
  {
    BOOL v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[CKMultiFrameImage(ASTC_Persistence) multiFrameImageWithContentsOfASTCURL:error:]();
    }
    id v10 = 0;
  }

  return v10;
}

+ (id)multiFrameImageWithASTCData:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    BOOL v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[CKMultiFrameImage(ASTC_Persistence) multiFrameImageWithASTCData:error:]();
    }

    id v9 = 0;
    goto LABEL_19;
  }
  unint64_t v6 = [v4 length];
  int v50 = 0;
  unint64_t v48 = 0;
  uint64_t v49 = 0;
  if (v6 <= 0x13)
  {
    BOOL v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[CKMultiFrameImage(ASTC_Persistence) multiFrameImageWithASTCData:error:]();
    }
LABEL_17:
    id v9 = 0;
    goto LABEL_18;
  }
  unint64_t v10 = v6;
  objc_msgSend(v5, "getBytes:range:", &v50, v6 - 4, 4);
  if (v50 != 1129005385)
  {
    BOOL v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[CKMultiFrameImage(ASTC_Persistence) multiFrameImageWithASTCData:error:]5();
    }
    goto LABEL_17;
  }
  objc_msgSend(v5, "getBytes:range:", &v49, v10 - 12, 8);
  uint64_t v11 = v49;
  if (v49 == -1)
  {
    BOOL v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[CKMultiFrameImage(ASTC_Persistence) multiFrameImageWithASTCData:error:]();
    }
    goto LABEL_17;
  }
  unint64_t v12 = v10 - 20;
  objc_msgSend(v5, "getBytes:range:", &v48, v10 - 20, 8);
  if (v10 - 20 < v48)
  {
    BOOL v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[CKMultiFrameImage(ASTC_Persistence) multiFrameImageWithASTCData:error:].cold.4();
    }
    goto LABEL_17;
  }
  BOOL v7 = [v5 subdataWithRange:v10 - 20 - v48];
  if (!v7)
  {
    v14 = IMLogHandleForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[CKMultiFrameImage(ASTC_Persistence) multiFrameImageWithASTCData:error:].cold.5();
    }
    id v9 = 0;
    goto LABEL_67;
  }
  v14 = [MEMORY[0x1E4F28F98] propertyListWithData:v7 options:0 format:0 error:0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v15 = IMLogHandleForCategory();
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR)) {
      +[CKMultiFrameImage(ASTC_Persistence) multiFrameImageWithASTCData:error:]4();
    }
    id v9 = 0;
    goto LABEL_66;
  }
  uint64_t v15 = [v14 ckmfi_numberForKey:@"CKAnimatedImageScale"];
  uint64_t v16 = [v14 ckmfi_numberArrayForKey:@"CKMultiFrameImageFrameScales"];
  uint64_t v17 = [v14 ckmfi_numberArrayForKey:@"CKAnimatedImageDurations"];
  v18 = (void *)v17;
  if (!(v15 | v16))
  {
    v44 = IMLogHandleForCategory();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      +[CKMultiFrameImage(ASTC_Persistence) multiFrameImageWithASTCData:error:]3();
    }
    goto LABEL_64;
  }
  v40 = (void *)v17;
  v41 = v14;
  v42 = (void *)v16;
  v43 = (void *)v15;
  v44 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v11];
  if (!v11)
  {
LABEL_51:
    id v35 = [v44 copy];
    v18 = v40;
    id v9 = [[CKMultiFrameImage alloc] initWithFrameImages:v35 frameDurations:v40];

    v14 = v41;
    uint64_t v16 = (uint64_t)v42;
    uint64_t v15 = (uint64_t)v43;
    goto LABEL_65;
  }
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  v39 = v46;
  while (1)
  {
    unint64_t v47 = 0;
    if (v12 - v20 <= 7)
    {
      v36 = IMLogHandleForCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        +[CKMultiFrameImage(ASTC_Persistence) multiFrameImageWithASTCData:error:].cold.6();
      }
      goto LABEL_56;
    }
    objc_msgSend(v5, "getBytes:range:", &v47, v20, 8);
    uint64_t v21 = v20 + 8;
    unint64_t v22 = v47;
    if (v47 > v12 - v21)
    {
      v36 = IMLogHandleForCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        +[CKMultiFrameImage(ASTC_Persistence) multiFrameImageWithASTCData:error:].cold.7();
      }
LABEL_56:
      v14 = v41;
      uint64_t v16 = (uint64_t)v42;
      uint64_t v15 = (uint64_t)v43;
      v18 = v40;

      goto LABEL_64;
    }
    objc_msgSend(v5, "subdataWithRange:", v21, v47);
    CFDataRef v23 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    CFDataRef v24 = v23;
    if (!v23)
    {
      v37 = IMLogHandleForCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        +[CKMultiFrameImage(ASTC_Persistence) multiFrameImageWithASTCData:error:].cold.8();
      }
      goto LABEL_63;
    }
    v25 = CGImageSourceCreateWithData(v23, 0);
    if (!v25)
    {
      v37 = IMLogHandleForCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        +[CKMultiFrameImage(ASTC_Persistence) multiFrameImageWithASTCData:error:].cold.9();
      }
      goto LABEL_63;
    }
    v26 = v25;
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v25, 0, 0);
    CFRelease(v26);
    if (!ImageAtIndex)
    {
      v37 = IMLogHandleForCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        +[CKMultiFrameImage(ASTC_Persistence) multiFrameImageWithASTCData:error:]0();
      }
LABEL_63:
      v14 = v41;
      uint64_t v16 = (uint64_t)v42;
      uint64_t v15 = (uint64_t)v43;
      v18 = v40;

LABEL_64:
      id v9 = 0;
      goto LABEL_65;
    }
    if (v43)
    {
      [v43 doubleValue];
      double v29 = v28;
    }
    else
    {
      if (v42)
      {
        v30 = [v42 objectAtIndexedSubscript:v19];
        [v30 doubleValue];
      }
      else
      {
        v32 = IMLogHandleForCategory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          +[CKMultiFrameImage(ASTC_Persistence) multiFrameImageWithASTCData:error:]2(&buf, v46, v32);
        }

        v30 = [MEMORY[0x1E4F42D90] mainScreen];
        [v30 scale];
      }
      double v29 = v31;
    }
    uint64_t v33 = [objc_alloc(MEMORY[0x1E4F42A80]) initWithCGImage:ImageAtIndex scale:0 orientation:v29];
    if (!v33) {
      break;
    }
    v34 = (void *)v33;
    uint64_t v20 = v22 + v21;
    [v44 addObject:v33];
    CGImageRelease(ImageAtIndex);

    if (v11 == ++v19) {
      goto LABEL_51;
    }
  }
  v38 = IMLogHandleForCategory();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
    +[CKMultiFrameImage(ASTC_Persistence) multiFrameImageWithASTCData:error:]1();
  }

  id v9 = 0;
  v14 = v41;
  uint64_t v16 = (uint64_t)v42;
  uint64_t v15 = (uint64_t)v43;
  v18 = v40;
LABEL_65:

LABEL_66:
LABEL_67:

LABEL_18:
LABEL_19:

  return v9;
}

+ (id)ASTCDataForImagesWithCount:(unint64_t)a3 imageProvider:(id)a4 durations:(id)a5 error:(id *)a6
{
  unint64_t v10 = (void *)MEMORY[0x1E4F1CAA8];
  id v11 = a5;
  id v12 = a4;
  v13 = [v10 outputStreamToMemory];
  id v18 = 0;
  LOBYTE(a1) = [a1 _writeASTCImagesWithCount:a3 imageProvider:v12 durations:v11 toOutputStream:v13 error:&v18];

  id v14 = v18;
  if (a1)
  {
    uint64_t v15 = [v13 propertyForKey:*MEMORY[0x1E4F1C4C0]];
  }
  else
  {
    uint64_t v16 = IMLogHandleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[CKMultiFrameImage(ASTC_Persistence) ASTCDataForImagesWithCount:imageProvider:durations:error:]();
    }

    uint64_t v15 = 0;
    if (a6) {
      *a6 = v14;
    }
  }

  return v15;
}

+ (BOOL)writeASTCImagesWithCount:(unint64_t)a3 imageProvider:(id)a4 durations:(id)a5 toFileURL:(id)a6 error:(id *)a7
{
  if (!a6) {
    return 0;
  }
  id v12 = (void *)MEMORY[0x1E4F1CAA8];
  id v13 = a5;
  id v14 = a4;
  uint64_t v15 = [v12 outputStreamWithURL:a6 append:0];
  id v20 = 0;
  char v16 = [a1 _writeASTCImagesWithCount:a3 imageProvider:v14 durations:v13 toOutputStream:v15 error:&v20];

  id v17 = v20;
  if ((v16 & 1) == 0)
  {
    id v18 = IMLogHandleForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      +[CKMultiFrameImage(ASTC_Persistence) writeASTCImagesWithCount:imageProvider:durations:toFileURL:error:]();
    }

    if (a7) {
      *a7 = v17;
    }
  }

  return v16;
}

+ (BOOL)_writeASTCImagesWithCount:(unint64_t)a3 imageProvider:(id)a4 durations:(id)a5 toOutputStream:(id)a6 error:(id *)a7
{
  v72[3] = *MEMORY[0x1E4F143B8];
  v53 = (void (**)(id, void))a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v49 = v10;
  if (!v10 || [v10 count] == a3)
  {
    unint64_t v52 = a3;
    if (!v11)
    {
      double v28 = IMLogHandleForCategory();
      double v29 = v28;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        +[CKMultiFrameImage(ASTC_Persistence) _writeASTCImagesWithCount:imageProvider:durations:toOutputStream:error:]();
        id v14 = 0;
        BOOL v27 = 0;
        double v29 = v28;
      }
      else
      {
        id v14 = 0;
        BOOL v27 = 0;
      }
LABEL_59:

      if (a7) {
        char v45 = v27;
      }
      else {
        char v45 = 1;
      }
      if ((v45 & 1) == 0)
      {
        id v14 = v14;
        *a7 = v14;
      }
      goto LABEL_64;
    }
    [v11 open];
    uint64_t v12 = *MEMORY[0x1E4F2F4E0];
    v71[0] = *MEMORY[0x1E4F2F6C8];
    v71[1] = v12;
    v72[0] = *MEMORY[0x1E4F2F4F0];
    v72[1] = &unk_1EDF166D0;
    v71[2] = *MEMORY[0x1E4F2F500];
    v72[2] = MEMORY[0x1E4F1CC38];
    CFDictionaryRef properties = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v71 count:3];
    v51 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a3];
    data = (__CFData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
    if (a3)
    {
      uint64_t v13 = 0;
      char v47 = 0;
      id v14 = 0;
      double v15 = 0.0;
      while (1)
      {
        char v16 = (void *)MEMORY[0x192FBB780]();
        id v17 = v53[2](v53, v13);
        id v18 = v17;
        if (!v17)
        {
          v30 = IMLogHandleForCategory();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            +[CKMultiFrameImage(ASTC_Persistence) _writeASTCImagesWithCount:imageProvider:durations:toOutputStream:error:].cold.6();
          }
          goto LABEL_29;
        }
        [v17 scale];
        double v20 = v19;
        uint64_t v21 = objc_msgSend(NSNumber, "numberWithDouble:");
        [v51 setObject:v21 atIndexedSubscript:v13];

        if (v13)
        {
          if (vabdd_f64(v20, v15) > 0.01) {
            char v47 = 1;
          }
        }
        else
        {
          double v15 = v20;
        }
        unint64_t v22 = CGImageDestinationCreateWithData(data, @"org.khronos.ktx", 1uLL, 0);
        id v23 = v18;
        CGImageDestinationAddImage(v22, (CGImageRef)[v23 CGImage], properties);
        BOOL v24 = CGImageDestinationFinalize(v22);
        CFRelease(v22);
        if (!v24)
        {
          v30 = IMLogHandleForCategory();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            +[CKMultiFrameImage(ASTC_Persistence) _writeASTCImagesWithCount:imageProvider:durations:toOutputStream:error:].cold.8();
          }
LABEL_29:

          id v23 = v18;
          uint64_t v31 = (uint64_t)v14;
          goto LABEL_33;
        }
        uint64_t v70 = 0;
        uint64_t v70 = [(__CFData *)data length];
        if ([v11 write:&v70 maxLength:8] != 8) {
          break;
        }
        uint64_t v66 = 0;
        v67 = &v66;
        uint64_t v68 = 0x2020000000;
        char v69 = 0;
        unint64_t v60 = 0;
        v61 = &v60;
        uint64_t v62 = 0x3032000000;
        v63 = __Block_byref_object_copy__37;
        v64 = __Block_byref_object_dispose__37;
        id v65 = 0;
        v56[0] = MEMORY[0x1E4F143A8];
        v56[1] = 3221225472;
        v56[2] = __110__CKMultiFrameImage_ASTC_Persistence___writeASTCImagesWithCount_imageProvider_durations_toOutputStream_error___block_invoke;
        v56[3] = &unk_1E5628358;
        id v57 = v11;
        v58 = &v60;
        v59 = &v66;
        [(__CFData *)data enumerateByteRangesUsingBlock:v56];
        int v25 = *((unsigned __int8 *)v67 + 24);
        if (*((unsigned char *)v67 + 24))
        {
          v26 = (id)v61[5];

          id v14 = v26;
        }

        _Block_object_dispose(&v60, 8);
        _Block_object_dispose(&v66, 8);

        if (v25) {
          goto LABEL_34;
        }
        if (v52 == ++v13) {
          goto LABEL_35;
        }
      }
      uint64_t v31 = [v11 streamError];

      v32 = IMLogHandleForCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        +[CKMultiFrameImage(ASTC_Persistence) _writeASTCImagesWithCount:imageProvider:durations:toOutputStream:error:].cold.7();
      }

LABEL_33:
      id v14 = v31;
    }
    else
    {
      uint64_t v13 = 0;
      id v14 = 0;
      char v47 = 0;
      double v15 = 0.0;
    }
LABEL_34:
    if (v13 == v52)
    {
LABEL_35:
      id v33 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v34 = v33;
      if (v47)
      {
        [v33 setObject:v51 forKeyedSubscript:@"CKMultiFrameImageFrameScales"];
      }
      else
      {
        id v35 = [NSNumber numberWithDouble:v15];
        [v34 setObject:v35 forKeyedSubscript:@"CKAnimatedImageScale"];
      }
      if (v49) {
        [v34 setObject:v49 forKeyedSubscript:@"CKAnimatedImageDurations"];
      }
      v36 = (void *)[v34 copy];
      id v55 = 0;
      uint64_t v37 = [MEMORY[0x1E4F28F98] writePropertyList:v36 toStream:v11 format:200 options:0 error:&v55];
      v38 = v55;
      v39 = v38;
      if (v37 <= 0)
      {
        v43 = IMLogHandleForCategory();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
          +[CKMultiFrameImage(ASTC_Persistence) _writeASTCImagesWithCount:imageProvider:durations:toOutputStream:error:].cold.5();
        }

        BOOL v27 = 0;
        id v14 = v39;
        goto LABEL_58;
      }

      unint64_t v60 = v37;
      if ([v11 write:&v60 maxLength:8] == 8)
      {
        unint64_t v60 = v52;
        if ([v11 write:&v60 maxLength:8] == 8)
        {
          LODWORD(v60) = 1129005385;
          uint64_t v40 = [v11 write:&v60 maxLength:4];
          BOOL v27 = v40 == 4;
          if (v40 != 4)
          {
            uint64_t v41 = [v11 streamError];

            v42 = IMLogHandleForCategory();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
              +[CKMultiFrameImage(ASTC_Persistence) _writeASTCImagesWithCount:imageProvider:durations:toOutputStream:error:]();
            }

            goto LABEL_57;
          }
LABEL_58:
          [v11 close];

          double v29 = properties;
          goto LABEL_59;
        }
        uint64_t v41 = [v11 streamError];

        v44 = IMLogHandleForCategory();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          +[CKMultiFrameImage(ASTC_Persistence) _writeASTCImagesWithCount:imageProvider:durations:toOutputStream:error:]();
        }
      }
      else
      {
        uint64_t v41 = [v11 streamError];

        v44 = IMLogHandleForCategory();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          +[CKMultiFrameImage(ASTC_Persistence) _writeASTCImagesWithCount:imageProvider:durations:toOutputStream:error:].cold.4();
        }
      }

      BOOL v27 = 0;
LABEL_57:
      id v14 = v41;
      goto LABEL_58;
    }
    BOOL v27 = 0;
    goto LABEL_58;
  }
  id v14 = IMLogHandleForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    +[CKMultiFrameImage(ASTC_Persistence) _writeASTCImagesWithCount:imageProvider:durations:toOutputStream:error:].cold.9();
  }
  BOOL v27 = 0;
LABEL_64:

  return v27;
}

void __110__CKMultiFrameImage_ASTC_Persistence___writeASTCImagesWithCount_imageProvider_durations_toOutputStream_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (objc_msgSend(*(id *)(a1 + 32), "write:maxLength:", a2) != a4)
  {
    uint64_t v7 = [*(id *)(a1 + 32) streamError];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    id v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __110__CKMultiFrameImage_ASTC_Persistence___writeASTCImagesWithCount_imageProvider_durations_toOutputStream_error___block_invoke_cold_1(a1 + 40, v10, v11, v12, v13, v14, v15, v16);
    }

    *a5 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (BOOL)writeAsASTCToURL:(id)a3 error:(id *)a4
{
  return +[CKMultiFrameImage writeASTCImagesWithCount:self->_frameCount imageProvider:self->_frameProvider durations:self->_frameDurations toFileURL:a3 error:a4];
}

- (id)createASTCDataRepresentationWithError:(id *)a3
{
  return +[CKMultiFrameImage ASTCDataForImagesWithCount:self->_frameCount imageProvider:self->_frameProvider durations:self->_frameDurations error:a3];
}

+ (id)multiFrameImageWithContentsOfCPBitmapURL:(id)a3 error:(id *)a4
{
  CFTypeRef cf = 0;
  id v5 = [a3 path];
  id v21 = 0;
  ImagesFromPath = (void *)CPBitmapCreateImagesFromPath();
  uint64_t v7 = ImagesFromPath;
  if (ImagesFromPath)
  {
    uint64_t v8 = [ImagesFromPath count];
    if (v8)
    {
      id v10 = 0;
      uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __90__CKMultiFrameImage_CPBitmap_Persistence__multiFrameImageWithContentsOfCPBitmapURL_error___block_invoke;
      v17[3] = &unk_1E5628380;
      id v18 = 0;
      id v19 = 0;
      id v20 = v11;
      id v12 = v11;
      id v13 = 0;
      id v14 = 0;
      [v7 enumerateObjectsUsingBlock:v17];
      uint64_t v15 = [[CKMultiFrameImage alloc] initWithFrameImages:v12 frameDurations:0];

      goto LABEL_11;
    }
    id v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[CKMultiFrameImage(CPBitmap_Persistence) multiFrameImageWithContentsOfCPBitmapURL:error:]();
    }
  }
  else
  {
    id v10 = v21;
    id v9 = IMLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[CKMultiFrameImage(CPBitmap_Persistence) multiFrameImageWithContentsOfCPBitmapURL:error:]();
    }

    if (a4)
    {
      id v10 = v10;
      uint64_t v15 = 0;
      *a4 = v10;
      goto LABEL_11;
    }
  }
  uint64_t v15 = 0;
LABEL_11:

  return v15;
}

void __90__CKMultiFrameImage_CPBitmap_Persistence__multiFrameImageWithContentsOfCPBitmapURL_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  unint64_t v6 = *(void **)(a1 + 32);
  if (v6)
  {
    [v6 doubleValue];
    double v8 = v7;
  }
  else
  {
    id v9 = *(void **)(a1 + 40);
    if (v9)
    {
      id v10 = [v9 objectAtIndexedSubscript:a3];
      [v10 doubleValue];
    }
    else
    {
      id v12 = IMLogHandleForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __90__CKMultiFrameImage_CPBitmap_Persistence__multiFrameImageWithContentsOfCPBitmapURL_error___block_invoke_cold_1();
      }

      id v10 = [MEMORY[0x1E4F42D90] mainScreen];
      [v10 scale];
    }
    double v8 = v11;
  }
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F42A80]) initWithCGImage:v5 scale:0 orientation:v8];
  [*(id *)(a1 + 48) addObject:v13];
}

+ (id)firstFrameImageWithContentsOfCPBitmapURL:(id)a3 error:(id *)a4
{
  id v5 = [a3 path];
  ImagesFromPath = (void *)CPBitmapCreateImagesFromPath();
  double v7 = ImagesFromPath;
  if (!ImagesFromPath)
  {
    id v10 = 0;
    double v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[CKMultiFrameImage(CPBitmap_Persistence) multiFrameImageWithContentsOfCPBitmapURL:error:]();
    }

    if (a4)
    {
      id v10 = v10;
      id v9 = 0;
      *a4 = v10;
      goto LABEL_14;
    }
    goto LABEL_10;
  }
  if (!objc_msgSend(ImagesFromPath, "count", 0))
  {
    id v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[CKMultiFrameImage(CPBitmap_Persistence) multiFrameImageWithContentsOfCPBitmapURL:error:]();
    }
LABEL_10:
    id v9 = 0;
    goto LABEL_14;
  }
  id v10 = 0;
  double v11 = [v7 firstObject];
  id v12 = IMLogHandleForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    __90__CKMultiFrameImage_CPBitmap_Persistence__multiFrameImageWithContentsOfCPBitmapURL_error___block_invoke_cold_1();
  }

  id v13 = [MEMORY[0x1E4F42D90] mainScreen];
  [v13 scale];
  double v15 = v14;

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F42A80]) initWithCGImage:v11 scale:0 orientation:v15];
LABEL_14:

  return v9;
}

+ (BOOL)writeCPBitmapImagesWithCount:(unint64_t)a3 imageProvider:(id)a4 frameDurations:(id)a5 frameScales:(id)a6 toFileURL:(id)a7 error:(id *)a8
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v12 = (void (**)(id, unint64_t))a4;
  id v45 = a5;
  id v44 = a6;
  id v43 = a7;
  id v13 = [v43 path];
  if (![v13 length])
  {
    double v15 = IMLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[CKMultiFrameImage(CPBitmap_Persistence) writeCPBitmapImagesWithCount:imageProvider:frameDurations:frameScales:toFileURL:error:]();
    }
    goto LABEL_15;
  }
  if (v45 && [v45 count] != a3)
  {
    double v15 = IMLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[CKMultiFrameImage(CPBitmap_Persistence) writeCPBitmapImagesWithCount:imageProvider:frameDurations:frameScales:toFileURL:error:].cold.6();
    }
    goto LABEL_15;
  }
  if ([v44 count] != a3)
  {
    double v15 = IMLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[CKMultiFrameImage(CPBitmap_Persistence) writeCPBitmapImagesWithCount:imageProvider:frameDurations:frameScales:toFileURL:error:].cold.5();
    }
LABEL_15:

    BOOL v16 = 0;
    goto LABEL_50;
  }
  uint64_t v54 = 0;
  id v55 = &v54;
  uint64_t v56 = 0x2020000000;
  char v57 = 1;
  uint64_t v50 = 0;
  v51 = (double *)&v50;
  uint64_t v52 = 0x2020000000;
  uint64_t v53 = 0;
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __129__CKMultiFrameImage_CPBitmap_Persistence__writeCPBitmapImagesWithCount_imageProvider_frameDurations_frameScales_toFileURL_error___block_invoke;
  v49[3] = &unk_1E56283A8;
  v49[4] = &v50;
  v49[5] = &v54;
  [v44 enumerateObjectsUsingBlock:v49];
  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (*((unsigned char *)v55 + 24))
  {
    double v14 = [NSNumber numberWithDouble:v51[3]];
    [v41 setObject:v14 forKeyedSubscript:@"CKMultiFrameImageFrameScales"];
  }
  else if (v44)
  {
    [v41 setObject:v44 forKeyedSubscript:@"CKMultiFrameImageFrameScales"];
  }
  if (v45) {
    [v41 setObject:v45 forKeyedSubscript:@"CKAnimatedImageDurations"];
  }
  id v48 = 0;
  uint64_t v40 = (void *)[v41 copy];
  id v17 = (const void *)CPBitmapWriterCreate();
  if (!v17)
  {
    int v25 = IMLogHandleForCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      +[CKMultiFrameImage(CPBitmap_Persistence) writeCPBitmapImagesWithCount:v26 imageProvider:v27 frameDurations:v28 frameScales:v29 toFileURL:v30 error:v31];
    }

    BOOL v16 = 0;
    goto LABEL_46;
  }
  unint64_t v18 = 0;
  if (!a3)
  {
    char v19 = 1;
    goto LABEL_38;
  }
  char v19 = 1;
  do
  {
    id v20 = (void *)MEMORY[0x192FBB780]();
    id v21 = v12[2](v12, v18);
    unint64_t v22 = v21;
    if (v21)
    {
      [v21 CGImage];
      if (CPBitmapWriterAddImage())
      {
        int v23 = 1;
        goto LABEL_31;
      }
      BOOL v24 = IMLogHandleForCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint8_t buf = 138412290;
        id v59 = v48;
        _os_log_error_impl(&dword_18EF18000, v24, OS_LOG_TYPE_ERROR, "Failed to add image to cpbitmap file, stopping serialization. Error: %@", buf, 0xCu);
      }
    }
    else
    {
      BOOL v24 = IMLogHandleForCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        +[CKMultiFrameImage(CPBitmap_Persistence) writeCPBitmapImagesWithCount:imageProvider:frameDurations:frameScales:toFileURL:error:].cold.4(&v46, v47, v24);
      }
    }

    int v23 = 0;
    char v19 = 0;
LABEL_31:

    if (!v23) {
      goto LABEL_38;
    }
    ++v18;
  }
  while (a3 != v18);
  unint64_t v18 = a3;
LABEL_38:
  if (v18 == a3 && (v19 & 1) != 0)
  {
    if (CPBitmapWriterFinalize())
    {
      char v19 = 1;
    }
    else
    {
      v32 = IMLogHandleForCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        +[CKMultiFrameImage(CPBitmap_Persistence) writeCPBitmapImagesWithCount:v33 imageProvider:v34 frameDurations:v35 frameScales:v36 toFileURL:v37 error:v38];
      }

      char v19 = 0;
    }
  }
  CFRelease(v17);
  BOOL v16 = v19 & 1;
LABEL_46:
  if (a8 && !v16) {
    *a8 = v48;
  }

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);
LABEL_50:

  return v16;
}

uint64_t __129__CKMultiFrameImage_CPBitmap_Persistence__writeCPBitmapImagesWithCount_imageProvider_frameDurations_frameScales_toFileURL_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 doubleValue];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  if (a3)
  {
    if (vabdd_f64(*(double *)(v9 + 24), v8) > 0.01)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      *a4 = 1;
    }
  }
  else
  {
    *(double *)(v9 + 24) = v8;
  }
  return result;
}

- (id)_calculateFrameScales
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:self->_frameCount];
  if (self->_frameCount)
  {
    unint64_t v4 = 0;
    do
    {
      id v5 = (*((void (**)(void))self->_frameProvider + 2))();
      [v5 scale];
      unint64_t v6 = objc_msgSend(NSNumber, "numberWithDouble:");
      [v3 addObject:v6];

      ++v4;
    }
    while (v4 < self->_frameCount);
  }
  double v7 = (void *)[v3 copy];

  return v7;
}

- (BOOL)writeAsCPBitmapToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  double v7 = [(CKMultiFrameImage *)self _calculateFrameScales];
  unint64_t frameCount = self->_frameCount;
  id frameProvider = self->_frameProvider;
  frameDurations = self->_frameDurations;
  id v15 = 0;
  BOOL v11 = +[CKMultiFrameImage writeCPBitmapImagesWithCount:frameCount imageProvider:frameProvider frameDurations:frameDurations frameScales:v7 toFileURL:v6 error:&v15];

  id v12 = v15;
  if (!v11)
  {
    id v13 = IMLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CKMultiFrameImage(CPBitmap_Persistence) writeAsCPBitmapToURL:error:]();
    }

    if (a4) {
      *a4 = v12;
    }
  }

  return v11;
}

- (void)initWithFrameCount:frameProvider:frameDurations:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Frame duration count does not match frame count, not initializing", v2, v3, v4, v5, v6);
}

void __110__CKMultiFrameImage_ASTC_Persistence___writeASTCImagesWithCount_imageProvider_durations_toOutputStream_error___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __90__CKMultiFrameImage_CPBitmap_Persistence__multiFrameImageWithContentsOfCPBitmapURL_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Image did not include a scale in metadata, using display scale", v2, v3, v4, v5, v6);
}

@end