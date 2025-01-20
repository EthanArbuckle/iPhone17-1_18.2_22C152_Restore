@interface MPModelPodcast
+ (id)__artworkCatalogBlock_KEY;
+ (id)__author_KEY;
+ (id)__feedURL_KEY;
+ (id)__shareURL_KEY;
+ (id)__sortType_KEY;
+ (id)__supportsSubscription_KEY;
+ (id)__title_KEY;
+ (id)kindWithEpisodeKind:(id)a3;
+ (int64_t)genericObjectType;
+ (void)__MPModelPropertyPodcastArtwork__MAPPING_MISSING__;
+ (void)__MPModelPropertyPodcastFeedURL__MAPPING_MISSING__;
+ (void)__MPModelPropertyPodcastShareURL__MAPPING_MISSING__;
+ (void)__MPModelPropertyPodcastSortType__MAPPING_MISSING__;
+ (void)__MPModelPropertyPodcastSupportsSubscription__MAPPING_MISSING__;
+ (void)__MPModelPropertyPodcastTitle__MAPPING_MISSING__;
+ (void)__MPModelRelationshipPodcastAuthor__MAPPING_MISSING__;
- (id)artworkCatalog;
- (id)humanDescription;
@end

@implementation MPModelPodcast

+ (id)__title_KEY
{
  return @"MPModelPropertyPodcastTitle";
}

+ (id)__supportsSubscription_KEY
{
  return @"MPModelPropertyPodcastSupportsSubscription";
}

+ (id)__sortType_KEY
{
  return @"MPModelPropertyPodcastSortType";
}

+ (id)__shareURL_KEY
{
  return @"MPModelPropertyPodcastShareURL";
}

+ (id)__feedURL_KEY
{
  return @"MPModelPropertyPodcastFeedURL";
}

+ (id)__author_KEY
{
  return @"MPModelRelationshipPodcastAuthor";
}

+ (id)__artworkCatalogBlock_KEY
{
  return @"MPModelPropertyPodcastArtwork";
}

- (id)artworkCatalog
{
  uint64_t v3 = [(MPModelPodcast *)self artworkCatalogBlock];
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(void (**)(uint64_t, MPModelPodcast *))(v3 + 16))(v3, self);
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
  v6 = [v3 stringWithFormat:@"podcast %@", v5];

  if ([(MPModelObject *)self hasLoadedValueForKey:@"MPModelPropertyPodcastTitle"])
  {
    v7 = NSString;
    v8 = [(MPModelPodcast *)self title];
    v9 = [v7 stringWithFormat:@"“%@” ", v8];

    [v6 insertString:v9 atIndex:0];
  }

  return v6;
}

+ (void)__MPModelPropertyPodcastArtwork__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcast.m" lineNumber:84 description:@"Translator was missing mapping for MPModelPropertyPodcastArtwork"];
}

+ (void)__MPModelRelationshipPodcastAuthor__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcast.m" lineNumber:83 description:@"Translator was missing mapping for MPModelRelationshipPodcastAuthor"];
}

+ (void)__MPModelPropertyPodcastSortType__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcast.m" lineNumber:82 description:@"Translator was missing mapping for MPModelPropertyPodcastSortType"];
}

+ (void)__MPModelPropertyPodcastSupportsSubscription__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcast.m" lineNumber:81 description:@"Translator was missing mapping for MPModelPropertyPodcastSupportsSubscription"];
}

+ (void)__MPModelPropertyPodcastShareURL__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcast.m" lineNumber:80 description:@"Translator was missing mapping for MPModelPropertyPodcastShareURL"];
}

+ (void)__MPModelPropertyPodcastFeedURL__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcast.m" lineNumber:79 description:@"Translator was missing mapping for MPModelPropertyPodcastFeedURL"];
}

+ (void)__MPModelPropertyPodcastTitle__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPodcast.m" lineNumber:78 description:@"Translator was missing mapping for MPModelPropertyPodcastTitle"];
}

+ (id)kindWithEpisodeKind:(id)a3
{
  return +[MPModelPodcastKind kindWithEpisodeKind:a3];
}

+ (int64_t)genericObjectType
{
  return 11;
}

@end