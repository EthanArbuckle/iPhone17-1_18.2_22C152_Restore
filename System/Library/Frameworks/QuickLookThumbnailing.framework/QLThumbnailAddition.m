@interface QLThumbnailAddition
+ (BOOL)_removeAdditionsOnURLDirectly:(id)a3 error:(id *)a4;
+ (BOOL)_removeAdditionsOnURLUsingDaemon:(id)a3 error:(id *)a4;
+ (BOOL)_removedAdditionsOnURLUsingDaemon:(id)a3;
+ (BOOL)associateImage:(CGImage *)a3 metadata:(id)a4 automaticallyGenerated:(BOOL)a5 withURL:(id)a6 error:(id *)a7;
+ (BOOL)associateThumbnailImagesDictionary:(id)a3 serializedQuickLookMetadata:(id)a4 withDocumentAtURL:(id)a5 error:(id *)a6;
+ (BOOL)associateThumbnailImagesDictionary:(id)a3 serializedQuickLookMetadata:(id)a4 withImmutableDocument:(BOOL)a5 atURL:(id)a6 error:(id *)a7;
+ (BOOL)associateThumbnailsForDocumentAtURL:(id)a3 withDocumentAtURL:(id)a4 error:(id *)a5;
+ (BOOL)associateThumbnailsForDocumentAtURL:(id)a3 withImmutableDocument:(BOOL)a4 atURL:(id)a5 error:(id *)a6;
+ (BOOL)hasThumbnailOnImmutableDocumentAtURL:(id)a3;
+ (BOOL)imageContainsAlpha:(CGImage *)a3;
+ (BOOL)imageContainsAlphaForOtherImages:(CGImage *)a3;
+ (BOOL)makeAdditionFromStagingURL:(id)a3 metadata:(id)a4 inStorage:(id)a5 error:(id *)a6;
+ (BOOL)removeAdditionsOnURL:(id)a3 error:(id *)a4;
+ (BOOL)removeExtendedAttributeNamed:(const char *)a3 flags:(unint64_t)a4 onFileDescriptor:(int)a5 error:(id *)a6;
+ (BOOL)removeThumbnailsStoredInExtendedAttributesOnURL:(id)a3 error:(id *)a4;
+ (BOOL)setPropertyList:(id)a3 forExtendedAttributeNamed:(const char *)a4 flags:(unint64_t)a5 onFileDescriptor:(int)a6 error:(id *)a7;
+ (BOOL)setThumbnailsDictionary:(id)a3 forURL:(id)a4 error:(id *)a5;
+ (BOOL)shouldUseXattrsToStoreThumbnailsOnURL:(id)a3;
+ (BOOL)storeThumbnailDataDictionary:(id)a3 metadata:(id)a4 asExtendedAttributeOnURL:(id)a5 error:(id *)a6;
+ (id)additionCreationInfo;
+ (id)imageNameFor1024ThumbnailAtURL:(id)a3 metadataDictionary:(id)a4;
+ (id)imageNameFor1024ThumbnailData:(id)a3 metadataDictionary:(id)a4;
+ (id)imageNameFor1024ThumbnailInMetadataDictionary:(id)a3;
+ (id)imageNameForThumbnailInImageSource:(CGImageSource *)a3;
+ (id)metadataForGeneratedThumbnailForURL:(id)a3 maximumDimension:(double)a4;
+ (id)plistInExtendedAttributeNamed:(const char *)a3 flags:(unint64_t)a4 onFileDescriptor:(int)a5 error:(id *)a6;
+ (id)thumbnailsDictionaryForURL:(id)a3 error:(id *)a4;
+ (unint64_t)sizeOfAdditionsPresentOnURL:(id)a3;
+ (void)_hitAdditionsOnURL:(id)a3 size:(unint64_t)a4 completionHandler:(id)a5;
+ (void)adjustFileProtectionForThumbnail:(id)a3 fromOriginalDocument:(id)a4;
+ (void)downloadOrGenerateThumbnailAtTaggedURL:(id)a3 completionHandler:(id)a4;
+ (void)downloadOrGenerateThumbnailAtURL:(id)a3;
+ (void)downloadOrGenerateThumbnailAtURL:(id)a3 completionHandler:(id)a4;
+ (void)fpfsDownloadOrGenerateThumbnailAtTaggedURL:(id)a3 completionHandler:(id)a4;
+ (void)noteCloudDocsDownloadedFileAtURL:(id)a3 completionHandler:(id)a4;
+ (void)preFPFSDownloadOrGenerateThumbnailAtTaggedURL:(id)a3 completionHandler:(id)a4;
+ (void)preFPFSDownloadThumbnailAtTaggedURL:(id)a3 completionHandler:(id)a4;
- (BOOL)_initWithAdditionsPresentOnURLDirectly:(id)a3 error:(id *)a4;
- (BOOL)_initWithAdditionsPresentOnURLUsingDaemon:(id)a3 error:(id *)a4;
- (BOOL)_initWithXattrsPresentOnURL:(id)a3 error:(id *)a4;
- (BOOL)shouldBeInvalidatedByThumbnailVersion:(id)a3;
- (CGImage)thumbnailWithMaximumDimension:(double)a3 contentRect:(CGRect *)a4 properties:(id *)a5;
- (GSAddition)genStoreAddition;
- (NSDictionary)metadata;
- (NSDictionary)thumbnailDataDictionary;
- (NSURL)additionURL;
- (QLThumbnailAddition)initWithAdditionsPresentOnURL:(id)a3 error:(id *)a4;
- (QLThumbnailAddition)initWithAdditionsPresentOnURL:(id)a3 includingExtendedAttributes:(BOOL)a4 error:(id *)a5;
- (QLThumbnailVersion)thumbnailVersion;
- (id)allImageURLs;
- (id)thumbnailDataForKey:(id)a3;
- (id)thumbnailURLForKey:(id)a3;
- (id)thumbnailsDictionaryWithError:(id *)a3;
- (int64_t)additionURLSandboxToken;
- (unint64_t)additionSize;
- (void)dealloc;
- (void)setAdditionURL:(id)a3;
- (void)setAdditionURLSandboxToken:(int64_t)a3;
- (void)setMetadata:(id)a3;
- (void)setThumbnailDataDictionary:(id)a3;
@end

@implementation QLThumbnailAddition

- (void)dealloc
{
  if (self->_additionURLSandboxToken) {
    sandbox_extension_release();
  }
  v3.receiver = self;
  v3.super_class = (Class)QLThumbnailAddition;
  [(QLThumbnailAddition *)&v3 dealloc];
}

- (BOOL)shouldBeInvalidatedByThumbnailVersion:(id)a3
{
  id v4 = a3;
  v5 = [(QLThumbnailAddition *)self thumbnailVersion];
  v6 = _log_0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[QLThumbnailAddition shouldBeInvalidatedByThumbnailVersion:]();
  }

  if (v5) {
    char v7 = [v5 shouldBeInvalidatedByThumbnailWithVersion:v4];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (id)thumbnailURLForKey:(id)a3
{
  id v4 = a3;
  v5 = [(QLThumbnailAddition *)self metadata];
  v6 = [v5 objectForKey:@"QLThumbnailMetadataFileNamesDictionaryKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v7 = [v6 objectForKey:v4];

    if (v7)
    {
      v8 = [(QLThumbnailAddition *)self additionURL];
      v9 = [v6 objectForKey:v4];
      v10 = v8;
      v11 = v9;
      goto LABEL_7;
    }
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F1C500]])
  {
    v12 = [(QLThumbnailAddition *)self metadata];
    v8 = [v12 objectForKey:@"QLThumbnailMetadataFileNameKey"];

    if (!v8)
    {
      v13 = 0;
LABEL_8:

      if (v13) {
        goto LABEL_12;
      }
      goto LABEL_9;
    }
    v10 = [(QLThumbnailAddition *)self additionURL];
    v9 = v10;
    v11 = v8;
LABEL_7:
    v13 = [v10 URLByAppendingPathComponent:v11 isDirectory:0];

    goto LABEL_8;
  }
LABEL_9:
  v14 = _log_0();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[QLThumbnailAddition thumbnailURLForKey:](self);
  }

  v13 = 0;
LABEL_12:

  return v13;
}

- (id)thumbnailDataForKey:(id)a3
{
  id v4 = a3;
  v5 = [(NSDictionary *)self->_thumbnailDataDictionary objectForKey:v4];
  if (!v5)
  {
    v6 = [(QLThumbnailAddition *)self thumbnailURLForKey:v4];
    if (v6) {
      v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v6 options:1 error:0];
    }
    else {
      v5 = 0;
    }
  }

  return v5;
}

- (BOOL)_initWithAdditionsPresentOnURLDirectly:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 checkResourceIsReachableAndReturnError:a4])
  {
    char v7 = +[QLThumbnailAdditionCache sharedInstance];
    id v17 = 0;
    v8 = [v7 thumbnailAdditionForItemAtURL:v6 error:&v17];
    id v9 = v17;
    addition = self->_addition;
    self->_addition = v8;

    v11 = self->_addition;
    BOOL v12 = v11 != 0;
    if (v11)
    {
      v13 = [(GSAddition *)v11 url];
      [(QLThumbnailAddition *)self setAdditionURL:v13];

      v14 = [(GSAddition *)self->_addition userInfo];
      v15 = [v14 objectForKey:@"QLThumbnailAdditionMetadataKey"];
      [(QLThumbnailAddition *)self setMetadata:v15];
    }
    else
    {
      setErrorWrappingUnderlyingError(v9, @"QLThumbnailErrorDomain", 102, a4);
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)_initWithAdditionsPresentOnURLUsingDaemon:(id)a3 error:(id *)a4
{
  id v6 = a3;
  char v7 = +[QLThumbnailServiceProxy sharedInstance];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__3;
  v27 = __Block_byref_object_dispose__3;
  id v28 = 0;
  if (v7)
  {
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __71__QLThumbnailAddition__initWithAdditionsPresentOnURLUsingDaemon_error___block_invoke;
    v20[3] = &unk_1E6009F28;
    v22 = &v23;
    id v9 = v8;
    v21 = v9;
    v10 = [v7 remoteObjectProxyWithErrorHandler:v20];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __71__QLThumbnailAddition__initWithAdditionsPresentOnURLUsingDaemon_error___block_invoke_95;
    v17[3] = &unk_1E6009F50;
    v17[4] = self;
    v19 = &v23;
    v11 = v9;
    v18 = v11;
    [v10 thumbnailsStoreURLForURL:v6 completionBlock:v17];

    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    BOOL v12 = (void *)v24[5];
    if (v12)
    {
      if ([v12 code]) {
        uint64_t v13 = 101;
      }
      else {
        uint64_t v13 = 102;
      }
      setErrorWrappingUnderlyingError((void *)v24[5], @"QLThumbnailErrorDomain", v13, a4);
    }
    else if (a4)
    {
      *a4 = 0;
    }
    v15 = [(QLThumbnailAddition *)self additionURL];
    BOOL v14 = v15 != 0;
  }
  else
  {
    BOOL v14 = 0;
  }
  _Block_object_dispose(&v23, 8);

  return v14;
}

void __71__QLThumbnailAddition__initWithAdditionsPresentOnURLUsingDaemon_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _log_0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __71__QLThumbnailAddition__initWithAdditionsPresentOnURLUsingDaemon_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __71__QLThumbnailAddition__initWithAdditionsPresentOnURLUsingDaemon_error___block_invoke_95(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  if (v9)
  {
    [a4 UTF8String];
    [*(id *)(a1 + 32) setAdditionURLSandboxToken:sandbox_extension_consume()];
    [*(id *)(a1 + 32) setAdditionURL:v9];
    [*(id *)(a1 + 32) setMetadata:v10];
  }
  else
  {
    BOOL v12 = _log_0();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __71__QLThumbnailAddition__initWithAdditionsPresentOnURLUsingDaemon_error___block_invoke_95_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a5);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (id)plistInExtendedAttributeNamed:(const char *)a3 flags:(unint64_t)a4 onFileDescriptor:(int)a5 error:(id *)a6
{
  dispatch_semaphore_t v8 = xattr_name_with_flags(a3, a4);
  if (!v8)
  {
    if (a6)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
      BOOL v12 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  id v9 = v8;
  ssize_t v10 = fgetxattr(a5, v8, 0, 0, 0, 0);
  size_t v11 = v10;
  if (a6 && v10 < 0)
  {
    *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
LABEL_14:
    free(v9);
    goto LABEL_15;
  }
  if (v10 < 1) {
    goto LABEL_14;
  }
  uint64_t v13 = malloc_type_malloc(v10, 0x5398AD07uLL);
  ssize_t v14 = fgetxattr(a5, v9, v13, v11, 0, 0);
  if (v14 < 0)
  {
    if (a6)
    {
      *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
    }
    free(v13);
    goto LABEL_14;
  }
  ssize_t v15 = v14;
  free(v9);
  if (v13)
  {
    v16 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v13 length:v15 freeWhenDone:1];
    BOOL v12 = [MEMORY[0x1E4F28F98] propertyListWithData:v16 options:0 format:0 error:a6];

    goto LABEL_16;
  }
LABEL_15:
  BOOL v12 = 0;
LABEL_16:

  return v12;
}

+ (BOOL)setPropertyList:(id)a3 forExtendedAttributeNamed:(const char *)a4 flags:(unint64_t)a5 onFileDescriptor:(int)a6 error:(id *)a7
{
  id v11 = a3;
  BOOL v12 = xattr_name_with_flags(a4, a5);
  if (v12)
  {
    uint64_t v13 = v12;
    ssize_t v14 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v11 format:200 options:0 error:a7];
    ssize_t v15 = v14;
    if (v14)
    {
      id v16 = v14;
      if (!fsetxattr(a6, v13, (const void *)[v16 bytes], objc_msgSend(v16, "length"), 0, 0))
      {
        BOOL v18 = 1;
        goto LABEL_13;
      }
      if (a7)
      {
        *a7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
      }
      id v17 = _log_0();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        +[QLThumbnailAddition setPropertyList:forExtendedAttributeNamed:flags:onFileDescriptor:error:](a6, v17);
      }
    }
    BOOL v18 = 0;
LABEL_13:
    free(v13);

    goto LABEL_14;
  }
  if (a7)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
    BOOL v18 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v18 = 0;
  }
