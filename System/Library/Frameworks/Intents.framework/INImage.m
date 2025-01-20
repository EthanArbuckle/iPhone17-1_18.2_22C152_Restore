@interface INImage
+ (BOOL)supportsSecureCoding;
+ (INImage)imageNamed:(NSString *)name;
+ (INImage)imageWithImageData:(NSData *)imageData;
+ (INImage)imageWithURL:(NSURL *)URL;
+ (INImage)imageWithURL:(NSURL *)URL width:(double)width height:(double)height;
+ (INImage)systemImageNamed:(NSString *)systemImageName;
+ (id)_bundleImageWithURL:(id)a3;
+ (id)_classesInCluster;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
+ (void)buildFromCachePayload:(id)a3 identifier:(id)a4 completion:(id)a5;
+ (void)initialize;
+ (void)registerImageLoadersOnce;
- ($F24F406B2B787EFB06265DBA3D28CBD5)_imageSize;
- ($F24F406B2B787EFB06265DBA3D28CBD5)_preferredScaledSize;
- (BOOL)_isEligibleForProxying;
- (BOOL)_isSupportedForDonation;
- (BOOL)_isSystem;
- (BOOL)_requiresRetrieval;
- (BOOL)isEqual:(id)a3;
- (INImage)init;
- (INImage)initWithCoder:(id)a3;
- (NSData)_imageData;
- (NSData)_sandboxExtensionData;
- (NSString)_bundleIdentifier;
- (NSString)_bundlePath;
- (NSString)_identifier;
- (NSString)_name;
- (NSURL)_uri;
- (id)_URLRepresentation;
- (id)_copyWithSubclass:(Class)a3;
- (id)_description;
- (id)_descriptionAtIndent:(unint64_t)a3;
- (id)_dictionaryRepresentation;
- (id)_in_downscaledImageForFilePersistence;
- (id)_in_writeableFilePersistenceConfigurationForStoreType:(unint64_t)a3;
- (id)_initWithData:(id)a3;
- (id)_initWithIdentifier:(id)a3;
- (id)_initWithURLRepresentation:(id)a3;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4;
- (id)_preferredImageLoader;
- (id)_preferredImageLoaderForFilePath;
- (id)_proxiedImageWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_compareSubProducerOne:(id)a3 subProducerTwo:(id)a4;
- (int64_t)_renderingMode;
- (unint64_t)hash;
- (void)_injectProxiesForImages:(id)a3 completion:(id)a4;
- (void)_loadImageDataAndSizeWithHelper:(id)a3 accessSpecifier:(id)a4 completion:(id)a5;
- (void)_requestProxy:(id)a3;
- (void)_retrieveFilePathWithCompletion:(id)a3;
- (void)_retrieveImageDataWithReply:(id)a3;
- (void)_retrieveImageFilePathWithReply:(id)a3;
- (void)_setIdentifier:(id)a3;
- (void)_setImageSize:(id)a3;
- (void)_setPreferredScaledSize:(id)a3;
- (void)_setRenderingMode:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)generateCachePayloadWithCompletion:(id)a3;
@end

@implementation INImage

- (void).cxx_destruct
{
}

+ (INImage)systemImageNamed:(NSString *)systemImageName
{
  v3 = systemImageName;
  id v4 = [(INImage *)[_INBundleImage alloc] _initWithIdentifier:0];
  [v4 setImageName:v3];

  v5 = objc_alloc_init(INImageBundle);
  [(INImageBundle *)v5 setBundleType:2];
  [v4 setImageBundle:v5];
  [v4 _setRenderingMode:2];
  v6 = +[INCache sharedCache];
  [v6 addCacheableObject:v4];

  return (INImage *)v4;
}

- (void)_setRenderingMode:(int64_t)a3
{
  self->__renderingMode = a3;
}

- (id)_initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INImage;
  v6 = [(INImage *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    [(id)objc_opt_class() registerImageLoadersOnce];
  }

  return v7;
}

