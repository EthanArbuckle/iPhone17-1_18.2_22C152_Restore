@interface LPImage
+ (BOOL)supportsSecureCoding;
+ (id)_PDFImageNamed:(id)a3 template:(BOOL)a4;
+ (id)_PNGImageNamed:(id)a3;
+ (id)_PNGImageNamed:(id)a3 template:(BOOL)a4 properties:(id)a5;
+ (id)_loadImageSubsampledToScreenSizeFromData:(id)a3;
+ (id)_systemImageNamed:(id)a3;
+ (id)_systemImageNamed:(id)a3 withSymbolConfiguration:(id)a4;
- (BOOL)_canEncodeWithoutComputation;
- (BOOL)_hasTransparency;
- (BOOL)_isAnimated;
- (BOOL)_isFallbackIcon;
- (BOOL)_isImperceptible;
- (BOOL)_isLowResolutionAsIconWithScaleFactor:(double)a3;
- (BOOL)_isLowResolutionAsImage;
- (BOOL)_isNonFallbackSymbolImage;
- (BOOL)_isPrecomposedAppIcon;
- (BOOL)_isSubstitute;
- (BOOL)_useLossyCompressionForEncodedData;
- (BOOL)hasPlaceholderValueForAsynchronousLoad;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsAsynchronousLoad;
- (CGSize)_pixelSize;
- (LPImage)_darkInterfaceAlternativeImage;
- (LPImage)init;
- (LPImage)initWithCoder:(id)a3;
- (LPImage)initWithData:(id)a3 MIMEType:(id)a4;
- (LPImage)initWithData:(id)a3 MIMEType:(id)a4 properties:(id)a5;
- (LPImage)initWithItemProvider:(id)a3 properties:(id)a4 placeholderImage:(id)a5;
- (LPImage)initWithPlatformImage:(id)a3;
- (LPImage)initWithPlatformImage:(id)a3 properties:(id)a4;
- (LPImageProperties)properties;
- (NSArray)_remoteURLsForEmailCompatibleOutput;
- (NSData)_cachedAtomicData;
- (NSData)data;
- (NSItemProvider)_itemProvider;
- (NSString)MIMEType;
- (NSString)_srcsetForRemoteURLs;
- (NSString)_symbolName;
- (NSURL)fileURL;
- (OS_dispatch_group)_asynchronousLoadGroup;
- (UIImage)platformImage;
- (id)_alternateHTMLImageGenerator;
- (id)_asTemplate;
- (id)_existingPlatformImage;
- (id)_initWithCGImage:(CGImage *)a3;
- (id)_initWithCGImage:(CGImage *)a3 properties:(id)a4;
- (id)_initWithImage:(id)a3;
- (id)_initWithImage:(id)a3 properties:(id)a4;
- (id)_initWithPlatformImageGenerator:(id)a3 properties:(id)a4;
- (id)filledVariant;
- (id)initByReferencingFileURL:(id)a3 MIMEType:(id)a4;
- (id)initByReferencingFileURL:(id)a3 MIMEType:(id)a4 properties:(id)a5;
- (unint64_t)_encodedSize;
- (unint64_t)hash;
- (void)_computeDominantColorForProperties;
- (void)_createDataFromPlatformImage;
- (void)_mapDataFromFileURL;
- (void)_setAsynchronousLoadGroup:(id)a3;
- (void)_setDarkInterfaceAlternativeImage:(id)a3;
- (void)_synchronouslyDecodePlatformImageWithMaximumSize:(CGSize)a3;
- (void)_waitForAsynchronouslyLoadedImageIfNeeded;
- (void)encodeWithCoder:(id)a3;
- (void)loadAsynchronouslyWithCompletionHandler:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setPlatformImage:(id)a3;
- (void)set_alternateHTMLImageGenerator:(id)a3;
- (void)set_cachedAtomicData:(id)a3;
- (void)set_fallbackIcon:(BOOL)a3;
- (void)set_isNonFallbackSymbolImage:(BOOL)a3;
- (void)set_precomposedAppIcon:(BOOL)a3;
- (void)set_remoteURLsForEmailCompatibleOutput:(id)a3;
- (void)set_useLossyCompressionForEncodedData:(BOOL)a3;
@end

@implementation LPImage

- (LPImage)init
{
  return 0;
}

- (id)_initWithImage:(id)a3
{
  id v4 = a3;
  if (v4
    && (v14.receiver = self,
        v14.super_class = (Class)LPImage,
        v5 = [(LPImage *)&v14 init],
        (self = v5) != 0))
  {
    objc_storeStrong((id *)&v5->_originalPlatformImage, *((id *)v4 + 1));
    objc_storeStrong((id *)&self->_decodedPlatformImage, *((id *)v4 + 2));
    objc_storeStrong((id *)&self->_platformImage, *((id *)v4 + 15));
    self->_isNonFallbackSymbolImage = *((unsigned char *)v4 + 88);
    v6 = [v4 _cachedAtomicData];
    v7 = (void *)[v6 copy];
    [(LPImage *)self set_cachedAtomicData:v7];

    v8 = (NSString *)[*((id *)v4 + 3) copy];
    MIMEType = self->_MIMEType;
    self->_MIMEType = v8;

    objc_storeStrong((id *)&self->_fileURL, *((id *)v4 + 16));
    v10 = (LPImageProperties *)[*((id *)v4 + 4) copy];
    properties = self->_properties;
    self->_properties = v10;

    self = self;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_initWithImage:(id)a3 properties:(id)a4
{
  id v7 = a4;
  v8 = [(LPImage *)self _initWithImage:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(v8 + 4, a4);
    v10 = v9;
  }

  return v9;
}

- (LPImage)initWithData:(id)a3 MIMEType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init(LPImageProperties);
  v9 = [(LPImage *)self initWithData:v6 MIMEType:v7 properties:v8];

  if (v9) {
    v10 = v9;
  }

  return v9;
}

- (LPImage)initWithData:(id)a3 MIMEType:(id)a4 properties:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)LPImage;
  v11 = [(LPImage *)&v16 init];
  if (v11)
  {
    if (!v8) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Trying to create an LPImage with nil data."];
    }
    if (!v9) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Trying to create an LPImage with nil MIME type."];
    }
    [(LPImage *)v11 set_cachedAtomicData:v8];
    objc_storeStrong((id *)&v11->_MIMEType, a4);
    uint64_t v12 = [v10 copy];
    properties = v11->_properties;
    v11->_properties = (LPImageProperties *)v12;

    objc_super v14 = v11;
  }

  return v11;
}

