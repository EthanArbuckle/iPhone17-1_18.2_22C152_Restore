@interface VOTOutputTextComponent
- (void)_handlePerformAction:(id)a3;
- (void)handleEvent:(id)a3;
@end

@implementation VOTOutputTextComponent

- (void)handleEvent:(id)a3
{
  id v6 = a3;
  v4 = [v6 objectForIndex:1];
  unsigned int v5 = [v4 unsignedIntValue];

  if (v5 == 6) {
    [(VOTOutputTextComponent *)self _handlePerformAction:v6];
  }
}

- (void)_handlePerformAction:(id)a3
{
  id v4 = a3;
  id v7 = [v4 objectForIndex:14];
  id v5 = [objc_allocWithZone((Class)AXIndexMap) init];
  [v5 setObject:v7 forIndex:14];
  id v6 = [v4 objectForIndex:13];

  [v5 setObject:v6 forIndex:13];
  [(VOTOutputComponent *)self notifyActionComplete:v5];
}

@end