+ (void)registerImageLoadersOnce
{
  if (registerImageLoadersOnce_onceToken != -1) {
    dispatch_once(&registerImageLoadersOnce_onceToken, &__block_literal_global_44375);
  }
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v7 = a3;
  [v7 encodeObject:identifier forKey:@"_identifier"];
  [(INImage *)self _imageSize];
  objc_msgSend(v7, "encodeDouble:forKey:", @"_imageSize.width");
  [(INImage *)self _imageSize];
  [v7 encodeDouble:@"_imageSize.height" forKey:v5];
  [(INImage *)self _preferredScaledSize];
  objc_msgSend(v7, "encodeDouble:forKey:", @"_preferredScaledSize.width");
  [(INImage *)self _preferredScaledSize];
  [v7 encodeDouble:@"_preferredScaledSize.height" forKey:v6];
  objc_msgSend(v7, "encodeInteger:forKey:", -[INImage _renderingMode](self, "_renderingMode"), @"_renderingMode");
}

- (int64_t)_renderingMode
{
  return self->__renderingMode;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_preferredScaledSize
{
  double width = self->_preferredScaledSize.width;
  double height = self->_preferredScaledSize.height;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.var1 = height;
  result.var0 = width;
  return result;
}

void __35__INImage_registerImageLoadersOnce__block_invoke()
{
  double v5 = objc_alloc_init(INPortableImageLoader);
  v0 = +[INImageServiceRegistry sharedInstance];
  [v0 registerImageService:v5];

  v1 = +[INImageServiceRegistry sharedInstance];
  v2 = objc_alloc_init(INImageFilePersistence);
  [v1 registerImageService:v2];

  v3 = +[INImageServiceRegistry sharedInstance];
  id v4 = objc_alloc_init(INImageServiceConnection);
  [v3 registerImageService:v4];
}

+ (void)initialize
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___INImage;
  objc_msgSendSuper2(&v3, sel_initialize);
  if ((id)objc_opt_class() == a1 && INLogInitIfNeeded_once != -1) {
    dispatch_once(&INLogInitIfNeeded_once, &__block_literal_global_71966);
  }
}

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  return 0;
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v41[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = [MEMORY[0x1E4F1CA60] dictionary];
  [(INImage *)self _imageSize];
  if (v7 == 0.0 && ([(INImage *)self _imageSize], v8 == 0.0))
  {
    objc_super v9 = +[INCache sharedCache];
    v10 = [(INImage *)self _identifier];
    v11 = [v9 cacheableObjectForIdentifier:v10];

    id v12 = v11;
    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v40[0] = @"width";
        v13 = NSNumber;
        [v12 _imageSize];
        v14 = objc_msgSend(v13, "numberWithDouble:");
        v40[1] = @"height";
        v41[0] = v14;
        v15 = NSNumber;
        [v12 _imageSize];
        v17 = [v15 numberWithDouble:v16];
        v41[1] = v17;
        v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
        [v6 setObject:v18 forKey:@"imageSize"];
      }
    }
  }
  else
  {
    v38[0] = @"width";
    v19 = NSNumber;
    [(INImage *)self _imageSize];
    objc_msgSend(v19, "numberWithDouble:");
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    v38[1] = @"height";
    v39[0] = v12;
    v20 = NSNumber;
    [(INImage *)self _imageSize];
    v22 = [v20 numberWithDouble:v21];
    v39[1] = v22;
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
    [v6 setObject:v23 forKey:@"imageSize"];
  }
  if ([(INImage *)self _renderingMode])
  {
    v24 = objc_msgSend(NSNumber, "numberWithInteger:", -[INImage _renderingMode](self, "_renderingMode"));
    [v6 setObject:v24 forKey:@"renderingMode"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v25 = [(INImage *)self _imageData];
    v26 = [v5 encodeObject:v25];
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v26, @"imageData");
    v27 = @"Data";
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = [(INImage *)self _URLRepresentation];
      v26 = [v25 absoluteString];
      v28 = [v5 encodeObject:v26];
      objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v28, @"uri");

      v27 = @"Bundle";
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v25 = [(INImage *)self _URLRepresentation];
        v26 = [v25 absoluteString];
        v29 = [v5 encodeObject:v26];
        objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v29, @"uri");
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_25;
        }
        v30 = self;
        if (v30)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v31 = v30;
          }
          else {
            v31 = 0;
          }
        }
        else
        {
          v31 = 0;
        }
        v32 = v31;

        v33 = [(INImage *)v30 _URLRepresentation];
        v34 = [v33 absoluteString];
        v35 = [v5 encodeObject:v34];
        objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v35, @"uri");

        v25 = [(INImage *)v32 _storageServiceIdentifier];

        v26 = [v5 encodeObject:v25];
        objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v26, @"storageServiceIdentifier");
      }
      v27 = @"URL";
    }
  }

  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v27, @"type");