- (id)initByReferencingFileURL:(id)a3 MIMEType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(LPImageProperties);
  id v9 = [(LPImage *)self initByReferencingFileURL:v6 MIMEType:v7 properties:v8];

  if (v9) {
    id v10 = v9;
  }

  return v9;
}

- (id)initByReferencingFileURL:(id)a3 MIMEType:(id)a4 properties:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)LPImage;
  v11 = [(LPImage *)&v16 init];
  if (!v11) {
    goto LABEL_10;
  }
  if (!v8) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Trying to create an LPImage with nil file URL."];
  }
  if (!v9) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Trying to create an LPImage with nil MIME type."];
  }
  if (([v8 isFileURL] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Trying to create an LPImage with URL which is not a file URL."];
  }
  if ([v8 checkResourceIsReachableAndReturnError:0])
  {
    [(LPImage *)v11 setFileURL:v8];
    objc_storeStrong((id *)&v11->_MIMEType, a4);
    uint64_t v12 = [v10 copy];
    properties = v11->_properties;
    v11->_properties = (LPImageProperties *)v12;

    objc_super v14 = v11;
  }
  else
  {
LABEL_10:
    objc_super v14 = 0;
  }

  return v14;
}

- (LPImage)initWithPlatformImage:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(LPImageProperties);
  id v6 = [(LPImage *)self initWithPlatformImage:v4 properties:v5];

  if (v6) {
    id v7 = v6;
  }

  return v6;
}

- (LPImage)initWithPlatformImage:(id)a3 properties:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v12 = LPLogChannelImage();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[LPImage initWithPlatformImage:properties:](v12);
    }
    id v10 = 0;
    goto LABEL_7;
  }
  v14.receiver = self;
  v14.super_class = (Class)LPImage;
  id v9 = [(LPImage *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_originalPlatformImage, a3);
    uint64_t v11 = [v8 copy];
    self = (LPImage *)v10->_properties;
    v10->_properties = (LPImageProperties *)v11;
LABEL_7:
  }
  return v10;
}

- (LPImage)initWithItemProvider:(id)a3 properties:(id)a4 placeholderImage:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = v11;
  if (v11)
  {
    v13 = [v11 data];
    objc_super v14 = [v12 MIMEType];
    v15 = [(LPImage *)self initWithData:v13 MIMEType:v14];

    if (!v15) {
      goto LABEL_8;
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)LPImage;
    v15 = [(LPImage *)&v18 init];
    if (!v15) {
      goto LABEL_8;
    }
  }
  objc_storeStrong((id *)&v15->_itemProvider, a3);
  if (v10) {
    objc_storeStrong((id *)&v15->_properties, a4);
  }
  objc_super v16 = v15;
LABEL_8:

  return v15;
}

- (id)_initWithCGImage:(CGImage *)a3
{
  v5 = objc_alloc_init(LPImageProperties);
  id v6 = [(LPImage *)self _initWithCGImage:a3 properties:v5];

  return v6;
}

- (id)_initWithCGImage:(CGImage *)a3 properties:(id)a4
{
  id v6 = a4;
  id v7 = objc_msgSend(MEMORY[0x1E4FB1818], "_lp_createImageWithCGImage:", a3);
  id v8 = [(LPImage *)self initWithPlatformImage:v7 properties:v6];

  if (v8)
  {
    v8->_isAnimated = 0;
    v8->_hasComputedIsAnimated = 1;
    id v9 = v8;
  }

  return v8;
}

+ (id)_systemImageNamed:(id)a3
{
  v3 = +[LPImage _systemImageNamed:a3 withSymbolConfiguration:0];

  return v3;
}

+ (id)_systemImageNamed:(id)a3 withSymbolConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(MEMORY[0x1E4FB1818], "_lp_systemImageNamed:", v6);
  id v9 = v8;
  if (v8)
  {
    if (v7)
    {
      uint64_t v10 = objc_msgSend(v8, "_lp_imageByApplyingSymbolConfiguration:", v7);

      id v9 = (void *)v10;
    }
    id v11 = [[LPImage alloc] initWithPlatformImage:v9];
    objc_storeStrong((id *)&v11->_symbolName, a3);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)_initWithPlatformImageGenerator:(id)a3 properties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)LPImage;
  id v8 = [(LPImage *)&v20 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    properties = v8->_properties;
    v8->_properties = (LPImageProperties *)v9;

    dispatch_group_t v11 = dispatch_group_create();
    [(LPImage *)v8 _setAsynchronousLoadGroup:v11];

    uint64_t v12 = [(LPImage *)v8 _asynchronousLoadGroup];
    dispatch_group_enter(v12);

    if (asyncImageLoadingSerialRequestQueue_onceToken != -1) {
      dispatch_once(&asyncImageLoadingSerialRequestQueue_onceToken, &__block_literal_global_331);
    }
    v13 = asyncImageLoadingSerialRequestQueue_queue;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __54__LPImage__initWithPlatformImageGenerator_properties___block_invoke;
    v17[3] = &unk_1E5B04F80;
    id v19 = v6;
    objc_super v14 = v8;
    objc_super v18 = v14;
    dispatch_async(v13, v17);
    v15 = v14;
  }
  return v8;
}

