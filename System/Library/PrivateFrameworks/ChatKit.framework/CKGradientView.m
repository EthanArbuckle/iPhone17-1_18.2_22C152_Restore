@interface CKGradientView
+ (id)gradientViews;
- (CALayer)trackingLayer;
- (CGRect)gradientFrame;
- (CKBaseLayer)gradientLayer;
- (CKGradientReferenceView)referenceView;
- (CKGradientView)initWithFrame:(CGRect)a3;
- (NSArray)colors;
- (UIImage)gradient;
- (UIImage)maskImage;
- (id)description;
- (void)_checkForInvalidLayoutIfNeeded;
- (void)_removeAllAnimations:(BOOL)a3;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setColors:(id)a3;
- (void)setGradientFrame:(CGRect)a3;
- (void)setGradientLayer:(id)a3;
- (void)setMaskImage:(id)a3;
- (void)setReferenceView:(id)a3;
- (void)setTrackingLayer:(id)a3;
- (void)updateAnimation;
- (void)updateGradientImage;
@end

@implementation CKGradientView

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CKGradientView;
  v4 = [(CKGradientView *)&v8 description];
  v5 = [(CKGradientView *)self referenceView];
  v6 = [v3 stringWithFormat:@"%@ referenceView:%@", v4, v5];

  return v6;
}