LABEL_25:
  v36 = (void *)[v6 copy];

  return v36;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [v9 objectForKeyedSubscript:@"uri"];
      v11 = [v9 objectForKeyedSubscript:@"type"];

      if (!v11)
      {
LABEL_6:
        id v13 = [[INImage alloc] _initWithIdentifier:v10];
LABEL_7:
        v14 = [v9 objectForKeyedSubscript:@"imageSize"];
        v15 = [v14 objectForKeyedSubscript:@"width"];
        [v15 doubleValue];
        double v17 = v16;

        v18 = [v9 objectForKeyedSubscript:@"imageSize"];
        v19 = [v18 objectForKeyedSubscript:@"height"];
        [v19 doubleValue];
        double v21 = v20;

        objc_msgSend(v13, "_setImageSize:", v17, v21);
        v22 = [v9 objectForKeyedSubscript:@"renderingMode"];
        uint64_t v23 = [v22 integerValue];

        [v13 _setRenderingMode:v23];
        goto LABEL_9;
      }
      id v12 = [v9 objectForKeyedSubscript:@"type"];
      if ([v12 isEqualToString:@"Unknown"])
      {
LABEL_5:

        goto LABEL_6;
      }
      if ([v12 isEqualToString:@"Data"])
      {

        uint64_t v25 = objc_opt_class();
        v26 = [v9 objectForKeyedSubscript:@"imageData"];
        v27 = [v7 decodeObjectOfClass:v25 from:v26];
        id v13 = +[INImage imageWithImageData:v27];

        goto LABEL_7;
      }
      if (([v12 isEqualToString:@"URL"] & 1) != 0
        || ([v12 isEqualToString:@"Bundle"] & 1) != 0)
      {

        v28 = [MEMORY[0x1E4F1CB10] URLWithString:v10];
        id v13 = +[INImage imageWithURL:v28];
      }
      else
      {
        if (([v12 isEqualToString:@"Proxy"] & 1) == 0) {
          goto LABEL_5;
        }

        id v13 = [(INImage *)[INRemoteImageProxy alloc] _initWithIdentifier:v10];
        [v13 _setProxyIdentifier:v10];
        v28 = [v9 objectForKeyedSubscript:@"storageServiceIdentifier"];
        [v13 _setStorageServiceIdentifier:v28];
      }

      goto LABEL_7;
    }
  }
  id v13 = 0;
LABEL_9:

  return v13;
}

- (int64_t)_compareSubProducerOne:(id)a3 subProducerTwo:(id)a4
{
  return INKeyImageUtilitiesDefaultCompareSubProducers(a3, a4);
}

- (void)generateCachePayloadWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = INCacheableGetSerializationQueue();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __62__INImage_INCacheSupport__generateCachePayloadWithCompletion___block_invoke;
    v6[3] = &unk_1E551F740;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

