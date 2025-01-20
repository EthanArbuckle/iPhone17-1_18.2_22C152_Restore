@interface CADObjectChangeID
+ (BOOL)supportsSecureCoding;
- (CADObjectChangeID)initWithCoder:(id)a3;
- (CADObjectChangeID)initWithEntityType:(int)a3 changeID:(int64_t)a4;
- (int)entityType;
- (int64_t)changeID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CADObjectChangeID

- (CADObjectChangeID)initWithEntityType:(int)a3 changeID:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CADObjectChangeID;
  result = [(CADObjectChangeID *)&v7 init];
  if (result)
  {
    result->_entityType = a3;
    result->_changeID = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t entityType = self->_entityType;
  id v5 = a3;
  [v5 encodeInt:entityType forKey:@"entityType"];
  [v5 encodeInteger:self->_changeID forKey:@"changeID"];
}

- (CADObjectChangeID)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CADObjectChangeID;
  id v5 = [(CADObjectChangeID *)&v7 init];
  if (v5)
  {
    v5->_uint64_t entityType = [v4 decodeIntForKey:@"entityType"];
    v5->_changeID = [v4 decodeIntegerForKey:@"changeID"];
  }

  return v5;
}

- (int)entityType
{
  return self->_entityType;
}

- (int64_t)changeID
{
  return self->_changeID;
}

@end