LABEL_14:

  return v18;
}

+ (BOOL)removeExtendedAttributeNamed:(const char *)a3 flags:(unint64_t)a4 onFileDescriptor:(int)a5 error:(id *)a6
{
  dispatch_semaphore_t v8 = xattr_name_with_flags(a3, a4);
  if (v8)
  {
    id v9 = v8;
    if (fremovexattr(a5, v8, 0) && *__error() != 93)
    {
      if (a6)
      {
        *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
      }
      ssize_t v10 = _log_0();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[QLThumbnailAddition removeExtendedAttributeNamed:flags:onFileDescriptor:error:](a5, v10);
      }
    }
    free(v9);
  }
  else if (a6)
  {
    *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
  }
  return 0;
}

- (BOOL)_initWithXattrsPresentOnURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (QLThumbnailAdditionSimulateOneSlowIOForTesting)
  {
    QLThumbnailAdditionSimulateOneSlowIOForTesting = 0;
    sleep(5u);
  }
  id v7 = v6;
  uint64_t v8 = open((const char *)[v7 fileSystemRepresentation], 4);
  if ((v8 & 0x80000000) != 0)
  {
    if (a4)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
      BOOL v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
LABEL_10:
    BOOL v14 = 0;
    goto LABEL_11;
  }
  uint64_t v9 = v8;
  ssize_t v10 = [(id)objc_opt_class() plistInExtendedAttributeNamed:QLThumbnailDictionaryXattrName flags:3 onFileDescriptor:v8 error:a4];
  thumbnailDataDictionary = self->_thumbnailDataDictionary;
  self->_thumbnailDataDictionary = v10;

  if (self->_thumbnailDataDictionary)
  {
    BOOL v12 = [(id)objc_opt_class() plistInExtendedAttributeNamed:QLThumbnailMetadataXattrName flags:3 onFileDescriptor:v9 error:a4];
    metadata = self->_metadata;
    self->_metadata = v12;
  }
  close(v9);
  if (!self->_thumbnailDataDictionary) {
    goto LABEL_10;
  }
  BOOL v14 = self->_metadata != 0;
LABEL_11:

  return v14;
}

- (QLThumbnailAddition)initWithAdditionsPresentOnURL:(id)a3 error:(id *)a4
{
  return [(QLThumbnailAddition *)self initWithAdditionsPresentOnURL:a3 includingExtendedAttributes:1 error:a4];
}

+ (unint64_t)sizeOfAdditionsPresentOnURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = xattr_name_with_flags((const char *)QLThumbnailDictionaryXattrName, 3uLL);
  if (!v5
    || (id v6 = v5,
        ssize_t v7 = getxattr((const char *)[v4 fileSystemRepresentation], v5, 0, 0, 0, 0), free(v6), v7 <= 0))
  {
    uint64_t v8 = (void *)[objc_alloc((Class)a1) initWithAdditionsPresentOnURL:v4 includingExtendedAttributes:0 error:0];
    uint64_t v9 = v8;
    if (v8) {
      ssize_t v7 = [v8 additionSize];
    }
    else {
      ssize_t v7 = 0;
    }
  }
  return v7;
}

- (QLThumbnailAddition)initWithAdditionsPresentOnURL:(id)a3 includingExtendedAttributes:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)QLThumbnailAddition;
  uint64_t v9 = [(QLThumbnailAddition *)&v18 init];
  ssize_t v10 = v9;
  if (v9)
  {
    if (v6)
    {
      id v17 = 0;
      BOOL v11 = [(QLThumbnailAddition *)v9 _initWithXattrsPresentOnURL:v8 error:&v17];
      id v12 = v17;
      id v13 = v12;
      if (v11)
      {
LABEL_18:

        goto LABEL_19;
      }
      if ([v12 code] != 93)
      {
        if (a5)
        {
          BOOL v14 = [v13 domain];
          if ([v14 isEqualToString:*MEMORY[0x1E4F28798]])
          {
            uint64_t v15 = [v13 code];

            if (v15 == 2)
            {
              id v13 = v13;
              *a5 = v13;
              goto LABEL_17;
            }
          }
          else
          {
          }
          setErrorWrappingUnderlyingError(v13, @"QLThumbnailErrorDomain", 102, a5);
        }
LABEL_17:

        ssize_t v10 = 0;
        goto LABEL_18;
      }
    }
    else
    {
      id v13 = 0;
    }
    getpid();
    if (sandbox_check())
    {
      if (-[QLThumbnailAddition _initWithAdditionsPresentOnURLUsingDaemon:error:](v10, "_initWithAdditionsPresentOnURLUsingDaemon:error:", v8, a5, "com.apple.revisiond"))
      {
        goto LABEL_18;
      }
    }
    else if (-[QLThumbnailAddition _initWithAdditionsPresentOnURLDirectly:error:](v10, "_initWithAdditionsPresentOnURLDirectly:error:", v8, a5, "com.apple.revisiond"))
    {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_19:

  return v10;
}

- (QLThumbnailVersion)thumbnailVersion
{
  thumbnailVersion = self->_thumbnailVersion;
  if (!thumbnailVersion)
  {
    id v4 = [(QLThumbnailAddition *)self metadata];
    uint64_t v5 = [v4 valueForKey:@"QLThumbnailMetadataFileVersionKey.2"];

    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v6 = [[QLThumbnailVersion alloc] initWithDictionaryRepresentation:v5];
        ssize_t v7 = self->_thumbnailVersion;
        self->_thumbnailVersion = v6;
      }
    }

    thumbnailVersion = self->_thumbnailVersion;
  }

  return thumbnailVersion;
}

- (CGImage)thumbnailWithMaximumDimension:(double)a3 contentRect:(CGRect *)a4 properties:(id *)a5
{
  v31[4] = *MEMORY[0x1E4F143B8];
  CFDataRef v9 = [(QLThumbnailAddition *)self thumbnailDataForKey:*MEMORY[0x1E4F1C500]];
  CFDataRef v10 = v9;
  if (v9) {
    BOOL v11 = CGImageSourceCreateWithData(v9, 0);
  }
  else {
    BOOL v11 = 0;
  }
  id v12 = [(QLThumbnailAddition *)self metadata];
  id v13 = [v12 valueForKey:@"QLThumbnailMetadataMaximumDimensionKey"];
  [v13 doubleValue];
  double v15 = v14;

  if (!v11) {
    goto LABEL_17;
  }
  double v16 = 1024.0;
  if (v15 != 0.0) {
    double v16 = v15;
  }
  if (v16 <= a3)
  {
    uint64_t v28 = *MEMORY[0x1E4F2FF18];
    uint64_t v29 = MEMORY[0x1E4F1CC38];
    CFDictionaryRef v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v11, 0, v20);
  }
  else
  {
    uint64_t v17 = MEMORY[0x1E4F1CC38];
    uint64_t v18 = *MEMORY[0x1E4F2FE28];
    v30[0] = *MEMORY[0x1E4F2FE48];
    v30[1] = v18;
    v31[0] = MEMORY[0x1E4F1CC38];
    v31[1] = MEMORY[0x1E4F1CC38];
    v30[2] = *MEMORY[0x1E4F2FF68];
    v19 = [NSNumber numberWithDouble:a3];
    v30[3] = *MEMORY[0x1E4F2FF18];
    v31[2] = v19;
    v31[3] = v17;
    CFDictionaryRef v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:4];

    CGImageRef ImageAtIndex = CGImageSourceCreateThumbnailAtIndex(v11, 0, v20);
  }
  CGImageRef v22 = ImageAtIndex;

  CFRelease(v11);
  if (v22)
  {
    if (a5)
    {
      uint64_t v23 = [(QLThumbnailAddition *)self metadata];
      *a5 = [v23 valueForKey:@"QLThumbnailMetadataQLPropertiesKey"];
    }
    v24 = [(QLThumbnailAddition *)self metadata];
    uint64_t v25 = [v24 valueForKey:@"QLThumbnailMetadataContentRectKey"];

    if (a4 && v25) {
      *a4 = NSRectFromString(v25);
    }
    v26 = (CGImage *)CFAutorelease(v22);
  }
  else
  {
LABEL_17:
    v26 = 0;
  }

  return v26;
}

+ (id)additionCreationInfo
{
  v7[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F63B98];
  v6[0] = *MEMORY[0x1E4F63B90];
  v6[1] = v2;
  v7[0] = @"com.apple.thumbnails";
  v7[1] = &unk_1F0A96570;
  v6[2] = *MEMORY[0x1E4F63B88];
  id v3 = [MEMORY[0x1E4F63BD8] makeNameForUser:getuid() name:@"QLThumbnailAdditionName"];
  v7[2] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

+ (void)_hitAdditionsOnURL:(id)a3 size:(unint64_t)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v22 = 0;
  CFDataRef v9 = +[QLThumbnailServiceProxy sharedInstanceWithError:&v22];
  id v10 = v22;
  if (v9)
  {
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    char v21 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __65__QLThumbnailAddition__hitAdditionsOnURL_size_completionHandler___block_invoke;
    v18[3] = &unk_1E6009F78;
    id v11 = v8;
    id v19 = v11;
    id v12 = [v9 remoteObjectProxyWithErrorHandler:v18];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65__QLThumbnailAddition__hitAdditionsOnURL_size_completionHandler___block_invoke_104;
    v13[3] = &unk_1E6009FF0;
    id v15 = v11;
    double v16 = v20;
    unint64_t v17 = a4;
    id v14 = v7;
    [v12 askThumbnailAdditionIndex:v13];

    _Block_object_dispose(v20, 8);
  }
  else if (v8)
  {
    (*((void (**)(id, id))v8 + 2))(v8, v10);
  }
}

void __65__QLThumbnailAddition__hitAdditionsOnURL_size_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _log_0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __65__QLThumbnailAddition__hitAdditionsOnURL_size_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __65__QLThumbnailAddition__hitAdditionsOnURL_size_completionHandler___block_invoke_104(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v5 = [*(id *)(a1 + 32) path];
    BOOL v6 = [v4 fileURLWithPath:v5];

    id v24 = 0;
    id v7 = [getFPSandboxingURLWrapperClass() wrapperWithURL:v6 extensionClass:"com.apple.quicklook.readonly" error:&v24];
    id v8 = v24;
    if (v8)
    {
      CFDataRef v9 = _log_0();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[QLThumbnailServiceProxy touchOrAddThumbnailAddition:forURL:]();
      }
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __65__QLThumbnailAddition__hitAdditionsOnURL_size_completionHandler___block_invoke_106;
    v22[3] = &unk_1E6009F78;
    id v23 = *(id *)(a1 + 40);
    id v10 = [v3 remoteObjectProxyWithErrorHandler:v22];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __65__QLThumbnailAddition__hitAdditionsOnURL_size_completionHandler___block_invoke_107;
    v17[3] = &unk_1E6009FC8;
    id v18 = v10;
    id v19 = v7;
    uint64_t v21 = *(void *)(a1 + 56);
    long long v16 = *(_OWORD *)(a1 + 40);
    id v11 = (id)v16;
    long long v20 = v16;
    id v12 = v7;
    id v13 = v10;
    [v13 hasThumbnailForURLWrapper:v12 updateLastHitDate:1 andSize:v21 completion:v17];
  }
  else
  {
    id v14 = _log_0();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __65__QLThumbnailAddition__hitAdditionsOnURL_size_completionHandler___block_invoke_104_cold_1();
    }

    uint64_t v15 = *(void *)(a1 + 40);
    if (v15) {
      (*(void (**)(uint64_t, void))(v15 + 16))(v15, 0);
    }
  }
}

void __65__QLThumbnailAddition__hitAdditionsOnURL_size_completionHandler___block_invoke_106(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _log_0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __65__QLThumbnailAddition__hitAdditionsOnURL_size_completionHandler___block_invoke_106_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __65__QLThumbnailAddition__hitAdditionsOnURL_size_completionHandler___block_invoke_107(void *a1, char a2)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
    uint64_t v2 = a1[6];
    if (v2)
    {
      id v3 = *(void (**)(void))(v2 + 16);
      v3();
    }
  }
  else
  {
    id v4 = (void *)a1[4];
    uint64_t v5 = a1[5];
    uint64_t v6 = a1[8];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__QLThumbnailAddition__hitAdditionsOnURL_size_completionHandler___block_invoke_2;
    v9[3] = &unk_1E6009FA0;
    long long v8 = *((_OWORD *)a1 + 3);
    id v7 = (id)v8;
    long long v10 = v8;
    [v4 addThumbnailForURLWrapper:v5 size:v6 completion:v9];
  }
}

