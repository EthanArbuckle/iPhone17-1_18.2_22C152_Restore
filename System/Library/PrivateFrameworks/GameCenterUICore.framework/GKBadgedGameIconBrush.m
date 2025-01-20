@interface GKBadgedGameIconBrush
- (CGSize)sizeForInput:(id)a3;
- (GKBadgedGameIconBrush)init;
- (GKThemeBrush)badgeBrush;
- (double)scaleForInput:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)drawInRect:(CGRect)a3 withContext:(CGContext *)a4 input:(id)a5;
- (void)setBadgeBrush:(id)a3;
@end

@implementation GKBadgedGameIconBrush

- (GKBadgedGameIconBrush)init
{
  v7.receiver = self;
  v7.super_class = (Class)GKBadgedGameIconBrush;
  v2 = [(GKBadgedGameIconBrush *)&v7 init];
  if (v2)
  {
    v3 = objc_alloc_init(GKCircleImageBrush);
    badgeBrush = v2->_badgeBrush;
    v2->_badgeBrush = &v3->super.super;

    v5 = v2;
  }

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GKBadgedGameIconBrush;
  id v4 = [(GKThemeBrush *)&v7 copyWithZone:a3];
  v5 = [(GKBadgedGameIconBrush *)self badgeBrush];
  [v4 setBadgeBrush:v5];

  return v4;
}

- (CGSize)sizeForInput:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  v6 = v5;
  if (v5 && [v5 count])
  {
    objc_super v7 = [v6 objectAtIndexedSubscript:0];
    [v7 size];
    double v9 = v8 + 12.0;
    double v11 = v10 + 12.0;
  }
  else
  {
    double v9 = *MEMORY[0x263F001B0];
    double v11 = *(double *)(MEMORY[0x263F001B0] + 8);
  }

  double v12 = v9;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (double)scaleForInput:(id)a3
{
  id v4 = a3;
  id v5 = [(GKBadgedGameIconBrush *)self badgeBrush];
  [v5 scaleForInput:v4];
  double v7 = v6;

  return v7;
}

- (void)drawInRect:(CGRect)a3 withContext:(CGContext *)a4 input:(id)a5
{
  id v25 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v7 = v25;
  }
  else {
    double v7 = 0;
  }
  id v8 = v7;
  double v9 = v8;
  if (v8)
  {
    unint64_t v10 = [v8 count];
    double v11 = [v9 objectAtIndexedSubscript:0];
    double v12 = 0;
    if (v10 >= 2)
    {
      double v12 = [v9 objectAtIndexedSubscript:1];
    }
    [v11 size];
    double v14 = v13;
    double v16 = v15;
    v17 = [(GKBadgedGameIconBrush *)self badgeBrush];
    [v17 sizeForInput:v12];
    double v19 = v18;
    double v21 = v20;

    v27.origin.x = 6.0;
    v27.origin.y = 6.0;
    v27.size.width = v14;
    v27.size.height = v16;
    CGFloat v22 = CGRectGetMaxY(v27) - v21 + 6.0;
    UIGraphicsPushContext(a4);
    CGContextSaveGState(a4);
    objc_msgSend(v11, "drawInRect:", 6.0, 6.0, v14, v16);
    v23 = [(GKBadgedGameIconBrush *)self badgeBrush];
    v24 = objc_msgSend(v23, "drawnImageForSize:opaque:input:", 0, v12, v19, v21);

    objc_msgSend(v24, "drawInRect:", 0.0, v22, v19, v21);
    CGContextRestoreGState(a4);
    UIGraphicsPopContext();
  }
}

- (GKThemeBrush)badgeBrush
{
  return self->_badgeBrush;
}

- (void)setBadgeBrush:(id)a3
{
}

- (void).cxx_destruct
{
}

@end