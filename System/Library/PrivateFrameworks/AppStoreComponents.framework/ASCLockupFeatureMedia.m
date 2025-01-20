@interface ASCLockupFeatureMedia
+ (BOOL)supportsSecureCoding;
- (ASCLockupFeatureMedia)initWithCoder:(id)a3;
- (ASCLockupFeatureMedia)initWithScreenshots:(id)a3 trailers:(id)a4;
- (ASCScreenshots)screenshots;
- (ASCTrailers)trailers;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCLockupFeatureMedia

- (ASCLockupFeatureMedia)initWithScreenshots:(id)a3 trailers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASCLockupFeatureMedia;
  v8 = [(ASCLockupFeatureMedia *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    screenshots = v8->_screenshots;
    v8->_screenshots = (ASCScreenshots *)v9;

    uint64_t v11 = [v7 copy];
    trailers = v8->_trailers;
    v8->_trailers = (ASCTrailers *)v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupFeatureMedia)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"screenshots"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trailers"];

  id v7 = [(ASCLockupFeatureMedia *)self initWithScreenshots:v5 trailers:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASCLockupFeatureMedia *)self screenshots];
  [v4 encodeObject:v5 forKey:@"screenshots"];

  id v6 = [(ASCLockupFeatureMedia *)self trailers];
  [v4 encodeObject:v6 forKey:@"trailers"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCLockupFeatureMedia *)self screenshots];
  [(ASCHasher *)v3 combineObject:v4];

  v5 = [(ASCLockupFeatureMedia *)self trailers];
  [(ASCHasher *)v3 combineObject:v5];

  unint64_t v6 = [(ASCHasher *)v3 finalizeHash];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASCLockupFeatureMedia *)a3;
  if (self != v4)
  {
    objc_opt_class();
    v5 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        unint64_t v6 = v5;
      }
      else {
        unint64_t v6 = 0;
      }
    }
    else
    {
      unint64_t v6 = 0;
    }
    v8 = v6;

    if (!v8)
    {
      char v7 = 0;
LABEL_21:

      goto LABEL_22;
    }
    uint64_t v9 = [(ASCLockupFeatureMedia *)self screenshots];
    uint64_t v10 = [(ASCLockupFeatureMedia *)v8 screenshots];
    uint64_t v11 = (void *)v10;
    if (v9 && v10)
    {
      if ([v9 isEqual:v10]) {
        goto LABEL_12;
      }
    }
    else if (v9 == (void *)v10)
    {
LABEL_12:
      v12 = [(ASCLockupFeatureMedia *)self trailers];
      uint64_t v13 = [(ASCLockupFeatureMedia *)v8 trailers];
      objc_super v14 = (void *)v13;
      if (v12 && v13) {
        char v7 = [v12 isEqual:v13];
      }
      else {
        char v7 = v12 == (void *)v13;
      }

      goto LABEL_20;
    }
    char v7 = 0;
LABEL_20:

    goto LABEL_21;
  }
  char v7 = 1;
LABEL_22:

  return v7;
}

- (NSString)description
{
  v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCLockupFeatureMedia *)self screenshots];
  [(ASCDescriber *)v3 addObject:v4 withName:@"screenshots"];

  v5 = [(ASCLockupFeatureMedia *)self trailers];
  [(ASCDescriber *)v3 addObject:v5 withName:@"trailers"];

  unint64_t v6 = [(ASCDescriber *)v3 finalizeDescription];

  return (NSString *)v6;
}

- (ASCScreenshots)screenshots
{
  return self->_screenshots;
}

- (ASCTrailers)trailers
{
  return self->_trailers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailers, 0);

  objc_storeStrong((id *)&self->_screenshots, 0);
}

@end