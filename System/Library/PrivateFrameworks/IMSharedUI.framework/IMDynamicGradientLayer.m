@interface IMDynamicGradientLayer
- (CALayer)gradientLayer;
- (CATransformLayer)trackingLayer;
- (CGColorSpace)colorSpace;
- (CGImage)gradient;
- (CGRect)gradientFrame;
- (IMDynamicGradientLayer)init;
- (IMDynamicGradientReferenceView)referenceView;
- (NSArray)colors;
- (double)_floorToPixels:(double)a3;
- (double)screenScale;
- (id)description;
- (void)_updateAnimation;
- (void)_updateGradientImage;
- (void)dealloc;
- (void)didMoveToWindow:(id)a3;
- (void)layerDidBecomeVisible:(BOOL)a3;
- (void)layoutSublayers;
- (void)setColorSpace:(CGColorSpace *)a3;
- (void)setColors:(id)a3;
- (void)setGradientFrame:(CGRect)a3;
- (void)setGradientLayer:(id)a3;
- (void)setReferenceView:(id)a3;
- (void)setScreenScale:(double)a3;
- (void)setTrackingLayer:(id)a3;
@end

@implementation IMDynamicGradientLayer

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)IMDynamicGradientLayer;
  v4 = [(IMDynamicGradientLayer *)&v11 description];
  v7 = objc_msgSend_referenceView(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ referenceView:%@", v4, v7);

  return v9;
}

- (IMDynamicGradientLayer)init
{
  v21.receiver = self;
  v21.super_class = (Class)IMDynamicGradientLayer;
  v2 = [(IMDynamicGradientLayer *)&v21 init];
  v5 = v2;
  if (v2)
  {
    objc_msgSend_setScreenScale_(v2, v3, v4, 1.0);
    v8 = objc_msgSend_layer(MEMORY[0x263F157E8], v6, v7);
    objc_msgSend_setAnchorPoint_(v8, v9, v10, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
    v13 = objc_msgSend_layer(MEMORY[0x263F15908], v11, v12);
    CATransform3DMakeScale(&v20, -1.0, -1.0, 1.0);
    objc_msgSend_setSublayerTransform_(v13, v14, (uint64_t)&v20);
    objc_msgSend_setTrackingLayer_(v5, v15, (uint64_t)v13);
    objc_msgSend_addSublayer_(v5, v16, (uint64_t)v13);
    objc_msgSend_setGradientLayer_(v5, v17, (uint64_t)v8);
    objc_msgSend_addSublayer_(v13, v18, (uint64_t)v8);
  }
  return v5;
}

- (void)dealloc
{
  CGColorSpaceRelease(self->_colorSpace);
  v3.receiver = self;
  v3.super_class = (Class)IMDynamicGradientLayer;
  [(IMDynamicGradientLayer *)&v3 dealloc];
}

- (void)layerDidBecomeVisible:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    objc_msgSend__updateAnimation(self, a2, a3);
  }
  v5.receiver = self;
  v5.super_class = (Class)IMDynamicGradientLayer;
  [(IMDynamicGradientLayer *)&v5 layerDidBecomeVisible:v3];
}

- (void)layoutSublayers
{
  v74.receiver = self;
  v74.super_class = (Class)IMDynamicGradientLayer;
  [(IMDynamicGradientLayer *)&v74 layoutSublayers];
  objc_super v5 = objc_msgSend_superlayer(self, v3, v4);
  uint64_t v8 = objc_msgSend_referenceView(self, v6, v7);
  objc_super v11 = (void *)v8;
  if (v5)
  {
    if (v8)
    {
      objc_msgSend_bounds(self, v9, v10);
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      objc_msgSend_gradientFrame(v11, v20, v21);
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      double v27 = v26;
      double v29 = v28;
      objc_msgSend_gradientFrame(v11, v30, v31);
      double v69 = v32;
      double v70 = v33;
      double v67 = v35;
      double v68 = v34;
      double v66 = v13;
      v75.origin.x = v13;
      double v36 = v15;
      v75.origin.y = v15;
      double v37 = v17;
      v75.size.width = v17;
      double v38 = v19;
      v75.size.height = v19;
      double v39 = v27;
      if (!CGRectIsEmpty(v75))
      {
        v76.origin.x = v23;
        v76.origin.y = v25;
        v76.size.width = v27;
        v76.size.height = v29;
        if (!CGRectIsEmpty(v76))
        {
          v77.origin.x = v69;
          v77.origin.y = v70;
          v77.size.height = v67;
          v77.size.width = v68;
          if (!CGRectIsEmpty(v77))
          {
            objc_msgSend_setGradientFrame_(self, v40, v41, v69, v70, v68, v67);
            double v42 = v37 / v27 * (v68 / v27);
            objc_msgSend_begin(MEMORY[0x263F158F8], v43, v44);
            objc_msgSend_setDisableActions_(MEMORY[0x263F158F8], v45, 1);
            v48 = objc_msgSend_trackingLayer(self, v46, v47);
            objc_msgSend_setBounds_(v48, v49, v50, 0.0, 0.0, v42, v38 / v29 * (v67 / v29));
            v78.origin.x = v66;
            v78.origin.y = v36;
            v78.size.width = v37;
            v78.size.height = v38;
            double MidX = CGRectGetMidX(v78);
            v79.origin.x = v66;
            v79.origin.y = v36;
            v79.size.width = v37;
            v79.size.height = v38;
            CGFloat MidY = CGRectGetMidY(v79);
            objc_msgSend_setPosition_(v48, v53, v54, MidX, MidY);
            CATransform3DMakeScale(&v73, -v39, -v29, 1.0);
            objc_msgSend_setTransform_(v48, v55, (uint64_t)&v73);
            v58 = objc_msgSend_gradientLayer(self, v56, v57);
            objc_msgSend_setContentsRect_(v58, v59, v60, -v42 - v69 / v39, -(v38 / v29 * (v67 / v29)) - v70 / v29, v42, v38 / v29 * (v67 / v29));
            objc_msgSend_setBounds_(v58, v61, v62, v66, v36, v37, v38);
            CATransform3DMakeScale(&v71, 1.0 / v39, 1.0 / v29, 1.0);
            CATransform3DTranslate(&v72, &v71, 0.0, 0.0, 0.0);
            objc_msgSend_setTransform_(v58, v63, (uint64_t)&v72);
            objc_msgSend_commit(MEMORY[0x263F158F8], v64, v65);
          }
        }
      }
    }
  }
}

