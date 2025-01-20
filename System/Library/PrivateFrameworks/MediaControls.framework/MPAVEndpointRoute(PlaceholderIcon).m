@interface MPAVEndpointRoute(PlaceholderIcon)
- (uint64_t)placeholderIcon;
@end

@implementation MPAVEndpointRoute(PlaceholderIcon)

- (uint64_t)placeholderIcon
{
  return [MEMORY[0x1E4F31850] _iconImageForRoute:a1];
}

@end