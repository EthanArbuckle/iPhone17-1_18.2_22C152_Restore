@interface LayerGeometryObserver
- (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D421LayerGeometryObserver)init;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation LayerGeometryObserver

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v12 = v11;
    if (a4)
    {
LABEL_3:
      swift_unknownObjectRetain();
      id v13 = a5;
      v14 = self;
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v10 = 0;
    v12 = 0;
    if (a4) {
      goto LABEL_3;
    }
  }
  memset(v19, 0, sizeof(v19));
  id v15 = a5;
  v16 = self;
LABEL_6:
  uint64_t v17 = MEMORY[0x263F8EE58];
  if (a5)
  {
    type metadata accessor for NSKeyValueChangeKey(0);
    lazy protocol witness table accessor for type Date.ComponentsFormatStyle.Field and conformance Date.ComponentsFormatStyle.Field(&lazy protocol witness table cache variable for type NSKeyValueChangeKey and conformance NSKeyValueChangeKey, type metadata accessor for NSKeyValueChangeKey);
    v18 = (objc_class *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    v18 = 0;
  }
  LayerGeometryObserver.observeValue(forKeyPath:of:change:context:)(v10, v12, (uint64_t)v19, v18, a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  _sypSgWOhTm_1((uint64_t)v19, (uint64_t)&lazy cache variable for type metadata for Any?, v17 + 8, MEMORY[0x263F8D8F0], (uint64_t (*)(void))type metadata accessor for TextRenderLayer.Layout?);
}

- (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D421LayerGeometryObserver)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D421LayerGeometryObserver_observedLayers) = (Class)MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D421LayerGeometryObserver__root) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D421LayerGeometryObserver_ancestor) = 0;
  swift_unknownObjectWeakInit();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(LayerGeometryObserver *)&v5 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D421LayerGeometryObserver__root));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D421LayerGeometryObserver_ancestor));

  swift_unknownObjectWeakDestroy();
}

@end