@interface WKSPInterfaceMapView
- (void)setCurrentLocation;
- (void)setEnabled:(BOOL)a3;
@end

@implementation WKSPInterfaceMapView

- (void)setCurrentLocation
{
}

- (void)setEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(WKSPInterfaceObject *)self _sendValueChanged:v4 forProperty:@"enabled"];
}

@end