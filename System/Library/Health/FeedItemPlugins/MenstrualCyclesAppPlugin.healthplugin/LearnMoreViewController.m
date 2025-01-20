@interface LearnMoreViewController
- (_TtC24MenstrualCyclesAppPlugin23LearnMoreViewController)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin23LearnMoreViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)doneAndDismiss;
@end

@implementation LearnMoreViewController

- (_TtC24MenstrualCyclesAppPlugin23LearnMoreViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23LearnMoreViewController____lazy_storage___doneBarButtonItem) = 0;
  id v4 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin23LearnMoreViewController *)sub_241633038();
  __break(1u);
  return result;
}

- (void)doneAndDismiss
{
  v5 = self;
  v2 = (_TtC24MenstrualCyclesAppPlugin23LearnMoreViewController *)[(LearnMoreViewController *)v5 presentingViewController];
  if (v2)
  {
    v3 = v2;
    [(LearnMoreViewController *)v2 dismissViewControllerAnimated:1 completion:0];

    id v4 = v3;
  }
  else
  {
    id v4 = v5;
  }
}

- (_TtC24MenstrualCyclesAppPlugin23LearnMoreViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC24MenstrualCyclesAppPlugin23LearnMoreViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23LearnMoreViewController____lazy_storage___doneBarButtonItem));
}

@end