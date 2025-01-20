@interface DropletGroupView
- (_TtC9DropletUI16DropletGroupView)initWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation DropletGroupView

- (_TtC9DropletUI16DropletGroupView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24D12C0A0();
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (a4)
  {
    uint64_t v6 = sub_24D149268();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  id v9 = a3;
  v10 = self;
  sub_24D12C1A4(v6, v8);

  swift_bridgeObjectRelease();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_24D129528();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9DropletUI16DropletGroupView____lazy_storage___mainEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9DropletUI16DropletGroupView____lazy_storage___shadowEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9DropletUI16DropletGroupView____lazy_storage___blurredKeylineEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9DropletUI16DropletGroupView____lazy_storage___keylineEffectView));
  swift_bridgeObjectRelease();
}

@end