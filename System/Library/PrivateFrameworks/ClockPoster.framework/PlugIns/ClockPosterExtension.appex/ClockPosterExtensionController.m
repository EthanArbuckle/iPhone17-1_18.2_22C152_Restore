@interface ClockPosterExtensionController
- (_TtC20ClockPosterExtension30ClockPosterExtensionController)init;
- (void)dealloc;
@end

@implementation ClockPosterExtensionController

- (void)dealloc
{
  uint64_t v3 = sub_10000C9D8();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000CA18();
  v7 = self;
  sub_10000C9A8();
  v13 = &OBJC_PROTOCOL___PREditingDelegate;
  uint64_t v8 = swift_dynamicCastObjCProtocolConditional();
  v9 = (unsigned int *)&enum case for ClockLogger.Role.render(_:);
  if (v8) {
    v9 = (unsigned int *)&enum case for ClockLogger.Role.edit(_:);
  }
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *v9, v3);
  sub_10000C9F8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v10 = (objc_class *)type metadata accessor for ClockPosterExtensionController();
  v12.receiver = v7;
  v12.super_class = v10;
  [(ClockPosterExtensionController *)&v12 dealloc];
}

- (void).cxx_destruct
{
}

- (_TtC20ClockPosterExtension30ClockPosterExtensionController)init
{
  return (_TtC20ClockPosterExtension30ClockPosterExtensionController *)sub_100009C40((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC20ClockPosterExtension30ClockPosterExtensionController_clockFaceController, type metadata accessor for ClockPosterExtensionController);
}

@end