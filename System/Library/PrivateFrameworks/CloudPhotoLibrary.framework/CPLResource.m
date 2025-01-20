@interface CPLResource
+ (BOOL)cplShouldGenerateDerivatives;
+ (BOOL)cplShouldIgnorePropertyForCoding:(id)a3;
+ (BOOL)cplShouldIgnorePropertyForEquality:(id)a3;
+ (BOOL)hasPriorityBoostForResourceType:(unint64_t)a3;
+ (BOOL)isAdjustedResourceType:(unint64_t)a3;
+ (BOOL)isDerivativeResourceType:(unint64_t)a3;
+ (BOOL)isDynamicFingerprint:(id)a3;
+ (BOOL)isNonDerivativeResourceType:(unint64_t)a3;
+ (BOOL)resourceTypeSupportsResourceExpunge:(unint64_t)a3;
+ (BOOL)resourceTypeTrackedForUpload:(unint64_t)a3;
+ (BOOL)shouldIgnoreResourceTypeOnUpload:(unint64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (BOOL)usesFakeDerivatives;
+ (float)derivativeGenerationThreshold;
+ (id)descriptionForResourceType:(unint64_t)a3;
+ (id)normalizedResourcesFromResources:(id)a3 resourcePerResourceType:(id *)a4;
+ (id)predicateMatchingDynamicFingerprintForKey:(id)a3;
+ (id)shortDescriptionForResourceType:(unint64_t)a3;
+ (unint64_t)countOfResourceTypes;
+ (unint64_t)largeResourceSizeThreshold;
+ (unint64_t)maxPixelSizeForResourceType:(unint64_t)a3;
+ (unint64_t)resourceTypeFromShortDescription:(id)a3;
+ (void)enumerateResourceTypesWithBlock:(id)a3;
+ (void)getAllResourceTypesToDownload:(const unint64_t *)a3;
+ (void)getAllResourceTypesToDownloadPrioritizeNonDerivatives:(const unint64_t *)a3;
- (BOOL)canGenerateDerivative;
- (BOOL)isTrackedForUpload;
- (CPLResource)initWithCPLArchiver:(id)a3;
- (CPLResource)initWithCoder:(id)a3;
- (CPLResource)initWithResourceIdentity:(id)a3 itemScopedIdentifier:(id)a4 resourceType:(unint64_t)a5;
- (CPLResourceIdentity)identity;
- (CPLScopedIdentifier)itemScopedIdentifier;
- (NSString)itemIdentifier;
- (id)bestFileNameForResource;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)redactedDescription;
- (unint64_t)_backgroundDownloadTaskIdentifier;
- (unint64_t)estimatedResourceSize;
- (unint64_t)resourceType;
- (unint64_t)sourceResourceType;
- (void)_setBackgroundDownloadTaskIdentifier:(unint64_t)a3;
- (void)setCanGenerateDerivative:(BOOL)a3;
- (void)setIdentity:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setItemScopedIdentifier:(id)a3;
- (void)setResourceType:(unint64_t)a3;
- (void)setSourceResourceType:(unint64_t)a3;
@end

@implementation CPLResource

+ (unint64_t)maxPixelSizeForResourceType:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unint64_t result = 104857600;
  switch(a3)
  {
    case 2uLL:
      return result;
    case 3uLL:
      unint64_t result = 25165824;
      break;
    case 4uLL:
      unint64_t result = 3145728;
      break;
    case 5uLL:
      unint64_t result = 172800;
      break;
    default:
      if (a3 != 15)
      {
        if (!_CPLSilentLogging)
        {
          v6 = __CPLGenericOSLogDomain();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            v7 = [a1 descriptionForResourceType:a3];
            int v8 = 138412290;
            v9 = v7;
            _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Unsupported resource type %@ for maxPixels", (uint8_t *)&v8, 0xCu);
          }
        }
        unint64_t result = 0;
      }
      break;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 cplCopyPropertiesFromObject:self withCopyBlock:0];
  return v4;
}

