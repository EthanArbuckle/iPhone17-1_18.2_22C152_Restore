@interface AUAClockSelectorControl
- (BOOL)changeValues:(const unsigned int *)a3 withCount:(int64_t)a4;
- (_TtC9AUASDCore23AUAClockSelectorControl)initWithIsSettable:(BOOL)a3 forElement:(unsigned int)a4 inScope:(unsigned int)a5 withPlugin:(id)a6 andObjectClassID:(unsigned int)a7;
- (void)selectionDidChange:(id)a3;
@end

@implementation AUAClockSelectorControl

- (BOOL)changeValues:(const unsigned int *)a3 withCount:(int64_t)a4
{
  return [(AUAClockSelectorControl *)self setSelectedValues:a3 withCount:a4];
}

- (void)selectionDidChange:(id)a3
{
  if (a3)
  {
    sub_10002D95C();
    v4 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    v4 = 0;
  }
  v5 = self;
  v7.value._rawValue = v4;
  AUAClockSelectorControl.selectionDidChange(_:)(v7);

  swift_bridgeObjectRelease();
}

- (_TtC9AUASDCore23AUAClockSelectorControl)initWithIsSettable:(BOOL)a3 forElement:(unsigned int)a4 inScope:(unsigned int)a5 withPlugin:(id)a6 andObjectClassID:(unsigned int)a7
{
  id v7 = a6;
  result = (_TtC9AUASDCore23AUAClockSelectorControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end