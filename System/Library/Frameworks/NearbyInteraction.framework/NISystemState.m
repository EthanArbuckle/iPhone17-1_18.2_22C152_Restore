@interface NISystemState
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NISystemState)init;
- (NISystemState)initWithCoder:(id)a3;
- (NISystemState)initWithUWBPreciseDistanceAvailability:(unint64_t)a3 uwbExtendedDistanceAvailability:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (unint64_t)hash;
- (unint64_t)uwbExtendedDistanceAvailability;
- (unint64_t)uwbPreciseDistanceAvailability;
- (void)encodeWithCoder:(id)a3;
- (void)setUwbExtendedDistanceAvailability:(unint64_t)a3;
- (void)setUwbPreciseDistanceAvailability:(unint64_t)a3;
@end

@implementation NISystemState

- (NISystemState)init
{
  v3 = [[NISystemState alloc] initWithUWBPreciseDistanceAvailability:0 uwbExtendedDistanceAvailability:0];

  return v3;
}

- (NISystemState)initWithUWBPreciseDistanceAvailability:(unint64_t)a3 uwbExtendedDistanceAvailability:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NISystemState;
  result = [(NISystemState *)&v7 init];
  if (result)
  {
    result->_uwbPreciseDistanceAvailability = a3;
    result->_uwbExtendedDistanceAvailability = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[NISystemState allocWithZone:a3];
  unint64_t uwbPreciseDistanceAvailability = self->_uwbPreciseDistanceAvailability;
  unint64_t uwbExtendedDistanceAvailability = self->_uwbExtendedDistanceAvailability;

  return [(NISystemState *)v4 initWithUWBPreciseDistanceAvailability:uwbPreciseDistanceAvailability uwbExtendedDistanceAvailability:uwbExtendedDistanceAvailability];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:self->_uwbPreciseDistanceAvailability forKey:@"uwbPreciseDistanceAvailability"];
  [v4 encodeInteger:self->_uwbExtendedDistanceAvailability forKey:@"uwbExtendedDistanceAvailability"];
}

- (NISystemState)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[NISystemState initWithUWBPreciseDistanceAvailability:uwbExtendedDistanceAvailability:]([NISystemState alloc], "initWithUWBPreciseDistanceAvailability:uwbExtendedDistanceAvailability:", [v4 decodeIntegerForKey:@"uwbPreciseDistanceAvailability"], objc_msgSend(v4, "decodeIntegerForKey:", @"uwbExtendedDistanceAvailability"));

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (NISystemState *)v4;
    v6 = v5;
    if (v5 == self)
    {
      BOOL v11 = 1;
    }
    else
    {
      uint64_t v7 = [(NISystemState *)v5 uwbPreciseDistanceAvailability];
      unint64_t uwbPreciseDistanceAvailability = self->_uwbPreciseDistanceAvailability;
      uint64_t v9 = [(NISystemState *)v6 uwbExtendedDistanceAvailability];
      BOOL v11 = v7 == uwbPreciseDistanceAvailability && v9 == self->_uwbExtendedDistanceAvailability;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  return self->_uwbPreciseDistanceAvailability ^ self->_uwbExtendedDistanceAvailability ^ 0x1F;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(NISystemState *)self descriptionInternal];
  uint64_t v7 = (void *)[v3 initWithFormat:@"<%@: %@>", v5, v6];

  return v7;
}

- (id)descriptionInternal
{
  id v3 = NSString;
  id v4 = +[NIInternalUtils NISystemResourceAvailabilityToString:self->_uwbPreciseDistanceAvailability];
  v5 = +[NIInternalUtils NISystemResourceAvailabilityToString:self->_uwbExtendedDistanceAvailability];
  v6 = [v3 stringWithFormat:@"<UWB [precise distance: %@, extended distance: %@]>", v4, v5];

  return v6;
}

- (unint64_t)uwbPreciseDistanceAvailability
{
  return self->_uwbPreciseDistanceAvailability;
}

- (void)setUwbPreciseDistanceAvailability:(unint64_t)a3
{
  self->_unint64_t uwbPreciseDistanceAvailability = a3;
}

- (unint64_t)uwbExtendedDistanceAvailability
{
  return self->_uwbExtendedDistanceAvailability;
}

- (void)setUwbExtendedDistanceAvailability:(unint64_t)a3
{
  self->_unint64_t uwbExtendedDistanceAvailability = a3;
}

@end