@interface DBCalendarLeafIcon
+ (Class)dataSourceClass;
- (DBCalendarLeafIcon)initWithApplication:(id)a3;
- (void)dealloc;
@end

@implementation DBCalendarLeafIcon

+ (Class)dataSourceClass
{
  return (Class)objc_opt_class();
}

- (DBCalendarLeafIcon)initWithApplication:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DBCalendarLeafIcon;
  v3 = [(DBLeafIcon *)&v6 initWithApplication:a3];
  if (v3)
  {
    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v3 selector:sel__significantTimeChange name:*MEMORY[0x263F83390] object:0];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F83390] object:0];

  v4.receiver = self;
  v4.super_class = (Class)DBCalendarLeafIcon;
  [(SBLeafIcon *)&v4 dealloc];
}

@end