@interface CGRenderer
- (BOOL)drawEdgesFirst;
- (BOOL)drawWithSplines;
- (BOOL)setCanvasWidth:(unsigned int)a3 height:(unsigned int)a4;
- (CGColor)_colorForNodeColor:(int)a3;
- (CGRenderer)init;
- (CGSize)separation;
- (int)direction;
- (void)_drawCubicSpline:(id)a3;
- (void)_drawNodeBadge:(id)x2_0;
- (void)_drawNodeContent:(id)x2_0;
- (void)_drawPolyline:(id)a3;
- (void)dealloc;
- (void)drawEdge:(id)a3 withPath:(id)a4;
- (void)drawNode:(id)a3;
- (void)hyperlinkEdge:(id)a3 from:(CGPoint)a4 to:(CGPoint)a5;
- (void)setDirection:(int)a3;
- (void)setDrawEdgesFirst:(BOOL)a3;
- (void)setDrawWithSplines:(BOOL)a3;
- (void)setSeparation:(CGSize)a3;
@end

@implementation CGRenderer

- (CGRenderer)init
{
  v3.receiver = self;
  v3.super_class = (Class)CGRenderer;
  result = [(CGRenderer *)&v3 init];
  if (result)
  {
    result->direction = 1;
    result->separation = (CGSize)xmmword_193953450;
    result->drawEdgesFirst = 1;
  }
  return result;
}

- (void)dealloc
{
  context = self->context;
  if (context) {
    CGContextRelease(context);
  }
  v4.receiver = self;
  v4.super_class = (Class)CGRenderer;
  [(CGRenderer *)&v4 dealloc];
}

- (BOOL)setCanvasWidth:(unsigned int)a3 height:(unsigned int)a4
{
  return 0;
}

- (CGColor)_colorForNodeColor:(int)a3
{
  if (-[CGRenderer _colorForNodeColor:]::onceToken != -1) {
    dispatch_once(&-[CGRenderer _colorForNodeColor:]::onceToken, &__block_literal_global_32);
  }
  if (a3 >= 0x10) {
    -[CGRenderer _colorForNodeColor:]();
  }
  return *(CGColor **)off_1E5771CA8[a3];
}

CGColorRef __33__CGRenderer__colorForNodeColor___block_invoke()
{
  -[CGRenderer _colorForNodeColor:]::gray = (uint64_t)CGColorCreateWithHex(0xCCCCCCFFuLL);
  -[CGRenderer _colorForNodeColor:]::dark = (uint64_t)CGColorCreateWithHex(0x999999FFuLL);
  -[CGRenderer _colorForNodeColor:]::light = (uint64_t)CGColorCreateWithHex(0xD3D3D3FFuLL);
  -[CGRenderer _colorForNodeColor:]::red = (uint64_t)CGColorCreateWithHex(0xFFCCCCFFuLL);
  -[CGRenderer _colorForNodeColor:]::redAlt = (uint64_t)CGColorCreateWithHex(0xFFDDDDFFuLL);
  -[CGRenderer _colorForNodeColor:]::green = (uint64_t)CGColorCreateWithHex(0xCCFFCCFFuLL);
  -[CGRenderer _colorForNodeColor:]::greenAlt = (uint64_t)CGColorCreateWithHex(0xDDFFDDFFuLL);
  -[CGRenderer _colorForNodeColor:]::yellow = (uint64_t)CGColorCreateWithHex(0xFFFFAAFFuLL);
  -[CGRenderer _colorForNodeColor:]::yellowAlt = (uint64_t)CGColorCreateWithHex(0xFFFFDDFFuLL);
  -[CGRenderer _colorForNodeColor:]::blue = (uint64_t)CGColorCreateWithHex(0xCCCCFFFFuLL);
  -[CGRenderer _colorForNodeColor:]::blueAlt = (uint64_t)CGColorCreateWithHex(0xDDDDFFFFuLL);
  -[CGRenderer _colorForNodeColor:]::magenta = (uint64_t)CGColorCreateWithHex(0xFFAAFFFFuLL);
  -[CGRenderer _colorForNodeColor:]::magentaAlt = (uint64_t)CGColorCreateWithHex(0xFFDDFFFFuLL);
  -[CGRenderer _colorForNodeColor:]::cyan = (uint64_t)CGColorCreateWithHex(0xCCFFFFFFuLL);
  -[CGRenderer _colorForNodeColor:]::cyanAlt = (uint64_t)CGColorCreateWithHex(0xDDFFFFFFuLL);
  CGColorRef result = CGColorCreateWithHex(0xFF88CCFFuLL);
  -[CGRenderer _colorForNodeColor:]::hotPink = (uint64_t)result;
  return result;
}

