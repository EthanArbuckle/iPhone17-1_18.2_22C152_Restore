@interface CTCATarget
+ (BOOL)supportsSecureCoding;
- (CTCATarget)initWithCoder:(id)a3;
- (NSNumber)targetId;
- (NSNumber)x;
- (NSNumber)y;
- (NSString)targetDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setTargetDescription:(id)a3;
- (void)setTargetId:(id)a3;
- (void)setX:(id)a3;
- (void)setY:(id)a3;
@end

@implementation CTCATarget

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTCATarget *)self targetId];
  [v3 appendFormat:@", targetId=%@", v4];

  v5 = [(CTCATarget *)self targetDescription];
  [v3 appendFormat:@", targetDescription=%@", v5];

  v6 = [(CTCATarget *)self x];
  [v3 appendFormat:@", x=%@", v6];

  v7 = [(CTCATarget *)self y];
  [v3 appendFormat:@", y=%@", v7];

  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = [(CTCATarget *)self targetId];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setTargetId:v7];

  v8 = [(CTCATarget *)self targetDescription];
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setTargetDescription:v9];

  v10 = [(CTCATarget *)self x];
  v11 = (void *)[v10 copyWithZone:a3];
  [v5 setX:v11];

  v12 = [(CTCATarget *)self y];
  v13 = (void *)[v12 copyWithZone:a3];
  [v5 setY:v13];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  v4 = [(CTCATarget *)self targetId];
  [v8 encodeObject:v4 forKey:@"targetId"];

  v5 = [(CTCATarget *)self targetDescription];
  [v8 encodeObject:v5 forKey:@"targetDescription"];

  v6 = [(CTCATarget *)self x];
  [v8 encodeObject:v6 forKey:@"x"];

  v7 = [(CTCATarget *)self y];
  [v8 encodeObject:v7 forKey:@"y"];
}

- (CTCATarget)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTCATarget;
  v5 = [(CTCATarget *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetId"];
    targetId = v5->_targetId;
    v5->_targetId = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetDescription"];
    targetDescription = v5->_targetDescription;
    v5->_targetDescription = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"x"];
    x = v5->_x;
    v5->_x = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"y"];
    y = v5->_y;
    v5->_y = (NSNumber *)v12;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)targetId
{
  return self->_targetId;
}

- (void)setTargetId:(id)a3
{
}

- (NSString)targetDescription
{
  return self->_targetDescription;
}

- (void)setTargetDescription:(id)a3
{
}

- (NSNumber)x
{
  return self->_x;
}

- (void)setX:(id)a3
{
}

- (NSNumber)y
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
  objc_storeStrong((id *)&self->_targetDescription, 0);

  objc_storeStrong((id *)&self->_targetId, 0);
}

@end