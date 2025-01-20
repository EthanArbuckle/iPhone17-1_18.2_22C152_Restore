@interface HNDContinuousScroller
- (AXElement)scrollView;
- (AXElement)targetElement;
- (BOOL)orientedPointLiesInContinuousScrollerActivationRegion:(CGPoint)a3;
- (CGRect)_unobstructedOverflowFrameForScroller:(id)a3 originalOverflowFrame:(CGRect)a4;
- (CGRect)orientedScrollViewFrame;
- (CGRect)scrollViewFrame;
- (HNDContinuousScroller)initWithTargetElement:(id)a3 scrollView:(id)a4 orientedScrollViewFrame:(CGRect)a5 scrollAxis:(unint64_t)a6 supportedScrollDirections:(int64_t)a7;
- (NSArray)overflowFrames;
- (NSDictionary)scrollDirectionToActivationFrame;
- (NSNumber)scrollAreaToShowOverride;
- (double)overflowPadding;
- (id)directionForOrientedPoint:(CGPoint)a3;
- (id)scrollingSpeedFactorForOrientedPoint:(CGPoint)a3;
- (int64_t)supportedScrollDirections;
- (unint64_t)scrollAxis;
- (void)_computeScrollViewFrameAndActivationRegions;
- (void)extendActivationRegionWithoutCollidingWithScrollers:(id)a3 rotatedScreenBounds:(CGRect)a4;
- (void)setOrientedScrollViewFrame:(CGRect)a3;
- (void)setOverflowFrames:(id)a3;
- (void)setOverflowPadding:(double)a3;
- (void)setScrollAreaToShowOverride:(id)a3;
- (void)setScrollAxis:(unint64_t)a3;
- (void)setScrollDirectionToActivationFrame:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setScrollViewFrame:(CGRect)a3;
- (void)setSupportedScrollDirections:(int64_t)a3;
- (void)setTargetElement:(id)a3;
@end

@implementation HNDContinuousScroller

- (HNDContinuousScroller)initWithTargetElement:(id)a3 scrollView:(id)a4 orientedScrollViewFrame:(CGRect)a5 scrollAxis:(unint64_t)a6 supportedScrollDirections:(int64_t)a7
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  v15 = (AXElement *)a3;
  v16 = (AXElement *)a4;
  v33.receiver = self;
  v33.super_class = (Class)HNDContinuousScroller;
  v17 = [(HNDContinuousScroller *)&v33 init];
  targetElement = v17->_targetElement;
  v17->_targetElement = v15;
  v19 = v15;

  scrollView = v17->_scrollView;
  v17->_scrollView = v16;
  v21 = v16;

  v17->_scrollAxis = a6;
  [(AXElement *)v21 visibleFrame];
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;

  v17->_scrollViewFrame.origin.CGFloat x = v23;
  v17->_scrollViewFrame.origin.CGFloat y = v25;
  v17->_scrollViewFrame.size.CGFloat width = v27;
  v17->_scrollViewFrame.size.CGFloat height = v29;
  v17->_orientedScrollViewFrame.origin.CGFloat x = x;
  v17->_orientedScrollViewFrame.origin.CGFloat y = y;
  v17->_orientedScrollViewFrame.size.CGFloat width = width;
  v17->_orientedScrollViewFrame.size.CGFloat height = height;
  int v30 = sub_100041150();
  double v31 = 50.0;
  if (v30) {
    double v31 = 25.0;
  }
  v17->_overflowPadding = v31;
  v17->_supportedScrollDirections = a7;
  [(HNDContinuousScroller *)v17 _computeScrollViewFrameAndActivationRegions];
  return v17;
}

