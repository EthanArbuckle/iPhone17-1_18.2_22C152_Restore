@interface _MKCalloutLayer
- ($FF53E27891FDD234AA19505A5983CE46)metrics;
- (CGImage)_newContentImage;
- (CGSize)_contentSize;
- (UIColor)fillColor;
- (UIColor)strokeColor;
- (_MKCalloutLayer)init;
- (double)arrowOffset;
- (int64_t)arrowPosition;
- (void)dealloc;
- (void)layoutSublayers;
- (void)setArrowOffset:(double)a3;
- (void)setArrowPosition:(int64_t)a3;
- (void)setContentsScale:(double)a3;
- (void)setFillColor:(id)a3;
- (void)setMetrics:(id *)a3;
- (void)setStrokeColor:(id)a3;
@end

@implementation _MKCalloutLayer

- (CGSize)_contentSize
{
  double cornerRadius = self->_metrics.cornerRadius;
  if (self->_arrowPosition)
  {
    double v3 = self->_metrics.arrowBase + self->_metrics.var0.radialSmoothing.arrowBaseRadius * 2.0 + 2.0;
    double v4 = self->_metrics.arrowHeight + 1.0;
  }
  else
  {
    double v4 = 1.0;
    double v3 = 1.0;
  }
  double v5 = cornerRadius + cornerRadius;
  double v6 = cornerRadius + cornerRadius + v3;
  double v7 = v5 + v4;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGImage)_newContentImage
{
  [(_MKCalloutLayer *)self _contentSize];
  double v4 = v3;
  double v6 = v5;
  double cornerRadius = self->_metrics.cornerRadius;
  [(_MKCalloutLayer *)self contentsScale];
  double v9 = v8;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v11 = CGBitmapContextCreate(0, (unint64_t)(v4 * v9), (unint64_t)(v6 * v9), 8uLL, 0, DeviceRGB, 1u);
  CGColorSpaceRelease(DeviceRGB);
  CGContextTranslateCTM(v11, 0.0, v6 * v9);
  CGContextScaleCTM(v11, v9, -v9);
  if (self->_arrowPosition)
  {
    double arrowHeight = self->_metrics.arrowHeight;
    double arrowBase = self->_metrics.arrowBase;
    double v13 = v6 - arrowHeight;
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint(Mutable, 0, v4 - cornerRadius, v6 - arrowHeight);
    CGPathAddArcToPoint(Mutable, 0, v4, v6 - arrowHeight, v4, v6 + 1.0 - (cornerRadius + arrowHeight), cornerRadius);
    CGPathAddLineToPoint(Mutable, 0, v4, cornerRadius);
    CGPathAddArcToPoint(Mutable, 0, v4, 0.0, v4 - cornerRadius, 0.0, cornerRadius);
    CGPathAddLineToPoint(Mutable, 0, cornerRadius, 0.0);
    CGPathAddArcToPoint(Mutable, 0, 0.0, 0.0, 0.0, cornerRadius, cornerRadius);
    CGPathAddLineToPoint(Mutable, 0, 0.0, v6 + 1.0 - (cornerRadius + arrowHeight));
    CGPathAddArcToPoint(Mutable, 0, 0.0, v6 - arrowHeight, cornerRadius, v6 - arrowHeight, cornerRadius);
    double v33 = cornerRadius + 1.0;
    CGPathAddLineToPoint(Mutable, 0, cornerRadius + 1.0, v6 - arrowHeight);
    if (self->_metrics.useRadialSmoothing)
    {
      double v15 = arrowBase * 0.5;
      double v16 = atan(arrowHeight / (arrowBase * 0.5));
      double v17 = v4 * 0.5;
      if (v16 >= 0.0) {
        double v18 = -v16;
      }
      else {
        double v18 = v16;
      }
      CGPathAddArc(Mutable, 0, v4 * 0.5 - v15 - self->_metrics.var0.radialSmoothing.arrowBaseRadius * 0.5, v13 + self->_metrics.var0.radialSmoothing.arrowBaseRadius, self->_metrics.var0.radialSmoothing.arrowBaseRadius, -1.57079633, v18, 0);
      CGPoint CurrentPoint = CGPathGetCurrentPoint(Mutable);
      CGPathAddArcToPoint(Mutable, 0, v4 * 0.5, v6, v17 + v17 - CurrentPoint.x, CurrentPoint.y, self->_metrics.var0.radialSmoothing.arrowRadius);
      CGPathAddLineToPoint(Mutable, 0, v17 + v15, v6 - arrowHeight);
      CGPathAddLineToPoint(Mutable, 0, v4 - v33, v6 - arrowHeight);
    }
    else
    {
      double arrowRadius = self->_metrics.var0.radialSmoothing.arrowRadius;
      double v21 = arrowBase * 0.5;
      double v22 = self->_metrics.var0.radialSmoothing.arrowBaseRadius / sqrt(v21 * v21 + arrowHeight * arrowHeight);
      double v32 = v9;
      double v23 = v21 * v22;
      double v24 = arrowHeight * v22;
      CGFloat v30 = v13 + v24;
      CGPathAddQuadCurveToPoint(Mutable, 0, v4 * 0.5 - v21, v13, v4 * 0.5 - v21 + v21 * v22, v13 + v24);
      CGFloat v25 = v6 - v24 * arrowRadius;
      CGPathAddLineToPoint(Mutable, 0, v4 * 0.5 - v23 * arrowRadius, v25);
      CGPathAddQuadCurveToPoint(Mutable, 0, v4 * 0.5, v6, v4 * 0.5 + v23 * arrowRadius, v25);
      CGFloat v26 = v4 * 0.5 + v21 - v23;
      double v9 = v32;
      CGPathAddLineToPoint(Mutable, 0, v26, v30);
      CGPathAddQuadCurveToPoint(Mutable, 0, v4 * 0.5 + v21, v13, v4 - v33, v13);
    }
    CGPathCloseSubpath(Mutable);
  }
  else
  {
    v34.origin.x = 0.0;
    v34.origin.y = 0.0;
    v34.size.width = v4;
    v34.size.height = v6;
    Mutable = CGPathCreateWithRoundedRect(v34, cornerRadius, cornerRadius, 0);
  }
  CGContextAddPath(v11, Mutable);
  fillColor = self->_fillColor;
  if (fillColor)
  {
    CGContextSetFillColorWithColor(v11, [(UIColor *)fillColor CGColor]);
    CGContextFillPath(v11);
  }
  if (self->_strokeColor)
  {
    CGContextClip(v11);
    CGContextAddPath(v11, Mutable);
    CGContextSetStrokeColorWithColor(v11, [(UIColor *)self->_strokeColor CGColor]);
    CGContextSetLineWidth(v11, 1.0 / v9 + 1.0 / v9);
    CGContextStrokePath(v11);
  }
  CGPathRelease(Mutable);
  Image = CGBitmapContextCreateImage(v11);
  CGContextRelease(v11);
  return Image;
}

