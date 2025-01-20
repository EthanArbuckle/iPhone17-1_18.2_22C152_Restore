@interface PHImageRequestBehaviorSpec
+ (BOOL)_shouldDecodeAsHDRBasedOnChoosingPolicy:(int64_t)a3 optionsPreferHDR:(BOOL)a4 asset:(id)a5;
+ (BOOL)_shouldLoadHDRGainMapBasedOnChoosingPolicy:(int64_t)a3 options:(id)a4 asset:(id)a5;
+ (id)contentEditingInputImageBehaviorSpecForBaseVersion:(int64_t)a3 isNetworkAccessAllowed:(BOOL)a4 downloadIntent:(int64_t)a5 shouldUseRAWAsUnadjustedBase:(BOOL)a6 asset:(id)a7;
+ (id)imageRequestBestBehaviorSpecWithPreviousBehaviorSpec:(id)a3 options:(id)a4 asset:(id)a5;
+ (id)imageRequestInitialBehaviorSpecWithImageRequestOptions:(id)a3 asset:(id)a4;
+ (id)imageRequestIntermediateBehaviorSpecWithPreviousBehaviorSpec:(id)a3 options:(id)a4 asset:(id)a5;
+ (id)livePhotoRequestBestBehaviorSpecWithPreviousBehaviorSpec:(id)a3 options:(id)a4 asset:(id)a5;
+ (id)livePhotoRequestInitialBehaviorSpecWithLivePhotoRequestOptions:(id)a3 asset:(id)a4;
+ (unint64_t)loadingOptionsFromLoadingMode:(int64_t)a3;
- (BOOL)allowPlaceholder;
- (BOOL)cannotReturnSmallerImage;
- (BOOL)decodeAsHDR;
- (BOOL)includeHDRGainMap;
- (BOOL)includeHDRGainMapInIntermediateImage;
- (BOOL)isExplicitUserAction;
- (BOOL)isNetworkAccessAllowed;
- (BOOL)isSynchronous;
- (BOOL)onlyUseFetchedAssetPropertiesDuringChoosing;
- (BOOL)shouldLoadData;
- (BOOL)shouldLoadDataOrURL;
- (BOOL)shouldLoadImage;
- (BOOL)shouldLoadURL;
- (BOOL)useLimitedLibraryMode;
- (BOOL)useLowMemoryMode;
- (double)minimumTableThumbnailLongSide;
- (double)targetHDRHeadroom;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)shortDescription;
- (int64_t)choosingPolicy;
- (int64_t)downloadIntent;
- (int64_t)downloadPriority;
- (int64_t)resizeMode;
- (int64_t)version;
- (unint64_t)loadingOptions;
- (void)setAllowPlaceholder:(BOOL)a3;
- (void)setCannotReturnSmallerImage:(BOOL)a3;
- (void)setChoosingPolicy:(int64_t)a3;
- (void)setDecodeAsHDR:(BOOL)a3;
- (void)setDownloadIntent:(int64_t)a3;
- (void)setDownloadPriority:(int64_t)a3;
- (void)setIncludeHDRGainMap:(BOOL)a3;
- (void)setIncludeHDRGainMapInIntermediateImage:(BOOL)a3;
- (void)setLoadingOptions:(unint64_t)a3;
- (void)setMinimumTableThumbnailLongSide:(double)a3;
- (void)setNetworkAccessAllowed:(BOOL)a3;
- (void)setOnlyUseFetchedAssetPropertiesDuringChoosing:(BOOL)a3;
- (void)setResizeMode:(int64_t)a3;
- (void)setSynchronous:(BOOL)a3;
- (void)setTargetHDRHeadroom:(double)a3;
- (void)setUseLimitedLibraryMode:(BOOL)a3;
- (void)setUseLowMemoryMode:(BOOL)a3;
- (void)setVersion:(int64_t)a3;
@end

@implementation PHImageRequestBehaviorSpec

- (unint64_t)loadingOptions
{
  return self->_loadingOptions;
}

