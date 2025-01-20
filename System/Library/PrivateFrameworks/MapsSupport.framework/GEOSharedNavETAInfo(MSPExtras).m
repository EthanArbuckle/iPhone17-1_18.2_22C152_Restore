@interface GEOSharedNavETAInfo(MSPExtras)
- (uint64_t)mspDescription;
@end

@implementation GEOSharedNavETAInfo(MSPExtras)

- (uint64_t)mspDescription
{
  v2 = NSString;
  uint64_t v3 = [a1 waypointIndex];
  [a1 remainingTime];
  uint64_t v5 = (int)(v4 / 60.0);
  [a1 remainingDistance];
  return [v2 stringWithFormat:@"[%lu] remaining (%d min, %d km)", v3, v5, (int)(v6 / 1000.0)];
}

@end