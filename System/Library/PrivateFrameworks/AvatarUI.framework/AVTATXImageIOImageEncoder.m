@interface AVTATXImageIOImageEncoder
+ (id)addImageOptions;
+ (id)typeIdentifier;
- (id)fileExtension;
@end

@implementation AVTATXImageIOImageEncoder

+ (id)addImageOptions
{
  return &unk_26BF4D698;
}

- (id)fileExtension
{
  return @"atx";
}

+ (id)typeIdentifier
{
  return @"com.apple.atx";
}

@end