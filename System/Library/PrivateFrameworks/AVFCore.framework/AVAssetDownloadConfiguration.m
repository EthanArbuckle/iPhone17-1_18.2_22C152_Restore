@interface AVAssetDownloadConfiguration
+ (AVAssetDownloadConfiguration)downloadConfigurationWithAsset:(AVURLAsset *)asset title:(NSString *)title;
+ (BOOL)supportsSecureCoding;
- ($1CE2C3FC342086196D07C2B4E8C70800)timeRange;
- (AVAssetDownloadConfiguration)initWithAsset:(id)a3 title:(id)a4;
- (AVAssetDownloadConfiguration)initWithCoder:(id)a3;
- (AVAssetDownloadContentConfiguration)primaryContentConfiguration;
- (AVURLAsset)_asset;
- (BOOL)downloadsInterstitialAssets;
- (BOOL)optimizesAuxiliaryContentConfigurations;
- (FigStreamingAssetDownloadConfig)_copyFigDownloadConfig;
- (NSArray)auxiliaryContentConfigurations;
- (NSData)artworkData;
- (NSString)_assetTitle;
- (NSURL)_destinationURL;
- (void)_setDestinationURL:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setArtworkData:(NSData *)artworkData;
- (void)setAuxiliaryContentConfigurations:(NSArray *)auxiliaryContentConfigurations;
- (void)setDownloadsInterstitialAssets:(BOOL)a3;
- (void)setOptimizesAuxiliaryContentConfigurations:(BOOL)optimizesAuxiliaryContentConfigurations;
- (void)setTimeRange:(id *)a3;
@end

@implementation AVAssetDownloadConfiguration

- (AVAssetDownloadConfiguration)initWithAsset:(id)a3 title:(id)a4
{
  v24.receiver = self;
  v24.super_class = (Class)AVAssetDownloadConfiguration;
  v7 = [(AVAssetDownloadConfiguration *)&v24 init];
  v8 = v7;
  if (v7)
  {
    if (a3)
    {
      if (a4)
      {
        v7->_asset = (AVURLAsset *)a3;
        v8->_title = (NSString *)[a4 copy];
        v8->_primaryContentConfiguration = (AVAssetDownloadContentConfiguration *)objc_alloc_init(AVAssetDownloadDefaultPrimaryContentConfiguration);
        *(_WORD *)&v8->_optimizesAuxiliaryContentConfigurations = 1;
        uint64_t v9 = MEMORY[0x1E4F1FA20];
        long long v10 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
        *(_OWORD *)&v8->_timeRange.start.value = *MEMORY[0x1E4F1FA20];
        *(_OWORD *)&v8->_timeRange.start.epoch = v10;
        *(_OWORD *)&v8->_timeRange.duration.timescale = *(_OWORD *)(v9 + 32);
        v11 = objc_alloc_init(AVAssetDownloadDefaultAuxiliaryContentConfiguration);
        v8->_auxiliaryContentConfigurations = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v11, 0);

        return v8;
      }
      v22 = v7;
      v19 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v20 = *MEMORY[0x1E4F1C3C8];
      v21 = "title != nil";
    }
    else
    {
      v13 = v7;
      v19 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v20 = *MEMORY[0x1E4F1C3C8];
      v21 = "asset != nil";
    }
    v23 = (void *)[v19 exceptionWithName:v20, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v8, a2, @"invalid parameter not satisfying: %s", v14, v15, v16, v17, v18, (uint64_t)v21), 0 reason userInfo];
    objc_exception_throw(v23);
  }
  return v8;
}

+ (AVAssetDownloadConfiguration)downloadConfigurationWithAsset:(AVURLAsset *)asset title:(NSString *)title
{
  v4 = (void *)[objc_alloc((Class)a1) initWithAsset:asset title:title];
  return (AVAssetDownloadConfiguration *)v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVAssetDownloadConfiguration;
  [(AVAssetDownloadConfiguration *)&v3 dealloc];
}

- (NSData)artworkData
{
  return self->_artworkData;
}

- (void)setArtworkData:(NSData *)artworkData
{
}

