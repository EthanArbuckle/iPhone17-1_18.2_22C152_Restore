@interface MPModelTVSeason
+ (BOOL)supportsLibraryAddStatusObservation;
+ (id)__artworkCatalogBlock_KEY;
+ (id)__descriptionText_KEY;
+ (id)__downloadedDate_KEY;
+ (id)__episodesCount_KEY;
+ (id)__hasCleanContent_KEY;
+ (id)__hasExplicitContent_KEY;
+ (id)__libraryAddEligible_KEY;
+ (id)__libraryAddedDate_KEY;
+ (id)__libraryAdded_KEY;
+ (id)__number_KEY;
+ (id)__representativeEpisode_KEY;
+ (id)__show_KEY;
+ (id)__sortType_KEY;
+ (id)__storeCanonicalID_KEY;
+ (id)__year_KEY;
+ (id)kindWithEpisodeKind:(id)a3;
+ (id)requiredLibraryAddStatusObservationProperties;
+ (id)requiredStoreLibraryPersonalizationProperties;
+ (int64_t)genericObjectType;
+ (void)__MPModelPropertyTVSeasonArtwork__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVSeasonDescriptionText__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVSeasonDownloadedDate__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVSeasonEpisodesCount__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVSeasonHasCleanContent__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVSeasonHasExplicitContent__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVSeasonLibraryAddEligible__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVSeasonLibraryAddedDate__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVSeasonLibraryAdded__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVSeasonNumber__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVSeasonSortType__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVSeasonStoreCanonicalID__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVSeasonYear__MAPPING_MISSING__;
+ (void)__MPModelRelationshipTVSeasonRepresentativeEpisode__MAPPING_MISSING__;
+ (void)__MPModelRelationshipTVSeasonShow__MAPPING_MISSING__;
- (MPLibraryAddStatusObserverConfiguration)libraryAddStatusObserverConfiguration;
- (id)artworkCatalog;
- (id)humanDescription;
- (id)objectWithStoreLibraryPersonalizationRelativeModelObject:(id)a3;
- (id)personalizationScopedPropertiesForProperties:(id)a3;
@end

@implementation MPModelTVSeason

+ (id)__year_KEY
{
  return @"MPModelPropertyTVSeasonYear";
}

+ (id)__storeCanonicalID_KEY
{
  return @"MPModelPropertyTVSeasonStoreCanonicalID";
}

+ (id)__sortType_KEY
{
  return @"MPModelPropertyTVSeasonSortType";
}

+ (id)__show_KEY
{
  return @"MPModelRelationshipTVSeasonShow";
}

+ (id)__representativeEpisode_KEY
{
  return @"MPModelRelationshipTVSeasonRepresentativeEpisode";
}

+ (id)__number_KEY
{
  return @"MPModelPropertyTVSeasonNumber";
}

+ (id)__libraryAdded_KEY
{
  return @"MPModelPropertyTVSeasonLibraryAdded";
}

+ (id)__libraryAddedDate_KEY
{
  return @"MPModelPropertyTVSeasonLibraryAddedDate";
}

+ (id)__libraryAddEligible_KEY
{
  return @"MPModelPropertyTVSeasonLibraryAddEligible";
}

+ (id)__hasExplicitContent_KEY
{
  return @"MPModelPropertyTVSeasonHasExplicitContent";
}

+ (id)__hasCleanContent_KEY
{
  return @"MPModelPropertyTVSeasonHasCleanContent";
}

+ (id)__episodesCount_KEY
{
  return @"MPModelPropertyTVSeasonEpisodesCount";
}

+ (id)__downloadedDate_KEY
{
  return @"MPModelPropertyTVSeasonDownloadedDate";
}

+ (id)__descriptionText_KEY
{
  return @"MPModelPropertyTVSeasonDescriptionText";
}

+ (id)__artworkCatalogBlock_KEY
{
  return @"MPModelPropertyTVSeasonArtwork";
}

+ (id)requiredStoreLibraryPersonalizationProperties
{
  return +[MPPropertySet emptyPropertySet];
}

- (MPLibraryAddStatusObserverConfiguration)libraryAddStatusObserverConfiguration
{
  int v3 = [(MPModelTVSeason *)self isLibraryAdded];
  int v4 = [(MPModelTVSeason *)self hasCleanContent];
  int v5 = [(MPModelTVSeason *)self hasExplicitContent];
  int v6 = [(MPModelTVSeason *)self isLibraryAddEligible];
  uint64_t v7 = 0x100000000;
  if (!v6) {
    uint64_t v7 = 0;
  }
  uint64_t v8 = 0x1000000;
  if (!v5) {
    uint64_t v8 = 0;
  }
  uint64_t v9 = 0x10000;
  if (!v4) {
    uint64_t v9 = 0;
  }
  uint64_t v10 = 257;
  if (!v3) {
    uint64_t v10 = 1;
  }
  return (MPLibraryAddStatusObserverConfiguration)(v10 | v9 | v8 | v7);
}