uint64_t __65__QLThumbnailAddition__hitAdditionsOnURL_size_completionHandler___block_invoke_2(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

+ (BOOL)storeThumbnailDataDictionary:(id)a3 metadata:(id)a4 asExtendedAttributeOnURL:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = open((const char *)[a5 fileSystemRepresentation], 4);
  if ((v12 & 0x80000000) != 0)
  {
    if (a6)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
      char v14 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_7:
    char v14 = 0;
    goto LABEL_8;
  }
  uint64_t v13 = v12;
  if (([a1 setPropertyList:v10 forExtendedAttributeNamed:QLThumbnailDictionaryXattrName flags:3 onFileDescriptor:v12 error:a6] & 1) == 0)
  {
    close(v13);
    goto LABEL_7;
  }
  char v14 = [a1 setPropertyList:v11 forExtendedAttributeNamed:QLThumbnailMetadataXattrName flags:3 onFileDescriptor:v13 error:a6];
  close(v13);
LABEL_8:

  return v14;
}

+ (BOOL)removeThumbnailsStoredInExtendedAttributesOnURL:(id)a3 error:(id *)a4
{
  uint64_t v6 = open((const char *)[a3 fileSystemRepresentation], 4);
  if ((v6 & 0x80000000) != 0)
  {
    if (a4)
    {
      *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
    }
  }
  else
  {
    uint64_t v7 = v6;
    if ([a1 removeExtendedAttributeNamed:QLThumbnailDictionaryXattrName flags:3 onFileDescriptor:v6 error:a4])
    {
      char v8 = [a1 removeExtendedAttributeNamed:QLThumbnailMetadataXattrName flags:3 onFileDescriptor:v7 error:a4];
      close(v7);
      return v8;
    }
    close(v7);
  }
  return 0;
}

+ (BOOL)associateThumbnailImagesDictionary:(id)a3 serializedQuickLookMetadata:(id)a4 withDocumentAtURL:(id)a5 error:(id *)a6
{
  return [a1 associateThumbnailImagesDictionary:a3 serializedQuickLookMetadata:a4 withImmutableDocument:0 atURL:a5 error:a6];
}

+ (id)imageNameFor1024ThumbnailInMetadataDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKey:@"QLThumbnailMetadataFileNamesDictionaryKey"];
  uint64_t v5 = [v4 objectForKey:*MEMORY[0x1E4F1C500]];

  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    id v6 = [v3 objectForKey:@"QLThumbnailMetadataFileNameKey"];
  }
  uint64_t v7 = v6;

  return v7;
}

+ (id)imageNameForThumbnailInImageSource:(CGImageSource *)a3
{
  CFStringRef Type = CGImageSourceGetType(a3);
  if (Type)
  {
    id v4 = [MEMORY[0x1E4F442D8] typeWithIdentifier:Type];
    uint64_t v5 = v4;
    if (v4)
    {
      id v6 = [v4 preferredFilenameExtension];
      if (v6)
      {
        uint64_t v7 = [@"thumbnail" stringByAppendingPathExtension:v6];
      }
      else
      {
        uint64_t v7 = 0;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)imageNameFor1024ThumbnailAtURL:(id)a3 metadataDictionary:(id)a4
{
  CFURLRef v6 = (const __CFURL *)a3;
  uint64_t v7 = [a1 imageNameFor1024ThumbnailInMetadataDictionary:a4];
  if (!v7)
  {
    CGImageSourceRef v8 = CGImageSourceCreateWithURL(v6, 0);
    if (v8)
    {
      CGImageSourceRef v9 = v8;
      uint64_t v7 = [a1 imageNameForThumbnailInImageSource:v8];
      CFRelease(v9);
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  id v10 = v7;

  return v10;
}

+ (id)imageNameFor1024ThumbnailData:(id)a3 metadataDictionary:(id)a4
{
  CFDataRef v6 = (const __CFData *)a3;
  uint64_t v7 = [a1 imageNameFor1024ThumbnailInMetadataDictionary:a4];
  if (!v7)
  {
    CGImageSourceRef v8 = CGImageSourceCreateWithData(v6, 0);
    if (v8)
    {
      CGImageSourceRef v9 = v8;
      uint64_t v7 = [a1 imageNameForThumbnailInImageSource:v8];
      CFRelease(v9);
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  id v10 = v7;

  return v10;
}

+ (BOOL)associateThumbnailImagesDictionary:(id)a3 serializedQuickLookMetadata:(id)a4 withImmutableDocument:(BOOL)a5 atURL:(id)a6 error:(id *)a7
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v13 = [v10 allValues];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v63 objects:v71 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = 0;
    uint64_t v17 = *(void *)v64;
    uint64_t v18 = *MEMORY[0x1E4F1C5F8];
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v64 != v17) {
          objc_enumerationMutation(v13);
        }
        long long v20 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        id v62 = 0;
        if ([v20 getResourceValue:&v62 forKey:v18 error:0]) {
          v16 += [v62 unsignedIntegerValue];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v63 objects:v71 count:16];
    }
    while (v15);
  }
  else
  {
    uint64_t v16 = 0;
  }

  uint64_t v21 = *MEMORY[0x1E4F1C500];
  id v22 = [v10 objectForKey:*MEMORY[0x1E4F1C500]];
  id v23 = v22;
  if (v22)
  {
    id v61 = 0;
    char v24 = [v22 checkResourceIsReachableAndReturnError:&v61];
    id v25 = v61;
    v26 = v25;
    if ((v24 & 1) == 0)
    {
      v30 = _log_0();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        +[QLThumbnailAddition associateThumbnailImagesDictionary:serializedQuickLookMetadata:withImmutableDocument:atURL:error:]();
      }

      char v29 = 0;
      if (a7) {
        *a7 = v26;
      }
      goto LABEL_50;
    }
    id v56 = v25;
    if (v11)
    {
      v27 = [MEMORY[0x1E4F28F98] propertyListWithData:v11 options:0 format:0 error:0];
    }
    else
    {
      v27 = 0;
    }
    uint64_t v31 = [a1 imageNameFor1024ThumbnailAtURL:v23 metadataDictionary:v27];
    v32 = (void *)v31;
    if (!v31)
    {
      v36 = _log_0();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        +[QLThumbnailAddition associateThumbnailImagesDictionary:serializedQuickLookMetadata:withImmutableDocument:atURL:error:]();
      }

      if (a7)
      {
        [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:259 userInfo:0];
        char v29 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        char v29 = 0;
      }
      v42 = v27;
      goto LABEL_49;
    }
    v53 = (void *)v31;
    id v54 = v11;
    uint64_t v69 = v21;
    uint64_t v70 = v31;
    v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
    v34 = [[QLThumbnailVersion alloc] initWithFileURL:v12 automaticallyGenerated:0];
    v35 = [(QLThumbnailVersion *)v34 dictionaryRepresentation];
    if (v27)
    {
      v55 = (void *)[v27 mutableCopy];
      [v55 setObject:v33 forKeyedSubscript:@"QLThumbnailMetadataFileNamesDictionaryKey"];
      if (!v35)
      {
LABEL_38:

        [a1 _hitAdditionsOnURL:v12 size:v16 completionHandler:0];
        if (a5)
        {
          v39 = [MEMORY[0x1E4F1CA60] dictionary];
          v59[0] = MEMORY[0x1E4F143A8];
          v59[1] = 3221225472;
          v59[2] = __120__QLThumbnailAddition_associateThumbnailImagesDictionary_serializedQuickLookMetadata_withImmutableDocument_atURL_error___block_invoke;
          v59[3] = &unk_1E600A018;
          id v60 = v39;
          id v40 = v39;
          [v10 enumerateKeysAndObjectsUsingBlock:v59];
          id v41 = a1;
          v42 = v55;
          char v29 = [v41 storeThumbnailDataDictionary:v40 metadata:v55 asExtendedAttributeOnURL:v12 error:a7];
          [v10 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_7];

          v32 = v53;
          id v11 = v54;
        }
        else
        {
          v43 = [MEMORY[0x1E4F63BE8] manager];
          v44 = [v43 permanentStorageForItemAtURL:v12 allocateIfNone:1 error:a7];

          id v11 = v54;
          if (v44)
          {
            v45 = [v44 stagingURLforCreatingAdditionWithError:a7];
            v46 = v45;
            if (v45)
            {
              v47 = [v45 URLByAppendingPathComponent:@"thumbnail.qlthumbnail"];
              v48 = [v47 URLByAppendingPathComponent:v53 isDirectory:0];
              v49 = [MEMORY[0x1E4F28CB8] defaultManager];
              [v49 createDirectoryAtURL:v47 withIntermediateDirectories:0 attributes:0 error:0];

              v50 = [MEMORY[0x1E4F28CB8] defaultManager];
              [v50 moveItemAtURL:v23 toURL:v48 error:0];

              [a1 adjustFileProtectionForThumbnail:v48 fromOriginalDocument:v12];
              id v51 = a1;
              v42 = v55;
              char v29 = [v51 makeAdditionFromStagingURL:v47 metadata:v55 inStorage:v44 error:a7];

              id v11 = v54;
            }
            else
            {
              char v29 = 0;
              v42 = v55;
            }

            v32 = v53;
          }
          else
          {
            char v29 = 0;
            v32 = v53;
            v42 = v55;
          }
        }
LABEL_49:

        v26 = v56;
LABEL_50:

        goto LABEL_51;
      }
    }
    else
    {
      v67 = @"QLThumbnailMetadataFileNamesDictionaryKey";
      v68 = v33;
      v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
      v55 = (void *)[v37 mutableCopy];

      if (!v35) {
        goto LABEL_38;
      }
    }
    v38 = [v55 objectForKeyedSubscript:@"QLThumbnailMetadataFileVersionKey.2"];

    if (!v38) {
      [v55 setObject:v35 forKeyedSubscript:@"QLThumbnailMetadataFileVersionKey.2"];
    }
    goto LABEL_38;
  }
  uint64_t v28 = _log_0();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    +[QLThumbnailAddition associateThumbnailImagesDictionary:serializedQuickLookMetadata:withImmutableDocument:atURL:error:]();
  }

  if (a7)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    char v29 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v29 = 0;
  }
LABEL_51:

  return v29;
}

void __120__QLThumbnailAddition_associateThumbnailImagesDictionary_serializedQuickLookMetadata_withImmutableDocument_atURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFDataRef v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v5 options:1 error:0];
    if (v6) {
      [*(id *)(a1 + 32) setObject:v6 forKey:v7];
    }
  }
}

void __120__QLThumbnailAddition_associateThumbnailImagesDictionary_serializedQuickLookMetadata_withImmutableDocument_atURL_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v3 removeItemAtURL:v4 error:0];
  }
}

+ (void)adjustFileProtectionForThumbnail:(id)a3 fromOriginalDocument:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    id v19 = 0;
    uint64_t v8 = *MEMORY[0x1E4F1C590];
    id v18 = 0;
    int v9 = [v6 getResourceValue:&v19 forKey:v8 error:&v18];
    id v10 = v19;
    id v11 = v18;
    id v12 = v11;
    if (v9) {
      BOOL v13 = v10 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13)
    {
      uint64_t v14 = _log_0();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        +[QLThumbnailAddition adjustFileProtectionForThumbnail:fromOriginalDocument:]();
      }
      id v16 = v12;
    }
    else
    {
      id v17 = v11;
      char v15 = [v5 setResourceValue:v10 forKey:v8 error:&v17];
      id v16 = v17;

      if (v15) {
        goto LABEL_14;
      }
      uint64_t v14 = _log_0();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        +[QLThumbnailAddition adjustFileProtectionForThumbnail:fromOriginalDocument:]();
      }
    }

LABEL_14:
  }
}

+ (BOOL)hasThumbnailOnImmutableDocumentAtURL:(id)a3
{
  id v3 = (const char *)[a3 fileSystemRepresentation];
  id v4 = xattr_name_with_flags((const char *)QLThumbnailDictionaryXattrName, 3uLL);
  if (!v4) {
    return 0;
  }
  id v5 = v4;
  BOOL v6 = getxattr(v3, v4, 0, 0, 0, 0) >= 0;
  free(v5);
  return v6;
}

