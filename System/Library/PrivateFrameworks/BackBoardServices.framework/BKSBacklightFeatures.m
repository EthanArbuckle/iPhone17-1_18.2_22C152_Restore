@interface BKSBacklightFeatures
+ (id)protobufSchema;
- (BKSBacklightFeatures)init;
- (BOOL)disableFeatures;
- (NSString)description;
- (float)fixedBrightnessLevelWhileDisabled;
- (float)fixedBrightnessNitsWhileDisabled;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)didFinishProtobufDecodingWithError:(id *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)setDisableFeatures:(BOOL)a3;
- (void)setFixedBrightnessLevelWhileDisabled:(float)a3;
- (void)setFixedBrightnessNitsWhileDisabled:(float)a3;
@end

@implementation BKSBacklightFeatures

- (float)fixedBrightnessLevelWhileDisabled
{
  return self->_fixedBrightnessLevelWhileDisabled;
}

- (float)fixedBrightnessNitsWhileDisabled
{
  return self->_fixedBrightnessNitsWhileDisabled;
}

- (void)setDisableFeatures:(BOOL)a3
{
  self->_disableFeatures = a3;
}

- (BOOL)disableFeatures
{
  return self->_disableFeatures;
}

- (id)didFinishProtobufDecodingWithError:(id *)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  float fixedBrightnessLevelWhileDisabled = self->_fixedBrightnessLevelWhileDisabled;
  if (fixedBrightnessLevelWhileDisabled == -1.0
    || (float fixedBrightnessNitsWhileDisabled = self->_fixedBrightnessNitsWhileDisabled,
        fixedBrightnessNitsWhileDisabled == -1.0))
  {
    v10 = self;
  }
  else
  {
    if (a3)
    {
      v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v7 = *MEMORY[0x1E4F28798];
      uint64_t v12 = *MEMORY[0x1E4F28588];
      v8 = objc_msgSend(NSString, "stringWithFormat:", @"cannot have both set: nitsWhileDisabled:%g levelWhileDisabled:%g", fixedBrightnessNitsWhileDisabled, fixedBrightnessLevelWhileDisabled);
      v13[0] = v8;
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      *a3 = [v6 errorWithDomain:v7 code:22 userInfo:v9];
    }
    v10 = 0;
  }
  return v10;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(BKSBacklightFeatures *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendBool:self->_disableFeatures withName:@"disableFeatures"];
  id v6 = (id)[v4 appendFloat:@"fixedBrightnessNitsWhileDisabled" withName:self->_fixedBrightnessNitsWhileDisabled];
  id v7 = (id)[v4 appendFloat:@"fixedBrightnessLevelWhileDisabled" withName:self->_fixedBrightnessLevelWhileDisabled];
  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(BKSBacklightFeatures *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)succinctDescription
{
  v2 = [(BKSBacklightFeatures *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (NSString)description
{
  return (NSString *)[(BKSBacklightFeatures *)self descriptionWithMultilinePrefix:0];
}

- (void)setFixedBrightnessLevelWhileDisabled:(float)a3
{
  if (self->_fixedBrightnessNitsWhileDisabled >= 0.0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"BKSBacklightFeatures.m" lineNumber:33 description:@"cannot set both brightness level and nits; choose one or the other"];
  }
  self->_float fixedBrightnessLevelWhileDisabled = a3;
}

- (void)setFixedBrightnessNitsWhileDisabled:(float)a3
{
  if (self->_fixedBrightnessLevelWhileDisabled >= 0.0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"BKSBacklightFeatures.m" lineNumber:28 description:@"cannot set both brightness level and nits; choose one or the other"];
  }
  self->_float fixedBrightnessNitsWhileDisabled = a3;
}

- (BKSBacklightFeatures)init
{
  v8.receiver = self;
  v8.super_class = (Class)BKSBacklightFeatures;
  result = [(BKSBacklightFeatures *)&v8 init];
  if (result)
  {
    __asm { FMOV            V0.2S, #-1.0 }
    *(void *)&result->_float fixedBrightnessNitsWhileDisabled = _D0;
  }
  return result;
}

+ (id)protobufSchema
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__BKSBacklightFeatures_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_7942 != -1) {
    dispatch_once(&protobufSchema_onceToken_7942, block);
  }
  v2 = (void *)protobufSchema_schema_7943;
  return v2;
}

uint64_t __38__BKSBacklightFeatures_protobufSchema__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F4F808] buildSchemaForClass:objc_opt_class() builder:&__block_literal_global_7945];
  uint64_t v1 = protobufSchema_schema_7943;
  protobufSchema_schema_7943 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __38__BKSBacklightFeatures_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 addField:"_disableFeatures" forTag:1];
  [v2 addField:"_fixedBrightnessNitsWhileDisabled" forTag:2];
  [v2 addField:"_fixedBrightnessLevelWhileDisabled" forTag:3];
}

@end