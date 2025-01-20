@interface ZoomEffectViewEntry
- (BOOL)canTransitionToEffect:(id)a3;
- (BOOL)shouldAnimateProperty:(id)a3;
- (_TtC9AirDropUIP33_770A69880D158B2CCABA56C42FC2E35A19ZoomEffectViewEntry)init;
- (void)applyIdentityEffectToView:(void *)a3;
- (void)applyRequestedEffectToView:(id)a3;
@end

@implementation ZoomEffectViewEntry

- (BOOL)shouldAnimateProperty:(id)a3
{
  if (static String._unconditionallyBridgeFromObjectiveC(_:)() == 1836019578 && v3 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 1;
  }
  else
  {
    char v4 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
  }
  return v4 & 1;
}

- (void)applyRequestedEffectToView:(id)a3
{
  id v7 = a3;
  char v4 = self;
  id v5 = [v7 layer];
  self;
  v6 = (void *)swift_dynamicCastObjCClass();
  if (v6) {
    [v6 setZoom:*(double *)&v4->_UIVisualEffectViewEntry_opaque[OBJC_IVAR____TtC9AirDropUIP33_770A69880D158B2CCABA56C42FC2E35A19ZoomEffectViewEntry_zoomAmount]];
  }
}

- (void)applyIdentityEffectToView:(void *)a3
{
  id v7 = a3;
  id v4 = a1;
  id v5 = [v7 layer];
  self;
  v6 = (void *)swift_dynamicCastObjCClass();
  if (v6) {
    [v6 setZoom:0.0];
  }
}

- (BOOL)canTransitionToEffect:(id)a3
{
  return 1;
}

- (_TtC9AirDropUIP33_770A69880D158B2CCABA56C42FC2E35A19ZoomEffectViewEntry)init
{
  *(void *)&self->_UIVisualEffectViewEntry_opaque[OBJC_IVAR____TtC9AirDropUIP33_770A69880D158B2CCABA56C42FC2E35A19ZoomEffectViewEntry_zoomAmount] = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ZoomEffectViewEntry();
  return [(ZoomEffectViewEntry *)&v3 init];
}

@end