+ (BOOL)makeAdditionFromStagingURL:(id)a3 metadata:(id)a4 inStorage:(id)a5 error:(id *)a6
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(id)objc_opt_class() additionCreationInfo];
  BOOL v13 = (void *)[v12 mutableCopy];

  if (v10)
  {
    v46 = @"QLThumbnailAdditionMetadataKey";
    v47[0] = v10;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:&v46 count:1];
    [v13 setObject:v14 forKey:*MEMORY[0x1E4F63BB0]];
  }
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  id v41 = __Block_byref_object_copy__3;
  v42 = __Block_byref_object_dispose__3;
  id v43 = 0;
  id obj = 0;
  char v15 = [v11 prepareAdditionCreationWithItemAtURL:v9 byMoving:1 creationInfo:v13 error:&obj];
  objc_storeStrong(&v43, obj);
  if (v15)
  {
    id v16 = [v11 documentURL];
    id v36 = 0;
    char v17 = [v16 getResourceValue:&v36 forKey:*MEMORY[0x1E4F1C550] error:0];
    id v18 = v36;

    if ((v17 & 1) == 0)
    {

      id v18 = 0;
    }
    dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2020000000;
    char v35 = 0;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __75__QLThumbnailAddition_makeAdditionFromStagingURL_metadata_inStorage_error___block_invoke;
    v27[3] = &unk_1E600A060;
    v30 = &v32;
    id v20 = v18;
    id v28 = v20;
    uint64_t v31 = &v38;
    uint64_t v21 = v19;
    char v29 = v21;
    [v11 createAdditionStagedAtURL:v15 creationInfo:v13 completionHandler:v27];
    dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
    if (*((unsigned char *)v33 + 24))
    {
      id v22 = _log_0();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v45 = v11;
        _os_log_impl(&dword_1B281E000, v22, OS_LOG_TYPE_INFO, "Saved addition in storage %@", buf, 0xCu);
      }
    }
    else
    {
      id v25 = _log_0();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        +[QLThumbnailAddition makeAdditionFromStagingURL:metadata:inStorage:error:]();
      }

      setErrorWrappingUnderlyingError((void *)v39[5], @"QLThumbnailErrorDomain", 101, a6);
    }
    BOOL v24 = *((unsigned char *)v33 + 24) != 0;

    _Block_object_dispose(&v32, 8);
  }
  else
  {
    id v23 = _log_0();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      +[QLThumbnailAddition makeAdditionFromStagingURL:metadata:inStorage:error:]();
    }

    setErrorWrappingUnderlyingError((void *)v39[5], @"QLThumbnailErrorDomain", 101, a6);
    BOOL v24 = 0;
  }

  _Block_object_dispose(&v38, 8);
  return v24;
}

void __75__QLThumbnailAddition_makeAdditionFromStagingURL_metadata_inStorage_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9 != 0;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (!*(void *)(a1 + 32)) {
      goto LABEL_6;
    }
    BOOL v6 = +[QLThumbnailAdditionCache sharedInstance];
    [v6 cacheAddition:v9 forDocumentID:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    id v8 = v5;
    BOOL v6 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v8;
  }

LABEL_6:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (BOOL)imageContainsAlphaForOtherImages:(CGImage *)a3
{
  unint64_t Width = CGImageGetWidth(a3);
  unint64_t Height = CGImageGetHeight(a3);
  DeviceGray = CGColorSpaceCreateDeviceGray();
  uint64_t v7 = CGBitmapContextCreate(0, Width, Height, 8uLL, Width, DeviceGray, 7u);
  CFRelease(DeviceGray);
  if (!v7) {
    return 0;
  }
  size_t BytesPerRow = CGBitmapContextGetBytesPerRow(v7);
  if (CGBitmapContextGetBitsPerPixel(v7) != 8) {
    +[QLThumbnailAddition imageContainsAlphaForOtherImages:]();
  }
  v15.size.width = (double)Width;
  v15.size.height = (double)Height;
  v15.origin.x = 0.0;
  v15.origin.y = 0.0;
  CGContextDrawImage(v7, v15, a3);
  Data = (char *)CGBitmapContextGetData(v7);
  if (Height)
  {
    for (uint64_t i = 0; i != Height; ++i)
    {
      unint64_t v11 = (unint64_t)&Data[Width - 8];
      id v12 = Data;
      if ((unint64_t)Data >= v11) {
        goto LABEL_11;
      }
      do
      {
        if (*(void *)v12 != -1)
        {
LABEL_14:
          BOOL v13 = 1;
          goto LABEL_15;
        }
        v12 += 8;
      }
      while ((unint64_t)v12 < v11);
LABEL_11:
      while (v12 < &Data[Width])
      {
        if (*v12 != 255) {
          goto LABEL_14;
        }
        ++v12;
      }
      Data += BytesPerRow;
    }
  }
  BOOL v13 = 0;
LABEL_15:
  CGContextRelease(v7);
  return v13;
}

+ (BOOL)imageContainsAlpha:(CGImage *)a3
{
  if (CGImageGetBitsPerComponent(a3) == 8)
  {
    CGBitmapInfo v5 = CGImageGetBitmapInfo(a3) & 0x1F;
    size_t BitsPerPixel = CGImageGetBitsPerPixel(a3);
    size_t v7 = 0;
    BOOL result = 0;
    size_t v9 = BitsPerPixel >> 3;
    switch(v5)
    {
      case 0u:
      case 5u:
      case 6u:
        return result;
      case 1u:
      case 3u:
        size_t v7 = v9 - 1;
        goto LABEL_4;
      case 2u:
      case 4u:
LABEL_4:
        DataProvider = CGImageGetDataProvider(a3);
        CFDataRef v11 = CGDataProviderCopyData(DataProvider);
        size_t Width = CGImageGetWidth(a3);
        size_t Height = CGImageGetHeight(a3);
        size_t BytesPerRow = CGImageGetBytesPerRow(a3);
        CFDataRef v15 = v11;
        uint64_t v16 = [(__CFData *)v15 bytes];
        if (!Height) {
          goto LABEL_11;
        }
        uint64_t v17 = 0;
        uint64_t v18 = Width * v9;
        break;
      default:
        goto LABEL_12;
    }
    while (v18 < 1)
    {
LABEL_10:
      v16 += BytesPerRow;
      if (++v17 == Height)
      {
LABEL_11:
        CFRelease(v15);
        return 0;
      }
    }
    unint64_t v19 = v16;
    while (*(unsigned __int8 *)(v19 + v7) == 255)
    {
      v19 += v9;
      if (v19 >= v16 + v18) {
        goto LABEL_10;
      }
    }
    CFRelease(v15);
    return 1;
  }
  else
  {
LABEL_12:
    return [a1 imageContainsAlphaForOtherImages:a3];
  }
}

+ (id)metadataForGeneratedThumbnailForURL:(id)a3 maximumDimension:(double)a4
{
  CGBitmapInfo v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  size_t v7 = [v5 dictionary];
  id v8 = [[QLThumbnailVersion alloc] initWithFileURL:v6 automaticallyGenerated:1];

  size_t v9 = [(QLThumbnailVersion *)v8 dictionaryRepresentation];
  [v7 setValue:v9 forKey:@"QLThumbnailMetadataFileVersionKey.2"];

  id v10 = [NSNumber numberWithDouble:a4];
  [v7 setObject:v10 forKey:@"QLThumbnailMetadataMaximumDimensionKey"];

  return v7;
}

+ (BOOL)associateImage:(CGImage *)a3 metadata:(id)a4 automaticallyGenerated:(BOOL)a5 withURL:(id)a6 error:(id *)a7
{
  BOOL v9 = a5;
  v58[1] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a6;
  uint64_t v14 = _log_0();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    +[QLThumbnailAddition associateImage:metadata:automaticallyGenerated:withURL:error:].cold.4();
  }

  int v15 = [a1 imageContainsAlpha:a3];
  uint64_t v16 = [MEMORY[0x1E4F63BE8] manager];
  id v56 = 0;
  uint64_t v17 = [v16 permanentStorageForItemAtURL:v13 allocateIfNone:1 error:&v56];
  id v18 = v56;

  if (v17)
  {
    id v55 = v18;
    uint64_t v19 = [v17 stagingURLforCreatingAdditionWithError:&v55];
    id v52 = v55;

    v53 = (void *)v19;
    if (v19)
    {
      BOOL v49 = v9;
      v50 = a7;
      size_t Width = CGImageGetWidth(a3);
      size_t Height = CGImageGetHeight(a3);
      if (Width <= Height) {
        unint64_t v22 = Height;
      }
      else {
        unint64_t v22 = Width;
      }
      double v23 = (double)v22;
      if (v15) {
        BOOL v24 = @"jp2";
      }
      else {
        BOOL v24 = @"jpg";
      }
      uint64_t v25 = [@"thumbnail" stringByAppendingPathExtension:v24];
      v26 = [MEMORY[0x1E4F1CA60] dictionary];
      v27 = [NSNumber numberWithDouble:v23];
      [v26 setObject:v27 forKey:@"QLThumbnailMetadataMaximumDimensionKey"];

      uint64_t v57 = *MEMORY[0x1E4F1C500];
      v58[0] = v25;
      id v51 = (void *)v25;
      id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:&v57 count:1];
      [v26 setObject:v28 forKey:@"QLThumbnailMetadataFileNamesDictionaryKey"];

      char v29 = [NSNumber numberWithInteger:1];
      [v26 setObject:v29 forKey:@"QLThumbnailMetadataVersionKey"];

      if (v12) {
        [v26 addEntriesFromDictionary:v12];
      }
      v30 = [v26 valueForKey:@"QLThumbnailMetadataFileVersionKey.2"];

      if (!v30)
      {
        uint64_t v31 = [[QLThumbnailVersion alloc] initWithFileURL:v13 automaticallyGenerated:v49];
        uint64_t v32 = _log_0();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          +[QLThumbnailAddition associateImage:metadata:automaticallyGenerated:withURL:error:]();
        }

        v33 = [(QLThumbnailVersion *)v31 dictionaryRepresentation];
        [v26 setValue:v33 forKey:@"QLThumbnailMetadataFileVersionKey.2"];
      }
      uint64_t v34 = [v53 URLByAppendingPathComponent:@"thumbnail.qlthumbnail"];
      char v35 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v35 createDirectoryAtURL:v34 withIntermediateDirectories:0 attributes:0 error:0];

      CFURLRef v36 = [v34 URLByAppendingPathComponent:v51 isDirectory:0];
      CFURLRef v37 = v36;
      if (v15)
      {
        uint64_t v38 = CGImageDestinationCreateWithURL(v36, (CFStringRef)*MEMORY[0x1E4F22618], 1uLL, 0);
      }
      else
      {
        v42 = [(id)*MEMORY[0x1E4F44410] identifier];
        uint64_t v38 = CGImageDestinationCreateWithURL(v37, v42, 1uLL, 0);
      }
      CFDictionaryRef v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:&unk_1F0A96588 forKey:*MEMORY[0x1E4F2F430]];
      CGImageDestinationSetProperties(v38, v43);
      CGImageDestinationAddImage(v38, a3, 0);
      CGImageDestinationFinalize(v38);
      CFRelease(v38);
      [a1 adjustFileProtectionForThumbnail:v37 fromOriginalDocument:v13];
      id v54 = 0;
      int v44 = [(__CFURL *)v37 getResourceValue:&v54 forKey:*MEMORY[0x1E4F1C5F8] error:0];
      id v45 = v54;
      v46 = v45;
      uint64_t v47 = 0;
      if (v44) {
        uint64_t v47 = [v45 unsignedIntegerValue];
      }
      [a1 _hitAdditionsOnURL:v13 size:v47 completionHandler:0];
      char v40 = [a1 makeAdditionFromStagingURL:v34 metadata:v26 inStorage:v17 error:v50];

      id v18 = v52;
    }
    else
    {
      id v41 = _log_0();
      id v18 = v52;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        +[QLThumbnailAddition associateImage:metadata:automaticallyGenerated:withURL:error:]();
      }

      setErrorWrappingUnderlyingError(v52, @"QLThumbnailErrorDomain", 101, a7);
      char v40 = 0;
    }
  }
  else
  {
    v39 = _log_0();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      +[QLThumbnailAddition associateImage:metadata:automaticallyGenerated:withURL:error:]();
    }

    setErrorWrappingUnderlyingError(v18, @"QLThumbnailErrorDomain", 101, a7);
    char v40 = 0;
  }

  return v40;
}

+ (BOOL)_removeAdditionsOnURLDirectly:(id)a3 error:(id *)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F63BE8] manager];
  id v31 = 0;
  size_t v7 = [v6 permanentStorageForItemAtURL:v5 allocateIfNone:0 error:&v31];
  id v8 = v31;
  BOOL v9 = v8;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 1;
  uint64_t v21 = 0;
  unint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  BOOL v24 = __Block_byref_object_copy__3;
  uint64_t v25 = __Block_byref_object_dispose__3;
  id v26 = 0;
  if (v7)
  {
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    v32[0] = @"com.apple.thumbnails";
    CFDataRef v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __59__QLThumbnailAddition__removeAdditionsOnURLDirectly_error___block_invoke;
    v16[3] = &unk_1E600A088;
    uint64_t v19 = &v27;
    id v20 = &v21;
    id v17 = v5;
    id v12 = v10;
    id v18 = v12;
    [v7 removeAllAdditionsForNamespaces:v11 completionHandler:v16];

    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    if (a4)
    {
      id v13 = (void *)v22[5];
      if (v13) {
        *a4 = v13;
      }
    }
  }
  else
  {
    char v30 = 0;
    setErrorWrappingUnderlyingError(v8, (void *)*MEMORY[0x1E4F281F8], 4, a4);
  }
  BOOL v14 = *((unsigned char *)v28 + 24) != 0;
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v14;
}