void __54__LPImage__initWithPlatformImageGenerator_properties___block_invoke(uint64_t a1)
{
  v2 = MIMETypeForDataCreatedFromPlatformImage_block_invoke_limitSemaphore;
  if (!MIMETypeForDataCreatedFromPlatformImage_block_invoke_limitSemaphore)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(4);
    id v4 = (void *)MIMETypeForDataCreatedFromPlatformImage_block_invoke_limitSemaphore;
    MIMETypeForDataCreatedFromPlatformImage_block_invoke_limitSemaphore = (uint64_t)v3;

    v2 = MIMETypeForDataCreatedFromPlatformImage_block_invoke_limitSemaphore;
  }
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  if (asyncImageLoadingQueue_onceToken != -1) {
    dispatch_once(&asyncImageLoadingQueue_onceToken, &__block_literal_global_334);
  }
  v5 = asyncImageLoadingQueue_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__LPImage__initWithPlatformImageGenerator_properties___block_invoke_2;
  v6[3] = &unk_1E5B04F80;
  id v8 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  dispatch_async(v5, v6);
}

void __54__LPImage__initWithPlatformImageGenerator_properties___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __54__LPImage__initWithPlatformImageGenerator_properties___block_invoke_3;
  v2[3] = &unk_1E5B04F58;
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

void __54__LPImage__initWithPlatformImageGenerator_properties___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  v5 = LPLogChannelImage();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v8 = 134218240;
    uint64_t v9 = v6;
    __int16 v10 = 1024;
    BOOL v11 = v4 != 0;
    _os_log_impl(&dword_1A35DC000, v5, OS_LOG_TYPE_INFO, "LPImage<%p>: finished loading async image (success: %d)", (uint8_t *)&v8, 0x12u);
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), a2);
  id v7 = [*(id *)(a1 + 32) _asynchronousLoadGroup];
  dispatch_group_leave(v7);

  dispatch_semaphore_signal((dispatch_semaphore_t)MIMETypeForDataCreatedFromPlatformImage_block_invoke_limitSemaphore);
  [*(id *)(a1 + 32) _setAsynchronousLoadGroup:0];
}

- (void)_computeDominantColorForProperties
{
  id v3 = [(LPImage *)self platformImage];
  objc_msgSend(v3, "_lp_dominantColors");
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  -[LPImageProperties setHasSingleDominantColor:](self->_properties, "setHasSingleDominantColor:", [v5 count] == 1);
  id v4 = [v5 firstObject];
  [(LPImageProperties *)self->_properties setDominantColor:v4];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LPImage;
  if (![(LPImage *)&v13 isEqual:v4])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v5 = 0;
      goto LABEL_17;
    }
    uint64_t v6 = (void **)v4;
    if (objectsAreEqual(v6[1], self->_originalPlatformImage))
    {
      id v7 = [v6 _cachedAtomicData];
      int v8 = [(LPImage *)self _cachedAtomicData];
      char v9 = objectsAreEqual(v7, v8);

      if ((v9 & 1) != 0
        && objectsAreEqual(v6[3], self->_MIMEType)
        && objectsAreEqual(v6[16], self->_fileURL)
        && objectsAreEqual(v6[4], self->_properties)
        && !v6[5]
        && !self->_itemProvider)
      {
        __int16 v10 = [v6 _asynchronousLoadGroup];
        if (v10)
        {
        }
        else
        {
          BOOL v11 = [(LPImage *)self _asynchronousLoadGroup];

          if (!v11)
          {
            BOOL v5 = *((unsigned __int8 *)v6 + 88) == self->_isNonFallbackSymbolImage;
            goto LABEL_16;
          }
        }
      }
    }
    BOOL v5 = 0;
LABEL_16:

    goto LABEL_17;
  }
  BOOL v5 = 1;
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  id v3 = [(LPImage *)self _cachedAtomicData];
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_MIMEType hash] ^ v4;

  return v5;
}

- (void)_waitForAsynchronouslyLoadedImageIfNeeded
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A35DC000, a2, OS_LOG_TYPE_ERROR, "LPImage<%p>: taking too long in _waitForAsynchronouslyLoadedImageIfNeeded", (uint8_t *)&v2, 0xCu);
}

+ (id)_PNGImageNamed:(id)a3
{
  uint64_t v3 = [a1 _PNGImageNamed:a3 template:0 properties:0];

  return v3;
}

+ (id)_PNGImageNamed:(id)a3 template:(BOOL)a4 properties:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  unint64_t v9 = +[LPTestingOverrides forceImageLoadingScaleFactor];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  id v28 = 0;
  __int16 v10 = [LPImage alloc];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __46__LPImage__PNGImageNamed_template_properties___block_invoke;
  v18[3] = &unk_1E5B04FA8;
  objc_super v20 = &v23;
  unint64_t v21 = v9;
  id v11 = v7;
  id v19 = v11;
  BOOL v22 = a4;
  uint64_t v12 = [(LPImage *)v10 _initWithPlatformImageGenerator:v18 properties:v8];
  objc_super v13 = (void *)v24[5];
  v24[5] = v12;

  objc_super v14 = LPLogChannelImage();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = v24[5];
    *(_DWORD *)buf = 134218242;
    uint64_t v30 = v15;
    __int16 v31 = 2112;
    id v32 = v11;
    _os_log_impl(&dword_1A35DC000, v14, OS_LOG_TYPE_INFO, "LPImage<%p>: created async image for %@", buf, 0x16u);
  }
  id v16 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v16;
}

