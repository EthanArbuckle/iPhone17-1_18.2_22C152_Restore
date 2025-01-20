@interface VKLabelMarker(MKTransitArtworkExtras)
- (id)shieldDataSource;
- (uint64_t)artworkSourceType;
- (uint64_t)artworkUseType;
- (uint64_t)hasRoutingIncidentBadge;
- (uint64_t)iconDataSource;
- (uint64_t)iconFallbackShieldDataSource;
- (uint64_t)textDataSource;
@end

@implementation VKLabelMarker(MKTransitArtworkExtras)

- (uint64_t)artworkSourceType
{
  return 1;
}

- (uint64_t)artworkUseType
{
  return 0;
}

- (id)shieldDataSource
{
  v1 = [a1 shields];
  v2 = [v1 firstObject];

  return v2;
}

- (uint64_t)iconDataSource
{
  return 0;
}

- (uint64_t)iconFallbackShieldDataSource
{
  return 0;
}

- (uint64_t)hasRoutingIncidentBadge
{
  return 0;
}

- (uint64_t)textDataSource
{
  return 0;
}

@end