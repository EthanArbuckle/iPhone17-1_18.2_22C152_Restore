@interface ZoomEffect
- (BOOL)isEqual:(id)a3;
- (_TtC9AirDropUIP33_770A69880D158B2CCABA56C42FC2E35A10ZoomEffect)init;
- (_TtC9AirDropUIP33_770A69880D158B2CCABA56C42FC2E35A10ZoomEffect)initWithCoder:(id)a3;
- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5;
@end

@implementation ZoomEffect

- (_TtC9AirDropUIP33_770A69880D158B2CCABA56C42FC2E35A10ZoomEffect)initWithCoder:(id)a3
{
  result = (_TtC9AirDropUIP33_770A69880D158B2CCABA56C42FC2E35A10ZoomEffect *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  id v8 = objc_allocWithZone((Class)type metadata accessor for ZoomEffectViewEntry());
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  v12 = (char *)[v8 init];
  *(void *)&v12[OBJC_IVAR____TtC9AirDropUIP33_770A69880D158B2CCABA56C42FC2E35A19ZoomEffectViewEntry_zoomAmount] = *(Class *)((char *)&v11->super.super.isa + OBJC_IVAR____TtC9AirDropUIP33_770A69880D158B2CCABA56C42FC2E35A10ZoomEffect_magnitude);
  [v9 addViewEffect:v12];
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = sub_1000789FC((uint64_t)v8);

  sub_100064F68((uint64_t)v8);
  return v6;
}

- (_TtC9AirDropUIP33_770A69880D158B2CCABA56C42FC2E35A10ZoomEffect)init
{
  result = (_TtC9AirDropUIP33_770A69880D158B2CCABA56C42FC2E35A10ZoomEffect *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end