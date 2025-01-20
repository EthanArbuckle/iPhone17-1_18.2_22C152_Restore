@interface FBAResponseHeaderCell
- (NSLayoutConstraint)leadingConstraint;
- (NSLayoutConstraint)topConstraint;
- (UIImageView)contactImageView;
- (UILabel)dateLabel;
- (UILabel)nameLabel;
- (UILabel)roleLabel;
- (UIView)roleView;
- (_TtC18Feedback_Assistant21FBAResponseHeaderCell)initWithCoder:(id)a3;
- (_TtC18Feedback_Assistant21FBAResponseHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (int64_t)selectionStyle;
- (void)awakeFromNib;
- (void)configureAssigneeForContentItem:(id)a3;
- (void)configureForAppleFeedbackWithFollowup:(id)a3;
- (void)configureForContentItem:(id)a3;
- (void)configureForFollowup:(id)a3;
- (void)prepareForReuse;
- (void)setContactImageView:(id)a3;
- (void)setDateLabel:(id)a3;
- (void)setLeadingConstraint:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setRoleLabel:(id)a3;
- (void)setRoleView:(id)a3;
- (void)setSelectionStyle:(int64_t)a3;
- (void)setTopConstraint:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FBAResponseHeaderCell

- (UILabel)nameLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_nameLabel));
}

- (void)setNameLabel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_nameLabel);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_nameLabel) = (Class)a3;
  id v3 = a3;
}

- (UILabel)dateLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_dateLabel));
}

- (void)setDateLabel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_dateLabel);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_dateLabel) = (Class)a3;
  id v3 = a3;
}

- (UIImageView)contactImageView
{
  return (UIImageView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_contactImageView));
}

- (void)setContactImageView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_contactImageView);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_contactImageView) = (Class)a3;
  id v3 = a3;
}

- (UIView)roleView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                           + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_roleView));
}

- (void)setRoleView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_roleView);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_roleView) = (Class)a3;
  id v3 = a3;
}

- (UILabel)roleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_roleLabel));
}

- (void)setRoleLabel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_roleLabel);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_roleLabel) = (Class)a3;
  id v3 = a3;
}

- (NSLayoutConstraint)leadingConstraint
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (NSLayoutConstraint *)Strong;
}

- (void)setLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)topConstraint
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (NSLayoutConstraint *)Strong;
}

- (void)setTopConstraint:(id)a3
{
}

- (void)traitCollectionDidChange:(id)a3
{
  v7 = self;
  id v4 = a3;
  id v5 = [(FBAResponseHeaderCell *)v7 traitCollection];
  id v6 = [v5 userInterfaceStyle];

  if (!v4 || v6 != [v4 userInterfaceStyle]) {
    sub_10009B31C();
  }
}

- (void)awakeFromNib
{
  v2 = self;
  sub_10009B44C();
}

- (void)configureForContentItem:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10009B8E4(v4);
}

- (void)configureForFollowup:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10009BB28(v4);
}

- (void)configureAssigneeForContentItem:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10009C414(v4);
}

- (void)configureForAppleFeedbackWithFollowup:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10009C748(v4);
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FBAResponseHeaderCell();
  id v2 = v3.receiver;
  [(FBAResponseHeaderCell *)&v3 prepareForReuse];
  [v2 setSelectionStyle:0];
  [v2 setAccessoryType:0];
  *((unsigned char *)v2 + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_roleState) = 0;
  sub_10009A9BC();
}

- (int64_t)selectionStyle
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FBAResponseHeaderCell();
  return [(FBAResponseHeaderCell *)&v3 selectionStyle];
}

- (void)setSelectionStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FBAResponseHeaderCell();
  id v4 = v6.receiver;
  [(FBAResponseHeaderCell *)&v6 setSelectionStyle:a3];
  if (objc_msgSend(v4, "selectionStyle", v6.receiver, v6.super_class)) {
    UIAccessibilityTraits v5 = UIAccessibilityTraitButton;
  }
  else {
    UIAccessibilityTraits v5 = 0;
  }
  [v4 setAccessibilityTraits:v5];
}

- (_TtC18Feedback_Assistant21FBAResponseHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC18Feedback_Assistant21FBAResponseHeaderCell *)sub_10009CDCC(a3, (uint64_t)a4, v6);
}

- (_TtC18Feedback_Assistant21FBAResponseHeaderCell)initWithCoder:(id)a3
{
  return (_TtC18Feedback_Assistant21FBAResponseHeaderCell *)sub_10009CF1C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_nameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_dateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_contactImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_roleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_roleLabel));
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_roleCenteringConstraint);
}

@end