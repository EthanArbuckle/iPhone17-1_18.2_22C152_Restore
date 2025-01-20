@interface TDVectorGlyphImageRenditionSpec
+ (id)fetchRequest;
@end

@implementation TDVectorGlyphImageRenditionSpec

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"VectorGlyphImageRenditionSpec"];
}

@end