- (void)_drawNodeContent:(id)x2_0
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  int v5 = [x2_0 shape];
  uint64_t v6 = [x2_0 color];
  [x2_0 contentCornerSize];
  double v8 = v7;
  double v10 = v9;
  CGContextSetFillColorWithColor(self->context, [(CGRenderer *)self _colorForNodeColor:v6]);
  switch(v5)
  {
    case 0:
      [x2_0 contentFrame];
      CGPathRef v11 = CGPathCreateWithRect(v123, 0);
      goto LABEL_4;
    case 1:
      [x2_0 contentFrame];
      CGFloat v17 = v13;
      CGFloat v18 = v14;
      if (v15 * 0.5 < v8 || v16 * 0.5 < v10) {
        goto LABEL_11;
      }
      CGFloat v20 = v15;
      CGFloat v21 = v16;
      double MinX = CGRectGetMinX(*(CGRect *)&v13);
      v125.origin.double x = v17;
      v125.origin.double y = v18;
      v125.size.CGFloat width = v20;
      v125.size.CGFloat height = v21;
      double MaxX = CGRectGetMaxX(v125);
      v126.origin.double x = v17;
      v126.origin.double y = v18;
      v126.size.CGFloat width = v20;
      v126.size.CGFloat height = v21;
      double MinY = CGRectGetMinY(v126);
      v127.origin.double x = v17;
      v127.origin.double y = v18;
      v127.size.CGFloat width = v20;
      v127.size.CGFloat height = v21;
      double MaxY = CGRectGetMaxY(v127);
      CGFloat v25 = v8 + MinX;
      CGFloat v26 = MaxX - v8;
      CGFloat v27 = v10 + MinY;
      CGFloat v28 = MaxY - v10;
      Mutable = CGPathCreateMutable();
      CGPathMoveToPoint(Mutable, 0, MinX, v28);
      CGPathAddLineToPoint(Mutable, 0, v25, MaxY);
      CGPathAddLineToPoint(Mutable, 0, v26, MaxY);
      CGPathAddLineToPoint(Mutable, 0, MaxX, v28);
      CGPathAddLineToPoint(Mutable, 0, MaxX, v27);
      CGPathAddLineToPoint(Mutable, 0, v26, MinY);
      CGPathAddLineToPoint(Mutable, 0, v25, MinY);
      v29 = Mutable;
      CGFloat v30 = MinX;
      CGFloat v31 = v27;
      goto LABEL_13;
    case 2:
      [x2_0 contentFrame];
      CGPathRef v11 = CGPathCreateWithRoundedRect(v124, v8, v10, 0);
LABEL_4:
      Mutable = v11;
      goto LABEL_14;
    case 3:
      [x2_0 contentFrame];
      CGFloat v36 = v32;
      if (v34 * 0.5 >= v8)
      {
        CGFloat v37 = v33;
        CGFloat v38 = v34;
        CGFloat v39 = v35;
        double v40 = CGRectGetMinX(*(CGRect *)&v32);
        v128.origin.double x = v36;
        v128.origin.double y = v37;
        v128.size.CGFloat width = v38;
        v128.size.CGFloat height = v39;
        double v41 = CGRectGetMaxX(v128);
        v129.origin.double x = v36;
        v129.origin.double y = v37;
        v129.size.CGFloat width = v38;
        v129.size.CGFloat height = v39;
        CGFloat v101 = CGRectGetMinY(v129);
        v130.origin.double x = v36;
        v130.origin.double y = v37;
        v130.size.CGFloat width = v38;
        v130.size.CGFloat height = v39;
        CGFloat MidY = CGRectGetMidY(v130);
        v131.origin.double x = v36;
        v131.origin.double y = v37;
        v131.size.CGFloat width = v38;
        v131.size.CGFloat height = v39;
        CGFloat v43 = CGRectGetMaxY(v131);
        CGFloat v44 = v8 + v40;
        CGFloat v45 = v41 - v8;
        Mutable = CGPathCreateMutable();
        CGPathMoveToPoint(Mutable, 0, v40, MidY);
        CGPathAddLineToPoint(Mutable, 0, v44, v43);
        CGPathAddLineToPoint(Mutable, 0, v45, v43);
        CGPathAddLineToPoint(Mutable, 0, v41, MidY);
        CGPathAddLineToPoint(Mutable, 0, v45, v101);
        v29 = Mutable;
        CGFloat v30 = v44;
        CGFloat v31 = v101;
LABEL_13:
        CGPathAddLineToPoint(v29, 0, v30, v31);
        CGPathCloseSubpath(Mutable);
      }
      else
      {
LABEL_11:
        Mutable = 0;
      }
LABEL_14:
      CGContextAddPath(self->context, Mutable);
      CGContextDrawPath(self->context, kCGPathFillStroke);
      CGPathRelease(Mutable);
      CFAttributedStringRef v46 = CFAttributedStringCreate(0, (CFStringRef)[x2_0 label], +[CIGVNode textAttributesForLabel](CIGVNode, "textAttributesForLabel"));
      context = self->context;
      [x2_0 labelFrame];
      CGContextDrawAttributedString(context, v46, v132);
      CFRelease(v46);
      if ([x2_0 images])
      {
        if (CFArrayGetCount((CFArrayRef)[x2_0 images]))
        {
          v48 = (void *)[x2_0 images];
          [x2_0 imagesFrame];
          double v50 = v49;
          long long v113 = 0u;
          long long v114 = 0u;
          long long v115 = 0u;
          long long v116 = 0u;
          obuint64_t j = v48;
          uint64_t v51 = [v48 countByEnumeratingWithState:&v113 objects:v120 count:16];
          if (v51)
          {
            uint64_t v52 = v51;
            uint64_t v102 = *(void *)v114;
            long long v99 = xmmword_1EE461DB8;
            v53 = (void (__cdecl *)(void *))qword_1EE461DC8;
            v54 = (_OWORD *)MEMORY[0x1E4F1DAB8];
            do
            {
              for (uint64_t i = 0; i != v52; ++i)
              {
                if (*(void *)v114 != v102) {
                  objc_enumerationMutation(obj);
                }
                v56 = *(CGImage **)(*((void *)&v113 + 1) + 8 * i);
                CGFloat v57 = 0.5 * (double)CGImageGetWidth(v56);
                CGFloat v58 = 0.5 * (double)CGImageGetHeight(v56);
                [x2_0 imagesFrame];
                double v60 = (v59 - v58) * 0.5;
                [x2_0 imagesFrame];
                CGFloat v62 = v61 + v60;
                *(_OWORD *)&callbacks.version = v99;
                callbacks.releaseInfo = v53;
                long long v63 = v54[1];
                *(_OWORD *)&matrix.a = *v54;
                *(_OWORD *)&matrix.c = v63;
                *(_OWORD *)&matrix.tdouble x = v54[2];
                uint64_t v64 = 0;
                *(void *)&long long v63 = 0;
                double v65 = 16.0;
                double v66 = 16.0;
                v67 = CGPatternCreate(0, *(CGRect *)((char *)&v63 - 8), &matrix, 16.0, 16.0, kCGPatternTilingNoDistortion, 1, &callbacks);
                Pattern = CGColorSpaceCreatePattern(0);
                CGFloat components = 1.0;
                v69 = CGColorCreateWithPattern(Pattern, v67, &components);
                CGColorSpaceRelease(Pattern);
                CGPatternRelease(v67);
                v122.CGFloat width = v50;
                v122.CGFloat height = v62;
                CGContextSetPatternPhase(self->context, v122);
                CGContextSetFillColorWithColor(self->context, v69);
                CGColorRelease(v69);
                v133.origin.double x = v50;
                v133.origin.double y = v62;
                v133.size.CGFloat width = v57;
                v133.size.CGFloat height = v58;
                CGContextFillRect(self->context, v133);
                v134.origin.double x = v50;
                v134.origin.double y = v62;
                v134.size.CGFloat width = v57;
                v134.size.CGFloat height = v58;
                CGContextDrawImage(self->context, v134, v56);
                double v50 = v50 + v57 + 5.0;
              }
              uint64_t v52 = [obj countByEnumeratingWithState:&v113 objects:v120 count:16];
            }
            while (v52);
          }
        }
      }
      if ([x2_0 rois] && CFArrayGetCount((CFArrayRef)objc_msgSend(x2_0, "rois")))
      {
        [x2_0 roisFrame];
        double v71 = v70;
        double v73 = v72;
        v74 = (void *)[x2_0 rois];
        [x2_0 extent];
        double x = v75;
        double y = v77;
        CGFloat width = v79;
        CGFloat height = v81;
        long long v107 = 0u;
        long long v108 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        uint64_t v83 = [v74 countByEnumeratingWithState:&v107 objects:v118 count:16];
        if (v83)
        {
          uint64_t v84 = v83;
          uint64_t v85 = *(void *)v108;
          do
          {
            for (uint64_t j = 0; j != v84; ++j)
            {
              if (*(void *)v108 != v85) {
                objc_enumerationMutation(v74);
              }
              v143.origin.double x = rectFromValue(*(void **)(*((void *)&v107 + 1) + 8 * j));
              v143.origin.double y = v87;
              v143.size.CGFloat width = v88;
              v143.size.CGFloat height = v89;
              v135.origin.double x = x;
              v135.origin.double y = y;
              v135.size.CGFloat width = width;
              v135.size.CGFloat height = height;
              CGRect v136 = CGRectUnion(v135, v143);
              double x = v136.origin.x;
              double y = v136.origin.y;
              CGFloat width = v136.size.width;
              CGFloat height = v136.size.height;
            }
            uint64_t v84 = [v74 countByEnumeratingWithState:&v107 objects:v118 count:16];
          }
          while (v84);
        }
        double v90 = v71 - x;
        double v91 = v73 - y;
        CGContextSetStrokeColor(self->context, -[CGRenderer _drawNodeContent:]::black);
        [x2_0 extent];
        if (!CGRectIsNull(v137))
        {
          [x2_0 extent];
          if (!CGRectIsInfinite(v138))
          {
            *(_OWORD *)&callbacks.version = xmmword_193953470;
            CGContextSetLineDash(self->context, 0.0, (const CGFloat *)&callbacks.version, 2uLL);
            v92 = self->context;
            [x2_0 extent];
            CGRect v140 = CGRectOffset(v139, v90, v91);
            CGContextStrokeRect(v92, v140);
            CGContextSetLineDash(self->context, 0.0, 0, 0);
          }
        }
        long long v105 = 0u;
        long long v106 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        uint64_t v93 = [v74 countByEnumeratingWithState:&v103 objects:v117 count:16];
        if (v93)
        {
          uint64_t v94 = v93;
          uint64_t v95 = *(void *)v104;
          do
          {
            for (uint64_t k = 0; k != v94; ++k)
            {
              if (*(void *)v104 != v95) {
                objc_enumerationMutation(v74);
              }
              v141.origin.double x = rectFromValue(*(void **)(*((void *)&v103 + 1) + 8 * k));
              v97 = self->context;
              CGRect v142 = CGRectOffset(v141, v90, v91);
              CGContextStrokeRect(v97, v142);
            }
            uint64_t v94 = [v74 countByEnumeratingWithState:&v103 objects:v117 count:16];
          }
          while (v94);
        }
      }
      return;
    default:
      -[CGRenderer _drawNodeContent:]();
  }
}

