@interface ICNoteIndicatorUnreadChanges
- (NSString)imageName;
- (UIColor)tintColor;
@end

@implementation ICNoteIndicatorUnreadChanges

- (NSString)imageName
{
  return (NSString *)@"circle.fill";
}

- (UIColor)tintColor
{
  if (UIAccessibilityDarkerSystemColorsEnabled()) {
    +[UIColor ICDarkenedTintColor];
  }
  else {
  v2 = +[UIColor ICListStatusIndicatorColor];
  }

  return (UIColor *)v2;
}

@end