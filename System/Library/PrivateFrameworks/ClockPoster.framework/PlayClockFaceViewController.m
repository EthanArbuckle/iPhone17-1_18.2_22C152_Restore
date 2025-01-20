@interface PlayClockFaceViewController
- (_TtC11ClockPoster27PlayClockFaceViewController)initWithCoder:(id)a3;
- (void)viewDidLoad;
@end

@implementation PlayClockFaceViewController

- (_TtC11ClockPoster27PlayClockFaceViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC11ClockPoster27PlayClockFaceViewController_clockFace;
  type metadata accessor for PlayClockFaceView();
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC11ClockPoster27PlayClockFaceViewController *)sub_24A057BC8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26974F450);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = (objc_class *)type metadata accessor for PlayClockFaceViewController();
  v13.receiver = self;
  v13.super_class = v6;
  id v7 = self;
  [(ClockFaceViewController *)&v13 viewDidLoad];
  uint64_t v8 = sub_24A057628();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_24A057608();
  swift_retain();
  uint64_t v10 = sub_24A0575F8();
  v11 = (void *)swift_allocObject();
  uint64_t v12 = MEMORY[0x263F8F500];
  v11[2] = v10;
  v11[3] = v12;
  v11[4] = v9;
  swift_release();
  sub_24A04CE18((uint64_t)v5, (uint64_t)&unk_269751BA8, (uint64_t)v11);

  swift_release();
}

- (void).cxx_destruct
{
  sub_249F75BD8((uint64_t)self + OBJC_IVAR____TtC11ClockPoster27PlayClockFaceViewController_look);
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11ClockPoster27PlayClockFaceViewController_clockFace);
}

@end