@interface ASCLockupDisplayContext
+ (BOOL)supportsSecureCoding;
- (ASCLockupDisplayContext)initWithCoder:(id)a3;
- (ASCLockupDisplayContext)initWithHeadingKind:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)headingKind;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCLockupDisplayContext

- (ASCLockupDisplayContext)initWithHeadingKind:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASCLockupDisplayContext;
  v6 = [(ASCLockupDisplayContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_headingKind, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupDisplayContext)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", objc_opt_class(), 0);
  v6 = [v4 decodeObjectOfClasses:v5 forKey:@"headingKind"];

  v7 = [(ASCLockupDisplayContext *)self initWithHeadingKind:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCLockupDisplayContext *)self headingKind];
  [v4 encodeObject:v5 forKey:@"headingKind"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCLockupDisplayContext *)self headingKind];
  [(ASCHasher *)v3 combineObject:v4];

  unint64_t v5 = [(ASCHasher *)v3 finalizeHash];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASCLockupDisplayContext *)a3;
  if (self == v4)
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    objc_opt_class();
    unint64_t v5 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        v6 = v5;
      }
      else {
        v6 = 0;
      }
    }
    else
    {
      v6 = 0;
    }
    v8 = v6;

    if (v8)
    {
      objc_super v9 = [(ASCLockupDisplayContext *)self headingKind];
      uint64_t v10 = [(ASCLockupDisplayContext *)v8 headingKind];
      v11 = (void *)v10;
      if (v9 && v10) {
        unsigned __int8 v7 = [v9 isEqual:v10];
      }
      else {
        unsigned __int8 v7 = v9 == (void *)v10;
      }
    }
    else
    {
      unsigned __int8 v7 = 0;
    }
  }
  return v7;
}

- (id)description
{
  v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCLockupDisplayContext *)self headingKind];
  [(ASCDescriber *)v3 addObject:v4 withName:@"headingKind"];

  unint64_t v5 = [(ASCDescriber *)v3 finalizeDescription];

  return v5;
}

- (NSString)headingKind
{
  return self->_headingKind;
}

- (void).cxx_destruct
{
}

@end