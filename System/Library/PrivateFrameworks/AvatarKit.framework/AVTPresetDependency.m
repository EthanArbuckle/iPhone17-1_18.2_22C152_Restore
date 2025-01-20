@interface AVTPresetDependency
- (id)description;
- (void)setMaterialVariant:(uint64_t)a1;
- (void)setVisibilityRules:(uint64_t)a1;
@end

@implementation AVTPresetDependency

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = AVTPresetCategoryToString(self->_category);
  v7 = (void *)[v3 initWithFormat:@"<%@: %p %@ →", v5, self, v6];

  preset = self->_preset;
  if (preset)
  {
    v9 = [(AVTPreset *)preset identifier];
    [v7 appendFormat:@" preset: %@", v9];
  }
  if (self->_morphVariant) {
    [v7 appendFormat:@" morph variant: %@", self->_morphVariant];
  }
  if (self->_imageVariant) {
    [v7 appendFormat:@" image variant: %@", self->_imageVariant];
  }
  if (self->_materialVariant) {
    [v7 appendFormat:@" material variant: %@", self->_materialVariant];
  }
  [v7 appendString:@">"];

  return v7;
}

- (void)setMaterialVariant:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (void)setVisibilityRules:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibilityRules, 0);
  objc_storeStrong((id *)&self->_materialVariant, 0);
  objc_storeStrong((id *)&self->_imageVariant, 0);
  objc_storeStrong((id *)&self->_morphVariant, 0);

  objc_storeStrong((id *)&self->_preset, 0);
}

@end