- (BOOL)useLowMemoryMode
{
  return self->_useLowMemoryMode;
}

- (BOOL)useLimitedLibraryMode
{
  return self->_useLimitedLibraryMode;
}

- (void)setChoosingPolicy:(int64_t)a3
{
  self->_choosingPolicy = a3;
}

- (int64_t)choosingPolicy
{
  return self->_choosingPolicy;
}

- (BOOL)shouldLoadURL
{
  return (LOBYTE(self->_loadingOptions) >> 2) & 1;
}

- (BOOL)shouldLoadImage
{
  return self->_loadingOptions & 1;
}

- (BOOL)shouldLoadData
{
  return (LOBYTE(self->_loadingOptions) >> 1) & 1;
}

- (int64_t)resizeMode
{
  return self->_resizeMode;
}

- (int64_t)downloadIntent
{
  return self->_downloadIntent;
}

- (int64_t)version
{
  return self->_version;
}

- (BOOL)onlyUseFetchedAssetPropertiesDuringChoosing
{
  return self->_onlyUseFetchedAssetPropertiesDuringChoosing;
}

- (double)minimumTableThumbnailLongSide
{
  return self->_minimumTableThumbnailLongSide;
}

+ (id)imageRequestBestBehaviorSpecWithPreviousBehaviorSpec:(id)a3 options:(id)a4 asset:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = (void *)[a3 copy];
  objc_msgSend(v10, "setSynchronous:", objc_msgSend(v9, "isSynchronous"));
  [v10 setChoosingPolicy:3];
  objc_msgSend(v10, "setIncludeHDRGainMap:", objc_msgSend(a1, "_shouldLoadHDRGainMapBasedOnChoosingPolicy:options:asset:", 3, v9, v8));
  uint64_t v11 = objc_msgSend(a1, "_shouldDecodeAsHDRBasedOnChoosingPolicy:optionsPreferHDR:asset:", 3, objc_msgSend(v9, "preferHDR"), v8);

  [v10 setDecodeAsHDR:v11];
  [v9 targetHDRHeadroom];
  objc_msgSend(v10, "setTargetHDRHeadroom:");
  uint64_t v12 = [v9 isNetworkAccessAllowed];

  [v10 setNetworkAccessAllowed:v12];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init(PHImageRequestBehaviorSpec);
  *((void *)result + 3) = self->_choosingPolicy;
  *((void *)result + 4) = self->_loadingOptions;
  *((void *)result + 5) = self->_version;
  *((unsigned char *)result + 8) = self->_synchronous;
  *((unsigned char *)result + 9) = self->_networkAccessAllowed;
  *((unsigned char *)result + 10) = self->_allowPlaceholder;
  *((void *)result + 6) = self->_resizeMode;
  *((unsigned char *)result + 11) = self->_onlyUseFetchedAssetPropertiesDuringChoosing;
  *((unsigned char *)result + 12) = self->_includeHDRGainMap;
  *((unsigned char *)result + 13) = self->_includeHDRGainMapInIntermediateImage;
  *((unsigned char *)result + 14) = self->_decodeAsHDR;
  *((void *)result + 7) = *(void *)&self->_targetHDRHeadroom;
  *((void *)result + 8) = *(void *)&self->_minimumTableThumbnailLongSide;
  *((unsigned char *)result + 15) = self->_useLowMemoryMode;
  *((unsigned char *)result + 16) = self->_useLimitedLibraryMode;
  *((void *)result + 9) = self->_downloadIntent;
  *((void *)result + 10) = self->_downloadPriority;
  *((unsigned char *)result + 17) = self->_cannotReturnSmallerImage;
  return result;
}

