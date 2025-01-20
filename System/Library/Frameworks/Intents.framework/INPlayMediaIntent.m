@interface INPlayMediaIntent
+ (BOOL)supportsSecureCoding;
+ (id)_ignoredParameters;
- ($F24F406B2B787EFB06265DBA3D28CBD5)_intents_preferredScaledImageSize;
- (BOOL)_intents_isExemptFromMulitWindowRequirementForInAppHandling;
- (INMediaItem)mediaContainer;
- (INMediaSearch)mediaSearch;
- (INPlayMediaIntent)initWithMediaItems:(NSArray *)mediaItems mediaContainer:(INMediaItem *)mediaContainer playShuffled:(NSNumber *)playShuffled playbackRepeatMode:(INPlaybackRepeatMode)playbackRepeatMode resumePlayback:(NSNumber *)resumePlayback;
- (INPlayMediaIntent)initWithMediaItems:(NSArray *)mediaItems mediaContainer:(INMediaItem *)mediaContainer playShuffled:(NSNumber *)playShuffled playbackRepeatMode:(INPlaybackRepeatMode)playbackRepeatMode resumePlayback:(NSNumber *)resumePlayback playbackQueueLocation:(INPlaybackQueueLocation)playbackQueueLocation playbackSpeed:(NSNumber *)playbackSpeed mediaSearch:(INMediaSearch *)mediaSearch;
- (INPlaybackQueueLocation)playbackQueueLocation;
- (INPlaybackRepeatMode)playbackRepeatMode;
- (INPrivatePlayMediaIntentData)privatePlayMediaIntentData;
- (NSArray)alternativeResults;
- (NSArray)audioSearchResults;
- (NSArray)buckets;
- (NSArray)hashedRouteUIDs;
- (NSArray)mediaItems;
- (NSDate)expirationDate;
- (NSNumber)playShuffled;
- (NSNumber)playbackSpeed;
- (NSNumber)resumePlayback;
- (NSString)proxiedBundleIdentifier;
- (NSString)recoID;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_intents_backgroundHandlingAssertionForBundleIdentifier:(id)a3 context:(unint64_t)a4 error:(id *)a5;
- (id)_keyCodableAttributes;
- (id)_metadata;
- (id)_spotlightContentType;
- (id)_titleWithLocalizer:(id)a3 fromBundleURL:(id)a4;
- (id)_typedBackingStore;
- (id)_validParameterCombinationsWithSchema:(id)a3;
- (id)domain;
- (id)verb;
- (int64_t)_compareSubProducerOne:(id)a3 subProducerTwo:(id)a4;
- (int64_t)_intentCategory;
- (int64_t)parsecCategory;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setAlternativeResults:(id)a3;
- (void)setAudioSearchResults:(id)a3;
- (void)setBuckets:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setHashedRouteUIDs:(id)a3;
- (void)setMediaContainer:(id)a3;
- (void)setMediaItems:(id)a3;
- (void)setMediaSearch:(id)a3;
- (void)setParsecCategory:(int64_t)a3;
- (void)setPlayShuffled:(id)a3;
- (void)setPlaybackQueueLocation:(int64_t)a3;
- (void)setPlaybackRepeatMode:(int64_t)a3;
- (void)setPlaybackSpeed:(id)a3;
- (void)setPrivatePlayMediaIntentData:(id)a3;
- (void)setProxiedBundleIdentifier:(id)a3;
- (void)setRecoID:(id)a3;
- (void)setResumePlayback:(id)a3;
@end

@implementation INPlayMediaIntent

- (INPlayMediaIntent)initWithMediaItems:(NSArray *)mediaItems mediaContainer:(INMediaItem *)mediaContainer playShuffled:(NSNumber *)playShuffled playbackRepeatMode:(INPlaybackRepeatMode)playbackRepeatMode resumePlayback:(NSNumber *)resumePlayback
{
  return [(INPlayMediaIntent *)self initWithMediaItems:mediaItems mediaContainer:mediaContainer playShuffled:playShuffled playbackRepeatMode:playbackRepeatMode resumePlayback:resumePlayback playbackQueueLocation:0 playbackSpeed:0 mediaSearch:0];
}

- (int64_t)_compareSubProducerOne:(id)a3 subProducerTwo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 _keyImage];
  v8 = [v6 _keyImage];

  if (v7 && v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int64_t v9 = -1;
    }
    else {
      int64_t v9 = 1;
    }
  }
  else
  {
    if (v8) {
      uint64_t v10 = -1;
    }
    else {
      uint64_t v10 = 0;
    }
    if (v7) {
      int64_t v9 = 1;
    }
    else {
      int64_t v9 = v10;
    }
  }

  return v9;
}

