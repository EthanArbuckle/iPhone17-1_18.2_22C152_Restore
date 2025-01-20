@interface SRFaceMetricsExpression
+ (BOOL)supportsSecureCoding;
+ (SRFaceMetricsExpression)new;
+ (id)partialFaceMetricsExpressionWithIdentifier:(id)a3 value:(double)a4;
+ (id)wholeFaceMetricsExpressionWithIdentifier:(id)a3 value:(double)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)identifier;
- (SRFaceMetricsExpression)init;
- (SRFaceMetricsExpression)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (SRFaceMetricsExpression)initWithCoder:(id)a3;
- (SRFaceMetricsExpression)initWithIdentifier:(id)a3 value:(double)a4;
- (double)value;
- (id)binarySampleRepresentation;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SRFaceMetricsExpression

- (SRFaceMetricsExpression)init
{
  return 0;
}

+ (SRFaceMetricsExpression)new
{
  return 0;
}

- (SRFaceMetricsExpression)initWithIdentifier:(id)a3 value:(double)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SRFaceMetricsExpression;
  v6 = [(SRFaceMetricsExpression *)&v8 init];
  if (v6)
  {
    v6->_identifier = (NSString *)[a3 copy];
    v6->_value = a4;
  }
  return v6;
}

+ (id)wholeFaceMetricsExpressionWithIdentifier:(id)a3 value:(double)a4
{
  v4 = [[SRFaceMetricsExpression alloc] initWithIdentifier:a3 value:a4];

  return v4;
}

+ (id)partialFaceMetricsExpressionWithIdentifier:(id)a3 value:(double)a4
{
  v4 = [[SRFaceMetricsExpression alloc] initWithIdentifier:a3 value:a4];

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SRFaceMetricsExpression;
  [(SRFaceMetricsExpression *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRFaceMetrics.m", 101, @"Invalid parameter not satisfying: %@", @"[coder allowsKeyedCoding]");
  }
  objc_msgSend(a3, "encodeObject:forKey:", -[SRFaceMetricsExpression identifier](self, "identifier"), @"identifier");
  [(SRFaceMetricsExpression *)self value];

  objc_msgSend(a3, "encodeDouble:forKey:", @"value");
}

- (SRFaceMetricsExpression)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRFaceMetrics.m", 107, @"Invalid parameter not satisfying: %@", @"[coder allowsKeyedCoding]");
  }
  uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  [a3 decodeDoubleForKey:@"value"];

  return -[SRFaceMetricsExpression initWithIdentifier:value:](self, "initWithIdentifier:value:", v6);
}

- (id)binarySampleRepresentation
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v6 = 0;
  v2 = (void *)[MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v6];
  uint64_t v3 = v6;
  if (v6)
  {
    v4 = SRLogFaceMetrics;
    if (os_log_type_enabled((os_log_t)SRLogFaceMetrics, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v8 = v3;
      _os_log_error_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_ERROR, "Failed to archive data because %{public}@", buf, 0xCu);
    }
  }
  return v2;
}

- (SRFaceMetricsExpression)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  if (objc_msgSend(a3, "length", a5))
  {
    v11.receiver = self;
    v11.super_class = (Class)SRFaceMetricsExpression;
    result = [(SRFaceMetricsExpression *)&v11 init];
    if (!result) {
      return result;
    }
    uint64_t v8 = result;
    uint64_t v10 = 0;
    uint64_t v9 = (void *)[MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:a3 error:&v10];

    if (v9) {
      return (SRFaceMetricsExpression *)v9;
    }
  }
  else
  {
  }
  return 0;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(SRFaceMetricsExpression *)self identifier];
  [(SRFaceMetricsExpression *)self value];
  return (NSString *)[v3 stringWithFormat:@"%@ (%p) {identifier: %@, value: %f}", v5, self, v6, v7];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = -[NSString isEqualToString:](-[SRFaceMetricsExpression identifier](self, "identifier"), "isEqualToString:", [a3 identifier]);
      if (v5)
      {
        [(SRFaceMetricsExpression *)self value];
        double v7 = v6;
        [a3 value];
        LOBYTE(v5) = v7 == v8;
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)[(SRFaceMetricsExpression *)self identifier] hash];
  [(SRFaceMetricsExpression *)self value];
  return v3 ^ (unint64_t)v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (double)value
{
  return self->_value;
}

@end