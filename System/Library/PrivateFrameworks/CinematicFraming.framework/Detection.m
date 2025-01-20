@interface Detection
+ (BOOL)supportsSecureCoding;
- (CGRect)bounds;
- (Detection)init;
- (Detection)initWithCoder:(id)a3;
- (int64_t)oid;
- (void)encodeWithCoder:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setOid:(int64_t)a3;
@end

@implementation Detection

- (Detection)init
{
  v5.receiver = self;
  v5.super_class = (Class)Detection;
  v2 = [(Detection *)&v5 init];
  v3 = v2;
  if (v2)
  {
    -[Detection setBounds:](v2, "setBounds:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(Detection *)v3 setOid:0];
  }
  return v3;
}

- (Detection)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(Detection *)self init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"bounds"];
    [v9 rectValue];
    -[Detection setBounds:](v5, "setBounds:");
    v10 = [v4 decodeObjectOfClasses:v8 forKey:@"oid"];
    -[Detection setOid:](v5, "setOid:", [v10 longValue]);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29238];
  id v5 = a3;
  [(Detection *)self bounds];
  v6 = objc_msgSend(v4, "valueWithRect:");
  [v5 encodeObject:v6 forKey:@"bounds"];

  objc_msgSend(NSNumber, "numberWithLong:", -[Detection oid](self, "oid"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v7 forKey:@"oid"];
}

- (CGRect)bounds
{
  double x = self->bounds.origin.x;
  double y = self->bounds.origin.y;
  double width = self->bounds.size.width;
  double height = self->bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->bounds = a3;
}

- (int64_t)oid
{
  return self->oid;
}

- (void)setOid:(int64_t)a3
{
  self->oid = a3;
}

@end