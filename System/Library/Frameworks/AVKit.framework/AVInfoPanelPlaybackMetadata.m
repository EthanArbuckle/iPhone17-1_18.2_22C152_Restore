@interface AVInfoPanelPlaybackMetadata
+ (BOOL)_closedCaptioningStatusForPlayerController:(id)a3;
+ (double)_durationForPlayerController:(id)a3;
+ (id)_metadataItemsForPlayerItem:(id)a3 withAsset:(id)a4;
+ (id)playbackMetadataForPlayerController:(id)a3 fulfillment:(id)a4;
+ (void)_loadAssetValues:(id)a3 into:(id)a4 completion:(id)a5;
- (AVInfoPanelPlaybackMetadata)initWithPlaybackMetadata:(id)a3;
- (AVInfoPanelPlaybackMetadata)initWithPlayerController:(id)a3;
- (AVMetadataItem)episodeNumberItem;
- (AVMetadataItem)seasonNumberItem;
- (AVMetadataItem)secondaryTitleItem;
- (AVMetadataItem)titleItem;
- (BOOL)isClosedCaptioned;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLivePlayback;
- (NSArray)metadataItems;
- (NSDate)creationDate;
- (NSDateFormatter)_yearDateFormatter;
- (NSString)episodeNumberString;
- (NSString)releaseDateString;
- (NSString)seasonEpisodeString;
- (NSString)seasonNumberString;
- (NSString)secondaryTitleString;
- (NSString)titleString;
- (double)duration;
- (id)_releaseDateStringItem;
- (id)copyWithZone:(_NSZone *)a3;
- (id)metadataItemForIdentifiers:(id)a3;
- (unint64_t)hash;
@end

@implementation AVInfoPanelPlaybackMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_metadataItems, 0);

  objc_storeStrong((id *)&self->_yearDateFormatter, 0);
}

- (BOOL)isLivePlayback
{
  return self->_livePlayback;
}

- (BOOL)isClosedCaptioned
{
  return self->_closedCaptioned;
}

- (double)duration
{
  return self->_duration;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSArray)metadataItems
{
  return self->_metadataItems;
}

- (NSDateFormatter)_yearDateFormatter
{
  yearDateFormatter = self->_yearDateFormatter;
  if (!yearDateFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    v5 = self->_yearDateFormatter;
    self->_yearDateFormatter = v4;

    [(NSDateFormatter *)self->_yearDateFormatter setDateFormat:@"yyyy"];
    yearDateFormatter = self->_yearDateFormatter;
  }

  return yearDateFormatter;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (AVInfoPanelPlaybackMetadata *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(AVInfoPanelPlaybackMetadata *)self metadataItems];
      v6 = [(AVInfoPanelPlaybackMetadata *)v4 metadataItems];
      if (v5 == v6)
      {
        v8 = [(AVInfoPanelPlaybackMetadata *)self creationDate];
        v9 = [(AVInfoPanelPlaybackMetadata *)v4 creationDate];
        BOOL v7 = v8 == v9;
      }
      else
      {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSArray *)self->_metadataItems hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v4 initWithPlaybackMetadata:self];
}

- (AVInfoPanelPlaybackMetadata)initWithPlaybackMetadata:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AVInfoPanelPlaybackMetadata;
  v5 = [(AVInfoPanelPlaybackMetadata *)&v14 init];
  if (v5)
  {
    v6 = [v4 metadataItems];
    uint64_t v7 = [v6 copy];
    metadataItems = v5->_metadataItems;
    v5->_metadataItems = (NSArray *)v7;

    [v4 duration];
    v5->_duration = v9;
    v5->_closedCaptioned = [v4 isClosedCaptioned];
    v5->_livePlayback = [v4 isLivePlayback];
    v10 = [v4 creationDate];
    uint64_t v11 = [v10 copy];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v11;
  }
  return v5;
}