- (CPLResource)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPLResource;
  v5 = [(CPLResource *)&v11 init];
  v6 = v5;
  if (v5)
  {
    [v5 cplDecodePropertiesFromCoder:v4];
    v7 = [(CPLResource *)v6 itemScopedIdentifier];

    if (!v7)
    {
      if (initWithCoder__onceToken_103 != -1) {
        dispatch_once(&initWithCoder__onceToken_103, &__block_literal_global_106);
      }
      int v8 = [v4 decodeObjectOfClass:initWithCoder__stringClass_104 forKey:@"itemIdentifier"];
      if (v8)
      {
        v9 = [[CPLScopedIdentifier alloc] initWithScopeIdentifier:@"PrimarySync" identifier:v8];
        [(CPLResource *)v6 setItemScopedIdentifier:v9];
      }
    }
  }

  return v6;
}

uint64_t __42__CPLResource_CPLNSCoding__initWithCoder___block_invoke()
{
  uint64_t result = objc_opt_class();
  initWithCoder__stringClass_104 = result;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)cplShouldIgnorePropertyForCoding:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"itemIdentifier"])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CPLResource;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_cplShouldIgnorePropertyForCoding_, v4);
  }

  return v5;
}

- (CPLResource)initWithCPLArchiver:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPLResource;
  unsigned __int8 v5 = [&v11 initWithCPLArchiver:v4];
  v6 = v5;
  if (v5)
  {
    objc_super v7 = [(CPLResource *)v5 itemScopedIdentifier];

    if (!v7)
    {
      if (initWithCPLArchiver__onceToken_1899 != -1) {
        dispatch_once(&initWithCPLArchiver__onceToken_1899, &__block_literal_global_1902);
      }
      int v8 = [v4 decodeObjectOfClass:initWithCPLArchiver__stringClass_1900 forKey:@"itemIdentifier"];
      if (v8)
      {
        v9 = [[CPLScopedIdentifier alloc] initWithScopeIdentifier:@"PrimarySync" identifier:v8];
        [(CPLResource *)v6 setItemScopedIdentifier:v9];
      }
    }
  }

  return v6;
}

uint64_t __48__CPLResource_CPLArchiver__initWithCPLArchiver___block_invoke()
{
  uint64_t result = objc_opt_class();
  initWithCPLArchiver__stringClass_1900 = result;
  return result;
}

+ (BOOL)usesFakeDerivatives
{
  if (usesFakeDerivatives_onceToken != -1) {
    dispatch_once(&usesFakeDerivatives_onceToken, &__block_literal_global_335);
  }
  return usesFakeDerivatives_usesFakeDerivatives;
}

void __34__CPLResource_usesFakeDerivatives__block_invoke()
{
  if (os_variant_has_internal_content())
  {
    id v1 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v0 = [v1 stringForKey:@"CPLFakeDynamicDerivatives"];
    usesFakeDerivatives_usesFakeDerivatives = v0 != 0;
  }
}

+ (id)predicateMatchingDynamicFingerprintForKey:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unsigned __int8 v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K BEGINSWITH %@", v4, @"#"];
  if ([a1 usesFakeDerivatives])
  {
    v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K BEGINSWITH %@", v4, @"^"];
    objc_super v7 = (void *)MEMORY[0x1E4F28BA0];
    v11[0] = v5;
    v11[1] = v6;
    int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    uint64_t v9 = [v7 orPredicateWithSubpredicates:v8];

    unsigned __int8 v5 = (void *)v9;
  }

  return v5;
}

+ (BOOL)isDynamicFingerprint:(id)a3
{
  id v4 = a3;
  BOOL v5 = ([v4 hasPrefix:@"#"] & 1) != 0
    || [a1 usesFakeDerivatives] && (objc_msgSend(v4, "hasPrefix:", @"^") & 1) != 0;

  return v5;
}

+ (unint64_t)countOfResourceTypes
{
  return 30;
}

