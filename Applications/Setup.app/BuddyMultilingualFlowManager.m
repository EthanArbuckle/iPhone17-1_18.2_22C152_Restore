@interface BuddyMultilingualFlowManager
- (BOOL)didMakeSelection;
- (void)setDidMakeSelection:(BOOL)a3;
@end

@implementation BuddyMultilingualFlowManager

- (BOOL)didMakeSelection
{
  return self->didMakeSelection;
}

- (void)setDidMakeSelection:(BOOL)a3
{
  self->didMakeSelection = a3;
}

@end