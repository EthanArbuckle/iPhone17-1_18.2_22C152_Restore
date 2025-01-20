@interface FMAttributedStringRenderer
- (CGSize)_sizeFromTextStorage:(id)a3;
- (FMAttributedStringRenderer)init;
- (FMAttributedStringRenderer)initWithOptions:(id)a3;
- (FMAttributedStringRendererOptions)options;
- (id)_imageFromTextStorage:(id)a3 width:(double)a4 showExclusionPaths:(BOOL)a5;
- (id)_textStorageForAttributedString:(id)a3 width:(double)a4 options:(id)a5;
- (id)imageForAttributedString:(id)a3 width:(double)a4;
- (id)imageForAttributedString:(id)a3 width:(double)a4 options:(id)a5;
- (id)imageForAttributedString:(id)a3 width:(double)a4 showExclusionPaths:(BOOL)a5 options:(id)a6;
@end

@implementation FMAttributedStringRenderer

- (FMAttributedStringRenderer)init
{
  v3 = objc_alloc_init(FMAttributedStringRendererOptions);
  v4 = [(FMAttributedStringRenderer *)self initWithOptions:v3];

  return v4;
}

- (FMAttributedStringRenderer)initWithOptions:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMAttributedStringRenderer;
  v6 = [(FMAttributedStringRenderer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_options, a3);
  }

  return v7;
}

- (id)imageForAttributedString:(id)a3 width:(double)a4
{
  id v6 = a3;
  v7 = [(FMAttributedStringRenderer *)self options];
  v8 = [(FMAttributedStringRenderer *)self imageForAttributedString:v6 width:v7 options:a4];

  return v8;
}

- (id)imageForAttributedString:(id)a3 width:(double)a4 options:(id)a5
{
  return [(FMAttributedStringRenderer *)self imageForAttributedString:a3 width:0 showExclusionPaths:a5 options:a4];
}

- (id)imageForAttributedString:(id)a3 width:(double)a4 showExclusionPaths:(BOOL)a5 options:(id)a6
{
  BOOL v7 = a5;
  id v11 = a3;
  id v12 = a6;
  dispatch_assert_queue_not_V2(MEMORY[0x263EF83A0]);
  if (a4 <= 0.0)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"FMAttributedStringRenderer.m", 62, @"Invalid parameter not satisfying: %@", @"width > 0.0" object file lineNumber description];
  }
  v13 = [(FMAttributedStringRenderer *)self _textStorageForAttributedString:v11 width:v12 options:a4];
  v14 = [(FMAttributedStringRenderer *)self _imageFromTextStorage:v13 width:v7 showExclusionPaths:a4];
  if (!v14)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"FMAttributedStringRenderer.m", 68, @"Invalid parameter not satisfying: %@", @"retValue != nil" object file lineNumber description];
  }
  return v14;
}

- (id)_textStorageForAttributedString:(id)a3 width:(double)a4 options:(id)a5
{
  objc_super v9 = (objc_class *)MEMORY[0x263F81648];
  id v10 = a5;
  id v11 = a3;
  id v12 = objc_alloc_init(v9);
  v13 = objc_msgSend(objc_alloc(MEMORY[0x263F81680]), "initWithSize:", a4, INFINITY);
  v14 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithAttributedString:v11];
  id v15 = objc_alloc_init(MEMORY[0x263F81650]);
  [v10 hyphenationFactor];
  *(float *)&double v16 = v16;
  [v15 setHyphenationFactor:v16];
  uint64_t v17 = *MEMORY[0x263F81540];
  v18 = [v11 string];

  objc_msgSend(v14, "addAttribute:value:range:", v17, v15, 0, objc_msgSend(v18, "length"));
  [v12 setUsesDefaultHyphenation:0];
  v19 = [v10 exclusionPaths];
  [v13 setExclusionPaths:v19];

  objc_msgSend(v13, "setLineBreakMode:", objc_msgSend(v10, "lineBreakMode"));
  [v10 lineFragmentPadding];
  objc_msgSend(v13, "setLineFragmentPadding:");
  uint64_t v20 = [v10 maximumNumberOfLines];

  [v13 setMaximumNumberOfLines:v20];
  [v12 addTextContainer:v13];
  v21 = (void *)[objc_alloc(MEMORY[0x263F816E8]) initWithAttributedString:v14];
  [v21 addLayoutManager:v12];
  v22 = [v12 textStorage];

  if (!v22)
  {
    v26 = [MEMORY[0x263F08690] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"FMAttributedStringRenderer.m", 99, @"Invalid parameter not satisfying: %@", @"layoutManager.textStorage != nil" object file lineNumber description];
  }
  v23 = [v12 textContainers];
  uint64_t v24 = [v23 count];

  if (v24 != 1)
  {
    v27 = [MEMORY[0x263F08690] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"FMAttributedStringRenderer.m", 100, @"Invalid parameter not satisfying: %@", @"layoutManager.textContainers.count == 1" object file lineNumber description];
  }
  return v21;
}

- (CGSize)_sizeFromTextStorage:(id)a3
{
  id v3 = a3;
  dispatch_assert_queue_not_V2(MEMORY[0x263EF83A0]);
  v4 = [v3 layoutManagers];

  id v5 = [v4 firstObject];

  id v6 = [v5 textContainers];
  BOOL v7 = [v6 firstObject];
  [v5 usedRectForTextContainer:v7];
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (id)_imageFromTextStorage:(id)a3 width:(double)a4 showExclusionPaths:(BOOL)a5
{
  id v8 = a3;
  double v9 = [v8 layoutManagers];
  double v10 = [v9 firstObject];

  [(FMAttributedStringRenderer *)self _sizeFromTextStorage:v8];
  double v12 = v11;

  double v13 = objc_msgSend(objc_alloc(MEMORY[0x263F1C680]), "initWithSize:", a4, v12);
  v14 = [v10 textContainers];
  id v15 = [v14 firstObject];
  uint64_t v16 = [v10 glyphRangeForTextContainer:v15];
  uint64_t v18 = v17;

  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __77__FMAttributedStringRenderer__imageFromTextStorage_width_showExclusionPaths___block_invoke;
  v22[3] = &unk_2643352D8;
  id v23 = v10;
  uint64_t v24 = v16;
  uint64_t v25 = v18;
  BOOL v26 = a5;
  id v19 = v10;
  uint64_t v20 = [v13 imageWithActions:v22];

  return v20;
}

void __77__FMAttributedStringRenderer__imageFromTextStorage_width_showExclusionPaths___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  double v2 = *MEMORY[0x263F00148];
  double v3 = *(double *)(MEMORY[0x263F00148] + 8);
  objc_msgSend(*(id *)(a1 + 32), "drawBackgroundForGlyphRange:atPoint:", *(void *)(a1 + 40), *(void *)(a1 + 48), *MEMORY[0x263F00148], v3);
  objc_msgSend(*(id *)(a1 + 32), "drawGlyphsForGlyphRange:atPoint:", *(void *)(a1 + 40), *(void *)(a1 + 48), v2, v3);
  if (*(unsigned char *)(a1 + 56))
  {
    v4 = [*(id *)(a1 + 32) textContainers];
    id v5 = [v4 firstObject];

    id v6 = [MEMORY[0x263F1C550] redColor];
    [v6 setStroke];

    BOOL v7 = [MEMORY[0x263F1C550] redColor];
    id v8 = [v7 colorWithAlphaComponent:0.1];
    [v8 setFill];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    double v9 = objc_msgSend(v5, "exclusionPaths", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          [v14 fill];
          [v14 stroke];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
}

- (FMAttributedStringRendererOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
}

@end