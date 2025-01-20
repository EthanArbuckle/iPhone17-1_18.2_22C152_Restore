@interface CTCAModelVector
+ (BOOL)supportsSecureCoding;
- (CTCAModelVector)initWithCoder:(id)a3;
- (CTCATargetVector)defaultVector;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDefaultVector:(id)a3;
@end

@implementation CTCAModelVector

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTCAModelVector *)self defaultVector];
  [v3 appendFormat:@", defaultVector=%@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = [(CTCAModelVector *)self defaultVector];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setDefaultVector:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = [(CTCAModelVector *)self defaultVector];
  [v5 encodeObject:v4 forKey:@"defaultVector"];
}

- (CTCAModelVector)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTCAModelVector;
  id v5 = [(CTCAModelVector *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultVector"];
    defaultVector = v5->_defaultVector;
    v5->_defaultVector = (CTCATargetVector *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTCATargetVector)defaultVector
{
  return self->_defaultVector;
}

- (void)setDefaultVector:(id)a3
{
}

- (void).cxx_destruct
{
}

@end