- (AVInfoPanelPlaybackMetadata)initWithPlayerController:(id)a3
{
  id v4 = a3;
  v5 = [v4 player];
  v6 = [v5 currentItem];

  uint64_t v7 = [v6 asset];
  v15.receiver = self;
  v15.super_class = (Class)AVInfoPanelPlaybackMetadata;
  v8 = [(AVInfoPanelPlaybackMetadata *)&v15 init];
  if (v8) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    uint64_t v10 = [(id)objc_opt_class() _metadataItemsForPlayerItem:v6 withAsset:v7];
    metadataItems = v8->_metadataItems;
    v8->_metadataItems = (NSArray *)v10;

    creationDate = v8->_creationDate;
    v8->_creationDate = 0;

    [(id)objc_opt_class() _durationForPlayerController:v4];
    v8->_duration = v13;
    v8->_closedCaptioned = [(id)objc_opt_class() _closedCaptioningStatusForPlayerController:v4];
    v8->_livePlayback = [v4 hasLiveStreamingContent];
  }

  return v8;
}

+ (BOOL)_closedCaptioningStatusForPlayerController:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [a3 legibleMediaSelectionOptions];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    uint64_t v7 = *MEMORY[0x1E4F15BC8];
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "mediaType", (void)v13);
        char v10 = [v9 isEqualToString:v7];

        if (v10)
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

+ (double)_durationForPlayerController:(id)a3
{
  id v3 = a3;
  double v4 = 0.0;
  if (([v3 hasLiveStreamingContent] & 1) == 0)
  {
    [v3 contentDuration];
    double v4 = v5;
  }

  return v4;
}

+ (id)_metadataItemsForPlayerItem:(id)a3 withAsset:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = (void *)MEMORY[0x1E4F1CA20];
  id v7 = a3;
  v8 = [v6 preferredLanguages];
  BOOL v9 = [v8 arrayByAddingObject:@"und"];

  uint64_t v10 = [v5 statusOfValueForKey:@"metadata" error:0];
  BOOL v11 = (void *)MEMORY[0x1E4F1CBF0];
  if (v10 == 2)
  {
    v12 = (void *)MEMORY[0x1E4F16558];
    long long v13 = [v5 metadata];
    uint64_t v14 = [v12 metadataItemsFromArray:v13 filteredAndSortedAccordingToPreferredLanguages:v9];
    long long v15 = (void *)v14;
    if (v14) {
      long long v16 = (void *)v14;
    }
    else {
      long long v16 = v11;
    }
    id v17 = v16;
  }
  else
  {
    uint64_t v18 = _AVLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v27 = 136315138;
      v28 = "+[AVInfoPanelPlaybackMetadata _metadataItemsForPlayerItem:withAsset:]";
      _os_log_error_impl(&dword_1B05B7000, v18, OS_LOG_TYPE_ERROR, "%s: metadata has not yet been loaded: this is the caller's responsibility!", (uint8_t *)&v27, 0xCu);
    }

    id v17 = (id)MEMORY[0x1E4F1CBF0];
  }
  v19 = (void *)MEMORY[0x1E4F16558];
  v20 = [v7 externalMetadata];

  uint64_t v21 = [v19 metadataItemsFromArray:v20 filteredAndSortedAccordingToPreferredLanguages:v9];
  v22 = (void *)v21;
  if (v21) {
    v23 = (void *)v21;
  }
  else {
    v23 = v11;
  }
  id v24 = v23;

  v25 = [v24 arrayByAddingObjectsFromArray:v17];

  return v25;
}

+ (void)_loadAssetValues:(id)a3 into:(id)a4 completion:(id)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v18[0] = @"creationDate";
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__AVInfoPanelPlaybackMetadata__loadAssetValues_into_completion___block_invoke;
  v14[3] = &unk_1E5FC4670;
  id v15 = v7;
  id v16 = v8;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  [v13 loadValuesAsynchronouslyForKeys:v10 completionHandler:v14];
}