+ (id)imageRequestInitialBehaviorSpecWithImageRequestOptions:(id)a3 asset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 deliveryMode];
  if (v8)
  {
    uint64_t v9 = 3;
    if (v8 == 2) {
      uint64_t v9 = 0;
    }
    BOOL v10 = v8 == 3 || v8 != 2;
    if (v8 == 3) {
      uint64_t v11 = 4;
    }
    else {
      uint64_t v11 = v9;
    }
  }
  else if ([v6 isSynchronous])
  {
    BOOL v10 = 1;
    uint64_t v11 = 3;
  }
  else
  {
    BOOL v10 = 0;
    if ([v6 opportunisticDegradedImagesToReturn] == 2) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = 1;
    }
  }
  unint64_t v12 = +[PHImageRequestBehaviorSpec loadingOptionsFromLoadingMode:](PHImageRequestBehaviorSpec, "loadingOptionsFromLoadingMode:", [v6 loadingMode]);
  v13 = objc_alloc_init(PHImageRequestBehaviorSpec);
  [(PHImageRequestBehaviorSpec *)v13 setChoosingPolicy:v11];
  [(PHImageRequestBehaviorSpec *)v13 setLoadingOptions:v12];
  -[PHImageRequestBehaviorSpec setAllowPlaceholder:](v13, "setAllowPlaceholder:", [v6 allowPlaceholder]);
  if (v10) {
    uint64_t v14 = [v6 isNetworkAccessAllowed];
  }
  else {
    uint64_t v14 = 0;
  }
  [(PHImageRequestBehaviorSpec *)v13 setNetworkAccessAllowed:v14];
  -[PHImageRequestBehaviorSpec setVersion:](v13, "setVersion:", [v6 version]);
  -[PHImageRequestBehaviorSpec setResizeMode:](v13, "setResizeMode:", [v6 resizeMode]);
  -[PHImageRequestBehaviorSpec setOnlyUseFetchedAssetPropertiesDuringChoosing:](v13, "setOnlyUseFetchedAssetPropertiesDuringChoosing:", [v6 onlyUseFetchedAssetPropertiesDuringChoosing]);
  -[PHImageRequestBehaviorSpec setIncludeHDRGainMap:](v13, "setIncludeHDRGainMap:", [a1 _shouldLoadHDRGainMapBasedOnChoosingPolicy:v11 options:v6 asset:v7]);
  uint64_t v15 = objc_msgSend(a1, "_shouldDecodeAsHDRBasedOnChoosingPolicy:optionsPreferHDR:asset:", v11, objc_msgSend(v6, "preferHDR"), v7);

  [(PHImageRequestBehaviorSpec *)v13 setDecodeAsHDR:v15];
  [v6 targetHDRHeadroom];
  -[PHImageRequestBehaviorSpec setTargetHDRHeadroom:](v13, "setTargetHDRHeadroom:");
  -[PHImageRequestBehaviorSpec setUseLowMemoryMode:](v13, "setUseLowMemoryMode:", [v6 useLowMemoryMode]);
  -[PHImageRequestBehaviorSpec setUseLimitedLibraryMode:](v13, "setUseLimitedLibraryMode:", [v6 useLimitedLibraryMode]);
  uint64_t v16 = [v6 loadingMode];
  double v17 = 100.0;
  if ((v16 & 0x400000) == 0) {
    double v17 = 0.0;
  }
  [(PHImageRequestBehaviorSpec *)v13 setMinimumTableThumbnailLongSide:v17];
  if ([v6 deliveryMode])
  {
    uint64_t v18 = [v6 isSynchronous];
  }
  else if ([v6 opportunisticDegradedImagesToReturn])
  {
    uint64_t v18 = [v6 useAsyncForFastOpportunisticResult] ^ 1;
  }
  else
  {
    uint64_t v18 = 0;
  }
  [(PHImageRequestBehaviorSpec *)v13 setSynchronous:v18];
  -[PHImageRequestBehaviorSpec setDownloadIntent:](v13, "setDownloadIntent:", [v6 downloadIntent]);
  -[PHImageRequestBehaviorSpec setDownloadPriority:](v13, "setDownloadPriority:", [v6 downloadPriority]);
  -[PHImageRequestBehaviorSpec setCannotReturnSmallerImage:](v13, "setCannotReturnSmallerImage:", [v6 cannotReturnSmallerImage]);

  return v13;
}