- (id)_intents_backgroundHandlingAssertionForBundleIdentifier:(id)a3 context:(unint64_t)a4 error:(id *)a5
{
  return 0;
}

- (id)_titleWithLocalizer:(id)a3 fromBundleURL:(id)a4
{
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)INPlayMediaIntent;
  v7 = [(INIntent *)&v24 _titleWithLocalizer:v6 fromBundleURL:a4];
  v8 = [(INIntent *)self _intents_launchIdForCurrentPlatform];
  id v23 = 0;
  INExtractAppInfoFromSiriLaunchId(v8, &v23, 0);
  id v9 = v23;

  if ([v9 hasPrefix:@"com.apple."])
  {
    uint64_t v10 = [(INPlayMediaIntent *)self mediaContainer];
    if (v10)
    {
      v11 = (void *)v10;
      v12 = [(INPlayMediaIntent *)self mediaContainer];
      uint64_t v13 = [v12 type];

      if (v13 == 9)
      {
        v14 = [(INPlayMediaIntent *)self resumePlayback];
        int v15 = [v14 BOOLValue];

        v16 = NSString;
        if (v15) {
          v17 = @"Resume %@ radio station";
        }
        else {
          v17 = @"Play %@ radio station";
        }
        v18 = INLocalizedStringWithLocalizer(v17, 0, v6);
        v19 = [(INPlayMediaIntent *)self mediaContainer];
        v20 = [v19 title];
        uint64_t v21 = objc_msgSend(v16, "stringWithFormat:", v18, v20);

        v7 = (void *)v21;
      }
    }
  }

  return v7;
}

+ (id)_ignoredParameters
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"playbackRepeatMode", @"expirationDate", @"recoID", @"proxiedBundleIdentifier", @"playbackQueueLocation", @"playbackSpeed", @"mediaSearch", @"buckets", @"hashedRouteUIDs", 0);
}

- (id)_spotlightContentType
{
  v2 = @"com.apple.siri.interaction.media";
  return @"com.apple.siri.interaction.media";
}

- (id)verb
{
  return @"PlayMedia";
}

- (id)domain
{
  return @"Media";
}

- (id)_validParameterCombinationsWithSchema:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)INPlayMediaIntent;
  v4 = [(INIntent *)&v23 _validParameterCombinationsWithSchema:a3];
  id v5 = [(INPlayMediaIntent *)self mediaContainer];

  if (v5)
  {
    uint64_t v6 = INDictionaryWithObjectsForKeysPassingTest(v4, &__block_literal_global_105511);

    v4 = (void *)v6;
  }
  v7 = [MEMORY[0x1E4F1CA80] set];
  v8 = [(INPlayMediaIntent *)self proxiedBundleIdentifier];

  if (v8) {
    [v7 addObject:@"proxiedBundleIdentifier"];
  }
  if ([v7 count])
  {
    objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v10 = objc_msgSend(v4, "allKeys", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          int v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v16 = [v4 objectForKey:v15];
          v17 = [v15 setByAddingObjectsFromSet:v7];
          [v9 setObject:v16 forKey:v17];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v12);
    }
  }
  else
  {
    id v9 = v4;
  }

  return v9;
}

uint64_t __59__INPlayMediaIntent__validParameterCombinationsWithSchema___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 containsObject:@"mediaContainer"]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v2 containsObject:@"buckets"];
  }

  return v3;
}

