@interface TouchIDDriverPresenceTestController
- (void)start;
@end

@implementation TouchIDDriverPresenceTestController

- (void)start
{
  if (([(TouchIDDriverPresenceTestController *)self isCancelled] & 1) != 0
    || (+[TouchIDManager runTouchIDDiagnostic:1 options:&__NSDictionary0__struct], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v8 = 0;
  }
  else
  {
    id v8 = (id)v3;
    if (([(TouchIDDriverPresenceTestController *)self isCancelled] & 1) == 0)
    {
      v4 = [v8 objectForKeyedSubscript:@"data"];
      v5 = [(TouchIDDriverPresenceTestController *)self result];
      [v5 setData:v4];

      v6 = [v8 objectForKeyedSubscript:@"testStatus"];
      v7 = [(TouchIDDriverPresenceTestController *)self result];
      [v7 setStatusCode:v6];
    }
  }
  [(TouchIDDriverPresenceTestController *)self setFinished:1];
}

@end