- (void)setTargetHDRHeadroom:(double)a3
{
  self->_targetHDRHeadroom = a3;
}

- (void)setSynchronous:(BOOL)a3
{
  self->_synchronous = a3;
}

- (void)setNetworkAccessAllowed:(BOOL)a3
{
  self->_networkAccessAllowed = a3;
}

- (void)setIncludeHDRGainMap:(BOOL)a3
{
  self->_includeHDRGainMap = a3;
}

- (void)setDecodeAsHDR:(BOOL)a3
{
  self->_decodeAsHDR = a3;
}

+ (BOOL)_shouldLoadHDRGainMapBasedOnChoosingPolicy:(int64_t)a3 options:(id)a4 asset:(id)a5
{
  id v7 = a4;
  if (([a5 mediaSubtypes] & 0x200) == 0) {
    goto LABEL_8;
  }
  if ((unint64_t)(a3 - 3) >= 2)
  {
    if (a3 == 2 && [v7 includeHDRGainMap])
    {
      char v8 = [v7 includeHDRGainMapInIntermediateImage];
      goto LABEL_7;
    }
LABEL_8:
    BOOL v9 = 0;
    goto LABEL_9;
  }
  char v8 = [v7 includeHDRGainMap];
LABEL_7:
  BOOL v9 = v8;
LABEL_9:

  return v9;
}

+ (BOOL)_shouldDecodeAsHDRBasedOnChoosingPolicy:(int64_t)a3 optionsPreferHDR:(BOOL)a4 asset:(id)a5
{
  return ([a5 mediaSubtypes] & 0x800200) != 0 && (unint64_t)(a3 - 2) < 3 && a4;
}

- (BOOL)isSynchronous
{
  return self->_synchronous;
}

- (void)setAllowPlaceholder:(BOOL)a3
{
  self->_allowPlaceholder = a3;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (void)setUseLowMemoryMode:(BOOL)a3
{
  self->_useLowMemoryMode = a3;
}

- (void)setUseLimitedLibraryMode:(BOOL)a3
{
  self->_useLimitedLibraryMode = a3;
}

- (void)setResizeMode:(int64_t)a3
{
  self->_resizeMode = a3;
}

- (void)setOnlyUseFetchedAssetPropertiesDuringChoosing:(BOOL)a3
{
  self->_onlyUseFetchedAssetPropertiesDuringChoosing = a3;
}

- (void)setMinimumTableThumbnailLongSide:(double)a3
{
  self->_minimumTableThumbnailLongSide = a3;
}

- (void)setLoadingOptions:(unint64_t)a3
{
  self->_loadingOptions = a3;
}

- (void)setDownloadPriority:(int64_t)a3
{
  self->_downloadPriority = a3;
}

- (void)setDownloadIntent:(int64_t)a3
{
  self->_downloadIntent = a3;
}

- (void)setCannotReturnSmallerImage:(BOOL)a3
{
  self->_cannotReturnSmallerImage = a3;
}

- (BOOL)decodeAsHDR
{
  return self->_decodeAsHDR;
}

- (double)targetHDRHeadroom
{
  return self->_targetHDRHeadroom;
}

- (BOOL)includeHDRGainMap
{
  return self->_includeHDRGainMap;
}

+ (unint64_t)loadingOptionsFromLoadingMode:(int64_t)a3
{
  BOOL v4 = (a3 & 0x7C0000) != 0 || a3 == 0;
  return ((unint64_t)a3 >> 14) & 4 | (2 * (a3 & 1)) | ((unint64_t)a3 >> 15) & 0xF8 | v4;
}

+ (id)imageRequestIntermediateBehaviorSpecWithPreviousBehaviorSpec:(id)a3 options:(id)a4 asset:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  BOOL v10 = (void *)[a3 copy];
  [v10 setSynchronous:0];
  [v10 setNetworkAccessAllowed:0];
  [v10 setChoosingPolicy:2];
  objc_msgSend(v10, "setIncludeHDRGainMap:", objc_msgSend(a1, "_shouldLoadHDRGainMapBasedOnChoosingPolicy:options:asset:", 2, v9, v8));
  uint64_t v11 = objc_msgSend(a1, "_shouldDecodeAsHDRBasedOnChoosingPolicy:optionsPreferHDR:asset:", 2, objc_msgSend(v9, "preferHDR"), v8);

  [v10 setDecodeAsHDR:v11];
  [v9 targetHDRHeadroom];
  double v13 = v12;

  [v10 setTargetHDRHeadroom:v13];
  [v10 setAllowPlaceholder:0];

  return v10;
}