+ (id)requiredLibraryAddStatusObservationProperties
{
  v5[4] = *MEMORY[0x1E4F143B8];
  v5[0] = @"MPModelPropertyTVSeasonHasCleanContent";
  v5[1] = @"MPModelPropertyTVSeasonHasExplicitContent";
  v5[2] = @"MPModelPropertyTVSeasonLibraryAddEligible";
  v5[3] = @"MPModelPropertyTVSeasonLibraryAdded";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
  int v3 = +[MPPropertySet propertySetWithProperties:v2];

  return v3;
}

+ (BOOL)supportsLibraryAddStatusObservation
{
  return 1;
}

+ (int64_t)genericObjectType
{
  return 7;
}

- (id)objectWithStoreLibraryPersonalizationRelativeModelObject:(id)a3
{
  return a3;
}

- (id)personalizationScopedPropertiesForProperties:(id)a3
{
  return a3;
}

- (id)artworkCatalog
{
  uint64_t v3 = [(MPModelTVSeason *)self artworkCatalogBlock];
  int v4 = (void *)v3;
  if (v3)
  {
    int v5 = (*(void (**)(uint64_t, MPModelTVSeason *))(v3 + 16))(v3, self);
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (id)humanDescription
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  int v4 = [(MPModelObject *)self identifiers];
  int v5 = [v4 humanDescription];
  int v6 = [v3 stringWithFormat:@"TV season %@", v5];

  if ([(MPModelObject *)self hasLoadedValueForKey:@"MPModelPropertyTVSeasonNumber"]
    && [(MPModelTVSeason *)self number] >= 1)
  {
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"Season %ld ", -[MPModelTVSeason number](self, "number"));
    [v6 insertString:v7 atIndex:0];
  }

  return v6;
}

+ (void)__MPModelPropertyTVSeasonDownloadedDate__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVSeason.m" lineNumber:96 description:@"Translator was missing mapping for MPModelPropertyTVSeasonDownloadedDate"];
}

+ (void)__MPModelPropertyTVSeasonArtwork__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVSeason.m" lineNumber:95 description:@"Translator was missing mapping for MPModelPropertyTVSeasonArtwork"];
}

+ (void)__MPModelRelationshipTVSeasonRepresentativeEpisode__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVSeason.m" lineNumber:94 description:@"Translator was missing mapping for MPModelRelationshipTVSeasonRepresentativeEpisode"];
}

+ (void)__MPModelRelationshipTVSeasonShow__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVSeason.m" lineNumber:93 description:@"Translator was missing mapping for MPModelRelationshipTVSeasonShow"];
}

+ (void)__MPModelPropertyTVSeasonStoreCanonicalID__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVSeason.m" lineNumber:91 description:@"Translator was missing mapping for MPModelPropertyTVSeasonStoreCanonicalID"];
}

+ (void)__MPModelPropertyTVSeasonSortType__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVSeason.m" lineNumber:90 description:@"Translator was missing mapping for MPModelPropertyTVSeasonSortType"];
}

+ (void)__MPModelPropertyTVSeasonLibraryAddEligible__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVSeason.m" lineNumber:89 description:@"Translator was missing mapping for MPModelPropertyTVSeasonLibraryAddEligible"];
}

+ (void)__MPModelPropertyTVSeasonLibraryAdded__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVSeason.m" lineNumber:88 description:@"Translator was missing mapping for MPModelPropertyTVSeasonLibraryAdded"];
}

+ (void)__MPModelPropertyTVSeasonLibraryAddedDate__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVSeason.m" lineNumber:87 description:@"Translator was missing mapping for MPModelPropertyTVSeasonLibraryAddedDate"];
}

+ (void)__MPModelPropertyTVSeasonHasExplicitContent__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVSeason.m" lineNumber:86 description:@"Translator was missing mapping for MPModelPropertyTVSeasonHasExplicitContent"];
}

+ (void)__MPModelPropertyTVSeasonHasCleanContent__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVSeason.m" lineNumber:85 description:@"Translator was missing mapping for MPModelPropertyTVSeasonHasCleanContent"];
}

+ (void)__MPModelPropertyTVSeasonEpisodesCount__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVSeason.m" lineNumber:84 description:@"Translator was missing mapping for MPModelPropertyTVSeasonEpisodesCount"];
}

+ (void)__MPModelPropertyTVSeasonYear__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVSeason.m" lineNumber:83 description:@"Translator was missing mapping for MPModelPropertyTVSeasonYear"];
}

+ (void)__MPModelPropertyTVSeasonDescriptionText__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVSeason.m" lineNumber:82 description:@"Translator was missing mapping for MPModelPropertyTVSeasonDescriptionText"];
}

+ (void)__MPModelPropertyTVSeasonNumber__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVSeason.m" lineNumber:81 description:@"Translator was missing mapping for MPModelPropertyTVSeasonNumber"];
}

+ (id)kindWithEpisodeKind:(id)a3
{
  return +[MPModelTVSeasonKind kindWithEpisodeKind:a3];
}

@end