+ (void)getAllResourceTypesToDownloadPrioritizeNonDerivatives:(const unint64_t *)a3
{
  if (getAllResourceTypesToDownloadPrioritizeNonDerivatives__onceToken != -1) {
    dispatch_once(&getAllResourceTypesToDownloadPrioritizeNonDerivatives__onceToken, &__block_literal_global_322);
  }
  *a3 = (const unint64_t *)&getAllResourceTypesToDownloadPrioritizeNonDerivatives__allResourceTypes;
}

double __69__CPLResource_getAllResourceTypesToDownloadPrioritizeNonDerivatives___block_invoke()
{
  uint64_t v0 = 0;
  id v1 = &getAllResourceTypesToDownloadPrioritizeNonDerivatives__allResourceTypes;
  do
  {
    if (+[CPLResource isNonDerivativeResourceType:v0])
    {
      *(void *)id v1 = v0;
      id v1 = (long long *)((char *)v1 + 8);
    }
    ++v0;
  }
  while (v0 != 29);
  *(void *)&double result = 5;
  *id v1 = xmmword_1B4E487B0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemScopedIdentifier, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

- (void)setCanGenerateDerivative:(BOOL)a3
{
  self->_canGenerateDerivative = a3;
}

- (BOOL)canGenerateDerivative
{
  return self->_canGenerateDerivative;
}

- (void)setSourceResourceType:(unint64_t)a3
{
  self->_sourceResourceType = a3;
}

- (unint64_t)sourceResourceType
{
  return self->_sourceResourceType;
}

- (void)setResourceType:(unint64_t)a3
{
  self->_resourceType = a3;
}

- (unint64_t)resourceType
{
  return self->_resourceType;
}

- (CPLScopedIdentifier)itemScopedIdentifier
{
  return self->_itemScopedIdentifier;
}

- (void)setIdentity:(id)a3
{
}

- (CPLResourceIdentity)identity
{
  return self->_identity;
}

- (void)_setBackgroundDownloadTaskIdentifier:(unint64_t)a3
{
  self->_backgroundDownloadTaskIdentifier = a3;
}

- (unint64_t)_backgroundDownloadTaskIdentifier
{
  return self->_backgroundDownloadTaskIdentifier;
}

- (unint64_t)estimatedResourceSize
{
  unint64_t result = [(CPLResourceIdentity *)self->_identity fileSize];
  if (!result)
  {
    unint64_t resourceType = self->_resourceType;
    unint64_t result = 104857600;
    switch(resourceType)
    {
      case 1uLL:
      case 0x10uLL:
      case 0x17uLL:
      case 0x19uLL:
        goto LABEL_9;
      case 2uLL:
      case 6uLL:
      case 0xEuLL:
      case 0xFuLL:
      case 0x11uLL:
      case 0x1CuLL:
        unint64_t result = 0x200000;
        break;
      case 3uLL:
      case 7uLL:
      case 9uLL:
      case 0x16uLL:
        unint64_t result = 0x100000;
        break;
      case 4uLL:
        unint64_t result = 614400;
        break;
      case 5uLL:
        unint64_t result = 51200;
        break;
      case 8uLL:
        unint64_t result = 3145728;
        break;
      case 0xAuLL:
      case 0xDuLL:
      case 0x1AuLL:
      case 0x1BuLL:
        unint64_t result = 102400;
        break;
      case 0xBuLL:
      case 0xCuLL:
        return result;
      case 0x12uLL:
      case 0x13uLL:
      case 0x14uLL:
      case 0x15uLL:
      case 0x18uLL:
        unint64_t result = 0x400000;
        break;
      default:
        if (resourceType == 1000) {
LABEL_9:
        }
          unint64_t result = 10485760;
        break;
    }
  }
  return result;
}

- (BOOL)isTrackedForUpload
{
  return +[CPLResource resourceTypeTrackedForUpload:self->_resourceType];
}

- (id)bestFileNameForResource
{
  v3 = [(CPLResource *)self identity];
  id v4 = [v3 fingerPrint];
  BOOL v5 = [v3 fileUTI];
  v6 = +[CPLResourceIdentity storageNameForFingerPrint:v4 fileUTI:v5 bucket:0];

  if (v6)
  {
    unint64_t v7 = [(CPLResource *)self resourceType];
    int v8 = @"Unknown_";
    switch(v7)
    {
      case 0uLL:
        break;
      case 1uLL:
        int v8 = @"Original_";
        break;
      case 2uLL:
        int v8 = @"FullSize_";
        break;
      case 3uLL:
        int v8 = @"LargeSize_";
        break;
      case 4uLL:
        int v8 = @"MediumSize_";
        break;
      case 5uLL:
        int v8 = @"Thumb_";
        break;
      case 6uLL:
        int v8 = @"VideoMedium_";
        break;
      case 7uLL:
        int v8 = @"Small_";
        break;
      case 8uLL:
        int v8 = @"Audio_";
        break;
      case 9uLL:
        int v8 = @"SidecarXMP_";
        break;
      case 0xAuLL:
        int v8 = @"MediaMetaData_";
        break;
      case 0xBuLL:
      case 0xCuLL:
        goto LABEL_7;
      case 0xDuLL:
        int v8 = @"AdjustmentData_";
        break;
      case 0xEuLL:
        int v8 = @"AdjustmentSecondaryData_";
        break;
      case 0xFuLL:
        int v8 = @"AdjustmentBaseFullSize_";
        break;
      case 0x10uLL:
        int v8 = @"VideoFull_";
        break;
      case 0x11uLL:
        int v8 = @"OriginalAlt_";
        break;
      case 0x12uLL:
        int v8 = @"OriginalVidCompl_";
        break;
      case 0x13uLL:
        int v8 = @"VideoCompl_";
        break;
      case 0x14uLL:
        int v8 = @"AdjustmentBaseVideoCompl_";
        break;
      case 0x15uLL:
        int v8 = @"VideoLargeSize_";
        break;
      case 0x16uLL:
        int v8 = @"SidecarOther_";
        break;
      case 0x17uLL:
        int v8 = @"OriginalSpatialOverCapture_";
        break;
      case 0x18uLL:
        int v8 = @"OriginalSpatialOverCaptureVidCompl_";
        break;
      case 0x19uLL:
        int v8 = @"AdjustmentBaseVideo_";
        break;
      case 0x1AuLL:
        int v8 = @"VideoMetaData_";
        break;
      case 0x1BuLL:
        int v8 = @"AdjustedMediaMetaData_";
        break;
      case 0x1CuLL:
        int v8 = @"VideoHDRMedium_";
        break;
      default:
        if (v7 == 1000) {
          int v8 = @"AdjustmentOriginalResource_";
        }
        else {
LABEL_7:
        }
          int v8 = @"Unsupported_";
        break;
    }
    uint64_t v9 = [(__CFString *)v8 stringByAppendingString:v6];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)redactedDescription
{
  v3 = [(CPLResource *)self identity];
  id v4 = [v3 fileURL];
  BOOL v5 = NSString;
  v6 = +[CPLResource shortDescriptionForResourceType:[(CPLResource *)self resourceType]];
  unint64_t v7 = [(CPLResource *)self itemScopedIdentifier];
  int v8 = [v3 fingerPrint];
  uint64_t v9 = [v3 fileUTI];
  int v10 = [v3 isAvailable];
  objc_super v11 = " unavailable";
  if (v10) {
    objc_super v11 = "";
  }
  if (v4) {
    v12 = @"[%@ for %@ (%@ - %@) file: <redacted>%s]";
  }
  else {
    v12 = @"[%@ for %@ (%@ - %@) no file%s]";
  }
  v13 = objc_msgSend(v5, "stringWithFormat:", v12, v6, v7, v8, v9, v11);

  return v13;
}

- (id)description
{
  v3 = [(CPLResource *)self identity];
  id v4 = [v3 fileURL];
  BOOL v5 = NSString;
  v6 = +[CPLResource shortDescriptionForResourceType:[(CPLResource *)self resourceType]];
  unint64_t v7 = [(CPLResource *)self itemScopedIdentifier];
  int v8 = [v3 fingerPrint];
  uint64_t v9 = [v3 fileUTI];
  if (v4)
  {
    int v10 = [v4 path];
    int v11 = [v3 isAvailable];
    v12 = " unavailable";
    if (v11) {
      v12 = "";
    }
    v13 = [v5 stringWithFormat:@"[%@ for %@ (%@ - %@) file: %@%s]", v6, v7, v8, v9, v10, v12];
  }
  else
  {
    int v14 = [v3 isAvailable];
    v15 = " unavailable";
    if (v14) {
      v15 = "";
    }
    v13 = [v5 stringWithFormat:@"[%@ for %@ (%@ - %@) no file%s]", v6, v7, v8, v9, v15];
  }

  return v13;
}

- (void)setItemScopedIdentifier:(id)a3
{
}

- (NSString)itemIdentifier
{
  return [(CPLScopedIdentifier *)self->_itemScopedIdentifier identifier];
}

- (void)setItemIdentifier:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    id v4 = [[CPLScopedIdentifier alloc] initWithScopeIdentifier:@"PrimarySync" identifier:v6];
    itemScopedIdentifier = self->_itemScopedIdentifier;
    self->_itemScopedIdentifier = v4;
  }
  else
  {
    itemScopedIdentifier = self->_itemScopedIdentifier;
    self->_itemScopedIdentifier = 0;
  }
}

