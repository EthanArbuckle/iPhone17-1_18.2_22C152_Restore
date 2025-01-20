@interface FPError
+ (BOOL)supportsSecureCoding;
- (FPError)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FPError

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FPError)initWithCoder:(id)a3
{
  id v3 = a3;
  v18 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"d"];
  uint64_t v17 = [v3 decodeIntegerForKey:@"c"];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
  v14 = [v3 decodeObjectOfClasses:v13 forKey:@"ui"];

  v20.receiver = self;
  v20.super_class = (Class)FPError;
  v15 = [(FPError *)&v20 initWithDomain:v18 code:v17 userInfo:v14];

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FPError *)self domain];
  [v4 encodeObject:v5 forKey:@"d"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[FPError code](self, "code"), @"c");
  id v6 = [(FPError *)self userInfo];
  [v4 encodeObject:v6 forKey:@"ui"];
}

@end