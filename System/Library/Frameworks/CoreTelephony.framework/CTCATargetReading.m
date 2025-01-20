@interface CTCATargetReading
+ (BOOL)supportsSecureCoding;
- (CTCATargetReading)initWithCoder:(id)a3;
- (NSNumber)targetId;
- (NSNumber)x;
- (NSNumber)y;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setTargetId:(id)a3;
- (void)setX:(id)a3;
- (void)setY:(id)a3;
@end

@implementation CTCATargetReading

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTCATargetReading *)self targetId];
  [v3 appendFormat:@", targetId=%@", v4];

  v5 = [(CTCATargetReading *)self x];
  [v3 appendFormat:@", x=%@", v5];

  v6 = [(CTCATargetReading *)self y];
  [v3 appendFormat:@", y=%@", v6];

  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = [(CTCATargetReading *)self targetId];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setTargetId:v7];

  v8 = [(CTCATargetReading *)self x];
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setX:v9];

  v10 = [(CTCATargetReading *)self y];
  v11 = (void *)[v10 copyWithZone:a3];
  [v5 setY:v11];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  v4 = [(CTCATargetReading *)self targetId];
  [v7 encodeObject:v4 forKey:@"targetId"];

  v5 = [(CTCATargetReading *)self x];
  [v7 encodeObject:v5 forKey:@"x"];

  v6 = [(CTCATargetReading *)self y];
  [v7 encodeObject:v6 forKey:@"y"];
}

- (CTCATargetReading)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTCATargetReading;
  v5 = [(CTCATargetReading *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetId"];
    targetId = v5->_targetId;
    v5->_targetId = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"x"];
    x = v5->_x;
    v5->_x = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"y"];
    y = v5->_y;
    v5->_y = (NSNumber *)v10;
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

  objc_storeStrong((id *)&self->_targetId, 0);
}

@end