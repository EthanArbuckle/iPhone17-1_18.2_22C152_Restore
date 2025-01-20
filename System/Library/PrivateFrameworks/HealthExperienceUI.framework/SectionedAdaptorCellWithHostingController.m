@interface SectionedAdaptorCellWithHostingController
- (_TtC18HealthExperienceUI41SectionedAdaptorCellWithHostingController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI41SectionedAdaptorCellWithHostingController)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SectionedAdaptorCellWithHostingController

- (_TtC18HealthExperienceUI41SectionedAdaptorCellWithHostingController)initWithFrame:(CGRect)a3
{
  v3 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI41SectionedAdaptorCellWithHostingController_item;
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((void *)v3 + 4) = 0;

  result = (_TtC18HealthExperienceUI41SectionedAdaptorCellWithHostingController *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI41SectionedAdaptorCellWithHostingController)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI41SectionedAdaptorCellWithHostingController_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC18HealthExperienceUI41SectionedAdaptorCellWithHostingController *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1AD73CDB0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD73CD90();
  v8 = self;
  sub_1AD2D8A84();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SectionedAdaptorCellWithHostingController();
  uint64_t v4 = (char *)v9.receiver;
  id v5 = a3;
  [(SectionedAdaptorCellWithHostingController *)&v9 traitCollectionDidChange:v5];
  uint64_t v6 = (id *)&v4[OBJC_IVAR____TtC18HealthExperienceUI41SectionedAdaptorCellWithHostingController_hostingController];
  swift_beginAccess();
  id v7 = objc_msgSend(*v6, sel_view);
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, sel_invalidateIntrinsicContentSize);
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  sub_1AD206D18((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI41SectionedAdaptorCellWithHostingController_item, (unint64_t *)&qword_1EB73E880, (unint64_t *)&qword_1EB73E870);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI41SectionedAdaptorCellWithHostingController_hostingController);
}

@end