- (BOOL)shouldLoadDataOrURL
{
  return (self->_loadingOptions & 6) != 0;
}

- (BOOL)allowPlaceholder
{
  return self->_allowPlaceholder;
}

- (BOOL)cannotReturnSmallerImage
{
  return self->_cannotReturnSmallerImage;
}

- (int64_t)downloadPriority
{
  return self->_downloadPriority;
}

- (void)setIncludeHDRGainMapInIntermediateImage:(BOOL)a3
{
  self->_includeHDRGainMapInIntermediateImage = a3;
}

- (BOOL)includeHDRGainMapInIntermediateImage
{
  return self->_includeHDRGainMapInIntermediateImage;
}

- (BOOL)isNetworkAccessAllowed
{
  return self->_networkAccessAllowed;
}

- (BOOL)isExplicitUserAction
{
  return (self->_downloadIntent < 0xDuLL) & (0x238u >> self->_downloadIntent);
}

- (id)description
{
  v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(PHImageRequestBehaviorSpec *)self shortDescription];
  id v7 = [v3 stringWithFormat:@"<%@ %p> %@", v5, self, v6];

  return v7;
}

- (id)shortDescription
{
  unint64_t choosingPolicy = self->_choosingPolicy;
  if (choosingPolicy > 4) {
    BOOL v4 = @"best";
  }
  else {
    BOOL v4 = off_1E5848458[choosingPolicy];
  }
  v5 = NSString;
  BOOL networkAccessAllowed = self->_networkAccessAllowed;
  BOOL synchronous = self->_synchronous;
  unint64_t loadingOptions = self->_loadingOptions;
  id v9 = [MEMORY[0x1E4F1CA48] array];
  BOOL v10 = v9;
  if (loadingOptions)
  {
    uint64_t v11 = @"img";
  }
  else if ((loadingOptions & 2) != 0)
  {
    uint64_t v11 = @"data";
  }
  else if ((loadingOptions & 4) != 0)
  {
    uint64_t v11 = @"url";
  }
  else if ((loadingOptions & 8) != 0)
  {
    uint64_t v11 = @"bgra";
  }
  else
  {
    if ((loadingOptions & 0x10) == 0) {
      goto LABEL_15;
    }
    uint64_t v11 = @"hipri";
  }
  [v9 addObject:v11];
LABEL_15:
  double v12 = [v10 componentsJoinedByString:@"|"];

  int64_t version = self->_version;
  uint64_t v14 = 0;
  switch(version)
  {
    case 0:
      uint64_t v14 = @"curr";
      break;
    case 1:
      uint64_t v14 = @"unadj";
      break;
    case 2:
      uint64_t v14 = @"orig";
      break;
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
      break;
    case 8:
      uint64_t v14 = @"penult";
      break;
    default:
      if (version == 16) {
        uint64_t v14 = @"adjustment";
      }
      else {
        uint64_t v14 = 0;
      }
      break;
  }
  unint64_t resizeMode = self->_resizeMode;
  if (resizeMode > 2) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = off_1E5848480[resizeMode];
  }
  if (synchronous) {
    double v17 = @"Y";
  }
  else {
    double v17 = @"N";
  }
  if (networkAccessAllowed) {
    uint64_t v18 = @"Y";
  }
  else {
    uint64_t v18 = @"N";
  }
  if (self->_allowPlaceholder) {
    v19 = @"Y";
  }
  else {
    v19 = @"N";
  }
  v20 = _PHDownloadIntentName(self->_downloadIntent);
  v21 = _PHDownloadPriorityName(self->_downloadPriority);
  v22 = [v5 stringWithFormat:@"net: %@, sync: %@, choose: %@, load: %@, ver: %@, resize: %@, allow-pl-hdr: %@, intent: %@, priority: %@", v18, v17, v4, v12, v14, v16, v19, v20, v21];

  return v22;
}

