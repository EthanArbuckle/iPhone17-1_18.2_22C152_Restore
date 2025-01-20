@interface MCUIViewController
- (BOOL)canBeShownFromSuspendedState;
- (MCUIViewController)init;
- (void)dealloc;
- (void)updateExtendedLayoutIncludesOpaqueBars;
@end

@implementation MCUIViewController

- (MCUIViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)MCUIViewController;
  return [(MCUIViewController *)&v3 init];
}

- (void)dealloc
{
  objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MCUIViewController;
  [(MCUIViewController *)&v4 dealloc];
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (void)updateExtendedLayoutIncludesOpaqueBars
{
  id v3 = [MEMORY[0x1E4F92E40] appearance];
  -[MCUIViewController setExtendedLayoutIncludesOpaqueBars:](self, "setExtendedLayoutIncludesOpaqueBars:", [v3 extendedLayoutIncludesOpaqueBars]);
}

@end