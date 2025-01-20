@interface WFAccountAccessResourceUserInterface
- (WFAccountAccessResourceUserInterface)initWithUserInterfaceType:(id)a3 attribution:(id)a4;
- (void)authorizeWithAccountClassName:(id)a3 completionHandler:(id)a4;
@end

@implementation WFAccountAccessResourceUserInterface

- (void)authorizeWithAccountClassName:(id)a3 completionHandler:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = sub_22BF5A4C8();
  uint64_t v8 = v7;
  _Block_copy(v5);
  v9 = self;
  sub_22BEFE880(v6, v8, v9, (void (**)(void, void, void))v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (WFAccountAccessResourceUserInterface)initWithUserInterfaceType:(id)a3 attribution:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  return (WFAccountAccessResourceUserInterface *)sub_22BF00270(v5, a4);
}

@end