- (CPLResource)initWithResourceIdentity:(id)a3 itemScopedIdentifier:(id)a4 resourceType:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CPLResource;
  int v11 = [(CPLResource *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identity, a3);
    objc_storeStrong((id *)&v12->_itemScopedIdentifier, a4);
    v12->_unint64_t resourceType = a5;
  }

  return v12;
}

+ (void)getAllResourceTypesToDownload:(const unint64_t *)a3
{
  *a3 = (const unint64_t *)&getAllResourceTypesToDownload__result;
}

+ (BOOL)isAdjustedResourceType:(unint64_t)a3
{
  return (a3 > 0x1B) | (0x5AF19FFu >> a3) & 1;
}

+ (BOOL)isNonDerivativeResourceType:(unint64_t)a3
{
  if (a3 > 0x1C || a3 <= 0xC && ((1 << a3) & 0x1801) != 0) {
    return 0;
  }
  else {
    return objc_msgSend(a1, "isDerivativeResourceType:", v3, v4) ^ 1;
  }
}

+ (BOOL)isDerivativeResourceType:(unint64_t)a3
{
  return (a3 < 0x1D) & (0x102000F8u >> a3);
}

+ (void)enumerateResourceTypesWithBlock:(id)a3
{
  uint64_t v3 = (void (**)(id, uint64_t, char *))a3;
  uint64_t v4 = 0;
  char v5 = 0;
  while (1)
  {
    v3[2](v3, v4, &v5);
    if (v5) {
      break;
    }
    if (++v4 == 29)
    {
      v3[2](v3, 1000, &v5);
      break;
    }
  }
}

