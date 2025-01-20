@interface LNStringSearchCriteria
+ (BOOL)supportsSecureCoding;
- (LNStringSearchCriteria)initWithCoder:(id)a3;
- (LNStringSearchCriteria)initWithTerm:(id)a3;
- (NSString)term;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNStringSearchCriteria

- (void).cxx_destruct
{
}

- (NSString)term
{
  return self->_term;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(LNStringSearchCriteria *)self term];
  [v4 encodeObject:v5 forKey:@"term"];
}

- (LNStringSearchCriteria)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"term"];

  if (v5)
  {
    self = [(LNStringSearchCriteria *)self initWithTerm:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (LNStringSearchCriteria)initWithTerm:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"LNStringSearchCriteria.m", 17, @"Invalid parameter not satisfying: %@", @"term" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)LNStringSearchCriteria;
  v6 = [(LNStringSearchCriteria *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    term = v6->_term;
    v6->_term = (NSString *)v7;

    v9 = v6;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end