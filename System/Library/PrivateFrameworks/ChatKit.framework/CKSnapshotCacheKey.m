@interface CKSnapshotCacheKey
+ (id)keyWithIdentifier:(id)a3 interfaceStyle:(int64_t)a4 bounds:(CGRect)a5;
- (BOOL)isEqual:(id)a3;
- (CGRect)bounds;
- (CKSnapshotCacheKey)initWithIdentifier:(id)a3 interfaceStyle:(int64_t)a4 bounds:(CGRect)a5;
- (CKSnapshotCacheKey)keyWithOppositeInterfaceStyle;
- (NSString)identifier;
- (NSString)stringValue;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)interfaceStyle;
- (void)setBounds:(CGRect)a3;
- (void)setIdentifier:(id)a3;
- (void)setInterfaceStyle:(int64_t)a3;
@end

@implementation CKSnapshotCacheKey

+ (id)keyWithIdentifier:(id)a3 interfaceStyle:(int64_t)a4 bounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v10 = a3;
  v11 = -[CKSnapshotCacheKey initWithIdentifier:interfaceStyle:bounds:]([CKSnapshotCacheKey alloc], "initWithIdentifier:interfaceStyle:bounds:", v10, a4, x, y, width, height);

  return v11;
}

- (CKSnapshotCacheKey)initWithIdentifier:(id)a3 interfaceStyle:(int64_t)a4 bounds:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v12 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CKSnapshotCacheKey;
  v13 = [(CKSnapshotCacheKey *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_identifier, a3);
    v14->_interfaceStyle = a4;
    v14->_bounds.origin.CGFloat x = x;
    v14->_bounds.origin.CGFloat y = y;
    v14->_bounds.size.CGFloat width = width;
    v14->_bounds.size.CGFloat height = height;
  }

  return v14;
}

- (CKSnapshotCacheKey)keyWithOppositeInterfaceStyle
{
  v3 = (void *)[(CKSnapshotCacheKey *)self copy];
  if ([(CKSnapshotCacheKey *)self interfaceStyle] == 1) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  [v3 setInterfaceStyle:v4];

  return (CKSnapshotCacheKey *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(CKSnapshotCacheKey *)self identifier];
  int64_t v5 = [(CKSnapshotCacheKey *)self interfaceStyle];
  [(CKSnapshotCacheKey *)self bounds];
  v6 = +[CKSnapshotCacheKey keyWithIdentifier:interfaceStyle:bounds:](CKSnapshotCacheKey, "keyWithIdentifier:interfaceStyle:bounds:", v4, v5);

  return v6;
}

- (NSString)stringValue
{
  int64_t v3 = [(CKSnapshotCacheKey *)self interfaceStyle];
  uint64_t v4 = @"light";
  if (v3 == 2) {
    uint64_t v4 = @"dark";
  }
  int64_t v5 = NSString;
  v6 = v4;
  v7 = [(CKSnapshotCacheKey *)self identifier];
  [(CKSnapshotCacheKey *)self bounds];
  double v9 = v8;
  double v11 = v10;
  if (CKMainScreenScale_once_66 != -1) {
    dispatch_once(&CKMainScreenScale_once_66, &__block_literal_global_170);
  }
  double v12 = 1.0;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_66 != 0.0) {
    double v12 = *(double *)&CKMainScreenScale_sMainScreenScale_66;
  }
  v17.CGFloat width = round(v9 * v12) / v12;
  v17.CGFloat height = round(v11 * v12) / v12;
  v13 = NSStringFromCGSize(v17);
  v14 = [v5 stringWithFormat:@"%@-%@-<%@>", v7, v6, v13];

  return (NSString *)v14;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CKSnapshotCacheKey *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v5 = [(CKSnapshotCacheKey *)self stringValue];
      v6 = [(CKSnapshotCacheKey *)v4 stringValue];
      char v7 = [v5 isEqualToString:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)interfaceStyle
{
  return self->_interfaceStyle;
}

- (void)setInterfaceStyle:(int64_t)a3
{
  self->_interfaceStyle = a3;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (void).cxx_destruct
{
}

@end