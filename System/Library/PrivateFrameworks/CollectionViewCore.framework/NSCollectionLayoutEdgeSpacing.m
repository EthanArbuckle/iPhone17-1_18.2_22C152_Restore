@interface NSCollectionLayoutEdgeSpacing
+ (NSCollectionLayoutEdgeSpacing)spacingForLeading:(NSCollectionLayoutSpacing *)leading top:(NSCollectionLayoutSpacing *)top trailing:(NSCollectionLayoutSpacing *)trailing bottom:(NSCollectionLayoutSpacing *)bottom;
+ (id)defaultSpacing;
+ (id)fixedSpacing:(double)a3;
+ (id)flexibleSpacing:(double)a3;
- (BOOL)_hasSpacing;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSpacingFixedForEdge:(unint64_t)a3;
- (BOOL)isSpacingFlexibleForEdge:(unint64_t)a3;
- (CVCDirectionalEdgeInsets)edgeOutsets;
- (NSCollectionLayoutEdgeSpacing)initWithLeading:(id)a3 top:(id)a4 trailing:(id)a5 bottom:(id)a6;
- (NSCollectionLayoutSpacing)bottom;
- (NSCollectionLayoutSpacing)leading;
- (NSCollectionLayoutSpacing)top;
- (NSCollectionLayoutSpacing)trailing;
- (double)spacingForEdge:(unint64_t)a3;
- (id)_externalDescription;
- (id)_spacingForEdge:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation NSCollectionLayoutEdgeSpacing

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottom, 0);
  objc_storeStrong((id *)&self->_trailing, 0);
  objc_storeStrong((id *)&self->_top, 0);
  objc_storeStrong((id *)&self->_leading, 0);
}

+ (id)defaultSpacing
{
  v3 = +[NSCollectionLayoutSpacing fixedSpacing:0.0];
  v4 = (void *)[objc_alloc((Class)a1) initWithLeading:v3 top:v3 trailing:v3 bottom:v3];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  leading = self->_leading;
  top = self->_top;
  trailing = self->_trailing;
  bottom = self->_bottom;
  return (id)[v4 initWithLeading:leading top:top trailing:trailing bottom:bottom];
}

- (NSCollectionLayoutEdgeSpacing)initWithLeading:(id)a3 top:(id)a4 trailing:(id)a5 bottom:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)NSCollectionLayoutEdgeSpacing;
  v15 = [(NSCollectionLayoutEdgeSpacing *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_leading, a3);
    objc_storeStrong((id *)&v16->_top, a4);
    objc_storeStrong((id *)&v16->_trailing, a5);
    objc_storeStrong((id *)&v16->_bottom, a6);
  }

  return v16;
}

- (CVCDirectionalEdgeInsets)edgeOutsets
{
  [(NSCollectionLayoutSpacing *)self->_top spacing];
  double v4 = v3;
  [(NSCollectionLayoutSpacing *)self->_leading spacing];
  double v6 = v5;
  [(NSCollectionLayoutSpacing *)self->_bottom spacing];
  double v8 = v7;
  [(NSCollectionLayoutSpacing *)self->_trailing spacing];
  double v10 = v9;
  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  result.trailing = v10;
  result.bottom = v13;
  result.leading = v12;
  result.top = v11;
  return result;
}

- (BOOL)isSpacingFlexibleForEdge:(unint64_t)a3
{
  double v3 = [(NSCollectionLayoutEdgeSpacing *)self _spacingForEdge:a3];
  char v4 = [v3 isFlexibleSpacing];

  return v4;
}

- (double)spacingForEdge:(unint64_t)a3
{
  double v3 = [(NSCollectionLayoutEdgeSpacing *)self _spacingForEdge:a3];
  [v3 spacing];
  double v5 = v4;

  return v5;
}

- (id)_spacingForEdge:(unint64_t)a3
{
  unint64_t v4 = a3 - 1;
  if (a3 - 1 <= 7 && ((0x8Bu >> v4) & 1) != 0)
  {
    id v5 = *(id *)((char *)&self->super.isa + qword_20BE34628[v4]);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (NSCollectionLayoutEdgeSpacing *)a3;
  if (self == v4)
  {
    char v16 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_7;
    }
    id v5 = [(NSCollectionLayoutEdgeSpacing *)self leading];
    double v6 = [(NSCollectionLayoutEdgeSpacing *)v4 leading];
    int v7 = __objectEqual(v5, v6);

    if (!v7) {
      goto LABEL_7;
    }
    double v8 = [(NSCollectionLayoutEdgeSpacing *)self top];
    double v9 = [(NSCollectionLayoutEdgeSpacing *)v4 top];
    int v10 = __objectEqual(v8, v9);

    if (!v10) {
      goto LABEL_7;
    }
    double v11 = [(NSCollectionLayoutEdgeSpacing *)self bottom];
    double v12 = [(NSCollectionLayoutEdgeSpacing *)v4 bottom];
    int v13 = __objectEqual(v11, v12);

    if (v13)
    {
      id v14 = [(NSCollectionLayoutEdgeSpacing *)self trailing];
      v15 = [(NSCollectionLayoutEdgeSpacing *)v4 trailing];
      char v16 = __objectEqual(v14, v15);
    }
    else
    {
LABEL_7:
      char v16 = 0;
    }
  }

  return v16;
}

