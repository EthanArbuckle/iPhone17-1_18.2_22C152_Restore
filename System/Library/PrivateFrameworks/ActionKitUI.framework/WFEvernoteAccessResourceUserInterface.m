@interface WFEvernoteAccessResourceUserInterface
- (WFEvernoteAccessResourceUserInterface)initWithUserInterfaceType:(id)a3 attribution:(id)a4;
- (void)authorizeWithCompletionHandler:(id)a3;
@end

@implementation WFEvernoteAccessResourceUserInterface

- (void)authorizeWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_22BF05038(v5, (void (**)(void, void, void))v4);
  _Block_release(v4);
}

- (WFEvernoteAccessResourceUserInterface)initWithUserInterfaceType:(id)a3 attribution:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  return (WFEvernoteAccessResourceUserInterface *)sub_22BF05674(v5, a4);
}

@end