- (void)_computeScrollViewFrameAndActivationRegions
{
  id v41 = +[NSMutableDictionary dictionary];
  v3 = [(HNDContinuousScroller *)self scrollAreaToShowOverride];

  if (v3)
  {
    v4 = [(HNDContinuousScroller *)self scrollAreaToShowOverride];
    [v4 floatValue];
    double v6 = v5;
  }
  else
  {
    double v6 = 0.6;
  }
  double v7 = (1.0 - v6) * 0.5;
  if ([(HNDContinuousScroller *)self scrollAxis])
  {
    if ((id)[(HNDContinuousScroller *)self scrollAxis] != (id)1) {
      goto LABEL_9;
    }
    [(HNDContinuousScroller *)self orientedScrollViewFrame];
    double v9 = v7 * v8;
    [(HNDContinuousScroller *)self orientedScrollViewFrame];
    double v11 = v10;
    [(HNDContinuousScroller *)self orientedScrollViewFrame];
    double v13 = v12;
    [(HNDContinuousScroller *)self orientedScrollViewFrame];
    double v15 = v14;
    [(HNDContinuousScroller *)self orientedScrollViewFrame];
    double v17 = v16;
    [(HNDContinuousScroller *)self orientedScrollViewFrame];
    double v19 = v17 + v18 - v9;
    [(HNDContinuousScroller *)self orientedScrollViewFrame];
    double v21 = v20;
    [(HNDContinuousScroller *)self orientedScrollViewFrame];
    double v23 = v22;
    uint64_t v24 = 8;
    uint64_t v25 = 16;
    double v26 = v9;
  }
  else
  {
    [(HNDContinuousScroller *)self orientedScrollViewFrame];
    double v23 = v7 * v27;
    [(HNDContinuousScroller *)self orientedScrollViewFrame];
    double v11 = v28;
    [(HNDContinuousScroller *)self orientedScrollViewFrame];
    double v13 = v29;
    [(HNDContinuousScroller *)self orientedScrollViewFrame];
    double v26 = v30;
    [(HNDContinuousScroller *)self orientedScrollViewFrame];
    double v19 = v31;
    [(HNDContinuousScroller *)self orientedScrollViewFrame];
    double v33 = v32;
    [(HNDContinuousScroller *)self orientedScrollViewFrame];
    double v21 = v33 + v34 - v23;
    [(HNDContinuousScroller *)self orientedScrollViewFrame];
    double v9 = v35;
    uint64_t v24 = 2;
    uint64_t v25 = 4;
    double v15 = v23;
  }
  v36 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v11, v13, v26, v15);
  v37 = +[NSNumber numberWithUnsignedLong:v24];
  [v41 setObject:v36 forKey:v37];

  v38 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v19, v21, v9, v23);
  v39 = +[NSNumber numberWithUnsignedLong:v25];
  [v41 setObject:v38 forKey:v39];

  id v40 = [v41 copy];
  [(HNDContinuousScroller *)self setScrollDirectionToActivationFrame:v40];

LABEL_9:
}

