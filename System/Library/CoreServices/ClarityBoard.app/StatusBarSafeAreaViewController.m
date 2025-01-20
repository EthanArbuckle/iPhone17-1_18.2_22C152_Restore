@interface StatusBarSafeAreaViewController
- (BOOL)_canShowWhileLocked;
- (_TtC12ClarityBoard31StatusBarSafeAreaViewController)initWithCoder:(id)a3;
- (_TtC12ClarityBoard31StatusBarSafeAreaViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)_boundingPathMayHaveChangedForView:(id)a3 relativeToBoundsOriginOnly:(BOOL)a4;
- (void)viewWillLayoutSubviews;
@end

@implementation StatusBarSafeAreaViewController

- (_TtC12ClarityBoard31StatusBarSafeAreaViewController)initWithCoder:(id)a3
{
  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC12ClarityBoard31StatusBarSafeAreaViewController_safeRect);
  _OWORD *v4 = 0u;
  v4[1] = 0u;
  v5 = (char *)self + OBJC_IVAR____TtC12ClarityBoard31StatusBarSafeAreaViewController_maxAllowedSize;
  *(void *)v5 = 0;
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  v6 = (_OWORD *)((char *)self + OBJC_IVAR____TtC12ClarityBoard31StatusBarSafeAreaViewController_cornerRadii);
  _OWORD *v6 = 0u;
  v6[1] = 0u;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC12ClarityBoard31StatusBarSafeAreaViewController_boundingRectRequiresUpdate) = 1;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12ClarityBoard31StatusBarSafeAreaViewController_widthShrinkFraction) = (Class)0x3FE999999999999ALL;
  id v7 = a3;

  result = (_TtC12ClarityBoard31StatusBarSafeAreaViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewWillLayoutSubviews
{
  uint64_t v2 = OBJC_IVAR____TtC12ClarityBoard31StatusBarSafeAreaViewController_boundingRectRequiresUpdate;
  if (*((unsigned char *)&self->super.super.super.isa
       + OBJC_IVAR____TtC12ClarityBoard31StatusBarSafeAreaViewController_boundingRectRequiresUpdate) == 1)
  {
    memset(v10, 0, sizeof(v10));
    char v11 = 1;
    v9 = self;
    sub_10007D13C(0, (uint64_t)v10, 0);
    v4 = (Class *)((char *)&v9->super.super.super.isa
                 + OBJC_IVAR____TtC12ClarityBoard31StatusBarSafeAreaViewController_safeRect);
    void *v4 = v5;
    v4[1] = v6;
    v4[2] = v7;
    v4[3] = v8;
    *((unsigned char *)&self->super.super.super.isa + v2) = 0;
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC12ClarityBoard31StatusBarSafeAreaViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC12ClarityBoard31StatusBarSafeAreaViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)_boundingPathMayHaveChangedForView:(id)a3 relativeToBoundsOriginOnly:(BOOL)a4
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC12ClarityBoard31StatusBarSafeAreaViewController_boundingRectRequiresUpdate) = 1;
  if (a3) {
    [a3 setNeedsLayout];
  }
  else {
    __break(1u);
  }
}

@end