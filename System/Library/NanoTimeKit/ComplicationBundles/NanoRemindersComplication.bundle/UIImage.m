@interface UIImage
+ (id)ttr_placeholderForInvalidImage;
@end

@implementation UIImage

+ (id)ttr_placeholderForInvalidImage
{
  return +[UIImage systemImageNamed:@"questionmark.diamond.fill"];
}

@end