@interface _DKEvent(CLSDuetKnowledgeEvent)
- (id)cls_album;
- (id)cls_artist;
- (id)cls_durationInSeconds;
- (id)cls_genre;
- (id)cls_identifier;
- (id)cls_title;
@end

@implementation _DKEvent(CLSDuetKnowledgeEvent)

- (id)cls_identifier
{
  v1 = [a1 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = [v1 stringValue];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)cls_durationInSeconds
{
  v1 = [a1 metadata];
  v2 = [v1 objectForKeyedSubscript:@"_DKNowPlayingMetadataKey-duration"];

  return v2;
}

- (id)cls_genre
{
  v1 = [a1 metadata];
  v2 = [v1 objectForKeyedSubscript:@"_DKNowPlayingMetadataKey-genre"];

  return v2;
}

- (id)cls_title
{
  v1 = [a1 metadata];
  v2 = [v1 objectForKeyedSubscript:@"_DKNowPlayingMetadataKey-title"];

  return v2;
}

- (id)cls_artist
{
  v1 = [a1 metadata];
  v2 = [v1 objectForKeyedSubscript:@"_DKNowPlayingMetadataKey-artist"];

  return v2;
}

- (id)cls_album
{
  v1 = [a1 metadata];
  v2 = [v1 objectForKeyedSubscript:@"_DKNowPlayingMetadataKey-album"];

  return v2;
}

@end