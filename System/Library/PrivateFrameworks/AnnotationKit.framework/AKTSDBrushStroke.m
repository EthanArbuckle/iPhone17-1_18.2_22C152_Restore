@interface AKTSDBrushStroke
+ (AKTSDBrushStroke)strokeWithName:(id)a3 color:(id)a4 width:(double)a5;
+ (AKTSDBrushStroke)strokeWithType:(int64_t)a3 color:(id)a4 width:(double)a5;
+ (Class)mutableClass;
+ (id)cacheDirectory;
+ (void)loadBrush:(id)a3;
+ (void)loadLineEndsForBrush:(id)a3 inSVGDoc:(_xmlDoc *)a4;
+ (void)loadSectionsForBrush:(id)a3 inSVGDoc:(_xmlDoc *)a4;
- (AKTSDBrushStroke)initWithName:(id)a3 color:(id)a4 width:(double)a5 join:(int)a6 miterLimit:(double)a7;
- (NSString)strokeName;
- (UIColor)color;
- (double)miterLimit;
- (double)width;
- (id)brushBoundsForId:(id)a3;
- (id)brushPathsForId:(id)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)strokeLineEnd:(id)a3;
- (int)join;
- (void)brushPath:(id)a3 inContext:(CGContext *)a4;
- (void)brushPath:(id)a3 withScaling:(id)a4 inElementRange:(_NSRange)a5 into:(id)a6 sectionIndex:(unint64_t *)a7 viewScale:(double)a8;
- (void)brushSection:(id)a3 sectionIndex:(unint64_t)a4 ontoPath:(id)a5 withScaling:(id)a6 inElementRange:(_NSRange)a7 into:(id)a8 viewScale:(double)a9;
- (void)paintLineEnd:(id)a3 atPoint:(CGPoint)a4 atAngle:(double)a5 withScale:(double)a6 inContext:(CGContext *)a7;
- (void)paintLineEnd:(id)a3 atPoint:(CGPoint)a4 atAngle:(double)a5 withScale:(double)a6 inContext:(CGContext *)a7 useFastDrawing:(BOOL)a8;
@end

@implementation AKTSDBrushStroke

+ (AKTSDBrushStroke)strokeWithName:(id)a3 color:(id)a4 width:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)[objc_alloc((Class)objc_opt_class()) initWithName:v7 color:v8 width:0 join:a5 miterLimit:10.0];

  return (AKTSDBrushStroke *)v9;
}

+ (AKTSDBrushStroke)strokeWithType:(int64_t)a3 color:(id)a4 width:(double)a5
{
  id v7 = a4;
  id v8 = 0;
  switch(a3)
  {
    case 0:
      goto LABEL_7;
    case 1:
      id v8 = @"Chalk2";
      goto LABEL_6;
    case 2:
      id v8 = @"Pen";
      goto LABEL_6;
    case 3:
      id v8 = @"Feathered Brush";
      goto LABEL_6;
    case 4:
      id v8 = @"Dry Brush";
      goto LABEL_6;
    default:
LABEL_6:
      id v8 = (__CFString *)[objc_alloc((Class)objc_opt_class()) initWithName:v8 color:v7 width:0 join:a5 miterLimit:10.0];
LABEL_7:

      return (AKTSDBrushStroke *)v8;
  }
}

- (AKTSDBrushStroke)initWithName:(id)a3 color:(id)a4 width:(double)a5 join:(int)a6 miterLimit:(double)a7
{
  id v12 = a3;
  id v13 = a4;
  v18.receiver = self;
  v18.super_class = (Class)AKTSDBrushStroke;
  v14 = [(AKTSDBrushStroke *)&v18 init];
  if (v14)
  {
    uint64_t v15 = [v12 copy];
    strokeName = v14->_strokeName;
    v14->_strokeName = (NSString *)v15;

    objc_storeStrong((id *)&v14->_color, a4);
    v14->_join = a6;
    v14->_width = a5;
    v14->_miterLimit = a7;
  }

  return v14;
}