- (CKGradientView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CKGradientView;
  v3 = -[CKGradientView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[CKBaseLayer layer];
    [v4 setCkLayerDelegate:v3];
    objc_msgSend(v4, "setAnchorPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    v5 = [MEMORY[0x1E4F39BE8] layer];
    v6 = [(CKGradientView *)v3 layer];
    CATransform3DMakeScale(&v8, -1.0, -1.0, 1.0);
    [v5 setSublayerTransform:&v8];
    [(CKGradientView *)v3 setTrackingLayer:v5];
    [v6 addSublayer:v5];
    [(CKGradientView *)v3 setGradientLayer:v4];
    [v5 addSublayer:v4];
  }
  return v3;
}

- (void)layoutSubviews
{
  v49.receiver = self;
  v49.super_class = (Class)CKGradientView;
  [(CKGradientView *)&v49 layoutSubviews];
  v3 = [(CKGradientView *)self superview];
  v4 = [(CKGradientView *)self referenceView];
  v5 = [(CKGradientView *)self window];
  v6 = v5;
  if (!v5 || !v3) {
    goto LABEL_8;
  }

  if (v4)
  {
    [(CKGradientView *)self bounds];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    double v12 = v11;
    double v14 = v13;
    [v4 gradientFrame];
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    double v44 = v20;
    double v45 = v19;
    [v4 gradientFrame];
    double v42 = v21;
    double v43 = v22;
    double v24 = v23;
    double v26 = v25;
    v50.origin.x = v8;
    v50.origin.y = v10;
    v50.size.width = v12;
    v50.size.height = v14;
    if (!CGRectIsEmpty(v50))
    {
      v51.origin.x = v16;
      v51.origin.y = v18;
      v51.size.height = v44;
      v51.size.width = v45;
      if (!CGRectIsEmpty(v51))
      {
        v52.origin.x = v42;
        v52.origin.y = v43;
        v52.size.width = v24;
        v52.size.height = v26;
        if (!CGRectIsEmpty(v52))
        {
          -[CKGradientView setGradientFrame:](self, "setGradientFrame:", v42, v43, v24, v26);
          double v37 = v12 / v45 * (v24 / v45);
          v27 = (void *)MEMORY[0x1E4F39BE8];
          v28 = [(CKGradientView *)self maskImage];
          [v27 extraInsetsForImage:v28];
          double v38 = v30;
          double v39 = v29;
          double v40 = v32;
          double v41 = v31;

          [MEMORY[0x1E4F39CF8] begin];
          [MEMORY[0x1E4F39CF8] setDisableActions:1];
          v6 = [(CKGradientView *)self trackingLayer];
          objc_msgSend(v6, "setBounds:", 0.0, 0.0, v37, v14 / v44 * (v26 / v44));
          v53.origin.x = v8;
          v53.origin.y = v10;
          v53.size.width = v12;
          v53.size.height = v14;
          double MidX = CGRectGetMidX(v53);
          v54.origin.x = v8;
          v54.origin.y = v10;
          v54.size.width = v12;
          v54.size.height = v14;
          objc_msgSend(v6, "setPosition:", MidX, CGRectGetMidY(v54));
          CATransform3DMakeScale(&v48, -v45, -v44, 1.0);
          [v6 setTransform:&v48];
          v34 = [(CKGradientView *)self gradientLayer];
          objc_msgSend(v34, "setContentsRect:", -v42 / v45 - v37 * (v38 / v12 + 1.0), -v43 / v44 - v14 / v44 * (v26 / v44) * (v39 / v14 + 1.0), v37 * (1.0 - (v38 + v40) / v12), v14 / v44 * (v26 / v44) * (1.0 - (v39 + v41) / v14));
          v35 = (void *)MEMORY[0x1E4F39BE8];
          v36 = [(CKGradientView *)self maskImage];
          objc_msgSend(v35, "boundsForMaskImage:withOriginalSize:", v36, v12, v14);
          objc_msgSend(v34, "setBounds:");

          CATransform3DMakeScale(&v46, 1.0 / v45, 1.0 / v44, 1.0);
          CATransform3DTranslate(&v47, &v46, v38, v39, 0.0);
          [v34 setTransform:&v47];
          [MEMORY[0x1E4F39CF8] commit];

LABEL_8:
        }
      }
    }
  }
  [(CKGradientView *)self _checkForInvalidLayoutIfNeeded];
}

- (void)_checkForInvalidLayoutIfNeeded
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v52 = [MEMORY[0x1E4F6C360] sharedInstance];
  if ([v52 isInternalInstall])
  {
    v3 = [(CKGradientView *)self superview];

    if (v3)
    {
      v4 = (void *)MEMORY[0x1E4F39BE8];
      v5 = [(CKGradientView *)self maskImage];
      [(CKGradientView *)self bounds];
      objc_msgSend(v4, "boundsForMaskImage:withOriginalSize:", v5, v6, v7);
      double v9 = v8;
      double v11 = v10;

      double v12 = [(CKGradientView *)self gradientLayer];
      [v12 bounds];
      double v14 = v13;
      double v16 = v15;

      if (v14 != *MEMORY[0x1E4F1DB30] || v16 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
      {
        CGFloat v18 = +[CKUIBehavior sharedBehaviors];
        double v19 = vabdd_f64(v11, v16);
        [v18 textBalloonMinHeight];
        double v21 = v20 * 0.5;
        BOOL v22 = v19 < v20 * 0.5;
        double v23 = [(CKGradientView *)self superview];
        [v23 bounds];
        CGFloat Width = CGRectGetWidth(v74);

        [(CKGradientView *)self bounds];
        CGFloat v51 = v26;
        id v53 = v25;
        CGFloat v49 = v28;
        CGFloat v50 = v27;
        double v29 = [(CKGradientView *)self referenceView];
        [v29 bounds];
        CGFloat v47 = v31;
        CGFloat v48 = v30;
        CGFloat rect = v32;
        CGFloat v34 = v33;

        if (!v22 && IMOSLoggingEnabled())
        {
          v35 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            v70.width = v14;
            v70.height = v16;
            NSStringFromCGSize(v70);
            id v36 = (id)objc_claimAutoreleasedReturnValue();
            v71.width = v9;
            v71.height = v11;
            NSStringFromCGSize(v71);
            id v37 = (id)objc_claimAutoreleasedReturnValue();
            v75.origin.y = v51;
            *(void *)&v75.origin.x = v53;
            v75.size.height = v49;
            v75.size.width = v50;
            NSStringFromCGRect(v75);
            id v38 = (id)objc_claimAutoreleasedReturnValue();
            v76.origin.y = v47;
            v76.origin.x = v48;
            v76.size.width = rect;
            v76.size.height = v34;
            double v39 = NSStringFromCGRect(v76);
            *(_DWORD *)buf = 138413826;
            id v55 = v36;
            __int16 v56 = 2112;
            id v57 = v37;
            __int16 v58 = 2048;
            double v59 = v19;
            __int16 v60 = 2048;
            double v61 = v21;
            __int16 v62 = 2048;
            CGFloat v63 = Width;
            __int16 v64 = 2112;
            id v65 = v38;
            __int16 v66 = 2112;
            v67 = v39;
            _os_log_impl(&dword_18EF18000, v35, OS_LOG_TYPE_INFO, "height incorrect – actualSize: %@, expectedSize: %@, diff: %f sig-diff: %f, maxWidth: %f - gradientViewBounds: %@ – gradientReferenceViewBounds: %@", buf, 0x48u);
          }
        }
        double v40 = vabdd_f64(v9, v14);
        if (v40 >= v21 && IMOSLoggingEnabled())
        {
          double v41 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            v72.width = v14;
            v72.height = v16;
            NSStringFromCGSize(v72);
            id v42 = (id)objc_claimAutoreleasedReturnValue();
            v73.width = v9;
            v73.height = v11;
            NSStringFromCGSize(v73);
            id v43 = (id)objc_claimAutoreleasedReturnValue();
            v77.origin.y = v51;
            *(void *)&v77.origin.x = v53;
            v77.size.height = v49;
            v77.size.width = v50;
            NSStringFromCGRect(v77);
            id v44 = (id)objc_claimAutoreleasedReturnValue();
            v78.origin.y = v47;
            v78.origin.x = v48;
            v78.size.width = rect;
            v78.size.height = v34;
            double v45 = NSStringFromCGRect(v78);
            *(_DWORD *)buf = 138413570;
            id v55 = v42;
            __int16 v56 = 2112;
            id v57 = v43;
            __int16 v58 = 2048;
            double v59 = v40;
            __int16 v60 = 2048;
            double v61 = v21;
            __int16 v62 = 2112;
            CGFloat v63 = *(double *)&v44;
            __int16 v64 = 2112;
            id v65 = v45;
            _os_log_impl(&dword_18EF18000, v41, OS_LOG_TYPE_INFO, "width incorrect – actualSize: %@, expectedSize: %@, diff: %f sig-diff: %f - gradientViewBounds: %@ – gradientReferenceViewBounds: %@", buf, 0x3Eu);
          }
        }
      }
    }
  }
  else
  {
  }
}

