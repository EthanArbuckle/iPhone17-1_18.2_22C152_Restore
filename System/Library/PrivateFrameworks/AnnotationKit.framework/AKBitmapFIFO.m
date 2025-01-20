@interface AKBitmapFIFO
- (AKBitmapFIFO)initWithFIFO:(id)a3;
- (BOOL)bitmapSizeHasBeenUpdatedOnceForLiveDraw;
- (BOOL)isInLiveDraw;
- (CGAffineTransform)viewToBitmapTransform;
- (CGImage)currentBitmap;
- (CGPath)newPathFromCurrentBitmap;
- (CGPoint)_convertPointToScreenBacking:(CGPoint)a3;
- (CGRect)bitmapRectInView;
- (CGRect)unionDirtyRect;
- (CGSize)bitmapSize;
- (UIView)view;
- (double)bitmapSizeMultiplier;
- (double)lastPoint;
- (double)shadowRadiusInView;
- (void)_addPointToBitmap:(AKBitmapFIFO *)self;
- (void)_addSinglePointToBitmap:(AKBitmapFIFO *)self;
- (void)_addToDirtyRect:(CGRect)a3;
- (void)_applyDirtyRectToView;
- (void)_clearAllBitmapData;
- (void)_clearCachedPath;
- (void)_createBitmapContextIfNecessary;
- (void)_createBitmapIfNecessary;
- (void)_updateBitmapSizeFromViewIfNecessary;
- (void)addPoint:(AKBitmapFIFO *)self;
- (void)clear;
- (void)flush;
- (void)resetDirtyRect;
- (void)setBitmapSize:(CGSize)a3;
- (void)setBitmapSizeHasBeenUpdatedOnceForLiveDraw:(BOOL)a3;
- (void)setBitmapSizeMultiplier:(double)a3;
- (void)setIsInLiveDraw:(BOOL)a3;
- (void)setLastPoint:(AKBitmapFIFO *)self;
- (void)setShadowRadiusInView:(double)a3;
- (void)setUnionDirtyRect:(CGRect)a3;
- (void)setView:(id)a3;
- (void)setViewToBitmapTransform:(CGAffineTransform *)a3;
- (void)teardown;
@end

@implementation AKBitmapFIFO

