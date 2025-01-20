@interface JFXFilterEffect
+ (BOOL)supportsSecureCoding;
- (BOOL)enablePresentationState:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (JFXFilterEffect)initWithCoder:(id)a3;
- (id)contentProperties;
- (id)copyWithZone:(_NSZone *)a3;
- (id)filterContentDataSource;
- (id)renderEffect;
- (int)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setForceRenderAtPosterFrame:(BOOL)a3;
@end

@implementation JFXFilterEffect

- (int)type
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)JFXFilterEffect;
  return [(JFXEffect *)&v4 copyWithZone:a3];
}

- (id)filterContentDataSource
{
  v3 = [(JFXEffect *)self contentDataSource];

  if (v3
    && ([(JFXEffect *)self contentDataSource],
        objc_super v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 conformsToProtocol:&unk_26E84DC98],
        v4,
        v5))
  {
    v6 = [(JFXEffect *)self contentDataSource];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)contentProperties
{
  v3 = [(JFXFilterEffect *)self filterContentDataSource];
  if (v3)
  {
    v15.receiver = self;
    v15.super_class = (Class)JFXFilterEffect;
    objc_super v4 = [(JFXEffect *)&v15 contentProperties];
    int v5 = (void *)[v4 mutableCopy];

    v6 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
    v7 = [v3 isExpensive];

    if (v7)
    {
      v8 = [v3 isExpensive];
      [v6 setObject:v8 forKeyedSubscript:@"isExpensive"];
    }
    v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isStyleTransfer"));
    [v6 setObject:v9 forKeyedSubscript:@"isStyleTransfer"];

    v10 = [v3 proxyRenderScale];

    if (v10)
    {
      v11 = [v3 proxyRenderScale];
      [v6 setObject:v11 forKeyedSubscript:@"proxyRenderScale"];
    }
    v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "inverseToneMapOperator"));
    [v6 setObject:v12 forKeyedSubscript:*MEMORY[0x263F61690]];

    if (v5)
    {
      [v5 addEntriesFromDictionary:v6];
      id v13 = v5;

      v6 = v13;
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)JFXFilterEffect;
    v6 = [(JFXEffect *)&v16 contentProperties];
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (JFXFilterEffect)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)JFXFilterEffect;
  return [(JFXEffect *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)JFXFilterEffect;
  [(JFXEffect *)&v3 encodeWithCoder:a3];
}

- (BOOL)isEqual:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)JFXFilterEffect;
  return [(JFXEffect *)&v4 isEqual:a3];
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)JFXFilterEffect;
  return [(JFXEffect *)&v3 hash];
}

- (BOOL)enablePresentationState:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)JFXFilterEffect;
  return [(JFXEffect *)&v4 enablePresentationState:0];
}

- (void)setForceRenderAtPosterFrame:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)JFXFilterEffect;
  [(JFXEffect *)&v3 setForceRenderAtPosterFrame:0];
}

- (id)renderEffect
{
  if (renderEffect_onceTokenSlide != -1) {
    dispatch_once(&renderEffect_onceTokenSlide, &__block_literal_global_9);
  }
  objc_super v3 = (void *)renderEffect_s_bypassHDRVariantEffectNames;
  objc_super v4 = [(JFXEffect *)self effectID];
  LODWORD(v3) = [v3 containsObject:v4];

  if (v3) {
    [(JFXEffect *)self setHDR:0];
  }
  v7.receiver = self;
  v7.super_class = (Class)JFXFilterEffect;
  int v5 = [(JFXEffect *)&v7 renderEffect];
  return v5;
}

void __31__JFXFilterEffect_renderEffect__block_invoke()
{
  v2[1] = *MEMORY[0x263EF8340];
  v2[0] = *MEMORY[0x263F61360];
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:1];
  v1 = (void *)renderEffect_s_bypassHDRVariantEffectNames;
  renderEffect_s_bypassHDRVariantEffectNames = v0;
}

@end