- (void)setReferenceView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_referenceView);

  id v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_referenceView, obj);
    objc_msgSend__updateGradientImage(self, v7, v8);
    uint64_t updated = objc_msgSend__updateAnimation(self, v9, v10);
    id v6 = obj;
    if (obj)
    {
      objc_msgSend_gradientFrame(obj, (const char *)obj, v11);
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      objc_msgSend_gradientFrame(self, v20, v21);
      v30.origin.x = v22;
      v30.origin.y = v23;
      v30.size.width = v24;
      v30.size.height = v25;
      v29.origin.x = v13;
      v29.origin.y = v15;
      v29.size.width = v17;
      v29.size.height = v19;
      uint64_t updated = CGRectEqualToRect(v29, v30);
      id v6 = obj;
      if ((updated & 1) == 0)
      {
        uint64_t updated = objc_msgSend_setNeedsLayout(self, (const char *)obj, v26);
        id v6 = obj;
      }
    }
  }
  MEMORY[0x270F9A758](updated, v6);
}

- (void)didMoveToWindow:(id)a3
{
  if (a3) {
    objc_msgSend__updateAnimation(self, a2, (uint64_t)a3);
  }
}

- (void)setColors:(id)a3
{
  id v11 = a3;
  if ((objc_msgSend_isEqualToArray_(self->_colors, v4, (uint64_t)v11) & 1) == 0)
  {
    uint64_t v7 = (NSArray *)objc_msgSend_copy(v11, v5, v6);
    colors = self->_colors;
    self->_colors = v7;

    objc_msgSend__updateGradientImage(self, v9, v10);
  }
}

- (void)setScreenScale:(double)a3
{
  if (self->_screenScale != a3)
  {
    self->_screenScale = a3;
    objc_msgSend__updateGradientImage(self, a2, v3);
  }
}

- (void)setColorSpace:(CGColorSpace *)a3
{
  if (self->_colorSpace != a3 && (CGColorSpaceEqualToColorSpace() & 1) == 0)
  {
    CGColorSpaceRelease(self->_colorSpace);
    self->_colorSpace = CGColorSpaceRetain(a3);
    objc_msgSend__updateGradientImage(self, v5, v6);
  }
}

- (CGColorSpace)colorSpace
{
  result = self->_colorSpace;
  if (!result)
  {
    result = CGColorSpaceCreateDeviceRGB();
    self->_colorSpace = result;
  }
  return result;
}

