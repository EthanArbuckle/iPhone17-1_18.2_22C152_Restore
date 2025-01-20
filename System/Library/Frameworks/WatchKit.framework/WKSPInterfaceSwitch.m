@interface WKSPInterfaceSwitch
- (void)setEnabled:(BOOL)a3;
- (void)setOn:(BOOL)a3;
@end

@implementation WKSPInterfaceSwitch

- (void)setOn:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(WKSPInterfaceObject *)self _sendValueChanged:v4];
}

- (void)setEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(WKSPInterfaceObject *)self _sendValueChanged:v4 forProperty:@"enabled"];
}

@end