- (void)extendActivationRegionWithoutCollidingWithScrollers:(id)a3 rotatedScreenBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v9 = a3;
  if ([(HNDContinuousScroller *)self scrollAxis])
  {
    if ((id)[(HNDContinuousScroller *)self scrollAxis] != (id)1)
    {
      double v17 = 0;
      double v14 = 0;
      goto LABEL_26;
    }
    uint64_t v10 = 8;
    uint64_t v11 = 16;
  }
  else
  {
    uint64_t v10 = 2;
    uint64_t v11 = 4;
  }
  double v12 = [(HNDContinuousScroller *)self scrollDirectionToActivationFrame];
  double v13 = +[NSNumber numberWithUnsignedLong:v10];
  double v14 = [v12 objectForKeyedSubscript:v13];

  double v15 = [(HNDContinuousScroller *)self scrollDirectionToActivationFrame];
  double v16 = +[NSNumber numberWithUnsignedLong:v11];
  double v17 = [v15 objectForKeyedSubscript:v16];

  if (v14 && v17)
  {
    v83.origin.CGFloat x = x;
    v83.origin.CGFloat y = y;
    v83.size.CGFloat width = width;
    v83.size.CGFloat height = height;
    [v14 CGRectValue];
    double v19 = v18;
    double v21 = v20;
    CGFloat v23 = v22;
    CGFloat v80 = v24;
    [v17 CGRectValue];
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    [(HNDContinuousScroller *)self overflowPadding];
    double v34 = v33;
    CGFloat v81 = v21;
    CGFloat v82 = v30;
    CGFloat v72 = v23;
    CGFloat v79 = v19;
    if ([(HNDContinuousScroller *)self scrollAxis])
    {
      if ((id)[(HNDContinuousScroller *)self scrollAxis] != (id)1) {
        goto LABEL_26;
      }
      CGFloat v68 = v28;
      CGFloat v69 = v26;
      double v19 = v19 - v34;
      double v35 = v21;
      CGFloat v75 = v34;
      double v76 = v21;
      CGFloat r1 = v32;
      double v74 = v26 + v30;
      CGFloat v70 = v32;
      CGFloat v23 = v34;
      double v34 = v80;
    }
    else
    {
      double v36 = v28;
      double v35 = v21 - v34;
      CGFloat v69 = v26;
      CGFloat v70 = v32;
      double v74 = v26;
      CGFloat v75 = v30;
      CGFloat v68 = v36;
      double v76 = v36 + v32;
      CGFloat r1 = v34;
    }
    uint64_t v71 = v11;
    v37 = [(HNDContinuousScroller *)self scrollDirectionToActivationFrame];
    v78 = +[NSMutableDictionary dictionaryWithDictionary:v37];

    v77 = +[NSMutableArray array];
    v89.origin.CGFloat x = v19;
    v89.origin.CGFloat y = v35;
    v89.size.CGFloat width = v23;
    v89.size.CGFloat height = v34;
    CGRect v90 = CGRectIntersection(v89, v83);
    double v38 = v90.origin.x;
    double v39 = v90.origin.y;
    double v40 = v90.size.width;
    double v41 = v90.size.height;
    v90.origin.CGFloat x = v74;
    v90.size.CGFloat width = v75;
    v90.origin.CGFloat y = v76;
    v90.size.CGFloat height = r1;
    CGRect v91 = CGRectIntersection(v90, v83);
    double v42 = v91.origin.x;
    double v43 = v91.origin.y;
    double v44 = v91.size.width;
    double v45 = v91.size.height;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id v46 = v9;
    id v47 = [v46 countByEnumeratingWithState:&v84 objects:v88 count:16];
    if (v47)
    {
      id v48 = v47;
      uint64_t v49 = *(void *)v85;
      do
      {
        for (i = 0; i != v48; i = (char *)i + 1)
        {
          if (*(void *)v85 != v49) {
            objc_enumerationMutation(v46);
          }
          uint64_t v51 = *(void *)(*((void *)&v84 + 1) + 8 * i);
          -[HNDContinuousScroller _unobstructedOverflowFrameForScroller:originalOverflowFrame:](self, "_unobstructedOverflowFrameForScroller:originalOverflowFrame:", v51, v38, v39, v40, v41);
          double v38 = v52;
          double v39 = v53;
          double v40 = v54;
          double v41 = v55;
          -[HNDContinuousScroller _unobstructedOverflowFrameForScroller:originalOverflowFrame:](self, "_unobstructedOverflowFrameForScroller:originalOverflowFrame:", v51, v42, v43, v44, v45);
          double v42 = v56;
          double v43 = v57;
          double v44 = v58;
          double v45 = v59;
        }
        id v48 = [v46 countByEnumeratingWithState:&v84 objects:v88 count:16];
      }
      while (v48);
    }

    v92.origin.CGFloat x = v38;
    v92.origin.CGFloat y = v39;
    v92.size.CGFloat width = v40;
    v92.size.CGFloat height = v41;
    if (!CGRectIsEmpty(v92))
    {
      v93.origin.CGFloat x = v38;
      v93.origin.CGFloat y = v39;
      v93.size.CGFloat width = v40;
      v93.size.CGFloat height = v41;
      if (!CGRectIsNull(v93))
      {
        v94.origin.CGFloat x = v79;
        v94.size.CGFloat height = v80;
        v94.origin.CGFloat y = v81;
        v94.size.CGFloat width = v72;
        v100.origin.CGFloat x = v38;
        v100.origin.CGFloat y = v39;
        v100.size.CGFloat width = v40;
        v100.size.CGFloat height = v41;
        CGRect v95 = CGRectUnion(v94, v100);
        v60 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v95.origin.x, v95.origin.y, v95.size.width, v95.size.height);
        v61 = +[NSNumber numberWithUnsignedLong:v10];
        [v78 setObject:v60 forKey:v61];

        v62 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v38, v39, v40, v41);
        [v77 addObject:v62];
      }
    }
    v96.origin.CGFloat x = v42;
    v96.origin.CGFloat y = v43;
    v96.size.CGFloat width = v44;
    v96.size.CGFloat height = v45;
    if (!CGRectIsEmpty(v96))
    {
      v97.origin.CGFloat x = v42;
      v97.origin.CGFloat y = v43;
      v97.size.CGFloat width = v44;
      v97.size.CGFloat height = v45;
      if (!CGRectIsNull(v97))
      {
        v98.origin.CGFloat y = v68;
        v98.origin.CGFloat x = v69;
        v98.size.CGFloat width = v82;
        v98.size.CGFloat height = v70;
        v101.origin.CGFloat x = v42;
        v101.origin.CGFloat y = v43;
        v101.size.CGFloat width = v44;
        v101.size.CGFloat height = v45;
        CGRect v99 = CGRectUnion(v98, v101);
        v63 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v99.origin.x, v99.origin.y, v99.size.width, v99.size.height);
        v64 = +[NSNumber numberWithUnsignedLong:v71];
        [v78 setObject:v63 forKey:v64];

        v65 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v42, v43, v44, v45);
        [v77 addObject:v65];
      }
    }
    id v66 = [v78 copy];
    [(HNDContinuousScroller *)self setScrollDirectionToActivationFrame:v66];

    id v67 = [v77 copy];
    [(HNDContinuousScroller *)self setOverflowFrames:v67];
  }
