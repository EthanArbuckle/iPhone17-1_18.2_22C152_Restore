@interface WFPinboardAccessResourceUserInterface
- (WFPinboardAccessResourceUserInterface)initWithUserInterfaceType:(id)a3 attribution:(id)a4;
- (void)authorizeWithCompletionHandler:(id)a3;
@end

@implementation WFPinboardAccessResourceUserInterface

- (void)authorizeWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_22BF00810((uint64_t)sub_22BEFD628, v5);

  swift_release();
}

- (WFPinboardAccessResourceUserInterface)initWithUserInterfaceType:(id)a3 attribution:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  return (WFPinboardAccessResourceUserInterface *)sub_22BF00E5C(v5, a4);
}

@end