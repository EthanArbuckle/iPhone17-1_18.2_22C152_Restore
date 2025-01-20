@interface FASettingsPresetPropertyCondition
- (FASettingsPresetPropertyCondition)init;
- (FASettingsPresetPropertyCondition)initWithDictionary:(id)a3;
- (FASettingsPresetPropertyCondition)initWithSourceProperty:(id)a3 operand:(id)a4 result:(id)a5;
- (NSObject)operand;
- (NSObject)result;
- (NSString)sourceProperty;
@end

@implementation FASettingsPresetPropertyCondition

- (NSString)sourceProperty
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D25AA980();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSObject)operand
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___FASettingsPresetPropertyCondition_operand));
}

- (NSObject)result
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___FASettingsPresetPropertyCondition_result));
}

- (FASettingsPresetPropertyCondition)initWithSourceProperty:(id)a3 operand:(id)a4 result:(id)a5
{
  uint64_t v8 = sub_1D25AA9B0();
  v9 = (uint64_t *)((char *)self + OBJC_IVAR___FASettingsPresetPropertyCondition_sourceProperty);
  uint64_t *v9 = v8;
  v9[1] = v10;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FASettingsPresetPropertyCondition_operand) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FASettingsPresetPropertyCondition_result) = (Class)a5;
  v14.receiver = self;
  v14.super_class = (Class)FASettingsPresetPropertyCondition;
  id v11 = a4;
  id v12 = a5;
  return [(FASettingsPresetPropertyCondition *)&v14 init];
}

- (FASettingsPresetPropertyCondition)initWithDictionary:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_1D25AA920();
  }
  else {
    uint64_t v3 = 0;
  }
  return (FASettingsPresetPropertyCondition *)FASettingsPresetPropertyCondition.init(dictionary:)(v3);
}

- (FASettingsPresetPropertyCondition)init
{
  result = (FASettingsPresetPropertyCondition *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___FASettingsPresetPropertyCondition_result);
}

@end