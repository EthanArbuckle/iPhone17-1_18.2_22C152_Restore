@interface _MKResizingLayer
- (BOOL)needsLayoutOnBoundsChange;
- (NSArray)sizeToBoundsLayers;
- (void)setBounds:(CGRect)a3;
- (void)setContentsScale:(double)a3;
- (void)setMask:(id)a3;
- (void)setNeedsLayoutOnBoundsChange:(BOOL)a3;
- (void)sizeSublayerToBounds:(id)a3;
@end

@implementation _MKResizingLayer

- (NSArray)sizeToBoundsLayers
{
  v2 = (void *)[(NSMutableArray *)self->_sizedLayers copy];

  return (NSArray *)v2;
}

- (void)sizeSublayerToBounds:(id)a3
{
  sizedLayers = self->_sizedLayers;
  if (sizedLayers)
  {
    [(NSMutableArray *)sizedLayers addObject:a3];
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA48] arrayWithObject:a3];
    v6 = self->_sizedLayers;
    self->_sizedLayers = v5;
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (self->_needsLayoutOnBoundsChange)
  {
    [(_MKResizingLayer *)self bounds];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
  }
  else
  {
    CGFloat v15 = a3.size.height;
    CGFloat v13 = a3.size.width;
    CGFloat v11 = a3.origin.y;
    CGFloat v9 = a3.origin.x;
  }
  v28.receiver = self;
  v28.super_class = (Class)_MKResizingLayer;
  -[_MKResizingLayer setBounds:](&v28, sel_setBounds_, x, y, width, height);
  char v16 = objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_shouldAdoptImplicitAnimationParameters");
  if ((v16 & 1) == 0)
  {
    v17 = +[MKThreadContext currentContext];
    objc_msgSend(v17, "_CA_setDisableActions:", 1);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v18 = self->_sizedLayers;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(v18);
        }
        objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "setFrame:", x, y, width, height, (void)v24);
      }
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v20);
  }

  v31.origin.double x = v9;
  v31.origin.double y = v11;
  v31.size.double width = v13;
  v31.size.double height = v15;
  v32.origin.double x = x;
  v32.origin.double y = y;
  v32.size.double width = width;
  v32.size.double height = height;
  if (!CGRectEqualToRect(v31, v32)) {
    [(_MKResizingLayer *)self layoutSublayers];
  }
  if ((v16 & 1) == 0)
  {
    v23 = +[MKThreadContext currentContext];
    objc_msgSend(v23, "_CA_setDisableActions:", 0);
  }
}

- (void)setMask:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)_MKResizingLayer;
  id v4 = a3;
  [(_MKResizingLayer *)&v17 setMask:v4];
  [(_MKResizingLayer *)self contentsScale];
  double v6 = v5;
  v7 = [(_MKResizingLayer *)self mask];
  [v7 setContentsScale:v6];

  LODWORD(v7) = [(NSMutableArray *)self->_sizedLayers containsObject:v4];
  if (v7)
  {
    [(_MKResizingLayer *)self bounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    char v16 = [(_MKResizingLayer *)self mask];
    objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);
  }
}

- (void)setContentsScale:(double)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)_MKResizingLayer;
  -[_MKResizingLayer setContentsScale:](&v15, sel_setContentsScale_);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v5 = [(_MKResizingLayer *)self sublayers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v9++) setContentsScale:a3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }

  double v10 = [(_MKResizingLayer *)self mask];
  [v10 setContentsScale:a3];
}

- (BOOL)needsLayoutOnBoundsChange
{
  return self->_needsLayoutOnBoundsChange;
}

- (void)setNeedsLayoutOnBoundsChange:(BOOL)a3
{
  self->_needsLayoutOnBoundsChange = a3;
}

- (void).cxx_destruct
{
}

@end