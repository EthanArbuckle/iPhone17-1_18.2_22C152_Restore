@interface DMFFetchLocationResultObject
+ (BOOL)supportsSecureCoding;
- (CLLocation)location;
- (DMFFetchLocationResultObject)initWithCoder:(id)a3;
- (DMFFetchLocationResultObject)initWithLocation:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DMFFetchLocationResultObject

- (DMFFetchLocationResultObject)initWithLocation:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMFFetchLocationResultObject;
  v5 = [(CATTaskResultObject *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    location = v5->_location;
    v5->_location = (CLLocation *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchLocationResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMFFetchLocationResultObject;
  v5 = [(CATTaskResultObject *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"location"];
    location = v5->_location;
    v5->_location = (CLLocation *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMFFetchLocationResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = [(DMFFetchLocationResultObject *)self location];
  [v4 encodeObject:v5 forKey:@"location"];
}

- (id)description
{
  v2 = [(DMFFetchLocationResultObject *)self location];
  v3 = [v2 description];

  return v3;
}

- (CLLocation)location
{
  return self->_location;
}

- (void).cxx_destruct
{
}

@end