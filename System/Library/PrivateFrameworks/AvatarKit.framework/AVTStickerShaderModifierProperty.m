@interface AVTStickerShaderModifierProperty
+ (id)shaderModifierPropertyCache;
+ (id)shaderModifierPropertyFromDictionary:(id)a3 assetsPath:(id)a4;
- (AVTStickerShaderModifierProperty)initWithName:(id)a3 type:(id)a4 value:(id)a5 originalValue:(id)a6;
- (NSString)name;
- (NSString)type;
- (id)dictionaryWithTargetPath:(id)a3;
- (id)effectiveValue;
- (id)originalValue;
- (id)value;
- (void)setOriginalValue:(id)a3;
@end

@implementation AVTStickerShaderModifierProperty

+ (id)shaderModifierPropertyCache
{
  if (shaderModifierPropertyCache_onceToken != -1) {
    dispatch_once(&shaderModifierPropertyCache_onceToken, &__block_literal_global_25);
  }
  v2 = (void *)shaderModifierPropertyCache_kCache;
  return v2;
}

uint64_t __63__AVTStickerShaderModifierProperty_shaderModifierPropertyCache__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF8E0]);
  uint64_t v1 = shaderModifierPropertyCache_kCache;
  shaderModifierPropertyCache_kCache = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)shaderModifierPropertyFromDictionary:(id)a3 assetsPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 objectForKeyedSubscript:@"value"];
  v9 = [v7 objectForKeyedSubscript:@"name"];
  v10 = [v7 objectForKeyedSubscript:@"type"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = [v6 stringByAppendingPathComponent:v8];
    v12 = [NSURL fileURLWithPath:v11 isDirectory:0];
    v13 = [v12 standardizedURL];
    v14 = [v13 absoluteString];

    v15 = [a1 shaderModifierPropertyCache];
    v16 = [v15 objectForKey:v14];
    if (!v16)
    {
      v16 = [[AVTStickerShaderModifierProperty alloc] initWithName:v9 type:v10 value:v11 originalValue:v8];
      [v15 setObject:v16 forKey:v14];
    }
  }
  else
  {
    v16 = [[AVTStickerShaderModifierProperty alloc] initWithName:v9 type:v10 value:v8 originalValue:v8];
  }

  return v16;
}

- (AVTStickerShaderModifierProperty)initWithName:(id)a3 type:(id)a4 value:(id)a5 originalValue:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)AVTStickerShaderModifierProperty;
  v15 = [(AVTStickerShaderModifierProperty *)&v21 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    objc_storeStrong((id *)&v16->_type, a4);
    objc_storeStrong(&v16->_value, a5);
    objc_storeStrong(&v16->_originalValue, a6);
    if ([v12 isEqualToString:@"texture"])
    {
      id v17 = [MEMORY[0x263F16A88] materialPropertyWithContents:v13];
    }
    else if ([v12 isEqualToString:@"float"])
    {
      v18 = NSNumber;
      [v13 floatValue];
      objc_msgSend(v18, "numberWithFloat:");
      id v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v17 = v13;
    }
    id effectiveValue = v16->_effectiveValue;
    v16->_id effectiveValue = v17;
  }
  return v16;
}

- (id)dictionaryWithTargetPath:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  long long v3 = *(_OWORD *)&self->_name;
  v6[0] = @"name";
  v6[1] = @"type";
  long long v7 = v3;
  v6[2] = @"value";
  id originalValue = self->_originalValue;
  v4 = [NSDictionary dictionaryWithObjects:&v7 forKeys:v6 count:3];
  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)type
{
  return self->_type;
}

- (id)value
{
  return self->_value;
}

- (id)originalValue
{
  return self->_originalValue;
}

- (void)setOriginalValue:(id)a3
{
}

- (id)effectiveValue
{
  return self->_effectiveValue;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_effectiveValue, 0);
  objc_storeStrong(&self->_originalValue, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end