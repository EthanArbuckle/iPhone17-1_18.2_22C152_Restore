@interface _SwiftPanicCriterials
- (_SwiftPanicCriterials)initWithCriterials:(id)a3 :(id)a4 :(id)a5 :(id)a6;
- (_SwiftPanicCriterials)initWithInfo:(id)a3 :(id)a4 :(id)a5;
@end

@implementation _SwiftPanicCriterials

- (_SwiftPanicCriterials)initWithCriterials:(id)a3 :(id)a4 :(id)a5 :(id)a6
{
  uint64_t v6 = sub_24B3D9F98();
  uint64_t v8 = v7;
  uint64_t v9 = sub_24B3D9F98();
  uint64_t v11 = v10;
  uint64_t v12 = sub_24B3D9F98();
  uint64_t v14 = v13;
  uint64_t v15 = sub_24B3D9F98();
  return (_SwiftPanicCriterials *)PanicCriterials.init(id:type:path:panicString:)(v6, v8, v9, v11, v12, v14, v15, v16);
}

- (_SwiftPanicCriterials)initWithInfo:(id)a3 :(id)a4 :(id)a5
{
  result = (_SwiftPanicCriterials *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end