+ (Class)mutableClass
{
  return (Class)objc_opt_class();
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [AKTSDMutableBrushStroke alloc];
  v5 = [(AKTSDBrushStroke *)self strokeName];
  v6 = [(AKTSDBrushStroke *)self color];
  [(AKTSDBrushStroke *)self width];
  double v8 = v7;
  uint64_t v9 = [(AKTSDBrushStroke *)self join];
  [(AKTSDBrushStroke *)self miterLimit];
  v11 = [(AKTSDBrushStroke *)v4 initWithName:v5 color:v6 width:v9 join:v8 miterLimit:v10];

  return v11;
}

+ (id)cacheDirectory
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = [v2 lastObject];

  v4 = [v3 stringByAppendingPathComponent:@"Brushes"];

  v5 = [MEMORY[0x263F08850] defaultManager];
  [v5 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:0];

  return v4;
}

+ (void)loadBrush:(id)a3
{
  id v3 = a3;
  v4 = sub_237674CB4();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_237674D08;
  block[3] = &unk_264CDB628;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(v4, block);
}

+ (void)loadLineEndsForBrush:(id)a3 inSVGDoc:(_xmlDoc *)a4
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v50 = a3;
  v54 = a4;
  sub_2376751EC(a4, @"//svg:path['_wrap'=substring(@id,string-length(@id)-4)]");
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v65 objects:v69 count:16];
  if (v5)
  {
    uint64_t v49 = *(void *)v66;
    do
    {
      uint64_t v51 = v5;
      for (uint64_t i = 0; i != v51; ++i)
      {
        if (*(void *)v66 != v49) {
          objc_enumerationMutation(obj);
        }
        id v7 = [*(id *)(*((void *)&v65 + 1) + 8 * i) objectForKey:@"nodeAttributes"];
        double v8 = [v7 objectForKey:@"d"];
        uint64_t v9 = [v7 objectForKey:@"id"];
        double v10 = objc_msgSend(v9, "substringToIndex:", objc_msgSend(v9, "length") - 5);

        v11 = [NSString stringWithFormat:@"//svg:path[@id='%@_end']", v10];
        v57 = sub_2376751EC(v54, v11);

        id v12 = [v57 lastObject];
        id v13 = [v12 objectForKey:@"nodeAttributes"];

        v56 = [v13 objectForKey:@"d"];
        v14 = [NSString stringWithFormat:@"//svg:rect[@id='%@_end_bounds']", v10];
        uint64_t v15 = sub_2376751EC(v54, v14);

        v16 = [v15 lastObject];
        v17 = [v16 objectForKey:@"nodeAttributes"];

        objc_super v18 = [v17 objectForKey:@"x"];
        [v18 floatValue];
        float v20 = v19;

        v21 = [v17 objectForKey:@"y"];
        [v21 floatValue];
        float v23 = v22;

        v24 = [v17 objectForKey:@"width"];
        [v24 floatValue];
        float v26 = v25;

        v27 = [v17 objectForKey:@"height"];
        [v27 floatValue];
        float v29 = v28;

        v30 = [v10 stringByReplacingOccurrencesOfString:@"_" withString:@" "];

        v31 = [NSString stringWithFormat:@"%@:%@", v50, v30];

        float v53 = v26;
        CGFloat v32 = v20;
        CGFloat v33 = v29;
        long long v34 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
        *(_OWORD *)&v63.CGFloat a = *MEMORY[0x263F000D0];
        *(_OWORD *)&v63.double c = v34;
        *(_OWORD *)&v63.double tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
        CGAffineTransformTranslate(&v64, &v63, 0.0, -0.5);
        CGAffineTransform v62 = v64;
        CGAffineTransformScale(&v64, &v62, 2.0 / v33, 2.0 / v33);
        CGAffineTransform v61 = v64;
        CGFloat v52 = v23;
        CGAffineTransformTranslate(&v64, &v61, -v20, -v23);
        CGAffineTransform v60 = v64;
        CGAffineTransformRotate(&v64, &v60, -1.57079633);
        CGFloat a = v64.a;
        double b = v64.b;
        double c = v64.c;
        double d = v64.d;
        double tx = v64.tx;
        double ty = v64.ty;
        v41 = sub_2376C1B48(v8);
        double v55 = a;
        m.CGFloat a = a;
        m.double b = b;
        m.double c = c;
        m.double d = d;
        m.double tx = tx;
        m.double ty = ty;
        Mutable = CGPathCreateMutable();
        CGPathAddPath(Mutable, &m, v41);
        v43 = sub_2376C1B48(v56);
        v58.CGFloat a = a;
        v58.double b = b;
        v58.double c = c;
        v58.double d = d;
        v58.double tx = tx;
        v58.double ty = ty;
        v44 = CGPathCreateMutable();
        CGPathAddPath(v44, &v58, v43);
        v71.origin.x = v32;
        v71.origin.y = v52;
        v71.size.width = v53;
        v71.size.height = v33;
        double MaxX = CGRectGetMaxX(v71);
        v72.origin.x = v32;
        v72.origin.y = v52;
        v72.size.width = v53;
        v72.size.height = v33;
        CGFloat MidY = CGRectGetMidY(v72);
        v47 = +[AKTSDLineEnd lineEndWithPath:wrapPath:endPoint:isFilled:identifier:](AKTSDLineEnd, "lineEndWithPath:wrapPath:endPoint:isFilled:identifier:", v44, Mutable, 1, v31, tx + c * MidY + v55 * MaxX, ty + d * MidY + b * MaxX);
        [(id)qword_2689251F0 setObject:v47 forKey:v31];
        CGPathRelease(v43);
        CGPathRelease(v44);
        CGPathRelease(v41);
        CGPathRelease(Mutable);
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v65 objects:v69 count:16];
    }
    while (v5);
  }
}

