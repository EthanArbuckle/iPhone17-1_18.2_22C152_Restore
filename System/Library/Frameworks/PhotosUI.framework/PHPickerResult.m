@interface PHPickerResult
+ (BOOL)_validateBestCropRect:(CGRect)a3;
+ (BOOL)supportsSecureCoding;
- (BOOL)_isAssetResult;
- (BOOL)isEqual:(id)a3;
- (CGRect)_preferredContentsRectForTargetSize:(CGSize)a3;
- (NSItemProvider)itemProvider;
- (NSString)assetIdentifier;
- (NSString)itemIdentifier;
- (PHPickerResult)init;
- (PHPickerResult)initWithCoder:(id)a3;
- (_PHPickerResultMetadata)_metadata;
- (id)_filePromiseURLForTypeIdentifier:(id)a3;
- (id)_initWithItemProvider:(id)a3 assetIdentifier:(id)a4;
- (id)_initWithItemProvider:(id)a3 itemIdentifier:(id)a4 isAssetResult:(BOOL)a5 metadata:(id)a6;
- (unint64_t)hash;
- (void)_requestThumbnailImageURLForPreferredSize:(int64_t)a3 resultHandler:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PHPickerResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->__metadata, 0);

  objc_storeStrong((id *)&self->_itemProvider, 0);
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (_PHPickerResultMetadata)_metadata
{
  return self->__metadata;
}

- (BOOL)_isAssetResult
{
  return self->__isAssetResult;
}

- (NSItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (void)encodeWithCoder:(id)a3
{
  itemIdentifier = self->_itemIdentifier;
  id v5 = a3;
  [v5 encodeObject:itemIdentifier forKey:@"PHPickerResultItemIdentifierKey"];
  [v5 encodeBool:self->__isAssetResult forKey:@"PHPickerResultIsAssetResultKey"];
  [v5 encodeObject:self->__metadata forKey:@"PHPickerResultMetadataKey"];
}

- (PHPickerResult)initWithCoder:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)PHPickerResult;
  id v5 = [(PHPickerResult *)&v38 init];
  v6 = v5;
  if (v5)
  {
    v30 = v5;
    if (initWithCoder__onceToken != -1) {
      dispatch_once(&initWithCoder__onceToken, &__block_literal_global_634);
    }
    v31 = v4;
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHPickerResultMetadataKey"];
    v8 = [PUPhotosFileProviderItemProvider alloc];
    v9 = [(_PHPickerResultMetadata *)v7 filePromiseURLs];
    v10 = [(_PHPickerResultMetadata *)v7 sandboxExtensionTokens];
    v11 = [(PUPhotosFileProviderItemProvider *)v8 initWithProgressURLs:v9 progressURLSandboxExtensionTokens:v10];

    v12 = [(_PHPickerResultMetadata *)v7 suggestedName];
    [(PUPhotosFileProviderItemProvider *)v11 setSuggestedName:v12];

    v32 = v11;
    [(PUPhotosFileProviderItemProvider *)v11 set_copyToTemporaryDirectoryBeforeCallingOpenInPlaceCompletionHandler:[(_PHPickerResultMetadata *)v7 allowsItemProviderOpenInPlace]];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v13 = [(_PHPickerResultMetadata *)v7 typeIdentifiers];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v35 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          v19 = [(_PHPickerResultMetadata *)v7 filePromiseURLs];
          v20 = [v19 objectForKeyedSubscript:v18];

          v21 = [(_PHPickerResultMetadata *)v7 sandboxExtensionTokens];
          v22 = [v21 objectForKeyedSubscript:v18];

          if (v20) {
            BOOL v23 = v22 == 0;
          }
          else {
            BOOL v23 = 1;
          }
          if (!v23)
          {
            v33[0] = MEMORY[0x263EF8330];
            v33[1] = 3221225472;
            v33[2] = __32__PHPickerResult_initWithCoder___block_invoke_2;
            v33[3] = &unk_2642C56D8;
            v33[4] = v20;
            v33[5] = v22;
            [(PUPhotosFileProviderItemProvider *)v32 registerFileRepresentationForTypeIdentifier:v18 fileOptions:0 visibility:3 loadHandler:v33];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v15);
    }

    v6 = v30;
    itemProvider = v30->_itemProvider;
    v30->_itemProvider = &v32->super;
    v25 = v32;

    id v4 = v31;
    uint64_t v26 = [v31 decodeObjectOfClass:objc_opt_class() forKey:@"PHPickerResultItemIdentifierKey"];
    itemIdentifier = v30->_itemIdentifier;
    v30->_itemIdentifier = (NSString *)v26;

    v30->__isAssetResult = [v31 decodeBoolForKey:@"PHPickerResultIsAssetResultKey"];
    metadata = v30->__metadata;
    v30->__metadata = v7;
  }
  return v6;
}

uint64_t __32__PHPickerResult_initWithCoder___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = initWithCoder__queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__PHPickerResult_initWithCoder___block_invoke_3;
  block[3] = &unk_2642C56B0;
  long long v8 = *(_OWORD *)(a1 + 32);
  id v9 = v3;
  id v5 = v3;
  dispatch_async(v4, block);

  return 0;
}

