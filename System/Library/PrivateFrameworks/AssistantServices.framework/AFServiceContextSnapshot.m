@interface AFServiceContextSnapshot
+ (BOOL)supportsSecureCoding;
- (AFServiceContextSnapshot)initWithCoder:(id)a3;
- (AFServiceContextSnapshot)initWithDeliveryDate:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)deliveryDate;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFServiceContextSnapshot

- (void).cxx_destruct
{
}

- (NSDate)deliveryDate
{
  return self->_deliveryDate;
}

- (AFServiceContextSnapshot)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFServiceContextSnapshot;
  v5 = [(AFServiceContextSnapshot *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_deliveryDate"];
    deliveryDate = v5->_deliveryDate;
    v5->_deliveryDate = (NSDate *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (unint64_t)hash
{
  return [(NSDate *)self->_deliveryDate hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFServiceContextSnapshot *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      deliveryDate = self->_deliveryDate;
      v7 = [(AFServiceContextSnapshot *)v5 deliveryDate];
      if (deliveryDate == v7)
      {
        char v10 = 1;
      }
      else
      {
        v8 = self->_deliveryDate;
        objc_super v9 = [(AFServiceContextSnapshot *)v5 deliveryDate];
        char v10 = [(NSDate *)v8 isEqual:v9];
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)AFServiceContextSnapshot;
  id v4 = [(AFServiceContextSnapshot *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@, deliveryDate: %@", v4, self->_deliveryDate];

  return v5;
}

- (AFServiceContextSnapshot)initWithDeliveryDate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFServiceContextSnapshot;
  v5 = [(AFServiceContextSnapshot *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    deliveryDate = v5->_deliveryDate;
    v5->_deliveryDate = (NSDate *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end