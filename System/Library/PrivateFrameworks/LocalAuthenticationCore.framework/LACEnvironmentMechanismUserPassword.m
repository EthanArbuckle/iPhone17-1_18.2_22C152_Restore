@interface LACEnvironmentMechanismUserPassword
+ (BOOL)supportsSecureCoding;
+ (id)environmentMechanismForUser:(unsigned int)a3 auditToken:(id *)a4 dependencies:(id)a5 error:(id *)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)set;
- (LACEnvironmentMechanismUserPassword)initWithAvailabilityError:(id)a3 set:(BOOL)a4;
- (LACEnvironmentMechanismUserPassword)initWithCoder:(id)a3;
- (id)descriptionDetails;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LACEnvironmentMechanismUserPassword

- (LACEnvironmentMechanismUserPassword)initWithAvailabilityError:(id)a3 set:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)LACEnvironmentMechanismUserPassword;
  result = [(LACEnvironmentMechanism *)&v6 initWithAvailabilityError:a3 localizedName:@"Passcode" iconSystemName:@"lock.shield"];
  if (result) {
    result->_set = a4;
  }
  return result;
}

+ (id)environmentMechanismForUser:(unsigned int)a3 auditToken:(id *)a4 dependencies:(id)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a3;
  v8 = objc_msgSend(a5, "passcodeHelper", *(void *)&a3, a4);
  id v16 = 0;
  uint64_t v9 = [v8 isPasscodeSetForUser:v7 error:&v16];
  id v10 = v16;

  if (a6) {
    *a6 = v10;
  }
  v11 = [LACEnvironmentMechanismUserPassword alloc];
  v12 = v11;
  if (v10)
  {
    v13 = [(LACEnvironmentMechanismUserPassword *)v11 initWithAvailabilityError:v10 set:v9];
  }
  else
  {
    v14 = +[LACError errorWithCode:-1004 debugDescription:@"User interaction is required"];
    v13 = [(LACEnvironmentMechanismUserPassword *)v12 initWithAvailabilityError:v14 set:v9];
  }
  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)LACEnvironmentMechanismUserPassword;
  id v4 = a3;
  [(LACEnvironmentMechanism *)&v7 encodeWithCoder:v4];
  BOOL v5 = [(LACEnvironmentMechanismUserPassword *)self set];
  objc_super v6 = NSStringFromSelector("set");
  [v4 encodeBool:v5 forKey:v6];
}

- (LACEnvironmentMechanismUserPassword)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = NSStringFromSelector(sel_availabilityError);
  objc_super v6 = [v4 decodeObjectForKey:v5];
  objc_super v7 = NSStringFromSelector("set");
  uint64_t v8 = [v4 decodeBoolForKey:v7];

  uint64_t v9 = [(LACEnvironmentMechanismUserPassword *)self initWithAvailabilityError:v6 set:v8];
  return v9;
}

- (id)descriptionDetails
{
  v6[1] = *MEMORY[0x263EF8340];
  BOOL v2 = [(LACEnvironmentMechanismUserPassword *)self set];
  v3 = @"not set";
  if (v2) {
    v3 = @"set";
  }
  v6[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LACEnvironmentMechanismUserPassword *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)LACEnvironmentMechanismUserPassword;
    if ([(LACEnvironmentMechanism *)&v10 isEqual:v4]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      BOOL v5 = v4;
      BOOL v6 = [(LACEnvironmentMechanismUserPassword *)self set];
      BOOL v7 = [(LACEnvironmentMechanismUserPassword *)v5 set];

      char v8 = v6 ^ v7 ^ 1;
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (BOOL)set
{
  return self->_set;
}

@end