@interface WFPodcastEpisodeObject
+ (BOOL)supportsSecureCoding;
+ (id)JSONKeyPathsByPropertyKey;
+ (id)allowedSecureCodingClassesByPropertyKey;
+ (id)descriptionTextJSONTransformer;
+ (id)durationJSONTransformer;
+ (id)releaseDateJSONTransformer;
- (NSArray)genres;
- (NSDate)releaseDate;
- (NSNumber)episodeNumber;
- (NSString)artworkURLTemplate;
- (NSString)author;
- (NSString)descriptionText;
- (NSString)identifier;
- (NSString)title;
- (NSURL)feedURL;
- (NSURL)viewURL;
- (WFTimeInterval)duration;
@end

@implementation WFPodcastEpisodeObject

+ (id)releaseDateJSONTransformer
{
  return (id)[MEMORY[0x263F87058] releaseDateJSONTransformer];
}

+ (id)durationJSONTransformer
{
  return (id)[MEMORY[0x263F87050] durationJSONTransformer];
}

+ (id)descriptionTextJSONTransformer
{
  return (id)[MEMORY[0x263F86848] transformerUsingForwardBlock:&__block_literal_global_47429];
}

id __56__WFPodcastEpisodeObject_descriptionTextJSONTransformer__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 objectForKey:@"attributes.description.standard"];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v2 objectForKey:@"attributes.description.short"];
  }
  v6 = v5;

  return v6;
}

+ (id)JSONKeyPathsByPropertyKey
{
  v5[11] = *MEMORY[0x263EF8340];
  v4[0] = @"identifier";
  v4[1] = @"title";
  v5[0] = @"id";
  v5[1] = @"attributes.name";
  v4[2] = @"author";
  v4[3] = @"descriptionText";
  v5[2] = @"attributes.artistName";
  v5[3] = &unk_26F076980;
  v4[4] = @"genres";
  v4[5] = @"duration";
  v5[4] = @"attributes.genreNames";
  v5[5] = @"attributes.durationInMilliseconds";
  v4[6] = @"episodeNumber";
  v4[7] = @"releaseDate";
  v5[6] = @"attributes.episodeNumber";
  v5[7] = @"attributes.releaseDateTime";
  v4[8] = @"viewURL";
  v4[9] = @"feedURL";
  v5[8] = @"attributes.url";
  v5[9] = @"attributes.feedUrl";
  v4[10] = @"artworkURLTemplate";
  v5[10] = @"attributes.artwork.url";
  id v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:11];
  return v2;
}

+ (id)allowedSecureCodingClassesByPropertyKey
{
  v7[2] = *MEMORY[0x263EF8340];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WFPodcastEpisodeObject;
  id v2 = objc_msgSendSuper2(&v6, sel_allowedSecureCodingClassesByPropertyKey);
  v3 = (void *)[v2 mutableCopy];

  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  [v3 setObject:v4 forKey:@"genres"];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkURLTemplate, 0);
  objc_storeStrong((id *)&self->_feedURL, 0);
  objc_storeStrong((id *)&self->_viewURL, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_episodeNumber, 0);
  objc_storeStrong((id *)&self->_genres, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)artworkURLTemplate
{
  return self->_artworkURLTemplate;
}

- (NSURL)feedURL
{
  return self->_feedURL;
}

- (NSURL)viewURL
{
  return self->_viewURL;
}

- (WFTimeInterval)duration
{
  return self->_duration;
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (NSNumber)episodeNumber
{
  return self->_episodeNumber;
}

- (NSArray)genres
{
  return self->_genres;
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (NSString)author
{
  return self->_author;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)identifier
{
  return self->_identifier;
}

@end