- (AKBitmapFIFO)initWithFIFO:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AKBitmapFIFO;
  v3 = [(CHPointFIFO *)&v8 initWithFIFO:a3];
  v4 = v3;
  if (v3)
  {
    -[AKBitmapFIFO setBitmapSize:](v3, "setBitmapSize:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
    [(AKBitmapFIFO *)v4 setBitmapSizeHasBeenUpdatedOnceForLiveDraw:0];
    long long v5 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    v7[0] = *MEMORY[0x263F000D0];
    v7[1] = v5;
    v7[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    [(AKBitmapFIFO *)v4 setViewToBitmapTransform:v7];
    [(AKBitmapFIFO *)v4 setBitmapSizeMultiplier:1.0];
    [(AKBitmapFIFO *)v4 setLastPoint:0.0];
    -[AKBitmapFIFO setUnionDirtyRect:](v4, "setUnionDirtyRect:", *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
  }
  return v4;
}

- (void)teardown
{
  [(AKBitmapFIFO *)self setView:0];

  [(AKBitmapFIFO *)self _clearAllBitmapData];
}

- (void)addPoint:(AKBitmapFIFO *)self
{
  double v4 = v2;
  [(AKBitmapFIFO *)self _clearCachedPath];
  [(AKBitmapFIFO *)self _createBitmapContextIfNecessary];
  [(AKBitmapFIFO *)self _addPointToBitmap:v4];

  MEMORY[0x270F9A6D0](self, sel_emitPoint_);
}

- (void)flush
{
  v3.receiver = self;
  v3.super_class = (Class)AKBitmapFIFO;
  [(CHPointFIFO *)&v3 flush];
  [(AKBitmapFIFO *)self setLastPoint:0.0];
  [(AKBitmapFIFO *)self resetDirtyRect];
}

- (void)clear
{
  v4.receiver = self;
  v4.super_class = (Class)AKBitmapFIFO;
  [(CHPointFIFO *)&v4 clear];
  [(AKBitmapFIFO *)self _clearCachedPath];
  [(AKBitmapFIFO *)self _clearAllBitmapData];
  objc_super v3 = [(AKBitmapFIFO *)self view];
  [v3 setNeedsDisplay];

  [(AKBitmapFIFO *)self setLastPoint:0.0];
  [(AKBitmapFIFO *)self resetDirtyRect];
}

- (void)setIsInLiveDraw:(BOOL)a3
{
  if (self->_isInLiveDraw != a3)
  {
    self->_isInLiveDraw = a3;
    [(AKBitmapFIFO *)self setBitmapSizeHasBeenUpdatedOnceForLiveDraw:0];
  }
}

- (void)setView:(id)a3
{
  long long v5 = (UIView *)a3;
  if (self->_view != v5)
  {
    v6 = v5;
    [(AKBitmapFIFO *)self clear];
    objc_storeStrong((id *)&self->_view, a3);
    [(AKBitmapFIFO *)self _updateBitmapSizeFromViewIfNecessary];
    long long v5 = v6;
  }
}

- (void)resetDirtyRect
{
}

- (CGRect)bitmapRectInView
{
  objc_super v3 = [(AKBitmapFIFO *)self view];
  [v3 bounds];
  CGFloat x = v4;
  CGFloat y = v6;
  CGFloat width = v8;
  CGFloat height = v10;
  if (!+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:"))
  {
    double v12 = *MEMORY[0x263F00148];
    double v13 = *(double *)(MEMORY[0x263F00148] + 8);
    -[AKBitmapFIFO _convertPointToScreenBacking:](self, "_convertPointToScreenBacking:", 1.0, 0.0);
    double v15 = v14;
    double v17 = v16;
    -[AKBitmapFIFO _convertPointToScreenBacking:](self, "_convertPointToScreenBacking:", v12, v13);
    double v19 = vabdd_f64(v15, v18);
    double v21 = vabdd_f64(v17, v20);
    if (v19 < v21) {
      double v19 = v21;
    }
    CGFloat v22 = 1.0 / v19 * -200.0;
    v27.origin.CGFloat x = x;
    v27.origin.CGFloat y = y;
    v27.size.CGFloat width = width;
    v27.size.CGFloat height = height;
    CGRect v28 = CGRectInset(v27, v22, v22);
    CGFloat x = v28.origin.x;
    CGFloat y = v28.origin.y;
    CGFloat width = v28.size.width;
    CGFloat height = v28.size.height;
  }

  double v23 = x;
  double v24 = y;
  double v25 = width;
  double v26 = height;
  result.size.CGFloat height = v26;
  result.size.CGFloat width = v25;
  result.origin.CGFloat y = v24;
  result.origin.CGFloat x = v23;
  return result;
}

- (CGImage)currentBitmap
{
  return self->_bitmapImage;
}

- (CGPath)newPathFromCurrentBitmap
{
  cachedPath = self->_cachedPath;
  if (!cachedPath)
  {
    double v4 = [[AKPotrace alloc] initWithCGImage:[(AKBitmapFIFO *)self currentBitmap] flipped:1 whiteIsInside:1];
    long long v5 = v4;
    if (v4)
    {
      [(AKPotrace *)v4 setTurdsize:0];
      uint64_t v6 = [(AKPotrace *)v5 CGPath];
      memset(&v9, 0, sizeof(v9));
      [(AKBitmapFIFO *)self viewToBitmapTransform];
      CGAffineTransformInvert(&v9, &v8);
      self->_cachedPath = (CGPath *)MEMORY[0x237E1D700](v6, &v9);
    }

    cachedPath = self->_cachedPath;
  }
  return CGPathCreateMutableCopy(cachedPath);
}

- (void)_clearCachedPath
{
  cachedPath = self->_cachedPath;
  if (cachedPath)
  {
    CGPathRelease(cachedPath);
    self->_cachedPath = 0;
  }
}

- (CGPoint)_convertPointToScreenBacking:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  long long v5 = [(AKBitmapFIFO *)self view];
  uint64_t v6 = [v5 window];
  objc_msgSend(v5, "convertPoint:toView:", v6, x, y);
  objc_msgSend(v6, "convertPoint:toWindow:", 0);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (void)_updateBitmapSizeFromViewIfNecessary
{
  if (![(AKBitmapFIFO *)self isInLiveDraw]
    || ![(AKBitmapFIFO *)self bitmapSizeHasBeenUpdatedOnceForLiveDraw])
  {
    [(AKBitmapFIFO *)self bitmapRectInView];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    if (!+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:"))
    {
      memset(&v67, 0, sizeof(v67));
      v68.origin.CGFloat x = v4;
      v68.origin.CGFloat y = v6;
      v68.size.CGFloat width = v8;
      v68.size.CGFloat height = v10;
      CGFloat v11 = -CGRectGetMidX(v68);
      v69.origin.CGFloat x = v4;
      v69.origin.CGFloat y = v6;
      v69.size.CGFloat width = v8;
      v69.size.CGFloat height = v10;
      CGFloat MidY = CGRectGetMidY(v69);
      CGAffineTransformMakeTranslation(&v67, v11, -MidY);
      v66[0] = MEMORY[0x263EF8330];
      v66[1] = 3221225472;
      v66[2] = sub_2376A78F0;
      v66[3] = &unk_264CDB6A0;
      v66[4] = self;
      int64_t v13 = +[AKGeometryHelper exifOrientationWithConversionBlock:v66];
      memset(&v65, 0, sizeof(v65));
      +[AKGeometryHelper affineTransformForExifOrientation:aboutCenter:](AKGeometryHelper, "affineTransformForExifOrientation:aboutCenter:", v13, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
      v70.origin.CGFloat x = v4;
      v70.origin.CGFloat y = v6;
      v70.size.CGFloat width = v8;
      v70.size.CGFloat height = v10;
      double MinX = CGRectGetMinX(v70);
      v71.origin.CGFloat x = v4;
      v71.origin.CGFloat y = v6;
      v71.size.CGFloat width = v8;
      v71.size.CGFloat height = v10;
      double MinY = CGRectGetMinY(v71);
      v72.origin.CGFloat x = v4;
      v72.origin.CGFloat y = v6;
      v72.size.CGFloat width = v8;
      v72.size.CGFloat height = v10;
      double MaxX = CGRectGetMaxX(v72);
      v73.origin.CGFloat x = v4;
      v73.origin.CGFloat y = v6;
      v73.size.CGFloat width = v8;
      v73.size.CGFloat height = v10;
      double MaxY = CGRectGetMaxY(v73);
      -[AKBitmapFIFO _convertPointToScreenBacking:](self, "_convertPointToScreenBacking:", MinX, MinY);
      double v19 = v18;
      double v21 = v20;
      -[AKBitmapFIFO _convertPointToScreenBacking:](self, "_convertPointToScreenBacking:", MaxX, MaxY);
      v74.size.CGFloat width = v22 - v19;
      v74.size.CGFloat height = v23 - v21;
      v74.origin.CGFloat x = v19;
      v74.origin.CGFloat y = v21;
      CGRect v75 = CGRectStandardize(v74);
      CGFloat x = v75.origin.x;
      CGFloat y = v75.origin.y;
      CGFloat width = v75.size.width;
      CGFloat height = v75.size.height;
      CGAffineTransform v64 = v65;
      v75.origin.CGFloat x = v4;
      v75.origin.CGFloat y = v6;
      v75.size.CGFloat width = v8;
      v75.size.CGFloat height = v10;
      CGRect v76 = CGRectApplyAffineTransform(v75, &v64);
      CGFloat v54 = v6;
      CGFloat v55 = v4;
      CGFloat v28 = v76.origin.x;
      CGFloat v49 = v76.origin.y;
      CGFloat rect = v76.origin.x;
      CGFloat rect_16 = v10;
      CGFloat rect_24 = v8;
      CGFloat v29 = v76.size.width;
      CGFloat v30 = v76.size.height;
      v76.origin.CGFloat x = x;
      v76.origin.CGFloat y = y;
      v76.size.CGFloat width = width;
      v76.size.CGFloat height = height;
      double v31 = CGRectGetWidth(v76);
      v77.origin.CGFloat x = v28;
      v77.origin.CGFloat y = v49;
      v77.size.CGFloat width = v29;
      v77.size.CGFloat height = v30;
      CGFloat rect_8 = v31 / CGRectGetWidth(v77);
      v78.origin.CGFloat x = x;
      CGFloat v32 = x;
      v78.origin.CGFloat y = y;
      v78.size.CGFloat width = width;
      v78.size.CGFloat height = height;
      double v33 = CGRectGetHeight(v78);
      v79.origin.CGFloat x = rect;
      v79.origin.CGFloat y = v49;
      v79.size.CGFloat width = v29;
      v79.size.CGFloat height = v30;
      CGFloat v34 = CGRectGetHeight(v79);
      memset(&v64, 0, sizeof(v64));
      CGAffineTransformMakeScale(&v64, rect_8, v33 / v34);
      memset(&v63, 0, sizeof(v63));
      v80.origin.CGFloat x = v32;
      v80.origin.CGFloat y = y;
      v80.size.CGFloat width = width;
      v80.size.CGFloat height = height;
      CGFloat v35 = CGRectGetWidth(v80) * 0.5;
      v81.origin.CGFloat x = v32;
      v81.origin.CGFloat y = y;
      v81.size.CGFloat width = width;
      v81.size.CGFloat height = height;
      CGFloat v36 = CGRectGetHeight(v81);
      CGAffineTransformMakeTranslation(&v63, v35, v36 * 0.5);
      memset(&v62, 0, sizeof(v62));
      [(AKBitmapFIFO *)self bitmapSizeMultiplier];
      CGFloat v38 = v37;
      [(AKBitmapFIFO *)self bitmapSizeMultiplier];
      CGAffineTransformMakeScale(&v62, v38, v39);
      long long v40 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      *(_OWORD *)&v61.a = *MEMORY[0x263F000D0];
      *(_OWORD *)&v61.c = v40;
      *(_OWORD *)&v61.tCGFloat x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
      *(_OWORD *)&t1.a = *(_OWORD *)&v61.a;
      *(_OWORD *)&t1.c = v40;
      *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&v61.tx;
      CGAffineTransform t2 = v67;
      CGAffineTransformConcat(&v61, &t1, &t2);
      CGAffineTransform t2 = v61;
      CGAffineTransform v58 = v65;
      CGAffineTransformConcat(&t1, &t2, &v58);
      CGAffineTransform v61 = t1;
      CGAffineTransform t2 = t1;
      CGAffineTransform v58 = v64;
      CGAffineTransformConcat(&t1, &t2, &v58);
      CGAffineTransform v61 = t1;
      CGAffineTransform t2 = t1;
      CGAffineTransform v58 = v63;
      CGAffineTransformConcat(&t1, &t2, &v58);
      CGAffineTransform v61 = t1;
      CGAffineTransform t2 = t1;
      CGAffineTransform v58 = v62;
      CGAffineTransformConcat(&t1, &t2, &v58);
      CGAffineTransform v61 = t1;
      v82.origin.CGFloat y = v54;
      v82.origin.CGFloat x = v55;
      v82.size.CGFloat height = rect_16;
      v82.size.CGFloat width = rect_24;
      CGRect v83 = CGRectApplyAffineTransform(v82, &t1);
      CGFloat v41 = v83.origin.x;
      CGFloat v42 = v83.origin.y;
      CGFloat v43 = v83.size.width;
      CGFloat v44 = v83.size.height;
      double v45 = floor(CGRectGetWidth(v83));
      v84.origin.CGFloat x = v41;
      v84.origin.CGFloat y = v42;
      v84.size.CGFloat width = v43;
      v84.size.CGFloat height = v44;
      double v46 = floor(CGRectGetHeight(v84));
      if (!+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:", 0.0, 0.0, v45, v46))
      {
        [(AKBitmapFIFO *)self bitmapSize];
        if (v45 != v48
          || v46 != v47
          || ([(AKBitmapFIFO *)self viewToBitmapTransform],
              CGAffineTransform t1 = v61,
              !CGAffineTransformEqualToTransform(&t1, &v57)))
        {
          -[AKBitmapFIFO setBitmapSize:](self, "setBitmapSize:", v45, v46);
          CGAffineTransform v56 = v61;
          [(AKBitmapFIFO *)self setViewToBitmapTransform:&v56];
          [(AKBitmapFIFO *)self _clearAllBitmapData];
          if ([(AKBitmapFIFO *)self isInLiveDraw]) {
            [(AKBitmapFIFO *)self setBitmapSizeHasBeenUpdatedOnceForLiveDraw:1];
          }
        }
      }
    }
  }
}

- (void)_addPointToBitmap:(AKBitmapFIFO *)self
{
  float32x4_t v15 = v2;
  CGImageRelease(self->_bitmapImage);
  self->_bitmapImage = 0;
  [(AKBitmapFIFO *)self lastPoint];
  float32x4_t v5 = v4;
  if (v4.f32[0] != 0.0 || v4.f32[1] != 0.0 || v4.f32[2] != 0.0)
  {
    v4.i32[0] = v15.i32[2];
    if (v4.f32[2] < v15.f32[2]) {
      v4.f32[0] = v4.f32[2];
    }
    double v6 = fmax(v4.f32[0] * 0.25, 0.01);
    float32x2_t v17 = (float32x2_t)vsubq_f32(v15, v5).u64[0];
    float32x2_t v18 = *(float32x2_t *)v5.f32;
    *(float *)v7.i32 = hypotf(v17.f32[0], v17.f32[1]);
    float32x2_t v8 = v18;
    double v9 = *(float *)v7.i32;
    if (v6 < *(float *)v7.i32)
    {
      unint64_t v10 = vcvtmd_u64_f64(v9 / v6);
      float32x2_t v11 = vdiv_f32(v17, (float32x2_t)vdup_lane_s32(v7, 0));
      if (v10)
      {
        float v12 = v9 / (double)(v10 + 1);
        float32x2_t v13 = vmul_n_f32(v11, v12);
        for (unint64_t i = 1; i <= v10; ++i)
        {
          -[AKBitmapFIFO _addSinglePointToBitmap:](self, "_addSinglePointToBitmap:", COERCE_DOUBLE(vmla_n_f32(v8, v13, (float)i)), *(_OWORD *)&v15);
          float32x2_t v8 = v18;
        }
      }
    }
  }
  -[AKBitmapFIFO _addSinglePointToBitmap:](self, "_addSinglePointToBitmap:", *(double *)v15.i64, *(_OWORD *)&v15);
  [(AKBitmapFIFO *)self setLastPoint:v16];

  MEMORY[0x270F9A6D0](self, sel__applyDirtyRectToView);
}

- (void)_createBitmapContextIfNecessary
{
  [(AKBitmapFIFO *)self _updateBitmapSizeFromViewIfNecessary];
  [(AKBitmapFIFO *)self bitmapSize];
  double v4 = v3;
  double v5 = round(v3);
  [(AKBitmapFIFO *)self bitmapSize];
  double v7 = v6;
  if (!+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:", 0.0, 0.0, (double)(unint64_t)v5, (double)(unint64_t)round(v6))&& !self->_bitmapContext)
  {
    size_t v8 = vcvtad_u64_f64(v4);
    size_t v9 = vcvtad_u64_f64(v7);
    if (self->_bitmapDataPtr
      || is_mul_ok(v8, v9)
      && (float32x2_t v13 = (char *)malloc_type_calloc(v8 * v9, 1uLL, 0x100004077774924uLL), (self->_bitmapDataPtr = v13) != 0))
    {
      DeviceGraCGFloat y = CGColorSpaceCreateDeviceGray();
      if (DeviceGray)
      {
        float32x2_t v11 = DeviceGray;
        if (!self->_bitmapContext)
        {
          float v12 = CGBitmapContextCreate(self->_bitmapDataPtr, v8, v9, 8uLL, v8, DeviceGray, 0);
          self->_bitmapContext = v12;
          if (!v12) {
            [(AKBitmapFIFO *)self _clearAllBitmapData];
          }
        }
        CGColorSpaceRelease(v11);
      }
    }
    else
    {
      [(AKBitmapFIFO *)self _clearAllBitmapData];
    }
  }
}

- (void)_createBitmapIfNecessary
{
  if (!self->_bitmapImage)
  {
    [(AKBitmapFIFO *)self _createBitmapContextIfNecessary];
    bitmapContext = self->_bitmapContext;
    if (bitmapContext) {
      self->_bitmapImage = CGBitmapContextCreateImage(bitmapContext);
    }
  }
}

- (void)_clearAllBitmapData
{
  bitmapImage = self->_bitmapImage;
  if (bitmapImage)
  {
    CGImageRelease(bitmapImage);
    self->_bitmapImage = 0;
  }
  bitmapContext = self->_bitmapContext;
  if (bitmapContext)
  {
    CGContextRelease(bitmapContext);
    self->_bitmapContext = 0;
  }
  bitmapDataPtr = self->_bitmapDataPtr;
  if (bitmapDataPtr)
  {
    free(bitmapDataPtr);
    self->_bitmapDataPtr = 0;
  }
}

- (void)_addSinglePointToBitmap:(AKBitmapFIFO *)self
{
  long long v14 = v2;
  bitmapContext = self->_bitmapContext;
  id v5 = [MEMORY[0x263F1C550] whiteColor];
  CGContextSetFillColorWithColor(bitmapContext, (CGColorRef)[v5 CGColor]);

  CGContextSaveGState(self->_bitmapContext);
  double v6 = self->_bitmapContext;
  [(AKBitmapFIFO *)self viewToBitmapTransform];
  CGContextConcatCTM(v6, &transform);
  v16.origin.CGFloat x = *(float *)&v14 - *((float *)&v14 + 2) * 0.5;
  v16.origin.CGFloat y = *((float *)&v14 + 1) - *((float *)&v14 + 2) * 0.5;
  v16.size.CGFloat width = *((float *)&v14 + 2);
  v16.size.CGFloat height = *((float *)&v14 + 2);
  CGContextFillEllipseInRect(self->_bitmapContext, v16);
  [(AKBitmapFIFO *)self shadowRadiusInView];
  double v8 = *(float *)&v14 - (*((float *)&v14 + 2) + v7 * 2.0) * 0.5;
  [(AKBitmapFIFO *)self shadowRadiusInView];
  double v10 = *((float *)&v14 + 1) - (*((float *)&v14 + 2) + v9 * 2.0) * 0.5;
  [(AKBitmapFIFO *)self shadowRadiusInView];
  double v12 = *((float *)&v14 + 2) + v11 * 2.0;
  [(AKBitmapFIFO *)self shadowRadiusInView];
  -[AKBitmapFIFO _addToDirtyRect:](self, "_addToDirtyRect:", v8, v10, v12, *((float *)&v14 + 2) + v13 * 2.0);
  CGContextRestoreGState(self->_bitmapContext);
}

- (void)_addToDirtyRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(AKBitmapFIFO *)self unionDirtyRect];
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  CGRect v10 = CGRectUnion(v9, v11);

  -[AKBitmapFIFO setUnionDirtyRect:](self, "setUnionDirtyRect:", v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
}

- (void)_applyDirtyRectToView
{
  [(AKBitmapFIFO *)self unionDirtyRect];
  if (!CGRectIsNull(v5))
  {
    id v3 = [(AKBitmapFIFO *)self view];
    [(AKBitmapFIFO *)self unionDirtyRect];
    objc_msgSend(v3, "setNeedsDisplayInRect:");
  }
}

- (double)bitmapSizeMultiplier
{
  return self->_bitmapSizeMultiplier;
}

- (void)setBitmapSizeMultiplier:(double)a3
{
  self->_bitmapSizeMultiplier = a3;
}

- (BOOL)isInLiveDraw
{
  return self->_isInLiveDraw;
}

- (UIView)view
{
  return self->_view;
}

- (CGAffineTransform)viewToBitmapTransform
{
  objc_copyStruct(retstr, &self->_viewToBitmapTransform, 48, 1, 0);
  return result;
}

- (void)setViewToBitmapTransform:(CGAffineTransform *)a3
{
}

- (double)shadowRadiusInView
{
  return self->_shadowRadiusInView;
}

- (void)setShadowRadiusInView:(double)a3
{
  self->_shadowRadiusInView = a3;
}

- (CGSize)bitmapSize
{
  objc_copyStruct(v4, &self->_bitmapSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (void)setBitmapSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_bitmapSize, &v3, 16, 1, 0);
}

- (BOOL)bitmapSizeHasBeenUpdatedOnceForLiveDraw
{
  return self->_bitmapSizeHasBeenUpdatedOnceForLiveDraw;
}

- (void)setBitmapSizeHasBeenUpdatedOnceForLiveDraw:(BOOL)a3
{
  self->_bitmapSizeHasBeenUpdatedOnceForLiveDraw = a3;
}

- (double)lastPoint
{
  objc_copyStruct(&v2, (const void *)(a1 + 112), 16, 1, 0);
  return *(double *)&v2;
}

- (void)setLastPoint:(AKBitmapFIFO *)self
{
  long long v3 = v2;
  objc_copyStruct(self->_lastPoint, &v3, 16, 1, 0);
}

- (CGRect)unionDirtyRect
{
  objc_copyStruct(v6, &self->_unionDirtyRect, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (void)setUnionDirtyRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_unionDirtyRect, &v3, 32, 1, 0);
}

- (void).cxx_destruct
{
}

@end