@interface AKRoundedPath
+ (id)pathWithEllipseInRect:(CGRect)a3;
+ (id)pathWithRect:(CGRect)a3;
+ (id)pathWithRoundedRect:(CGRect)a3 cornerRadius:(double)a4;
- (AKRoundedPath)initWithPoints:(CGPoint *)a3 count:(int64_t)a4;
- (AKRoundedPath)initWithRect:(CGRect)a3 cornerRadii:(id)a4 smoothPillShapes:(BOOL)a5;
- (CGPath)CGPath;
- (CGRect)boundingRect;
- (NSMutableArray)points;
- (void)addContinuousCornerToPath:(CGPath *)a3 trueCorner:(CGPoint)a4 cornerRadius:(CGSize)a5 corners:(unint64_t)a6 portion:(unint64_t)a7 clockwise:(BOOL)a8 fullRadius:(BOOL)a9;
- (void)addLineToPointX:(double)a3 y:(double)a4;
- (void)setCGPath:(CGPath *)a3;
- (void)setPoints:(id)a3;
@end

@implementation AKRoundedPath

+ (id)pathWithRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  CGFloat MinX = CGRectGetMinX(a3);
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v21);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  CGFloat MaxX = CGRectGetMaxX(v22);
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  *(CGFloat *)v13 = MinX;
  *(CGFloat *)&v13[1] = MinY;
  *(CGFloat *)&v13[2] = MinX;
  CGFloat MaxY = CGRectGetMaxY(v23);
  CGFloat v15 = MaxX;
  CGFloat v16 = MaxY;
  CGFloat v17 = MaxX;
  CGFloat v18 = MinY;
  v11 = (void *)[objc_alloc((Class)a1) initWithPoints:v13 count:4];
  [v11 closeSubpath];

  return v11;
}

+ (id)pathWithEllipseInRect:(CGRect)a3
{
  id v3 = objc_alloc_init((Class)a1);

  return v3;
}

- (AKRoundedPath)initWithPoints:(CGPoint *)a3 count:(int64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)AKRoundedPath;
  v6 = [(AKRoundedPath *)&v11 init];
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    points = v6->_points;
    v6->_points = v7;

    if (a4 >= 1)
    {
      p_CGFloat y = &a3->y;
      do
      {
        [(AKRoundedPath *)v6 addLineToPointX:*(p_y - 1) y:*p_y];
        p_y += 2;
        --a4;
      }
      while (a4);
    }
  }
  return v6;
}

- (void)addLineToPointX:(double)a3 y:(double)a4
{
  id v6 = +[AKCurvePoint pointWithX:a3 y:a4];
  v5 = [(AKRoundedPath *)self points];
  [v5 addObject:v6];
}

- (CGRect)boundingRect
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v2 = [(AKRoundedPath *)self points];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v25;
    double v6 = 0.0;
    double v7 = 1.79769313e308;
    double v8 = 0.0;
    double v9 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v25 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_super v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        [v11 x];
        if (v12 < v9)
        {
          [v11 x];
          double v9 = v13;
        }
        [v11 x];
        if (v14 > v6)
        {
          [v11 x];
          double v6 = v15;
        }
        [v11 y];
        if (v16 < v7)
        {
          [v11 y];
          double v7 = v17;
        }
        [v11 y];
        if (v18 > v8)
        {
          [v11 y];
          double v8 = v19;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
    double v7 = 1.79769313e308;
    double v8 = 0.0;
    double v9 = 1.79769313e308;
  }

  double v20 = v6 - v9;
  double v21 = v8 - v7;
  double v22 = v9;
  double v23 = v7;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

+ (id)pathWithRoundedRect:(CGRect)a3 cornerRadius:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v14[4] = *MEMORY[0x1E4F143B8];
  double v9 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:", a4, a4);
  id v10 = objc_alloc((Class)a1);
  v14[0] = v9;
  v14[1] = v9;
  v14[2] = v9;
  v14[3] = v9;
  objc_super v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:4];
  double v12 = objc_msgSend(v10, "initWithRect:cornerRadii:smoothPillShapes:", v11, 1, x, y, width, height);

  return v12;
}

