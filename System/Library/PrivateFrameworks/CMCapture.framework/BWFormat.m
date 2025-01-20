@interface BWFormat
+ (id)formatByResolvingRequirements:(id)a3;
+ (id)formatByResolvingRequirements:(id)a3 printErrors:(BOOL)a4;
- (opaqueCMFormatDescription)formatDescription;
- (unsigned)mediaType;
@end

@implementation BWFormat

+ (id)formatByResolvingRequirements:(id)a3
{
}

+ (id)formatByResolvingRequirements:(id)a3 printErrors:(BOOL)a4
{
}

- (unsigned)mediaType
{
  return 0;
}

- (opaqueCMFormatDescription)formatDescription
{
  return 0;
}

@end