+ (BOOL)resourceTypeSupportsResourceExpunge:(unint64_t)a3
{
  return a3 - 23 < 2;
}

+ (BOOL)resourceTypeTrackedForUpload:(unint64_t)a3
{
  return a3 == 18 || (a3 & 0xFFFFFFFFFFFFFFEFLL) == 1 || a3 - 23 < 2;
}

+ (BOOL)cplShouldGenerateDerivatives
{
  if (cplShouldGenerateDerivatives_onceToken != -1) {
    dispatch_once(&cplShouldGenerateDerivatives_onceToken, &__block_literal_global_12027);
  }
  return cplShouldGenerateDerivatives_cplShouldGenerateDerivatives;
}

uint64_t __43__CPLResource_cplShouldGenerateDerivatives__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v4 = [v0 objectForKey:@"CPLShouldGenerateDerivatives"];

  id v1 = v4;
  if (v4)
  {
    uint64_t v2 = [v4 BOOLValue];
    id v1 = v4;
  }
  else
  {
    uint64_t v2 = 1;
  }
  cplShouldGenerateDerivatives_cplShouldGenerateDerivatives = v2;
  return MEMORY[0x1F41817F8](v2, v1);
}

+ (unint64_t)largeResourceSizeThreshold
{
  return 52428800;
}

