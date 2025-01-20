@interface NSMutableURLRequest(NEHotspotHelper)
- (uint64_t)bindToHotspotHelperCommand:()NEHotspotHelper;
@end

@implementation NSMutableURLRequest(NEHotspotHelper)

- (uint64_t)bindToHotspotHelperCommand:()NEHotspotHelper
{
  uint64_t v4 = -[NEHotspotHelperCommand interfaceName](a3);
  if (v4) {
    [a1 setBoundInterfaceIdentifier:v4];
  }

  return MEMORY[0x1F41817F8]();
}

@end