- (void)didMoveToWindow
{
  [(CKGradientView *)self updateAnimation];
  v3 = [(CKGradientView *)self window];

  v4 = +[CKGradientView gradientViews];
  id v5 = v4;
  if (v3)
  {
    [v4 addObject:self];

    [(CKGradientView *)self setNeedsLayout];
  }
  else
  {
    [v4 removeObject:self];
  }
}

- (void)didMoveToSuperview
{
  [(CKGradientView *)self updateAnimation];
  v3 = [(CKGradientView *)self superview];

  v4 = +[CKGradientView gradientViews];
  id v5 = v4;
  if (v3)
  {
    [v4 addObject:self];

    [(CKGradientView *)self setNeedsLayout];
  }
  else
  {
    [v4 removeObject:self];
  }
}

- (void)_removeAllAnimations:(BOOL)a3
{
  id v3 = [(CKGradientView *)self layer];
  [v3 removeAllAnimations];
}

- (void)setReferenceView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_referenceView);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_referenceView, obj);
    [(CKGradientView *)self updateGradientImage];
    [(CKGradientView *)self updateAnimation];
    id v5 = obj;
    if (obj)
    {
      [obj gradientFrame];
      CGFloat v7 = v6;
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      [(CKGradientView *)self gradientFrame];
      v22.origin.x = v14;
      v22.origin.y = v15;
      v22.size.width = v16;
      v22.size.height = v17;
      v21.origin.x = v7;
      v21.origin.y = v9;
      v21.size.width = v11;
      v21.size.height = v13;
      BOOL v18 = CGRectEqualToRect(v21, v22);
      id v5 = obj;
      if (!v18)
      {
        [(CKGradientView *)self setNeedsLayout];
        id v5 = obj;
      }
    }
  }
}

