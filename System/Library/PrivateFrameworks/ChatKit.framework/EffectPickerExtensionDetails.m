@interface EffectPickerExtensionDetails
- (_TtC7ChatKit28EffectPickerExtensionDetails)init;
- (void)clearCurrentEffect;
- (void)createView;
@end

@implementation EffectPickerExtensionDetails

- (void)createView
{
  v2 = self;
  sub_18F675210();
}

- (void)clearCurrentEffect
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_18F7B6F40();
}

- (_TtC7ChatKit28EffectPickerExtensionDetails)init
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E923E4F8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR____TtC7ChatKit28EffectPickerExtensionDetails__currentEffect;
  uint64_t v15 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  v8 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E923D668);
  sub_18F7B6F00();
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v6, v3);
  *(Class *)((char *)&v8->super.isa + OBJC_IVAR____TtC7ChatKit28EffectPickerExtensionDetails_effectData) = (Class)MEMORY[0x1E4FBC860];

  v9 = (objc_class *)type metadata accessor for EffectPickerExtensionDetails();
  v11.receiver = v8;
  v11.super_class = v9;
  return [(EffectPickerExtensionDetails *)&v11 init];
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC7ChatKit28EffectPickerExtensionDetails__currentEffect;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E923E4F8);
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_bridgeObjectRelease();
}

@end