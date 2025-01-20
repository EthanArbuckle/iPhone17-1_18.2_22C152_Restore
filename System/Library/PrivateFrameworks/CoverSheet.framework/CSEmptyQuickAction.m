@interface CSEmptyQuickAction
- (BOOL)allowsInteraction;
- (BOOL)isSelected;
- (BOOL)showsButton;
- (BOOL)supportsSelection;
- (id)selectedSymbolName;
@end

@implementation CSEmptyQuickAction

- (BOOL)supportsSelection
{
  return 0;
}

- (BOOL)isSelected
{
  return 0;
}

- (id)selectedSymbolName
{
  return @"questionmark.app.fill";
}

- (BOOL)showsButton
{
  return 0;
}

- (BOOL)allowsInteraction
{
  return 0;
}

@end