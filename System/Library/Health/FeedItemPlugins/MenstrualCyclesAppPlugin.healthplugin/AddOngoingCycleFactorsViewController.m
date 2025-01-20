@interface AddOngoingCycleFactorsViewController
- (void)dealloc;
- (void)doneButtonTapped;
- (void)nextButtonTapped:(id)a3;
- (void)respondToContentSizeChanges;
- (void)skipButtonTapped:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AddOngoingCycleFactorsViewController

- (void)dealloc
{
  v2 = self;
  sub_2415B1718();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_2412F4CFC(*(unint64_t *)((char *)&self->super.super.super.super.super.super.super.super.isa
                                    + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36AddOngoingCycleFactorsViewController_presentationContext));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36AddOngoingCycleFactorsViewController____lazy_storage___lastPeriodViewController));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36AddOngoingCycleFactorsViewController_healthStore);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_2415B18CC(a3);
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(OBTableWelcomeController *)&v3 viewDidLayoutSubviews];
  sub_241552A14();
}

- (void)viewDidLoad
{
  id v2 = self;
  sub_2415B1A58();
}

- (void)respondToContentSizeChanges
{
  id v2 = self;
  sub_241552A14();
}

- (void)skipButtonTapped:(id)a3
{
}

- (void)nextButtonTapped:(id)a3
{
}

- (void)doneButtonTapped
{
  id v2 = self;
  sub_2415B3A14();
}

@end