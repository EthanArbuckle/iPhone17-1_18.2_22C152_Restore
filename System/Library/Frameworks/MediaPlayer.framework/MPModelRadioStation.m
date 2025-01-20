@interface MPModelRadioStation
+ (id)__allowsItemLiking_KEY;
+ (id)__artworkCatalogBlock_KEY;
+ (id)__attributionLabel_KEY;
+ (id)__beats1_KEY;
+ (id)__containsVideo_KEY;
+ (id)__editorNotes_KEY;
+ (id)__endingAirDate_KEY;
+ (id)__hasExplicitContent_KEY;
+ (id)__live_KEY;
+ (id)__name_KEY;
+ (id)__providerBundleIdentifier_KEY;
+ (id)__providerID_KEY;
+ (id)__providerName_KEY;
+ (id)__providerUniversalLink_KEY;
+ (id)__shortEditorNotes_KEY;
+ (id)__startingAirDate_KEY;
+ (id)__stationEvents_KEY;
+ (id)__stationGlyphBlock_KEY;
+ (id)__subscriptionRequired_KEY;
+ (id)__subtype_KEY;
+ (id)__type_KEY;
+ (id)classesForSecureCoding;
+ (int64_t)genericObjectType;
+ (void)__MPModelPropertyRadioStationAllowsItemLiking__MAPPING_MISSING__;
+ (void)__MPModelPropertyRadioStationArtwork__MAPPING_MISSING__;
+ (void)__MPModelPropertyRadioStationAttributionLabel__MAPPING_MISSING__;
+ (void)__MPModelPropertyRadioStationBeats1__MAPPING_MISSING__;
+ (void)__MPModelPropertyRadioStationContainsVideo__MAPPING_MISSING__;
+ (void)__MPModelPropertyRadioStationEditorNotes__MAPPING_MISSING__;
+ (void)__MPModelPropertyRadioStationEndingAirDate__MAPPING_MISSING__;
+ (void)__MPModelPropertyRadioStationEvents__MAPPING_MISSING__;
+ (void)__MPModelPropertyRadioStationGlyph__MAPPING_MISSING__;
+ (void)__MPModelPropertyRadioStationHasExplicitContent__MAPPING_MISSING__;
+ (void)__MPModelPropertyRadioStationLive__MAPPING_MISSING__;
+ (void)__MPModelPropertyRadioStationName__MAPPING_MISSING__;
+ (void)__MPModelPropertyRadioStationProviderBundleIdentifier__MAPPING_MISSING__;
+ (void)__MPModelPropertyRadioStationProviderID__MAPPING_MISSING__;
+ (void)__MPModelPropertyRadioStationProviderName__MAPPING_MISSING__;
+ (void)__MPModelPropertyRadioStationProviderUniversalLink__MAPPING_MISSING__;
+ (void)__MPModelPropertyRadioStationShortEditorNotes__MAPPING_MISSING__;
+ (void)__MPModelPropertyRadioStationStartingAirDate__MAPPING_MISSING__;
+ (void)__MPModelPropertyRadioStationSubscriptionRequired__MAPPING_MISSING__;
+ (void)__MPModelPropertyRadioStationSubtype__MAPPING_MISSING__;
+ (void)__MPModelPropertyRadioStationType__MAPPING_MISSING__;
- (MPRadioStationEvent)currentStationEvent;
- (MPRadioStationEvent)upcomingStationEvent;
- (id)artworkCatalog;
- (id)contentItemCollectionInfo;
- (id)humanDescription;
- (id)stationGlyph;
@end

@implementation MPModelRadioStation

+ (id)__type_KEY
{
  return @"MPModelPropertyRadioStationType";
}

+ (id)__subtype_KEY
{
  return @"MPModelPropertyRadioStationSubtype";
}

+ (id)__subscriptionRequired_KEY
{
  return @"MPModelPropertyRadioStationSubscriptionRequired";
}

+ (id)__stationGlyphBlock_KEY
{
  return @"MPModelPropertyRadioStationGlyph";
}

+ (id)__stationEvents_KEY
{
  return @"MPModelPropertyRadioStationEvents";
}

+ (id)__startingAirDate_KEY
{
  return @"MPModelPropertyRadioStationStartingAirDate";
}

+ (id)__shortEditorNotes_KEY
{
  return @"MPModelPropertyRadioStationShortEditorNotes";
}

+ (id)__providerUniversalLink_KEY
{
  return @"MPModelPropertyRadioStationProviderUniversalLink";
}

+ (id)__providerName_KEY
{
  return @"MPModelPropertyRadioStationProviderName";
}

+ (id)__providerID_KEY
{
  return @"MPModelPropertyRadioStationProviderID";
}

+ (id)__providerBundleIdentifier_KEY
{
  return @"MPModelPropertyRadioStationProviderBundleIdentifier";
}

+ (id)__name_KEY
{
  return @"MPModelPropertyRadioStationName";
}

+ (id)__live_KEY
{
  return @"MPModelPropertyRadioStationLive";
}

