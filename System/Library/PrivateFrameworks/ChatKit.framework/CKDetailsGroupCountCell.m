@interface CKDetailsGroupCountCell
+ (BOOL)shouldHighlight;
+ (double)preferredHeight;
+ (id)reuseIdentifier;
@end

@implementation CKDetailsGroupCountCell

+ (id)reuseIdentifier
{
  return @"CKDetailsGroupCountCell_reuseIdentifier";
}

+ (BOOL)shouldHighlight
{
  return 0;
}

+ (double)preferredHeight
{
  return 22.0;
}

@end