void __62__INImage_INCacheSupport__generateCachePayloadWithCompletion___block_invoke(uint64_t a1)
{
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v2 = [*(id *)(a1 + 32) _imageData];
  if (v2) {
    [v16 setObject:v2 forKey:@"_imageData"];
  }
  objc_super v3 = [*(id *)(a1 + 32) _uri];
  if (v3) {
    [v16 setObject:v3 forKey:@"_uri"];
  }
  id v4 = [*(id *)(a1 + 32) _name];
  if (v4) {
    [v16 setObject:v4 forKey:@"_name"];
  }
  id v5 = [*(id *)(a1 + 32) _bundlePath];
  if (v5) {
    [v16 setObject:v5 forKey:@"_bundlePath"];
  }
  double v6 = [*(id *)(a1 + 32) _bundleIdentifier];
  if (v6) {
    [v16 setObject:v6 forKey:@"_bundleIdentifier"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [*(id *)(a1 + 32) _storageServiceIdentifier];
    if (v7) {
      [v16 setObject:v7 forKey:@"_storageServiceIdentifier"];
    }
    id v8 = [*(id *)(a1 + 32) _proxyIdentifier];
    if (v8) {
      [v16 setObject:v8 forKey:@"_proxyIdentifier"];
    }
  }
  id v9 = NSNumber;
  [*(id *)(a1 + 32) _imageSize];
  v10 = objc_msgSend(v9, "numberWithDouble:");
  [v16 setObject:v10 forKey:@"_imageSize.width"];

  v11 = NSNumber;
  [*(id *)(a1 + 32) _imageSize];
  id v13 = [v11 numberWithDouble:v12];
  [v16 setObject:v13 forKey:@"_imageSize.height"];

  uint64_t v14 = *(void *)(a1 + 40);
  v15 = (void *)[v16 copy];
  (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);
}

+ (void)buildFromCachePayload:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v11 = INCacheableGetSerializationQueue();
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __71__INImage_INCacheSupport__buildFromCachePayload_identifier_completion___block_invoke;
    v12[3] = &unk_1E5518338;
    id v13 = v9;
    id v14 = v8;
    id v16 = a1;
    id v15 = v10;
    dispatch_async(v11, v12);
  }
}

void __71__INImage_INCacheSupport__buildFromCachePayload_identifier_completion___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v22 = v2;
  if (!v2 || ![v2 length])
  {
    objc_super v3 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v4 = [v3 UUIDString];

    id v22 = (id)v4;
  }
  id v5 = [*(id *)(a1 + 40) objectForKey:@"_uri"];
  double v6 = [*(id *)(a1 + 40) objectForKey:@"_imageData"];
  id v7 = [*(id *)(a1 + 40) objectForKey:@"_name"];
  uint64_t v8 = [*(id *)(a1 + 40) objectForKey:@"_bundlePath"];
  uint64_t v9 = [*(id *)(a1 + 40) objectForKey:@"_bundleIdentifier"];
  id v10 = [*(id *)(a1 + 40) objectForKey:@"_storageServiceIdentifier"];
  uint64_t v11 = [*(id *)(a1 + 40) objectForKey:@"_proxyIdentifier"];
  double v12 = (void *)v11;
  if (v6)
  {
    uint64_t v13 = +[INImage imageWithImageData:v6];
LABEL_6:
    id v14 = (id)v13;
    goto LABEL_10;
  }
  if (v8 | v9 && v7)
  {
    id v14 = [(INImage *)[_INBundleImage alloc] _initWithIdentifier:0];
    id v15 = objc_alloc_init(INImageBundle);
    [(INImageBundle *)v15 setBundlePath:v8];
    [(INImageBundle *)v15 setBundleIdentifier:v9];
    [v14 setImageName:v7];
    [v14 setImageBundle:v15];
  }
  else
  {
    if (v5)
    {
      uint64_t v13 = +[INImage imageWithURL:v5];
      goto LABEL_6;
    }
    id v14 = 0;
    if (v10 && v11)
    {
      id v14 = [(INImage *)[INRemoteImageProxy alloc] _initWithIdentifier:v22];
      [v14 _setStorageServiceIdentifier:v10];
      [v14 _setProxyIdentifier:v12];
    }
  }
