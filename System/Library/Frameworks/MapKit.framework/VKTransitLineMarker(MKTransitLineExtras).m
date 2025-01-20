@interface VKTransitLineMarker(MKTransitLineExtras)
- (MKMapItemIdentifier)mapItemIdentifier;
- (id)shieldColorString;
- (uint64_t)artworkSourceType;
- (uint64_t)artworkUseType;
- (uint64_t)hasRoutingIncidentBadge;
- (uint64_t)iconDataSource;
- (uint64_t)iconFallbackShieldDataSource;
- (uint64_t)textDataSource;
@end

@implementation VKTransitLineMarker(MKTransitLineExtras)

- (MKMapItemIdentifier)mapItemIdentifier
{
  v2 = [MKMapItemIdentifier alloc];
  v3 = [a1 identifier];
  v4 = [(MKMapItemIdentifier *)v2 initWithGEOMapItemIdentifier:v3];

  return v4;
}

- (uint64_t)artworkSourceType
{
  return 1;
}

- (uint64_t)artworkUseType
{
  return 0;
}

- (uint64_t)iconDataSource
{
  return 0;
}

- (uint64_t)iconFallbackShieldDataSource
{
  return 0;
}

- (uint64_t)textDataSource
{
  return 0;
}

- (uint64_t)hasRoutingIncidentBadge
{
  return 0;
}

- (id)shieldColorString
{
  v2 = NSString;
  [a1 shieldColor];
  v4 = objc_msgSend(v2, "stringWithFormat:", @"%.2X", (float)(v3 * 255.0));
  v5 = NSString;
  [a1 shieldColor];
  v7 = objc_msgSend(v5, "stringWithFormat:", @"%.2X", (float)(v6 * 255.0));
  v8 = NSString;
  [a1 shieldColor];
  v10 = objc_msgSend(v8, "stringWithFormat:", @"%.2X", (float)(v9 * 255.0));
  v11 = NSString;
  [a1 shieldColor];
  v13 = objc_msgSend(v11, "stringWithFormat:", @"%.2X", (float)(v12 * 255.0));
  v14 = [NSString stringWithFormat:@"%@%@%@%@", v4, v7, v10, v13];

  return v14;
}

@end