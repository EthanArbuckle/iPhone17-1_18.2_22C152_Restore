@interface CPSAssistantCell
- (void)configureWithText:(id)a3;
@end

@implementation CPSAssistantCell

- (void)configureWithText:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = (id)[MEMORY[0x263F31350] configurationWithText:location[0]];
  [(CPUIAssistantCell *)v5 applyConfiguration:v3];
  objc_storeStrong(&v3, 0);
  objc_storeStrong(location, 0);
}

@end