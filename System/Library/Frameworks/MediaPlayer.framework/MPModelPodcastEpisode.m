@interface MPModelPodcastEpisode
+ (id)__artworkCatalogBlock_KEY;
+ (id)__artworkInfo_KEY;
+ (id)__assetURL_KEY;
+ (id)__author_KEY;
+ (id)__chapters_KEY;
+ (id)__datePlayed_KEY;
+ (id)__descriptionText_KEY;
+ (id)__duration_KEY;
+ (id)__episodeNumber_KEY;
+ (id)__episodeType_KEY;
+ (id)__explicitEpisode_KEY;
+ (id)__externalContentID_KEY;
+ (id)__feedURL_KEY;
+ (id)__hasVideo_KEY;
+ (id)__itemType_KEY;
+ (id)__localFileAsset_KEY;
+ (id)__mediaType_KEY;
+ (id)__playbackPosition_KEY;
+ (id)__podcastStoreID_KEY;
+ (id)__podcast_KEY;
+ (id)__priceType_KEY;
+ (id)__releaseDateComponents_KEY;
+ (id)__seasonNumber_KEY;
+ (id)__shareURL_KEY;
+ (id)__shouldShowChapterArtwork_KEY;
+ (id)__showArtworkTemplateURL_KEY;
+ (id)__state_KEY;
+ (id)__streamURL_KEY;
+ (id)__title_KEY;
+ (id)__transcriptAlignments_KEY;
+ (id)__transcriptIdentifier_KEY;
+ (id)__transcriptSource_KEY;
+ (id)__userRating_KEY;
+ (id)kindWithVariants:(unint64_t)a3;
+ (id)kindWithVariants:(unint64_t)a3 options:(unint64_t)a4;
+ (int64_t)genericObjectType;
+ (void)__MPModelPropertyPodcastEpisodeArtworkInfo__MAPPING_MISSING__;
+ (void)__MPModelPropertyPodcastEpisodeArtwork__MAPPING_MISSING__;
+ (void)__MPModelPropertyPodcastEpisodeAssetURL__MAPPING_MISSING__;
+ (void)__MPModelPropertyPodcastEpisodeChapters__MAPPING_MISSING__;
+ (void)__MPModelPropertyPodcastEpisodeDatePlayed__MAPPING_MISSING__;
+ (void)__MPModelPropertyPodcastEpisodeDescriptionText__MAPPING_MISSING__;
+ (void)__MPModelPropertyPodcastEpisodeDuration__MAPPING_MISSING__;
+ (void)__MPModelPropertyPodcastEpisodeExplicit__MAPPING_MISSING__;
+ (void)__MPModelPropertyPodcastEpisodeExternalContentID__MAPPING_MISSING__;
+ (void)__MPModelPropertyPodcastEpisodeFeedURL__MAPPING_MISSING__;
+ (void)__MPModelPropertyPodcastEpisodeHasVideo__MAPPING_MISSING__;
+ (void)__MPModelPropertyPodcastEpisodeItemType__MAPPING_MISSING__;
+ (void)__MPModelPropertyPodcastEpisodeMediaType__MAPPING_MISSING__;
+ (void)__MPModelPropertyPodcastEpisodeNumber__MAPPING_MISSING__;
+ (void)__MPModelPropertyPodcastEpisodePodcastStoreID__MAPPING_MISSING__;
+ (void)__MPModelPropertyPodcastEpisodePriceType__MAPPING_MISSING__;
+ (void)__MPModelPropertyPodcastEpisodeReleaseDateComponents__MAPPING_MISSING__;
+ (void)__MPModelPropertyPodcastEpisodeSeasonNumber__MAPPING_MISSING__;
+ (void)__MPModelPropertyPodcastEpisodeShareURL__MAPPING_MISSING__;
+ (void)__MPModelPropertyPodcastEpisodeShouldShowChapterArtwork__MAPPING_MISSING__;
+ (void)__MPModelPropertyPodcastEpisodeShowArtworkTemplateURL__MAPPING_MISSING__;
+ (void)__MPModelPropertyPodcastEpisodeState__MAPPING_MISSING__;
+ (void)__MPModelPropertyPodcastEpisodeStreamURL__MAPPING_MISSING__;
+ (void)__MPModelPropertyPodcastEpisodeTitle__MAPPING_MISSING__;
+ (void)__MPModelPropertyPodcastEpisodeTranscriptAlignments__MAPPING_MISSING__;
+ (void)__MPModelPropertyPodcastEpisodeTranscriptIdentifier__MAPPING_MISSING__;
+ (void)__MPModelPropertyPodcastEpisodeTranscriptSource__MAPPING_MISSING__;
+ (void)__MPModelPropertyPodcastEpisodeType__MAPPING_MISSING__;
+ (void)__MPModelPropertyPodcastEpisodeUserRating__MAPPING_MISSING__;
+ (void)__MPModelRelationshipPodcastEpisodeAuthor__MAPPING_MISSING__;
+ (void)__MPModelRelationshipPodcastEpisodeLocalFileAsset__MAPPING_MISSING__;
+ (void)__MPModelRelationshipPodcastEpisodePlaybackPosition__MAPPING_MISSING__;
+ (void)__MPModelRelationshipPodcastEpisodePodcast__MAPPING_MISSING__;
- (NSString)commentText;
- (id)artworkCatalog;
- (id)humanDescription;
- (void)setCommentText:(id)a3;
@end