+ (id)__hasExplicitContent_KEY
{
  return @"MPModelPropertyRadioStationHasExplicitContent";
}

+ (id)__endingAirDate_KEY
{
  return @"MPModelPropertyRadioStationEndingAirDate";
}

+ (id)__editorNotes_KEY
{
  return @"MPModelPropertyRadioStationEditorNotes";
}

+ (id)__containsVideo_KEY
{
  return @"MPModelPropertyRadioStationContainsVideo";
}

+ (id)__beats1_KEY
{
  return @"MPModelPropertyRadioStationBeats1";
}

+ (id)__attributionLabel_KEY
{
  return @"MPModelPropertyRadioStationAttributionLabel";
}

+ (id)__artworkCatalogBlock_KEY
{
  return @"MPModelPropertyRadioStationArtwork";
}

+ (id)__allowsItemLiking_KEY
{
  return @"MPModelPropertyRadioStationAllowsItemLiking";
}

- (id)contentItemCollectionInfo
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:@"_MPNowPlayingCollectionInfoCollectionTypeRadio" forKey:@"_MPNowPlayingCollectionInfoKeyCollectionType"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__MPModelRadioStation_MPContentItemAdditions__contentItemCollectionInfo__block_invoke;
  v8[3] = &unk_1E57F9F98;
  v8[4] = self;
  id v4 = v3;
  id v9 = v4;
  +[MPModelObject performWithoutEnforcement:v8];
  v5 = v9;
  id v6 = v4;

  return v6;
}

void __72__MPModelRadioStation_MPContentItemAdditions__contentItemCollectionInfo__block_invoke(uint64_t a1)
{
  id v11 = [*(id *)(a1 + 32) name];
  if ([v11 length]) {
    [*(id *)(a1 + 40) setObject:v11 forKey:@"_MPNowPlayingCollectionInfoKeyTitle"];
  }
  v2 = [*(id *)(a1 + 32) identifiers];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [v2 radio];
  v5 = [v4 stationStringID];

  if ([v5 length]) {
    [v3 setObject:v5 forKey:@"_MPNowPlayingInfoPropertyRadioStationStringIdentifier"];
  }
  id v6 = [v2 radio];
  uint64_t v7 = [v6 stationID];

  if (v7)
  {
    v8 = [NSNumber numberWithLongLong:v7];
    [v3 setObject:v8 forKey:@"_MPNowPlayingInfoPropertyRadioStationIdentifier"];
  }
  id v9 = [v2 radio];
  v10 = [v9 stationHash];

  if ([v10 length]) {
    [v3 setObject:v10 forKey:@"_MPNowPlayingInfoPropertyRadioStationHash"];
  }
  if ([v3 count]) {
    [*(id *)(a1 + 40) setObject:v3 forKey:@"_MPNowPlayingCollectionInfoKeyIdentifiers"];
  }
}

- (MPRadioStationEvent)upcomingStationEvent
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1C9C8] now];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = [(MPModelRadioStation *)self stationEvents];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v11 = [v10 startTime];
        uint64_t v12 = [v3 compare:v11];

        if (v12 == -1)
        {
          if (!v7) {
            goto LABEL_9;
          }
          v13 = [v10 startTime];
          [v13 timeIntervalSinceNow];
          double v15 = v14;
          v16 = [v7 startTime];
          [v16 timeIntervalSinceNow];
          double v18 = v17;

          if (v15 < v18)
          {
LABEL_9:
            id v19 = v10;

            uint64_t v7 = v19;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return (MPRadioStationEvent *)v7;
}

- (MPRadioStationEvent)currentStationEvent
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1C9C8] now];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(MPModelRadioStation *)self stationEvents];
  uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v10 = objc_alloc(MEMORY[0x1E4F28C18]);
        id v11 = [v9 startTime];
        uint64_t v12 = [v9 endTime];
        v13 = (void *)[v10 initWithStartDate:v11 endDate:v12];

        if ([v13 containsDate:v3])
        {
          if (!v6) {
            goto LABEL_9;
          }
          double v14 = [v9 startTime];
          [v14 timeIntervalSinceNow];
          double v16 = v15;
          double v17 = [v6 startTime];
          [v17 timeIntervalSinceNow];
          double v19 = v18;

          if (v16 < v19)
          {
LABEL_9:
            id v20 = v9;

            uint64_t v6 = v20;
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (MPRadioStationEvent *)v6;
}

- (id)stationGlyph
{
  uint64_t v3 = [(MPModelRadioStation *)self stationGlyphBlock];
  uint64_t v4 = (void *)v3;
  if (v3)
  {
    uint64_t v5 = (*(void (**)(uint64_t, MPModelRadioStation *))(v3 + 16))(v3, self);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)artworkCatalog
{
  uint64_t v3 = [(MPModelRadioStation *)self artworkCatalogBlock];
  uint64_t v4 = (void *)v3;
  if (v3)
  {
    uint64_t v5 = (*(void (**)(uint64_t, MPModelRadioStation *))(v3 + 16))(v3, self);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)humanDescription
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = [(MPModelObject *)self identifiers];
  uint64_t v5 = [v4 humanDescription];
  uint64_t v6 = [v3 stringWithFormat:@"radio station %@", v5];

  if ([(MPModelObject *)self hasLoadedValueForKey:@"MPModelPropertyRadioStationName"])
  {
    uint64_t v7 = NSString;
    uint64_t v8 = [(MPModelRadioStation *)self name];
    id v9 = [v7 stringWithFormat:@"“%@” ", v8];

    [v6 insertString:v9 atIndex:0];
  }

  return v6;
}

+ (void)__MPModelPropertyRadioStationEndingAirDate__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelRadioStation.m" lineNumber:104 description:@"Translator was missing mapping for MPModelPropertyRadioStationEndingAirDate"];
}

+ (void)__MPModelPropertyRadioStationStartingAirDate__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelRadioStation.m" lineNumber:103 description:@"Translator was missing mapping for MPModelPropertyRadioStationStartingAirDate"];
}