- (id)_keyCodableAttributes
{
  id v2 = [(INIntent *)self _codableDescription];
  uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
  v4 = [v2 keyAttribute];
  id v5 = [v2 attributeByName:@"mediaContainer"];
  uint64_t v6 = objc_msgSend(v3, "arrayWithObjects:", v4, v5, 0);

  return v6;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INPlayMediaIntent *)self _typedBackingStore];
  id v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v25[7] = *MEMORY[0x1E4F143B8];
  v24[0] = @"mediaItems";
  uint64_t v3 = [(INPlayMediaIntent *)self mediaItems];
  v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  objc_super v23 = (void *)v3;
  v25[0] = v3;
  v24[1] = @"mediaContainer";
  uint64_t v5 = [(INPlayMediaIntent *)self mediaContainer];
  id v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  long long v22 = (void *)v5;
  v25[1] = v5;
  v24[2] = @"playShuffled";
  uint64_t v7 = [(INPlayMediaIntent *)self playShuffled];
  v8 = (void *)v7;
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[2] = v7;
  v24[3] = @"playbackRepeatMode";
  INPlaybackRepeatMode v9 = [(INPlayMediaIntent *)self playbackRepeatMode];
  if ((unint64_t)(v9 - 1) > 2) {
    uint64_t v10 = @"unknown";
  }
  else {
    uint64_t v10 = *(&off_1E551E4E8 + v9 - 1);
  }
  uint64_t v11 = v10;
  v25[3] = v11;
  v24[4] = @"resumePlayback";
  uint64_t v12 = [(INPlayMediaIntent *)self resumePlayback];
  uint64_t v13 = v12;
  if (!v12)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[4] = v13;
  v24[5] = @"playbackQueueLocation";
  INPlaybackQueueLocation v14 = [(INPlayMediaIntent *)self playbackQueueLocation];
  if ((unint64_t)(v14 - 1) > 2) {
    int v15 = @"unknown";
  }
  else {
    int v15 = off_1E551EE78[v14 - 1];
  }
  v16 = v15;
  v25[5] = v16;
  v24[6] = @"playbackSpeed";
  v17 = [(INPlayMediaIntent *)self playbackSpeed];
  v18 = v17;
  if (!v17)
  {
    v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[6] = v18;
  long long v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:7];
  if (!v17) {

  }
  if (!v12) {
  if (!v8)
  }

  if (!v6) {
  if (!v4)
  }

  return v19;
}

- (void)setPrivatePlayMediaIntentData:(id)a3
{
  id v4 = a3;
  id v6 = [(INPlayMediaIntent *)self _typedBackingStore];
  uint64_t v5 = INIntentSlotValueTransformToPrivatePlayMediaIntentData(v4);

  [v6 setPrivatePlayMediaIntentData:v5];
}

- (INPrivatePlayMediaIntentData)privatePlayMediaIntentData
{
  id v2 = [(INPlayMediaIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 privatePlayMediaIntentData];
  id v4 = INIntentSlotValueTransformFromPrivatePlayMediaIntentData(v3);

  return (INPrivatePlayMediaIntentData *)v4;
}

- (void)setProxiedBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(INPlayMediaIntent *)self _typedBackingStore];
  [v5 setProxiedBundleIdentifier:v4];
}