@implementation MPModelPodcastEpisode

+ (id)__userRating_KEY
{
  return @"MPModelPropertyPodcastEpisodeUserRating";
}

+ (id)__transcriptSource_KEY
{
  return @"MPModelPropertyPodcastEpisodeTranscriptSource";
}

+ (id)__transcriptIdentifier_KEY
{
  return @"MPModelPropertyPodcastEpisodeTranscriptIdentifier";
}

+ (id)__transcriptAlignments_KEY
{
  return @"MPModelPropertyPodcastEpisodeTranscriptAlignments";
}

+ (id)__title_KEY
{
  return @"MPModelPropertyPodcastEpisodeTitle";
}

+ (id)__streamURL_KEY
{
  return @"MPModelPropertyPodcastEpisodeStreamURL";
}

+ (id)__state_KEY
{
  return @"MPModelPropertyPodcastEpisodeState";
}

+ (id)__showArtworkTemplateURL_KEY
{
  return @"MPModelPropertyPodcastEpisodeShowArtworkTemplateURL";
}

+ (id)__shouldShowChapterArtwork_KEY
{
  return @"MPModelPropertyPodcastEpisodeShouldShowChapterArtwork";
}

+ (id)__shareURL_KEY
{
  return @"MPModelPropertyPodcastEpisodeShareURL";
}

+ (id)__seasonNumber_KEY
{
  return @"MPModelPropertyPodcastEpisodeSeasonNumber";
}

+ (id)__releaseDateComponents_KEY
{
  return @"MPModelPropertyPodcastEpisodeReleaseDateComponents";
}

+ (id)__priceType_KEY
{
  return @"MPModelPropertyPodcastEpisodePriceType";
}

+ (id)__podcast_KEY
{
  return @"MPModelRelationshipPodcastEpisodePodcast";
}

+ (id)__podcastStoreID_KEY
{
  return @"MPModelPropertyPodcastEpisodePodcastStoreID";
}

+ (id)__playbackPosition_KEY
{
  return @"MPModelRelationshipPodcastEpisodePlaybackPosition";
}

+ (id)__mediaType_KEY
{
  return @"MPModelPropertyPodcastEpisodeMediaType";
}

+ (id)__localFileAsset_KEY
{
  return @"MPModelRelationshipPodcastEpisodeLocalFileAsset";
}

+ (id)__itemType_KEY
{
  return @"MPModelPropertyPodcastEpisodeItemType";
}

+ (id)__hasVideo_KEY
{
  return @"MPModelPropertyPodcastEpisodeHasVideo";
}

+ (id)__feedURL_KEY
{
  return @"MPModelPropertyPodcastEpisodeFeedURL";
}

+ (id)__externalContentID_KEY
{
  return @"MPModelPropertyPodcastEpisodeExternalContentID";
}

+ (id)__explicitEpisode_KEY
{
  return @"MPModelPropertyPodcastEpisodeExplicit";
}

+ (id)__episodeType_KEY
{
  return @"MPModelPropertyPodcastEpisodeType";
}

+ (id)__episodeNumber_KEY
{
  return @"MPModelPropertyPodcastEpisodeNumber";
}

+ (id)__duration_KEY
{
  return @"MPModelPropertyPodcastEpisodeDuration";
}

+ (id)__descriptionText_KEY
{
  return @"MPModelPropertyPodcastEpisodeDescriptionText";
}

+ (id)__datePlayed_KEY
{
  return @"MPModelPropertyPodcastEpisodeDatePlayed";
}

+ (id)__chapters_KEY
{
  return @"MPModelPropertyPodcastEpisodeChapters";
}

