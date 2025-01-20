@interface FigAlternateObjCVideoAttributesDummy
- (id)codecTypes;
- (id)immersiveAttributes;
- (id)videoLayoutAttributes;
@end

@implementation FigAlternateObjCVideoAttributesDummy

- (id)codecTypes
{
  return &unk_1EE58E058;
}

- (id)immersiveAttributes
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = objc_alloc_init(FigAlternateObjCVideoImmersiveAttributesDummy);
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
}

- (id)videoLayoutAttributes
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = objc_alloc_init(FigAlternateObjCVideoLayoutAttributesDummy);
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
}

@end