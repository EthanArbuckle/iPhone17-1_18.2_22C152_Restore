@interface WDBradycardiaListDataProvider
- (id)_heartEventType;
@end

@implementation WDBradycardiaListDataProvider

- (id)_heartEventType
{
  return (id)[MEMORY[0x263F0A158] bradycardiaType];
}

@end