- (AKRoundedPath)initWithRect:(CGRect)a3 cornerRadii:(id)a4 smoothPillShapes:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat v8 = a3.origin.y;
  CGFloat v9 = a3.origin.x;
  id v11 = a4;
  Mutable = CGPathCreateMutable();
  double v13 = [v11 objectAtIndex:0];
  [v13 sizeValue];
  double v15 = v14 * 1.528665;
  double v16 = [v11 objectAtIndex:0];
  [v16 sizeValue];
  double v71 = v17 * 1.528665;

  double v18 = [v11 objectAtIndex:1];
  [v18 sizeValue];
  double v73 = v19 * 1.528665;
  double v20 = [v11 objectAtIndex:1];
  [v20 sizeValue];
  double y = v21;

  uint64_t v22 = 3;
  double v23 = [v11 objectAtIndex:3];
  [v23 sizeValue];
  double v25 = v24 * 1.528665;
  long long v26 = [v11 objectAtIndex:3];
  [v26 sizeValue];
  double v66 = v27;

  v28 = [v11 objectAtIndex:2];
  [v28 sizeValue];
  double v30 = v29 * 1.528665;
  v31 = [v11 objectAtIndex:2];

  [v31 sizeValue];
  double v72 = v32 * 1.528665;

  double v33 = v73;
  double v70 = v15;
  BOOL v34 = v15 + v73 >= width;
  uint64_t v35 = 3;
  if (v15 + v73 >= width)
  {
    double v33 = width * 0.5;
    uint64_t v35 = 2;
    uint64_t v22 = 1;
    double v70 = width * 0.5;
  }
  double v74 = v33;
  double v36 = y * 1.528665;
  double v37 = v66 * 1.528665;
  double v38 = width * 0.5;
  if (v25 + v30 >= width) {
    double v39 = width * 0.5;
  }
  else {
    double v39 = v30;
  }
  if (v25 + v30 < width) {
    double v38 = v25;
  }
  double v65 = v38;
  double v67 = v39;
  if (v25 + v30 >= width) {
    uint64_t v40 = 1;
  }
  else {
    uint64_t v40 = 3;
  }
  if (v25 + v30 >= width) {
    uint64_t v41 = 2;
  }
  else {
    uint64_t v41 = 3;
  }
  if (v25 + v30 >= width) {
    BOOL v34 = 1;
  }
  BOOL v42 = v71 + v72 >= height;
  if (v71 + v72 >= height)
  {
    v22 &= 2u;
    v41 &= 1u;
    double v71 = height * 0.5;
    double v72 = height * 0.5;
  }
  BOOL v43 = v36 + v37 < height;
  if (v36 + v37 >= height) {
    double v37 = height * 0.5;
  }
  double v61 = v37;
  if (v43) {
    uint64_t v44 = v35;
  }
  else {
    uint64_t v44 = v35 & 1;
  }
  if (v43) {
    uint64_t v45 = v40;
  }
  else {
    uint64_t v45 = v40 & 2;
  }
  int v46 = !v43 || v42;
  if (!v43) {
    double v36 = height * 0.5;
  }
  double v63 = v36;
  uint64_t v47 = v41 | v22 | v44 | v45;
  if (!v47) {
    BOOL v5 = 0;
  }
  int v48 = v34 && v5;
  v75.origin.double x = v9;
  v75.origin.double y = v8;
  v75.size.double width = width;
  v75.size.double height = height;
  double MinX = CGRectGetMinX(v75);
  v76.origin.double x = v9;
  v76.origin.double y = v8;
  v76.size.double width = width;
  v76.size.double height = height;
  double ya = CGRectGetMinY(v76);
  v77.origin.double x = v9;
  v77.origin.double y = v8;
  v77.size.double width = width;
  v77.size.double height = height;
  double MaxX = CGRectGetMaxX(v77);
  v78.origin.double x = v9;
  v78.origin.double y = v8;
  v78.size.double width = width;
  v78.size.double height = height;
  double MinY = CGRectGetMinY(v78);
  v79.origin.double x = v9;
  v79.origin.double y = v8;
  v79.size.double width = width;
  v79.size.double height = height;
  double v51 = CGRectGetMinX(v79);
  v80.origin.double x = v9;
  v80.origin.double y = v8;
  v80.size.double width = width;
  v80.size.double height = height;
  double MaxY = CGRectGetMaxY(v80);
  v81.origin.double x = v9;
  v81.origin.double y = v8;
  v81.size.double width = width;
  v81.size.double height = height;
  double v52 = CGRectGetMaxX(v81);
  v82.origin.double x = v9;
  v82.origin.double y = v8;
  v82.size.double width = width;
  v82.size.double height = height;
  double v53 = CGRectGetMaxY(v82);
  if (v48 == 1)
  {
    double v54 = v70;
    double MinX = MinX + v70 * 0.05;
    double v55 = v74;
    double MaxX = MaxX - v74 * 0.05;
    double v51 = v51 + v67 * 0.05;
    double v52 = v52 - v65 * 0.05;
  }
  else
  {
    double v54 = v70;
    if ((v46 & v5) == 1)
    {
      double ya = ya + v71 * 0.05;
      double MinY = MinY + v63 * 0.05;
      double MaxY = MaxY - v72 * 0.05;
      double v53 = v53 - v61 * 0.05;
    }
    double v55 = v74;
  }
  double x = v54 + MinX;
  CGPathMoveToPoint(Mutable, 0, v54 + MinX, ya);
  CGPathAddLineToPoint(Mutable, 0, MaxX - v55, MinY);
  double v57 = *MEMORY[0x1E4F1DB30];
  double v56 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v55 != *MEMORY[0x1E4F1DB30] || v63 != v56) {
    -[AKRoundedPath addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:](self, "addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:", Mutable, 2, v44, 0, v47 == 0, MaxX, MinY, v55, v63, *(void *)&x);
  }
  CGPathAddLineToPoint(Mutable, 0, v52, v53 - v61);
  if (v65 != v57 || v61 != v56) {
    -[AKRoundedPath addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:](self, "addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:", Mutable, 8, v45, 0, v47 == 0, v52, v53, v65, v61);
  }
  CGPathAddLineToPoint(Mutable, 0, v67 + v51, MaxY);
  if (v67 != v57 || v72 != v56) {
    -[AKRoundedPath addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:](self, "addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:", Mutable, 4, v41, 0, v47 == 0, v51, MaxY, v67, v72);
  }
  CGPathAddLineToPoint(Mutable, 0, MinX, v71 + ya);
  if (v70 != v57 || v71 != v56) {
    -[AKRoundedPath addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:](self, "addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:", Mutable, 1, v22, 0, v47 == 0, MinX, ya, v70, v71);
  }
  CGPathAddLineToPoint(Mutable, 0, x, ya);
  v58 = objc_alloc_init(AKRoundedPath);
  [(AKRoundedPath *)v58 setCGPath:Mutable];
  CGPathRelease(Mutable);

  return v58;
}

