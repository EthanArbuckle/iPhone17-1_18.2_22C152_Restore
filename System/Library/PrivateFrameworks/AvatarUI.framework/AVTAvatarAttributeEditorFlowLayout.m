@interface AVTAvatarAttributeEditorFlowLayout
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
@end

@implementation AVTAvatarAttributeEditorFlowLayout

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)AVTAvatarAttributeEditorFlowLayout;
  v3 = -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](&v14, sel_layoutAttributesForElementsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 representedElementCategory] == 1) {
          [v8 _setZPosition:0];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v5);
  }
  return v3;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)AVTAvatarAttributeEditorFlowLayout;
  uint64_t v4 = [(UICollectionViewFlowLayout *)&v6 layoutAttributesForSupplementaryViewOfKind:a3 atIndexPath:a4];
  [v4 _setZPosition:0];
  return v4;
}

@end