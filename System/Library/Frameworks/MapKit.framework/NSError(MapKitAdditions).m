@interface NSError(MapKitAdditions)
- (id)_mapkit_locationErrorSettingsURL;
- (uint64_t)_mapkit_isCLDenied;
- (uint64_t)_mapkit_isCLErrorNetwork;
- (uint64_t)_mapkit_isCLHeadingFailure;
- (uint64_t)_mapkit_isCLLocationUnknown;
@end

@implementation NSError(MapKitAdditions)

- (uint64_t)_mapkit_isCLDenied
{
  if ([a1 code] != 1) {
    return 0;
  }
  v2 = [a1 domain];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4F1E6C8]];

  return v3;
}

- (uint64_t)_mapkit_isCLLocationUnknown
{
  if ([a1 code]) {
    return 0;
  }
  uint64_t v3 = [a1 domain];
  uint64_t v4 = [v3 isEqualToString:*MEMORY[0x1E4F1E6C8]];

  return v4;
}

- (uint64_t)_mapkit_isCLHeadingFailure
{
  if ([a1 code] != 3) {
    return 0;
  }
  v2 = [a1 domain];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4F1E6C8]];

  return v3;
}

- (uint64_t)_mapkit_isCLErrorNetwork
{
  if ([a1 code] != 2) {
    return 0;
  }
  v2 = [a1 domain];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4F1E6C8]];

  return v3;
}

- (id)_mapkit_locationErrorSettingsURL
{
  v2 = [a1 domain];
  int v3 = [v2 isEqualToString:MKLocationErrorDomain];

  if (v3 && (unint64_t v4 = [a1 code], v4 <= 6) && ((0x5Fu >> v4) & 1) != 0)
  {
    v5 = [MEMORY[0x1E4F1CB10] URLWithString:off_1E54BB6D0[v4]];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end