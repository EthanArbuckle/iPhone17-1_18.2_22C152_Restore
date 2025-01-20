@interface ASCContentSkeleton
+ (id)absoluteSkeleton:(double)a3;
+ (id)fractionalSkeleton:(double)a3;
- (ASCContentSkeleton)initWithType:(int64_t)a3 rawValue:(double)a4;
- (BOOL)isEqual:(id)a3;
- (CGRect)skeletonRectForBounds:(CGRect)a3 forLineNumber:(unint64_t)a4 usingSkeletonContext:(id)a5;
- (double)rawValue;
- (double)skeletonHeightFromContext:(id)a3;
- (double)widthThatFits:(CGSize)a3;
- (id)description;
- (int64_t)effectiveSkeletonAlignmentFromContext:(id)a3;
- (int64_t)type;
- (unint64_t)hash;
- (void)drawSkeletonInRect:(CGRect)a3 usingSkeletonContext:(id)a4;
@end

@implementation ASCContentSkeleton

- (double)skeletonHeightFromContext:(id)a3
{
  id v3 = a3;
  v4 = [v3 font];
  [v4 lineHeight];
  double v6 = v5;
  uint64_t v7 = [v3 skeletonNumberOfLines];

  if (v7 <= 1) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v7;
  }
  double v9 = v6 * (double)v8;

  return v9;
}

- (int64_t)effectiveSkeletonAlignmentFromContext:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 textAlignment];
  if (v4 == 4)
  {
    int64_t v5 = 2 * ([v3 effectiveUserInterfaceLayoutDirection] != 0);
  }
  else if (v4 == 2)
  {
    int64_t v5 = 2;
  }
  else
  {
    int64_t v5 = v4 == 1;
  }

  return v5;
}

- (CGRect)skeletonRectForBounds:(CGRect)a3 forLineNumber:(unint64_t)a4 usingSkeletonContext:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v11 = a5;
  double MinX = *MEMORY[0x1E4F1DB28];
  CGFloat v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  -[ASCContentSkeleton widthThatFits:](self, "widthThatFits:", width, height);
  CGFloat v15 = v14;
  v16 = [v11 font];
  [v16 capHeight];
  double v18 = ceil(v17);

  int64_t v19 = [(ASCContentSkeleton *)self effectiveSkeletonAlignmentFromContext:v11];
  switch(v19)
  {
    case 2:
      v38.origin.CGFloat x = x;
      v38.origin.CGFloat y = y;
      v38.size.double width = width;
      v38.size.double height = height;
      double MaxX = CGRectGetMaxX(v38);
      v39.origin.CGFloat x = MinX;
      v39.origin.CGFloat y = v12;
      v39.size.double width = v15;
      v39.size.double height = v18;
      double MinX = MaxX - CGRectGetWidth(v39);
      break;
    case 1:
      v40.origin.CGFloat x = x;
      v40.origin.CGFloat y = y;
      v40.size.double width = width;
      v40.size.double height = height;
      double MidX = CGRectGetMidX(v40);
      v41.origin.CGFloat x = MinX;
      v41.origin.CGFloat y = v12;
      v41.size.double width = v15;
      v41.size.double height = v18;
      double MinX = floor(MidX + CGRectGetWidth(v41) * -0.5);
      break;
    case 0:
      v37.origin.CGFloat x = x;
      v37.origin.CGFloat y = y;
      v37.size.double width = width;
      v37.size.double height = height;
      double MinX = CGRectGetMinX(v37);
      break;
  }
  v42.origin.CGFloat x = x;
  v42.origin.CGFloat y = y;
  v42.size.double width = width;
  v42.size.double height = height;
  double MinY = CGRectGetMinY(v42);
  double v21 = (double)a4;
  v22 = [v11 font];
  [v22 lineHeight];
  double v24 = floor(MinY + v21 * v23);

  v25 = [v11 font];
  [v25 ascender];
  double v27 = v26;
  v28 = [v11 font];
  [v28 capHeight];
  double v30 = ceil(v27 - v29);

  double v31 = MinX;
  double v32 = v24 + v30;
  double v33 = v15;
  double v34 = v18;
  result.size.double height = v34;
  result.size.double width = v33;
  result.origin.CGFloat y = v32;
  result.origin.CGFloat x = v31;
  return result;
}

