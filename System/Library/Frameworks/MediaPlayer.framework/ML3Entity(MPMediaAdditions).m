@interface ML3Entity(MPMediaAdditions)
+ (id)propertyForMPMediaEntityProperty:()MPMediaAdditions;
+ (id)spotlightPropertyForMPMediaEntityProperty:()MPMediaAdditions;
@end

@implementation ML3Entity(MPMediaAdditions)

+ (id)propertyForMPMediaEntityProperty:()MPMediaAdditions
{
  uint64_t v3 = propertyForMPMediaEntityProperty__once;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&propertyForMPMediaEntityProperty__once, &__block_literal_global_26493);
  }
  v5 = [(id)propertyForMPMediaEntityProperty__ML3ForMP objectForKeyedSubscript:v4];

  return v5;
}

+ (id)spotlightPropertyForMPMediaEntityProperty:()MPMediaAdditions
{
  uint64_t v3 = spotlightPropertyForMPMediaEntityProperty__once;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&spotlightPropertyForMPMediaEntityProperty__once, &__block_literal_global_2);
  }
  v5 = [(id)spotlightPropertyForMPMediaEntityProperty__ML3ForMP objectForKeyedSubscript:v4];

  return v5;
}

@end