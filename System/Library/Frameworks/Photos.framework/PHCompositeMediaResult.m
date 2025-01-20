@interface PHCompositeMediaResult
+ (id)resultWithRequestID:(int)a3 error:(id)a4;
- (BOOL)canHandleAdjustmentData;
- (BOOL)containsValidData;
- (BOOL)isCancelled;
- (BOOL)isDegraded;
- (BOOL)isDerivedFromDeferredPreview;
- (BOOL)isInCloud;
- (BOOL)isPlaceholder;
- (CGImage)imageRef;
- (PHCompositeMediaResult)initWithRequestID:(int)a3;
- (id)_sanitizedError;
- (id)adjustmentData;
- (id)adjustmentSecondaryDataURL;
- (id)allowedInfoKeys;
- (id)baseVersionNeeded;
- (id)cancelledInfoKey;
- (id)error;
- (id)errorInfoKey;
- (id)exifOrientation;
- (id)fingerPrint;
- (id)imageData;
- (id)imageProperties;
- (id)imagePropertiesLoadIfNeeded:(BOOL)a3;
- (id)imageURL;
- (id)inCloudInfoKey;
- (id)info;
- (id)mediaMetadata;
- (id)sandboxExtensionToken;
- (id)sanitizedInfoDictionary;
- (id)uniformTypeIdentifier;
- (id)videoAdjustmentData;
- (id)videoMediaItemMakerData;
- (id)videoURL;
- (int64_t)uiOrientation;
- (unsigned)cgOrientation;
- (void)addInfoFromDictionary:(id)a3;
- (void)clearError;
- (void)setCancelled:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setErrorIfNone:(id)a3;
- (void)setInfo:(id)a3 forKey:(id)a4;
- (void)setIsInCloud:(BOOL)a3;
- (void)setSandboxExtensionToken:(id)a3;
@end

@implementation PHCompositeMediaResult

- (PHCompositeMediaResult)initWithRequestID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)PHCompositeMediaResult;
  v4 = [(PHCompositeMediaResult *)&v9 init];
  if (v4)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    mutableInfo = v4->_mutableInfo;
    v4->_mutableInfo = v5;

    v7 = [NSNumber numberWithInt:v3];
    [(NSMutableDictionary *)v4->_mutableInfo setObject:v7 forKeyedSubscript:@"PHImageResultRequestIDKey"];
  }
  return v4;
}

- (BOOL)isInCloud
{
  return self->_isInCloud;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageProperties, 0);

  objc_storeStrong((id *)&self->_mutableInfo, 0);
}

void __41__PHCompositeMediaResult_allowedInfoKeys__block_invoke(uint64_t a1)
{
  v9[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v9[0] = @"PHImageResultRequestIDKey";
  uint64_t v3 = [*(id *)(a1 + 32) errorInfoKey];
  v9[1] = v3;
  v4 = [*(id *)(a1 + 32) cancelledInfoKey];
  v9[2] = v4;
  v5 = [*(id *)(a1 + 32) inCloudInfoKey];
  v9[3] = v5;
  v9[4] = @"PHImageFileSandboxExtensionTokenKey";
  v9[5] = @"PHImageResultClientShouldRetryKey";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:6];
  uint64_t v7 = [v2 setWithArray:v6];
  v8 = (void *)allowedInfoKeys_allowedKeys;
  allowedInfoKeys_allowedKeys = v7;
}

- (id)inCloudInfoKey
{
  v2 = @"PHImageResultIsInCloudKey";
  return @"PHImageResultIsInCloudKey";
}

- (id)cancelledInfoKey
{
  v2 = @"PHImageCancelledKey";
  return @"PHImageCancelledKey";
}

- (void)setError:(id)a3
{
}

- (void)clearError
{
}

- (id)_sanitizedError
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PHCompositeMediaResult *)self error];
  if ([(PHCompositeMediaResult *)self isCancelled])
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3072, 0);
  }
  else
  {
    if (!v3)
    {
LABEL_6:
      if ([(PHCompositeMediaResult *)self containsValidData]
        || [(PHCompositeMediaResult *)self isDegraded])
      {
        v5 = 0;
      }
      else
      {
        v6 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v9 = *MEMORY[0x1E4F28568];
        v10[0] = @"Unknown internal error";
        uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
        v5 = objc_msgSend(v6, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v7);
      }
      goto LABEL_10;
    }
    uint64_t v4 = PHPublicImageManagerErrorFromError(v3);
  }
  v5 = (void *)v4;

  if (!v5) {
    goto LABEL_6;
  }
LABEL_10:

  return v5;
}

