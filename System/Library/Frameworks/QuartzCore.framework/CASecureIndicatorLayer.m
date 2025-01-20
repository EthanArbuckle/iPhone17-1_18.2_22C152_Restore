@interface CASecureIndicatorLayer
+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3;
+ (BOOL)_hasRenderLayerSubclass;
+ (id)defaultValueForKey:(id)a3;
- (BOOL)_renderLayerDefinesProperty:(unsigned int)a3;
- (NSArray)validPositions;
- (NSString)privacyIndicatorType;
- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5;
- (void)didChangeValueForKey:(id)a3;
- (void)setPrivacyIndicatorType:(id)a3;
@end

@implementation CASecureIndicatorLayer

- (void)didChangeValueForKey:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5 = (CA::Transaction *)CAInternAtom((const __CFString *)a3, 0);
  if (v5 == 449)
  {
    v6 = CA::Transaction::ensure_compat(v5);
    CA::Layer::set_commit_needed((CA::Layer *)self->super._attr.layer, v6, 0x10000);
  }
  v7.receiver = self;
  v7.super_class = (Class)CASecureIndicatorLayer;
  [(CASecureIndicatorLayer *)&v7 didChangeValueForKey:a3];
}

- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)CASecureIndicatorLayer;
  id v7 = -[CALayer _copyRenderLayer:layerFlags:commitFlags:](&v13, sel__copyRenderLayer_layerFlags_commitFlags_, a3, *(void *)&a4);
  if (!v7 || (*((unsigned char *)a5 + 2) & 1) == 0) {
    return v7;
  }
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v9 = (atomic_uint *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x18uLL, 0x743898A5uLL);
  v10 = v9;
  if (v9)
  {
    *((void *)v9 + 2) = 0;
    v9[2] = 1;
    v9[3] = 45;
    ++dword_1EB2ADE7C;
    *(void *)v9 = &unk_1ED02EDA0;
  }
  *((_WORD *)v9 + 10) = -1;
  if (CADeviceSupportsMedina::once[0] != -1) {
    dispatch_once(CADeviceSupportsMedina::once, &__block_literal_global_314);
  }
  if (CADeviceSupportsMedina::medina)
  {
    int v11 = indicator_id_from_name([(CASecureIndicatorLayer *)self privacyIndicatorType]);
    if (v11 != -1) {
      goto LABEL_11;
    }
    [MEMORY[0x1E4F1CA00] raise:@"CASecureIndicatorLayerInvalidName", @"Invalid indicator name %@", -[CASecureIndicatorLayer privacyIndicatorType](self, "privacyIndicatorType") format];
  }
  int v11 = -1;
LABEL_11:
  v10[4] = v11;
  CA::Render::Layer::set_subclass((uint64_t)v7, (CA::Render::LayerSubclass *)v10);
  if (atomic_fetch_add(v10 + 2, 0xFFFFFFFF) == 1) {
    (*(void (**)(atomic_uint *))(*(void *)v10 + 16))(v10);
  }
  return v7;
}

- (BOOL)_renderLayerDefinesProperty:(unsigned int)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (a3 == 449) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)CASecureIndicatorLayer;
  return -[CALayer _renderLayerDefinesProperty:](&v4, sel__renderLayerDefinesProperty_);
}

- (void)setPrivacyIndicatorType:(id)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1C1, (const CGAffineTransform *)3, v3);
}

- (NSString)privacyIndicatorType
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1C1u, (const CGAffineTransform *)3, v3);
  return (NSString *)v3[0];
}

+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ((Class)objc_opt_class() == a3) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CASecureIndicatorLayer;
  return objc_msgSendSuper2(&v6, sel_CA_automaticallyNotifiesObservers_, a3);
}

- (NSArray)validPositions
{
  v2 = [(CASecureIndicatorLayer *)self privacyIndicatorType];

  return (NSArray *)CASecureIndicatorLayerValidPositionsForIndicator(v2);
}

+ (id)defaultValueForKey:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([a3 isEqualToString:@"privacyIndicatorType"]) {
    return @"Microphone";
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CASecureIndicatorLayer;
  return objc_msgSendSuper2(&v6, sel_defaultValueForKey_, a3);
}

+ (BOOL)_hasRenderLayerSubclass
{
  return 1;
}

@end