+ (void)__MPModelPropertyRadioStationProviderID__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelRadioStation.m" lineNumber:102 description:@"Translator was missing mapping for MPModelPropertyRadioStationProviderID"];
}

+ (void)__MPModelPropertyRadioStationProviderBundleIdentifier__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelRadioStation.m" lineNumber:101 description:@"Translator was missing mapping for MPModelPropertyRadioStationProviderBundleIdentifier"];
}

+ (void)__MPModelPropertyRadioStationProviderUniversalLink__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelRadioStation.m" lineNumber:100 description:@"Translator was missing mapping for MPModelPropertyRadioStationProviderUniversalLink"];
}

+ (void)__MPModelPropertyRadioStationSubscriptionRequired__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelRadioStation.m" lineNumber:99 description:@"Translator was missing mapping for MPModelPropertyRadioStationSubscriptionRequired"];
}

+ (void)__MPModelPropertyRadioStationProviderName__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelRadioStation.m" lineNumber:98 description:@"Translator was missing mapping for MPModelPropertyRadioStationProviderName"];
}

+ (void)__MPModelPropertyRadioStationAttributionLabel__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelRadioStation.m" lineNumber:97 description:@"Translator was missing mapping for MPModelPropertyRadioStationAttributionLabel"];
}

+ (void)__MPModelPropertyRadioStationSubtype__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelRadioStation.m" lineNumber:96 description:@"Translator was missing mapping for MPModelPropertyRadioStationSubtype"];
}

+ (void)__MPModelPropertyRadioStationType__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelRadioStation.m" lineNumber:95 description:@"Translator was missing mapping for MPModelPropertyRadioStationType"];
}

+ (void)__MPModelPropertyRadioStationAllowsItemLiking__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelRadioStation.m" lineNumber:94 description:@"Translator was missing mapping for MPModelPropertyRadioStationAllowsItemLiking"];
}

+ (void)__MPModelPropertyRadioStationGlyph__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelRadioStation.m" lineNumber:93 description:@"Translator was missing mapping for MPModelPropertyRadioStationGlyph"];
}

+ (void)__MPModelPropertyRadioStationArtwork__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelRadioStation.m" lineNumber:92 description:@"Translator was missing mapping for MPModelPropertyRadioStationArtwork"];
}

+ (void)__MPModelPropertyRadioStationEvents__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelRadioStation.m" lineNumber:91 description:@"Translator was missing mapping for MPModelPropertyRadioStationEvents"];
}

+ (void)__MPModelPropertyRadioStationHasExplicitContent__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelRadioStation.m" lineNumber:90 description:@"Translator was missing mapping for MPModelPropertyRadioStationHasExplicitContent"];
}

+ (void)__MPModelPropertyRadioStationShortEditorNotes__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelRadioStation.m" lineNumber:89 description:@"Translator was missing mapping for MPModelPropertyRadioStationShortEditorNotes"];
}

+ (void)__MPModelPropertyRadioStationEditorNotes__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelRadioStation.m" lineNumber:88 description:@"Translator was missing mapping for MPModelPropertyRadioStationEditorNotes"];
}

+ (void)__MPModelPropertyRadioStationName__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelRadioStation.m" lineNumber:87 description:@"Translator was missing mapping for MPModelPropertyRadioStationName"];
}

+ (void)__MPModelPropertyRadioStationContainsVideo__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelRadioStation.m" lineNumber:86 description:@"Translator was missing mapping for MPModelPropertyRadioStationContainsVideo"];
}

+ (void)__MPModelPropertyRadioStationLive__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelRadioStation.m" lineNumber:85 description:@"Translator was missing mapping for MPModelPropertyRadioStationLive"];
}

+ (void)__MPModelPropertyRadioStationBeats1__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelRadioStation.m" lineNumber:84 description:@"Translator was missing mapping for MPModelPropertyRadioStationBeats1"];
}

+ (id)classesForSecureCoding
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

+ (int64_t)genericObjectType
{
  return 13;
}

@end