+ (id)__author_KEY
{
  return @"MPModelRelationshipPodcastEpisodeAuthor";
}

+ (id)__assetURL_KEY
{
  return @"MPModelPropertyPodcastEpisodeAssetURL";
}

+ (id)__artworkInfo_KEY
{
  return @"MPModelPropertyPodcastEpisodeArtworkInfo";
}

+ (id)__artworkCatalogBlock_KEY
{
  return @"MPModelPropertyPodcastEpisodeArtwork";
}

+ (int64_t)genericObjectType
{
  return 12;
}

- (void).cxx_destruct
{
}

- (void)setCommentText:(id)a3
{
}

- (NSString)commentText
{
  return self->_commentText;
}

- (id)artworkCatalog
{
  uint64_t v3 = [(MPModelPodcastEpisode *)self artworkCatalogBlock];
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(void (**)(uint64_t, MPModelPodcastEpisode *))(v3 + 16))(v3, self);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)humanDescription
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = [(MPModelObject *)self identifiers];
  v5 = [v4 humanDescription];
  v6 = [v3 stringWithFormat:@"podcast episode %@", v5];

  if ([(MPModelObject *)self hasLoadedValueForKey:@"MPModelPropertyPodcastEpisodeTitle"])
  {
    v7 = NSString;
    v8 = [(MPModelPodcastEpisode *)self title];
    v9 = [v7 stringWithFormat:@"“%@” ", v8];

    [v6 insertString:v9 atIndex:0];
  }

  return v6;
}

+ (void)__MPModelPropertyPodcastEpisodeShouldShowChapterArtwork__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcastEpisode.m" lineNumber:135 description:@"Translator was missing mapping for MPModelPropertyPodcastEpisodeShouldShowChapterArtwork"];
}

+ (void)__MPModelPropertyPodcastEpisodeTranscriptAlignments__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcastEpisode.m" lineNumber:134 description:@"Translator was missing mapping for MPModelPropertyPodcastEpisodeTranscriptAlignments"];
}

+ (void)__MPModelPropertyPodcastEpisodeChapters__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcastEpisode.m" lineNumber:133 description:@"Translator was missing mapping for MPModelPropertyPodcastEpisodeChapters"];
}

+ (void)__MPModelPropertyPodcastEpisodeTranscriptSource__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcastEpisode.m" lineNumber:132 description:@"Translator was missing mapping for MPModelPropertyPodcastEpisodeTranscriptSource"];
}

+ (void)__MPModelPropertyPodcastEpisodeTranscriptIdentifier__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcastEpisode.m" lineNumber:131 description:@"Translator was missing mapping for MPModelPropertyPodcastEpisodeTranscriptIdentifier"];
}

+ (void)__MPModelPropertyPodcastEpisodeArtworkInfo__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcastEpisode.m" lineNumber:130 description:@"Translator was missing mapping for MPModelPropertyPodcastEpisodeArtworkInfo"];
}

+ (void)__MPModelPropertyPodcastEpisodeShowArtworkTemplateURL__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcastEpisode.m" lineNumber:129 description:@"Translator was missing mapping for MPModelPropertyPodcastEpisodeShowArtworkTemplateURL"];
}

+ (void)__MPModelPropertyPodcastEpisodeExternalContentID__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcastEpisode.m" lineNumber:128 description:@"Translator was missing mapping for MPModelPropertyPodcastEpisodeExternalContentID"];
}

+ (void)__MPModelPropertyPodcastEpisodePodcastStoreID__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcastEpisode.m" lineNumber:127 description:@"Translator was missing mapping for MPModelPropertyPodcastEpisodePodcastStoreID"];
}

+ (void)__MPModelPropertyPodcastEpisodePriceType__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcastEpisode.m" lineNumber:126 description:@"Translator was missing mapping for MPModelPropertyPodcastEpisodePriceType"];
}

+ (void)__MPModelPropertyPodcastEpisodeMediaType__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcastEpisode.m" lineNumber:125 description:@"Translator was missing mapping for MPModelPropertyPodcastEpisodeMediaType"];
}

+ (void)__MPModelPropertyPodcastEpisodeItemType__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcastEpisode.m" lineNumber:124 description:@"Translator was missing mapping for MPModelPropertyPodcastEpisodeItemType"];
}

+ (void)__MPModelPropertyPodcastEpisodeAssetURL__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcastEpisode.m" lineNumber:123 description:@"Translator was missing mapping for MPModelPropertyPodcastEpisodeAssetURL"];
}

+ (void)__MPModelPropertyPodcastEpisodeFeedURL__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcastEpisode.m" lineNumber:122 description:@"Translator was missing mapping for MPModelPropertyPodcastEpisodeFeedURL"];
}

