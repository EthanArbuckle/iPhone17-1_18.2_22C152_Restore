@interface LoggingCardViewController
- (_TtC24MenstrualCyclesAppPlugin25LoggingCardViewController)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin25LoggingCardViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)infoButtonTapped:(id)a3;
- (void)respondToContentSizeChanges;
- (void)viewDidLoad;
@end

@implementation LoggingCardViewController

- (_TtC24MenstrualCyclesAppPlugin25LoggingCardViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25LoggingCardViewController____lazy_storage___footerView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25LoggingCardViewController_alphaValue) = (Class)0x3FF0000000000000;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25LoggingCardViewController_footerHeightConstraint) = 0;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25LoggingCardViewController_flashedScrollIndicatorOnLoad) = 0;
  id v4 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin25LoggingCardViewController *)sub_241633038();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_2411F5E50();
}

- (void)respondToContentSizeChanges
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25LoggingCardViewController_tableView);
  v5 = self;
  objc_msgSend(v2, sel_contentSize);
  sub_2411F54D8(v3, v4);
}

- (void)infoButtonTapped:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2411F6FA0();
}

- (_TtC24MenstrualCyclesAppPlugin25LoggingCardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC24MenstrualCyclesAppPlugin25LoggingCardViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25LoggingCardViewController_displayType));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25LoggingCardViewController_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25LoggingCardViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25LoggingCardViewController____lazy_storage___footerView));
  objc_release(*(id *)((char *)&self->super._navigationItem
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25LoggingCardViewController_configuration));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25LoggingCardViewController_footerHeightConstraint);
}

@end