void __46__LPImage__PNGImageNamed_template_properties___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  uint64_t v4 = LPLogChannelImage();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v17 = 134217984;
    uint64_t v18 = v5;
    _os_log_impl(&dword_1A35DC000, v4, OS_LOG_TYPE_INFO, "LPImage<%p>: started loading async image", (uint8_t *)&v17, 0xCu);
  }
  if (!*(void *)(a1 + 48)) {
    goto LABEL_5;
  }
  uint64_t v6 = (void *)MEMORY[0x1E4FB1818];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = linkPresentationBundle();
  unint64_t v9 = [MEMORY[0x1E4FB1E20] traitCollectionWithDisplayScale:(double)*(unint64_t *)(a1 + 48)];
  __int16 v10 = [v6 imageNamed:v7 inBundle:v8 compatibleWithTraitCollection:v9];

  if (!v10)
  {
LABEL_5:
    id v11 = (void *)MEMORY[0x1E4FB1818];
    uint64_t v12 = *(void *)(a1 + 32);
    objc_super v13 = linkPresentationBundle();
    __int16 v10 = [v11 imageNamed:v12 inBundle:v13 withConfiguration:0];
  }
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v14 = [v10 imageWithRenderingMode:2];

    __int16 v10 = (void *)v14;
  }
  uint64_t v15 = LPLogChannelImage();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v17 = 134217984;
    uint64_t v18 = v16;
    _os_log_impl(&dword_1A35DC000, v15, OS_LOG_TYPE_INFO, "LPImage<%p>: finished loading async image", (uint8_t *)&v17, 0xCu);
  }
  v3[2](v3, v10);
}

+ (id)_PDFImageNamed:(id)a3 template:(BOOL)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  unint64_t v21 = __Block_byref_object_copy__0;
  BOOL v22 = __Block_byref_object_dispose__0;
  id v23 = 0;
  uint64_t v6 = [LPImage alloc];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __35__LPImage__PDFImageNamed_template___block_invoke;
  v14[3] = &unk_1E5B04FD0;
  uint64_t v16 = &v18;
  id v7 = v5;
  id v15 = v7;
  BOOL v17 = a4;
  uint64_t v8 = [(LPImage *)v6 _initWithPlatformImageGenerator:v14 properties:0];
  unint64_t v9 = (void *)v19[5];
  v19[5] = v8;

  __int16 v10 = LPLogChannelImage();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = v19[5];
    *(_DWORD *)buf = 134218242;
    uint64_t v25 = v11;
    __int16 v26 = 2112;
    id v27 = v7;
    _os_log_impl(&dword_1A35DC000, v10, OS_LOG_TYPE_INFO, "LPImage<%p>: created async LPImage for %@", buf, 0x16u);
  }
  id v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

void __35__LPImage__PDFImageNamed_template___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  uint64_t v4 = LPLogChannelImage();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v13 = 134217984;
    uint64_t v14 = v5;
    _os_log_impl(&dword_1A35DC000, v4, OS_LOG_TYPE_INFO, "LPImage<%p>: started loading async image", (uint8_t *)&v13, 0xCu);
  }
  uint64_t v6 = (void *)MEMORY[0x1E4FB1818];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = linkPresentationBundle();
  unint64_t v9 = [v6 imageNamed:v7 inBundle:v8 withConfiguration:0];

  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v10 = [v9 imageWithRenderingMode:2];

    unint64_t v9 = (void *)v10;
  }
  uint64_t v11 = LPLogChannelImage();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v13 = 134217984;
    uint64_t v14 = v12;
    _os_log_impl(&dword_1A35DC000, v11, OS_LOG_TYPE_INFO, "LPImage<%p>: finished loading async image", (uint8_t *)&v13, 0xCu);
  }
  v3[2](v3, v9);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPImage)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)LPImage;
  uint64_t v5 = [(LPImage *)&v20 init];
  if (!v5) {
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "_lp_coderType") == 1)
  {
    uint64_t v6 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"platformImage");
    originalPlatformImage = v5->_originalPlatformImage;
    v5->_originalPlatformImage = (UIImage *)v6;
  }
  uint64_t v8 = objc_msgSend(v4, "_lp_strictlyDecodeNSDataForKey:", @"data");
  [(LPImage *)v5 set_cachedAtomicData:v8];

  if ([(LPImage *)v5 _isSubstitute]) {
    goto LABEL_8;
  }
  unint64_t v9 = [(LPImage *)v5 _cachedAtomicData];
  if (![v9 length])
  {
    uint64_t v10 = v5->_originalPlatformImage;

    if (v10) {
      goto LABEL_8;
    }
LABEL_11:
    uint64_t v18 = 0;
    goto LABEL_12;
  }

LABEL_8:
  uint64_t v11 = objc_msgSend(v4, "_lp_strictlyDecodeNSStringForKey:", @"MIMEType");
  MIMEType = v5->_MIMEType;
  v5->_MIMEType = (NSString *)v11;

  int v13 = objc_alloc_init(LPImageProperties);
  properties = v5->_properties;
  v5->_properties = v13;

  uint64_t v15 = objc_msgSend(v4, "_lp_strictlyDecodeNSStringForKey:", @"accessibilityText");
  [(LPImageProperties *)v5->_properties setAccessibilityText:v15];

  uint64_t v16 = objc_msgSend(v4, "_lp_strictlyDecodeColorForKey:", @"overlaidTextColor");
  [(LPImageProperties *)v5->_properties setOverlaidTextColor:v16];

  BOOL v17 = objc_msgSend(v4, "_lp_strictlyDecodeColorForKey:", @"dominantColor");
  [(LPImageProperties *)v5->_properties setDominantColor:v17];

  -[LPImageProperties setHasSingleDominantColor:](v5->_properties, "setHasSingleDominantColor:", [v4 decodeBoolForKey:@"hasSingleDominantColor"]);
  -[LPImageProperties setType:](v5->_properties, "setType:", [v4 decodeIntegerForKey:@"imageType"]);
  if ([(LPImageProperties *)v5->_properties type] >= 7) {
    [(LPImageProperties *)v5->_properties setType:0];
  }
  uint64_t v18 = v5;