void __59__QLThumbnailAddition__removeAdditionsOnURLDirectly_error___block_invoke(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v4 = (uint64_t *)MEMORY[0x1E4F28A50];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    uint64_t v12 = *v4;
    v13[0] = a2;
    id v5 = (void *)MEMORY[0x1E4F1C9E8];
    id v6 = a2;
    size_t v7 = [v5 dictionaryWithObjects:v13 forKeys:&v12 count:1];
    uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4 userInfo:v7];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    dispatch_semaphore_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  else
  {
    id v11 = 0;
    size_t v7 = +[QLThumbnailAdditionCache sharedInstance];
    [v7 purgeCachedAdditionForItemAtURL:*(void *)(a1 + 32)];
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (BOOL)_removeAdditionsOnURLUsingDaemon:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 1;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__3;
  id v20 = __Block_byref_object_dispose__3;
  id v21 = 0;
  id v6 = +[QLThumbnailServiceProxy sharedInstance];
  if (v6)
  {
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__QLThumbnailAddition__removeAdditionsOnURLUsingDaemon_error___block_invoke;
    v12[3] = &unk_1E600A0B0;
    BOOL v14 = &v22;
    int v15 = &v16;
    uint64_t v8 = v7;
    id v13 = v8;
    [v6 removeThumbnailAdditionsOnURL:v5 completionBlock:v12];
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    int v9 = *((unsigned __int8 *)v23 + 24);
    if (!*((unsigned char *)v23 + 24))
    {
      setErrorWrappingUnderlyingError((void *)v17[5], (void *)*MEMORY[0x1E4F281F8], 4, a4);
      int v9 = *((unsigned __int8 *)v23 + 24);
    }
    BOOL v10 = v9 != 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

void __62__QLThumbnailAddition__removeAdditionsOnURLUsingDaemon_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    id v5 = _log_0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __71__QLThumbnailAddition__initWithAdditionsPresentOnURLUsingDaemon_error___block_invoke_95_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (BOOL)_removedAdditionsOnURLUsingDaemon:(id)a3
{
  id v3 = a3;
  id v4 = +[QLThumbnailServiceProxy sharedInstance];
  if (v4)
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __57__QLThumbnailAddition__removedAdditionsOnURLUsingDaemon___block_invoke;
    v15[3] = &unk_1E6009CF0;
    id v6 = v5;
    uint64_t v16 = v6;
    dispatch_semaphore_t v7 = [v4 remoteObjectProxyWithErrorHandler:v15];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__QLThumbnailAddition__removedAdditionsOnURLUsingDaemon___block_invoke_2;
    v11[3] = &unk_1E600A100;
    uint64_t v8 = v6;
    uint64_t v12 = v8;
    id v13 = v3;
    BOOL v14 = &v17;
    [v7 askThumbnailAdditionIndex:v11];

    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    BOOL v9 = *((unsigned char *)v18 + 24) != 0;

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

intptr_t __57__QLThumbnailAddition__removedAdditionsOnURLUsingDaemon___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __57__QLThumbnailAddition__removedAdditionsOnURLUsingDaemon___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__QLThumbnailAddition__removedAdditionsOnURLUsingDaemon___block_invoke_125;
    v10[3] = &unk_1E6009CF0;
    id v11 = *(id *)(a1 + 32);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v10];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__QLThumbnailAddition__removedAdditionsOnURLUsingDaemon___block_invoke_2_126;
    v7[3] = &unk_1E600A0D8;
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    id v8 = *(id *)(a1 + 32);
    [v4 removeThumbnailForURL:v5 completion:v7];
  }
  else
  {
    id v6 = _log_0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __65__QLThumbnailAddition__hitAdditionsOnURL_size_completionHandler___block_invoke_104_cold_1();
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

intptr_t __57__QLThumbnailAddition__removedAdditionsOnURLUsingDaemon___block_invoke_125(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __57__QLThumbnailAddition__removedAdditionsOnURLUsingDaemon___block_invoke_2_126(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (BOOL)removeAdditionsOnURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  getpid();
  int v7 = sandbox_check();
  id v8 = _log_0();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (!v7)
  {
    if (v9) {
      +[QLThumbnailAddition removeAdditionsOnURL:error:]();
    }

    if (objc_msgSend(a1, "_removeAdditionsOnURLDirectly:error:", v6, a4, "com.apple.revisiond")) {
      goto LABEL_5;
    }
LABEL_9:
    char v10 = 0;
    goto LABEL_10;
  }
  if (v9) {
    +[QLThumbnailAddition removeAdditionsOnURL:error:]();
  }

  if (!objc_msgSend(a1, "_removeAdditionsOnURLUsingDaemon:error:", v6, a4, "com.apple.revisiond")) {
    goto LABEL_9;
  }
LABEL_5:
  char v10 = [a1 _removedAdditionsOnURL:v6];
LABEL_10:

  return v10;
}

- (id)thumbnailsDictionaryWithError:(id *)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = QLTImageClassWithError(a3);
  if (v4)
  {
    uint64_t v5 = [(QLThumbnailAddition *)self thumbnailWithMaximumDimension:0 contentRect:0 properties:1024.0];
    if (v5)
    {
      uint64_t v8 = *MEMORY[0x1E4F1C500];
      id v6 = [v4 imageWithCGImage:v5];
      v9[0] = v6;
      id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

+ (id)thumbnailsDictionaryForURL:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v25 = 0;
  int v7 = (void *)[objc_alloc((Class)a1) initWithAdditionsPresentOnURL:v6 error:&v25];
  id v8 = v25;
  BOOL v9 = v8;
  if (!v7)
  {
    id v13 = [v8 domain];
    if ([v13 isEqualToString:@"QLThumbnailErrorDomain"])
    {
      uint64_t v14 = [v9 code];

      if (v14 == 102)
      {
        int v15 = _log_0();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v27 = v6;
          _os_log_impl(&dword_1B281E000, v15, OS_LOG_TYPE_INFO, "No thumbnail present for %@, pondering generation", buf, 0xCu);
        }

        if (thumbnailsDictionaryForURL_error__once != -1) {
          dispatch_once(&thumbnailsDictionaryForURL_error__once, &__block_literal_global_128);
        }
        uint64_t v16 = thumbnailsDictionaryForURL_error__sDownloadingQueue;
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __56__QLThumbnailAddition_thumbnailsDictionaryForURL_error___block_invoke_2;
        v22[3] = &unk_1E600A128;
        id v23 = v6;
        id v24 = a1;
        dispatch_async(v16, v22);

LABEL_19:
        uint64_t v12 = 0;
        goto LABEL_20;
      }
    }
    else
    {
    }
    uint64_t v17 = _log_0();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[QLThumbnailAddition thumbnailsDictionaryForURL:error:]();
    }

    if (a4)
    {
      uint64_t v12 = 0;
      *a4 = v9;
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  char v10 = _log_0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v6;
    _os_log_impl(&dword_1B281E000, v10, OS_LOG_TYPE_INFO, "Retrieved thumbnail addition for %@", buf, 0xCu);
  }

  if (thumbnailsDictionaryForURL_error__once_130 != -1) {
    dispatch_once(&thumbnailsDictionaryForURL_error__once_130, &__block_literal_global_133);
  }
  id v11 = thumbnailsDictionaryForURL_error__hitAdditionsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__QLThumbnailAddition_thumbnailsDictionaryForURL_error___block_invoke_2_135;
  block[3] = &unk_1E600A128;
  id v21 = a1;
  id v20 = v6;
  dispatch_async(v11, block);

  uint64_t v12 = [v7 thumbnailsDictionaryWithError:a4];
LABEL_20:

  return v12;
}

void __56__QLThumbnailAddition_thumbnailsDictionaryForURL_error___block_invoke()
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.quicklook.thumbnailretrieval", v0);
  uint64_t v2 = (void *)thumbnailsDictionaryForURL_error__sDownloadingQueue;
  thumbnailsDictionaryForURL_error__sDownloadingQueue = (uint64_t)v1;
}

void __56__QLThumbnailAddition_thumbnailsDictionaryForURL_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F63BE8] manager];
  uint64_t v3 = *(void *)(a1 + 32);
  id v8 = 0;
  char v4 = [v2 mayPermanentStorageBeSupportedAtURL:v3 error:&v8];
  id v5 = v8;
  if (v4)
  {

LABEL_4:
    [(id)objc_opt_class() downloadOrGenerateThumbnailAtURL:*(void *)(a1 + 32) completionHandler:0];
    goto LABEL_8;
  }
  char v6 = [*(id *)(a1 + 40) shouldUseXattrsToStoreThumbnailsOnURL:*(void *)(a1 + 32)];

  if (v6) {
    goto LABEL_4;
  }
  int v7 = _log_0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __56__QLThumbnailAddition_thumbnailsDictionaryForURL_error___block_invoke_2_cold_1();
  }

LABEL_8:
}

void __56__QLThumbnailAddition_thumbnailsDictionaryForURL_error___block_invoke_131()
{
  uint64_t v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.quicklook.thumbnails-maintenance", v2);
  dispatch_queue_t v1 = (void *)thumbnailsDictionaryForURL_error__hitAdditionsQueue;
  thumbnailsDictionaryForURL_error__hitAdditionsQueue = (uint64_t)v0;
}

uint64_t __56__QLThumbnailAddition_thumbnailsDictionaryForURL_error___block_invoke_2_135(uint64_t a1)
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 _hitAdditionsOnURL:v3 size:0 completionHandler:0];
}

+ (void)downloadOrGenerateThumbnailAtURL:(id)a3
{
}

+ (void)downloadOrGenerateThumbnailAtURL:(id)a3 completionHandler:(id)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = [v6 startAccessingSecurityScopedResource];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__QLThumbnailAddition_downloadOrGenerateThumbnailAtURL_completionHandler___block_invoke;
  aBlock[3] = &unk_1E600A150;
  char v28 = v8;
  id v9 = v6;
  id v26 = v9;
  id v10 = v7;
  id v27 = v10;
  id v11 = _Block_copy(aBlock);
  if (_CFURLIsItemPromiseAtURL())
  {
    uint64_t v12 = _log_0();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      +[QLThumbnailAddition downloadOrGenerateThumbnailAtURL:completionHandler:]();
    }

    id v13 = (id)_CFURLCopyLogicalURLOfPromiseAtURL();
    if (v13)
    {
LABEL_5:
      [a1 downloadOrGenerateThumbnailAtTaggedURL:v13 completionHandler:v11];
LABEL_15:

      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v14 = (void *)_CFURLPromiseCopyPhysicalURL();
    int v15 = _log_0();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
    if (!v14)
    {
      if (v16) {
        +[QLThumbnailAddition downloadOrGenerateThumbnailAtURL:completionHandler:]();
      }

      id v13 = objc_alloc_init(MEMORY[0x1E4F28CA0]);
      uint64_t v17 = [MEMORY[0x1E4F28C98] readingIntentWithURL:v9 options:4];
      v29[0] = v17;
      uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
      id v19 = objc_alloc_init(MEMORY[0x1E4F28F08]);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __74__QLThumbnailAddition_downloadOrGenerateThumbnailAtURL_completionHandler___block_invoke_139;
      v21[3] = &unk_1E600A178;
      id v24 = a1;
      id v22 = v17;
      id v23 = v11;
      id v20 = v17;
      [v13 coordinateAccessWithIntents:v18 queue:v19 byAccessor:v21];

      goto LABEL_15;
    }
    if (v16) {
      +[QLThumbnailAddition downloadOrGenerateThumbnailAtURL:completionHandler:]();
    }

    id v13 = v9;
    if (v13) {
      goto LABEL_5;
    }
  }
  if (v11)
  {
    id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"QLThumbnailErrorDomain" code:0 userInfo:0];
    (*((void (**)(void *, id))v11 + 2))(v11, v13);
    goto LABEL_15;
  }
LABEL_16:
}

uint64_t __74__QLThumbnailAddition_downloadOrGenerateThumbnailAtURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) stopAccessingSecurityScopedResource];
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }

  return MEMORY[0x1F41817F8]();
}

void __74__QLThumbnailAddition_downloadOrGenerateThumbnailAtURL_completionHandler___block_invoke_139(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) URL];
  [v2 downloadOrGenerateThumbnailAtTaggedURL:v3 completionHandler:*(void *)(a1 + 40)];
}

+ (void)downloadOrGenerateThumbnailAtTaggedURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (_FPIsCloudDocsWithFPFSEnabled()) {
    [a1 fpfsDownloadOrGenerateThumbnailAtTaggedURL:v7 completionHandler:v6];
  }
  else {
    [a1 preFPFSDownloadOrGenerateThumbnailAtTaggedURL:v7 completionHandler:v6];
  }
}