LABEL_10:
  id v16 = [*(id *)(a1 + 40) objectForKey:@"_imageSize.width"];
  [v16 doubleValue];
  double v18 = v17;

  v19 = [*(id *)(a1 + 40) objectForKey:@"_imageSize.height"];
  [v19 doubleValue];
  double v21 = v20;

  objc_msgSend(v14, "_setImageSize:", v18, v21);
  [v14 _setIdentifier:v22];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = (void (**)(id, void *, void *))a3;
    uint64_t v8 = (void *)[(INImage *)self copy];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __69__INImage_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke;
    v9[3] = &unk_1E5518B00;
    id v10 = v6;
    v7[2](v7, v8, v9);
  }
}

uint64_t __69__INImage_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_classesInCluster
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];

  return v2;
}

+ (id)_bundleImageWithURL:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [_INBundleImage alloc];
  id v5 = [v3 absoluteString];

  id v6 = [(INImage *)v4 _initWithIdentifier:v5];

  return v6;
}

+ (INImage)imageNamed:(NSString *)name
{
  id v3 = name;
  id v4 = [(INImage *)[_INBundleImage alloc] _initWithIdentifier:0];
  [v4 setImageName:v3];

  id v5 = objc_alloc_init(INImageBundle);
  id v6 = [MEMORY[0x1E4F28B50] mainBundle];
  id v7 = [v6 bundleIdentifier];
  [(INImageBundle *)v5 setBundleIdentifier:v7];

  [v4 setImageBundle:v5];
  uint64_t v8 = +[INCache sharedCache];
  [v8 addCacheableObject:v4];

  return (INImage *)v4;
}

+ (INImage)imageWithImageData:(NSData *)imageData
{
  id v3 = imageData;
  id v4 = [[_INDataImage alloc] initWithImageData:v3];

  return (INImage *)v4;
}

+ (INImage)imageWithURL:(NSURL *)URL width:(double)width height:(double)height
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = URL;
  uint64_t v8 = v7;
  if (!v7) {
    goto LABEL_9;
  }
  uint64_t v9 = v7;
  if ([(NSURL *)v9 isFileURL])
  {
    id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v11 = [(NSURL *)v9 path];
    char v12 = [v10 isReadableFileAtPath:v11];

    if ((v12 & 1) == 0) {
      goto LABEL_9;
    }
LABEL_8:
    id v16 = [[_INURLImage alloc] initWithImageURL:v9];
    -[INImage _setImageSize:](v16, "_setImageSize:", width, height);
    double v17 = +[INCache sharedCache];
    [v17 addCacheableObject:v16];

    goto LABEL_12;
  }
  uint64_t v13 = [(NSURL *)v9 scheme];
  id v14 = [v13 lowercaseString];

  if ([v14 isEqualToString:@"http"])
  {

    goto LABEL_8;
  }
  char v15 = [v14 isEqualToString:@"https"];

  if (v15) {
    goto LABEL_8;
  }
LABEL_9:
  double v18 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    int v20 = 136315906;
    double v21 = "+[INImage imageWithURL:width:height:]";
    __int16 v22 = 2112;
    uint64_t v23 = v8;
    __int16 v24 = 2048;
    double v25 = width;
    __int16 v26 = 2048;
    double v27 = height;
    _os_log_error_impl(&dword_18CB2F000, v18, OS_LOG_TYPE_ERROR, "%s Invalid URL=%@ {%f,%f}", (uint8_t *)&v20, 0x2Au);
  }
  id v16 = 0;
LABEL_12:

  return (INImage *)v16;
}

+ (INImage)imageWithURL:(NSURL *)URL
{
  id v4 = URL;
  id v5 = [[INRemoteImageProxy alloc] _initWithURLRepresentation:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = [[_INBundleImage alloc] _initWithURLRepresentation:v4];
    uint64_t v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [a1 imageWithURL:v4 width:180.0 height:180.0];
    }
    id v7 = v10;
  }

  return (INImage *)v7;
}

- (void)_setPreferredScaledSize:(id)a3
{
  self->_preferredScaledSize = ($D4775485B13497D55C4F339E01923D43)a3;
}

- (void)_setImageSize:(id)a3
{
  self->_imageSize = ($D4775485B13497D55C4F339E01923D43)a3;
}

