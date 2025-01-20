@interface DOCTagRenderingRequest
+ (DOCTagRenderingRequest)requestWithTagDimension:(double)a3;
+ (id)requestForChainedTags:(id)a3 tagDimension:(double)a4;
+ (id)requestForTag:(id)a3 tagDimension:(double)a4;
+ (id)requestForTag:(id)a3 tagDimension:(double)a4 variant:(unint64_t)a5;
- (BOOL)allowUnsizedSymbolImages;
- (DOCTagRenderingRequest)init;
- (NSArray)fillColors;
- (NSArray)tags;
- (UIColor)ringColor;
- (UIColor)selectionOutlineColor;
- (UITraitCollection)traitCollection;
- (double)knockOutBorderWidth;
- (double)tagDimension;
- (id)_UIImageCacheKeyWithAdditionalComponents:(id)a3;
- (int64_t)layoutDirection;
- (unint64_t)clearTagRenderingMode;
- (unint64_t)spacingType;
- (unint64_t)variant;
- (void)setAllowUnsizedSymbolImages:(BOOL)a3;
- (void)setClearTagRenderingMode:(unint64_t)a3;
- (void)setFillColors:(id)a3;
- (void)setKnockOutBorderWidth:(double)a3;
- (void)setLayoutDirection:(int64_t)a3;
- (void)setRingColor:(id)a3;
- (void)setSelectionOutlineColor:(id)a3;
- (void)setSpacingType:(unint64_t)a3;
- (void)setTagDimension:(double)a3;
- (void)setTags:(id)a3;
- (void)setVariant:(unint64_t)a3;
@end

@implementation DOCTagRenderingRequest

void __67__DOCTagRenderingRequest__UIImageCacheKeyWithAdditionalComponents___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 traitCollection];
  id v7 = [v4 resolvedColorWithTraitCollection:v5];

  v6 = v7;
  if (v7)
  {
    [*(id *)(a1 + 40) addObject:v7];
    v6 = v7;
  }
}

void __61__DOCTagRenderingRequest_requestForChainedTags_tagDimension___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v7 = a2;
  v6 = [v7 tagColorIfNotClear];
  if (v6)
  {
    [*(id *)(a1 + 32) addObject:v6];
    [*(id *)(a1 + 40) addObject:v7];
    *a4 = [*(id *)(a1 + 32) count] == 3;
  }
}

- (DOCTagRenderingRequest)init
{
  v9.receiver = self;
  v9.super_class = (Class)DOCTagRenderingRequest;
  v2 = [(DOCTagRenderingRequest *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_tagDimension = 16.0;
    v2->_layoutDirection = [MEMORY[0x263F81658] defaultWritingDirectionForLanguage:0] == 1;
    fillColors = v3->_fillColors;
    v3->_fillColors = (NSArray *)MEMORY[0x263EFFA68];

    uint64_t v5 = [MEMORY[0x263F3ABC0] nonClearNoneTagColor];
    ringColor = v3->_ringColor;
    v3->_ringColor = (UIColor *)v5;

    selectionOutlineColor = v3->_selectionOutlineColor;
    v3->_selectionOutlineColor = 0;

    v3->_knockOutBorderWidth = 1.0;
    v3->_spacingType = 0;
    v3->_clearTagRenderingMode = 0;
  }
  return v3;
}

- (id)_UIImageCacheKeyWithAdditionalComponents:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  v18 = __67__DOCTagRenderingRequest__UIImageCacheKeyWithAdditionalComponents___block_invoke;
  v19 = &unk_2648FB948;
  id v6 = v5;
  id v20 = v6;
  v21 = self;
  id v7 = (void (**)(void *, __CFString *, NSArray *))_Block_copy(&aBlock);
  v7[2](v7, @"fillColors", self->_fillColors);
  objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", self->_ringColor, 0);
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, @"ringColor", v8);

  objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", self->_selectionOutlineColor, 0);
  objc_super v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, @"selectionOutlineColor", v9);

  v10 = (void *)MEMORY[0x263EFF980];
  v11 = [NSNumber numberWithDouble:self->_tagDimension];
  v12 = [NSNumber numberWithUnsignedInteger:self->_spacingType];
  v13 = [NSNumber numberWithInteger:self->_layoutDirection];
  v14 = objc_msgSend(v10, "arrayWithObjects:", v6, v11, v12, v13, 0, aBlock, v17, v18, v19);

  if ([v4 count]) {
    [v14 addObjectsFromArray:v4];
  }

  return v14;
}