- (_MKCalloutLayer)init
{
  v5.receiver = self;
  v5.super_class = (Class)_MKCalloutLayer;
  v2 = [(_MKCalloutLayer *)&v5 init];
  if (v2)
  {
    double v3 = [MEMORY[0x1E4F428B8] whiteColor];
    [(_MKCalloutLayer *)v2 setFillColor:v3];

    [(_MKResizingLayer *)v2 setNeedsLayoutOnBoundsChange:1];
  }
  return v2;
}

- (void)dealloc
{
  contentImage = self->_contentImage;
  if (contentImage)
  {
    CGImageRelease(contentImage);
    self->_contentImage = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_MKCalloutLayer;
  [(_MKCalloutLayer *)&v4 dealloc];
}

- (void)setContentsScale:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_MKCalloutLayer;
  [(_MKResizingLayer *)&v5 setContentsScale:a3];
  contentImage = self->_contentImage;
  if (contentImage)
  {
    CGImageRelease(contentImage);
    self->_contentImage = 0;
  }
  [(_MKCalloutLayer *)self setNeedsLayout];
}

- (void)setArrowPosition:(int64_t)a3
{
  if (self->_arrowPosition != a3)
  {
    self->_arrowPosition = a3;
    contentImage = self->_contentImage;
    if (contentImage)
    {
      CGImageRelease(contentImage);
      self->_contentImage = 0;
    }
    [(_MKCalloutLayer *)self setNeedsLayout];
  }
}