- (void)_setIdentifier:(id)a3
{
}

- (NSString)_identifier
{
  return self->_identifier;
}

- (INImage)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
  id v6 = [(INImage *)self _initWithIdentifier:v5];

  if (v6)
  {
    [v4 decodeDoubleForKey:@"_imageSize.width"];
    double v8 = v7;
    [v4 decodeDoubleForKey:@"_imageSize.height"];
    -[INImage _setImageSize:](v6, "_setImageSize:", v8, v9);
    [v4 decodeDoubleForKey:@"_preferredScaledSize.width"];
    double v11 = v10;
    [v4 decodeDoubleForKey:@"_preferredScaledSize.height"];
    double v13 = v12;
    uint64_t v14 = [v4 decodeIntegerForKey:@"_renderingMode"];
    -[INImage _setPreferredScaledSize:](v6, "_setPreferredScaledSize:", v11, v13);
    [(INImage *)v6 _setRenderingMode:v14];
  }

  return v6;
}

- (id)_copyWithSubclass:(Class)a3
{
  id v3 = a3;
  if (([(objc_class *)a3 isSubclassOfClass:objc_opt_class()] & 1) == 0) {
    id v3 = (objc_class *)objc_opt_class();
  }
  id v5 = [v3 alloc];
  id v6 = [(INImage *)self _identifier];
  double v7 = (void *)[v5 _initWithIdentifier:v6];

  [(INImage *)self _imageSize];
  objc_msgSend(v7, "_setImageSize:");
  [(INImage *)self _preferredScaledSize];
  objc_msgSend(v7, "_setPreferredScaledSize:");
  objc_msgSend(v7, "_setRenderingMode:", -[INImage _renderingMode](self, "_renderingMode"));
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();

  return [(INImage *)self _copyWithSubclass:v4];
}

- (id)_dictionaryRepresentation
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"width:%f height:%f", *(void *)&self->_imageSize.width, *(void *)&self->_imageSize.height);
  v10[0] = @"identifier";
  identifier = self->_identifier;
  id v5 = identifier;
  if (!identifier)
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[0] = v5;
  v10[1] = @"_imageSize";
  id v6 = v3;
  if (!v3)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = v6;
  v10[2] = @"_renderingMode";
  double v7 = [NSNumber numberWithInteger:self->__renderingMode];
  v11[2] = v7;
  double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  if (v3)
  {
    if (identifier) {
      goto LABEL_7;
    }
  }
  else
  {

    if (identifier) {
      goto LABEL_7;
    }
  }

LABEL_7:

  return v8;
}