void __67__DOCTagRenderingRequest__UIImageCacheKeyWithAdditionalComponents___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) addObject:a2];
  if ([v5 count])
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __67__DOCTagRenderingRequest__UIImageCacheKeyWithAdditionalComponents___block_invoke_2;
    v8[3] = &unk_2648FB920;
    int8x16_t v7 = *(int8x16_t *)(a1 + 32);
    id v6 = (id)v7.i64[0];
    int8x16_t v9 = vextq_s8(v7, v7, 8uLL);
    [v5 enumerateObjectsUsingBlock:v8];
  }
  else
  {
    [*(id *)(a1 + 32) addObject:@"none"];
  }
}

+ (id)requestForChainedTags:(id)a3 tagDimension:(double)a4
{
  id v5 = (void *)MEMORY[0x263EFF980];
  id v6 = a3;
  int8x16_t v7 = [v5 array];
  v8 = [MEMORY[0x263EFF980] array];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __61__DOCTagRenderingRequest_requestForChainedTags_tagDimension___block_invoke;
  v16 = &unk_2648FB8F8;
  id v9 = v7;
  id v17 = v9;
  id v10 = v8;
  id v18 = v10;
  [v6 enumerateObjectsUsingBlock:&v13];

  if (objc_msgSend(v9, "count", v13, v14, v15, v16))
  {
    v11 = [(id)objc_opt_class() requestWithTagDimension:a4];
    [v11 setTags:v10];
    [v11 setFillColors:v9];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)setTags:(id)a3
{
}

- (void)setFillColors:(id)a3
{
}

- (UITraitCollection)traitCollection
{
  v2 = [MEMORY[0x263F82B60] mainScreen];
  v3 = [v2 traitCollection];

  return (UITraitCollection *)v3;
}

- (double)tagDimension
{
  return self->_tagDimension;
}

- (NSArray)tags
{
  return self->_tags;
}

- (unint64_t)spacingType
{
  return self->_spacingType;
}

- (UIColor)selectionOutlineColor
{
  return self->_selectionOutlineColor;
}

- (NSArray)fillColors
{
  return self->_fillColors;
}

- (UIColor)ringColor
{
  return self->_ringColor;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (double)knockOutBorderWidth
{
  return self->_knockOutBorderWidth;
}

+ (DOCTagRenderingRequest)requestWithTagDimension:(double)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setTagDimension:a3];

  return (DOCTagRenderingRequest *)v4;
}

- (void)setTagDimension:(double)a3
{
  self->_tagDimension = a3;
}

- (void)setSpacingType:(unint64_t)a3
{
  self->_spacingType = a3;
}

- (void)setLayoutDirection:(int64_t)a3
{
  self->_layoutDirection = a3;
}

- (void)setSelectionOutlineColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionOutlineColor, 0);
  objc_storeStrong((id *)&self->_ringColor, 0);
  objc_storeStrong((id *)&self->_fillColors, 0);

  objc_storeStrong((id *)&self->_tags, 0);
}

+ (id)requestForTag:(id)a3 tagDimension:(double)a4
{
  return (id)[a1 requestForTag:a3 tagDimension:0 variant:a4];
}

+ (id)requestForTag:(id)a3 tagDimension:(double)a4 variant:(unint64_t)a5
{
  v17[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = [(id)objc_opt_class() requestWithTagDimension:a4];
  v17[0] = v7;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  [v8 setTags:v9];

  if (a5 == 1 && [v7 labelIndex])
  {
    id v10 = [MEMORY[0x263F825C8] clearColor];
    v16 = v10;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
    [v8 setFillColors:v11];

    v12 = [v7 tagColor];
    [v8 setRingColor:v12];
  }
  else
  {
    v12 = [v7 tagColor];
    v15 = v12;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:1];
    [v8 setFillColors:v13];
  }

  return v8;
}

- (void)setRingColor:(id)a3
{
}

- (unint64_t)clearTagRenderingMode
{
  return self->_clearTagRenderingMode;
}

- (void)setClearTagRenderingMode:(unint64_t)a3
{
  self->_clearTagRenderingMode = a3;
}

- (unint64_t)variant
{
  return self->_variant;
}

- (void)setVariant:(unint64_t)a3
{
  self->_variant = a3;
}

- (BOOL)allowUnsizedSymbolImages
{
  return self->_allowUnsizedSymbolImages;
}

- (void)setAllowUnsizedSymbolImages:(BOOL)a3
{
  self->_allowUnsizedSymbolImages = a3;
}

- (void)setKnockOutBorderWidth:(double)a3
{
  self->_knockOutBorderWidth = a3;
}

@end