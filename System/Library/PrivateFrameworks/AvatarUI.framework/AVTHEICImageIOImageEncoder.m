@interface AVTHEICImageIOImageEncoder
+ (id)typeIdentifier;
- (id)fileExtension;
@end

@implementation AVTHEICImageIOImageEncoder

+ (id)typeIdentifier
{
  return @"public.heic";
}

- (id)fileExtension
{
  return @"heic";
}

@end