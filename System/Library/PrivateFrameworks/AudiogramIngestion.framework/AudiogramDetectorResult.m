@interface AudiogramDetectorResult
- (NSArray)symbols;
- (_TtC18AudiogramIngestion23AudiogramDetectorResult)init;
- (_TtC18AudiogramIngestion23AudiogramDetectorResult)initWithGraph:(id)a3 symbols:(id)a4;
- (_TtC18AudiogramIngestion28AudiogramGraphDetectorResult)graph;
@end

@implementation AudiogramDetectorResult

- (_TtC18AudiogramIngestion28AudiogramGraphDetectorResult)graph
{
  return (_TtC18AudiogramIngestion28AudiogramGraphDetectorResult *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC18AudiogramIngestion23AudiogramDetectorResult_graph);
}

- (NSArray)symbols
{
  type metadata accessor for AudiogramSymbolDetectorResult();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_23F120E40();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (_TtC18AudiogramIngestion23AudiogramDetectorResult)initWithGraph:(id)a3 symbols:(id)a4
{
  type metadata accessor for AudiogramSymbolDetectorResult();
  v6 = (objc_class *)sub_23F120E60();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18AudiogramIngestion23AudiogramDetectorResult_graph) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18AudiogramIngestion23AudiogramDetectorResult_symbols) = v6;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AudiogramDetectorResult();
  id v7 = a3;
  return [(AudiogramDetectorResult *)&v9 init];
}

- (_TtC18AudiogramIngestion23AudiogramDetectorResult)init
{
  result = (_TtC18AudiogramIngestion23AudiogramDetectorResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end