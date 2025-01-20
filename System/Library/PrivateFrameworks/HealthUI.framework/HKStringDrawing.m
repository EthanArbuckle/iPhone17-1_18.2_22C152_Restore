@interface HKStringDrawing
+ (id)stringDrawingWithText:(id)a3 inRect:(CGRect)a4 withAttributes:(id)a5;
+ (void)drawStrings:(id)a3 outlineWidth:(double)a4 outlineColor:(id)a5 context:(CGContext *)a6;
- (CGRect)rect;
- (HKStringDrawing)initWithText:(id)a3 inRect:(CGRect)a4 withAttributes:(id)a5;
- (NSDictionary)attributes;
- (NSString)text;
- (void)draw;
- (void)setAttributes:(id)a3;
- (void)setRect:(CGRect)a3;
- (void)setText:(id)a3;
@end

@implementation HKStringDrawing

+ (id)stringDrawingWithText:(id)a3 inRect:(CGRect)a4 withAttributes:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v10 = a5;
  id v11 = a3;
  v12 = -[HKStringDrawing initWithText:inRect:withAttributes:]([HKStringDrawing alloc], "initWithText:inRect:withAttributes:", v11, v10, x, y, width, height);

  return v12;
}

- (HKStringDrawing)initWithText:(id)a3 inRect:(CGRect)a4 withAttributes:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  double y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v11 = a3;
  id v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HKStringDrawing;
  v13 = [(HKStringDrawing *)&v17 init];
  v14 = v13;
  if (v13)
  {
    [(HKStringDrawing *)v13 setText:v11];
    [(HKStringDrawing *)v14 setAttributes:v12];
    v14->_rect.origin.CGFloat x = x;
    v14->_rect.origin.double y = y;
    v14->_rect.size.CGFloat width = width;
    v14->_rect.size.CGFloat height = height;
    double v15 = HKUIFloorToScreenScale(y);
    v14->_rect.origin.double y = v15 + HKUIHalfPixel();
  }

  return v14;
}

- (void)draw
{
  id v12 = [(HKStringDrawing *)self text];
  [(HKStringDrawing *)self rect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(HKStringDrawing *)self attributes];
  objc_msgSend(v12, "drawInRect:withAttributes:", v11, v4, v6, v8, v10);
}

+ (void)drawStrings:(id)a3 outlineWidth:(double)a4 outlineColor:(id)a5 context:(CGContext *)a6
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (a4 <= 0.0)
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v32 = [v9 countByEnumeratingWithState:&v46 objects:v52 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v47 != v34) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v46 + 1) + 8 * i) draw];
        }
        uint64_t v33 = [v9 countByEnumeratingWithState:&v46 objects:v52 count:16];
      }
      while (v33);
    }
  }
  else
  {
    CGContextSaveGState(a6);
    id v37 = v10;
    id v11 = v10;
    id v12 = [MEMORY[0x1E4FB1618] clearColor];
    int v13 = [v11 isEqual:v12];

    if (v13)
    {
      uint64_t v14 = [MEMORY[0x1E4FB1618] blackColor];

      CGContextSetBlendMode(a6, kCGBlendModeClear);
      id v11 = (id)v14;
    }
    id v15 = v11;
    CGContextSetFillColorWithColor(a6, (CGColorRef)[v15 CGColor]);
    id v16 = v15;
    CGContextSetStrokeColorWithColor(a6, (CGColorRef)[v16 CGColor]);
    CGContextSetLineWidth(a6, fabs(a4));
    CGContextSetLineCap(a6, kCGLineCapRound);
    CGContextSetLineJoin(a6, kCGLineJoinRound);
    CGContextRef c = a6;
    CGContextSetTextDrawingMode(a6, kCGTextFillStroke);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v17 = v9;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v42 objects:v51 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v43;
      uint64_t v21 = *MEMORY[0x1E4FB0700];
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v43 != v20) {
            objc_enumerationMutation(v17);
          }
          v23 = *(void **)(*((void *)&v42 + 1) + 8 * j);
          v24 = objc_msgSend(v23, "attributes", c);
          v25 = (void *)[v24 mutableCopy];

          [v25 setValue:v16 forKey:v21];
          v26 = [v23 text];
          [v23 rect];
          objc_msgSend(v26, "drawInRect:withAttributes:", v25);
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v42 objects:v51 count:16];
      }
      while (v19);
    }

    CGContextRestoreGState(c);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v27 = v17;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v38 objects:v50 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v39;
      do
      {
        for (uint64_t k = 0; k != v29; ++k)
        {
          if (*(void *)v39 != v30) {
            objc_enumerationMutation(v27);
          }
          objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * k), "draw", c);
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v38 objects:v50 count:16];
      }
      while (v29);
    }

    id v10 = v37;
  }
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (CGRect)rect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end