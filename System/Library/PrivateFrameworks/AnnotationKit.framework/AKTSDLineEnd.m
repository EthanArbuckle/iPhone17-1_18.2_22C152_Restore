@interface AKTSDLineEnd
+ (AKTSDLineEnd)lineEndWithIdentifier:(id)a3;
+ (AKTSDLineEnd)lineEndWithPath:(CGPath *)a3 endPoint:(CGPoint)a4 isFilled:(BOOL)a5 identifier:(id)a6;
+ (AKTSDLineEnd)lineEndWithPath:(CGPath *)a3 wrapPath:(CGPath *)a4 endPoint:(CGPoint)a5 isFilled:(BOOL)a6 identifier:(id)a7;
+ (AKTSDLineEnd)lineEndWithType:(int)a3;
+ (id)filledArrow;
+ (id)filledCircle;
+ (id)filledDiamond;
+ (id)filledSquare;
+ (id)invertedArrow;
+ (id)line;
+ (id)none;
+ (id)openArrow;
+ (id)openCircle;
+ (id)openSquare;
+ (id)simpleArrow;
- (AKTSDLineEnd)initWithPath:(CGPath *)a3 endPoint:(CGPoint)a4 isFilled:(BOOL)a5 identifier:(id)a6;
- (AKTSDLineEnd)initWithPath:(CGPath *)a3 wrapPath:(CGPath *)a4 endPoint:(CGPoint)a5 isFilled:(BOOL)a6 identifier:(id)a7 lineJoin:(int)a8;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFilled;
- (BOOL)isNone;
- (CGPath)path;
- (CGPath)wrapPath;
- (CGPoint)endPoint;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)lineJoin;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation AKTSDLineEnd

+ (id)simpleArrow
{
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 6.0);
  CGPathAddLineToPoint(Mutable, 0, 6.0, 0.0);
  CGPathCloseSubpath(Mutable);
  v3 = +[AKTSDLineEnd lineEndWithPath:Mutable, 1, @"simple arrow", 3.0, 0.0 endPoint isFilled identifier];
  CGPathRelease(Mutable);

  return v3;
}

+ (id)filledCircle
{
  v11.origin.CGFloat x = 0.0;
  v11.origin.CGFloat y = 0.0;
  v11.size.CGFloat width = 6.0;
  v11.size.CGFloat height = 6.0;
  CGRect v12 = CGRectInset(v11, 0.5, 0.5);
  CGFloat x = v12.origin.x;
  CGFloat y = v12.origin.y;
  CGFloat width = v12.size.width;
  CGFloat height = v12.size.height;
  Mutable = CGPathCreateMutable();
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  CGPathAddEllipseInRect(Mutable, 0, v13);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v14);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  v8 = +[AKTSDLineEnd lineEndWithPath:Mutable, 1, @"filled circle", MidX, CGRectGetMinY(v15) endPoint isFilled identifier];
  CGPathRelease(Mutable);

  return v8;
}

+ (id)filledDiamond
{
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 3.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 0.0, 3.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 6.0);
  CGPathAddLineToPoint(Mutable, 0, 6.0, 3.0);
  CGPathCloseSubpath(Mutable);
  v3 = +[AKTSDLineEnd lineEndWithPath:Mutable, 1, @"filled diamond", 3.0, 0.331400007 endPoint isFilled identifier];
  CGPathRelease(Mutable);

  return v3;
}

+ (id)openArrow
{
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 5.0);
  CGPathAddLineToPoint(Mutable, 0, 6.0, 0.0);
  CGPathMoveToPoint(Mutable, 0, 3.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 5.0);
  v3 = [[AKTSDLineEnd alloc] initWithPath:Mutable, 0, 0, @"open arrow", 1, 3.0, 0.0 wrapPath endPoint isFilled identifier lineJoin];
  CGPathRelease(Mutable);

  return v3;
}

+ (id)filledArrow
{
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 6.0);
  CGPathAddLineToPoint(Mutable, 0, 6.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 1.5);
  CGPathCloseSubpath(Mutable);
  v3 = +[AKTSDLineEnd lineEndWithPath:Mutable, 1, @"filled arrow", 3.0, 1.5 endPoint isFilled identifier];
  CGPathRelease(Mutable);

  return v3;
}

+ (id)filledSquare
{
  v11.origin.CGFloat x = 0.0;
  v11.origin.CGFloat y = 0.0;
  v11.size.CGFloat width = 6.0;
  v11.size.CGFloat height = 6.0;
  CGRect v12 = CGRectInset(v11, 0.5, 0.5);
  CGFloat x = v12.origin.x;
  CGFloat y = v12.origin.y;
  CGFloat width = v12.size.width;
  CGFloat height = v12.size.height;
  Mutable = CGPathCreateMutable();
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  CGPathAddRect(Mutable, 0, v13);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v14);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  v8 = +[AKTSDLineEnd lineEndWithPath:Mutable, 1, @"filled square", MidX, CGRectGetMinY(v15) endPoint isFilled identifier];
  CGPathRelease(Mutable);

  return v8;
}

