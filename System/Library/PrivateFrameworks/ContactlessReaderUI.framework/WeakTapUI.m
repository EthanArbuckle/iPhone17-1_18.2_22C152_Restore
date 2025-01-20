@interface WeakTapUI
- (void)closePINUI;
- (void)closePINUIImmediate;
- (void)closeUI;
- (void)closeUIImmediate;
- (void)errorInDaemonWithError:(int64_t)a3;
- (void)requiresCardPIN:(id)a3;
- (void)updateSessionEventWithSessionEvent:(int64_t)a3;
- (void)updateWithTransactionEvent:(int64_t)a3;
- (void)vasReadSuccessWithMerchantNames:(id)a3;
@end

@implementation WeakTapUI

- (void)errorInDaemonWithError:(int64_t)a3
{
}

- (void)updateWithTransactionEvent:(int64_t)a3
{
}

- (void)vasReadSuccessWithMerchantNames:(id)a3
{
  sub_23EF05628();
  uint64_t v4 = MEMORY[0x2455BFAE0](self->ui);
  if (v4)
  {
    v5 = (void *)v4;
    swift_retain();
    v6 = (void *)sub_23EF05618();
    objc_msgSend(v5, sel_vasReadSuccessWithMerchantNames_, v6);
    swift_release();
    swift_bridgeObjectRelease();

    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (void)requiresCardPIN:(id)a3
{
  uint64_t v4 = MEMORY[0x2455BFAE0](self->ui, a2);
  if (v4)
  {
    v5 = (void *)v4;
    id v6 = a3;
    swift_retain();
    objc_msgSend(v5, sel_requiresCardPIN_, v6);

    swift_release();
    swift_unknownObjectRelease();
  }
}

- (void)closeUI
{
}

- (void)closeUIImmediate
{
}

- (void)closePINUI
{
}

- (void)closePINUIImmediate
{
}

- (void)updateSessionEventWithSessionEvent:(int64_t)a3
{
}

@end