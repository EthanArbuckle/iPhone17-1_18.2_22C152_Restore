@interface UIView(MULayoutItem)
- (uint64_t)_mapsui_disableTranslatesAutoresizingMaskIntoConstraints;
@end

@implementation UIView(MULayoutItem)

- (uint64_t)_mapsui_disableTranslatesAutoresizingMaskIntoConstraints
{
  return [a1 setTranslatesAutoresizingMaskIntoConstraints:0];
}

@end