+ (void)__MPModelPropertyPodcastEpisodeState__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcastEpisode.m" lineNumber:121 description:@"Translator was missing mapping for MPModelPropertyPodcastEpisodeState"];
}

+ (void)__MPModelPropertyPodcastEpisodeArtwork__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcastEpisode.m" lineNumber:120 description:@"Translator was missing mapping for MPModelPropertyPodcastEpisodeArtwork"];
}

+ (void)__MPModelRelationshipPodcastEpisodePlaybackPosition__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcastEpisode.m" lineNumber:119 description:@"Translator was missing mapping for MPModelRelationshipPodcastEpisodePlaybackPosition"];
}

+ (void)__MPModelRelationshipPodcastEpisodeAuthor__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcastEpisode.m" lineNumber:118 description:@"Translator was missing mapping for MPModelRelationshipPodcastEpisodeAuthor"];
}

+ (void)__MPModelRelationshipPodcastEpisodePodcast__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcastEpisode.m" lineNumber:117 description:@"Translator was missing mapping for MPModelRelationshipPodcastEpisodePodcast"];
}

+ (void)__MPModelRelationshipPodcastEpisodeLocalFileAsset__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcastEpisode.m" lineNumber:116 description:@"Translator was missing mapping for MPModelRelationshipPodcastEpisodeLocalFileAsset"];
}

+ (void)__MPModelPropertyPodcastEpisodeSeasonNumber__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcastEpisode.m" lineNumber:115 description:@"Translator was missing mapping for MPModelPropertyPodcastEpisodeSeasonNumber"];
}

+ (void)__MPModelPropertyPodcastEpisodeNumber__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcastEpisode.m" lineNumber:114 description:@"Translator was missing mapping for MPModelPropertyPodcastEpisodeNumber"];
}

+ (void)__MPModelPropertyPodcastEpisodeType__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcastEpisode.m" lineNumber:113 description:@"Translator was missing mapping for MPModelPropertyPodcastEpisodeType"];
}

+ (void)__MPModelPropertyPodcastEpisodeShareURL__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcastEpisode.m" lineNumber:112 description:@"Translator was missing mapping for MPModelPropertyPodcastEpisodeShareURL"];
}

+ (void)__MPModelPropertyPodcastEpisodeStreamURL__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcastEpisode.m" lineNumber:111 description:@"Translator was missing mapping for MPModelPropertyPodcastEpisodeStreamURL"];
}

+ (void)__MPModelPropertyPodcastEpisodeDatePlayed__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcastEpisode.m" lineNumber:110 description:@"Translator was missing mapping for MPModelPropertyPodcastEpisodeDatePlayed"];
}

+ (void)__MPModelPropertyPodcastEpisodeDescriptionText__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcastEpisode.m" lineNumber:109 description:@"Translator was missing mapping for MPModelPropertyPodcastEpisodeDescriptionText"];
}

+ (void)__MPModelPropertyPodcastEpisodeHasVideo__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcastEpisode.m" lineNumber:108 description:@"Translator was missing mapping for MPModelPropertyPodcastEpisodeHasVideo"];
}

+ (void)__MPModelPropertyPodcastEpisodeExplicit__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcastEpisode.m" lineNumber:107 description:@"Translator was missing mapping for MPModelPropertyPodcastEpisodeExplicit"];
}

+ (void)__MPModelPropertyPodcastEpisodeUserRating__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcastEpisode.m" lineNumber:106 description:@"Translator was missing mapping for MPModelPropertyPodcastEpisodeUserRating"];
}

+ (void)__MPModelPropertyPodcastEpisodeDuration__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcastEpisode.m" lineNumber:105 description:@"Translator was missing mapping for MPModelPropertyPodcastEpisodeDuration"];
}

+ (void)__MPModelPropertyPodcastEpisodeReleaseDateComponents__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcastEpisode.m" lineNumber:104 description:@"Translator was missing mapping for MPModelPropertyPodcastEpisodeReleaseDateComponents"];
}

+ (void)__MPModelPropertyPodcastEpisodeTitle__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcastEpisode.m" lineNumber:103 description:@"Translator was missing mapping for MPModelPropertyPodcastEpisodeTitle"];
}

+ (id)kindWithVariants:(unint64_t)a3 options:(unint64_t)a4
{
  return +[MPModelPodcastEpisodeKind kindWithVariants:a3 options:a4];
}

+ (id)kindWithVariants:(unint64_t)a3
{
  return (id)[a1 kindWithVariants:a3 options:0];
}

@end