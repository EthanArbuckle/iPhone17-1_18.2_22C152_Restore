@interface CardStackSubviewContainer
- (UIView)containedView;
- (_TtC11Diagnostics25CardStackSubviewContainer)initWithCoder:(id)a3;
- (_TtC11Diagnostics25CardStackSubviewContainer)initWithFrame:(CGRect)a3;
- (void)setContainedView:(id)a3;
@end

@implementation CardStackSubviewContainer

- (UIView)containedView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                           + OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_containedView));
}

- (void)setContainedView:(id)a3
{
  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_containedView);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_containedView) = (Class)a3;
  id v6 = a3;
  v5 = self;
  sub_1000E77F0(v4);
  sub_1000E7C4C();
}

- (_TtC11Diagnostics25CardStackSubviewContainer)initWithFrame:(CGRect)a3
{
  return (_TtC11Diagnostics25CardStackSubviewContainer *)sub_1000E80C8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11Diagnostics25CardStackSubviewContainer)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics25CardStackSubviewContainer *)sub_1000E81AC(a3);
}

- (void).cxx_destruct
{
  sub_10003B0B8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_containedViewRemovedCompletion));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_topContainerConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_bottomContainerConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_leadingContainerConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_trailingContainerConstraint));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_containedView);
}

@end