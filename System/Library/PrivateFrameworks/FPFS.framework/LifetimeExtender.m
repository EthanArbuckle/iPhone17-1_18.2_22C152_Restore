@interface LifetimeExtender
- (NSString)prettyDescription;
- (_TtC9libfssyncP33_695A112A250415316549FF403B18C66416LifetimeExtender)init;
- (int)requestEffectivePID;
@end

@implementation LifetimeExtender

- (int)requestEffectivePID
{
  return 0;
}

- (NSString)prettyDescription
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_24DCC97B8();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (_TtC9libfssyncP33_695A112A250415316549FF403B18C66416LifetimeExtender)init
{
  *(_DWORD *)((char *)&self->super.isa
            + OBJC_IVAR____TtC9libfssyncP33_695A112A250415316549FF403B18C66416LifetimeExtender_requestEffectivePID) = 0;
  v2 = (char *)self + OBJC_IVAR____TtC9libfssyncP33_695A112A250415316549FF403B18C66416LifetimeExtender_prettyDescription;
  strcpy((char *)self + OBJC_IVAR____TtC9libfssyncP33_695A112A250415316549FF403B18C66416LifetimeExtender_prettyDescription, "FPFS indexer");
  v2[13] = 0;
  *((_WORD *)v2 + 7) = -5120;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for LifetimeExtender();
  return [(LifetimeExtender *)&v4 init];
}

- (void).cxx_destruct
{
}

@end