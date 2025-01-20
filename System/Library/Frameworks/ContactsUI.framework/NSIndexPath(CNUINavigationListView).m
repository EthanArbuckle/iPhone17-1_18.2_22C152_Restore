@interface NSIndexPath(CNUINavigationListView)
+ (uint64_t)indexPathForNavigationListItemIndex:()CNUINavigationListView;
@end

@implementation NSIndexPath(CNUINavigationListView)

+ (uint64_t)indexPathForNavigationListItemIndex:()CNUINavigationListView
{
  return [MEMORY[0x1E4F28D58] indexPathForRow:a3 inSection:0];
}

@end