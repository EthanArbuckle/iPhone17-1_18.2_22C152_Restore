@interface BMLocationSemantic_v0
- (int)placeType;
@end

@implementation BMLocationSemantic_v0

- (int)placeType
{
  v4.receiver = self;
  v4.super_class = (Class)BMLocationSemantic_v0;
  unsigned int v2 = [(BMLocationSemantic *)&v4 placeType];
  if (v2 > 3) {
    return 0;
  }
  else {
    return dword_1B35D8014[v2];
  }
}

@end