+ (void)loadSectionsForBrush:(id)a3 inSVGDoc:(_xmlDoc *)a4
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v37 = a3;
  uint64_t v4 = objc_msgSend((id)qword_268925200, "objectForKey:");
  if (!v4)
  {
    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    [(id)qword_268925200 setObject:v4 forKey:v37];
  }
  v43 = (void *)v4;
  uint64_t v5 = [(id)qword_268925208 objectForKey:v37];
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    [(id)qword_268925208 setObject:v5 forKey:v37];
  }
  v42 = (void *)v5;
  sub_2376751EC(a4, @"//svg:path['_section'=substring(@id,string-length(@id)-7)]");
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (v6)
  {
    uint64_t v39 = *(void *)v53;
    do
    {
      uint64_t v41 = v6;
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v53 != v39) {
          objc_enumerationMutation(obj);
        }
        double v8 = [*(id *)(*((void *)&v52 + 1) + 8 * i) objectForKey:@"nodeAttributes"];
        v44 = [v8 objectForKey:@"d"];
        uint64_t v9 = [v8 objectForKey:@"id"];
        double v10 = [NSString stringWithFormat:@"//svg:rect[@id='%@_bounds']", v9];
        v45 = sub_2376751EC(a4, v10);

        v11 = [v45 lastObject];
        id v12 = [v11 objectForKey:@"nodeAttributes"];

        id v13 = [v12 objectForKey:@"x"];
        [v13 floatValue];
        float v15 = v14;

        v16 = [v12 objectForKey:@"y"];
        [v16 floatValue];
        float v18 = v17;

        float v19 = [v12 objectForKey:@"width"];
        [v19 floatValue];
        float v21 = v20;

        float v22 = [v12 objectForKey:@"height"];
        [v22 floatValue];
        float v24 = v23;

        float v25 = sub_2376C1B48(v44);
        float v26 = +[AKTSDBezierPath bezierPathWithCGPath:v25];
        double v27 = v15;
        double v28 = v18;
        double v29 = v21;
        double v30 = v24;
        long long v31 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
        *(_OWORD *)&v51.CGFloat a = *MEMORY[0x263F000D0];
        *(_OWORD *)&v51.double c = v31;
        *(_OWORD *)&v51.double tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
        *(_OWORD *)&v50.CGFloat a = *(_OWORD *)&v51.a;
        *(_OWORD *)&v50.double c = v31;
        *(_OWORD *)&v50.double tx = *(_OWORD *)&v51.tx;
        CGAffineTransformTranslate(&v51, &v50, 0.0, -0.5);
        CGAffineTransform v48 = v51;
        CGAffineTransformScale(&v49, &v48, 1.0 / v29, 1.0 / v30);
        CGAffineTransform v51 = v49;
        CGAffineTransform v47 = v49;
        CGAffineTransformTranslate(&v49, &v47, -v27, -v28);
        CGAffineTransform v51 = v49;
        CGAffineTransform v46 = v49;
        [v26 transformUsingAffineTransform:&v46];
        CGFloat v32 = objc_msgSend(v9, "substringToIndex:", objc_msgSend(v9, "rangeOfString:", @"_"));
        id v33 = v26;
        long long v34 = [v43 objectForKey:v32];
        if (!v34)
        {
          long long v34 = [MEMORY[0x263EFF980] array];
          [v43 setObject:v34 forKey:v32];
        }
        v35 = [v42 objectForKey:v32];
        if (!v35)
        {
          v35 = [MEMORY[0x263EFF980] array];
          [v42 setObject:v35 forKey:v32];
        }
        [v34 addObject:v33];
        v36 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v27, v28, v29, v30);
        [v35 addObject:v36];

        CGPathRelease(v25);
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
    }
    while (v6);
  }
}

