@interface CPSRouteRowCell
+ (id)identifier;
- (id)preferredFocusEnvironments;
@end

@implementation CPSRouteRowCell

+ (id)identifier
{
  return NSStringFromClass((Class)a1);
}

- (id)preferredFocusEnvironments
{
  v5[1] = *MEMORY[0x263EF8340];
  id v3 = (id)[(CPSRouteRowCell *)self contentView];
  v5[0] = v3;
  id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v4;
}

@end