- (id)_descriptionAtIndent:(unint64_t)a3
{
  id v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INImage;
  id v6 = [(INImage *)&v11 description];
  double v7 = [(INImage *)self _dictionaryRepresentation];
  double v8 = [v7 descriptionAtIndent:a3];
  double v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (id)_description
{
  return [(INImage *)self _descriptionAtIndent:0];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (INImage *)v4;
    if (self == v5)
    {
      char v11 = 1;
    }
    else
    {
      id v6 = [(INImage *)self _identifier];
      uint64_t v7 = [(INImage *)v5 _identifier];
      if (v6 == (void *)v7)
      {
        char v11 = 1;
        double v8 = v6;
      }
      else
      {
        double v8 = (void *)v7;
        double v9 = [(INImage *)self _identifier];
        double v10 = [(INImage *)v5 _identifier];
        char v11 = [v9 isEqual:v10];
      }
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  id v2 = [(INImage *)self _identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)_isSupportedForDonation
{
  return 1;
}

- (BOOL)_isEligibleForProxying
{
  return 0;
}

- (id)_initWithURLRepresentation:(id)a3
{
  return 0;
}

- (id)_URLRepresentation
{
  return 0;
}

- (id)_preferredImageLoaderForFilePath
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = +[INImageServiceRegistry sharedInstance];
  id v4 = [v3 imageLoaders];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (((objc_opt_respondsToSelector() & 1) == 0
           || objc_msgSend(v10, "canLoadImageDataForImage:", self, (void)v13))
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          id v11 = v10;
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_13:

  return v11;
}

- (id)_preferredImageLoader
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = +[INImageServiceRegistry sharedInstance];
  id v4 = [v3 imageLoaders];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (((objc_opt_respondsToSelector() & 1) == 0
           || objc_msgSend(v10, "canLoadImageDataForImage:", self, (void)v13))
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          id v11 = v10;
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_13:

  return v11;
}

- (NSData)_sandboxExtensionData
{
  return 0;
}

- (NSString)_bundleIdentifier
{
  return 0;
}

- (NSString)_bundlePath
{
  return 0;
}

- (NSString)_name
{
  return 0;
}

- (NSURL)_uri
{
  return 0;
}

- (NSData)_imageData
{
  return 0;
}

- (id)_proxiedImageWithError:(id *)a3
{
  return +[INRemoteImageProxy requestProxyByStoringImage:self qualityOfService:25 scaled:0 storeType:0 error:a3];
}

- (void)_requestProxy:(id)a3
{
}

- (void)_retrieveImageFilePathWithReply:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, void *))a3;
  if (v4)
  {
    id v5 = [(INImage *)self _preferredImageLoaderForFilePath];
    if (v5)
    {
      uint64_t v6 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        long long v13 = "-[INImage _retrieveImageFilePathWithReply:]";
        __int16 v14 = 2112;
        long long v15 = v5;
        __int16 v16 = 2112;
        double v17 = self;
        _os_log_impl(&dword_18CB2F000, v6, OS_LOG_TYPE_INFO, "%s Found preferred image loader %@ for image %@, attempting load", buf, 0x20u);
      }
      [v5 filePathForImage:self usingPortableImageLoader:0 completion:v4];
    }
    else
    {
      uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = *MEMORY[0x1E4F28568];
      id v11 = @"No preferred image loader available for image: %@";
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
      double v9 = [v7 errorWithDomain:@"IntentsErrorDomain" code:6001 userInfo:v8];
      v4[2](v4, 0, v9);
    }
  }
}

- (void)_retrieveImageDataWithReply:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, void *))a3;
  if (v4)
  {
    id v5 = [(INImage *)self _preferredImageLoader];
    if (v5)
    {
      uint64_t v6 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        long long v13 = "-[INImage _retrieveImageDataWithReply:]";
        __int16 v14 = 2112;
        long long v15 = v5;
        __int16 v16 = 2112;
        double v17 = self;
        _os_log_impl(&dword_18CB2F000, v6, OS_LOG_TYPE_INFO, "%s Found preferred image loader %@ for image %@, attempting load", buf, 0x20u);
      }
      objc_msgSend(v5, "loadDataImageFromImage:usingPortableImageLoader:scaledSize:completion:", self, 0, v4, 0.0, 0.0);
    }
    else
    {
      uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = *MEMORY[0x1E4F28568];
      id v11 = @"No preferred image loader available for image: %@";
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
      double v9 = [v7 errorWithDomain:@"IntentsErrorDomain" code:6001 userInfo:v8];
      v4[2](v4, 0, v9);
    }
  }
}

- (BOOL)_requiresRetrieval
{
  id v2 = [(INImage *)self _imageData];
  BOOL v3 = v2 == 0;

  return v3;
}

- (BOOL)_isSystem
{
  return 0;
}

- (id)_initWithData:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() imageWithImageData:v4];

  return v5;
}

- (INImage)init
{
  return 0;
}

- (void)_retrieveFilePathWithCompletion:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28568];
    v10[0] = @"Attempted to grab file path for an INImage, which is not supported";
    id v5 = (void *)MEMORY[0x1E4F1C9E8];
    id v6 = a3;
    uint64_t v7 = [v5 dictionaryWithObjects:v10 forKeys:&v9 count:1];
    uint64_t v8 = [v4 errorWithDomain:@"IntentsErrorDomain" code:6004 userInfo:v7];
    (*((void (**)(id, void, void *))a3 + 2))(v6, 0, v8);
  }
}