- (void)setArrowOffset:(double)a3
{
  if (self->_arrowOffset != a3)
  {
    self->_arrowOffset = a3;
    [(_MKCalloutLayer *)self setNeedsLayout];
  }
}

- (void)layoutSublayers
{
  v46.receiver = self;
  v46.super_class = (Class)_MKCalloutLayer;
  [(_MKCalloutLayer *)&v46 layoutSublayers];
  if (!self->_contentImage)
  {
    self->_contentImage = [(_MKCalloutLayer *)self _newContentImage];
    if (self->_arrowPosition)
    {
      [(_MKCalloutLayer *)self setContents:0];
      if (!self->_leftLayer)
      {
        double v3 = [MEMORY[0x1E4F39BE8] layer];
        leftLayer = self->_leftLayer;
        self->_leftLayer = v3;

        [(_MKCalloutLayer *)self addSublayer:self->_leftLayer];
        [(_MKCalloutLayer *)self contentsScale];
        -[CALayer setContentsScale:](self->_leftLayer, "setContentsScale:");
        [(CALayer *)self->_leftLayer setGeometryFlipped:1];
        [(CALayer *)self->_leftLayer setAllowsEdgeAntialiasing:0];
      }
      if (!self->_rightLayer)
      {
        objc_super v5 = [MEMORY[0x1E4F39BE8] layer];
        rightLayer = self->_rightLayer;
        self->_rightLayer = v5;

        [(_MKCalloutLayer *)self addSublayer:self->_rightLayer];
        [(_MKCalloutLayer *)self contentsScale];
        -[CALayer setContentsScale:](self->_rightLayer, "setContentsScale:");
        [(CALayer *)self->_rightLayer setGeometryFlipped:1];
        [(CALayer *)self->_rightLayer setAllowsEdgeAntialiasing:0];
      }
      [(CALayer *)self->_leftLayer setContents:self->_contentImage];
      -[CALayer setContentsRect:](self->_leftLayer, "setContentsRect:", 0.0, 0.0, 0.5, 1.0);
      [(_MKCalloutLayer *)self _contentSize];
      -[CALayer setContentsCenter:](self->_leftLayer, "setContentsCenter:", self->_metrics.cornerRadius / (v7 * 0.5), 1.0 - self->_metrics.cornerRadius / v8, 1.0 / v7, 1.0 / v8);
      double v9 = [(CALayer *)self->_leftLayer contents];
      [(CALayer *)self->_rightLayer setContents:v9];

      [(CALayer *)self->_leftLayer contentsRect];
      -[CALayer setContentsRect:](self->_rightLayer, "setContentsRect:");
      CATransform3DMakeScale(&v45, -1.0, 1.0, 1.0);
      v10 = self->_rightLayer;
      CATransform3D v44 = v45;
      [(CALayer *)v10 setTransform:&v44];
      [(CALayer *)self->_leftLayer contentsCenter];
      double v15 = (_MKCalloutLayer *)self->_rightLayer;
    }
    else
    {
      [(CALayer *)self->_leftLayer removeFromSuperlayer];
      double v16 = self->_leftLayer;
      self->_leftLayer = 0;

      [(CALayer *)self->_rightLayer removeFromSuperlayer];
      double v17 = self->_rightLayer;
      self->_rightLayer = 0;

      double cornerRadius = self->_metrics.cornerRadius;
      double v19 = cornerRadius * 2.0 + 1.0;
      [(_MKCalloutLayer *)self setContents:self->_contentImage];
      double v11 = cornerRadius / v19;
      double v13 = 1.0 / v19;
      double v15 = self;
      double v12 = cornerRadius / v19;
      double v14 = 1.0 / v19;
    }
    -[_MKCalloutLayer setContentsCenter:](v15, "setContentsCenter:", v11, v12, v13, v14);
  }
  if (self->_arrowPosition)
  {
    [(_MKCalloutLayer *)self bounds];
    int64_t arrowPosition = self->_arrowPosition;
    if ((unint64_t)(arrowPosition - 3) <= 1) {
      double v25 = v22;
    }
    else {
      double v25 = v23;
    }
    if ((unint64_t)(arrowPosition - 3) <= 1) {
      double v26 = v23;
    }
    else {
      double v26 = v22;
    }
    if ((unint64_t)(arrowPosition - 3) <= 1) {
      double v27 = (v22 - v23) * 0.5;
    }
    else {
      double v27 = v20;
    }
    double arrowOffset = self->_arrowOffset;
    if ((unint64_t)(arrowPosition - 3) <= 1) {
      double v29 = (v23 - v22) * 0.5;
    }
    else {
      double v29 = v21;
    }
    if (arrowPosition == 4) {
      double arrowOffset = -arrowOffset;
    }
    double v30 = v26 * 0.5 + arrowOffset;
    [(_MKCalloutLayer *)self contentsScale];
    double v32 = round(v31 * v30);
    [(_MKCalloutLayer *)self contentsScale];
    double v34 = v26 - v32 / v33;
    double v35 = v27 + v32 / v33;
    -[CALayer setFrame:](self->_leftLayer, "setFrame:", v27, v29);
    -[CALayer setFrame:](self->_rightLayer, "setFrame:", v35, v29, v34, v25);
    int64_t v36 = self->_arrowPosition;
    switch(v36)
    {
      case 4:
        CATransform3DMakeRotation(&v39, -1.57079633, 0.0, 0.0, 1.0);
        CATransform3D v38 = v39;
        v37 = &v38;
        break;
      case 3:
        CATransform3DMakeRotation(&v41, 1.57079633, 0.0, 0.0, 1.0);
        CATransform3D v40 = v41;
        v37 = &v40;
        break;
      case 1:
        CATransform3DMakeScale(&v43, 1.0, -1.0, 1.0);
        CATransform3D v42 = v43;
        v37 = &v42;
        break;
      default:
        return;
    }
    -[_MKCalloutLayer setSublayerTransform:](self, "setSublayerTransform:", v37, *(_OWORD *)&v38.m11, *(_OWORD *)&v38.m13, *(_OWORD *)&v38.m21, *(_OWORD *)&v38.m23, *(_OWORD *)&v38.m31, *(_OWORD *)&v38.m33, *(_OWORD *)&v38.m41, *(_OWORD *)&v38.m43);
  }
}

