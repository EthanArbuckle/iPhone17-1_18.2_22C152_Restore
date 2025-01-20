@interface TitleHeaderView
- (BOOL)_disableRasterizeInAnimations;
- (BOOL)isAccessibilityElement;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)accessibilityLabel;
- (_TtC18ASMessagesProvider15TitleHeaderView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider15TitleHeaderView)initWithFrame:(CGRect)a3;
- (id)_accessibilitySupplementaryFooterViews;
- (unint64_t)accessibilityTraits;
- (void)didTapWithAccessoryView:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAccessibilityTraits:(unint64_t)a3;
- (void)setIsAccessibilityElement:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TitleHeaderView

- (_TtC18ASMessagesProvider15TitleHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider15TitleHeaderView *)sub_18CE4C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider15TitleHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_19AA68();
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (void)didTapWithAccessoryView:(id)a3
{
  id v3 = *(void (**)(void *))((char *)&self->super.super.super.super.isa
                                       + OBJC_IVAR____TtC18ASMessagesProvider15TitleHeaderView_accessoryAction);
  if (v3)
  {
    v8[3] = sub_FE2C(0, &qword_959F28);
    v8[0] = a3;
    id v6 = a3;
    v7 = self;
    sub_13318((uint64_t)v3);
    v3(v8);
    sub_13308((uint64_t)v3);
    sub_14C88((uint64_t)v8, (uint64_t *)&unk_951B40);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_18ED84(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for TitleHeaderView(0);
  id v4 = a3;
  v5 = (char *)v9.receiver;
  [(TitleHeaderView *)&v9 traitCollectionDidChange:v4];
  double v6 = *(void **)&v5[OBJC_IVAR____TtC18ASMessagesProvider15TitleHeaderView_titleLabel];
  double v7 = *(uint64_t (**)(char *))&v5[OBJC_IVAR____TtC18ASMessagesProvider15TitleHeaderView_titleLabelNumberOfLines];
  swift_retain();
  uint64_t v8 = v7(v5);
  swift_release();
  objc_msgSend(v6, "setNumberOfLines:", v8, v9.receiver, v9.super_class);
  [v5 setNeedsLayout];
}

- (void)layoutSubviews
{
  v2 = self;
  sub_18F20C();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_191FCC();
}

- (NSString)accessibilityLabel
{
  v2 = self;
  sub_192344();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = sub_77D640();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setAccessibilityLabel:(id)a3
{
  if (a3)
  {
    sub_77D670();
    uint64_t v4 = self;
    NSString v5 = sub_77D640();
    swift_bridgeObjectRelease();
  }
  else
  {
    double v6 = self;
    NSString v5 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TitleHeaderView(0);
  [(TitleHeaderView *)&v7 setAccessibilityLabel:v5];
}

- (BOOL)isAccessibilityElement
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider15TitleHeaderView_titleLabel);
  uint64_t v3 = self;
  id v4 = [v2 text];
  if (v4)
  {
    NSString v5 = v4;
    sub_77D670();

    uint64_t v6 = sub_77D770();
    swift_bridgeObjectRelease();
    return v6 > 0;
  }
  else
  {
    v9.receiver = v3;
    v9.super_class = (Class)type metadata accessor for TitleHeaderView(0);
    BOOL v7 = [(TitleHeaderView *)&v9 isAccessibilityElement];
  }
  return v7;
}

- (void)setIsAccessibilityElement:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TitleHeaderView(0);
  [(TitleHeaderView *)&v4 setIsAccessibilityElement:v3];
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitHeader;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TitleHeaderView(0);
  [(TitleHeaderView *)&v4 setAccessibilityTraits:a3];
}

- (id)_accessibilitySupplementaryFooterViews
{
  v2 = self;
  uint64_t v3 = sub_192850();

  if (v3)
  {
    v4.super.isa = sub_77D880().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return v4.super.isa;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider15TitleHeaderView_eyebrowLabel));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider15TitleHeaderView_eyebrowArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider15TitleHeaderView_titleLabel));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider15TitleHeaderView_titleArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider15TitleHeaderView_detailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider15TitleHeaderView_shortDetailLabel));
  sub_19A818((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider15TitleHeaderView_style, type metadata accessor for TitleHeaderView.Style);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider15TitleHeaderView_accessoryView));
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider15TitleHeaderView_accessory, &qword_95E010);
  sub_13308(*(uint64_t *)((char *)&self->super.super.super.super.isa
                       + OBJC_IVAR____TtC18ASMessagesProvider15TitleHeaderView_accessoryAction));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider15TitleHeaderView_separatorLineView);
}

@end