- (void)_drawNodeBadge:(id)x2_0
{
  uint64_t v5 = [x2_0 color];
  [x2_0 badgeFrame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v12 = v6;
  CGFloat v13 = v7;
  if (v6 >= v7) {
    double v14 = v7;
  }
  else {
    double v14 = v6;
  }
  CGFloat v15 = v14 * 0.5;
  CGContextSetFillColorWithColor(self->context, [(CGRenderer *)self _colorForNodeColor:v5]);
  v20.origin.double x = v9;
  v20.origin.double y = v11;
  v20.size.CGFloat width = v12;
  v20.size.CGFloat height = v13;
  double v16 = CGPathCreateWithRoundedRect(v20, v15, v15, 0);
  CGContextAddPath(self->context, v16);
  CGContextDrawPath(self->context, kCGPathFillStroke);
  CGPathRelease(v16);
  CFAttributedStringRef v17 = CFAttributedStringCreate(0, (CFStringRef)[x2_0 title], +[CIGVNode textAttributesForTitle](CIGVNode, "textAttributesForTitle"));
  context = self->context;
  [x2_0 titleFrame];
  CGContextDrawAttributedString(context, v17, v21);

  CFRelease(v17);
}

- (void)drawNode:(id)a3
{
  -[CGRenderer _drawNodeContent:](self, "_drawNodeContent:");
  if ([a3 title])
  {
    [(CGRenderer *)self _drawNodeBadge:a3];
  }
}

- (void)_drawPolyline:(id)a3
{
  uint64_t v5 = [a3 count];
  double v6 = pointFromValue((void *)[a3 objectAtIndexedSubscript:0]);
  double v8 = v7;
  CGContextMoveToPoint(self->context, v6, v7);
  if ((unint64_t)([a3 count] - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    unint64_t v9 = 1;
    do
    {
      double v6 = pointFromValue((void *)[a3 objectAtIndexedSubscript:v9]);
      double v8 = v10;
      CGContextAddLineToPoint(self->context, v6, v10);
      ++v9;
    }
    while (v9 < [a3 count] - 1);
  }
  double v11 = pointFromValue((void *)[a3 objectAtIndexedSubscript:v5 - 1]);
  double v12 = v6 - v11;
  double v13 = v11;
  CGFloat v33 = v14;
  CGFloat v34 = v11;
  double v15 = v8 - v14;
  double v16 = v14;
  long double v17 = hypot(v6 - v11, v8 - v14);
  CGFloat v18 = v13 + v12 / v17 * 8.0;
  CGFloat v19 = v16 + v15 / v17 * 8.0;
  CGContextAddLineToPoint(self->context, v18, v19);
  CGContextStrokePath(self->context);
  CGFloat v20 = v18 - v6;
  CGFloat v21 = v19 - v8;
  long double v22 = -(v19 - v8 - (v18 - v6) * 6.123234e-17);
  CGFloat v23 = (v19 - v8) * 6.123234e-17;
  long double v24 = hypot(v22, v20 + v23);
  CGFloat v25 = v18 + v22 / v24 + v22 / v24;
  CGFloat v26 = v19 + (v20 + v23) / v24 + (v20 + v23) / v24;
  long double v27 = v21 + v20 * 6.123234e-17;
  long double v28 = v23 - v20;
  long double v29 = hypot(v27, v28);
  CGFloat v30 = v18 + v27 / v29 + v27 / v29;
  CGFloat v31 = v19 + v28 / v29 + v28 / v29;
  CGContextMoveToPoint(self->context, v34, v33);
  CGContextAddLineToPoint(self->context, v25, v26);
  CGContextAddLineToPoint(self->context, v30, v31);
  context = self->context;

  CGContextFillPath(context);
}

- (void)_drawCubicSpline:(id)a3
{
  uint64_t v5 = [a3 count];
  double v6 = pointFromValue((void *)[a3 objectAtIndexedSubscript:0]);
  CGContextMoveToPoint(self->context, v6, v7);
  double v8 = pointFromValue((void *)[a3 objectAtIndexedSubscript:0]);
  double v10 = v9;
  double v11 = pointFromValue((void *)[a3 objectAtIndexedSubscript:1]);
  double v13 = v12;
  if (v5 == 2)
  {
    double v14 = hypot(0.0, 1.0);
    double v15 = -1.0;
    if (v10 <= v13) {
      double v16 = 1.0;
    }
    else {
      double v16 = -1.0;
    }
    double v17 = 0.0 / v14;
    double v18 = 1.0 / v14;
    double v19 = v11 + v17 * v16;
    double v20 = v13 + v18 * v16;
    if (v10 > v13) {
      double v15 = 1.0;
    }
    double v21 = v17 * v15;
    double v22 = v18 * v15;
    v62.CGFloat x = v8 + v21;
    v62.CGFloat y = v10 + v22;
    v66.CGFloat x = v8;
    v66.CGFloat y = v10;
    v70.CGFloat x = v11;
    v70.CGFloat y = v13;
    CGCubicSplineGetControlPoints(v62, v66, v70, *(CGPoint *)&v19, &v60, &v59);
    context = self->context;
    CGFloat x = v60.x;
    CGFloat y = v60.y;
    CGFloat v26 = v59.x;
    CGFloat v27 = v59.y;
    CGContextAddCurveToPoint(context, x, y, v26, v27, v11, v13);
  }
  else
  {
    double v28 = pointFromValue((void *)[a3 objectAtIndexedSubscript:2]);
    CGFloat v30 = v29;
    if (v10 <= v13) {
      double v31 = -1.0;
    }
    else {
      double v31 = 1.0;
    }
    long double v32 = hypot(0.0, 1.0);
    double v33 = 1.0 / v32;
    double v58 = 0.0 / v32;
    v63.CGFloat x = v8 + v31 * (0.0 / v32);
    v63.CGFloat y = v10 + v31 * v33;
    v67.CGFloat x = v8;
    v67.CGFloat y = v10;
    v71.CGFloat x = v11;
    v71.CGFloat y = v13;
    v74.CGFloat x = v28;
    v74.CGFloat y = v30;
    CGCubicSplineGetControlPoints(v63, v67, v71, v74, &v60, &v59);
    CGContextAddCurveToPoint(self->context, v60.x, v60.y, v59.x, v59.y, v11, v13);
    if ((unint64_t)(v5 - 1) >= 3)
    {
      unsigned int v34 = 3;
      uint64_t v35 = 2;
      do
      {
        double v36 = pointFromValue((void *)[a3 objectAtIndexedSubscript:v34 - 3]);
        CGFloat v38 = v37;
        double v39 = pointFromValue((void *)[a3 objectAtIndexedSubscript:v34 - 2]);
        CGFloat v41 = v40;
        double v42 = pointFromValue((void *)[a3 objectAtIndexedSubscript:v35]);
        CGFloat v44 = v43;
        uint64_t v35 = v34;
        v75.CGFloat x = pointFromValue((void *)[a3 objectAtIndexedSubscript:v34]);
        v75.CGFloat y = v45;
        v64.CGFloat x = v36;
        v64.CGFloat y = v38;
        v68.CGFloat x = v39;
        v68.CGFloat y = v41;
        v72.CGFloat x = v42;
        v72.CGFloat y = v44;
        CGCubicSplineGetControlPoints(v64, v68, v72, v75, &v60, &v59);
        CGContextAddCurveToPoint(self->context, v60.x, v60.y, v59.x, v59.y, v42, v44);
      }
      while (v5 - 1 > (unint64_t)v34++);
    }
    double v47 = pointFromValue((void *)[a3 objectAtIndexedSubscript:v5 - 3]);
    CGFloat v49 = v48;
    double v50 = pointFromValue((void *)[a3 objectAtIndexedSubscript:v5 - 2]);
    double v52 = v51;
    double v54 = pointFromValue((void *)[a3 objectAtIndexedSubscript:v5 - 1]);
    CGFloat v55 = v53;
    double v56 = -1.0;
    if (v52 <= v53) {
      double v56 = 1.0;
    }
    v76.CGFloat x = v54 + v58 * v56;
    v76.CGFloat y = v53 + v33 * v56;
    v65.CGFloat x = v47;
    v65.CGFloat y = v49;
    v69.CGFloat x = v50;
    v69.CGFloat y = v52;
    v73.CGFloat x = v54;
    v73.CGFloat y = v55;
    CGCubicSplineGetControlPoints(v65, v69, v73, v76, &v60, &v59);
    CGContextAddCurveToPoint(self->context, v60.x, v60.y, v59.x, v59.y, v54, v55);
    CGFloat v57 = self->context;
    CGContextStrokePath(v57);
  }
}

- (void)hyperlinkEdge:(id)a3 from:(CGPoint)a4 to:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double v7 = a4.y;
  double v8 = a4.x;
  uint64_t v11 = [a3 from];
  uint64_t v12 = [a3 to];
  CFStringRef v13 = (const __CFString *)objc_msgSend(NSString, "stringWithFormat:", @"%p to %p", v11, v12);
  v21.double x = x;
  v21.double y = y;
  CGPDFContextAddDestinationAtPoint(self->context, v13, v21);
  v23.origin.double x = v8 + -10.0;
  v23.origin.double y = v7 + -10.0;
  v23.size.CGFloat width = 20.0;
  v23.size.CGFloat height = 20.0;
  CGPDFContextSetDestinationForRect(self->context, v13, v23);
  CFStringRef v14 = (const __CFString *)objc_msgSend(NSString, "stringWithFormat:", @"%p to %p", v12, v11);
  v22.double x = v8;
  v22.double y = v7;
  CGPDFContextAddDestinationAtPoint(self->context, v14, v22);
  context = self->context;
  double v18 = 20.0;
  double v19 = 20.0;

  double v16 = x + -10.0;
  double v17 = y + -10.0;
  CGPDFContextSetDestinationForRect(context, v14, *(CGRect *)(&v18 - 2));
}

- (void)drawEdge:(id)a3 withPath:(id)a4
{
  id v32 = (id)[a4 mutableCopy];
  double v6 = pointFromValue((void *)[v32 objectAtIndexedSubscript:1]);
  double v30 = v7;
  objc_msgSend((id)objc_msgSend(a3, "from"), "frame");
  CGFloat x = v34.origin.x;
  CGFloat y = v34.origin.y;
  CGFloat width = v34.size.width;
  CGFloat height = v34.size.height;
  double MidX = CGRectGetMidX(v34);
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v35);
  v36.origin.CGFloat x = x;
  v36.origin.CGFloat y = y;
  v36.size.CGFloat width = width;
  v36.size.CGFloat height = height;
  CGFloat v14 = CGRectGetWidth(v36) * 0.5;
  v37.origin.CGFloat x = x;
  v37.origin.CGFloat y = y;
  v37.size.CGFloat width = width;
  v37.size.CGFloat height = height;
  double v15 = fmin(fmin(v14 / vabdd_f64(v6, MidX), 1.0), CGRectGetHeight(v37) * 0.5 / vabdd_f64(v30, MidY));
  double v29 = MidY + (v30 - MidY) * v15;
  double v31 = MidX + (v6 - MidX) * v15;
  double v27 = pointFromValue(objc_msgSend(v32, "objectAtIndexedSubscript:", objc_msgSend(v32, "count") - 2));
  double v28 = v16;
  objc_msgSend((id)objc_msgSend(a3, "to"), "frame");
  CGFloat v17 = v38.origin.x;
  CGFloat v18 = v38.origin.y;
  CGFloat v19 = v38.size.width;
  CGFloat v20 = v38.size.height;
  double v21 = CGRectGetMidX(v38);
  v39.origin.CGFloat x = v17;
  v39.origin.CGFloat y = v18;
  v39.size.CGFloat width = v19;
  v39.size.CGFloat height = v20;
  double v22 = CGRectGetMidY(v39);
  v40.origin.CGFloat x = v17;
  v40.origin.CGFloat y = v18;
  v40.size.CGFloat width = v19;
  v40.size.CGFloat height = v20;
  CGFloat v23 = CGRectGetWidth(v40) * 0.5;
  v41.origin.CGFloat x = v17;
  v41.origin.CGFloat y = v18;
  v41.size.CGFloat width = v19;
  v41.size.CGFloat height = v20;
  double v24 = fmin(fmin(v23 / vabdd_f64(v27, v21), 1.0), CGRectGetHeight(v41) * 0.5 / vabdd_f64(v28, v22));
  double v25 = v21 + (v27 - v21) * v24;
  double v26 = v22 + (v28 - v22) * v24;
  objc_msgSend(v32, "setObject:atIndexedSubscript:", valueWithPoint(v25, v26), objc_msgSend(v32, "count") - 1);
  -[CGRenderer hyperlinkEdge:from:to:](self, "hyperlinkEdge:from:to:", a3, v31, v29, v25, v26);
  {
    -[CGRenderer drawEdge:withPath:]::deviceGraCGFloat y = (uint64_t)CGColorSpaceCreateDeviceGray();
  }
  CGContextSetStrokeColorSpace(self->context, (CGColorSpaceRef)-[CGRenderer drawEdge:withPath:]::deviceGray);
  CGContextSetStrokeColor(self->context, -[CGRenderer drawEdge:withPath:]::black);
  CGContextSetFillColorSpace(self->context, (CGColorSpaceRef)-[CGRenderer drawEdge:withPath:]::deviceGray);
  CGContextSetFillColor(self->context, -[CGRenderer drawEdge:withPath:]::black);
  CGContextSetLineWidth(self->context, 1.0);
  if (self->drawWithSplines) {
    [(CGRenderer *)self _drawCubicSpline:v32];
  }
  else {
    [(CGRenderer *)self _drawPolyline:v32];
  }
}

- (int)direction
{
  return self->direction;
}

- (void)setDirection:(int)a3
{
  self->direction = a3;
}

- (CGSize)separation
{
  objc_copyStruct(v4, &self->separation, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (void)setSeparation:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->separation, &v3, 16, 1, 0);
}

- (BOOL)drawEdgesFirst
{
  return self->drawEdgesFirst;
}

- (void)setDrawEdgesFirst:(BOOL)a3
{
  self->drawEdgesFirst = a3;
}

- (BOOL)drawWithSplines
{
  return self->drawWithSplines;
}

- (void)setDrawWithSplines:(BOOL)a3
{
  self->drawWithSplines = a3;
}

- (void)_colorForNodeColor:.cold.1()
{
}

- (void)_drawNodeContent:.cold.1()
{
}

@end