- (NSString)proxiedBundleIdentifier
{
  id v2 = [(INPlayMediaIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 proxiedBundleIdentifier];
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (void)setParsecCategory:(int64_t)a3
{
  id v4 = [(INPlayMediaIntent *)self _typedBackingStore];
  id v5 = v4;
  if ((unint64_t)a3 > 8) {
    [v4 setHasParsecCategory:0];
  }
  else {
    [v4 setParsecCategory:a3];
  }
}

- (int64_t)parsecCategory
{
  uint64_t v3 = [(INPlayMediaIntent *)self _typedBackingStore];
  int v4 = [v3 hasParsecCategory];
  id v5 = [(INPlayMediaIntent *)self _typedBackingStore];
  uint64_t v6 = [v5 parsecCategory] - 1;
  if (v6 <= 7) {
    int64_t v7 = v6 + 1;
  }
  else {
    int64_t v7 = 0;
  }
  if (v4) {
    int64_t v8 = v7;
  }
  else {
    int64_t v8 = 0;
  }

  return v8;
}

- (void)setAlternativeResults:(id)a3
{
  id v4 = a3;
  id v6 = [(INPlayMediaIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToMediaItemGroups(v4);

  [v6 setAlternativeResults:v5];
}

- (NSArray)alternativeResults
{
  id v2 = [(INPlayMediaIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 alternativeResults];
  id v4 = INIntentSlotValueTransformFromMediaItemGroups(v3);

  return (NSArray *)v4;
}

- (void)setAudioSearchResults:(id)a3
{
  id v4 = a3;
  id v6 = [(INPlayMediaIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToMediaItemGroups(v4);

  [v6 setAudioSearchResults:v5];
}

- (NSArray)audioSearchResults
{
  id v2 = [(INPlayMediaIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 audioSearchResults];
  id v4 = INIntentSlotValueTransformFromMediaItemGroups(v3);

  return (NSArray *)v4;
}

- (void)setHashedRouteUIDs:(id)a3
{
  id v4 = a3;
  id v6 = [(INPlayMediaIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToStrings(v4);

  [v6 setHashedRouteUIDs:v5];
}

- (NSArray)hashedRouteUIDs
{
  id v2 = [(INPlayMediaIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 hashedRouteUIDs];
  id v4 = INIntentSlotValueTransformFromStrings(v3);

  return (NSArray *)v4;
}

- (void)setMediaSearch:(id)a3
{
  id v4 = a3;
  id v6 = [(INPlayMediaIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToMediaSearch(v4);

  [v6 setMediaSearch:v5];
}

- (INMediaSearch)mediaSearch
{
  id v2 = [(INPlayMediaIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 mediaSearch];
  id v4 = INIntentSlotValueTransformFromMediaSearch(v3);

  return (INMediaSearch *)v4;
}

- (void)setPlaybackSpeed:(id)a3
{
  id v5 = a3;
  id v4 = [(INPlayMediaIntent *)self _typedBackingStore];
  if (v5)
  {
    [v5 doubleValue];
    objc_msgSend(v4, "setPlaybackSpeed:");
  }
  else
  {
    [v4 setHasPlaybackSpeed:0];
  }
}

- (NSNumber)playbackSpeed
{
  uint64_t v3 = [(INPlayMediaIntent *)self _typedBackingStore];
  if ([v3 hasPlaybackSpeed])
  {
    id v4 = NSNumber;
    id v5 = [(INPlayMediaIntent *)self _typedBackingStore];
    [v5 playbackSpeed];
    id v6 = objc_msgSend(v4, "numberWithDouble:");
  }
  else
  {
    id v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setPlaybackQueueLocation:(int64_t)a3
{
  id v4 = [(INPlayMediaIntent *)self _typedBackingStore];
  id v5 = v4;
  if ((unint64_t)a3 > 3) {
    [v4 setHasPlaybackQueueLocation:0];
  }
  else {
    [v4 setPlaybackQueueLocation:a3];
  }
}

- (INPlaybackQueueLocation)playbackQueueLocation
{
  uint64_t v3 = [(INPlayMediaIntent *)self _typedBackingStore];
  int v4 = [v3 hasPlaybackQueueLocation];
  id v5 = [(INPlayMediaIntent *)self _typedBackingStore];
  uint64_t v6 = [v5 playbackQueueLocation] - 1;
  if (v6 <= 2) {
    INPlaybackQueueLocation v7 = v6 + 1;
  }
  else {
    INPlaybackQueueLocation v7 = INPlaybackQueueLocationUnknown;
  }
  if (v4) {
    INPlaybackQueueLocation v8 = v7;
  }
  else {
    INPlaybackQueueLocation v8 = INPlaybackQueueLocationUnknown;
  }

  return v8;
}

- (void)setRecoID:(id)a3
{
  id v4 = a3;
  id v5 = [(INPlayMediaIntent *)self _typedBackingStore];
  [v5 setRecoID:v4];
}

- (NSString)recoID
{
  id v2 = [(INPlayMediaIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 recoID];
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (void)setBuckets:(id)a3
{
  id v4 = a3;
  id v6 = [(INPlayMediaIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToDataStrings(v4);

  [v6 setBuckets:v5];
}

- (NSArray)buckets
{
  id v2 = [(INPlayMediaIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 buckets];
  id v4 = INIntentSlotValueTransformFromDataStrings(v3);

  return (NSArray *)v4;
}

- (void)setExpirationDate:(id)a3
{
  id v4 = a3;
  id v6 = [(INPlayMediaIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToTimestamp(v4);

  [v6 setExpirationDate:v5];
}

- (NSDate)expirationDate
{
  id v2 = [(INPlayMediaIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 expirationDate];
  id v4 = INIntentSlotValueTransformFromTimestamp(v3);

  return (NSDate *)v4;
}

- (void)setResumePlayback:(id)a3
{
  id v5 = a3;
  id v4 = [(INPlayMediaIntent *)self _typedBackingStore];
  if (v5) {
    objc_msgSend(v4, "setResumePlayback:", objc_msgSend(v5, "BOOLValue"));
  }
  else {
    [v4 setHasResumePlayback:0];
  }
}

- (NSNumber)resumePlayback
{
  uint64_t v3 = [(INPlayMediaIntent *)self _typedBackingStore];
  if ([v3 hasResumePlayback])
  {
    id v4 = NSNumber;
    id v5 = [(INPlayMediaIntent *)self _typedBackingStore];
    id v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "resumePlayback"));
  }
  else
  {
    id v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setPlaybackRepeatMode:(int64_t)a3
{
  unint64_t v3 = a3 - 1;
  id v4 = [(INPlayMediaIntent *)self _typedBackingStore];
  id v5 = v4;
  if (v3 > 2) {
    [v4 setHasPlaybackRepeatMode:0];
  }
  else {
    [v4 setPlaybackRepeatMode:v3];
  }
}

- (INPlaybackRepeatMode)playbackRepeatMode
{
  unint64_t v3 = [(INPlayMediaIntent *)self _typedBackingStore];
  unsigned __int8 v4 = [v3 hasPlaybackRepeatMode];
  id v5 = [(INPlayMediaIntent *)self _typedBackingStore];
  unsigned int v6 = [v5 playbackRepeatMode];
  if (((v6 < 3) & v4) != 0) {
    INPlaybackRepeatMode v7 = v6 + 1;
  }
  else {
    INPlaybackRepeatMode v7 = INPlaybackRepeatModeUnknown;
  }

  return v7;
}

- (void)setPlayShuffled:(id)a3
{
  id v5 = a3;
  unsigned __int8 v4 = [(INPlayMediaIntent *)self _typedBackingStore];
  if (v5) {
    objc_msgSend(v4, "setPlayShuffled:", objc_msgSend(v5, "BOOLValue"));
  }
  else {
    [v4 setHasPlayShuffled:0];
  }
}

- (NSNumber)playShuffled
{
  unint64_t v3 = [(INPlayMediaIntent *)self _typedBackingStore];
  if ([v3 hasPlayShuffled])
  {
    unsigned __int8 v4 = NSNumber;
    id v5 = [(INPlayMediaIntent *)self _typedBackingStore];
    unsigned int v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "playShuffled"));
  }
  else
  {
    unsigned int v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setMediaContainer:(id)a3
{
  id v4 = a3;
  id v6 = [(INPlayMediaIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToMediaItemValue(v4);

  [v6 setMediaContainer:v5];
}

- (INMediaItem)mediaContainer
{
  id v2 = [(INPlayMediaIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 mediaContainer];
  id v4 = INIntentSlotValueTransformFromMediaItemValue(v3);

  return (INMediaItem *)v4;
}

- (void)setMediaItems:(id)a3
{
  id v4 = a3;
  id v6 = [(INPlayMediaIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToMediaItemValues(v4);

  [v6 setMediaItems:v5];
}

- (NSArray)mediaItems
{
  id v2 = [(INPlayMediaIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 mediaItems];
  id v4 = INIntentSlotValueTransformFromMediaItemValues(v3);

  return (NSArray *)v4;
}

- (INPlayMediaIntent)initWithMediaItems:(NSArray *)mediaItems mediaContainer:(INMediaItem *)mediaContainer playShuffled:(NSNumber *)playShuffled playbackRepeatMode:(INPlaybackRepeatMode)playbackRepeatMode resumePlayback:(NSNumber *)resumePlayback playbackQueueLocation:(INPlaybackQueueLocation)playbackQueueLocation playbackSpeed:(NSNumber *)playbackSpeed mediaSearch:(INMediaSearch *)mediaSearch
{
  v16 = mediaItems;
  v17 = mediaContainer;
  v18 = playShuffled;
  long long v19 = resumePlayback;
  long long v20 = playbackSpeed;
  long long v21 = mediaSearch;
  v25.receiver = self;
  v25.super_class = (Class)INPlayMediaIntent;
  long long v22 = [(INIntent *)&v25 init];
  objc_super v23 = v22;
  if (v22)
  {
    [(INPlayMediaIntent *)v22 setMediaItems:v16];
    [(INPlayMediaIntent *)v23 setMediaContainer:v17];
    [(INPlayMediaIntent *)v23 setPlayShuffled:v18];
    [(INPlayMediaIntent *)v23 setPlaybackRepeatMode:playbackRepeatMode];
    [(INPlayMediaIntent *)v23 setResumePlayback:v19];
    [(INPlayMediaIntent *)v23 setPlaybackQueueLocation:playbackQueueLocation];
    [(INPlayMediaIntent *)v23 setPlaybackSpeed:v20];
    [(INPlayMediaIntent *)v23 setMediaSearch:v21];
  }

  return v23;
}

- (id)_categoryVerb
{
  return @"Play";
}

- (int64_t)_intentCategory
{
  return 2;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INPlayMediaIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  id v2 = [(INPlayMediaIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 intentMetadata];

  return v3;
}

- (id)_typedBackingStore
{
  id v2 = [(INIntent *)self backingStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v3 = v2;
  }
  else {
    unint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_intents_isExemptFromMulitWindowRequirementForInAppHandling
{
  return 1;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_intents_preferredScaledImageSize
{
  double v2 = 390.0;
  double v3 = 390.0;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

@end