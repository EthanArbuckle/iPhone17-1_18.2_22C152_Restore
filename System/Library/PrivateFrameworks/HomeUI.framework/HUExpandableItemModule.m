@interface HUExpandableItemModule
- (BOOL)showOptions;
- (HFItem)showOptionsItem;
- (void)setShowOptions:(BOOL)a3;
@end

@implementation HUExpandableItemModule

- (HFItem)showOptionsItem
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HUExpandableItemModule.m", 15, @"%s is an abstract method that must be overriden by subclass %@", "-[HUExpandableItemModule showOptionsItem]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (BOOL)showOptions
{
  return self->_showOptions;
}

- (void)setShowOptions:(BOOL)a3
{
  self->_showOptions = a3;
}

@end