- (void)_loadImageDataAndSizeWithHelper:(id)a3 accessSpecifier:(id)a4 completion:(id)a5
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F28568];
    v12[0] = @"No intrinsic loading supported in the base class.";
    uint64_t v7 = (void *)MEMORY[0x1E4F1C9E8];
    id v8 = a5;
    uint64_t v9 = [v7 dictionaryWithObjects:v12 forKeys:&v11 count:1];
    uint64_t v10 = [v6 errorWithDomain:@"IntentsErrorDomain" code:6003 userInfo:v9];
    (*((void (**)(id, void, void, void *, double, double))a5 + 2))(v8, 0, 0, v10, 0.0, 0.0);
  }
}

- (id)_in_writeableFilePersistenceConfigurationForStoreType:(unint64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = [(INImage *)self _identifier];
  id v5 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
  id v6 = (void *)[v5 mutableCopy];

  [v6 removeCharactersInString:@"./:"];
  uint64_t v7 = [v4 stringByAddingPercentEncodingWithAllowedCharacters:v6];

  id v8 = [v7 stringByAppendingPathExtension:@"png"];

  id v9 = v8;
  uint64_t v10 = _INImageFilePersistenceDirectoryPathWithStoreTypeCreateIfNeeded(a3);
  uint64_t v11 = [v10 stringByAppendingPathComponent:v9];

  double v12 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315394;
    int v20 = "-[INImage(INImageFilePersistence) _in_writeableFilePersistenceConfigurationForStoreType:]";
    __int16 v21 = 2112;
    __int16 v22 = v11;
    _os_log_impl(&dword_18CB2F000, v12, OS_LOG_TYPE_INFO, "%s Checking writability of file path: %@", (uint8_t *)&v19, 0x16u);
  }
  long long v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  __int16 v14 = [v11 stringByDeletingLastPathComponent];
  int v15 = [v13 isWritableFileAtPath:v14];

  __int16 v16 = INSiriLogContextIntents;
  if (v15)
  {
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      int v19 = 136315394;
      int v20 = "-[INImage(INImageFilePersistence) _in_writeableFilePersistenceConfigurationForStoreType:]";
      __int16 v21 = 2112;
      __int16 v22 = v11;
      _os_log_impl(&dword_18CB2F000, v16, OS_LOG_TYPE_INFO, "%s Can write to file path: %@", (uint8_t *)&v19, 0x16u);
    }
    double v17 = objc_alloc_init(_INFilePersistenceConfiguration);
    [(_INFilePersistenceConfiguration *)v17 setIdentifier:v9];
    [(_INFilePersistenceConfiguration *)v17 setFilePath:v11];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315394;
      int v20 = "-[INImage(INImageFilePersistence) _in_writeableFilePersistenceConfigurationForStoreType:]";
      __int16 v21 = 2112;
      __int16 v22 = v11;
      _os_log_error_impl(&dword_18CB2F000, v16, OS_LOG_TYPE_ERROR, "%s Not able to write to file path: %@", (uint8_t *)&v19, 0x16u);
    }
    double v17 = 0;
  }

  return v17;
}

- (id)_in_downscaledImageForFilePersistence
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = _INImageSizeProviderClass();
  if (v3)
  {
    [(INImage *)self _preferredScaledSize];
    id v9 = 0;
    objc_msgSend(v3, "downscaledPNGImageForImage:size:error:", self, &v9);
    id v4 = (INImage *)objc_claimAutoreleasedReturnValue();
    id v3 = v9;
    if (!v3) {
      goto LABEL_7;
    }
    id v5 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v11 = "-[INImage(INImageFilePersistence) _in_downscaledImageForFilePersistence]";
      __int16 v12 = 2112;
      long long v13 = self;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_error_impl(&dword_18CB2F000, v5, OS_LOG_TYPE_ERROR, "%s Failed to downscale data image %@ (non-fatal): %@", buf, 0x20u);
    }
  }
  id v4 = 0;
LABEL_7:
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = self;
  }
  uint64_t v7 = v6;

  return v7;
}

@end