- (id)brushPathsForId:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AKTSDBrushStroke *)self strokeName];
  +[AKTSDBrushStroke loadBrush:v5];

  uint64_t v13 = 0;
  float v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_23767625C;
  float v17 = sub_23767626C;
  id v18 = 0;
  uint64_t v6 = sub_237674CB4();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_237676274;
  v10[3] = &unk_264CDB650;
  id v11 = v4;
  id v12 = &v13;
  id v7 = v4;
  dispatch_sync(v6, v10);

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (id)brushBoundsForId:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AKTSDBrushStroke *)self strokeName];
  +[AKTSDBrushStroke loadBrush:v5];

  uint64_t v13 = 0;
  float v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_23767625C;
  float v17 = sub_23767626C;
  id v18 = 0;
  uint64_t v6 = sub_237674CB4();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_237676430;
  v10[3] = &unk_264CDB650;
  id v11 = v4;
  id v12 = &v13;
  id v7 = v4;
  dispatch_sync(v6, v10);

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (id)strokeLineEnd:(id)a3
{
  id v4 = a3;
  if ([v4 isNone])
  {
    id v5 = v4;
  }
  else
  {
    uint64_t v6 = [v4 identifier];
    id v7 = [(AKTSDBrushStroke *)self strokeName];
    char v8 = [v6 hasPrefix:v7];

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = [v6 rangeOfString:@":"];
      if (v9 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v11 = [v6 substringFromIndex:v9 + v10];

        uint64_t v6 = (void *)v11;
      }
      id v12 = NSString;
      uint64_t v13 = [(AKTSDBrushStroke *)self strokeName];
      uint64_t v14 = [v12 stringWithFormat:@"%@:%@", v13, v6];

      uint64_t v6 = (void *)v14;
    }
    uint64_t v15 = [(AKTSDBrushStroke *)self strokeName];
    +[AKTSDBrushStroke loadBrush:v15];

    uint64_t v22 = 0;
    float v23 = &v22;
    uint64_t v24 = 0x3032000000;
    float v25 = sub_23767625C;
    float v26 = sub_23767626C;
    id v27 = 0;
    v16 = sub_237674CB4();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2376766D8;
    block[3] = &unk_264CDB650;
    id v20 = v6;
    float v21 = &v22;
    id v17 = v6;
    dispatch_sync(v16, block);

    id v5 = (id)v23[5];
    _Block_object_dispose(&v22, 8);
  }

  return v5;
}