- (CGImage)gradient
{
  v47[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend_colors(self, a2, v2);
  uint64_t v7 = objc_msgSend_referenceView(self, v5, v6);
  uint64_t v10 = (void *)v7;
  Image = 0;
  if (v4 && v7)
  {
    if (qword_267BC01E0 != -1) {
      dispatch_once(&qword_267BC01E0, &unk_26C918F98);
    }
    objc_msgSend_gradientFrame(v10, v8, v9);
    objc_msgSend__floorToPixels_(self, v12, v13, v14);
    double v16 = v15;
    CGFloat v19 = objc_msgSend_numberWithDouble_(NSNumber, v17, v18);
    CGFloat v22 = objc_msgSend_objectForKey_((void *)qword_267BC01D8, v20, (uint64_t)v19);
    if (!v22)
    {
      CGFloat v22 = objc_msgSend_dictionaryWithCapacity_(MEMORY[0x263EFF9A0], v21, 2);
      objc_msgSend_setObject_forKey_((void *)qword_267BC01D8, v23, (uint64_t)v22, v19);
    }
    Image = (CGImage *)objc_msgSend_objectForKey_(v22, v21, (uint64_t)v4);
    if (!Image)
    {
      objc_msgSend_screenScale(self, v24, v25);
      double v27 = v16 * v26;
      CFIndex v30 = objc_msgSend_count(v4, v28, v29);
      Mutable = CFArrayCreateMutable(0, v30, MEMORY[0x263EFFF70]);
      v47[0] = v47;
      MEMORY[0x270FA5388](Mutable);
      double v33 = (const CGFloat *)((char *)v47 - v32);
      bzero((char *)v47 - v32, v34);
      if (v30 >= 1)
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          double v38 = objc_msgSend_objectAtIndexedSubscript_(v4, v35, i);
          CFArrayAppendValue(Mutable, v38);

          v33[i] = (double)i / (double)(v30 - 1);
        }
      }
      double v39 = (CGColorSpace *)objc_msgSend_colorSpace(self, v35, v36);
      CGContextRef v40 = CGBitmapContextCreate(0, 1uLL, (unint64_t)v27, 8uLL, 4uLL, v39, 5u);
      if (v40)
      {
        uint64_t v41 = v40;
        CGFloat v42 = *MEMORY[0x263F00148];
        CGFloat v43 = *(double *)(MEMORY[0x263F00148] + 8);
        uint64_t v44 = CGGradientCreateWithColors(0, Mutable, v33);
        v49.x = 0.0;
        v48.x = v42;
        v48.y = v43;
        v49.y = v27;
        CGContextDrawLinearGradient(v41, v44, v48, v49, 0);
        Image = CGBitmapContextCreateImage(v41);
        CGGradientRelease(v44);
        CGContextRelease(v41);
        if (Image)
        {
          objc_msgSend_setObject_forKey_(v22, v45, (uint64_t)Image, v4);
          CGImageRelease(Image);
        }
      }
      else
      {
        _IMWarn();
        CGContextRelease(0);
        Image = 0;
      }
      if (Mutable) {
        CFRelease(Mutable);
      }
    }
  }
  return Image;
}

- (void)_updateAnimation
{
  v33[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend_gradientLayer(self, a2, v2);
  objc_msgSend_removeAnimationForKey_(v4, v5, @"matchmove");
  uint64_t v8 = objc_msgSend_superlayer(self, v6, v7);
  uint64_t v11 = objc_msgSend_referenceView(self, v9, v10);
  double v12 = (void *)v11;
  if (v8 && v11)
  {
    id v13 = objc_alloc_init(MEMORY[0x263F15800]);
    objc_msgSend_setKeyPath_(v13, v14, @"contentsRect.origin");
    CGFloat v17 = objc_msgSend_layer(v12, v15, v16);
    objc_msgSend_setSourceLayer_(v13, v18, (uint64_t)v17);

    objc_msgSend_setDuration_(v13, v19, v20, INFINITY);
    CGFloat v23 = objc_msgSend_valueWithCGPoint_(MEMORY[0x263F08D40], v21, v22, 0.0, 0.0);
    v33[0] = v23;
    uint64_t v25 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v24, (uint64_t)v33, 1);
    objc_msgSend_setSourcePoints_(v13, v26, (uint64_t)v25);

    objc_msgSend_setBeginTimeMode_(v13, v27, @"absolute");
    objc_msgSend_setBeginTime_(v13, v28, v29, 0.0);
    objc_msgSend_setAdditive_(v13, v30, 1);
    objc_msgSend_setTargetsSuperlayer_(v13, v31, 1);
    objc_msgSend_addAnimation_forKey_(v4, v32, (uint64_t)v13, @"matchmove");
  }
}

- (double)_floorToPixels:(double)a3
{
  objc_msgSend_screenScale(self, a2, v3);
  return floor(v5 * a3) / v5;
}

- (void)_updateGradientImage
{
  objc_msgSend_begin(MEMORY[0x263F158F8], a2, v2);
  objc_msgSend_setDisableActions_(MEMORY[0x263F158F8], v4, 1);
  uint64_t v7 = objc_msgSend_gradientLayer(self, v5, v6);
  uint64_t v10 = objc_msgSend_gradient(self, v8, v9);
  objc_msgSend_setContents_(v7, v11, v10);

  double v14 = (void *)MEMORY[0x263F158F8];
  objc_msgSend_commit(v14, v12, v13);
}

- (double)screenScale
{
  return self->_screenScale;
}

- (IMDynamicGradientReferenceView)referenceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_referenceView);
  return (IMDynamicGradientReferenceView *)WeakRetained;
}

- (NSArray)colors
{
  return self->_colors;
}

- (CALayer)gradientLayer
{
  return self->_gradientLayer;
}

- (void)setGradientLayer:(id)a3
{
}

- (CGRect)gradientFrame
{
  double x = self->_gradientFrame.origin.x;
  double y = self->_gradientFrame.origin.y;
  double width = self->_gradientFrame.size.width;
  double height = self->_gradientFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setGradientFrame:(CGRect)a3
{
  self->_gradientFrame = a3;
}

- (CATransformLayer)trackingLayer
{
  return self->_trackingLayer;
}

- (void)setTrackingLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingLayer, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_colors, 0);
  objc_destroyWeak((id *)&self->_referenceView);
}

@end