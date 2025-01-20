@interface PasteHelper.ConfigurationSupport
- (BOOL)canPasteItemProviders:(id)a3;
- (UIPasteConfiguration)pasteConfiguration;
- (_TtCV7SwiftUI11PasteHelper20ConfigurationSupport)init;
- (void)pasteItemProviders:(id)a3;
- (void)setPasteConfiguration:(id)a3;
@end

@implementation PasteHelper.ConfigurationSupport

- (UIPasteConfiguration)pasteConfiguration
{
  return (UIPasteConfiguration *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                         + OBJC_IVAR____TtCV7SwiftUI11PasteHelper20ConfigurationSupport_pasteConfiguration));
}

- (void)setPasteConfiguration:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV7SwiftUI11PasteHelper20ConfigurationSupport_pasteConfiguration);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtCV7SwiftUI11PasteHelper20ConfigurationSupport_pasteConfiguration) = (Class)a3;
  id v3 = a3;
}

- (BOOL)canPasteItemProviders:(id)a3
{
  type metadata accessor for NSItemProvider();
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtCV7SwiftUI11PasteHelper20ConfigurationSupport_pasteHelper);
  if (v5)
  {
    v6 = (void *)v4;
    v7 = self;
    outlined copy of PasteHelper?(v5);
    v10.value._rawValue = v6;
    v10.is_nil = v5;
    Swift::Bool v8 = PasteHelper.canPaste(_:)(v10);
    outlined consume of PasteHelper?(v5);

    swift_bridgeObjectRelease();
    LOBYTE(v4) = v8;
  }
  else
  {
    __break(1u);
  }
  return v4;
}

- (void)pasteItemProviders:(id)a3
{
  type metadata accessor for NSItemProvider();
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtCV7SwiftUI11PasteHelper20ConfigurationSupport_pasteHelper))
  {
    uint64_t v5 = v4;
    v6 = *(uint64_t (**)(uint64_t))&self->pasteConfiguration[OBJC_IVAR____TtCV7SwiftUI11PasteHelper20ConfigurationSupport_pasteHelper];
    v7 = self;
    swift_retain();
    Swift::Bool v8 = (void (*)(uint64_t))v6(v5);
    uint64_t v9 = swift_release();
    if (v8)
    {
      v8(v9);
      outlined consume of (@escaping @callee_guaranteed (@guaranteed NSFileWrapper?) -> (@owned NSFileWrapper, @error @owned Error))?((uint64_t)v8);
    }

    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

- (_TtCV7SwiftUI11PasteHelper20ConfigurationSupport)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtCV7SwiftUI11PasteHelper20ConfigurationSupport_pasteConfiguration) = 0;
  uint64_t v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtCV7SwiftUI11PasteHelper20ConfigurationSupport_pasteHelper);
  v4[1] = 0;
  v4[2] = 0;
  *uint64_t v4 = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(PasteHelper.ConfigurationSupport *)&v6 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV7SwiftUI11PasteHelper20ConfigurationSupport_pasteConfiguration));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtCV7SwiftUI11PasteHelper20ConfigurationSupport_pasteHelper);

  outlined consume of PasteHelper?(v3);
}

@end