- (void)paintLineEnd:(id)a3 atPoint:(CGPoint)a4 atAngle:(double)a5 withScale:(double)a6 inContext:(CGContext *)a7
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v13 = a3;
  CGContextSaveGState(a7);
  memset(&v23, 0, sizeof(v23));
  CGAffineTransformMakeTranslation(&v23, x, y);
  CGAffineTransform v21 = v23;
  CGAffineTransformScale(&v22, &v21, a6, a6);
  CGAffineTransform v23 = v22;
  CGAffineTransform v20 = v22;
  CGAffineTransformRotate(&v22, &v20, a5);
  CGAffineTransform v23 = v22;
  CGAffineTransform v19 = v22;
  [v13 endPoint];
  double v15 = v14;
  [v13 endPoint];
  CGAffineTransformTranslate(&v22, &v19, -v15, -v16);
  CGAffineTransform v23 = v22;
  CGAffineTransform v18 = v22;
  CGContextConcatCTM(a7, &v18);
  CGContextAddPath(a7, (CGPathRef)[v13 path]);
  if ([v13 isFilled])
  {
    CGContextFillPath(a7);
  }
  else
  {
    [(AKTSDBrushStroke *)self width];
    CGContextSetLineWidth(a7, v17 / a6);
    CGContextSetLineJoin(a7, (CGLineJoin)[v13 lineJoin]);
    CGContextStrokePath(a7);
  }
  CGContextRestoreGState(a7);
}

- (void)paintLineEnd:(id)a3 atPoint:(CGPoint)a4 atAngle:(double)a5 withScale:(double)a6 inContext:(CGContext *)a7 useFastDrawing:(BOOL)a8
{
  BOOL v8 = a8;
  double y = a4.y;
  double x = a4.x;
  id v15 = a3;
  id v23 = v15;
  if (v8)
  {
    double v16 = [v15 identifier];
    uint64_t v17 = [v16 rangeOfString:@":"];
    if (v17 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v19 = v23;
    }
    else
    {
      uint64_t v21 = [v16 substringFromIndex:v17 + v18];

      uint64_t v22 = +[AKTSDLineEnd lineEndWithIdentifier:v21];

      double v16 = (void *)v21;
      id v19 = (id)v22;
    }
    id v24 = v19;
    -[AKTSDBrushStroke paintLineEnd:atPoint:atAngle:withScale:inContext:](self, "paintLineEnd:atPoint:atAngle:withScale:inContext:", x, y, a5, a6);
  }
  else
  {
    uint64_t v20 = [(AKTSDBrushStroke *)self strokeLineEnd:v15];

    id v24 = (id)v20;
    -[AKTSDBrushStroke paintLineEnd:atPoint:atAngle:withScale:inContext:](self, "paintLineEnd:atPoint:atAngle:withScale:inContext:", v20, a7, x, y, a5, a6);
  }
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(AKTSDBrushStroke *)self strokeName];
  [(AKTSDBrushStroke *)self width];
  BOOL v8 = [v3 stringWithFormat:@"<%@ %p strokeName='%@' width=%f>", v5, self, v6, v7];

  return v8;
}

- (void)brushSection:(id)a3 sectionIndex:(unint64_t)a4 ontoPath:(id)a5 withScaling:(id)a6 inElementRange:(_NSRange)a7 into:(id)a8 viewScale:(double)a9
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  double var1 = a6.var1;
  double var0 = a6.var0;
  id v25 = a3;
  id v17 = a5;
  id v18 = a8;
  id v19 = [(AKTSDBrushStroke *)self strokeName];
  uint64_t v20 = [(AKTSDBrushStroke *)self brushPathsForId:v19];

  uint64_t v21 = [v20 objectForKeyedSubscript:v25];
  uint64_t v22 = [v21 objectAtIndexedSubscript:a4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v17 lineWidth];
    uint64_t v24 = [v22 objectAtIndexedSubscript:v23 < 15.0];

    uint64_t v22 = (void *)v24;
  }
  objc_msgSend(v22, "recursiveSubdivideOntoPath:withScaling:inElementRange:into:", v17, location, length, v18, var0, var1);
}