LABEL_12:

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "_lp_coderType") == 1)
  {
    uint64_t v5 = [(LPImage *)self _existingPlatformImage];
    int v6 = objc_msgSend(v5, "_lp_isSymbolImage");
    if (v6) {
      objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", v5, @"platformImage");
    }
  }
  else
  {
    if ([(LPImage *)self needsAsynchronousLoad])
    {
      uint64_t v7 = LPLogChannelSerialization();
      int v6 = 0;
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_9;
      }
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_1A35DC000, v7, OS_LOG_TYPE_DEFAULT, "Trying to encode an LPImage with an unloaded item provider.", v12, 2u);
    }
    int v6 = 0;
  }
LABEL_9:
  if ((([(LPImage *)self _isSubstitute] | v6) & 1) == 0)
  {
    uint64_t v8 = [(LPImage *)self data];
    objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", v8, @"data");
  }
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_MIMEType, @"MIMEType");
  unint64_t v9 = [(LPImageProperties *)self->_properties accessibilityText];
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", v9, @"accessibilityText");

  uint64_t v10 = [(LPImageProperties *)self->_properties overlaidTextColor];
  objc_msgSend(v4, "_lp_encodeColorIfNotNil:forKey:", v10, @"overlaidTextColor");

  uint64_t v11 = [(LPImageProperties *)self->_properties dominantColor];
  objc_msgSend(v4, "_lp_encodeColorIfNotNil:forKey:", v11, @"dominantColor");

  objc_msgSend(v4, "encodeBool:forKey:", -[LPImageProperties hasSingleDominantColor](self->_properties, "hasSingleDominantColor"), @"hasSingleDominantColor");
  objc_msgSend(v4, "encodeInteger:forKey:", -[LPImageProperties type](self->_properties, "type"), @"imageType");
}

- (BOOL)_canEncodeWithoutComputation
{
  uint64_t v3 = [(LPImage *)self _existingPlatformImage];
  if (objc_msgSend(v3, "_lp_isSymbolImage"))
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [(LPImage *)self _cachedAtomicData];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (void)setFileURL:(id)a3
{
  id v6 = a3;
  if ([v6 isFileURL]) {
    BOOL v4 = (NSURL *)v6;
  }
  else {
    BOOL v4 = 0;
  }
  fileURL = self->_fileURL;
  self->_fileURL = v4;
}

+ (id)_loadImageSubsampledToScreenSizeFromData:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  CFDataRef v3 = (const __CFData *)a3;
  if (![(__CFData *)v3 length])
  {
    uint64_t v14 = 0;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E4FB1BA8], "_lp_mainScreenScale");
  double v5 = v4;
  objc_msgSend(MEMORY[0x1E4FB1BA8], "_lp_mainScreenSize");
  double v7 = v6;
  double v9 = v8;
  id v10 = objc_alloc(MEMORY[0x1E4F1CA60]);
  CFDictionaryRef v11 = (const __CFDictionary *)objc_msgSend(v10, "initWithObjectsAndKeys:", MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F2FF48], 0);
  CFDataRef v12 = (const __CFData *)[(__CFData *)v3 copy];

  int v13 = CGImageSourceCreateWithData(v12, v11);
  uint64_t v14 = v13;
  if (v13)
  {
    if (CGImageSourceGetCount(v13))
    {
      CFDictionaryRef v15 = CGImageSourceCopyPropertiesAtIndex(v14, 0, v11);
      uint64_t v16 = [(__CFDictionary *)v15 objectForKey:*MEMORY[0x1E4F2FD00]];
      uint64_t v17 = [(__CFDictionary *)v15 objectForKey:*MEMORY[0x1E4F2FCE8]];
      uint64_t v18 = (void *)v17;
      if (v16
        && v17
        && ([v16 doubleValue],
            double v20 = v19,
            [v18 doubleValue],
            double v22 = v21,
            !sizeIsEmptyOrInvalid(v20, v21)))
      {
        sizeFittingInsideSizeMaintainingAspectRatio(v20, v22, v5 * v7, v5 * v9);
        double v26 = fmin(v20 / v24, v22 / v25);
        if (v26 < 2.0) {
          goto LABEL_27;
        }
        double v27 = 8.0;
        if (v26 < 8.0) {
          double v27 = 4.0;
        }
        if (v26 >= 4.0) {
          double v28 = v27;
        }
        else {
          double v28 = 2.0;
        }
        v29 = LPLogChannelImage();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218496;
          double v34 = v20;
          __int16 v35 = 2048;
          double v36 = v22;
          __int16 v37 = 2048;
          double v38 = v28;
          _os_log_debug_impl(&dword_1A35DC000, v29, OS_LOG_TYPE_DEBUG, "Subsampling %g x %g image by %gx", buf, 0x20u);
        }
        uint64_t v30 = [NSNumber numberWithDouble:v28];
        [(__CFDictionary *)v11 setObject:v30 forKeyedSubscript:*MEMORY[0x1E4F2FF58]];

        CFRelease(v14);
        __int16 v31 = CGImageSourceCreateWithData(v12, v11);
        uint64_t v14 = v31;
        if (!v31) {
          goto LABEL_12;
        }
        if (CGImageSourceGetCount(v31))
        {
LABEL_27:
          ImageAtIndex = CGImageSourceCreateImageAtIndex(v14, 0, v11);
          CFRelease(v14);
          objc_msgSend(MEMORY[0x1E4FB1818], "_lp_createImageWithCGImage:", ImageAtIndex);
          uint64_t v14 = (CGImageSource *)objc_claimAutoreleasedReturnValue();
          CGImageRelease(ImageAtIndex);
          goto LABEL_12;
        }
        CFRelease(v14);
      }
      else
      {
        CFRelease(v14);
      }
      uint64_t v14 = 0;
LABEL_12:

      goto LABEL_13;
    }
    CFRelease(v14);
    uint64_t v14 = 0;
  }
