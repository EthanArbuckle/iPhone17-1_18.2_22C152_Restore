@interface FASettingsPresetComputedProperty
+ (BOOL)supportsSecureCoding;
- (FASettingsPresetComputedProperty)init;
- (FASettingsPresetComputedProperty)initWithCoder:(id)a3;
- (FASettingsPresetComputedProperty)initWithConditions:(id)a3;
- (FASettingsPresetComputedProperty)initWithDictionary:(id)a3;
- (NSArray)conditions;
- (NSSet)dependencies;
- (id)computedValueWithValueProvider:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FASettingsPresetComputedProperty

- (NSArray)conditions
{
  type metadata accessor for FASettingsPresetPropertyCondition();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D25AABE0();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (FASettingsPresetComputedProperty)initWithConditions:(id)a3
{
  type metadata accessor for FASettingsPresetPropertyCondition();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FASettingsPresetComputedProperty_conditions) = (Class)sub_1D25AABF0();
  v5.receiver = self;
  v5.super_class = (Class)FASettingsPresetComputedProperty;
  return [(FASettingsPresetComputedProperty *)&v5 init];
}

- (FASettingsPresetComputedProperty)initWithDictionary:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_1D25AA920();
  }
  else {
    uint64_t v3 = 0;
  }
  return (FASettingsPresetComputedProperty *)FASettingsPresetComputedProperty.init(dictionary:)(v3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FASettingsPresetComputedProperty)initWithCoder:(id)a3
{
  return (FASettingsPresetComputedProperty *)FASettingsPresetComputedProperty.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  FASettingsPresetComputedProperty.encode(with:)((NSCoder)v4);
}

- (id)computedValueWithValueProvider:(id)a3
{
  id v4 = _Block_copy(a3);
  _Block_copy(v4);
  objc_super v5 = self;
  sub_1D258284C(v5, (uint64_t (**)(void, void))v4, &v13);
  _Block_release(v4);

  uint64_t v6 = v14;
  if (v14)
  {
    v7 = __swift_project_boxed_opaque_existential_1(&v13, v14);
    uint64_t v8 = *(void *)(v6 - 8);
    MEMORY[0x1F4188790](v7);
    v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v8 + 16))(v10);
    v11 = (void *)sub_1D25AB1D0();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (NSSet)dependencies
{
  v2 = self;
  uint64_t v3 = [(FASettingsPresetComputedProperty *)v2 conditions];
  type metadata accessor for FASettingsPresetPropertyCondition();
  unint64_t v4 = sub_1D25AABF0();

  uint64_t v5 = sub_1D2581A20(v4);
  swift_bridgeObjectRelease();
  sub_1D2583FC4(v5);

  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)sub_1D25AAD40();
  swift_bridgeObjectRelease();
  return (NSSet *)v6;
}

- (FASettingsPresetComputedProperty)init
{
  result = (FASettingsPresetComputedProperty *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end