+ (float)derivativeGenerationThreshold
{
  return 1.2;
}

+ (BOOL)hasPriorityBoostForResourceType:(unint64_t)a3
{
  return a3 - 1 < 4;
}

+ (BOOL)shouldIgnoreResourceTypeOnUpload:(unint64_t)a3
{
  return a3 == 1000;
}

+ (id)shortDescriptionForResourceType:(unint64_t)a3
{
  uint64_t v4 = @"Unknown";
  switch(a3)
  {
    case 0xFFFFFFFFFFFFFFFFLL:
      uint64_t v4 = @"Any";
      break;
    case 0uLL:
      goto LABEL_101;
    case 1uLL:
      uint64_t v4 = @"Original";
      break;
    case 2uLL:
      uint64_t v4 = @"JPEGFull";
      break;
    case 3uLL:
      uint64_t v4 = @"JPEGLarge";
      break;
    case 4uLL:
      uint64_t v4 = @"JPEGMedium";
      break;
    case 5uLL:
      uint64_t v4 = @"JPEGThumbnail";
      break;
    case 6uLL:
      uint64_t v4 = @"VideoMedium";
      break;
    case 7uLL:
      uint64_t v4 = @"VideoSmall";
      break;
    case 8uLL:
      uint64_t v4 = @"Audio";
      break;
    case 9uLL:
      uint64_t v4 = @"SidecarXMP";
      break;
    case 0xAuLL:
      uint64_t v4 = @"MediaMetaData";
      break;
    case 0xBuLL:
      uint64_t v4 = @"Unused1";
      break;
    case 0xCuLL:
      uint64_t v4 = @"Unused2";
      break;
    case 0xDuLL:
      uint64_t v4 = @"AdjustmentData";
      break;
    case 0xEuLL:
      uint64_t v4 = @"AdjustmentSecondaryData";
      break;
    case 0xFuLL:
      uint64_t v4 = @"AdjustmentBaseFullSize";
      break;
    case 0x10uLL:
      uint64_t v4 = @"VideoFull";
      break;
    case 0x11uLL:
      uint64_t v4 = @"OriginalAlt";
      break;
    case 0x12uLL:
      uint64_t v4 = @"OriginalVidCompl";
      break;
    case 0x13uLL:
      uint64_t v4 = @"VideoCompl";
      break;
    case 0x14uLL:
      uint64_t v4 = @"AdjustmentBaseVideoCompl";
      break;
    case 0x15uLL:
      uint64_t v4 = @"VideoLarge";
      break;
    case 0x16uLL:
      uint64_t v4 = @"SidecarOther";
      break;
    case 0x17uLL:
      uint64_t v4 = @"OriginalSpatialOverCapture";
      break;
    case 0x18uLL:
      uint64_t v4 = @"OriginalSpatialOverCaptureVideoComplement";
      break;
    case 0x19uLL:
      uint64_t v4 = @"AdjustmentBaseVideo";
      break;
    case 0x1AuLL:
      uint64_t v4 = @"VideoMetaData";
      break;
    case 0x1BuLL:
      uint64_t v4 = @"AdjustedMediaMetaData";
      break;
    case 0x1CuLL:
      uint64_t v4 = @"VideoHDRMedium";
      break;
    case 0x1DuLL:
      uint64_t v4 = @"MaxNormal";
      break;
    default:
      if (a3 == 1000)
      {
        uint64_t v4 = @"AdjustmentOriginalResource";
      }
      else if (a3 == 1001)
      {
        uint64_t v4 = @"Max";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"ResourceType-%i", a3);
        uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_101:
      }
      break;
  }
  return v4;
}