LABEL_13:

  CFDataRef v3 = v12;
LABEL_14:

  return v14;
}

- (id)_existingPlatformImage
{
  decodedPlatformImage = self->_decodedPlatformImage;
  if (decodedPlatformImage
    || ([(LPImage *)self _waitForAsynchronouslyLoadedImageIfNeeded],
        (decodedPlatformImage = self->_originalPlatformImage) != 0))
  {
    double v4 = decodedPlatformImage;
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

- (UIImage)platformImage
{
  int v2 = self;
  objc_sync_enter(v2);
  CFDataRef v3 = [(LPImage *)v2 _existingPlatformImage];
  platformImage = v3;
  if (!v3)
  {
    platformImage = v2->_platformImage;
    if (!platformImage)
    {
      double v5 = [(LPImage *)v2 data];
      if (!v5) {
        goto LABEL_9;
      }
      if (+[LPSettings subsampleImagesToScreenSize])
      {
        uint64_t v6 = +[LPImage _loadImageSubsampledToScreenSizeFromData:v5];
      }
      else
      {
        uint64_t v6 = [objc_alloc(MEMORY[0x1E4FB1818]) initWithData:v5];
      }
      double v7 = v2->_platformImage;
      v2->_platformImage = (UIImage *)v6;

      platformImage = v2->_platformImage;
    }
  }
  double v5 = platformImage;
LABEL_9:

  objc_sync_exit(v2);

  return v5;
}

- (void)_synchronouslyDecodePlatformImageWithMaximumSize:(CGSize)a3
{
  v22[6] = *MEMORY[0x1E4F143B8];
  if (!self->_decodedPlatformImage)
  {
    double height = a3.height;
    double width = a3.width;
    [(LPImage *)self _waitForAsynchronouslyLoadedImageIfNeeded];
    CFDataRef v6 = [(LPImage *)self data];
    if (v6)
    {
      uint64_t v7 = MEMORY[0x1E4F1CC38];
      uint64_t v8 = *MEMORY[0x1E4F2FE28];
      v21[0] = *MEMORY[0x1E4F2FF48];
      v21[1] = v8;
      v22[0] = MEMORY[0x1E4F1CC38];
      v22[1] = MEMORY[0x1E4F1CC38];
      v21[2] = *MEMORY[0x1E4F2FF68];
      double v9 = objc_msgSend(NSNumber, "numberWithLong:", (uint64_t)fmax(width, height));
      uint64_t v10 = *MEMORY[0x1E4F2FE48];
      v22[2] = v9;
      v22[3] = v7;
      uint64_t v11 = *MEMORY[0x1E4F2FF88];
      v21[3] = v10;
      v21[4] = v11;
      v21[5] = *MEMORY[0x1E4F2FF08];
      v22[4] = v7;
      v22[5] = v7;
      CFDictionaryRef v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:6];

      int v13 = CGImageSourceCreateWithData(v6, 0);
      uint64_t v14 = v13;
      if (v13)
      {
        ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v13, 0, v12);
        if (ThumbnailAtIndex)
        {
          uint64_t v16 = self;
          objc_sync_enter(v16);
          objc_msgSend(MEMORY[0x1E4FB1818], "_lp_createImageWithCGImage:", ThumbnailAtIndex);
          uint64_t v17 = (UIImage *)objc_claimAutoreleasedReturnValue();
          decodedPlatformImage = self->_decodedPlatformImage;
          self->_decodedPlatformImage = v17;

          originalPlatformImage = v16->_originalPlatformImage;
          v16->_originalPlatformImage = 0;

          platformImage = v16->_platformImage;
          v16->_platformImage = 0;

          objc_sync_exit(v16);
          CFRelease(v14);
          CGImageRelease(ThumbnailAtIndex);
        }
        else
        {
          CFRelease(v14);
        }
      }
    }
  }
}

- (NSData)data
{
  CFDataRef v3 = [(LPImage *)self _cachedAtomicData];

  if (!v3)
  {
    [(LPImage *)self _waitForAsynchronouslyLoadedImageIfNeeded];
    if (self->_originalPlatformImage)
    {
      [(LPImage *)self _createDataFromPlatformImage];
    }
    else if (self->_fileURL)
    {
      [(LPImage *)self _mapDataFromFileURL];
    }
  }

  return [(LPImage *)self _cachedAtomicData];
}

- (NSString)MIMEType
{
  MIMEType = self->_MIMEType;
  if (MIMEType) {
    goto LABEL_2;
  }
  [(LPImage *)self _waitForAsynchronouslyLoadedImageIfNeeded];
  if (!self->_originalPlatformImage)
  {
    MIMEType = self->_MIMEType;
LABEL_2:
    CFDataRef v3 = MIMEType;
    goto LABEL_5;
  }
  CFDataRef v3 = @"image/png";
LABEL_5:

  return (NSString *)v3;
}

- (LPImageProperties)properties
{
  int v2 = (void *)[(LPImageProperties *)self->_properties copy];

  return (LPImageProperties *)v2;
}

- (void)_createDataFromPlatformImage
{
  obj = self;
  objc_sync_enter(obj);
  int v2 = [(LPImage *)obj _cachedAtomicData];

  CFDataRef v3 = obj;
  if (!v2)
  {
    [(LPImage *)obj _waitForAsynchronouslyLoadedImageIfNeeded];
    CFDataRef v3 = obj;
    originalPlatformImage = obj->_originalPlatformImage;
    if (originalPlatformImage)
    {
      if (obj->_useLossyCompressionForEncodedData) {
        UIImageJPEGRepresentation(originalPlatformImage, 0.8);
      }
      else {
      double v5 = UIImagePNGRepresentation(originalPlatformImage);
      }
      [(LPImage *)obj set_cachedAtomicData:v5];

      MIMEType = obj->_MIMEType;
      obj->_MIMEType = (NSString *)@"image/png";

      CFDataRef v3 = obj;
    }
  }
  objc_sync_exit(v3);
}

