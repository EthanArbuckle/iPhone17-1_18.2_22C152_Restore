@interface DMCProfileAbstractViewController
- (BOOL)canBeShownFromSuspendedState;
- (DMCProfileAbstractViewController)init;
- (void)dealloc;
- (void)updateExtendedLayoutIncludesOpaqueBars;
@end

@implementation DMCProfileAbstractViewController

- (DMCProfileAbstractViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)DMCProfileAbstractViewController;
  return [(DMCProfileAbstractViewController *)&v3 init];
}

- (void)dealloc
{
  objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)DMCProfileAbstractViewController;
  [(DMCProfileAbstractViewController *)&v4 dealloc];
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (void)updateExtendedLayoutIncludesOpaqueBars
{
  id v3 = [MEMORY[0x263F5FBC0] appearance];
  -[DMCProfileAbstractViewController setExtendedLayoutIncludesOpaqueBars:](self, "setExtendedLayoutIncludesOpaqueBars:", [v3 extendedLayoutIncludesOpaqueBars]);
}

@end