LABEL_26:
}

- (CGRect)_unobstructedOverflowFrameForScroller:(id)a3 originalOverflowFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  double v8 = [a3 scrollDirectionToActivationFrame];
  id v9 = [v8 allValues];

  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      double v13 = 0;
      do
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v13);
        v28.origin.CGFloat x = x;
        v28.origin.CGFloat y = y;
        v28.size.CGFloat width = width;
        v28.size.CGFloat height = height;
        if (!CGRectIsEmpty(v28))
        {
          if (v14)
          {
            [v14 CGRectValue];
            AX_CGRectBySubtractingRect();
            CGFloat x = v29.origin.x;
            CGFloat y = v29.origin.y;
            CGFloat width = v29.size.width;
            CGFloat height = v29.size.height;
            if (CGRectIsEmpty(v29))
            {
              AX_CGRectBySubtractingRect();
              CGFloat x = v15;
              CGFloat y = v16;
              CGFloat width = v17;
              CGFloat height = v18;
            }
          }
        }
        double v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }

  double v19 = x;
  double v20 = y;
  double v21 = width;
  double v22 = height;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (BOOL)orientedPointLiesInContinuousScrollerActivationRegion:(CGPoint)a3
{
  v3 = -[HNDContinuousScroller directionForOrientedPoint:](self, "directionForOrientedPoint:", a3.x, a3.y);
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)directionForOrientedPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v6 = [(HNDContinuousScroller *)self scrollDirectionToActivationFrame];
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = [(HNDContinuousScroller *)self scrollDirectionToActivationFrame];
        double v13 = [v12 objectForKeyedSubscript:v11];

        [v13 CGRectValue];
        v22.CGFloat x = x;
        v22.CGFloat y = y;
        if (CGRectContainsPoint(v23, v22))
        {
          id v14 = v11;

          goto LABEL_11;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_11:

  return v14;
}

- (id)scrollingSpeedFactorForOrientedPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = -[HNDContinuousScroller directionForOrientedPoint:](self, "directionForOrientedPoint:");
  id v7 = v6;
  if (!v6)
  {
    double v27 = 0;
    goto LABEL_14;
  }
  unsigned int v8 = [v6 intValue];
  uint64_t v9 = [(HNDContinuousScroller *)self scrollDirectionToActivationFrame];
  id v10 = [v9 objectForKeyedSubscript:v7];

  if (v10)
  {
    [v10 CGRectValue];
    CGFloat v15 = v11;
    CGFloat v16 = v12;
    CGFloat v17 = v13;
    CGFloat v18 = v14;
    HIDWORD(v20) = v8;
    LODWORD(v20) = v8 - 2;
    unsigned int v19 = v20 >> 1;
    if (v19 < 2)
    {
      double v28 = y - CGRectGetMinY(*(CGRect *)&v11);
      v35.origin.double x = v15;
      v35.origin.double y = v16;
      v35.size.CGFloat width = v17;
      v35.size.CGFloat height = v18;
      double MaxY = CGRectGetMaxY(v35);
      v36.origin.double x = v15;
      v36.origin.double y = v16;
      v36.size.CGFloat width = v17;
      v36.size.CGFloat height = v18;
      double v21 = v28 / (MaxY - CGRectGetMinY(v36));
      double v25 = 1.0 - v21;
      BOOL v26 = v8 == 2;
    }
    else
    {
      if (v19 != 3)
      {
        double v21 = 0.0;
        if (v19 != 7)
        {
LABEL_12:
          float v30 = v21 + -1.0;
          double v27 = +[NSNumber numberWithDouble:fminf(fmaxf(powf(15.0, v30), 0.0), 1.0)];
          goto LABEL_13;
        }
      }
      CGFloat v22 = v15;
      double v23 = x - CGRectGetMinX(*(CGRect *)(&v12 - 1));
      v33.origin.double x = v15;
      v33.origin.double y = v16;
      v33.size.CGFloat width = v17;
      v33.size.CGFloat height = v18;
      double MaxX = CGRectGetMaxX(v33);
      v34.origin.double x = v15;
      v34.origin.double y = v16;
      v34.size.CGFloat width = v17;
      v34.size.CGFloat height = v18;
      double v21 = v23 / (MaxX - CGRectGetMinX(v34));
      double v25 = 1.0 - v21;
      BOOL v26 = v8 == 8;
    }
    if (v26) {
      double v21 = v25;
    }
    goto LABEL_12;
  }
  double v27 = 0;
LABEL_13:

LABEL_14:

  return v27;
}

- (AXElement)targetElement
{
  return self->_targetElement;
}

- (void)setTargetElement:(id)a3
{
}

- (AXElement)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (unint64_t)scrollAxis
{
  return self->_scrollAxis;
}

- (void)setScrollAxis:(unint64_t)a3
{
  self->_scrollAxis = a3;
}

- (CGRect)scrollViewFrame
{
  double x = self->_scrollViewFrame.origin.x;
  double y = self->_scrollViewFrame.origin.y;
  double width = self->_scrollViewFrame.size.width;
  double height = self->_scrollViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setScrollViewFrame:(CGRect)a3
{
  self->_scrollViewFrame = a3;
}

- (NSDictionary)scrollDirectionToActivationFrame
{
  return self->_scrollDirectionToActivationFrame;
}

- (void)setScrollDirectionToActivationFrame:(id)a3
{
}

- (NSArray)overflowFrames
{
  return self->_overflowFrames;
}

- (void)setOverflowFrames:(id)a3
{
}

- (NSNumber)scrollAreaToShowOverride
{
  return self->_scrollAreaToShowOverride;
}

- (void)setScrollAreaToShowOverride:(id)a3
{
}

- (int64_t)supportedScrollDirections
{
  return self->_supportedScrollDirections;
}

- (void)setSupportedScrollDirections:(int64_t)a3
{
  self->_supportedScrollDirections = a3;
}

- (CGRect)orientedScrollViewFrame
{
  double x = self->_orientedScrollViewFrame.origin.x;
  double y = self->_orientedScrollViewFrame.origin.y;
  double width = self->_orientedScrollViewFrame.size.width;
  double height = self->_orientedScrollViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setOrientedScrollViewFrame:(CGRect)a3
{
  self->_orientedScrollViewFrame = a3;
}

- (double)overflowPadding
{
  return self->_overflowPadding;
}

- (void)setOverflowPadding:(double)a3
{
  self->_overflowPadding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollAreaToShowOverride, 0);
  objc_storeStrong((id *)&self->_overflowFrames, 0);
  objc_storeStrong((id *)&self->_scrollDirectionToActivationFrame, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);

  objc_storeStrong((id *)&self->_targetElement, 0);
}

@end