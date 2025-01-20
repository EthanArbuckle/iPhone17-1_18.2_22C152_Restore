@interface APUISystemApertureView
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC18ActivityProgressUI22APUISystemApertureView)init;
- (_TtC18ActivityProgressUI22APUISystemApertureView)initWithCoder:(id)a3;
- (_TtC18ActivityProgressUI22APUISystemApertureView)initWithFrame:(CGRect)a3;
@end

@implementation APUISystemApertureView

- (_TtC18ActivityProgressUI22APUISystemApertureView)init
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ActivityProgressUI22APUISystemApertureView_expanded) = 0;
  if (qword_100056DD0 != -1) {
    swift_once();
  }
  double v3 = *(double *)&static APUISystemApertureView.compactDimension;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for APUISystemApertureView();
  return -[APUISystemApertureView initWithFrame:](&v5, "initWithFrame:", 0.0, 0.0, v3, v3);
}

- (_TtC18ActivityProgressUI22APUISystemApertureView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ActivityProgressUI22APUISystemApertureView_expanded) = 0;
  id v4 = a3;

  result = (_TtC18ActivityProgressUI22APUISystemApertureView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x58);
  id v4 = self;
  if (v3())
  {
    uint64_t v5 = 0x40482AA9930BE0DFLL;
  }
  else
  {
    if (qword_100056DD0 != -1) {
      swift_once();
    }
    uint64_t v5 = static APUISystemApertureView.compactDimension;
  }

  double v6 = *(double *)&v5;
  double v7 = *(double *)&v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  uint64_t v5 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x58);
  double v6 = self;
  if (v5())
  {
    uint64_t v7 = 0x40482AA9930BE0DFLL;
  }
  else
  {
    if (qword_100056DD0 != -1) {
      swift_once();
    }
    uint64_t v7 = static APUISystemApertureView.compactDimension;
  }

  double v8 = *(double *)&v7;
  double v9 = *(double *)&v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4
{
  if ((unint64_t)(a4 + 1) >= 3 && (unint64_t)(a4 - 2) > 1)
  {
    uint64_t v7 = 0x40482AA9930BE0DFLL;
  }
  else
  {
    uint64_t v5 = qword_100056DD0;
    double v6 = self;
    if (v5 != -1) {
      swift_once();
    }
    uint64_t v7 = static APUISystemApertureView.compactDimension;
  }
  double v8 = *(double *)&v7;
  double v9 = *(double *)&v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC18ActivityProgressUI22APUISystemApertureView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC18ActivityProgressUI22APUISystemApertureView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end