@interface TTRIIntentsSnippetHeaderCell
- (NSLayoutConstraint)topConstraint;
- (UILabel)headingLabel;
- (_TtC21RemindersSiriUIPlugin28TTRIIntentsSnippetHeaderCell)initWithCoder:(id)a3;
- (_TtC21RemindersSiriUIPlugin28TTRIIntentsSnippetHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
- (void)setHeadingLabel:(id)a3;
- (void)setTopConstraint:(id)a3;
@end

@implementation TTRIIntentsSnippetHeaderCell

- (NSLayoutConstraint)topConstraint
{
  return (NSLayoutConstraint *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                       + OBJC_IVAR____TtC21RemindersSiriUIPlugin28TTRIIntentsSnippetHeaderCell_topConstraint));
}

- (void)setTopConstraint:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC21RemindersSiriUIPlugin28TTRIIntentsSnippetHeaderCell_topConstraint);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC21RemindersSiriUIPlugin28TTRIIntentsSnippetHeaderCell_topConstraint) = (Class)a3;
  id v3 = a3;
}

- (UILabel)headingLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC21RemindersSiriUIPlugin28TTRIIntentsSnippetHeaderCell_headingLabel));
}

- (void)setHeadingLabel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC21RemindersSiriUIPlugin28TTRIIntentsSnippetHeaderCell_headingLabel);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC21RemindersSiriUIPlugin28TTRIIntentsSnippetHeaderCell_headingLabel) = (Class)a3;
  id v3 = a3;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(TTRIIntentsSnippetHeaderCell *)&v4 prepareForReuse];
  id v3 = &v2[OBJC_IVAR____TtC21RemindersSiriUIPlugin28TTRIIntentsSnippetHeaderCell_viewModel];
  *(void *)id v3 = 0;
  *((void *)v3 + 1) = 0;
  swift_bridgeObjectRelease();
  sub_80A4();
}

- (_TtC21RemindersSiriUIPlugin28TTRIIntentsSnippetHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_25330();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC21RemindersSiriUIPlugin28TTRIIntentsSnippetHeaderCell *)sub_82C8(a3, (uint64_t)a4, v6);
}

- (_TtC21RemindersSiriUIPlugin28TTRIIntentsSnippetHeaderCell)initWithCoder:(id)a3
{
  return (_TtC21RemindersSiriUIPlugin28TTRIIntentsSnippetHeaderCell *)sub_83E0(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC21RemindersSiriUIPlugin28TTRIIntentsSnippetHeaderCell_topConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC21RemindersSiriUIPlugin28TTRIIntentsSnippetHeaderCell_headingLabel);
}

@end