@interface DataTypeDetailViewControllerWithLoadAction
- (_TtC18HealthExperienceUI42DataTypeDetailViewControllerWithLoadAction)initWithCoder:(id)a3;
- (void)viewDidLoad;
@end

@implementation DataTypeDetailViewControllerWithLoadAction

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD432D64();
}

- (_TtC18HealthExperienceUI42DataTypeDetailViewControllerWithLoadAction)initWithCoder:(id)a3
{
  v5 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC18HealthExperienceUI42DataTypeDetailViewControllerWithLoadAction_onLoadAction);
  void *v5 = 0;
  v5[1] = 0;
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC18HealthExperienceUI42DataTypeDetailViewControllerWithLoadAction_shouldRunLoadAction) = 0;
  v6 = (char *)self
     + OBJC_IVAR____TtC18HealthExperienceUI42DataTypeDetailViewControllerWithLoadAction_onLoadActionContext;
  uint64_t v7 = type metadata accessor for DataTypeDetailViewControllerWithLoadAction.OnLoadActionContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DataTypeDetailViewControllerWithLoadAction(0);
  return [(DataTypeDetailViewController *)&v9 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_1AD1E4514(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC18HealthExperienceUI42DataTypeDetailViewControllerWithLoadAction_onLoadAction));
  v3 = (char *)self
     + OBJC_IVAR____TtC18HealthExperienceUI42DataTypeDetailViewControllerWithLoadAction_onLoadActionContext;
  sub_1AD434208((uint64_t)v3);
}

@end