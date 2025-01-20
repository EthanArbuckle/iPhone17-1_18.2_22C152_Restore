@interface FMFGenericResponseHandler
- (_TtC7FMFCore25FMFGenericResponseHandler)init;
- (void)dealloc;
- (void)didUpdateFences:(id)a3;
@end

@implementation FMFGenericResponseHandler

- (void)didUpdateFences:(id)a3
{
  if (a3)
  {
    sub_21CA05908(0, &qword_267C96EA8);
    sub_21CA622C0();
    uint64_t v4 = sub_21CB88730();
  }
  else
  {
    uint64_t v4 = 0;
  }
  v5 = self;
  FMFGenericResponseHandler.didUpdate(_:)(v4);

  swift_bridgeObjectRelease();
}

- (void)dealloc
{
  v2 = self;
  FMFGenericResponseHandler.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_21CA640FC((uint64_t)self + OBJC_IVAR____TtC7FMFCore25FMFGenericResponseHandler_delegate);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7FMFCore25FMFGenericResponseHandler_secureLocationsManager);
}

- (_TtC7FMFCore25FMFGenericResponseHandler)init
{
  result = (_TtC7FMFCore25FMFGenericResponseHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end