void __64__AVInfoPanelPlaybackMetadata__loadAssetValues_into_completion___block_invoke(id *a1)
{
  if ([a1[4] statusOfValueForKey:@"creationDate" error:0] == 2)
  {
    v2 = [MEMORY[0x1E4F1CAD0] setWithObject:@"creationDate"];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __64__AVInfoPanelPlaybackMetadata__loadAssetValues_into_completion___block_invoke_2;
    v5[3] = &unk_1E5FC45E0;
    id v6 = a1[4];
    id v7 = a1[5];
    id v3 = a1[6];
    id v8 = v2;
    id v9 = v3;
    id v4 = v2;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

void __64__AVInfoPanelPlaybackMetadata__loadAssetValues_into_completion___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) creationDate];
  id obj = [v2 dateValue];

  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    objc_storeStrong((id *)(v3 + 32), obj);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

+ (id)playbackMetadataForPlayerController:(id)a3 fulfillment:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void *))a4;
  id v8 = (void *)[objc_alloc((Class)a1) initWithPlayerController:v6];
  if (v7)
  {
    id v9 = [v6 player];
    uint64_t v10 = [v9 currentItem];
    id v11 = [v10 asset];

    if (v11)
    {
      id v12 = (void *)[v8 copy];
      [a1 _loadAssetValues:v11 into:v12 completion:v7];
    }
    else
    {
      id v12 = [MEMORY[0x1E4F1CAD0] set];
      v7[2](v7, v8, v12);
    }
  }

  return v8;
}

- (NSString)releaseDateString
{
  v22[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F16558] identifierForKey:*MEMORY[0x1E4F15CA0] keySpace:*MEMORY[0x1E4F15DE0]];
  v22[0] = v3;
  id v4 = [MEMORY[0x1E4F16558] identifierForKey:*MEMORY[0x1E4F15E68] keySpace:*MEMORY[0x1E4F15DF8]];
  v22[1] = v4;
  id v5 = [MEMORY[0x1E4F16558] identifierForKey:*MEMORY[0x1E4F15EE8] keySpace:*MEMORY[0x1E4F15E08]];
  v22[2] = v5;
  id v6 = [MEMORY[0x1E4F16558] identifierForKey:*MEMORY[0x1E4F15D28] keySpace:*MEMORY[0x1E4F15DE8]];
  v22[3] = v6;
  id v7 = [MEMORY[0x1E4F16558] identifierForKey:*MEMORY[0x1E4F15C30] keySpace:*MEMORY[0x1E4F15DF0]];
  v22[4] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:5];

  id v9 = [(AVInfoPanelPlaybackMetadata *)self metadataItemForIdentifiers:v8];
  uint64_t v10 = [v9 dateValue];
  id v11 = [v9 stringValue];
  id v12 = [(AVInfoPanelPlaybackMetadata *)self creationDate];
  id v13 = [(AVInfoPanelPlaybackMetadata *)self _releaseDateStringItem];
  uint64_t v14 = [v13 stringValue];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __59__AVInfoPanelPlaybackMetadata_ViewModel__releaseDateString__block_invoke;
  v21[3] = &unk_1E5FC4620;
  v21[4] = self;
  uint64_t v15 = MEMORY[0x1B3E963E0](v21);
  id v16 = (void *)v15;
  if (v14)
  {
    id v17 = v14;
LABEL_8:
    v19 = v17;
    goto LABEL_9;
  }
  if (v10)
  {
    uint64_t v18 = *(void (**)(void))(v15 + 16);
LABEL_5:
    v18();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (v11)
  {
    id v17 = v11;
    goto LABEL_8;
  }
  if (v12)
  {
    uint64_t v18 = *(void (**)(void))(v15 + 16);
    goto LABEL_5;
  }
  v19 = 0;
LABEL_9:

  return (NSString *)v19;
}

id __59__AVInfoPanelPlaybackMetadata_ViewModel__releaseDateString__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 _yearDateFormatter];
  id v5 = [v4 stringFromDate:v3];

  return v5;
}