- (void)addContinuousCornerToPath:(CGPath *)a3 trueCorner:(CGPoint)a4 cornerRadius:(CGSize)a5 corners:(unint64_t)a6 portion:(unint64_t)a7 clockwise:(BOOL)a8 fullRadius:(BOOL)a9
{
  BOOL v9 = a8;
  char v10 = a7;
  double x = a4.x;
  if (a5.width < a5.height) {
    a5.double height = a5.width;
  }
  double v14 = 0.980263;
  if (a9) {
    double v14 = 1.0;
  }
  double height = a5.height;
  if (a9) {
    double v15 = a5.height;
  }
  else {
    double v15 = a5.height * 0.95;
  }
  double v95 = v14;
  double v16 = 0.0;
  if (a6 - 1 <= 3) {
    double v16 = dbl_1C392E2D0[a6 - 1];
  }
  double v17 = v15 * (1.0 - v14);
  if (a7 == 2)
  {
    double v96 = v16;
    double v18 = -v17;
    double v94 = 70.0;
    double v19 = *MEMORY[0x1E4F1DAD8];
  }
  else if (a7 == 1)
  {
    double v96 = v16 + 20.0;
    double v19 = -v17;
    double v94 = 70.0;
    double v18 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else if (a7)
  {
    double v96 = v16 + 20.0;
    double v94 = 50.0;
    double v18 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v19 = *MEMORY[0x1E4F1DAD8];
    double v15 = v15 / 1.528665;
  }
  else
  {
    double v96 = v16;
    double v18 = -v17;
    double v94 = 90.0;
    double v19 = -v17;
  }
  double v20 = _interiorPointForCorner(a6, v19, v18, *MEMORY[0x1E4F1DAD8]);
  CGFloat v91 = v21;
  CGFloat v92 = v20;
  double v22 = v15 * 0.33 * 0.666666667;
  double v23 = v22 * 1.05304325;
  double v24 = v22 * 0.33 / 1.05304325;
  double v25 = (v15 / 1.05304325 + v24) * 0.67;
  double v26 = v23 + v25;
  double v27 = v23 + v23 + v25;
  double v28 = v23 + v23 + v27;
  double v29 = v25 + v24 * 0.33;
  double v89 = _interiorPointForCorner(a6, v27, 0.0, x);
  double v90 = v30;
  double v87 = _interiorPointForCorner(a6, v26, 0.0, x);
  double v88 = v31;
  double v32 = _interiorPointForCorner(a6, v29, v24, x);
  double v79 = v33;
  double v80 = v32;
  double v34 = _interiorPointForCorner(a6, v24, v29, x);
  double v75 = v35;
  double v76 = v34;
  double v85 = _interiorPointForCorner(a6, 0.0, v26, x);
  double v86 = v36;
  double v83 = _interiorPointForCorner(a6, 0.0, v27, x);
  double v84 = v37;
  double v38 = _interiorPointForCorner(a6, 0.0, v28, x);
  double v81 = v39;
  double v82 = v38;
  double v40 = _interiorPointForCorner(a6, v28, 0.0, x);
  double v77 = v41;
  double v78 = v40;
  double v42 = _interiorPointForCorner(a6, v15, v15, x);
  CGFloat v44 = v43;
  double v45 = _interiorPointForCorner(a6, height, 0.0, x);
  double v47 = v46;
  double v48 = _interiorPointForCorner(a6, 0.0, height, x);
  double v50 = v49;
  memset(&m, 0, sizeof(m));
  CGAffineTransformMakeTranslation(&m, v92, v91);
  if (v9)
  {
    if (v10)
    {
      p_CGAffineTransform m = &m;
      double v51 = a3;
      CGFloat v53 = v83;
      CGFloat v54 = v84;
      CGFloat v55 = v85;
      CGFloat v56 = v86;
      CGFloat v58 = v75;
      CGFloat v57 = v76;
    }
    else
    {
      double v51 = a3;
      p_CGAffineTransform m = 0;
      CGFloat v53 = v48;
      CGFloat v54 = v50;
      CGFloat v55 = v48;
      CGFloat v56 = v50;
      CGFloat v57 = v48;
      CGFloat v58 = v50;
    }
    CGPathAddCurveToPoint(v51, p_m, v53, v54, v55, v56, v57, v58);
    CGPathAddArc(a3, &m, v42, v44, v95 * v15, (v94 + v96) * 0.0174532925, v96 * 0.0174532925, 1);
    if ((v10 & 2) != 0)
    {
      v68 = &m;
      double v67 = a3;
      CGFloat v69 = v87;
      CGFloat v70 = v88;
      CGFloat v71 = v89;
      CGFloat v72 = v90;
      CGFloat v74 = v77;
      CGFloat v73 = v78;
    }
    else
    {
      double v67 = a3;
      v68 = 0;
      CGFloat v69 = v45;
      CGFloat v70 = v47;
      CGFloat v71 = v45;
      CGFloat v72 = v47;
      CGFloat v73 = v45;
      CGFloat v74 = v47;
    }
  }
  else
  {
    if (v10)
    {
      v60 = &m;
      v59 = a3;
      CGFloat v61 = v89;
      CGFloat v62 = v90;
      CGFloat v63 = v87;
      CGFloat v64 = v88;
      CGFloat v66 = v79;
      CGFloat v65 = v80;
    }
    else
    {
      v59 = a3;
      v60 = 0;
      CGFloat v61 = v45;
      CGFloat v62 = v47;
      CGFloat v63 = v45;
      CGFloat v64 = v47;
      CGFloat v65 = v45;
      CGFloat v66 = v47;
    }
    CGPathAddCurveToPoint(v59, v60, v61, v62, v63, v64, v65, v66);
    CGPathAddArc(a3, &m, v42, v44, v95 * v15, v96 * 0.0174532925, (v94 + v96) * 0.0174532925, 0);
    if ((v10 & 2) != 0)
    {
      v68 = &m;
      double v67 = a3;
      CGFloat v69 = v85;
      CGFloat v70 = v86;
      CGFloat v71 = v83;
      CGFloat v72 = v84;
      CGFloat v74 = v81;
      CGFloat v73 = v82;
    }
    else
    {
      double v67 = a3;
      v68 = 0;
      CGFloat v69 = v48;
      CGFloat v70 = v50;
      CGFloat v71 = v48;
      CGFloat v72 = v50;
      CGFloat v73 = v48;
      CGFloat v74 = v50;
    }
  }
  CGPathAddCurveToPoint(v67, v68, v69, v70, v71, v72, v73, v74);
}

- (CGPath)CGPath
{
  return self->_CGPath;
}

- (void)setCGPath:(CGPath *)a3
{
}

- (NSMutableArray)points
{
  return self->_points;
}

- (void)setPoints:(id)a3
{
}

- (void).cxx_destruct
{
}

@end