@interface HKDataCollectorState
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKDataCollectorState)init;
- (HKDataCollectorState)initWithCoder:(id)a3;
- (HKDataCollectorState)initWithType:(unint64_t)a3 priority:(int64_t)a4;
- (id)cloneWithNewPriority:(int64_t)a3;
- (id)cloneWithNewType:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)priority;
- (unint64_t)collectionType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKDataCollectorState

- (HKDataCollectorState)init
{
  v3.receiver = self;
  v3.super_class = (Class)HKDataCollectorState;
  result = [(HKDataCollectorState *)&v3 init];
  if (result)
  {
    result->_collectionType = 0;
    result->_priority = 0;
  }
  return result;
}

- (HKDataCollectorState)initWithType:(unint64_t)a3 priority:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HKDataCollectorState;
  result = [(HKDataCollectorState *)&v7 init];
  if (result)
  {
    result->_collectionType = a3;
    result->_priority = a4;
  }
  return result;
}

- (id)cloneWithNewType:(unint64_t)a3
{
  *((void *)self + 1) = a3;
  return self;
}

- (id)cloneWithNewPriority:(int64_t)a3
{
  *((void *)self + 2) = a3;
  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HKDataCollectorState allocWithZone:a3];
  unint64_t collectionType = self->_collectionType;
  int64_t priority = self->_priority;

  return [(HKDataCollectorState *)v4 initWithType:collectionType priority:priority];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_priority == v4[2] && self->_collectionType == v4[1];

  return v5;
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = HKDataCollectionTypeToString(self->_collectionType);
  BOOL v5 = [v3 stringWithFormat:@"<%@, priority %ld>", v4, self->_priority];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t priority = self->_priority;
  id v5 = a3;
  [v5 encodeInteger:priority forKey:@"HKDataCollectorStatePriorityKey"];
  [v5 encodeInteger:self->_collectionType forKey:@"HKDataCollectorStateTypeKey"];
}

- (HKDataCollectorState)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HKDataCollectorState;
  id v5 = [(HKDataCollectorState *)&v7 init];
  if (v5)
  {
    v5->_int64_t priority = [v4 decodeIntegerForKey:@"HKDataCollectorStatePriorityKey"];
    v5->_unint64_t collectionType = [v4 decodeIntegerForKey:@"HKDataCollectorStateTypeKey"];
  }

  return v5;
}

- (unint64_t)collectionType
{
  return self->_collectionType;
}

- (int64_t)priority
{
  return self->_priority;
}

@end