+ (id)openSquare
{
  v11.origin.CGFloat x = 0.0;
  v11.origin.CGFloat y = 0.0;
  v11.size.CGFloat width = 6.0;
  v11.size.CGFloat height = 6.0;
  CGRect v12 = CGRectInset(v11, 1.0, 1.0);
  CGFloat x = v12.origin.x;
  CGFloat y = v12.origin.y;
  CGFloat width = v12.size.width;
  CGFloat height = v12.size.height;
  Mutable = CGPathCreateMutable();
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  CGPathAddRect(Mutable, 0, v13);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v14);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  v8 = +[AKTSDLineEnd lineEndWithPath:Mutable, 0, @"open square", MidX, CGRectGetMinY(v15) + -0.800000012 endPoint isFilled identifier];
  CGPathRelease(Mutable);

  return v8;
}

+ (id)openCircle
{
  v11.origin.CGFloat x = 0.0;
  v11.origin.CGFloat y = 0.0;
  v11.size.CGFloat width = 6.0;
  v11.size.CGFloat height = 6.0;
  CGRect v12 = CGRectInset(v11, 0.5, 0.5);
  CGFloat x = v12.origin.x;
  CGFloat y = v12.origin.y;
  CGFloat width = v12.size.width;
  CGFloat height = v12.size.height;
  Mutable = CGPathCreateMutable();
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  CGPathAddEllipseInRect(Mutable, 0, v13);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v14);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  v8 = +[AKTSDLineEnd lineEndWithPath:Mutable, 0, @"open circle", MidX, CGRectGetMinY(v15) + -0.800000012 endPoint isFilled identifier];
  CGPathRelease(Mutable);

  return v8;
}

+ (id)invertedArrow
{
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, 3.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 6.0, 3.0);
  CGPathCloseSubpath(Mutable);
  v3 = +[AKTSDLineEnd lineEndWithPath:Mutable, 1, @"inverted arrow", 3.0, 0.331400007 endPoint isFilled identifier];
  CGPathRelease(Mutable);

  return v3;
}

+ (id)line
{
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 6.0, 0.0);
  v3 = +[AKTSDLineEnd lineEndWithPath:Mutable, 0, @"line", 3.0, -0.800000012 endPoint isFilled identifier];
  CGPathRelease(Mutable);

  return v3;
}

+ (id)none
{
  return +[AKTSDLineEnd lineEndWithPath:0, 0, @"none", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8) endPoint isFilled identifier];
}

+ (AKTSDLineEnd)lineEndWithType:(int)a3
{
  switch(a3)
  {
    case 0:
      v5 = +[AKTSDLineEnd simpleArrow];
      goto LABEL_16;
    case 1:
      v5 = +[AKTSDLineEnd filledCircle];
      goto LABEL_16;
    case 2:
      v5 = +[AKTSDLineEnd filledDiamond];
      goto LABEL_16;
    case 3:
      v5 = +[AKTSDLineEnd openArrow];
      goto LABEL_16;
    case 4:
      v5 = +[AKTSDLineEnd filledArrow];
      goto LABEL_16;
    case 5:
      v5 = +[AKTSDLineEnd filledSquare];
      goto LABEL_16;
    case 6:
      v5 = +[AKTSDLineEnd openSquare];
      goto LABEL_16;
    case 7:
      v5 = +[AKTSDLineEnd openCircle];
      goto LABEL_16;
    case 8:
      v5 = +[AKTSDLineEnd invertedArrow];
      goto LABEL_16;
    case 9:
      v5 = +[AKTSDLineEnd line];
      goto LABEL_16;
    case 10:
      v5 = +[AKTSDLineEnd none];
LABEL_16:
      break;
    default:
      v5 = 0;
      break;
  }
  return (AKTSDLineEnd *)v5;
}

+ (AKTSDLineEnd)lineEndWithIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"simple arrow"])
  {
    uint64_t v4 = +[AKTSDLineEnd simpleArrow];
LABEL_23:
    v5 = (void *)v4;
    goto LABEL_24;
  }
  if ([v3 isEqualToString:@"filled circle"])
  {
    uint64_t v4 = +[AKTSDLineEnd filledCircle];
    goto LABEL_23;
  }
  if ([v3 isEqualToString:@"filled diamond"])
  {
    uint64_t v4 = +[AKTSDLineEnd filledDiamond];
    goto LABEL_23;
  }
  if ([v3 isEqualToString:@"open arrow"])
  {
    uint64_t v4 = +[AKTSDLineEnd openArrow];
    goto LABEL_23;
  }
  if ([v3 isEqualToString:@"filled arrow"])
  {
    uint64_t v4 = +[AKTSDLineEnd filledArrow];
    goto LABEL_23;
  }
  if ([v3 isEqualToString:@"filled square"])
  {
    uint64_t v4 = +[AKTSDLineEnd filledSquare];
    goto LABEL_23;
  }
  if ([v3 isEqualToString:@"open square"])
  {
    uint64_t v4 = +[AKTSDLineEnd openSquare];
    goto LABEL_23;
  }
  if ([v3 isEqualToString:@"open circle"])
  {
    uint64_t v4 = +[AKTSDLineEnd openCircle];
    goto LABEL_23;
  }
  if ([v3 isEqualToString:@"inverted arrow"])
  {
    uint64_t v4 = +[AKTSDLineEnd invertedArrow];
    goto LABEL_23;
  }
  if ([v3 isEqualToString:@"line"])
  {
    uint64_t v4 = +[AKTSDLineEnd line];
    goto LABEL_23;
  }
  if ([v3 isEqualToString:@"none"])
  {
    uint64_t v4 = +[AKTSDLineEnd none];
    goto LABEL_23;
  }
  v5 = 0;
