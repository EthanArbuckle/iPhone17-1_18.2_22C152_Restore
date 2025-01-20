@interface ReviewOngoingCycleFactorsViewController
- (void)dealloc;
- (void)nextButtonTapped:(id)a3;
- (void)respondToContentSizeChanges;
- (void)skipButtonTapped:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation ReviewOngoingCycleFactorsViewController

- (void)dealloc
{
  v2 = self;
  sub_2415545C4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin39ReviewOngoingCycleFactorsViewController____lazy_storage___ongoingCycleFactorsViewController));

  swift_bridgeObjectRelease();
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
  sub_241555334();
}

- (void)skipButtonTapped:(id)a3
{
}

- (void)nextButtonTapped:(id)a3
{
}

- (void)respondToContentSizeChanges
{
  id v2 = self;
  sub_241552A14();
}

@end