- (void)_mapDataFromFileURL
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A35DC000, a2, OS_LOG_TYPE_ERROR, "LPImage: Failed to load data: %@", (uint8_t *)&v2, 0xCu);
}

- (unint64_t)_encodedSize
{
  if (self->_fileURL)
  {
    fileURL = self->_fileURL;
    return [(NSURL *)fileURL _lp_fileSize];
  }
  else
  {
    uint64_t v4 = [(LPImage *)self data];
    unint64_t v5 = [v4 length];

    return v5;
  }
}

- (BOOL)_isSubstitute
{
  return 0;
}

- (CGSize)_pixelSize
{
  int v2 = self;
  objc_sync_enter(v2);
  if (!v2->_hasComputedPixelSize)
  {
    uint64_t v3 = [(LPImage *)v2 platformImage];
    objc_msgSend(v3, "_lp_pixelSize");
    v2->_pixelSize.CGFloat width = v4;
    v2->_pixelSize.CGFloat height = v5;

    v2->_hasComputedPixelSize = 1;
  }
  CGFloat width = v2->_pixelSize.width;
  CGFloat height = v2->_pixelSize.height;
  objc_sync_exit(v2);

  double v8 = width;
  double v9 = height;
  result.CGFloat height = v9;
  result.CGFloat width = v8;
  return result;
}

- (BOOL)_isImperceptible
{
  [(LPImage *)self _pixelSize];
  return v3 <= 1.0 || v2 <= 1.0;
}

- (BOOL)_isAnimated
{
  if (self->_hasComputedIsAnimated) {
    return self->_isAnimated;
  }
  self->_hasComputedIsAnimated = 1;
  CGFloat v4 = [(LPImage *)self MIMEType];
  BOOL v5 = +[LPMIMETypeRegistry isNonAnimatedMultiframeImageType:v4];

  if (v5)
  {
    BOOL result = 0;
    self->_isAnimated = 0;
  }
  else
  {
    CFDataRef v6 = [(LPImage *)self data];
    uint64_t v7 = CGImageSourceCreateWithData(v6, MEMORY[0x1E4F1CC08]);

    if (v7)
    {
      self->_isAnimated = CGImageSourceGetCount(v7) > 1;
      CFRelease(v7);
      return self->_isAnimated;
    }
    return 0;
  }
  return result;
}

- (NSString)_srcsetForRemoteURLs
{
  double v3 = [(LPImage *)self _remoteURLsForEmailCompatibleOutput];

  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    BOOL v5 = [(LPImage *)self _remoteURLsForEmailCompatibleOutput];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __31__LPImage__srcsetForRemoteURLs__block_invoke;
    CFDictionaryRef v12 = &unk_1E5B04FF8;
    id v6 = v4;
    id v13 = v6;
    uint64_t v14 = self;
    [v5 enumerateObjectsUsingBlock:&v9];

    uint64_t v7 = (__CFString *)objc_msgSend(v6, "copy", v9, v10, v11, v12);
  }
  else
  {
    uint64_t v7 = &stru_1EF6D6D90;
  }

  return (NSString *)v7;
}

void __31__LPImage__srcsetForRemoteURLs__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = NSString;
  id v13 = v5;
  double v8 = [v5 URL];
  uint64_t v9 = [v8 absoluteString];
  uint64_t v10 = [v7 stringWithFormat:@"%@ %dx", v9, objc_msgSend(v13, "scale")];
  [v6 appendString:v10];

  uint64_t v11 = [*(id *)(a1 + 40) _remoteURLsForEmailCompatibleOutput];
  uint64_t v12 = [v11 count] - 1;

  if (v12 != a3) {
    [*(id *)(a1 + 32) appendString:@", "];
  }
}

- (BOOL)needsAsynchronousLoad
{
  return self->_itemProvider != 0;
}

- (BOOL)hasPlaceholderValueForAsynchronousLoad
{
  if (!self->_itemProvider) {
    return 0;
  }
  double v2 = [(LPImage *)self _cachedAtomicData];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)loadAsynchronouslyWithCompletionHandler:(id)a3
{
  id v4 = a3;
  itemProviderLoadGroup = self->_itemProviderLoadGroup;
  if (!itemProviderLoadGroup)
  {
    id v6 = (OS_dispatch_group *)dispatch_group_create();
    uint64_t v7 = self->_itemProviderLoadGroup;
    self->_itemProviderLoadGroup = v6;

    dispatch_group_enter((dispatch_group_t)self->_itemProviderLoadGroup);
    itemProvider = self->_itemProvider;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __51__LPImage_loadAsynchronouslyWithCompletionHandler___block_invoke_2;
    v12[3] = &unk_1E5B05040;
    v12[4] = self;
    [(NSItemProvider *)itemProvider _lp_loadFirstDataRepresentationMatchingMIMETypePredicate:&__block_literal_global_2 completionHandler:v12];
    itemProviderLoadGroup = self->_itemProviderLoadGroup;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__LPImage_loadAsynchronouslyWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E5B05068;
  block[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_group_notify(itemProviderLoadGroup, MEMORY[0x1E4F14428], block);
}

BOOL __51__LPImage_loadAsynchronouslyWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[LPMIMETypeRegistry isImageType:a2];
}

void __51__LPImage_loadAsynchronouslyWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (v11)
  {
    id v6 = [LPImage alloc];
    uint64_t v7 = [*(id *)(a1 + 32) properties];
    uint64_t v8 = [(LPImage *)v6 initWithData:v11 MIMEType:v5 properties:v7];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void **)(v9 + 48);
    *(void *)(v9 + 48) = v8;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 56));
}

