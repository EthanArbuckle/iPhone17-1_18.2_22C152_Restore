@interface AXEventRepresentation
- (BOOL)allowsZoomOrb;
- (void)setAllowsZoomOrb:(BOOL)a3;
@end

@implementation AXEventRepresentation

- (void)setAllowsZoomOrb:(BOOL)a3
{
}

- (BOOL)allowsZoomOrb
{
  return [(AXEventRepresentation *)self _accessibilityBoolValueForKey:@"AllowsZoomOrb"];
}

@end