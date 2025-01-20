@interface NSError(MapsSharedExtras)
+ (uint64_t)_maps_cancellationError;
- (BOOL)_maps_isCancellation;
- (BOOL)_maps_isErrorOfDomain:()MapsSharedExtras code:;
@end

@implementation NSError(MapsSharedExtras)

+ (uint64_t)_maps_cancellationError
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
}

- (BOOL)_maps_isCancellation
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:*MEMORY[0x1E4F281F8]]) {
    BOOL v3 = [a1 code] == 3072;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)_maps_isErrorOfDomain:()MapsSharedExtras code:
{
  id v6 = a3;
  v7 = [a1 domain];
  int v8 = [v7 isEqualToString:v6];

  if (v8) {
    BOOL v9 = [a1 code] == a4;
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

@end