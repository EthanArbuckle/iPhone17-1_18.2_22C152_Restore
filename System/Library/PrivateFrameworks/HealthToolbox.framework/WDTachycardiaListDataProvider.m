@interface WDTachycardiaListDataProvider
- (id)_heartEventType;
@end

@implementation WDTachycardiaListDataProvider

- (id)_heartEventType
{
  return (id)[MEMORY[0x263F0A158] tachycardiaType];
}

@end