@interface PKSqueezePaletteViewContext
- (id)copyWithZone:(_NSZone *)a3;
- (uint64_t)canShowResetHandwritingEducationPane;
- (uint64_t)canShowTapToRadar;
- (void)setSelectedColor:(uint64_t)a1;
@end

@implementation PKSqueezePaletteViewContext

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)objc_opt_class() allocWithZone:a3];
  if (v5)
  {
    uint64_t v6 = [(NSArray *)self->_tools copyWithZone:a3];
    v7 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v6;

    id v8 = [(PKTool *)self->_selectedTool copyWithZone:a3];
    v9 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v8;

    uint64_t v10 = [(NSArray *)self->_swatchColors copyWithZone:a3];
    v11 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v10;

    uint64_t v12 = [(UIColor *)self->_selectedColor copyWithZone:a3];
    v13 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v12;

    *(unsigned char *)(v5 + 8) = self->_supportsCanvasElements;
  }
  return (id)v5;
}

- (uint64_t)canShowTapToRadar
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!a1 || !os_variant_has_internal_diagnostics()) {
    return 0;
  }
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v4 = *(id *)(a1 + 16);
  uint64_t v2 = [v4 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v5 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "_isHandwritingTool", (void)v7))
        {
          uint64_t v2 = 1;
          goto LABEL_15;
        }
      }
      uint64_t v2 = [v4 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return v2;
}

- (uint64_t)canShowResetHandwritingEducationPane
{
  if (result)
  {
    v1 = +[PKHandwritingEducationPaneSettings sharedInstance]();
    uint64_t v2 = -[PKHandwritingEducationPaneSettings canShowResetPaneInPalette]((uint64_t)v1);

    return v2;
  }
  return result;
}

- (void)setSelectedColor:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedColor, 0);
  objc_storeStrong((id *)&self->_swatchColors, 0);
  objc_storeStrong((id *)&self->_selectedTool, 0);

  objc_storeStrong((id *)&self->_tools, 0);
}

@end