- (id)sanitizedInfoDictionary
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v4 = [(NSMutableDictionary *)self->_mutableInfo allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v10 = [(PHCompositeMediaResult *)self allowedInfoKeys];
        int v11 = [v10 containsObject:v9];

        if (v11)
        {
          v12 = [(NSMutableDictionary *)self->_mutableInfo objectForKeyedSubscript:v9];
          [v3 setObject:v12 forKeyedSubscript:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }

  if ([(PHCompositeMediaResult *)self isCancelled])
  {
    v13 = [(PHCompositeMediaResult *)self cancelledInfoKey];
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v13];
  }
  if ([(PHCompositeMediaResult *)self isInCloud])
  {
    v14 = [(PHCompositeMediaResult *)self inCloudInfoKey];
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v14];
  }
  v15 = [(PHCompositeMediaResult *)self error];
  int IsMediaServerDisconnected = PHErrorIsMediaServerDisconnected();

  if (IsMediaServerDisconnected) {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"PHImageResultClientShouldRetryKey"];
  }
  v17 = [(PHCompositeMediaResult *)self _sanitizedError];
  v18 = [(PHCompositeMediaResult *)self errorInfoKey];
  [v3 setObject:v17 forKeyedSubscript:v18];

  return v3;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (id)error
{
  return (id)[(NSMutableDictionary *)self->_mutableInfo objectForKeyedSubscript:@"PHImageErrorKey"];
}

- (id)errorInfoKey
{
  v2 = @"PHImageErrorKey";
  return @"PHImageErrorKey";
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (id)allowedInfoKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__PHCompositeMediaResult_allowedInfoKeys__block_invoke;
  block[3] = &unk_1E5848578;
  block[4] = self;
  if (allowedInfoKeys_onceToken != -1) {
    dispatch_once(&allowedInfoKeys_onceToken, block);
  }
  return (id)allowedInfoKeys_allowedKeys;
}

- (id)sandboxExtensionToken
{
  return (id)[(NSMutableDictionary *)self->_mutableInfo objectForKeyedSubscript:@"PHImageFileSandboxExtensionTokenKey"];
}

- (void)setSandboxExtensionToken:(id)a3
{
}

- (void)setErrorIfNone:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(PHCompositeMediaResult *)self error];

  uint64_t v5 = v6;
  if (v6 && !v4)
  {
    [(PHCompositeMediaResult *)self setError:v6];
    uint64_t v5 = v6;
  }
}

- (void)addInfoFromDictionary:(id)a3
{
  mutableInfo = self->_mutableInfo;
  id v5 = a3;
  [(NSMutableDictionary *)mutableInfo addEntriesFromDictionary:v5];
  id v6 = [v5 objectForKeyedSubscript:@"PHImageResultIsInCloudKey"];
  -[PHCompositeMediaResult setIsInCloud:](self, "setIsInCloud:", [v6 BOOLValue]);

  id v7 = [v5 objectForKeyedSubscript:@"PHImageCancelledKey"];

  -[PHCompositeMediaResult setCancelled:](self, "setCancelled:", [v7 BOOLValue]);
}

- (void)setInfo:(id)a3 forKey:(id)a4
{
}

- (id)info
{
  return self->_mutableInfo;
}

- (void)setIsInCloud:(BOOL)a3
{
  self->_isInCloud = a3;
}

- (BOOL)isDerivedFromDeferredPreview
{
  return 0;
}

- (BOOL)isDegraded
{
  return 0;
}

- (BOOL)isPlaceholder
{
  return 0;
}

- (id)mediaMetadata
{
  return 0;
}

- (id)imagePropertiesLoadIfNeeded:(BOOL)a3
{
  if (a3 && !self->_imageProperties)
  {
    uint64_t v4 = [(PHCompositeMediaResult *)self imageURL];
    if (v4)
    {
      id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v6 = [v4 path];
      int v7 = [v5 fileExistsAtPath:v6 isDirectory:0];

      if (v7)
      {
        CGImageSourceRef v8 = CGImageSourceCreateWithURL((CFURLRef)v4, 0);
        if (v8)
        {
          CGImageSourceRef v9 = v8;
          v10 = (NSDictionary *)[MEMORY[0x1E4F8A950] newImagePropertiesFromImageSource:v8];
          imageProperties = self->_imageProperties;
          self->_imageProperties = v10;

          CFRelease(v9);
        }
      }
    }
  }
  v12 = self->_imageProperties;

  return v12;
}

- (id)imageProperties
{
  return [(PHCompositeMediaResult *)self imagePropertiesLoadIfNeeded:0];
}

- (id)baseVersionNeeded
{
  return 0;
}

- (BOOL)canHandleAdjustmentData
{
  return 1;
}

- (id)adjustmentSecondaryDataURL
{
  return 0;
}

- (id)adjustmentData
{
  return 0;
}

- (id)uniformTypeIdentifier
{
  return 0;
}

- (id)videoAdjustmentData
{
  return 0;
}

- (id)fingerPrint
{
  return 0;
}

- (id)videoMediaItemMakerData
{
  return 0;
}

- (id)videoURL
{
  return 0;
}

- (unsigned)cgOrientation
{
  id v3 = [(PHCompositeMediaResult *)self exifOrientation];

  if (!v3) {
    return 1;
  }
  uint64_t v4 = [(PHCompositeMediaResult *)self exifOrientation];
  unsigned int v5 = [v4 intValue];

  return v5;
}

- (int64_t)uiOrientation
{
  return 0;
}

- (id)exifOrientation
{
  return 0;
}

- (id)imageData
{
  return 0;
}

- (id)imageURL
{
  return 0;
}

- (CGImage)imageRef
{
  return 0;
}

- (BOOL)containsValidData
{
  v2 = [(PHCompositeMediaResult *)self error];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)resultWithRequestID:(int)a3 error:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  int v7 = (void *)[objc_alloc((Class)a1) initWithRequestID:v4];
  [v7 setError:v6];

  return v7;
}

@end