@interface PlayerFSM
- (NSDictionary)stateDictionary;
- (void)resetWithReason:(id)a3;
@end

@implementation PlayerFSM

- (NSDictionary)stateDictionary
{
  swift_retain();
  sub_21BC94514();
  swift_release();
  v2 = (void *)sub_21BEAA088();
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2;
}

- (void)resetWithReason:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_21BC96FA8();
  swift_release();
}

@end