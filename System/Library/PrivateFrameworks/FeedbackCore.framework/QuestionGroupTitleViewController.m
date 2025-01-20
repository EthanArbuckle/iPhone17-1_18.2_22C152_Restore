@interface QuestionGroupTitleViewController
+ (id)viewWithTitle:(id)a3;
- (_TtC12FeedbackCore32QuestionGroupTitleViewController)initWithCoder:(id)a3;
- (_TtC12FeedbackCore32QuestionGroupTitleViewController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation QuestionGroupTitleViewController

+ (id)viewWithTitle:(id)a3
{
  uint64_t v3 = sub_22A4B3458();
  _s12FeedbackCore32QuestionGroupTitleViewControllerC4view5titleSo6UIViewCSS_tFZ_0(v3, v4);
  v6 = v5;
  swift_bridgeObjectRelease();

  return v6;
}

- (_TtC12FeedbackCore32QuestionGroupTitleViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  v11.super_class = (Class)type metadata accessor for QuestionGroupTitleViewController();
  v9 = [(QuestionGroupTitleViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC12FeedbackCore32QuestionGroupTitleViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for QuestionGroupTitleViewController();
  return [(QuestionGroupTitleViewController *)&v5 initWithCoder:a3];
}

@end