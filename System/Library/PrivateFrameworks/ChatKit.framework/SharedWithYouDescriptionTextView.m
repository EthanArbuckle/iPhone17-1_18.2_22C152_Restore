@interface SharedWithYouDescriptionTextView
- (_TtC7ChatKit32SharedWithYouDescriptionTextView)initWithCoder:(id)a3;
- (_TtC7ChatKit32SharedWithYouDescriptionTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5;
@end

@implementation SharedWithYouDescriptionTextView

- (_TtC7ChatKit32SharedWithYouDescriptionTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  sub_18F714B60(a4, x, y, width, height);
  return result;
}

- (_TtC7ChatKit32SharedWithYouDescriptionTextView)initWithCoder:(id)a3
{
  sub_18F71502C(a3);
  return result;
}

- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = sub_18F715AE8((uint64_t)v9, v10);

  return v12;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit32SharedWithYouDescriptionTextView_footerTextColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit32SharedWithYouDescriptionTextView_learnMoreColor));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit32SharedWithYouDescriptionTextView_footerFont);
}

@end