+ (void)preFPFSDownloadThumbnailAtTaggedURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v8 = *MEMORY[0x1E4F1C628];
  v38[0] = *MEMORY[0x1E4F1C690];
  uint64_t v7 = v38[0];
  v38[1] = v8;
  uint64_t v39 = *MEMORY[0x1E4F1C658];
  uint64_t v9 = v39;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:3];
  id v32 = 0;
  id v11 = [v5 promisedItemResourceValuesForKeys:v10 error:&v32];
  id v12 = v32;

  id v13 = [v11 objectForKeyedSubscript:v7];
  int v14 = [v13 BOOLValue];

  int v15 = [v11 objectForKeyedSubscript:v9];
  int v16 = [v15 BOOLValue];

  uint64_t v17 = [v11 objectForKeyedSubscript:v8];
  int v18 = [v17 BOOLValue];

  if (!v11) {
    int v14 = 0;
  }
  id v19 = _log_0();
  id v20 = v19;
  if ((v14 & (v18 ^ 1 | v16)) != 0)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_1B281E000, v20, OS_LOG_TYPE_INFO, "Downloading thumbnail for %@", (uint8_t *)&buf, 0xCu);
    }

    id v37 = v5;
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    void v29[2] = __77__QLThumbnailAddition_preFPFSDownloadThumbnailAtTaggedURL_completionHandler___block_invoke;
    v29[3] = &unk_1E600A1A0;
    id v30 = v5;
    id v31 = v6;
    id v22 = v21;
    id v23 = v29;
    uint64_t v33 = 0;
    uint64_t v34 = &v33;
    uint64_t v35 = 0x2020000000;
    id v24 = (void (*)(id, uint64_t, void *))getBRStartDownloadForItemsWithOptionsSymbolLoc_ptr;
    CFURLRef v36 = getBRStartDownloadForItemsWithOptionsSymbolLoc_ptr;
    if (!getBRStartDownloadForItemsWithOptionsSymbolLoc_ptr)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      id v41 = __getBRStartDownloadForItemsWithOptionsSymbolLoc_block_invoke;
      v42 = &unk_1E6009910;
      CFDictionaryRef v43 = &v33;
      id v25 = (void *)CloudDocsLibrary();
      id v26 = dlsym(v25, "BRStartDownloadForItemsWithOptions");
      *(void *)(v43[1] + 24) = v26;
      getBRStartDownloadForItemsWithOptionsSymbolLoc_ptr = *(_UNKNOWN **)(v43[1] + 24);
      id v24 = (void (*)(id, uint64_t, void *))v34[3];
    }
    _Block_object_dispose(&v33, 8);
    if (!v24)
    {
      +[QLThumbnailAddition preFPFSDownloadThumbnailAtTaggedURL:completionHandler:]();
      __break(1u);
    }
    v24(v22, 2, v23);
  }
  else
  {
    BOOL v27 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (v11)
    {
      if (v27) {
        +[QLThumbnailAddition preFPFSDownloadThumbnailAtTaggedURL:completionHandler:]();
      }

      char v28 = [MEMORY[0x1E4F28C58] errorWithDomain:@"QLThumbnailErrorDomain" code:102 userInfo:0];
      (*((void (**)(id, void *))v6 + 2))(v6, v28);
    }
    else
    {
      if (v27) {
        +[QLThumbnailAddition preFPFSDownloadThumbnailAtTaggedURL:completionHandler:]();
      }

      (*((void (**)(id, id))v6 + 2))(v6, v12);
    }
  }
}

void __77__QLThumbnailAddition_preFPFSDownloadThumbnailAtTaggedURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    char v4 = _log_0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __77__QLThumbnailAddition_preFPFSDownloadThumbnailAtTaggedURL_completionHandler___block_invoke_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)preFPFSDownloadOrGenerateThumbnailAtTaggedURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = -[QLThumbnailGenerationRequest initWithFileAtURL:size:scale:representationTypes:]([QLThumbnailGenerationRequest alloc], "initWithFileAtURL:size:scale:representationTypes:", v6, 4, 1024.0, 1024.0, 1.0);
  id v20 = 0;
  uint64_t v9 = [MEMORY[0x1E4F1CB10] _QLCreateTemporaryReplacementURLForOriginalFileAtURL:v6 withExtension:@"jpg" temporaryDirectoryURL:&v20];
  id v10 = v20;
  if (v9)
  {
    id v11 = +[QLThumbnailGenerator sharedGenerator];
    uint64_t v12 = *MEMORY[0x1E4F44410];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __87__QLThumbnailAddition_preFPFSDownloadOrGenerateThumbnailAtTaggedURL_completionHandler___block_invoke;
    v14[3] = &unk_1E600A1C8;
    id v15 = v6;
    id v16 = v10;
    id v19 = a1;
    id v18 = v7;
    id v17 = v9;
    [v11 saveBestRepresentationForRequest:v8 toFileAtURL:v17 asContentType:v12 allowingThumbnailDownloads:0 completionHandler:v14];

    id v13 = v15;
LABEL_5:

    goto LABEL_6;
  }
  if (v7)
  {
    id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"QLThumbnailErrorDomain" code:0 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v13);
    goto LABEL_5;
  }
LABEL_6:
}

void __87__QLThumbnailAddition_preFPFSDownloadOrGenerateThumbnailAtTaggedURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    id v6 = (void **)(a1 + 32);
    id v7 = (void *)_CFURLPromiseCopyPhysicalURL();
    uint64_t v8 = v7;
    if (!v7) {
      uint64_t v8 = *v6;
    }
    id v9 = v8;

    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v21 = *MEMORY[0x1E4F1C500];
    uint64_t v22 = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    id v20 = 0;
    BOOL v12 = +[QLThumbnailAddition associateThumbnailImagesDictionary:v11 serializedQuickLookMetadata:0 withDocumentAtURL:v9 error:&v20];
    id v13 = v20;

    if (v12)
    {
      [*(id *)(a1 + 32) removeCachedResourceValueForKey:*MEMORY[0x1E4F1C710]];
      [MEMORY[0x1E4F28CB8] _QLTRemoveTemporaryDirectoryAtURL:*(void *)(a1 + 40)];
      int v14 = _log_0();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v15 = *v6;
        *(_DWORD *)long long buf = 138412290;
        id v24 = v15;
        _os_log_impl(&dword_1B281E000, v14, OS_LOG_TYPE_INFO, "downloadOrGenerateThumbnailAtTaggedURL associated thumbnail with %@", buf, 0xCu);
      }

      uint64_t v16 = *(void *)(a1 + 56);
      if (!v16) {
        goto LABEL_17;
      }
      id v17 = *(void (**)(void))(v16 + 16);
    }
    else
    {
      id v18 = _log_0();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        __87__QLThumbnailAddition_preFPFSDownloadOrGenerateThumbnailAtTaggedURL_completionHandler___block_invoke_cold_1((void *)(a1 + 32));
      }

      [MEMORY[0x1E4F28CB8] _QLTRemoveTemporaryDirectoryAtURL:*(void *)(a1 + 40)];
      uint64_t v19 = *(void *)(a1 + 56);
      if (!v19) {
        goto LABEL_17;
      }
      id v17 = *(void (**)(void))(v19 + 16);
    }
    v17();
LABEL_17:

    goto LABEL_18;
  }
  char v4 = _log_0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = *(void **)(a1 + 32);
    *(_DWORD *)long long buf = 138412546;
    id v24 = v5;
    __int16 v25 = 2112;
    id v26 = v3;
    _os_log_impl(&dword_1B281E000, v4, OS_LOG_TYPE_INFO, "Could not save thumbnail for %@: %@", buf, 0x16u);
  }

  [MEMORY[0x1E4F28CB8] _QLTRemoveTemporaryDirectoryAtURL:*(void *)(a1 + 40)];
  [*(id *)(a1 + 64) preFPFSDownloadThumbnailAtTaggedURL:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 56)];
LABEL_18:
}

+ (void)fpfsDownloadOrGenerateThumbnailAtTaggedURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = -[QLThumbnailGenerationRequest initWithFileAtURL:size:scale:representationTypes:]([QLThumbnailGenerationRequest alloc], "initWithFileAtURL:size:scale:representationTypes:", v5, 4, 1024.0, 1024.0, 1.0);
  id v18 = 0;
  uint64_t v8 = [MEMORY[0x1E4F1CB10] _QLCreateTemporaryReplacementURLForOriginalFileAtURL:v5 withExtension:@"jpg" temporaryDirectoryURL:&v18];
  id v9 = v18;
  if (v8)
  {
    uint64_t v10 = +[QLThumbnailGenerator sharedGenerator];
    uint64_t v11 = *MEMORY[0x1E4F44410];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __84__QLThumbnailAddition_fpfsDownloadOrGenerateThumbnailAtTaggedURL_completionHandler___block_invoke;
    v13[3] = &unk_1E600A1F0;
    id v14 = v5;
    id v15 = v9;
    id v17 = v6;
    id v16 = v8;
    [v10 saveBestRepresentationForRequest:v7 toFileAtURL:v16 asContentType:v11 allowingThumbnailDownloads:1 completionHandler:v13];

    BOOL v12 = v14;
LABEL_5:

    goto LABEL_6;
  }
  if (v6)
  {
    BOOL v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"QLThumbnailErrorDomain" code:0 userInfo:0];
    (*((void (**)(id, void *))v6 + 2))(v6, v12);
    goto LABEL_5;
  }
LABEL_6:
}

void __84__QLThumbnailAddition_fpfsDownloadOrGenerateThumbnailAtTaggedURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v20 = *MEMORY[0x1E4F1C500];
    v21[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    uint64_t v8 = *(void *)(a1 + 32);
    id v17 = 0;
    BOOL v9 = +[QLThumbnailAddition associateThumbnailImagesDictionary:v7 serializedQuickLookMetadata:0 withDocumentAtURL:v8 error:&v17];
    id v10 = v17;

    if (v9)
    {
      [*(id *)(a1 + 32) removeCachedResourceValueForKey:*MEMORY[0x1E4F1C710]];
      [MEMORY[0x1E4F28CB8] _QLTRemoveTemporaryDirectoryAtURL:*(void *)(a1 + 40)];
      uint64_t v11 = _log_0();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v19 = v12;
        _os_log_impl(&dword_1B281E000, v11, OS_LOG_TYPE_INFO, "downloadOrGenerateThumbnailAtTaggedURL associated thumbnail with %@", buf, 0xCu);
      }

      uint64_t v13 = *(void *)(a1 + 56);
      if (!v13) {
        goto LABEL_16;
      }
      id v14 = *(void (**)(void))(v13 + 16);
    }
    else
    {
      id v15 = _log_0();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __84__QLThumbnailAddition_fpfsDownloadOrGenerateThumbnailAtTaggedURL_completionHandler___block_invoke_cold_1((uint64_t *)(a1 + 32), v15);
      }

      [MEMORY[0x1E4F28CB8] _QLTRemoveTemporaryDirectoryAtURL:*(void *)(a1 + 40)];
      uint64_t v16 = *(void *)(a1 + 56);
      if (!v16) {
        goto LABEL_16;
      }
      id v14 = *(void (**)(void))(v16 + 16);
    }
    v14();
LABEL_16:

    goto LABEL_17;
  }
  char v4 = _log_0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __84__QLThumbnailAddition_fpfsDownloadOrGenerateThumbnailAtTaggedURL_completionHandler___block_invoke_cold_2(a1);
  }

  [MEMORY[0x1E4F28CB8] _QLTRemoveTemporaryDirectoryAtURL:*(void *)(a1 + 40)];
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
LABEL_17:
}

+ (BOOL)setThumbnailsDictionary:(id)a3 forURL:(id)a4 error:(id *)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    uint64_t v10 = *MEMORY[0x1E4F1D260];
    if ((id)*MEMORY[0x1E4F1D260] == v8)
    {
      uint64_t v12 = 0;
    }
    else
    {
      uint64_t v11 = [v8 valueForKey:*MEMORY[0x1E4F1C500]];
      uint64_t v12 = (void *)v11;
      if (v11) {
        BOOL v13 = v11 == v10;
      }
      else {
        BOOL v13 = 1;
      }
      if (!v13)
      {
        if (QLTImageClassWithError(a5))
        {
          uint64_t v14 = [v12 CGImage];
          id v15 = _log_0();
          uint64_t v16 = v15;
          if (v14)
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138412290;
              id v25 = v9;
              _os_log_impl(&dword_1B281E000, v16, OS_LOG_TYPE_INFO, "Associating thumbnail for %@", buf, 0xCu);
            }

            char v17 = [a1 associateImage:v14 metadata:0 automaticallyGenerated:0 withURL:v9 error:a5];
            id v18 = dispatch_get_global_queue(-2, 0);
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __60__QLThumbnailAddition_setThumbnailsDictionary_forURL_error___block_invoke;
            block[3] = &unk_1E6009C28;
            id v23 = v9;
            dispatch_async(v18, block);

            goto LABEL_17;
          }
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            +[QLThumbnailAddition setThumbnailsDictionary:forURL:error:]();
          }

          if (a5)
          {
            [MEMORY[0x1E4F28C58] errorWithDomain:@"QLThumbnailErrorDomain" code:100 userInfo:0];
            char v17 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_17;
          }
        }
        else
        {
          uint64_t v21 = _log_0();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            +[QLThumbnailAddition setThumbnailsDictionary:forURL:error:]();
          }
        }
        char v17 = 0;
LABEL_17:

        goto LABEL_18;
      }
    }
    uint64_t v19 = _log_0();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v25 = v9;
      _os_log_impl(&dword_1B281E000, v19, OS_LOG_TYPE_INFO, "Setting image to nil on %@ -> removing any preexisting thumbnails", buf, 0xCu);
    }

    char v17 = [a1 removeAdditionsOnURL:v9 error:a5];
    goto LABEL_17;
  }
  char v17 = 1;
LABEL_18:

  return v17;
}

void __60__QLThumbnailAddition_setThumbnailsDictionary_forURL_error___block_invoke(uint64_t a1)
{
  if (_FPURLMightBeInFileProvider(*(void *)(a1 + 32)) && (_FPIsCloudDocsWithFPFSEnabled() & 1) == 0)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __60__QLThumbnailAddition_setThumbnailsDictionary_forURL_error___block_invoke_2;
    v9[3] = &unk_1E6009CF0;
    id v10 = v2;
    id v3 = v10;
    char v4 = v9;
    uint64_t v16 = 0;
    char v17 = &v16;
    uint64_t v18 = 0x2020000000;
    uint64_t v5 = (void (*)(id, void *))getBRThumbnailChangedAtURLSymbolLoc_ptr;
    uint64_t v19 = getBRThumbnailChangedAtURLSymbolLoc_ptr;
    if (!getBRThumbnailChangedAtURLSymbolLoc_ptr)
    {
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      BOOL v13 = __getBRThumbnailChangedAtURLSymbolLoc_block_invoke;
      uint64_t v14 = &unk_1E6009910;
      id v15 = &v16;
      uint64_t v6 = (void *)CloudDocsLibrary();
      id v7 = dlsym(v6, "BRThumbnailChangedAtURL");
      *(void *)(v15[1] + 24) = v7;
      getBRThumbnailChangedAtURLSymbolLoc_ptr = *(_UNKNOWN **)(v15[1] + 24);
      uint64_t v5 = (void (*)(id, void *))v17[3];
    }
    _Block_object_dispose(&v16, 8);
    if (!v5)
    {
      id v8 = (_Unwind_Exception *)+[QLThumbnailAddition preFPFSDownloadThumbnailAtTaggedURL:completionHandler:]();
      _Block_object_dispose(&v16, 8);
      _Unwind_Resume(v8);
    }
    v5(v3, v4);
  }
}

