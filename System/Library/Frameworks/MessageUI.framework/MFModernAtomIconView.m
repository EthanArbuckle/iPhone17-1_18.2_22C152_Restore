@interface MFModernAtomIconView
- (CGPoint)drawingOffset;
- (NSArray)iconImages;
- (double)iconPadding;
- (double)preferredWidth;
- (void)drawRect:(CGRect)a3;
- (void)setDrawingOffset:(CGPoint)a3;
- (void)setIconImages:(id)a3;
- (void)setIconPadding:(double)a3;
@end

@implementation MFModernAtomIconView

- (void)drawRect:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)MFModernAtomIconView;
  -[MFModernAtomIconView drawRect:](&v15, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v4 = [(MFModernAtomIconView *)self effectiveUserInterfaceLayoutDirection];
  BOOL v5 = v4 == 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  uint64_t v14 = -1;
  if (v4)
  {
    [(MFModernAtomIconView *)self bounds];
    double v7 = v6;
    [(MFModernAtomIconView *)self drawingOffset];
    double v9 = v7 - v8;
  }
  else
  {
    [(MFModernAtomIconView *)self drawingOffset];
  }
  uint64_t v14 = *(void *)&v9;
  v10 = [(MFModernAtomIconView *)self iconImages];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __33__MFModernAtomIconView_drawRect___block_invoke;
  v11[3] = &unk_1E5F7CDA8;
  BOOL v12 = v5;
  v11[4] = self;
  v11[5] = v13;
  [v10 enumerateObjectsUsingBlock:v11];

  _Block_object_dispose(v13, 8);
}

void __33__MFModernAtomIconView_drawRect___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v12 = v3;
  if (*(unsigned char *)(a1 + 48))
  {
    [v3 drawingOffset];
    double v6 = v5;
  }
  else
  {
    [v3 size];
    double v8 = v7;
    [v12 drawingOffset];
    double v6 = -(v8 + v9);
  }
  [*(id *)(a1 + 32) drawingOffset];
  [v12 drawingOffset];
  [v12 size];
  UIRoundToViewScale();
  objc_msgSend(v12, "drawAtPoint:", v4 + v6, v10);
  [v12 size];
  [*(id *)(a1 + 32) iconPadding];
  UIRoundToViewScale();
  if (!*(unsigned char *)(a1 + 48)) {
    double v11 = -v11;
  }
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v11
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24);
}

- (double)preferredWidth
{
  uint64_t v8 = 0;
  double v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = -1;
  [(MFModernAtomIconView *)self drawingOffset];
  uint64_t v11 = v3;
  double v4 = [(MFModernAtomIconView *)self iconImages];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__MFModernAtomIconView_preferredWidth__block_invoke;
  v7[3] = &unk_1E5F7CDD0;
  v7[4] = self;
  v7[5] = &v8;
  [v4 enumerateObjectsUsingBlock:v7];

  double v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __38__MFModernAtomIconView_preferredWidth__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 size];
  [*(id *)(a1 + 32) iconPadding];
  [v4 drawingOffset];
  UIRoundToViewScale();
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24);
}

- (NSArray)iconImages
{
  return self->_iconImages;
}

- (void)setIconImages:(id)a3
{
}

- (double)iconPadding
{
  return self->_iconPadding;
}

- (void)setIconPadding:(double)a3
{
  self->_iconPadding = a3;
}

- (CGPoint)drawingOffset
{
  double x = self->_drawingOffset.x;
  double y = self->_drawingOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setDrawingOffset:(CGPoint)a3
{
  self->_drawingOffset = a3;
}

- (void).cxx_destruct
{
}

@end