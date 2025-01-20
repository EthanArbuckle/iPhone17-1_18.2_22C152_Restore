@interface CNContactContainerEditingCell
+ (BOOL)wantsHorizontalLayout;
@end

@implementation CNContactContainerEditingCell

+ (BOOL)wantsHorizontalLayout
{
  return objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory") ^ 1;
}

@end