void __32__PHPickerResult_initWithCoder___block_invoke_3(void *a1)
{
  id v2 = (id)[objc_alloc(MEMORY[0x263F5DB80]) initWithURL:a1[4] sandboxExtensionToken:a1[5] consume:1];
  (*(void (**)(void))(a1[6] + 16))();
}

void __32__PHPickerResult_initWithCoder___block_invoke()
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x263EF83A8], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.photos.picker.results", v0);
  id v2 = (void *)initWithCoder__queue;
  initWithCoder__queue = (uint64_t)v1;
}

- (id)_initWithItemProvider:(id)a3 itemIdentifier:(id)a4 isAssetResult:(BOOL)a5 metadata:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (v11)
  {
    uint64_t v14 = v13;
    v25.receiver = self;
    v25.super_class = (Class)PHPickerResult;
    uint64_t v15 = [(PHPickerResult *)&v25 init];
    if (!v15)
    {
LABEL_5:

      return v15;
    }
    if ([(PHPickerResult *)v15 isMemberOfClass:objc_opt_class()])
    {
      objc_storeStrong((id *)&v15->_itemProvider, a3);
      uint64_t v16 = [v12 copy];
      itemIdentifier = v15->_itemIdentifier;
      v15->_itemIdentifier = (NSString *)v16;

      v15->__isAssetResult = a5;
      uint64_t v18 = [v14 copy];
      metadata = v15->__metadata;
      v15->__metadata = (_PHPickerResultMetadata *)v18;

      goto LABEL_5;
    }
  }
  else
  {
    _PFAssertFailHandler();
  }
  v21 = (PHPickerResult *)_PFAssertFailHandler();
  return [(PHPickerResult *)v21 _initWithItemProvider:v23 assetIdentifier:v24];
}

- (id)_initWithItemProvider:(id)a3 assetIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    long long v8 = v7;
    id v9 = [(PHPickerResult *)self _initWithItemProvider:v6 itemIdentifier:v7 isAssetResult:1 metadata:0];

    return v9;
  }
  else
  {
    id v11 = (PHPickerResult *)_PFAssertFailHandler();
    return [(PHPickerResult *)v11 _filePromiseURLForTypeIdentifier:v13];
  }
}

- (id)_filePromiseURLForTypeIdentifier:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4) {
    _PFAssertFailHandler();
  }
  id v5 = v4;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = [(PHPickerResult *)self _metadata];
  id v7 = [v6 typeIdentifiers];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v26 = self;
    v27 = v7;
    uint64_t v10 = *(void *)v30;
    v28 = v5;
    uint64_t v25 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        id v13 = [MEMORY[0x263F1D920] typeWithIdentifier:v5];
        uint64_t v14 = [MEMORY[0x263F1D920] typeWithIdentifier:v12];
        uint64_t v15 = v14;
        if (v13) {
          BOOL v16 = v14 == 0;
        }
        else {
          BOOL v16 = 1;
        }
        if (!v16 && [v14 conformsToType:v13])
        {
          v17 = [(PHPickerResult *)v26 _metadata];
          uint64_t v18 = [v17 filePromiseURLs];
          v19 = [v18 objectForKeyedSubscript:v12];

          v20 = [(PHPickerResult *)v26 _metadata];
          v21 = [v20 sandboxExtensionTokens];
          SEL v22 = [v21 objectForKeyedSubscript:v12];

          if (v19 && v22)
          {
            id v23 = (void *)[objc_alloc(MEMORY[0x263F5DB80]) initWithURL:v19 sandboxExtensionToken:v22 consume:1];

            id v7 = v27;
            id v5 = v28;
            goto LABEL_19;
          }

          id v7 = v27;
          id v5 = v28;
          uint64_t v10 = v25;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  id v23 = 0;
LABEL_19:

  return v23;
}

- (void)_requestThumbnailImageURLForPreferredSize:(int64_t)a3 resultHandler:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = v6;
    if (a3 == 1) {
      uint64_t v8 = @"com.apple.private.photos.thumbnail.low";
    }
    else {
      uint64_t v8 = @"com.apple.private.photos.thumbnail.standard";
    }
    uint64_t v9 = [(PHPickerResult *)self itemProvider];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __74__PHPickerResult__requestThumbnailImageURLForPreferredSize_resultHandler___block_invoke;
    v13[3] = &unk_2642C5688;
    id v14 = v7;
    id v10 = v7;
    id v11 = (id)[v9 loadFileRepresentationForTypeIdentifier:v8 completionHandler:v13];
  }
  else
  {
    uint64_t v12 = _PFAssertFailHandler();
    __74__PHPickerResult__requestThumbnailImageURLForPreferredSize_resultHandler___block_invoke(v12);
  }
}

