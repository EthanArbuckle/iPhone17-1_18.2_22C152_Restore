@interface NSDictionary(GEOURLExtras)
- (GEOPlace)_placeOrCurrentLocation:()GEOURLExtras;
@end

@implementation NSDictionary(GEOURLExtras)

- (GEOPlace)_placeOrCurrentLocation:()GEOURLExtras
{
  if (a3) {
    *a3 = 0;
  }
  v5 = [a1 objectForKey:@"currentloc"];

  if (v5)
  {
    v6 = 0;
    if (a3) {
      *a3 = 1;
    }
  }
  else
  {
    v6 = [[GEOPlace alloc] initWithUrlRepresentation:a1];
  }

  return v6;
}

@end