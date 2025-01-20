@interface DeviationsFactorsConfirmationViewController
- (_TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5;
- (_TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6;
- (_TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5;
- (_TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (void)cancel;
- (void)nextButtonTapped;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation DeviationsFactorsConfirmationViewController

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_2414C80F0();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_2414C81F4();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  id v4 = v9.receiver;
  [(OBTableWelcomeController *)&v9 viewWillAppear:v3];
  id v5 = objc_msgSend(v4, sel_view, v9.receiver, v9.super_class);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_setNeedsLayout);

    id v7 = objc_msgSend(v4, sel_view);
    if (v7)
    {
      v8 = v7;
      objc_msgSend(v7, sel_layoutIfNeeded);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

- (void)nextButtonTapped
{
  v2 = self;
  sub_2414C93C4();
}

- (void)cancel
{
  v2 = self;
  sub_2414C97C8();
}

- (_TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  result = (_TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v5 = a5;
  result = (_TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  result = (_TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  id v6 = a5;
  result = (_TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  sub_2411CD138((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController_nextButton));
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)self+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController_scaleFactorConfiguration);

  swift_bridgeObjectRelease();
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_24162BB18();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  objc_super v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162BAA8();
  id v10 = a3;
  v11 = self;
  sub_2414C9E60(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  uint64_t v8 = sub_2414CAE48((char *)a4);

  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  if (*(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController_dataSource))
  {
    id v6 = a3;
    uint64_t v7 = self;
    swift_retain();
    sub_2412CE434(a4);
    uint64_t v9 = v8;
    swift_release();
    swift_bridgeObjectRelease();
    if (v9) {
      double v10 = *MEMORY[0x263F839B8];
    }
    else {
      double v10 = 0.0;
    }

    return v10;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  uint64_t v8 = (void *)sub_2414CA690(v6, a4);

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result = *MEMORY[0x263F839B8];
  if (a4) {
    return 10.0;
  }
  return result;
}

@end