- (void)setColors:(id)a3
{
  id v6 = a3;
  if (-[NSArray isEqualToArray:](self->_colors, "isEqualToArray:"))
  {
    v4 = v6;
  }
  else
  {
    id v5 = (void *)[v6 copy];

    objc_storeStrong((id *)&self->_colors, v5);
    [(CKGradientView *)self updateGradientImage];
    v4 = v5;
  }
}

- (void)setMaskImage:(id)a3
{
  id v6 = (UIImage *)a3;
  if (self->_maskImage != v6)
  {
    objc_storeStrong((id *)&self->_maskImage, a3);
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    id v5 = [(CKGradientView *)self gradientLayer];
    [v5 setMaskImage:v6];

    [(CKGradientView *)self setNeedsLayout];
    [MEMORY[0x1E4F39CF8] commit];
  }
}

+ (id)gradientViews
{
  if (gradientViews_once != -1) {
    dispatch_once(&gradientViews_once, &__block_literal_global_165);
  }
  v2 = (void *)gradientViews_sGradientViews;

  return v2;
}

void __31__CKGradientView_gradientViews__block_invoke()
{
  long long v0 = *(_OWORD *)(MEMORY[0x1E4F1D548] + 16);
  *(_OWORD *)&v3.version = *MEMORY[0x1E4F1D548];
  *(_OWORD *)&v3.release = v0;
  *(_OWORD *)&v3.equal = *(_OWORD *)(MEMORY[0x1E4F1D548] + 32);
  v3.retain = 0;
  v3.release = 0;
  CFMutableSetRef v1 = CFSetCreateMutable(0, 0, &v3);
  v2 = (void *)gradientViews_sGradientViews;
  gradientViews_sGradientViews = (uint64_t)v1;
}

- (void)updateAnimation
{
  v11[1] = *MEMORY[0x1E4F143B8];
  CFSetCallBacks v3 = [(CKGradientView *)self gradientLayer];
  [v3 removeAnimationForKey:@"matchmove"];
  v4 = [(CKGradientView *)self superview];
  id v5 = [(CKGradientView *)self referenceView];
  id v6 = [(CKGradientView *)self window];
  if (v6 && v4)
  {

    if (v5)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F39C00]);
      [v7 setKeyPath:@"contentsRect.origin"];
      double v8 = [v5 layer];
      [v7 setSourceLayer:v8];

      [v7 setDuration:INFINITY];
      CGFloat v9 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.0, 0.0);
      v11[0] = v9;
      double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
      [v7 setSourcePoints:v10];

      [v7 setBeginTimeMode:@"absolute"];
      [v7 setBeginTime:0.0];
      [v7 setAdditive:1];
      [v7 setTargetsSuperlayer:1];
      [v3 addAnimation:v7 forKey:@"matchmove"];
    }
  }
  else
  {
  }
}

- (void)updateGradientImage
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  CFSetCallBacks v3 = [(CKGradientView *)self gradientLayer];
  id v4 = [(CKGradientView *)self gradient];
  objc_msgSend(v3, "setContents:", objc_msgSend(v4, "CGImage"));

  id v5 = (void *)MEMORY[0x1E4F39CF8];

  [v5 commit];
}