- (AVAssetDownloadContentConfiguration)primaryContentConfiguration
{
  return self->_primaryContentConfiguration;
}

- (NSArray)auxiliaryContentConfigurations
{
  return self->_auxiliaryContentConfigurations;
}

- (void)setAuxiliaryContentConfigurations:(NSArray *)auxiliaryContentConfigurations
{
}

- (BOOL)optimizesAuxiliaryContentConfigurations
{
  return self->_optimizesAuxiliaryContentConfigurations;
}

- (void)setOptimizesAuxiliaryContentConfigurations:(BOOL)optimizesAuxiliaryContentConfigurations
{
  self->_optimizesAuxiliaryContentConfigurations = optimizesAuxiliaryContentConfigurations;
}

- (BOOL)downloadsInterstitialAssets
{
  return self->_downloadsInterstitialAssets;
}

- (void)setDownloadsInterstitialAssets:(BOOL)a3
{
  self->_downloadsInterstitialAssets = a3;
}

- (NSString)_assetTitle
{
  v2 = self->_title;
  return v2;
}

- ($1CE2C3FC342086196D07C2B4E8C70800)timeRange
{
  long long v3 = *(_OWORD *)&self[1].var0.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var0.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var1;
  return self;
}

- (void)setTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_timeRange.start.epoch = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_timeRange.duration.timescale = v4;
  *(_OWORD *)&self->_timeRange.start.value = v3;
}

- (NSURL)_destinationURL
{
  v2 = self->_destinationURL;
  return v2;
}

- (void)_setDestinationURL:(id)a3
{
  long long v4 = (NSURL *)[a3 copy];

  self->_destinationURL = v4;
}

- (AVURLAsset)_asset
{
  v2 = self->_asset;
  return v2;
}

- (FigStreamingAssetDownloadConfig)_copyFigDownloadConfig
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  if (!FigStreamingAssetDownloadConfigCreate())
  {
    FigStreamingAssetDownloadConfigSetAssetNameAndImage();
    long long v3 = *(_OWORD *)&self->_timeRange.start.epoch;
    long long v14 = *(_OWORD *)&self->_timeRange.start.value;
    long long v15 = v3;
    long long v16 = *(_OWORD *)&self->_timeRange.duration.timescale;
    FigStreamingAssetDownloadConfigSetTimeRange();
    [(AVAssetDownloadContentConfiguration *)self->_primaryContentConfiguration _serializeIntoDownloadConfig:v17 asset:self->_asset];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    auxiliaryContentConfigurations = self->_auxiliaryContentConfigurations;
    uint64_t v5 = [(NSArray *)auxiliaryContentConfigurations countByEnumeratingWithState:&v10 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(auxiliaryContentConfigurations);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * i) _serializeIntoDownloadConfig:v17 asset:self->_asset];
        }
        uint64_t v6 = [(NSArray *)auxiliaryContentConfigurations countByEnumeratingWithState:&v10 objects:v18 count:16];
      }
      while (v6);
    }
    FigStreamingAssetDownloadConfigSetOptimizesAuxiliaryContentConfigurations();
    FigStreamingAssetDownloadConfigSetDownloadsInterstitialAssets();
  }
  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    uint64_t v17 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"supports only keyed archivers", v6, v7, v8, v9, v10, v18.start.value), 0 reason userInfo];
    objc_exception_throw(v17);
  }
  long long v11 = [(AVURLAsset *)self->_asset URL];
  id v12 = [(AVURLAsset *)self->_asset _serializableCreationOptions];
  [a3 encodeObject:v11 forKey:@"assetURL"];
  [a3 encodeObject:v12 forKey:@"assetCreationOptions"];
  objc_msgSend(a3, "encodeInt64:forKey:", -[AVURLAsset downloadToken](self->_asset, "downloadToken"), @"downloadToken");
  [a3 encodeObject:self->_title forKey:@"title"];
  [a3 encodeObject:self->_artworkData forKey:@"artworkData"];
  [a3 encodeObject:self->_primaryContentConfiguration forKey:@"primaryContentConfig"];
  [a3 encodeObject:self->_auxiliaryContentConfigurations forKey:@"auxiliaryContentConfigs"];
  [a3 encodeObject:self->_destinationURL forKey:@"destinationURL"];
  [a3 encodeBool:self->_optimizesAuxiliaryContentConfigurations forKey:@"optimizesAuxiliaryContentConfigs"];
  [a3 encodeBool:self->_downloadsInterstitialAssets forKey:@"downloadInterstitialAssets"];
  if ((self->_timeRange.start.flags & 1) != 0
    && (self->_timeRange.duration.flags & 1) != 0
    && !self->_timeRange.duration.epoch
    && (self->_timeRange.duration.value & 0x8000000000000000) == 0)
  {
    CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    long long v14 = *(_OWORD *)&self->_timeRange.start.epoch;
    *(_OWORD *)&v18.start.value = *(_OWORD *)&self->_timeRange.start.value;
    *(_OWORD *)&v18.start.epoch = v14;
    *(_OWORD *)&v18.duration.timescale = *(_OWORD *)&self->_timeRange.duration.timescale;
    CFDictionaryRef v15 = CMTimeRangeCopyAsDictionary(&v18, v13);
    if (v15)
    {
      CFDictionaryRef v16 = v15;
      [a3 encodeObject:v15 forKey:@"timeRange"];
      CFRelease(v16);
    }
  }
}

