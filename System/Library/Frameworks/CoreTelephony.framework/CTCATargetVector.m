@interface CTCATargetVector
+ (BOOL)supportsSecureCoding;
- (CTCATargetVector)initWithCoder:(id)a3;
- (CTCATargetVectorAxis)x;
- (CTCATargetVectorAxis)y;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setX:(id)a3;
- (void)setY:(id)a3;
@end

@implementation CTCATargetVector

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTCATargetVector *)self x];
  [v3 appendFormat:@", x=%@", v4];

  v5 = [(CTCATargetVector *)self y];
  [v3 appendFormat:@", y=%@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = [(CTCATargetVector *)self x];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setX:v7];

  v8 = [(CTCATargetVector *)self y];
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setY:v9];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  v4 = [(CTCATargetVector *)self x];
  [v6 encodeObject:v4 forKey:@"x"];

  v5 = [(CTCATargetVector *)self y];
  [v6 encodeObject:v5 forKey:@"y"];
}

- (CTCATargetVector)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTCATargetVector;
  v5 = [(CTCATargetVector *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"x"];
    x = v5->_x;
    v5->_x = (CTCATargetVectorAxis *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"y"];
    y = v5->_y;
    v5->_y = (CTCATargetVectorAxis *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTCATargetVectorAxis)x
{
  return self->_x;
}

- (void)setX:(id)a3
{
}

- (CTCATargetVectorAxis)y
{
  return self->_y;
}

- (void)setY:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_y, 0);

  objc_storeStrong((id *)&self->_x, 0);
}

@end