- (void)brushPath:(id)a3 withScaling:(id)a4 inElementRange:(_NSRange)a5 into:(id)a6 sectionIndex:(unint64_t *)a7 viewScale:(double)a8
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v88 = a3;
  id v16 = a6;
  if ([v88 elementCount] >= 2)
  {
    [v88 lineWidth];
    double v18 = v17;
    id v19 = [(AKTSDBrushStroke *)self strokeName];
    v86 = [(AKTSDBrushStroke *)self brushPathsForId:v19];

    uint64_t v20 = [(AKTSDBrushStroke *)self strokeName];
    NSUInteger v87 = length;
    v85 = [(AKTSDBrushStroke *)self brushBoundsForId:v20];

    uint64_t v21 = [v86 objectForKey:@"middle"];
    double v83 = 0.0;
    if ((unint64_t)[v21 count] >= 2)
    {
      uint64_t v22 = [v85 objectForKeyedSubscript:@"middle"];
      double v23 = [v22 lastObject];
      [v23 CGRectValue];
      double v25 = v24;
      double v27 = v26;

      double v83 = v25 / v27;
    }
    if (v18 < 5.0)
    {
      double v28 = [v86 objectForKey:@"small"];
      if (v28)
      {
        v84 = v28;
        unint64_t v29 = [v28 count];
        [v88 length];
        double v31 = v30;
        CGFloat v32 = [v85 objectForKeyedSubscript:@"small"];
        id v33 = [v32 lastObject];
        id v34 = v16;
        [v33 CGRectValue];
        double v36 = v35;
        double v38 = v37;

        double v39 = var1 * v31 / (v18 * (v36 / v38));
        uint64_t v40 = (uint64_t)v39;
        if ((uint64_t)v39 >= 1)
        {
          uint64_t v41 = 0;
          double v42 = 1.0 / (double)(uint64_t)v39;
          unint64_t v43 = *a7;
          do
          {
            [(AKTSDBrushStroke *)self brushSection:@"small", v43 % v29, v88, location, v87, v34, var0 + v42 * (double)v41 * var1, var1 * v42, a8 sectionIndex ontoPath withScaling inElementRange into viewScale];
            unint64_t v44 = 1664525 * *a7 + 1013904223;
            if (v44 % v29 == *a7 % v29) {
              unint64_t v43 = v44 + 1;
            }
            else {
              unint64_t v43 = 1664525 * *a7 + 1013904223;
            }
            *a7 = v43;
            ++v41;
          }
          while (v40 != v41);
        }
        id v16 = v34;
        v45 = v84;
        goto LABEL_39;
      }
    }
    CGAffineTransform v46 = [v86 objectForKey:@"end"];

    if (v46)
    {
      v82 = v21;
      CGAffineTransform v47 = [v85 objectForKeyedSubscript:@"start"];
      CGAffineTransform v48 = [v47 lastObject];
      [v48 CGRectValue];
      double v50 = v49;
      double v52 = v51;

      long long v53 = [v85 objectForKeyedSubscript:@"end"];
      long long v54 = [v53 lastObject];
      [v54 CGRectValue];
      double v56 = v55;
      double v58 = v57;
      double v81 = v18;

      [v88 length];
      double v60 = v50 / v52;
      double v61 = v56 / v58;
      double v62 = var1 * v59;
      double v63 = v60 + v56 / v58;
      double v64 = v81 * v60 / (var1 * v59);
      if (v64 <= v60 / v63) {
        double v65 = v81 * v60 / (var1 * v59);
      }
      else {
        double v65 = v60 / v63;
      }
      [(AKTSDBrushStroke *)self brushSection:@"start", 0, v88, location, length, v16, var0 + var1 * 0.0, var1 * v65, a8 sectionIndex ontoPath withScaling inElementRange into viewScale];
      double v66 = v61 / v63;
      if (v81 * v61 / v62 <= v61 / v63) {
        double v66 = v81 * v61 / v62;
      }
      [(AKTSDBrushStroke *)self brushSection:@"end", 0, v88, location, length, v16, var0 + (1.0 - v66) * var1, var1 * v66, a8 sectionIndex ontoPath withScaling inElementRange into viewScale];
      unint64_t v67 = [v21 count];
      uint64_t v68 = (uint64_t)((v62 - v63 * v81) / (v81 * v83) + 1.0);
      double v69 = (1.0 - v81 * v63 / v62) / (double)v68;
      if (v67 > 1)
      {
        if (v68 >= 1)
        {
          id v70 = v16;
          uint64_t v71 = 0;
          unint64_t v72 = *a7;
          do
          {
            [(AKTSDBrushStroke *)self brushSection:@"middle", v72 % v67, v88, location, v87, v70, var0 + (v64 + (double)v71 * v69) * var1, var1 * v69, a8 sectionIndex ontoPath withScaling inElementRange into viewScale];
            unint64_t v73 = 1664525 * *a7 + 1013904223;
            if (v73 % v67 == *a7 % v67) {
              unint64_t v72 = v73 + 1;
            }
            else {
              unint64_t v72 = 1664525 * *a7 + 1013904223;
            }
            *a7 = v72;
            ++v71;
          }
          while (v68 != v71);
          v45 = 0;
          id v16 = v70;
          goto LABEL_37;
        }
LABEL_36:
        v45 = 0;
LABEL_37:
        uint64_t v21 = v82;
        goto LABEL_39;
      }
      if (v68 < 1) {
        goto LABEL_36;
      }
      uint64_t v80 = 0;
      uint64_t v21 = v82;
      do
        [(AKTSDBrushStroke *)self brushSection:@"middle", 0, v88, location, length, v16, var0 + (v64 + (double)v80++ * v69) * var1, var1 * v69, a8 sectionIndex ontoPath withScaling inElementRange into viewScale];
      while (v68 != v80);
    }
    else
    {
      if (v83 <= 0.0)
      {
        [(AKTSDBrushStroke *)self brushSection:@"middle", 0, v88, location, length, v16, var0, var1, a8 sectionIndex ontoPath withScaling inElementRange into viewScale];
        v45 = 0;
        goto LABEL_39;
      }
      objc_msgSend(v88, "length", v83);
      double v75 = var1 * v74 / (v18 * v83);
      uint64_t v76 = (uint64_t)v75;
      if ((uint64_t)v75 >= 1)
      {
        id v77 = v16;
        uint64_t v78 = 0;
        double v79 = 1.0 / (double)(uint64_t)v75;
        do
          [(AKTSDBrushStroke *)self brushSection:@"middle", 0, v88, location, v87, v77, var0 + v79 * (double)v78++ * var1, var1 * v79, a8 sectionIndex ontoPath withScaling inElementRange into viewScale];
        while (v76 != v78);
        v45 = 0;
        id v16 = v77;
        goto LABEL_39;
      }
    }
    v45 = 0;
LABEL_39:
  }
}