+ (id)descriptionForResourceType:(unint64_t)a3
{
  uint64_t v4 = @"CPLResourceTypeUnknown";
  switch(a3)
  {
    case 0xFFFFFFFFFFFFFFFFLL:
      uint64_t v4 = @"CPLResourceTypeAny";
      break;
    case 0uLL:
      goto LABEL_101;
    case 1uLL:
      uint64_t v4 = @"CPLResourceTypeOriginal";
      break;
    case 2uLL:
      uint64_t v4 = @"CPLResourceTypeJPEGFullSize";
      break;
    case 3uLL:
      uint64_t v4 = @"CPLResourceTypeJPEGLargeSize";
      break;
    case 4uLL:
      uint64_t v4 = @"CPLResourceTypeJPEGMediumSize";
      break;
    case 5uLL:
      uint64_t v4 = @"CPLResourceTypeJPEGThumbnail";
      break;
    case 6uLL:
      uint64_t v4 = @"CPLResourceTypeVideoMediumSize";
      break;
    case 7uLL:
      uint64_t v4 = @"CPLResourceTypeVideoSmallSize";
      break;
    case 8uLL:
      uint64_t v4 = @"CPLResourceTypeSidecarAudio";
      break;
    case 9uLL:
      uint64_t v4 = @"CPLResourceTypeSidecarXMP";
      break;
    case 0xAuLL:
      uint64_t v4 = @"CPLResourceTypeMediaMetaData";
      break;
    case 0xBuLL:
      uint64_t v4 = @"CPLResourceTypeUnused1";
      break;
    case 0xCuLL:
      uint64_t v4 = @"CPLResourceTypeUnused2";
      break;
    case 0xDuLL:
      uint64_t v4 = @"CPLResourceTypeAdjustmentData";
      break;
    case 0xEuLL:
      uint64_t v4 = @"CPLResourceTypeAdjustmentSecondaryData";
      break;
    case 0xFuLL:
      uint64_t v4 = @"CPLResourceTypeAdjustmentBaseJPEGFullSize";
      break;
    case 0x10uLL:
      uint64_t v4 = @"CPLResourceTypeVideoFullSize";
      break;
    case 0x11uLL:
      uint64_t v4 = @"CPLResourceTypeOriginalAlternate";
      break;
    case 0x12uLL:
      uint64_t v4 = @"CPLResourceTypeOriginalVideoComplement";
      break;
    case 0x13uLL:
      uint64_t v4 = @"CPLResourceTypeVideoComplement";
      break;
    case 0x14uLL:
      uint64_t v4 = @"CPLResourceTypeAdjustmentBaseVideoComplement";
      break;
    case 0x15uLL:
      uint64_t v4 = @"CPLResourceTypeVideoLargeSize";
      break;
    case 0x16uLL:
      uint64_t v4 = @"CPLResourceTypeSidecarOther";
      break;
    case 0x17uLL:
      uint64_t v4 = @"CPLResourceTypeOriginalSpatialOverCapture";
      break;
    case 0x18uLL:
      uint64_t v4 = @"CPLResourceTypeOriginalSpatialOverCaptureVideoComplement";
      break;
    case 0x19uLL:
      uint64_t v4 = @"CPLResourceTypeAdjustmentBaseVideo";
      break;
    case 0x1AuLL:
      uint64_t v4 = @"CPLResourceTypeVideoMetaData";
      break;
    case 0x1BuLL:
      uint64_t v4 = @"CPLResourceTypeAdjustedMediaMetaData";
      break;
    case 0x1CuLL:
      uint64_t v4 = @"CPLResourceTypeVideoHDRMediumSize";
      break;
    case 0x1DuLL:
      uint64_t v4 = @"_CPLResourceTypeMaxNormal";
      break;
    default:
      if (a3 == 1000)
      {
        uint64_t v4 = @"CPLResourceTypeAdjustmentOriginalResource";
      }
      else if (a3 == 1001)
      {
        uint64_t v4 = @"CPLResourceTypeMax";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Unknown resource type %i", a3);
        uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_101:
      }
      break;
  }
  return v4;
}