void __60__QLThumbnailAddition_setThumbnailsDictionary_forURL_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    char v4 = _log_0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl(&dword_1B281E000, v4, OS_LOG_TYPE_DEFAULT, "Error when notifying BR the thumbnail changed at %@: %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

+ (BOOL)shouldUseXattrsToStoreThumbnailsOnURL:(id)a3
{
  id v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    CloudDocsLibrary();
  }
  char v4 = [MEMORY[0x1E4F63BE8] manager];
  if ([v4 isItemAtURLInsidePermanentStorage:v3 error:0]) {
    char v5 = 1;
  }
  else {
    char v5 = objc_msgSend(v3, "br_isInCloudDocsPrivateStorages");
  }

  return v5;
}

+ (BOOL)associateThumbnailsForDocumentAtURL:(id)a3 withDocumentAtURL:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  LOBYTE(a5) = objc_msgSend(a1, "associateThumbnailsForDocumentAtURL:withImmutableDocument:atURL:error:", v9, objc_msgSend(a1, "shouldUseXattrsToStoreThumbnailsOnURL:", v8), v8, a5);

  return (char)a5;
}

+ (BOOL)associateThumbnailsForDocumentAtURL:(id)a3 withImmutableDocument:(BOOL)a4 atURL:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  v77[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = _log_0();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412802;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v73) = v8;
    _os_log_debug_impl(&dword_1B281E000, v12, OS_LOG_TYPE_DEBUG, "Copying thumbnails from %@ to %@ (immutable: %d)", buf, 0x1Cu);
  }

  BOOL v13 = [[QLThumbnailAddition alloc] initWithAdditionsPresentOnURL:v10 error:a6];
  if (v13)
  {
    uint64_t v62 = 0;
    long long v63 = &v62;
    uint64_t v64 = 0x2020000000;
    char v65 = 1;
    uint64_t v14 = [[QLThumbnailVersion alloc] initWithFileURL:v10 automaticallyGenerated:1];
    if ([(QLThumbnailAddition *)v13 shouldBeInvalidatedByThumbnailVersion:v14])
    {
      id v15 = _log_0();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = v10;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v11;
        _os_log_impl(&dword_1B281E000, v15, OS_LOG_TYPE_DEFAULT, "Not copying thumbnails from %@ to %@ because it was outdated for the source already", buf, 0x16u);
      }

      if (!a6)
      {
        BOOL v18 = 0;
LABEL_45:

        _Block_object_dispose(&v62, 8);
        goto LABEL_46;
      }
      uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v76 = *MEMORY[0x1E4F289B0];
      v77[0] = v10;
      id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:&v76 count:1];
      [v16 errorWithDomain:@"QLThumbnailErrorDomain" code:115 userInfo:v17];
      BOOL v18 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_44:

      goto LABEL_45;
    }
    id v17 = [(QLThumbnailAddition *)v13 thumbnailDataDictionary];
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v73 = __Block_byref_object_copy__3;
    v74 = __Block_byref_object_dispose__3;
    id v75 = 0;
    uint64_t v19 = [(QLThumbnailAddition *)v13 metadata];
    id v55 = (void *)[v19 mutableCopy];

    uint64_t v20 = [QLThumbnailVersion alloc];
    uint64_t v21 = [(QLThumbnailAddition *)v13 thumbnailVersion];
    id v54 = -[QLThumbnailVersion initWithFileURL:automaticallyGenerated:](v20, "initWithFileURL:automaticallyGenerated:", v11, [v21 isAutomaticallyGenerated]);

    uint64_t v22 = [(QLThumbnailVersion *)v54 dictionaryRepresentation];
    [v55 setObject:v22 forKeyedSubscript:@"QLThumbnailMetadataFileVersionKey.2"];

    if (v8)
    {
      if (!v17)
      {
        id v23 = [(QLThumbnailAddition *)v13 metadata];
        id v24 = [v23 objectForKey:@"QLThumbnailMetadataFileNamesDictionaryKey"];

        if (!v24)
        {
          id v25 = [@"thumbnail" stringByAppendingPathExtension:@"jpg"];
          uint64_t v70 = *MEMORY[0x1E4F1C500];
          v71 = v25;
          id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v71 forKeys:&v70 count:1];
        }
        uint64_t v26 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
        v56[0] = MEMORY[0x1E4F143A8];
        v56[1] = 3221225472;
        v56[2] = __93__QLThumbnailAddition_associateThumbnailsForDocumentAtURL_withImmutableDocument_atURL_error___block_invoke;
        v56[3] = &unk_1E600A218;
        uint64_t v57 = v13;
        id v27 = v24;
        id v58 = v27;
        id v60 = buf;
        id v61 = &v62;
        id v28 = v26;
        id v59 = v28;
        [v27 enumerateKeysAndObjectsUsingBlock:v56];
        uint64_t v29 = v59;
        id v17 = v28;
      }
      if (*((unsigned char *)v63 + 24))
      {
        char v30 = [a1 storeThumbnailDataDictionary:v17 metadata:v55 asExtendedAttributeOnURL:v11 error:a6];
        *((unsigned char *)v63 + 24) = v30;
      }
      else if (a6)
      {
        *a6 = *(id *)(*(void *)&buf[8] + 40);
      }
LABEL_40:
      uint64_t v48 = [(QLThumbnailAddition *)v13 additionSize];
      if (*((unsigned char *)v63 + 24))
      {
        [a1 _hitAdditionsOnURL:v11 size:v48 completionHandler:0];
        BOOL v18 = *((unsigned char *)v63 + 24) != 0;
LABEL_43:

        _Block_object_dispose(buf, 8);
        goto LABEL_44;
      }
LABEL_42:
      BOOL v18 = 0;
      goto LABEL_43;
    }
    id v31 = [MEMORY[0x1E4F63BE8] manager];
    id v32 = [v31 permanentStorageForItemAtURL:v11 allocateIfNone:1 error:a6];

    if (!v32) {
      goto LABEL_42;
    }
    id v52 = [v32 stagingURLforCreatingAdditionWithError:a6];
    if (!v52)
    {

      goto LABEL_42;
    }
    uint64_t v33 = *MEMORY[0x1E4F1C500];
    id v51 = [v17 objectForKey:*MEMORY[0x1E4F1C500]];
    v53 = [v52 URLByAppendingPathComponent:@"thumbnail.qlthumbnail"];
    if (v51)
    {
      uint64_t v34 = [a1 imageNameFor1024ThumbnailData:v51 metadataDictionary:v55];
      v50 = (void *)v34;
      if (!v34)
      {
        id v41 = _log_0();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
          +[QLThumbnailAddition associateThumbnailsForDocumentAtURL:withImmutableDocument:atURL:error:]();
        }

        if (a6)
        {
          [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:259 userInfo:0];
          int v42 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          int v42 = 0;
        }
LABEL_39:

        if (!v42) {
          goto LABEL_42;
        }
        goto LABEL_40;
      }
      uint64_t v68 = v33;
      uint64_t v69 = v34;
      uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
      if (v55)
      {
        [v55 setObject:v35 forKeyedSubscript:@"QLThumbnailMetadataFileNamesDictionaryKey"];
      }
      else
      {
        long long v66 = @"QLThumbnailMetadataFileNamesDictionaryKey";
        v67 = v35;
        CFDictionaryRef v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
        id v55 = (void *)[v43 mutableCopy];
      }
      uint64_t v44 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v44 createDirectoryAtURL:v53 withIntermediateDirectories:0 attributes:0 error:0];

      id v45 = [v53 URLByAppendingPathComponent:v50 isDirectory:0];
      char v46 = [v51 writeToURL:v45 options:0 error:a6];
      *((unsigned char *)v63 + 24) = v46;
      [a1 adjustFileProtectionForThumbnail:v45 fromOriginalDocument:v10];
    }
    else
    {
      CFURLRef v36 = [(QLThumbnailAddition *)v13 additionURL];
      BOOL v37 = v36 == 0;

      if (v37)
      {
        *((unsigned char *)v63 + 24) = 0;
      }
      else
      {
        uint64_t v38 = [MEMORY[0x1E4F28CB8] defaultManager];
        uint64_t v39 = [(QLThumbnailAddition *)v13 additionURL];
        char v40 = [v38 copyItemAtURL:v39 toURL:v53 error:a6];
        *((unsigned char *)v63 + 24) = v40;

        [a1 adjustFileProtectionForThumbnail:v53 fromOriginalDocument:v10];
      }
    }
    if (*((unsigned char *)v63 + 24))
    {
      char v47 = [a1 makeAdditionFromStagingURL:v53 metadata:v55 inStorage:v32 error:a6];
      *((unsigned char *)v63 + 24) = v47;
      [a1 removeThumbnailsStoredInExtendedAttributesOnURL:v11 error:0];
    }
    int v42 = 1;
    goto LABEL_39;
  }
  BOOL v18 = 0;
LABEL_46:

  return v18;
}

void __93__QLThumbnailAddition_associateThumbnailsForDocumentAtURL_withImmutableDocument_atURL_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = [*(id *)(a1 + 32) additionURL];
  BOOL v8 = [*(id *)(a1 + 40) objectForKey:v6];
  id v9 = [v7 URLByAppendingPathComponent:v8 isDirectory:0];

  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v10 + 40);
  id v11 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v9 options:1 error:&obj];
  objc_storeStrong((id *)(v10 + 40), obj);
  if (v11)
  {
    [*(id *)(a1 + 48) setObject:v11 forKey:v6];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    *a4 = 1;
  }
}

+ (void)noteCloudDocsDownloadedFileAtURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = dispatch_get_global_queue(-32768, 0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__QLThumbnailAddition_noteCloudDocsDownloadedFileAtURL_completionHandler___block_invoke;
  v10[3] = &unk_1E600A2B8;
  id v11 = v5;
  id v12 = v6;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, v10);
}

void __74__QLThumbnailAddition_noteCloudDocsDownloadedFileAtURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[QLThumbnailServiceProxy sharedInstance];
  if (v2)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __74__QLThumbnailAddition_noteCloudDocsDownloadedFileAtURL_completionHandler___block_invoke_146;
    void v6[3] = &unk_1E600A290;
    id v8 = *(id *)(a1 + 40);
    id v7 = *(id *)(a1 + 32);
    [v2 askThumbnailAdditionIndex:v6];

    id v3 = v8;
LABEL_7:

    goto LABEL_8;
  }
  char v4 = _log_0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __74__QLThumbnailAddition_noteCloudDocsDownloadedFileAtURL_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"QLThumbnailErrorDomain" code:0 userInfo:0];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v3);
    goto LABEL_7;
  }
LABEL_8:
}

void __74__QLThumbnailAddition_noteCloudDocsDownloadedFileAtURL_completionHandler___block_invoke_146(uint64_t a1, void *a2)
{
  if (a2)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __74__QLThumbnailAddition_noteCloudDocsDownloadedFileAtURL_completionHandler___block_invoke_147;
    void v20[3] = &unk_1E6009F78;
    id v21 = *(id *)(a1 + 40);
    char v4 = [a2 remoteObjectProxyWithErrorHandler:v20];
    id FPSandboxingURLWrapperClass = getFPSandboxingURLWrapperClass();
    uint64_t v6 = *(void *)(a1 + 32);
    id v19 = 0;
    id v7 = [FPSandboxingURLWrapperClass wrapperWithURL:v6 extensionClass:"com.apple.quicklook.readonly" error:&v19];
    id v8 = v19;
    if (v8)
    {
      id v9 = _log_0();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __74__QLThumbnailAddition_noteCloudDocsDownloadedFileAtURL_completionHandler___block_invoke_146_cold_2((void *)(a1 + 32));
      }
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __74__QLThumbnailAddition_noteCloudDocsDownloadedFileAtURL_completionHandler___block_invoke_148;
    v15[3] = &unk_1E600A268;
    id v16 = *(id *)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    id v17 = v4;
    id v18 = v10;
    id v11 = v4;
    [v11 hasThumbnailForURLWrapper:v7 updateLastHitDate:0 andSize:0 completion:v15];

    id v12 = v21;
    goto LABEL_11;
  }
  BOOL v13 = _log_0();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    __65__QLThumbnailAddition__hitAdditionsOnURL_size_completionHandler___block_invoke_104_cold_1();
  }

  uint64_t v14 = *(void *)(a1 + 40);
  if (v14)
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"QLThumbnailErrorDomain" code:107 userInfo:0];
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v12);
LABEL_11:
  }
}