- (UIImage)gradient
{
  v30[1] = *MEMORY[0x1E4F143B8];
  CFSetCallBacks v3 = [(CKGradientView *)self colors];
  uint64_t v4 = [(CKGradientView *)self referenceView];
  id v5 = (void *)v4;
  id v6 = 0;
  if (v3 && v4)
  {
    if (gradient_once != -1) {
      dispatch_once(&gradient_once, &__block_literal_global_56);
    }
    [v5 gradientFrame];
    double v8 = v7;
    if (CKMainScreenScale_once_63 != -1) {
      dispatch_once(&CKMainScreenScale_once_63, &__block_literal_global_173_2);
    }
    double v9 = *(double *)&CKMainScreenScale_sMainScreenScale_63;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_63 == 0.0) {
      double v9 = 1.0;
    }
    double v10 = floor(v8 * v9) / v9;
    CGFloat v11 = [NSNumber numberWithDouble:v10];
    double v12 = [(id)gradient_sGradients objectForKey:v11];
    if (!v12)
    {
      double v12 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
      [(id)gradient_sGradients setObject:v12 forKey:v11];
    }
    id v6 = [v12 objectForKey:v3];
    if (v6) {
      goto LABEL_20;
    }
    CGFloat v13 = [MEMORY[0x1E4F42D90] mainScreen];
    [v13 scale];
    double v15 = v10 * v14;

    double v16 = fmax(v15, 1.0);
    CFIndex v17 = [v3 count];
    Mutable = CFArrayCreateMutable(0, v17, MEMORY[0x1E4F1D510]);
    MEMORY[0x1F4188790](Mutable);
    double v20 = (const CGFloat *)((char *)v30 - v19);
    bzero((char *)v30 - v19, v21);
    if (v17 >= 1)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        id v23 = [v3 objectAtIndex:i];
        CFArrayAppendValue(Mutable, (const void *)[v23 CGColor]);

        v20[i] = (double)i / (double)(v17 - 1);
      }
    }
    v32.width = 1.0;
    v32.height = v16;
    UIGraphicsBeginImageContextWithOptions(v32, 0, 1.0);
    CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
    if (CurrentContext)
    {
      double v25 = CurrentContext;
      CGFloat v26 = *MEMORY[0x1E4F1DAD8];
      CGFloat v27 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      double v28 = CGGradientCreateWithColors(0, Mutable, v20);
      v34.x = 0.0;
      v33.x = v26;
      v33.y = v27;
      v34.y = v16;
      CGContextDrawLinearGradient(v25, v28, v33, v34, 0);
      id v6 = UIGraphicsGetImageFromCurrentImageContext();
      CGGradientRelease(v28);
      UIGraphicsEndImageContext();
      if (v6) {
        [v12 setObject:v6 forKey:v3];
      }
      if (!Mutable) {
        goto LABEL_20;
      }
    }
    else
    {
      NSLog(&cfstr_NilContextFail.isa);
      UIGraphicsEndImageContext();
      id v6 = 0;
      if (!Mutable) {
        goto LABEL_20;
      }
    }
    CFRelease(Mutable);
LABEL_20:
  }

  return (UIImage *)v6;
}

void __26__CKGradientView_gradient__block_invoke()
{
  uint64_t v0 = CKDefaultCacheLimit();
  uint64_t v1 = CKCreateCache(v0);
  v2 = (void *)gradient_sGradients;
  gradient_sGradients = v1;
}

- (CKGradientReferenceView)referenceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_referenceView);

  return (CKGradientReferenceView *)WeakRetained;
}

- (NSArray)colors
{
  return self->_colors;
}

- (UIImage)maskImage
{
  return self->_maskImage;
}

- (CKBaseLayer)gradientLayer
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

- (CALayer)trackingLayer
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
  objc_storeStrong((id *)&self->_maskImage, 0);
  objc_storeStrong((id *)&self->_colors, 0);

  objc_destroyWeak((id *)&self->_referenceView);
}

@end