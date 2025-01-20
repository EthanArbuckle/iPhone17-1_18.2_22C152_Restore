@interface DMFFetchAvailableOSUpdatesResultObject
+ (BOOL)supportsSecureCoding;
- (DMFFetchAvailableOSUpdatesResultObject)init;
- (DMFFetchAvailableOSUpdatesResultObject)initWithCoder:(id)a3;
- (DMFFetchAvailableOSUpdatesResultObject)initWithUpdate:(id)a3;
- (DMFOSUpdate)update;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DMFFetchAvailableOSUpdatesResultObject

- (DMFFetchAvailableOSUpdatesResultObject)init
{
  return [(DMFFetchAvailableOSUpdatesResultObject *)self initWithUpdate:0];
}

- (DMFFetchAvailableOSUpdatesResultObject)initWithUpdate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMFFetchAvailableOSUpdatesResultObject;
  v5 = [(CATTaskResultObject *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    update = v5->_update;
    v5->_update = (DMFOSUpdate *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchAvailableOSUpdatesResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMFFetchAvailableOSUpdatesResultObject;
  v5 = [(CATTaskResultObject *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"update"];
    update = v5->_update;
    v5->_update = (DMFOSUpdate *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMFFetchAvailableOSUpdatesResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = [(DMFFetchAvailableOSUpdatesResultObject *)self update];
  [v4 encodeObject:v5 forKey:@"update"];
}

- (id)description
{
  v3 = [(DMFFetchAvailableOSUpdatesResultObject *)self update];

  if (v3)
  {
    id v4 = NSString;
    v5 = [(DMFFetchAvailableOSUpdatesResultObject *)self update];
    objc_super v6 = [v5 description];
    uint64_t v7 = [v4 stringWithFormat:@"%@\n", v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (DMFOSUpdate)update
{
  return self->_update;
}

- (void).cxx_destruct
{
}

@end