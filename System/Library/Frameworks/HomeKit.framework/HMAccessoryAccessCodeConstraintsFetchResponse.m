@interface HMAccessoryAccessCodeConstraintsFetchResponse
+ (id)responseWithValue:(id)a3 home:(id)a4;
- (HMAccessCodeConstraints)constraints;
- (HMAccessory)accessory;
- (HMAccessoryAccessCodeConstraintsFetchResponse)initWithAccessory:(id)a3 constraints:(id)a4 error:(id)a5;
- (NSError)error;
- (void)setError:(id)a3;
@end

@implementation HMAccessoryAccessCodeConstraintsFetchResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_constraints, 0);

  objc_storeStrong((id *)&self->_accessory, 0);
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (HMAccessCodeConstraints)constraints
{
  return (HMAccessCodeConstraints *)objc_getProperty(self, a2, 16, 1);
}

- (HMAccessory)accessory
{
  return (HMAccessory *)objc_getProperty(self, a2, 8, 1);
}

- (HMAccessoryAccessCodeConstraintsFetchResponse)initWithAccessory:(id)a3 constraints:(id)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMAccessoryAccessCodeConstraintsFetchResponse;
  v12 = [(HMAccessoryAccessCodeConstraintsFetchResponse *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accessory, a3);
    uint64_t v14 = [v10 copy];
    constraints = v13->_constraints;
    v13->_constraints = (HMAccessCodeConstraints *)v14;

    objc_storeStrong((id *)&v13->_error, a5);
  }

  return v13;
}

+ (id)responseWithValue:(id)a3 home:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 accessoryUUID];
  v8 = [v5 accessoryWithUUID:v7];

  id v9 = [HMAccessoryAccessCodeConstraintsFetchResponse alloc];
  id v10 = [v6 constraints];
  id v11 = [v6 error];

  v12 = [(HMAccessoryAccessCodeConstraintsFetchResponse *)v9 initWithAccessory:v8 constraints:v10 error:v11];

  return v12;
}

@end