- (void)brushPath:(id)a3 inContext:(CGContext *)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(AKTSDBrushStroke *)self strokeName];
  +[AKTSDBrushStroke loadBrush:v7];

  [(AKTSDBrushStroke *)self width];
  objc_msgSend(v6, "setLineWidth:");
  [(AKTSDBrushStroke *)self miterLimit];
  objc_msgSend(v6, "setMiterLimit:");
  memset(&v55, 0, sizeof(v55));
  CGContextGetCTM(&v55, a4);
  double a = v55.a;
  double b = v55.b;
  uint64_t v10 = +[AKTSDBezierPath bezierPath];
  [v6 lineWidth];
  objc_msgSend(v10, "setLineWidth:");
  [v10 setWindingRule:0];
  uint64_t v54 = 0;
  [v6 length];
  double v12 = v11;
  uint64_t v50 = 0;
  double v51 = &v50;
  uint64_t v52 = 0x2020000000;
  char v53 = 0;
  id v13 = sub_237674CB4();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2376779B0;
  block[3] = &unk_264CDB650;
  void block[4] = self;
  block[5] = &v50;
  dispatch_sync(v13, block);

  double v15 = *MEMORY[0x263F00148];
  double v14 = *(double *)(MEMORY[0x263F00148] + 8);
  long long v48 = *MEMORY[0x263F00148];
  uint64_t v16 = [v6 elementCount];
  double v46 = sqrt(b * b + a * a);
  if (v16 >= 1)
  {
    unint64_t v17 = 0;
    unint64_t v18 = 0;
    double v19 = 0.0;
    double v45 = v12;
    double v20 = 0.0;
    double v21 = v15;
    while (1)
    {
      double v22 = v20;
      uint64_t v23 = [v6 elementAtIndex:v18 associatedPoints:&v57];
      [v6 lengthOfElement:v18];
      double v20 = v20 + v24 / v12;
      switch(v23)
      {
        case 3:
          long long v57 = v48;
          break;
        case 2:
          if (*((unsigned char *)v51 + 24))
          {
            double v47 = v21;
            long long v31 = v56;
            double v32 = sub_237684610(*(double *)&v57, *((double *)&v57 + 1), *(double *)&v56);
            double v34 = v33;
            double v35 = sub_237684628(v32, v33);
            if (v35 >= 1.0)
            {
              double v38 = sub_23768461C(v32, v34, 1.0 / v35);
            }
            else
            {
              double v36 = sub_237684610(v58, v59, *(double *)&v31);
              double v38 = sub_23768465C(v36, v37);
            }
            double v12 = v45;
            if (v18 < 2
              || (sub_23768467C(v47, v14, v38, v39) < 0.99 ? (BOOL v40 = (uint64_t)(~v17 + v18) < 1) : (BOOL v40 = 1),
                  v40 || v22 - v19 <= 0.0))
            {
              double v22 = v19;
            }
            else
            {
              -[AKTSDBrushStroke brushPath:withScaling:inElementRange:into:sectionIndex:viewScale:](self, "brushPath:withScaling:inElementRange:into:sectionIndex:viewScale:", v6, v17, v18 - v17, v10, &v54, v19, v22 - v19, v46);
              unint64_t v17 = v18 - 1;
            }
            double v41 = sub_237684610(*(double *)&v60, *((double *)&v60 + 1), v58);
            double v21 = sub_23768465C(v41, v42);
            double v14 = v43;
            double v19 = v22;
          }
          long long v56 = v60;
          goto LABEL_34;
        case 0:
          if ((uint64_t)(v18 - v17) >= 1)
          {
            -[AKTSDBrushStroke brushPath:withScaling:inElementRange:into:sectionIndex:viewScale:](self, "brushPath:withScaling:inElementRange:into:sectionIndex:viewScale:", v6, v17, v19, v20 - v19, v46);
            double v19 = v20;
            unint64_t v17 = v18;
          }
          long long v56 = v57;
          long long v48 = v57;
          goto LABEL_34;
      }
      if (!*((unsigned char *)v51 + 24)) {
        break;
      }
      double v25 = sub_237684610(*(double *)&v57, *((double *)&v57 + 1), *(double *)&v56);
      double v28 = sub_23768465C(v25, v26);
      double v29 = v27;
      if (v18 < 2) {
        goto LABEL_22;
      }
      BOOL v30 = sub_23768467C(v21, v14, v28, v27) >= 0.99 || (uint64_t)(~v17 + v18) < 1;
      if (v30 || v22 - v19 <= 0.0) {
        goto LABEL_22;
      }
      -[AKTSDBrushStroke brushPath:withScaling:inElementRange:into:sectionIndex:viewScale:](self, "brushPath:withScaling:inElementRange:into:sectionIndex:viewScale:", v6, v17, v18 - v17, v10, &v54, v19, v22 - v19, v46);
      unint64_t v17 = v18 - 1;
LABEL_23:
      long long v56 = v57;
      double v21 = v28;
      double v14 = v29;
      double v19 = v22;
LABEL_34:
      if (v16 == ++v18) {
        goto LABEL_39;
      }
    }
    double v28 = v21;
    double v29 = v14;
LABEL_22:
    double v22 = v19;
    goto LABEL_23;
  }
  uint64_t v16 = 0;
  unint64_t v17 = 0;
  double v20 = 0.0;
  double v19 = 0.0;
LABEL_39:
  if ((uint64_t)(v16 + ~v17) >= 1) {
    -[AKTSDBrushStroke brushPath:withScaling:inElementRange:into:sectionIndex:viewScale:](self, "brushPath:withScaling:inElementRange:into:sectionIndex:viewScale:", v6, v17, v19, v20 - v19, v46);
  }
  CGContextAddPath(a4, (CGPathRef)[v10 CGPath]);
  id v44 = [(AKTSDBrushStroke *)self color];
  CGContextSetFillColorWithColor(a4, (CGColorRef)[v44 CGColor]);

  CGContextFillPath(a4);
  _Block_object_dispose(&v50, 8);
}

- (NSString)strokeName
{
  return self->_strokeName;
}

- (UIColor)color
{
  return self->_color;
}

- (double)width
{
  return self->_width;
}

- (int)join
{
  return self->_join;
}

- (double)miterLimit
{
  return self->_miterLimit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);

  objc_storeStrong((id *)&self->_strokeName, 0);
}

@end