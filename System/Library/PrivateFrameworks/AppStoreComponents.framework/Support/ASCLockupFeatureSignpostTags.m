@interface ASCLockupFeatureSignpostTags
+ (BOOL)supportsSecureCoding;
- (ASCLockupFeatureSignpostTags)initWithCoder:(id)a3;
- (ASCLockupFeatureSignpostTags)initWithSignpostTags:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSSet)signpostTags;
- (NSString)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCLockupFeatureSignpostTags

- (ASCLockupFeatureSignpostTags)initWithSignpostTags:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASCLockupFeatureSignpostTags;
  v5 = [(ASCLockupFeatureSignpostTags *)&v9 init];
  if (v5)
  {
    v6 = (NSSet *)[v4 copy];
    signpostTags = v5->_signpostTags;
    v5->_signpostTags = v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupFeatureSignpostTags)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)NSSet);
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v4 decodeObjectOfClasses:v7 forKey:@"signpostTags"];

  if (v8)
  {
    self = [(ASCLockupFeatureSignpostTags *)self initWithSignpostTags:v8];
    objc_super v9 = self;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10013E7AC();
    }
    objc_super v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCLockupFeatureSignpostTags *)self signpostTags];
  [v4 encodeObject:v5 forKey:@"signpostTags"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCLockupFeatureSignpostTags *)self signpostTags];
  [(ASCHasher *)v3 combineObject:v4];

  unint64_t v5 = [(ASCHasher *)v3 finalizeHash];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v8 = [(ASCLockupFeatureSignpostTags *)self signpostTags];
    uint64_t v9 = [v7 signpostTags];
    v10 = (void *)v9;
    if (v8 && v9) {
      unsigned __int8 v11 = [v8 isEqual:v9];
    }
    else {
      unsigned __int8 v11 = v8 == (void *)v9;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (NSString)description
{
  v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCLockupFeatureSignpostTags *)self signpostTags];
  [(ASCDescriber *)v3 addObject:v4 withName:@"signpostTags"];

  id v5 = [(ASCDescriber *)v3 finalizeDescription];

  return (NSString *)v5;
}

- (NSSet)signpostTags
{
  return self->_signpostTags;
}

- (void).cxx_destruct
{
}

@end