uint64_t __51__LPImage_loadAsynchronouslyWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = 0;

  id v4 = *(void **)(a1 + 32);
  if (v4[6])
  {
    uint64_t v5 = *(void *)(a1 + 40);
LABEL_5:
    uint64_t v9 = *(uint64_t (**)(void))(v5 + 16);
    goto LABEL_6;
  }
  id v6 = [v4 _cachedAtomicData];

  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;

    uint64_t v5 = *(void *)(a1 + 40);
    goto LABEL_5;
  }
  uint64_t v9 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_6:

  return v9();
}

- (NSItemProvider)_itemProvider
{
  itemProvider = self->_itemProvider;
  if (itemProvider)
  {
    BOOL v3 = itemProvider;
  }
  else
  {
    uint64_t v5 = [(LPImage *)self data];
    id v6 = (void *)MEMORY[0x1E4F28D78];
    uint64_t v7 = [(LPImage *)self MIMEType];
    objc_msgSend(v6, "_lp_itemProviderWithData:MIMEType:", v5, v7);
    BOOL v3 = (NSItemProvider *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)_asTemplate
{
  BOOL v3 = [(LPImage *)self platformImage];
  uint64_t v4 = [v3 renderingMode];

  if (v4 == 2)
  {
    uint64_t v5 = self;
  }
  else
  {
    id v6 = [(LPImage *)self platformImage];
    uint64_t v7 = [v6 imageWithRenderingMode:2];

    uint64_t v8 = [LPImage alloc];
    uint64_t v9 = [(LPImage *)self properties];
    uint64_t v5 = [(LPImage *)v8 initWithPlatformImage:v7 properties:v9];
  }

  return v5;
}

- (BOOL)_isFallbackIcon
{
  BOOL result = !self->_isNonFallbackSymbolImage
        && ([(LPImage *)self platformImage],
            BOOL v3 = objc_claimAutoreleasedReturnValue(),
            char v4 = objc_msgSend(v3, "_lp_isSymbolImage"),
            v3,
            (v4 & 1) != 0)
        || self->_fallbackIcon;
  return result;
}

- (BOOL)_hasTransparency
{
  if (!self->_hasComputedHasTransparency)
  {
    BOOL v3 = [(LPImage *)self platformImage];
    self->_hasTransparency = objc_msgSend(v3, "_lp_hasTransparency");

    self->_hasComputedHasTransparency = 1;
  }
  return self->_hasTransparency;
}

- (void)set_fallbackIcon:(BOOL)a3
{
  self->_fallbackIcon = a3;
}

- (NSArray)_remoteURLsForEmailCompatibleOutput
{
  return self->_remoteURLsForEmailCompatibleOutput;
}

- (void)set_remoteURLsForEmailCompatibleOutput:(id)a3
{
}

- (LPImage)_darkInterfaceAlternativeImage
{
  return self->_darkInterfaceAlternativeImage;
}

- (void)_setDarkInterfaceAlternativeImage:(id)a3
{
}

- (BOOL)_isPrecomposedAppIcon
{
  return self->_precomposedAppIcon;
}

- (void)set_precomposedAppIcon:(BOOL)a3
{
  self->_precomposedAppIcon = a3;
}

- (BOOL)_useLossyCompressionForEncodedData
{
  return self->_useLossyCompressionForEncodedData;
}

- (void)set_useLossyCompressionForEncodedData:(BOOL)a3
{
  self->_useLossyCompressionForEncodedData = a3;
}

- (BOOL)_isNonFallbackSymbolImage
{
  return self->_isNonFallbackSymbolImage;
}

- (void)set_isNonFallbackSymbolImage:(BOOL)a3
{
  self->_isNonFallbackSymbolImage = a3;
}

- (NSString)_symbolName
{
  return self->_symbolName;
}

- (void)setPlatformImage:(id)a3
{
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (OS_dispatch_group)_asynchronousLoadGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 136, 1);
}

- (void)_setAsynchronousLoadGroup:(id)a3
{
}

- (NSData)_cachedAtomicData
{
  return (NSData *)objc_getProperty(self, a2, 144, 1);
}

- (void)set_cachedAtomicData:(id)a3
{
}

- (id)_alternateHTMLImageGenerator
{
  return self->__alternateHTMLImageGenerator;
}

- (void)set_alternateHTMLImageGenerator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__alternateHTMLImageGenerator, 0);
  objc_storeStrong((id *)&self->__cachedAtomicData, 0);
  objc_storeStrong((id *)&self->__asynchronousLoadGroup, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_platformImage, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_darkInterfaceAlternativeImage, 0);
  objc_storeStrong((id *)&self->_remoteURLsForEmailCompatibleOutput, 0);
  objc_storeStrong((id *)&self->_itemProviderLoadGroup, 0);
  objc_storeStrong((id *)&self->_imageLoadedFromItemProvider, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_MIMEType, 0);
  objc_storeStrong((id *)&self->_decodedPlatformImage, 0);

  objc_storeStrong((id *)&self->_originalPlatformImage, 0);
}

- (id)filledVariant
{
  uint64_t v2 = self;
  BOOL v3 = (void *)sub_1A36C4128();

  return v3;
}

- (BOOL)_isLowResolutionAsImage
{
  uint64_t v2 = self;
  BOOL v3 = sub_1A36C43CC();

  return v3;
}

- (BOOL)_isLowResolutionAsIconWithScaleFactor:(double)a3
{
  char v4 = self;
  if ([(LPImage *)v4 _isFallbackIcon])
  {

    return 0;
  }
  else
  {
    [(LPImage *)v4 _pixelSize];
    double v7 = v6;
    objc_msgSend(self, sel_largestIconSizeInPoints);
    double v9 = v8;

    return v7 < v9 * a3;
  }
}

- (void)initWithPlatformImage:(os_log_t)log properties:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A35DC000, log, OS_LOG_TYPE_ERROR, "Trying to create an LPImage from a nil LPPlatformImage.", v1, 2u);
}

@end