- (NSString)seasonEpisodeString
{
  id v3 = [(AVInfoPanelPlaybackMetadata *)self seasonNumberString];
  uint64_t v4 = [(AVInfoPanelPlaybackMetadata *)self episodeNumberString];
  id v5 = (void *)v4;
  id v6 = 0;
  if (v3 && v4)
  {
    id v7 = NSString;
    id v8 = AVLocalizedString(@"Season %@, Episode %@");
    id v6 = objc_msgSend(v7, "stringWithFormat:", v8, v3, v5);
  }

  return (NSString *)v6;
}

- (NSString)episodeNumberString
{
  id v2 = [(AVInfoPanelPlaybackMetadata *)self episodeNumberItem];
  id v3 = [v2 value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [v2 stringValue];
  }
  else
  {
    id v6 = [v2 value];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [v2 value];
      id v5 = [v8 stringValue];
    }
    else
    {
      id v5 = 0;
    }
  }

  return (NSString *)v5;
}

- (NSString)seasonNumberString
{
  id v2 = [(AVInfoPanelPlaybackMetadata *)self seasonNumberItem];
  id v3 = [v2 value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [v2 stringValue];
  }
  else
  {
    id v6 = [v2 value];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [v2 value];
      id v5 = [v8 stringValue];
    }
    else
    {
      id v5 = 0;
    }
  }

  return (NSString *)v5;
}

- (NSString)secondaryTitleString
{
  id v3 = [(AVInfoPanelPlaybackMetadata *)self titleItem];
  uint64_t v4 = [v3 stringValue];

  id v5 = [(AVInfoPanelPlaybackMetadata *)self secondaryTitleItem];
  id v6 = [v5 stringValue];

  if ([v6 length] && !objc_msgSend(v4, "length")) {
    id v7 = 0;
  }
  else {
    id v7 = v6;
  }

  return (NSString *)v7;
}

- (NSString)titleString
{
  id v3 = [(AVInfoPanelPlaybackMetadata *)self titleItem];
  uint64_t v4 = [v3 stringValue];

  id v5 = [(AVInfoPanelPlaybackMetadata *)self secondaryTitleItem];
  id v6 = [v5 stringValue];

  if (![v6 length] || (uint64_t v7 = objc_msgSend(v4, "length"), v8 = v6, v7)) {
    id v8 = v4;
  }
  id v9 = v8;

  return v9;
}

- (id)_releaseDateStringItem
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v6[0] = @"avkt/com.apple.avkit.releaseDate";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  uint64_t v4 = [(AVInfoPanelPlaybackMetadata *)self metadataItemForIdentifiers:v3];

  return v4;
}

- (AVMetadataItem)episodeNumberItem
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v6[0] = @"avkt/com.apple.avkit.episodeNumber";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  uint64_t v4 = [(AVInfoPanelPlaybackMetadata *)self metadataItemForIdentifiers:v3];

  return (AVMetadataItem *)v4;
}

- (AVMetadataItem)seasonNumberItem
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v6[0] = @"avkt/com.apple.avkit.seasonNumber";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  uint64_t v4 = [(AVInfoPanelPlaybackMetadata *)self metadataItemForIdentifiers:v3];

  return (AVMetadataItem *)v4;
}

- (AVMetadataItem)secondaryTitleItem
{
  v7[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F15DB0];
  v7[0] = @"avkt/com.apple.avkit.alternateSubTitle";
  v7[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  id v5 = [(AVInfoPanelPlaybackMetadata *)self metadataItemForIdentifiers:v4];

  return (AVMetadataItem *)v5;
}

- (AVMetadataItem)titleItem
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v6[0] = *MEMORY[0x1E4F15C80];
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  uint64_t v4 = [(AVInfoPanelPlaybackMetadata *)self metadataItemForIdentifiers:v3];

  return (AVMetadataItem *)v4;
}

- (id)metadataItemForIdentifiers:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v16 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * v8);
      uint64_t v10 = (void *)MEMORY[0x1E4F16558];
      id v11 = [(AVInfoPanelPlaybackMetadata *)self metadataItems];
      id v12 = [v10 metadataItemsFromArray:v11 filteredByIdentifier:v9];
      id v13 = [v12 firstObject];

      if (v13) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    id v13 = 0;
  }

  return v13;
}

@end