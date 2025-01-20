@interface PHPersonReference
+ (id)representedType;
@end

@implementation PHPersonReference

+ (id)representedType
{
  return @"com.apple.photos.object-reference.person";
}

@end