uint64_t __74__PHPickerResult__requestThumbnailImageURLForPreferredSize_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CGRect)_preferredContentsRectForTargetSize:(CGSize)a3
{
  double v4 = 1.0;
  if (a3.width != 0.0 && a3.height != 0.0)
  {
    BOOL v5 = a3.width == *MEMORY[0x263F5D550] && a3.height == *(double *)(MEMORY[0x263F5D550] + 8);
    double v6 = fabs(a3.width / a3.height);
    if (v5) {
      double v4 = 1.0;
    }
    else {
      double v4 = v6;
    }
  }
  double v47 = v4;
  id v7 = (void *)MEMORY[0x263F5DF00];
  uint64_t v8 = [(PHPickerResult *)self _metadata];
  uint64_t v9 = [v8 pixelWidth];
  id v10 = [(PHPickerResult *)self _metadata];
  uint64_t v11 = [v10 pixelHeight];
  uint64_t v12 = [(PHPickerResult *)self _metadata];
  [v12 preferredCropRect];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  v21 = [(PHPickerResult *)self _metadata];
  [v21 acceptableCropRect];
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  long long v30 = [(PHPickerResult *)self _metadata];
  [v30 normalizedFaceAreaRect];
  objc_msgSend(v7, "bestCropRectForAspectRatio:verticalContentMode:cropMode:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:", 0, 3, v9, v11, v47, v14, v16, v18, v20, v23, v25, v27, v29, v31, v32, v33,
    v34);
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;
  double v42 = v41;

  +[PHPickerResult _validateBestCropRect:](PHPickerResult, "_validateBestCropRect:", v36, v38, v40, v42);
  double v43 = v36;
  double v44 = v38;
  double v45 = v40;
  double v46 = v42;
  result.size.height = v46;
  result.size.width = v45;
  result.origin.y = v44;
  result.origin.x = v43;
  return result;
}

- (NSString)assetIdentifier
{
  if (self->__isAssetResult) {
    return self->_itemIdentifier;
  }
  else {
    return (NSString *)0;
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSItemProvider *)self->_itemProvider hash];
  NSUInteger v4 = [(NSString *)self->_itemIdentifier hash];
  uint64_t v5 = self->__isAssetResult - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3);
  return [(_PHPickerResultMetadata *)self->__metadata hash] - v5 + 32 * v5 + 923521;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (PHPickerResult *)a3;
  if (self == v4)
  {
    char v12 = 1;
LABEL_17:

    return v12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v12 = 0;
    goto LABEL_17;
  }
  uint64_t v5 = v4;
  double v6 = (objc_class *)objc_opt_class();
  if (v5)
  {
    if (objc_opt_isKindOfClass())
    {
      if ([(NSItemProvider *)self->_itemProvider isEqual:v5->_itemProvider])
      {
        itemIdentifier = self->_itemIdentifier;
        uint64_t v8 = v5->_itemIdentifier;
        if (itemIdentifier == v8)
        {
        }
        else
        {
          uint64_t v9 = v8;
          id v10 = itemIdentifier;
          int v11 = [(NSString *)v10 isEqual:v9];

          if (!v11) {
            goto LABEL_15;
          }
        }
        if (self->__isAssetResult == v5->__isAssetResult)
        {
          metadata = self->__metadata;
          double v14 = v5->__metadata;
          double v15 = metadata;
          double v16 = v15;
          if (v15 == v14) {
            char v12 = 1;
          }
          else {
            char v12 = [(_PHPickerResultMetadata *)v15 isEqual:v14];
          }

          goto LABEL_16;
        }
      }
LABEL_15:
      char v12 = 0;
LABEL_16:

      goto LABEL_17;
    }
    double v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    objc_claimAutoreleasedReturnValue();
    double v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSStringFromClass(v6);
    objc_claimAutoreleasedReturnValue();
  }
  double v20 = (PHPickerResult *)_PFAssertFailHandler();
  return [(PHPickerResult *)v20 init];
}

- (PHPickerResult)init
{
  id v2 = (void *)_PFAssertFailHandler();
  return (PHPickerResult *)+[PHPickerResult supportsSecureCoding];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)_validateBestCropRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (CGRectIsEmpty(a3))
  {
    [[NSString alloc] initWithFormat:@"{{%.2f, %.2f}, {%.2f, %.2f}}", *(void *)&x, *(void *)&y, *(void *)&width, *(void *)&height];
    _PFAssertFailHandler();
  }
  v18.origin.CGFloat x = 0.0;
  v18.origin.CGFloat y = 0.0;
  v18.size.CGFloat width = 1.0;
  v18.size.CGFloat height = 1.0;
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  BOOL v7 = CGRectContainsRect(v18, v19);
  uint64_t v8 = PLPickerGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = [[NSString alloc] initWithFormat:@"{{%.2f, %.2f}, {%.2f, %.2f}}", *(void *)&x, *(void *)&y, *(void *)&width, *(void *)&height];
    id v10 = (void *)v9;
    int v11 = @"is not";
    if (v7) {
      int v11 = @"is";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    double v16 = v11;
    _os_log_impl(&dword_217C33000, v8, OS_LOG_TYPE_DEBUG, "%@ %@ contained in the unit rect.", buf, 0x16u);
  }
  return v7;
}

@end