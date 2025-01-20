@interface AVTMaterial
- (NSDictionary)additionalPropertyColors;
- (UIColor)baseColor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)applyToSceneKitMaterial:(id)a3;
- (void)setAdditionalPropertyColors:(id)a3;
- (void)setBaseColor:(id)a3;
@end

@implementation AVTMaterial

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(AVTMaterial);
  objc_storeStrong((id *)&v4->_baseColor, self->_baseColor);
  objc_storeStrong((id *)&v4->_additionalPropertyColors, self->_additionalPropertyColors);
  return v4;
}

- (void)applyToSceneKitMaterial:(id)a3
{
  id v4 = a3;
  baseColor = self->_baseColor;
  v6 = [v4 diffuse];
  [v6 setContents:baseColor];

  additionalPropertyColors = self->_additionalPropertyColors;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __39__AVTMaterial_applyToSceneKitMaterial___block_invoke;
  v9[3] = &unk_26401FCA0;
  id v10 = v4;
  id v8 = v4;
  [(NSDictionary *)additionalPropertyColors enumerateKeysAndObjectsUsingBlock:v9];
}

void __39__AVTMaterial_applyToSceneKitMaterial___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  v6 = [*(id *)(a1 + 32) valueForKey:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = *(void **)(a1 + 32);
    v9 = [v13 stringByAppendingString:@".contents"];
    id v10 = v8;
    id v11 = v5;
    id v12 = v9;
  }
  else
  {
    v9 = objc_msgSend(MEMORY[0x263F08D40], "avt_valueWithFloat4:", AVTGetColorComponents(v5, v7));
    id v10 = *(void **)(a1 + 32);
    id v11 = v9;
    id v12 = v13;
  }
  [v10 setValue:v11 forKeyPath:v12];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  baseColor = self->_baseColor;
  v7 = [(NSDictionary *)self->_additionalPropertyColors allKeys];
  id v8 = [v3 stringWithFormat:@"<%@: %p, base color: %@, additional properties: %@>", v5, self, baseColor, v7];

  return v8;
}

- (UIColor)baseColor
{
  return self->_baseColor;
}

- (void)setBaseColor:(id)a3
{
}

- (NSDictionary)additionalPropertyColors
{
  return self->_additionalPropertyColors;
}

- (void)setAdditionalPropertyColors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalPropertyColors, 0);
  objc_storeStrong((id *)&self->_baseColor, 0);
}

@end