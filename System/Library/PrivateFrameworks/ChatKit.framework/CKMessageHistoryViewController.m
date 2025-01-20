@interface CKMessageHistoryViewController
- (BOOL)dateSelection:(id)a3 canSelectDate:(id)a4;
- (CKMessageHistoryViewController)initWithCoder:(id)a3;
- (CKMessageHistoryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CKMessageHistoryViewControllerDataSource)messageHistoryDataSource;
- (CKMessageHistoryViewControllerDelegate)messageHistoryDelegate;
- (id)calendarView:(id)a3 decorationForDateComponents:(id)a4;
- (void)calendarView:(id)a3 didChangeVisibleDateComponentsFrom:(id)a4;
- (void)dateSelection:(id)a3 didSelectDate:(id)a4;
- (void)setMessageHistoryDataSource:(id)a3;
- (void)setMessageHistoryDelegate:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CKMessageHistoryViewController

- (CKMessageHistoryViewControllerDelegate)messageHistoryDelegate
{
  return (CKMessageHistoryViewControllerDelegate *)sub_18F569D50((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CKMessageHistoryViewController_messageHistoryDelegate);
}

- (void)setMessageHistoryDelegate:(id)a3
{
}

- (CKMessageHistoryViewControllerDataSource)messageHistoryDataSource
{
  return (CKMessageHistoryViewControllerDataSource *)sub_18F569D50((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CKMessageHistoryViewController_messageHistoryDataSource);
}

- (void)setMessageHistoryDataSource:(id)a3
{
}

- (void)viewDidLoad
{
  v2 = self;
  sub_18F7479D8();
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MessageHistoryViewController();
  id v2 = v6.receiver;
  [(CKMessageHistoryViewController *)&v6 viewDidLayoutSubviews];
  id v3 = sub_18F7478FC();
  objc_msgSend(v3, sel_intrinsicContentSize, v6.receiver, v6.super_class);
  double v5 = v4;

  objc_msgSend(v2, sel_setPreferredContentSize_, -1.0, v5);
}

- (CKMessageHistoryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_18F7B97E0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (CKMessageHistoryViewController *)MessageHistoryViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (CKMessageHistoryViewController)initWithCoder:(id)a3
{
  return (CKMessageHistoryViewController *)MessageHistoryViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR___CKMessageHistoryViewController_messageHistoryDelegate);
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR___CKMessageHistoryViewController_messageHistoryDataSource);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKMessageHistoryViewController_messageHistoryForVisibleDateComponents));
  sub_18EF27FE8((uint64_t)self + OBJC_IVAR___CKMessageHistoryViewController_oldestMessageDate, &qword_1E922ABB0);
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___CKMessageHistoryViewController____lazy_storage___calendarView);
}

- (id)calendarView:(id)a3 decorationForDateComponents:(id)a4
{
  uint64_t v6 = sub_18F7B5E80();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18F7B5DE0();
  id v10 = a3;
  v11 = self;
  id v12 = sub_18F74A95C();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)calendarView:(id)a3 didChangeVisibleDateComponentsFrom:(id)a4
{
  uint64_t v6 = sub_18F7B5E80();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18F7B5DE0();
  id v10 = a3;
  v11 = self;
  _s7ChatKit28MessageHistoryViewControllerC08calendarE0_34didChangeVisibleDateComponentsFromySo010UICalendarE0C_10Foundation0kL0VtF_0();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)dateSelection:(id)a3 didSelectDate:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9240EB0);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_18F7B5DE0();
    uint64_t v10 = sub_18F7B5E80();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = sub_18F7B5E80();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  id v12 = a3;
  v13 = self;
  sub_18F74ADA4((uint64_t)v9);

  sub_18EF27FE8((uint64_t)v9, &qword_1E9240EB0);
}

- (BOOL)dateSelection:(id)a3 canSelectDate:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9240EB0);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_18F7B5DE0();
    uint64_t v10 = sub_18F7B5E80();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = sub_18F7B5E80();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  id v12 = a3;
  v13 = self;
  BOOL v14 = sub_18F74B2DC((uint64_t)v9);

  sub_18EF27FE8((uint64_t)v9, &qword_1E9240EB0);
  return v14;
}

@end