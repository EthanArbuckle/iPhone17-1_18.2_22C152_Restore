@interface TabItemCell
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (_NSRange)accessibilityColumnRange;
- (_NSRange)accessibilityRowRange;
- (_TtC13FitnessCoreUI11TabItemCell)initWithCoder:(id)a3;
- (_TtC13FitnessCoreUI11TabItemCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation TabItemCell

- (BOOL)isHighlighted
{
  return sub_24EEB63F0(self, (uint64_t)a2, 22, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v5 = self;
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for TabItemCell();
  [(TabItemCell *)&v6 setHighlighted:v3];
  sub_24EEB62A8();
  swift_release();

  swift_release();
}

- (BOOL)isSelected
{
  return sub_24EEB63F0(self, (uint64_t)a2, 28, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v5 = self;
  sub_24EEB65E4(a3);
  swift_release();
}

- (_TtC13FitnessCoreUI11TabItemCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v7 = TabItemCell.init(frame:)(x, y, width, height);
  swift_release();
  return (_TtC13FitnessCoreUI11TabItemCell *)v7;
}

- (_TtC13FitnessCoreUI11TabItemCell)initWithCoder:(id)a3
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = a3;
  v5 = (_TtC13FitnessCoreUI11TabItemCell *)_s13FitnessCoreUI11TabItemCellC5coderACSgSo7NSCoderC_tcfc_0();
  swift_release();
  return v5;
}

- (void)layoutSubviews
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  BOOL v3 = self;
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for TabItemCell();
  [(TabItemCell *)&v4 layoutSubviews];
  [(TabItemCell *)v3 bounds];
  [(TabItemCell *)v3 _setContinuousCornerRadius:CGRectGetHeight(v5) * 0.5];
  swift_release();

  swift_release();
}

- (void)prepareForReuse
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  BOOL v3 = self;
  sub_24EEB742C();
  swift_release();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_titleLabel));
  sub_24EEB8704((uint64_t)self + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem, (uint64_t)v3);
  sub_24EEB95AC(v3, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_24EEB9548);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentCenterXConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentTrailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentWidthConstraint));
}

- (_NSRange)accessibilityColumnRange
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  BOOL v3 = self;
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = sub_24EEDD260();
  swift_release();

  swift_release();
  NSUInteger v5 = v4;
  NSUInteger v6 = 0;
  result.length = v6;
  result.location = v5;
  return result;
}

- (_NSRange)accessibilityRowRange
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  BOOL v3 = self;
  _NSRange v4 = TabItemCell.accessibilityRowRange()();
  swift_release();

  NSUInteger location = v4.location;
  NSUInteger length = v4.length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

@end