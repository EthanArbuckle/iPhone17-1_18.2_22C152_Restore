@interface WFTumblrAccessResourceUserInterface
- (WFTumblrAccessResourceUserInterface)initWithUserInterfaceType:(id)a3 attribution:(id)a4;
- (void)authorizeWithCompletionHandler:(id)a3;
@end

@implementation WFTumblrAccessResourceUserInterface

- (void)authorizeWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_22BF1F364((uint64_t)sub_22BEFD628, v5);

  swift_release();
}

- (WFTumblrAccessResourceUserInterface)initWithUserInterfaceType:(id)a3 attribution:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  return (WFTumblrAccessResourceUserInterface *)sub_22BF1F90C(v5, a4);
}

@end