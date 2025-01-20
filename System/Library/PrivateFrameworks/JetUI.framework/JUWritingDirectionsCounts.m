@interface JUWritingDirectionsCounts
+ (JUWritingDirectionsCounts)zero;
+ (id)add:(id)a3 to:(id)a4;
- (BOOL)hasStronglyTypedCounts;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRTLEnough;
- (BOOL)isRTLMinimal;
- (JUWritingDirectionsCounts)init;
- (JUWritingDirectionsCounts)initWithNatural:(unint64_t)a3 leftToRight:(unint64_t)a4 rightToLeft:(unint64_t)a5;
- (NSString)description;
- (unint64_t)leftToRight;
- (unint64_t)natural;
- (unint64_t)rightToLeft;
- (unint64_t)significantValues;
- (unint64_t)total;
@end

@implementation JUWritingDirectionsCounts

- (unint64_t)natural
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___JUWritingDirectionsCounts_natural);
}

- (unint64_t)leftToRight
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___JUWritingDirectionsCounts_leftToRight);
}

- (unint64_t)rightToLeft
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___JUWritingDirectionsCounts_rightToLeft);
}

- (unint64_t)total
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___JUWritingDirectionsCounts_total);
}

- (unint64_t)significantValues
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___JUWritingDirectionsCounts_significantValues);
}

- (BOOL)hasStronglyTypedCounts
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___JUWritingDirectionsCounts_hasStronglyTypedCounts);
}

- (BOOL)isRTLEnough
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___JUWritingDirectionsCounts_isRTLEnough);
}

- (BOOL)isRTLMinimal
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___JUWritingDirectionsCounts_isRTLMinimal);
}

- (JUWritingDirectionsCounts)initWithNatural:(unint64_t)a3 leftToRight:(unint64_t)a4 rightToLeft:(unint64_t)a5
{
  return (JUWritingDirectionsCounts *)WritingDirectionsCounts.init(natural:leftToRight:rightToLeft:)((char *)a3, a4, a5);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B086A438();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = sub_1B07F6850((uint64_t)v8);

  sub_1B07B86F8((uint64_t)v8);
  return v6;
}

+ (id)add:(id)a3 to:(id)a4
{
  v5 = (char *)a3;
  id v6 = a4;
  v7 = sub_1B07F72C8(v5, (uint64_t)v6);

  return v7;
}

+ (JUWritingDirectionsCounts)zero
{
  if (qword_1E9B3A690 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1E9B3B320;

  return (JUWritingDirectionsCounts *)v2;
}

- (NSString)description
{
  v2 = self;
  sub_1B07F6C40();

  v3 = (void *)sub_1B0869D68();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (JUWritingDirectionsCounts)init
{
  result = (JUWritingDirectionsCounts *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end