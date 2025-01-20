@interface CoarseRotationManager
- (_TtC19ContactlessReaderUI21CoarseRotationManager)init;
- (void)accelerometer:(id)a3 didChangeDeviceOrientation:(int64_t)a4;
- (void)dealloc;
@end

@implementation CoarseRotationManager

- (_TtC19ContactlessReaderUI21CoarseRotationManager)init
{
  return (_TtC19ContactlessReaderUI21CoarseRotationManager *)sub_23EDCCEFC();
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19ContactlessReaderUI21CoarseRotationManager_accelerometer);
  v3 = self;
  objc_msgSend(v2, sel_setOrientationEventsEnabled_, 0);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for CoarseRotationManager(0);
  [(CoarseRotationManager *)&v4 dealloc];
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC19ContactlessReaderUI21CoarseRotationManager__orientation;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C213D8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19ContactlessReaderUI21CoarseRotationManager_accelerometer);
}

- (void)accelerometer:(id)a3 didChangeDeviceOrientation:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_23EDCE094(a4);
}

@end