void __74__QLThumbnailAddition_noteCloudDocsDownloadedFileAtURL_completionHandler___block_invoke_147(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = _log_0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __74__QLThumbnailAddition_noteCloudDocsDownloadedFileAtURL_completionHandler___block_invoke_147_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __74__QLThumbnailAddition_noteCloudDocsDownloadedFileAtURL_completionHandler___block_invoke_148(id *a1, int a2)
{
  if (a2)
  {
    id v3 = +[QLThumbnailGenerationQueue sharedInstance];
    id v4 = a1[4];
    id v6 = v3;
    if (a1[6])
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __74__QLThumbnailAddition_noteCloudDocsDownloadedFileAtURL_completionHandler___block_invoke_2;
      v7[3] = &unk_1E600A240;
      id v8 = a1[5];
      id v9 = a1[4];
      id v10 = a1[6];
      [v6 enqueueThumbnailGenerationIfNeededForDocumentAtURL:v4 atBackgroundPriority:1 completionHandler:v7];

      return;
    }
    [v3 enqueueThumbnailGenerationIfNeededForDocumentAtURL:v4 atBackgroundPriority:1 completionHandler:0];
  }
  else
  {
    uint64_t v5 = (void (**)(id, id))a1[6];
    if (!v5) {
      return;
    }
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"QLThumbnailErrorDomain" code:104 userInfo:0];
    v5[2](v5, v6);
  }
}

void __74__QLThumbnailAddition_noteCloudDocsDownloadedFileAtURL_completionHandler___block_invoke_2(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = (void *)a1[4];
  uint64_t v7 = a1[5];
  id v8 = a4;
  [v6 updateFileSize:a3 ofThumbnailForURL:v7 completion:0];
  (*(void (**)(void))(a1[6] + 16))();
}

- (GSAddition)genStoreAddition
{
  return self->_addition;
}

- (id)allImageURLs
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = [(QLThumbnailAddition *)self metadata];
  id v4 = [v3 objectForKey:@"QLThumbnailMetadataFileNamesDictionaryKey"];
  uint64_t v5 = [v4 allValues];

  if ([v5 count])
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          BOOL v13 = [(QLThumbnailAddition *)self additionURL];
          uint64_t v14 = [v13 URLByAppendingPathComponent:v12 isDirectory:0];

          [v6 addObject:v14];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v15 = [(QLThumbnailAddition *)self metadata];
    id v7 = [v15 objectForKey:@"QLThumbnailMetadataFileNameKey"];

    if (v7)
    {
      id v16 = [(QLThumbnailAddition *)self additionURL];
      id v17 = [v16 URLByAppendingPathComponent:v7 isDirectory:0];
      id v23 = v17;
      id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    }
    else
    {
      id v6 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }

  return v6;
}

- (unint64_t)additionSize
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  thumbnailDataDictionary = self->_thumbnailDataDictionary;
  if (thumbnailDataDictionary)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    void v21[2] = __35__QLThumbnailAddition_additionSize__block_invoke;
    v21[3] = &unk_1E600A2E0;
    void v21[4] = &v22;
    [(NSDictionary *)thumbnailDataDictionary enumerateKeysAndObjectsUsingBlock:v21];
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v4 = [(QLThumbnailAddition *)self allImageURLs];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v26 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v18;
      uint64_t v7 = *MEMORY[0x1E4F1C5F8];
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * v8);
          id v16 = 0;
          int v10 = [v9 getResourceValue:&v16 forKey:v7 error:0];
          id v11 = v16;
          uint64_t v12 = v11;
          if (v10)
          {
            uint64_t v13 = [v11 unsignedIntegerValue];
            v23[3] += v13;
          }

          ++v8;
        }
        while (v5 != v8);
        uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v26 count:16];
      }
      while (v5);
    }
  }
  unint64_t v14 = v23[3];
  _Block_object_dispose(&v22, 8);
  return v14;
}

uint64_t __35__QLThumbnailAddition_additionSize__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 length];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (NSURL)additionURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAdditionURL:(id)a3
{
}

- (NSDictionary)thumbnailDataDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setThumbnailDataDictionary:(id)a3
{
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMetadata:(id)a3
{
}

- (int64_t)additionURLSandboxToken
{
  return self->_additionURLSandboxToken;
}

- (void)setAdditionURLSandboxToken:(int64_t)a3
{
  self->_additionURLSandboxToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailVersion, 0);
  objc_storeStrong((id *)&self->_thumbnailDataDictionary, 0);
  objc_storeStrong((id *)&self->_addition, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_additionURL, 0);
}

- (void)shouldBeInvalidatedByThumbnailVersion:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_9(&dword_1B281E000, v0, v1, "%@ should be invalidated by %@?");
}

- (void)thumbnailURLForKey:(void *)a1 .cold.1(void *a1)
{
  uint64_t v2 = [a1 additionURL];
  id v3 = [a1 metadata];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10(&dword_1B281E000, v4, v5, "Found an addition at %@ without a file name for key %@ in its metadata %@", v6, v7, v8, v9, v10);
}

void __71__QLThumbnailAddition__initWithAdditionsPresentOnURLUsingDaemon_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B281E000, v0, v1, "Error caught while looking for a thumbnail: %@", v2, v3, v4, v5, v6);
}

void __71__QLThumbnailAddition__initWithAdditionsPresentOnURLUsingDaemon_error___block_invoke_95_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B281E000, v0, v1, "Got underlying error from service: %@", v2, v3, v4, v5, v6);
}

+ (void)setPropertyList:(int)a1 forExtendedAttributeNamed:(NSObject *)a2 flags:onFileDescriptor:error:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B281E000, a2, OS_LOG_TYPE_ERROR, "Unable to set xattr on file descriptor %d", (uint8_t *)v2, 8u);
}

+ (void)removeExtendedAttributeNamed:(int)a1 flags:(NSObject *)a2 onFileDescriptor:error:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B281E000, a2, OS_LOG_TYPE_ERROR, "Unable to remove xattr on file descriptor %d", (uint8_t *)v2, 8u);
}

void __65__QLThumbnailAddition__hitAdditionsOnURL_size_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B281E000, v0, v1, "Could not communicate with thumbnailing agent: %@", v2, v3, v4, v5, v6);
}

void __65__QLThumbnailAddition__hitAdditionsOnURL_size_completionHandler___block_invoke_104_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1B281E000, v0, v1, "Received nil thumbnail addition index", v2, v3, v4, v5, v6);
}

void __65__QLThumbnailAddition__hitAdditionsOnURL_size_completionHandler___block_invoke_106_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B281E000, v0, v1, "Could not communicate with addition index: %@", v2, v3, v4, v5, v6);
}

+ (void)associateThumbnailImagesDictionary:serializedQuickLookMetadata:withImmutableDocument:atURL:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B281E000, v0, v1, "%@ should have a NSThumbnail1024x1024SizeKey key", v2, v3, v4, v5, v6);
}

+ (void)associateThumbnailImagesDictionary:serializedQuickLookMetadata:withImmutableDocument:atURL:error:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1B281E000, v0, v1, "Could not determine what type of image %@ [thumbnail for %@] is");
}

+ (void)associateThumbnailImagesDictionary:serializedQuickLookMetadata:withImmutableDocument:atURL:error:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1B281E000, v0, v1, "%@ is not reachable: %@");
}

+ (void)adjustFileProtectionForThumbnail:fromOriginalDocument:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1B281E000, v0, v1, "Failed to set FileProtection Attributes on staging URL %@: error %@");
}

+ (void)adjustFileProtectionForThumbnail:fromOriginalDocument:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1B281E000, v0, v1, "Failed to get FileProtection Attributes from document URL %@: error %@");
}

+ (void)makeAdditionFromStagingURL:metadata:inStorage:error:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1B281E000, v0, v1, "Failed to prepare addition from staging URL %@: error %@");
}

+ (void)makeAdditionFromStagingURL:metadata:inStorage:error:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1B281E000, v0, v1, "Failed to create addition from staging URL %@: error %@");
}

+ (void)imageContainsAlphaForOtherImages:.cold.1()
{
  __assert_rtn("+[QLThumbnailAddition imageContainsAlphaForOtherImages:]", "QLThumbnailAddition.m", 1070, "CGBitmapContextGetBitsPerPixel(alphaContext) == 8");
}

+ (void)associateImage:metadata:automaticallyGenerated:withURL:error:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1B281E000, v0, v1, "Failed to associate thumbnail with %@: GenerationalStorage failed to return an additions storage (error: %@)");
}

+ (void)associateImage:metadata:automaticallyGenerated:withURL:error:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1B281E000, v0, v1, "Failed to associate thumbnail with %@: GenerationalStorage failed to return a staging URL (error: %@)");
}

+ (void)associateImage:metadata:automaticallyGenerated:withURL:error:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1B281E000, v0, OS_LOG_TYPE_DEBUG, "Storing version %@", v1, 0xCu);
}

+ (void)associateImage:metadata:automaticallyGenerated:withURL:error:.cold.4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_9(&dword_1B281E000, v0, v1, "associate thumbnail with URL %@ metadata %@");
}

+ (void)removeAdditionsOnURL:error:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3(&dword_1B281E000, v0, v1, "Process does have access to revisiond", v2, v3, v4, v5, v6);
}

+ (void)removeAdditionsOnURL:error:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3(&dword_1B281E000, v0, v1, "Process does not have access to revisiond, going through the service", v2, v3, v4, v5, v6);
}

+ (void)thumbnailsDictionaryForURL:error:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1B281E000, v0, v1, "Error %@ retrieving thumbnail for %@");
}

void __56__QLThumbnailAddition_thumbnailsDictionaryForURL_error___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B281E000, v0, v1, "You tried to access NSURLThumbnailDictionaryKey (or related URL resources) on a volume which does not support it. NSURLThumbnailDictionaryKey is deprecated, please switch to QLThumbnailGenerator (for retrieving thumbnails) or Quick Look thumbnail extensions (for providing thumbnails). %@", v2, v3, v4, v5, v6);
}

+ (void)downloadOrGenerateThumbnailAtURL:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3(&dword_1B281E000, v0, v1, "Untagged logical URL, coordinating to get the physical URL", v2, v3, v4, v5, v6);
}

+ (void)downloadOrGenerateThumbnailAtURL:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3(&dword_1B281E000, v0, v1, "Tagged logical URL", v2, v3, v4, v5, v6);
}

+ (void)downloadOrGenerateThumbnailAtURL:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3(&dword_1B281E000, v0, v1, "Physical URL", v2, v3, v4, v5, v6);
}

+ (uint64_t)preFPFSDownloadThumbnailAtTaggedURL:completionHandler:.cold.1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return +[QLThumbnailAddition preFPFSDownloadThumbnailAtTaggedURL:completionHandler:](v0);
}

+ (void)preFPFSDownloadThumbnailAtTaggedURL:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B281E000, v0, v1, "Not downloading thumbnail for %@ as it is not ubiquitous", v2, v3, v4, v5, v6);
}

+ (void)preFPFSDownloadThumbnailAtTaggedURL:completionHandler:.cold.3()
{
  uint64_t v0 = (void *)_CFURLCopyLogicalURLOfPromiseAtURL();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10(&dword_1B281E000, v1, v2, "Failed to determine if %@ (%@) is ubiquitous: %@", v3, v4, v5, v6, v7);
}

void __77__QLThumbnailAddition_preFPFSDownloadThumbnailAtTaggedURL_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1B281E000, v0, v1, "Error %@ while downloading thumbnail for %@");
}

void __87__QLThumbnailAddition_preFPFSDownloadOrGenerateThumbnailAtTaggedURL_completionHandler___block_invoke_cold_1(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B281E000, v1, v2, "Could not associate thumbnail with %@: %@", (void)v3, DWORD2(v3));
}

void __84__QLThumbnailAddition_fpfsDownloadOrGenerateThumbnailAtTaggedURL_completionHandler___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412546;
  uint64_t v4 = v2;
  __int16 v5 = 2112;
  uint64_t v6 = 0;
  _os_log_error_impl(&dword_1B281E000, a2, OS_LOG_TYPE_ERROR, "Could not associate thumbnail with %@: %@", (uint8_t *)&v3, 0x16u);
}

void __84__QLThumbnailAddition_fpfsDownloadOrGenerateThumbnailAtTaggedURL_completionHandler___block_invoke_cold_2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B281E000, v1, v2, "Could not download thumbnail for %@: %@", (void)v3, DWORD2(v3));
}

+ (void)setThumbnailsDictionary:forURL:error:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1B281E000, v0, v1, "You need to link with UIKit to be able to set thumbnails", v2, v3, v4, v5, v6);
}

+ (void)setThumbnailsDictionary:forURL:error:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B281E000, v0, v1, "Could not extract a CGImage from the value of the %@ key in the thumbnails dictionary", v2, v3, v4, v5, v6);
}

+ (void)associateThumbnailsForDocumentAtURL:withImmutableDocument:atURL:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B281E000, v0, v1, "Could not determine what type of image the thumbnail for %@ is", v2, v3, v4, v5, v6);
}

void __74__QLThumbnailAddition_noteCloudDocsDownloadedFileAtURL_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1B281E000, v0, v1, "Could not contact the Quick Look thumbnails agent to check if a thumbnail exists", v2, v3, v4, v5, v6);
}

void __74__QLThumbnailAddition_noteCloudDocsDownloadedFileAtURL_completionHandler___block_invoke_146_cold_2(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B281E000, v1, v2, "Could not create FPSandboxingURLWrapper with url: %@, error: %@", (void)v3, DWORD2(v3));
}

void __74__QLThumbnailAddition_noteCloudDocsDownloadedFileAtURL_completionHandler___block_invoke_147_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B281E000, v0, v1, "Could not contact the Quick Look thumbnails agent to check if a thumbnail exists: %@", v2, v3, v4, v5, v6);
}

@end