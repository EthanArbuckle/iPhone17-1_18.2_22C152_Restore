@interface FACacheImageMarqueeOperation
- (FACacheImageMarqueeOperation)init;
- (FACacheImageMarqueeOperation)initWithFamilyCircle:(id)a3;
- (void)createAndCacheData;
- (void)generateMarqueeWith:(unint64_t)a3;
@end

@implementation FACacheImageMarqueeOperation

- (FACacheImageMarqueeOperation)initWithFamilyCircle:(id)a3
{
  id v4 = a3;
  v5 = (FACacheImageMarqueeOperation *)sub_218BDEF98(a3);

  return v5;
}

- (void)createAndCacheData
{
  v2 = self;
  sub_218BDB884();
}

- (void)generateMarqueeWith:(unint64_t)a3
{
  id v4 = self;
  sub_218BDDF4C(a3);
}

- (FACacheImageMarqueeOperation)init
{
  result = (FACacheImageMarqueeOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___FACacheImageMarqueeOperation_userDefaults);
}

@end