+ (id)livePhotoRequestBestBehaviorSpecWithPreviousBehaviorSpec:(id)a3 options:(id)a4 asset:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  BOOL v10 = (void *)[a3 copy];
  [v10 setSynchronous:0];
  [v10 setChoosingPolicy:3];
  uint64_t v11 = [v9 preferHDR];

  uint64_t v12 = [a1 _shouldDecodeAsHDRBasedOnChoosingPolicy:3 optionsPreferHDR:v11 asset:v8];
  [v10 setDecodeAsHDR:v12];

  return v10;
}

+ (id)livePhotoRequestInitialBehaviorSpecWithLivePhotoRequestOptions:(id)a3 asset:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 deliveryMode];
  id v9 = objc_alloc_init(PHImageRequestBehaviorSpec);
  [(PHImageRequestBehaviorSpec *)v9 setLoadingOptions:1];
  BOOL v10 = v8 == 0;
  uint64_t v11 = 3;
  if (!v8) {
    uint64_t v11 = 1;
  }
  if (v8 == 2) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = v11;
  }
  [(PHImageRequestBehaviorSpec *)v9 setChoosingPolicy:v12];
  -[PHImageRequestBehaviorSpec setNetworkAccessAllowed:](v9, "setNetworkAccessAllowed:", [v7 isNetworkAccessAllowed]);
  -[PHImageRequestBehaviorSpec setVersion:](v9, "setVersion:", [v7 version]);
  -[PHImageRequestBehaviorSpec setDownloadIntent:](v9, "setDownloadIntent:", [v7 downloadIntent]);
  -[PHImageRequestBehaviorSpec setDownloadPriority:](v9, "setDownloadPriority:", [v7 downloadPriority]);
  uint64_t v13 = [v7 preferHDR];

  uint64_t v14 = [a1 _shouldDecodeAsHDRBasedOnChoosingPolicy:v12 optionsPreferHDR:v13 asset:v6];
  [(PHImageRequestBehaviorSpec *)v9 setDecodeAsHDR:v14];
  [(PHImageRequestBehaviorSpec *)v9 setResizeMode:1];
  [(PHImageRequestBehaviorSpec *)v9 setSynchronous:v10];

  return v9;
}

+ (id)contentEditingInputImageBehaviorSpecForBaseVersion:(int64_t)a3 isNetworkAccessAllowed:(BOOL)a4 downloadIntent:(int64_t)a5 shouldUseRAWAsUnadjustedBase:(BOOL)a6 asset:(id)a7
{
  BOOL v9 = a4;
  id v11 = a7;
  uint64_t v12 = objc_alloc_init(PHImageRequestBehaviorSpec);
  [(PHImageRequestBehaviorSpec *)v12 setChoosingPolicy:3];
  [(PHImageRequestBehaviorSpec *)v12 setLoadingOptions:4];
  [(PHImageRequestBehaviorSpec *)v12 setNetworkAccessAllowed:v9];
  [(PHImageRequestBehaviorSpec *)v12 setDownloadIntent:a5];
  unint64_t v13 = [v11 mediaSubtypes];

  [(PHImageRequestBehaviorSpec *)v12 setIncludeHDRGainMap:(v13 >> 9) & 1];
  if (a3 || !a6) {
    int64_t v14 = +[PHAdjustmentData imageRequestVersionFromAdjustmentBaseVersion:a3];
  }
  else {
    int64_t v14 = 2;
  }
  [(PHImageRequestBehaviorSpec *)v12 setVersion:v14];

  return v12;
}

@end