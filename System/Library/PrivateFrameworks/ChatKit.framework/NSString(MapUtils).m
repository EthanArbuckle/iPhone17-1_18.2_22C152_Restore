@interface NSString(MapUtils)
+ (id)__ck_appleMapsURLStringForCoordinate:()MapUtils coordinateName:;
@end

@implementation NSString(MapUtils)

+ (id)__ck_appleMapsURLStringForCoordinate:()MapUtils coordinateName:
{
  if (a5)
  {
    v7 = (void *)MEMORY[0x1E4F28B88];
    id v8 = a5;
    v9 = [v7 URLPathAllowedCharacterSet];
    v10 = [v8 stringByAddingPercentEncodingWithAllowedCharacters:v9];
  }
  else
  {
    v10 = @"ll";
  }
  v11 = [NSString stringWithFormat:@"http://%@/?%@=%f,%f", @"maps.apple.com", v10, *(void *)&a1, *(void *)&a2];

  return v11;
}

@end