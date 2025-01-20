@interface BPSCountWindowState
+ (BOOL)supportsSecureCoding;
- (BPSCountWindowState)initWithCapacity:(unint64_t)a3 currentCount:(unint64_t)a4 identifier:(id)a5 aggregate:(id)a6 completed:(BOOL)a7;
- (BPSCountWindowState)initWithCoder:(id)a3;
- (id)metadata;
- (unint64_t)capacity;
- (unint64_t)currentCount;
- (void)encodeWithCoder:(id)a3;
- (void)setCapacity:(unint64_t)a3;
- (void)setCurrentCount:(unint64_t)a3;
@end

@implementation BPSCountWindowState

- (BPSCountWindowState)initWithCapacity:(unint64_t)a3 currentCount:(unint64_t)a4 identifier:(id)a5 aggregate:(id)a6 completed:(BOOL)a7
{
  v10.receiver = self;
  v10.super_class = (Class)BPSCountWindowState;
  result = [(BPSWindowState *)&v10 initWithIdentifier:a5 aggregate:a6 completed:a7];
  if (result)
  {
    result->_capacity = a3;
    result->_currentCount = a4;
  }
  return result;
}

- (id)metadata
{
  v2 = [[BPSCountWindowMetadata alloc] initWithCurrentCount:[(BPSCountWindowState *)self currentCount]];
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BPSCountWindowState;
  id v4 = a3;
  [(BPSWindowState *)&v7 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[BPSCountWindowState capacity](self, "capacity", v7.receiver, v7.super_class));
  [v4 encodeObject:v5 forKey:@"capacity"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[BPSCountWindowState currentCount](self, "currentCount"));
  [v4 encodeObject:v6 forKey:@"currentCount"];
}

- (BPSCountWindowState)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"capacity"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentCount"];
    if (v6
      && (v9.receiver = self,
          v9.super_class = (Class)BPSCountWindowState,
          (self = [(BPSWindowState *)&v9 initWithCoder:v4]) != 0))
    {
      -[BPSCountWindowState setCapacity:](self, "setCapacity:", [v5 unsignedIntegerValue]);
      -[BPSCountWindowState setCurrentCount:](self, "setCurrentCount:", [v6 unsignedIntegerValue]);
      self = self;
      objc_super v7 = self;
    }
    else
    {
      objc_super v7 = 0;
    }
  }
  else
  {
    objc_super v7 = 0;
  }

  return v7;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (void)setCapacity:(unint64_t)a3
{
  self->_capacity = a3;
}

- (unint64_t)currentCount
{
  return self->_currentCount;
}

- (void)setCurrentCount:(unint64_t)a3
{
  self->_currentCount = a3;
}

@end