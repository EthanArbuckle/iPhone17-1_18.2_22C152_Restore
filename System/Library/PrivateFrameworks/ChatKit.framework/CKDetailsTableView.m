@interface CKDetailsTableView
- (BOOL)allowsFooterViewsToFloat;
- (BOOL)allowsHeaderViewsToFloat;
- (int64_t)_sceneDraggingBehaviorOnPan;
@end

@implementation CKDetailsTableView

- (BOOL)allowsHeaderViewsToFloat
{
  return 0;
}

- (BOOL)allowsFooterViewsToFloat
{
  return 0;
}

- (int64_t)_sceneDraggingBehaviorOnPan
{
  return 1;
}

@end