- (AVAssetDownloadConfiguration)initWithCoder:(id)a3
{
  v36[1] = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    v25 = self;
    v31 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"supports only keyed archivers", v26, v27, v28, v29, v30, v32), 0 reason userInfo];
    objc_exception_throw(v31);
  }
  v34.receiver = self;
  v34.super_class = (Class)AVAssetDownloadConfiguration;
  uint64_t v6 = [(AVAssetDownloadConfiguration *)&v34 init];
  if (v6)
  {
    uint64_t v7 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"assetURL"];
    uint64_t v8 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"assetCreationOptions"];
    uint64_t v9 = [a3 decodeInt64ForKey:@"downloadToken"];
    uint64_t v10 = [AVURLAsset alloc];
    v35 = @"AVURLAssetDownloadTokenKey";
    v36[0] = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v9];
    long long v11 = -[AVURLAsset initWithURL:options:](v10, "initWithURL:options:", 0, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1]);
    *((void *)v6 + 1) = v11;
    if (!v11 && v7)
    {
      long long v11 = +[AVURLAsset URLAssetWithURL:options:](AVURLAsset, "URLAssetWithURL:options:", v7, [v8 creationOptions]);
      *((void *)v6 + 1) = v11;
    }
    if (v11)
    {
      *((void *)v6 + 2) = (id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
      *((void *)v6 + 3) = (id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"artworkData"];
      *((void *)v6 + 4) = (id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"primaryContentConfig"];
      id v12 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v13 = objc_opt_class();
      *((void *)v6 + 5) = (id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0), @"auxiliaryContentConfigs");
      *((void *)v6 + 12) = (id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"destinationURL"];
      v6[106] = [a3 decodeBoolForKey:@"optimizesAuxiliaryContentConfigs"];
      v6[107] = [a3 decodeBoolForKey:@"downloadInterstitialAssets"];
      long long v14 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = objc_opt_class();
      CFDictionaryRef v17 = (const __CFDictionary *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0), @"timeRange");
      CMTimeRange v18 = v6 + 48;
      if (v17)
      {
        CMTimeRangeMakeFromDictionary(&v33, v17);
        long long v19 = *(_OWORD *)&v33.start.epoch;
        *CMTimeRange v18 = *(_OWORD *)&v33.start.value;
        *((_OWORD *)v6 + 4) = v19;
        long long v20 = *(_OWORD *)&v33.duration.timescale;
      }
      else
      {
        uint64_t v22 = MEMORY[0x1E4F1FA20];
        long long v23 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
        *CMTimeRange v18 = *MEMORY[0x1E4F1FA20];
        *((_OWORD *)v6 + 4) = v23;
        long long v20 = *(_OWORD *)(v22 + 32);
      }
      *((_OWORD *)v6 + 5) = v20;
    }
    else
    {
      v21 = v6;
      return 0;
    }
  }
  return (AVAssetDownloadConfiguration *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end