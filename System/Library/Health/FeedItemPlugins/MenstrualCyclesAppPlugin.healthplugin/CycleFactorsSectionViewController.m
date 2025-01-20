@interface CycleFactorsSectionViewController
- (_TtC24MenstrualCyclesAppPlugin33CycleFactorsSectionViewController)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin33CycleFactorsSectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation CycleFactorsSectionViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(CycleFactorsSectionViewController *)&v3 viewDidLoad];
  sub_241447764();
}

- (_TtC24MenstrualCyclesAppPlugin33CycleFactorsSectionViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleFactorsSectionViewController_shouldShowDisclosureIndicator) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleFactorsSectionViewController_cycleFactorsSectionView) = 0;
  id v4 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin33CycleFactorsSectionViewController *)sub_241633038();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin33CycleFactorsSectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC24MenstrualCyclesAppPlugin33CycleFactorsSectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleFactorsSectionViewController_analysis));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleFactorsSectionViewController_cycleFactorsSectionView);
}

@end