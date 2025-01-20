@interface BiometricInterface
+ (_TtC12ClarityBoard18BiometricInterface)sharedInstance;
- (BOOL)needsAuthentication;
- (_TtC12ClarityBoard18BiometricInterface)init;
- (void)forceBioLockout;
- (void)setNeedsAuthentication:(BOOL)a3;
@end

@implementation BiometricInterface

+ (_TtC12ClarityBoard18BiometricInterface)sharedInstance
{
  if (qword_10017B588 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1001864B0;

  return (_TtC12ClarityBoard18BiometricInterface *)v2;
}

- (void)forceBioLockout
{
  v2 = self;
  sub_100052B60();
}

- (BOOL)needsAuthentication
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC12ClarityBoard18BiometricInterface_needsAuthentication);
}

- (void)setNeedsAuthentication:(BOOL)a3
{
  v4 = self;
  sub_1000530D4(a3);
}

- (_TtC12ClarityBoard18BiometricInterface)init
{
  return (_TtC12ClarityBoard18BiometricInterface *)sub_100053158();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12ClarityBoard18BiometricInterface_matchOperation);
}

@end