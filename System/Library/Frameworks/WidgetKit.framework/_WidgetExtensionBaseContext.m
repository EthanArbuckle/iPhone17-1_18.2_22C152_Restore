@interface _WidgetExtensionBaseContext
+ (BOOL)_shouldSendHostApplicationStateNotifications;
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (_TtC9WidgetKit27_WidgetExtensionBaseContext)init;
- (_TtC9WidgetKit27_WidgetExtensionBaseContext)initWithInputItems:(id)a3;
- (_TtC9WidgetKit27_WidgetExtensionBaseContext)initWithInputItems:(id)a3 contextUUID:(id)a4;
- (_TtC9WidgetKit27_WidgetExtensionBaseContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5;
@end

@implementation _WidgetExtensionBaseContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return sub_191CEDA8C((uint64_t)a1, (uint64_t)a2, &qword_1EB44C668, (void **)&qword_1EB44C5A8);
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return sub_191CEDA8C((uint64_t)a1, (uint64_t)a2, &qword_1EB44AD20, (void **)&qword_1EB44AD10);
}

+ (BOOL)_shouldSendHostApplicationStateNotifications
{
  return 0;
}

- (_TtC9WidgetKit27_WidgetExtensionBaseContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _WidgetExtensionBaseContext();
  return [(_WidgetExtensionBaseContext *)&v3 init];
}

- (_TtC9WidgetKit27_WidgetExtensionBaseContext)initWithInputItems:(id)a3
{
  if (a3)
  {
    sub_191CF5538();
    v4 = (void *)sub_191CF5528();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for _WidgetExtensionBaseContext();
  v5 = [(_WidgetExtensionBaseContext *)&v7 initWithInputItems:v4];

  if (v5) {
  return v5;
  }
}

- (_TtC9WidgetKit27_WidgetExtensionBaseContext)initWithInputItems:(id)a3 contextUUID:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB44BA60);
  MEMORY[0x1F4188790](v6 - 8);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3) {
    a3 = (id)sub_191CF5538();
  }
  if (a4)
  {
    sub_191CF31B8();
    uint64_t v9 = sub_191CF31D8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = sub_191CF31D8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  return (_TtC9WidgetKit27_WidgetExtensionBaseContext *)sub_191CEDBC8((uint64_t)a3, (uint64_t)v8);
}

- (_TtC9WidgetKit27_WidgetExtensionBaseContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB44BA60);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3) {
    a3 = (id)sub_191CF5538();
  }
  if (a5)
  {
    sub_191CF31B8();
    uint64_t v11 = sub_191CF31D8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 0, 1, v11);
  }
  else
  {
    uint64_t v12 = sub_191CF31D8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
  }
  id v13 = a4;
  return (_TtC9WidgetKit27_WidgetExtensionBaseContext *)sub_191CEDE84((uint64_t)a3, a4, (uint64_t)v10);
}

@end