+ (unint64_t)resourceTypeFromShortDescription:(id)a3
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CPLResource_resourceTypeFromShortDescription___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (resourceTypeFromShortDescription__onceToken != -1) {
    dispatch_once(&resourceTypeFromShortDescription__onceToken, block);
  }
  char v5 = [(id)resourceTypeFromShortDescription__mapping objectForKeyedSubscript:v4];
  id v6 = v5;
  if (v5) {
    unint64_t v7 = [v5 integerValue];
  }
  else {
    unint64_t v7 = 0;
  }

  return v7;
}

void __48__CPLResource_resourceTypeFromShortDescription___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__CPLResource_resourceTypeFromShortDescription___block_invoke_2;
  v8[3] = &unk_1E60A8AC8;
  id v4 = v2;
  uint64_t v5 = *(void *)(a1 + 32);
  id v9 = v4;
  uint64_t v10 = v5;
  [v3 enumerateResourceTypesWithBlock:v8];
  id v6 = (void *)resourceTypeFromShortDescription__mapping;
  resourceTypeFromShortDescription__mapping = (uint64_t)v4;
  id v7 = v4;
}

void __48__CPLResource_resourceTypeFromShortDescription___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v6 = [NSNumber numberWithUnsignedInteger:a2];
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [*(id *)(a1 + 40) shortDescriptionForResourceType:a2];
    [v4 setObject:v6 forKeyedSubscript:v5];
  }
}

+ (id)normalizedResourcesFromResources:(id)a3 resourcePerResourceType:(id *)a4
{
  v33[16] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 count])
  {
    v20 = a4;
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v30 != v9) {
            objc_enumerationMutation(v7);
          }
          int v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "resourceType", v20));
          [v6 setObject:v11 forKey:v12];
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v8);
    }

    unint64_t v13 = +[CPLResource countOfResourceTypes];
    objc_super v14 = (char *)&v21[-1] - ((8 * v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v14, 8 * v13);
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2020000000;
    uint64_t v28 = 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __72__CPLResource_normalizedResourcesFromResources_resourcePerResourceType___block_invoke;
    v21[3] = &unk_1E60A8AA0;
    id v15 = v6;
    v23 = &v25;
    v24 = v14;
    id v22 = v15;
    +[CPLResource enumerateResourceTypesWithBlock:v21];
    if (v26[3])
    {
      id v16 = v15;
      id *v20 = v16;
      id v17 = objc_alloc(MEMORY[0x1E4F1C978]);
      v18 = (void *)[v17 initWithObjects:v14 count:v26[3]];
    }
    else
    {
      id *v20 = (id)MEMORY[0x1E4F1CC08];
      v18 = (void *)MEMORY[0x1E4F1CBF0];
    }

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    *a4 = (id)MEMORY[0x1E4F1CC08];
    v18 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v18;
}

void __72__CPLResource_normalizedResourcesFromResources_resourcePerResourceType___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v3 = (void *)a1[4];
  id v4 = [NSNumber numberWithUnsignedInteger:a2];
  id v5 = [v3 objectForKey:v4];

  if (v5) {
    *(void *)(a1[6] + 8 * (*(void *)(*(void *)(a1[5] + 8) + 24))++) = v5;
  }
}

+ (BOOL)cplShouldIgnorePropertyForEquality:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"itemIdentifier"] & 1) != 0
    || ([v4 isEqualToString:@"canGenerateDerivative"] & 1) != 0)
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CPLResource;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_cplShouldIgnorePropertyForEquality_, v4);
  }

  return v5;
}

@end