- (NSCollectionLayoutSpacing)trailing
{
  return self->_trailing;
}

- (NSCollectionLayoutSpacing)top
{
  return self->_top;
}

- (NSCollectionLayoutSpacing)leading
{
  return self->_leading;
}

- (NSCollectionLayoutSpacing)bottom
{
  return self->_bottom;
}

- (BOOL)_hasSpacing
{
  if ([(NSCollectionLayoutSpacing *)self->_leading _hasSpacing]
    || [(NSCollectionLayoutSpacing *)self->_trailing _hasSpacing]
    || [(NSCollectionLayoutSpacing *)self->_top _hasSpacing])
  {
    return 1;
  }
  bottom = self->_bottom;
  return [(NSCollectionLayoutSpacing *)bottom _hasSpacing];
}

+ (NSCollectionLayoutEdgeSpacing)spacingForLeading:(NSCollectionLayoutSpacing *)leading top:(NSCollectionLayoutSpacing *)top trailing:(NSCollectionLayoutSpacing *)trailing bottom:(NSCollectionLayoutSpacing *)bottom
{
  int v10 = bottom;
  double v11 = trailing;
  double v12 = top;
  int v13 = leading;
  id v14 = (void *)[objc_alloc((Class)a1) initWithLeading:v13 top:v12 trailing:v11 bottom:v10];

  return (NSCollectionLayoutEdgeSpacing *)v14;
}

- (id)description
{
  [(NSCollectionLayoutEdgeSpacing *)self edgeOutsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v9 = NSString;
  long long v18 = *(_OWORD *)&self->_leading;
  trailing = self->_trailing;
  bottom = self->_bottom;
  double v12 = objc_msgSend(NSNumber, "numberWithDouble:");
  int v13 = [NSNumber numberWithDouble:v8];
  id v14 = [NSNumber numberWithDouble:v6];
  v15 = [NSNumber numberWithDouble:v4];
  objc_msgSend(v9, "stringWithFormat:", @"<leading=%@; top=%@; trailing=%@; bottom=%@; outsets=@{%@,%@,%@,%@}>",
    v18,
    trailing,
    bottom,
    v12,
    v13,
    v14,
  char v16 = v15);

  return v16;
}

- (id)_externalDescription
{
  if ([(NSCollectionLayoutSpacing *)self->_leading isFixedSpacing]
    && ([(NSCollectionLayoutSpacing *)self->_leading spacing], v3 == 0.0)
    && [(NSCollectionLayoutSpacing *)self->_top isFixedSpacing]
    && ([(NSCollectionLayoutSpacing *)self->_top spacing], v4 == 0.0)
    && [(NSCollectionLayoutSpacing *)self->_trailing isFixedSpacing]
    && ([(NSCollectionLayoutSpacing *)self->_trailing spacing], v5 == 0.0)
    && [(NSCollectionLayoutSpacing *)self->_bottom isFixedSpacing]
    && ([(NSCollectionLayoutSpacing *)self->_bottom spacing], v6 == 0.0))
  {
    double v7 = @"0";
  }
  else
  {
    double v8 = NSString;
    double v9 = [(NSCollectionLayoutSpacing *)self->_leading _externalDescription];
    int v10 = [(NSCollectionLayoutSpacing *)self->_top _externalDescription];
    double v11 = [(NSCollectionLayoutSpacing *)self->_trailing _externalDescription];
    double v12 = [(NSCollectionLayoutSpacing *)self->_bottom _externalDescription];
    [v8 stringWithFormat:@"<leading=%@; top=%@; trailing=%@; bottom=%@>", v9, v10, v11, v12];
    double v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

+ (id)flexibleSpacing:(double)a3
{
  double v4 = +[NSCollectionLayoutSpacing flexibleSpacing:a3];
  double v5 = (void *)[objc_alloc((Class)a1) initWithLeading:v4 top:v4 trailing:v4 bottom:v4];

  return v5;
}

+ (id)fixedSpacing:(double)a3
{
  double v4 = +[NSCollectionLayoutSpacing fixedSpacing:a3];
  double v5 = (void *)[objc_alloc((Class)a1) initWithLeading:v4 top:v4 trailing:v4 bottom:v4];

  return v5;
}

- (BOOL)isSpacingFixedForEdge:(unint64_t)a3
{
  double v3 = [(NSCollectionLayoutEdgeSpacing *)self _spacingForEdge:a3];
  char v4 = [v3 isFixedSpacing];

  return v4;
}

@end