- ($FF53E27891FDD234AA19505A5983CE46)metrics
{
  long long v3 = *(_OWORD *)&self[1].var3;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[1].var1;
  *(_OWORD *)&retstr->var5.var1.var1 = v3;
  long long v4 = *(_OWORD *)&self[1].var6;
  *($CAB4DCDF46D014B19132C003A101DDEC *)&retstr->var8.top = self[1].var5;
  *(_OWORD *)&retstr->var8.bottom = v4;
  long long v5 = *(_OWORD *)&self->var8.right;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var8.left;
  *(_OWORD *)&retstr->var2 = v5;
  return self;
}

- (void)setMetrics:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var2;
  *(_OWORD *)&self->_metrics.margin = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_metrics.double arrowBase = v3;
  long long v4 = *(_OWORD *)&a3->var8.bottom;
  long long v6 = *(_OWORD *)&a3->var4;
  long long v5 = *(_OWORD *)&a3->var5.var1.var1;
  *(_OWORD *)&self->_metrics.padding.top = *(_OWORD *)&a3->var8.top;
  *(_OWORD *)&self->_metrics.padding.bottom = v4;
  *(_OWORD *)&self->_metrics.useRadialSmoothing = v6;
  *(_OWORD *)&self->_metrics.var0.nonRadialSmoothing.arrowPointFactor = v5;
}

- (int64_t)arrowPosition
{
  return self->_arrowPosition;
}

- (double)arrowOffset
{
  return self->_arrowOffset;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (void)setFillColor:(id)a3
{
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (void)setStrokeColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_rightLayer, 0);

  objc_storeStrong((id *)&self->_leftLayer, 0);
}

@end