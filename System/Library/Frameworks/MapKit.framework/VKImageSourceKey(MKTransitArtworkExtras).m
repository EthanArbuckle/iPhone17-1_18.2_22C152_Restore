@interface VKImageSourceKey(MKTransitArtworkExtras)
- (id)iconDataSource;
- (id)shieldColorString;
- (id)shieldDataSource;
- (uint64_t)artworkSourceType;
- (uint64_t)artworkUseType;
- (uint64_t)hasRoutingIncidentBadge;
- (uint64_t)iconFallbackShieldDataSource;
- (uint64_t)iconType;
- (uint64_t)textDataSource;
@end

@implementation VKImageSourceKey(MKTransitArtworkExtras)

- (uint64_t)artworkSourceType
{
  int v1 = [a1 keyType];
  if (v1 == 1) {
    return 1;
  }
  else {
    return 2 * (v1 == 2);
  }
}

- (uint64_t)artworkUseType
{
  return 0;
}

- (id)shieldDataSource
{
  if ([a1 keyType] == 1) {
    v2 = a1;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (id)iconDataSource
{
  if ([a1 keyType] == 2) {
    v2 = a1;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (uint64_t)iconFallbackShieldDataSource
{
  return 0;
}

- (id)shieldColorString
{
  [a1 transitLineColor];
  float v2 = v1;
  float v4 = v3;
  float v6 = v5;
  v8 = objc_msgSend(NSString, "stringWithFormat:", @"%.2X", (float)(v7 * 255.0));
  v9 = objc_msgSend(NSString, "stringWithFormat:", @"%.2X", (float)(v2 * 255.0));
  v10 = objc_msgSend(NSString, "stringWithFormat:", @"%.2X", (float)(v4 * 255.0));
  v11 = objc_msgSend(NSString, "stringWithFormat:", @"%.2X", (float)(v6 * 255.0));
  v12 = [NSString stringWithFormat:@"%@%@%@%@", v8, v9, v10, v11];

  return v12;
}

- (uint64_t)iconType
{
  return 1;
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