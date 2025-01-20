@interface FBKAttributedStringViewController
+ (id)viewWithAttributedText:(id)a3;
- (_TtC12FeedbackCore33FBKAttributedStringViewController)initWithCoder:(id)a3;
- (_TtC12FeedbackCore33FBKAttributedStringViewController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation FBKAttributedStringViewController

+ (id)viewWithAttributedText:(id)a3
{
  id v3 = a3;
  _s12FeedbackCore33FBKAttributedStringViewControllerC4view14attributedTextSo6UIViewCSo012NSAttributedD0C_tFZ_0(v3);
  v5 = v4;

  return v5;
}

- (_TtC12FeedbackCore33FBKAttributedStringViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_22A4B3458();
    id v6 = a4;
    v7 = (void *)sub_22A4B3418();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for FBKAttributedStringViewController();
  v9 = [(FBKAttributedStringViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC12FeedbackCore33FBKAttributedStringViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FBKAttributedStringViewController();
  return [(FBKAttributedStringViewController *)&v5 initWithCoder:a3];
}

@end