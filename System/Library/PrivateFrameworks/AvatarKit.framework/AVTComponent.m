@interface AVTComponent
- (AVTComponent)initWithType:(int64_t)a3 assets:(id)a4 morphVariant:(id)a5 imageVariant:(id)a6 materialVariant:(id)a7 morphVariantIntensity:(float)a8 bodyPoseVariantIntensity:(float)a9 textureAssetPresence:(float)a10;
- (NSArray)assets;
- (NSString)imageVariant;
- (NSString)materialVariant;
- (NSString)morphVariant;
- (float)bodyPoseVariantIntensity;
- (float)morphVariantIntensity;
- (float)textureAssetPresence;
- (id)description;
- (id)materialAtIndex:(unint64_t)a3;
- (int64_t)type;
- (void)setMaterial:(id)a3 atIndex:(unint64_t)a4;
@end

@implementation AVTComponent

- (int64_t)type
{
  return self->_type;
}

- (void)setMaterial:(id)a3 atIndex:(unint64_t)a4
{
  id v7 = a3;
  if (v7 || a4)
  {
    if (a4 >= 3) {
      -[AVTComponent setMaterial:atIndex:]();
    }
    id v8 = v7;
    objc_storeStrong((id *)&self->_materials[a4], a3);
    id v7 = v8;
  }
}

- (id)materialAtIndex:(unint64_t)a3
{
  if (a3 > 2)
  {
    v6 = 0;
  }
  else
  {
    v6 = self->_materials[a3];
    if (a3 && !v6)
    {
      v6 = [(AVTComponent *)self materialAtIndex:a3 - 1];
    }
  }
  return v6;
}

- (AVTComponent)initWithType:(int64_t)a3 assets:(id)a4 morphVariant:(id)a5 imageVariant:(id)a6 materialVariant:(id)a7 morphVariantIntensity:(float)a8 bodyPoseVariantIntensity:(float)a9 textureAssetPresence:(float)a10
{
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  v26.receiver = self;
  v26.super_class = (Class)AVTComponent;
  v23 = [(AVTComponent *)&v26 init];
  v24 = v23;
  if (v23)
  {
    v23->_type = a3;
    objc_storeStrong((id *)&v23->_assets, a4);
    objc_storeStrong((id *)&v24->_morphVariant, a5);
    objc_storeStrong((id *)&v24->_imageVariant, a6);
    objc_storeStrong((id *)&v24->_materialVariant, a7);
    v24->_morphVariantIntensity = a8;
    v24->_bodyPoseVariantIntensity = a9;
    v24->_textureAssetPresence = a10;
  }

  return v24;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = AVTComponentTypeToString(self->_type);
  id v7 = (void *)[v3 initWithFormat:@"<%@: %p, type=%@", v5, self, v6];

  if (self->_assets) {
    [v7 appendFormat:@" assets: %@", self->_assets];
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

- (NSArray)assets
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)morphVariant
{
  return self->_morphVariant;
}

- (NSString)imageVariant
{
  return self->_imageVariant;
}

- (NSString)materialVariant
{
  return self->_materialVariant;
}

- (float)morphVariantIntensity
{
  return self->_morphVariantIntensity;
}

- (float)bodyPoseVariantIntensity
{
  return self->_bodyPoseVariantIntensity;
}

- (float)textureAssetPresence
{
  return self->_textureAssetPresence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materialVariant, 0);
  objc_storeStrong((id *)&self->_imageVariant, 0);
  objc_storeStrong((id *)&self->_morphVariant, 0);
  for (uint64_t i = 40; i != 16; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

- (void)setMaterial:atIndex:.cold.1()
{
}

@end