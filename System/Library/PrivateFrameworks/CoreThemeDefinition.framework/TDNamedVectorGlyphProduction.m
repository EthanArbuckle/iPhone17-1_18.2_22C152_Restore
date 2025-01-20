@interface TDNamedVectorGlyphProduction
+ (id)fetchRequest;
@end

@implementation TDNamedVectorGlyphProduction

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"NamedVectorGlyphProduction"];
}

@end