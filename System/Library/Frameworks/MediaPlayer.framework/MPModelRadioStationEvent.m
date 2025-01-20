@interface MPModelRadioStationEvent
+ (id)__artworkCatalogBlock_KEY;
+ (id)__descriptionText_KEY;
+ (id)__endTime_KEY;
+ (id)__heroArtworkCatalogBlock_KEY;
+ (id)__startTime_KEY;
+ (id)__title_KEY;
+ (int64_t)genericObjectType;
+ (void)__MPModelPropertyRadioStationEventArtwork__MAPPING_MISSING__;
+ (void)__MPModelPropertyRadioStationEventDescriptionText__MAPPING_MISSING__;
+ (void)__MPModelPropertyRadioStationEventEndTime__MAPPING_MISSING__;
+ (void)__MPModelPropertyRadioStationEventHeroArtwork__MAPPING_MISSING__;
+ (void)__MPModelPropertyRadioStationEventStartTime__MAPPING_MISSING__;
+ (void)__MPModelPropertyRadioStationEventTitle__MAPPING_MISSING__;
- (id)artworkCatalog;
- (id)heroArtworkCatalog;
@end

@implementation MPModelRadioStationEvent

- (id)heroArtworkCatalog
{
  uint64_t v3 = [(MPModelRadioStationEvent *)self heroArtworkCatalogBlock];
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(void (**)(uint64_t, MPModelRadioStationEvent *))(v3 + 16))(v3, self);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)artworkCatalog
{
  uint64_t v3 = [(MPModelRadioStationEvent *)self artworkCatalogBlock];
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(void (**)(uint64_t, MPModelRadioStationEvent *))(v3 + 16))(v3, self);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (void)__MPModelPropertyRadioStationEventHeroArtwork__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelRadioStationEvent.m" lineNumber:32 description:@"Translator was missing mapping for MPModelPropertyRadioStationEventHeroArtwork"];
}

+ (id)__heroArtworkCatalogBlock_KEY
{
  return @"MPModelPropertyRadioStationEventHeroArtwork";
}

+ (void)__MPModelPropertyRadioStationEventArtwork__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelRadioStationEvent.m" lineNumber:31 description:@"Translator was missing mapping for MPModelPropertyRadioStationEventArtwork"];
}

+ (id)__artworkCatalogBlock_KEY
{
  return @"MPModelPropertyRadioStationEventArtwork";
}

+ (void)__MPModelPropertyRadioStationEventEndTime__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelRadioStationEvent.m" lineNumber:30 description:@"Translator was missing mapping for MPModelPropertyRadioStationEventEndTime"];
}

+ (id)__endTime_KEY
{
  return @"MPModelPropertyRadioStationEventEndTime";
}

+ (void)__MPModelPropertyRadioStationEventStartTime__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelRadioStationEvent.m" lineNumber:29 description:@"Translator was missing mapping for MPModelPropertyRadioStationEventStartTime"];
}

+ (id)__startTime_KEY
{
  return @"MPModelPropertyRadioStationEventStartTime";
}

+ (void)__MPModelPropertyRadioStationEventDescriptionText__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelRadioStationEvent.m" lineNumber:28 description:@"Translator was missing mapping for MPModelPropertyRadioStationEventDescriptionText"];
}

+ (id)__descriptionText_KEY
{
  return @"MPModelPropertyRadioStationEventDescriptionText";
}

+ (void)__MPModelPropertyRadioStationEventTitle__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelRadioStationEvent.m" lineNumber:27 description:@"Translator was missing mapping for MPModelPropertyRadioStationEventTitle"];
}

+ (id)__title_KEY
{
  return @"MPModelPropertyRadioStationEventTitle";
}

+ (int64_t)genericObjectType
{
  return 18;
}

@end