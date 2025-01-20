@interface HRTimelineHeaderView
+ (NSString)reuseIdentifier;
- (BOOL)floating;
- (BOOL)separatorViewHidden;
- (CGSize)sizeThatFits:(CGSize)a3;
- (HRTimelineHeaderView)initWithCoder:(id)a3;
- (HRTimelineHeaderView)initWithReuseIdentifier:(id)a3;
- (HRTimelineHeaderViewDelegate)delegate;
- (void)applyStyleFromNavigationBar:(id)a3;
- (void)applyTitle:(id)a3 subtitle:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setDelegate:(id)a3;
- (void)setFloating:(BOOL)a3;
- (void)setSeparatorViewHidden:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HRTimelineHeaderView

+ (NSString)reuseIdentifier
{
  swift_getObjCClassMetadata();
  sub_1C2258798();
  v2 = (void *)sub_1C254F430();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (HRTimelineHeaderViewDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___HRTimelineHeaderView_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1C875A200](v2);
  return (HRTimelineHeaderViewDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)separatorViewHidden
{
  v2 = (BOOL *)self + OBJC_IVAR___HRTimelineHeaderView_separatorViewHidden;
  swift_beginAccess();
  return *v2;
}

- (void)setSeparatorViewHidden:(BOOL)a3
{
  v5 = (unsigned __int8 *)self + OBJC_IVAR___HRTimelineHeaderView_separatorViewHidden;
  swift_beginAccess();
  unsigned __int8 *v5 = a3;
  v6 = self;
  id v7 = sub_1C228852C();
  objc_msgSend(v7, sel_setHidden_, *v5);
}

- (HRTimelineHeaderView)initWithReuseIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v3 = sub_1C254F470();
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  return (HRTimelineHeaderView *)TimelineHeaderView.init(reuseIdentifier:)(v3, v4);
}

- (HRTimelineHeaderView)initWithCoder:(id)a3
{
  return (HRTimelineHeaderView *)TimelineHeaderView.init(coder:)(a3);
}

- (void)applyTitle:(id)a3 subtitle:(id)a4
{
  uint64_t v5 = sub_1C254F470();
  uint64_t v7 = v6;
  uint64_t v8 = sub_1C254F470();
  uint64_t v10 = v9;
  v11 = self;
  sub_1C22889F4(v5, v7, v8, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)applyStyleFromNavigationBar:(id)a3
{
  uint64_t v4 = self;
  id v5 = a3;
  id v6 = sub_1C228847C();
  if (v5 && (id v7 = objc_msgSend(v5, sel__backdropViewLayerGroupName)) != 0)
  {
    uint64_t v8 = v7;
    sub_1C254F470();

    id v10 = (id)sub_1C254F430();
    swift_bridgeObjectRelease();
    id v9 = v10;
  }
  else
  {
    id v9 = 0;
  }
  id v11 = v9;
  objc_msgSend(v6, sel__setGroupName_);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1C2288CE4();
}

- (BOOL)floating
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TimelineHeaderView();
  return [(HRTimelineHeaderView *)&v3 floating];
}

- (void)setFloating:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (objc_class *)type metadata accessor for TimelineHeaderView();
  v9.receiver = self;
  v9.super_class = v5;
  id v6 = self;
  char v7 = [(HRTimelineHeaderView *)&v9 floating];
  v8.receiver = v6;
  v8.super_class = v5;
  [(HRTimelineHeaderView *)&v8 setFloating:v3];
  sub_1C2288ED0(v7);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1C2289090();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  uint64_t v4 = self;
  double v5 = sub_1C22894F4(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_1C2289644(a3);
}

- (void).cxx_destruct
{
  sub_1C2201FD8((uint64_t)self + OBJC_IVAR___HRTimelineHeaderView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRTimelineHeaderView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRTimelineHeaderView____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRTimelineHeaderView____lazy_storage___backgroundEffectView));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___HRTimelineHeaderView____lazy_storage___separatorView);
}

@end