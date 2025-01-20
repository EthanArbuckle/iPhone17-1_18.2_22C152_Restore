@interface _SwiftCriterials
- (_SwiftCriterials)init;
- (_SwiftCriterials)initWithInfo:(id)a3 :(id)a4 :(id)a5;
@end

@implementation _SwiftCriterials

- (_SwiftCriterials)initWithInfo:(id)a3 :(id)a4 :(id)a5
{
  uint64_t v6 = sub_24B3D9F98();
  uint64_t v8 = v7;
  uint64_t v9 = sub_24B3D9F98();
  uint64_t v11 = v10;
  uint64_t v12 = sub_24B3D9F98();
  v13 = (uint64_t *)((char *)self + OBJC_IVAR____SwiftCriterials_incidentID);
  uint64_t *v13 = v6;
  v13[1] = v8;
  v14 = (uint64_t *)((char *)self + OBJC_IVAR____SwiftCriterials_logType);
  uint64_t *v14 = v9;
  v14[1] = v11;
  v15 = (uint64_t *)((char *)self + OBJC_IVAR____SwiftCriterials_panicReportPath);
  uint64_t *v15 = v12;
  v15[1] = v16;
  v18.receiver = self;
  v18.super_class = (Class)type metadata accessor for Criterials();
  return [(_SwiftCriterials *)&v18 init];
}

- (_SwiftCriterials)init
{
  result = (_SwiftCriterials *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end