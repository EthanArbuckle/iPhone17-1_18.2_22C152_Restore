@interface NavdDoomNavigationStateFilter
- (BOOL)shouldPresentAlertForDestination:(id)a3;
@end

@implementation NavdDoomNavigationStateFilter

- (BOOL)shouldPresentAlertForDestination:(id)a3
{
  return _MNCurrentNavigationStateAllowsDoom(self, a2, a3);
}

@end