- (void)drawSkeletonInRect:(CGRect)a3 usingSkeletonContext:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v21 = a4;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  uint64_t v9 = [v21 skeletonNumberOfLines];
  uint64_t v10 = 0;
  if (v9 <= 1) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = v9;
  }
  do
  {
    -[ASCContentSkeleton skeletonRectForBounds:forLineNumber:usingSkeletonContext:](self, "skeletonRectForBounds:forLineNumber:usingSkeletonContext:", v10, v21, x, y, width, height, *(void *)&height);
    double v12 = v23.origin.x;
    double v13 = v23.origin.y;
    double v14 = v23.size.width;
    double v15 = v23.size.height;
    double v16 = CGRectGetWidth(v23);
    v24.origin.double x = v12;
    v24.origin.double y = v13;
    v24.size.double width = v14;
    v24.size.double height = v15;
    double v17 = CGRectGetHeight(v24);
    if (v16 < v17) {
      double v17 = v16;
    }
    double v18 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", v12, v13, v14, v15, v17 * 0.5);
    int64_t v19 = [v21 skeletonColor];
    [v19 set];

    [v18 fill];
    ++v10;
  }
  while (v11 != v10);
  CGContextRestoreGState(CurrentContext);
}

+ (id)absoluteSkeleton:(double)a3
{
  id v3 = (void *)[objc_alloc((Class)a1) initWithType:0 rawValue:a3];

  return v3;
}

+ (id)fractionalSkeleton:(double)a3
{
  id v3 = (void *)[objc_alloc((Class)a1) initWithType:1 rawValue:a3];

  return v3;
}

- (ASCContentSkeleton)initWithType:(int64_t)a3 rawValue:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ASCContentSkeleton;
  CGRect result = [(ASCContentSkeleton *)&v7 init];
  if (result)
  {
    result->_type = a3;
    result->_rawValue = a4;
  }
  return result;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(ASCHasher);
  [(ASCHasher *)v3 combineInteger:[(ASCContentSkeleton *)self type]];
  [(ASCContentSkeleton *)self rawValue];
  -[ASCHasher combineDouble:](v3, "combineDouble:");
  unint64_t v4 = [(ASCHasher *)v3 finalizeHash];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      double v6 = v5;
    }
    else {
      double v6 = 0;
    }
  }
  else
  {
    double v6 = 0;
  }
  id v7 = v6;

  if (v7 && (int64_t v8 = -[ASCContentSkeleton type](self, "type"), v8 == [v7 type]))
  {
    [(ASCContentSkeleton *)self rawValue];
    double v10 = v9;
    [v7 rawValue];
    BOOL v12 = v10 == v11;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)description
{
  id v3 = [[ASCDescriber alloc] initWithObject:self];
  int64_t v4 = [(ASCContentSkeleton *)self type];
  if (v4)
  {
    if (v4 != 1) {
      goto LABEL_6;
    }
    id v5 = @"fractional";
  }
  else
  {
    id v5 = @"absolute";
  }
  [(ASCContentSkeleton *)self rawValue];
  -[ASCDescriber addDouble:withName:](v3, "addDouble:withName:", v5);
LABEL_6:
  double v6 = [(ASCDescriber *)v3 finalizeDescription];

  return v6;
}

- (double)widthThatFits:(CGSize)a3
{
  double width = a3.width;
  int64_t v5 = [(ASCContentSkeleton *)self type];
  if (v5 == 1)
  {
    [(ASCContentSkeleton *)self rawValue];
    return ceil(width * v7);
  }
  else if (!v5)
  {
    [(ASCContentSkeleton *)self rawValue];
    if (width < result) {
      return width;
    }
  }
  return result;
}

- (int64_t)type
{
  return self->_type;
}

- (double)rawValue
{
  return self->_rawValue;
}

@end