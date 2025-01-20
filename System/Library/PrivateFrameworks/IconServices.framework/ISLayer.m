@interface ISLayer
- (CGRect)bounds;
- (CGRect)frame;
- (CGSize)size;
- (ISEffect)effect;
- (ISLayer)init;
- (ISLayer)internalSuperlayer;
- (ISLayer)mask;
- (NSArray)sublayers;
- (NSMutableArray)internalSublayers;
- (NSString)name;
- (id)debugDescription;
- (int)blendMode;
- (unint64_t)coordinateSystem;
- (unint64_t)flipped;
- (void)addSublayer:(id)a3;
- (void)insertSublayer:(id)a3 atIndex:(unsigned int)a4;
- (void)removeFromSuperlayer;
- (void)setBlendMode:(int)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCoordinateSystem:(unint64_t)a3;
- (void)setEffect:(id)a3;
- (void)setFlipped:(unint64_t)a3;
- (void)setFrame:(CGRect)a3;
- (void)setInternalSuperlayer:(id)a3;
- (void)setMask:(id)a3;
- (void)setName:(id)a3;
- (void)setPosition:(CGPoint)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation ISLayer

- (ISLayer)init
{
  v7.receiver = self;
  v7.super_class = (Class)ISLayer;
  v2 = [(ISLayer *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    v4 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v3;

    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    *(_OWORD *)(v2 + 72) = *MEMORY[0x1E4F1DB28];
    *(_OWORD *)(v2 + 88) = v5;
    *((_DWORD *)v2 + 2) = 0;
    *((void *)v2 + 7) = 0;
  }
  return (ISLayer *)v2;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  double v8 = self->_frame.size.width;
  double v9 = self->_frame.size.height;
  self->_frame.origin.double x = x;
  self->_frame.origin.double y = y;
  self->_frame.size.double width = a3.size.width;
  self->_frame.size.double height = a3.size.height;
  memset(&v22, 0, sizeof(v22));
  CGAffineTransformMakeScale(&v22, a3.size.width / v8, a3.size.height / v9);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v10 = [(ISLayer *)self sublayers];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        [v15 frame];
        CGAffineTransform v17 = v22;
        CGRect v26 = CGRectApplyAffineTransform(v25, &v17);
        objc_msgSend(v15, "setFrame:", v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v12);
  }

  v16 = [(ISLayer *)self mask];
  objc_msgSend(v16, "setFrame:", x, y, width, height);
}

- (CGRect)frame
{
  unint64_t coordinateSystem = self->_coordinateSystem;
  switch(coordinateSystem)
  {
    case 3uLL:
      uint64_t v12 = [(ISLayer *)self superlayer];
      [v12 bounds];
      p_size = &self->_frame.size;
      CGFloat v13 = CGRectGetMaxX(v26) - self->_frame.size.width;
      v14 = [(ISLayer *)self superlayer];
      [v14 bounds];
      CGFloat MaxY = CGRectGetMaxY(v27);
      double height = self->_frame.size.height;
      p_double height = &self->_frame.size.height;
      CGFloat v17 = MaxY - height;

      double x = v13 - *(p_height - 3);
      double y = v17 - *(p_height - 2);
      break;
    case 2uLL:
      long long v18 = [(ISLayer *)self superlayer];
      [v18 bounds];
      CGFloat MaxX = CGRectGetMaxX(v28);
      double width = self->_frame.size.width;
      long long v20 = &self->_frame.size;
      CGFloat v22 = MaxX - width;

      double y = v20[-1].height;
      double x = v22 - v20[-1].width;
      p_size = v20;
      p_double height = &v20->height;
      break;
    case 1uLL:
      v4 = [(ISLayer *)self superlayer];
      [v4 bounds];
      CGFloat v5 = CGRectGetMaxY(v25);
      double v7 = self->_frame.size.height;
      p_double height = &self->_frame.size.height;
      p_size = (CGSize *)(p_height - 1);
      CGFloat v9 = v5 - v7;

      double x = *(p_height - 3);
      double y = v9 - *(p_height - 2);
      break;
    default:
      double x = self->_frame.origin.x;
      double y = self->_frame.origin.y;
      p_size = &self->_frame.size;
      p_double height = &self->_frame.size.height;
      break;
  }
  double v23 = *p_height;
  double v24 = p_size->width;
  result.size.double height = v23;
  result.size.double width = v24;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGSize)size
{
  [(ISLayer *)self frame];
  double v3 = v2;
  double v5 = v4;
  result.double height = v5;
  result.double width = v3;
  return result;
}

- (void)setSize:(CGSize)a3
{
}

- (void)setPosition:(CGPoint)a3
{
}

- (CGRect)bounds
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  [(ISLayer *)self size];
  double v5 = v4;
  double v7 = v6;
  double v8 = v2;
  double v9 = v3;
  result.size.double height = v7;
  result.size.double width = v5;
  result.origin.double y = v9;
  result.origin.double x = v8;
  return result;
}

- (void)setBounds:(CGRect)a3
{
}

- (void)removeFromSuperlayer
{
  id v4 = [(ISLayer *)self internalSuperlayer];
  double v3 = [v4 internalSublayers];
  [v3 removeObject:self];

  [(ISLayer *)self setInternalSuperlayer:0];
}

- (void)addSublayer:(id)a3
{
  id v4 = a3;
  [v4 setInternalSuperlayer:self];
  id v5 = [(ISLayer *)self internalSublayers];
  [v5 addObject:v4];
}

- (void)insertSublayer:(id)a3 atIndex:(unsigned int)a4
{
  id v6 = a3;
  [v6 setInternalSuperlayer:self];
  id v7 = [(ISLayer *)self internalSublayers];
  [v7 insertObject:v6 atIndex:a4];
}

- (NSArray)sublayers
{
  double v2 = [(ISLayer *)self internalSublayers];
  double v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (id)debugDescription
{
  double v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)ISLayer;
  id v4 = [(ISLayer *)&v7 debugDescription];
  id v5 = [v3 stringWithFormat:@"%@ : %@", v4, self->_name];

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (ISLayer)mask
{
  return self->_mask;
}

- (void)setMask:(id)a3
{
}

- (ISEffect)effect
{
  return self->_effect;
}

- (void)setEffect:(id)a3
{
}

- (int)blendMode
{
  return self->_blendMode;
}

- (void)setBlendMode:(int)a3
{
  self->_blendMode = a3;
}

- (ISLayer)internalSuperlayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internalSuperlayer);
  return (ISLayer *)WeakRetained;
}

- (void)setInternalSuperlayer:(id)a3
{
}

- (NSMutableArray)internalSublayers
{
  return self->_internalSublayers;
}

- (unint64_t)coordinateSystem
{
  return self->_coordinateSystem;
}

- (void)setCoordinateSystem:(unint64_t)a3
{
  self->_unint64_t coordinateSystem = a3;
}

- (unint64_t)flipped
{
  return self->_flipped;
}

- (void)setFlipped:(unint64_t)a3
{
  self->_flipped = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalSublayers, 0);
  objc_destroyWeak((id *)&self->_internalSuperlayer);
  objc_storeStrong((id *)&self->_effect, 0);
  objc_storeStrong((id *)&self->_mask, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end