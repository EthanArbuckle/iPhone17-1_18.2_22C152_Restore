@interface HRConceptTitleTableHeaderView
- (HRConceptTitleTableHeaderView)initWithCoder:(id)a3;
- (HRConceptTitleTableHeaderView)initWithFrame:(CGRect)a3;
- (NSString)title;
- (void)setTitle:(id)a3;
@end

@implementation HRConceptTitleTableHeaderView

- (NSString)title
{
  v2 = (char *)self + OBJC_IVAR___HRConceptTitleTableHeaderView_title;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1C254F430();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1C254F470();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___HRConceptTitleTableHeaderView_title);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  v8 = self;
  swift_bridgeObjectRelease();
  sub_1C2544DB0();
}

- (HRConceptTitleTableHeaderView)initWithFrame:(CGRect)a3
{
  return (HRConceptTitleTableHeaderView *)ConceptTitleTableHeaderView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (HRConceptTitleTableHeaderView)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR___HRConceptTitleTableHeaderView_titleLabel;
  id v5 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)sub_1C2544A04();
  uint64_t v6 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___HRConceptTitleTableHeaderView_title);
  *uint64_t v6 = 0;
  v6[1] = 0;

  result = (HRConceptTitleTableHeaderView *)sub_1C25505F0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end