LABEL_24:

  return (AKTSDLineEnd *)v5;
}

+ (AKTSDLineEnd)lineEndWithPath:(CGPath *)a3 endPoint:(CGPoint)a4 isFilled:(BOOL)a5 identifier:(id)a6
{
  BOOL v6 = a5;
  double y = a4.y;
  double x = a4.x;
  id v10 = a6;
  CGRect v11 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPath:endPoint:isFilled:identifier:", a3, v6, v10, x, y);

  return (AKTSDLineEnd *)v11;
}

+ (AKTSDLineEnd)lineEndWithPath:(CGPath *)a3 wrapPath:(CGPath *)a4 endPoint:(CGPoint)a5 isFilled:(BOOL)a6 identifier:(id)a7
{
  BOOL v7 = a6;
  double y = a5.y;
  double x = a5.x;
  id v12 = a7;
  CGRect v13 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPath:wrapPath:endPoint:isFilled:identifier:lineJoin:", a3, a4, v7, v12, 0, x, y);

  return (AKTSDLineEnd *)v13;
}

- (AKTSDLineEnd)initWithPath:(CGPath *)a3 wrapPath:(CGPath *)a4 endPoint:(CGPoint)a5 isFilled:(BOOL)a6 identifier:(id)a7 lineJoin:(int)a8
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  id v15 = a7;
  v20.receiver = self;
  v20.super_class = (Class)AKTSDLineEnd;
  v16 = [(AKTSDLineEnd *)&v20 init];
  if (v16)
  {
    uint64_t v17 = [v15 copy];
    mIdentifier = v16->mIdentifier;
    v16->mIdentifier = (NSString *)v17;

    v16->mLineJoin = a8;
    v16->mPath = CGPathCreateMutableCopy(a3);
    v16->mWrapPath = CGPathCreateMutableCopy(a4);
    v16->mEndPoint.CGFloat x = x;
    v16->mEndPoint.CGFloat y = y;
    v16->mIsFilled = a6;
  }

  return v16;
}

- (AKTSDLineEnd)initWithPath:(CGPath *)a3 endPoint:(CGPoint)a4 isFilled:(BOOL)a5 identifier:(id)a6
{
  return -[AKTSDLineEnd initWithPath:wrapPath:endPoint:isFilled:identifier:lineJoin:](self, "initWithPath:wrapPath:endPoint:isFilled:identifier:lineJoin:", a3, 0, a5, a6, 0, a4.x, a4.y);
}

- (void)dealloc
{
  CGPathRelease(self->mPath);
  CGPathRelease(self->mWrapPath);
  v3.receiver = self;
  v3.super_class = (Class)AKTSDLineEnd;
  [(AKTSDLineEnd *)&v3 dealloc];
}

- (unint64_t)hash
{
  return [(NSString *)self->mIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (AKTSDLineEnd *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else if ([(AKTSDLineEnd *)v4 isMemberOfClass:objc_opt_class()])
  {
    mIdentifier = self->mIdentifier;
    BOOL v6 = v4;
    BOOL v7 = [(AKTSDLineEnd *)v6 identifier];
    char v8 = [(NSString *)mIdentifier isEqualToString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  mPath = self->mPath;
  mWrapPath = self->mWrapPath;
  BOOL mIsFilled = self->mIsFilled;
  mIdentifier = self->mIdentifier;
  uint64_t mLineJoin = self->mLineJoin;
  double x = self->mEndPoint.x;
  double y = self->mEndPoint.y;

  return (id)objc_msgSend(v4, "initWithPath:wrapPath:endPoint:isFilled:identifier:lineJoin:", mPath, mWrapPath, mIsFilled, mIdentifier, mLineJoin, x, y);
}

- (CGPath)wrapPath
{
  result = self->mWrapPath;
  if (!result) {
    return self->mPath;
  }
  return result;
}

- (BOOL)isNone
{
  v2 = [(AKTSDLineEnd *)self identifier];
  char v3 = [v2 isEqualToString:@"none"];

  return v3;
}

- (id)description
{
  char v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  BOOL v6 = [(AKTSDLineEnd *)self identifier];
  BOOL v7 = [v3 stringWithFormat:@"<%@ %p %@>", v5, self, v6];

  return v7;
}

- (NSString)identifier
{
  return self->mIdentifier;
}

- (CGPath)path
{
  return self->mPath;
}

- (CGPoint)endPoint
{
  double x = self->mEndPoint.x;
  double y = self->mEndPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)isFilled
{
  return self->mIsFilled;
}

- (int)lineJoin
{
  return self->mLineJoin;
}

- (void).cxx_destruct
{
}

@end