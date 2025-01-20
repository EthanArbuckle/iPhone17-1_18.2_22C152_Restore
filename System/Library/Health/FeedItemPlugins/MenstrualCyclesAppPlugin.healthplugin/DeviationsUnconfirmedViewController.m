@interface DeviationsUnconfirmedViewController
- (_TtC24MenstrualCyclesAppPlugin35DeviationsUnconfirmedViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC24MenstrualCyclesAppPlugin35DeviationsUnconfirmedViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)primaryButtonTapped;
- (void)viewDidLoad;
@end

@implementation DeviationsUnconfirmedViewController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  id v2 = v4.receiver;
  [(OBBaseWelcomeController *)&v4 viewDidLoad];
  id v3 = objc_msgSend(v2, sel_navigationItem, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setHidesBackButton_, 1);

  sub_241363378();
  sub_241363618();
}

- (void)primaryButtonTapped
{
  id v2 = self;
  sub_2413639D4();
}

- (_TtC24MenstrualCyclesAppPlugin35DeviationsUnconfirmedViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC24MenstrualCyclesAppPlugin35DeviationsUnconfirmedViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin35DeviationsUnconfirmedViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC24MenstrualCyclesAppPlugin35DeviationsUnconfirmedViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2411CD138((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35DeviationsUnconfirmedViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35DeviationsUnconfirmedViewController____lazy_storage___learnMoreButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35DeviationsUnconfirmedViewController_linkButtonHorizontalConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35DeviationsUnconfirmedViewController____lazy_storage___contentStack);
}

@end