@interface LACEnvironmentMechanism
+ (BOOL)supportsSecureCoding;
+ (id)environmentMechanismForUser:(unsigned int)a3 auditToken:(id *)a4 dependencies:(id)a5 error:(id *)a6;
- (BOOL)isEqual:(id)a3;
- (LACEnvironmentMechanism)initWithAvailabilityError:(id)a3 localizedName:(id)a4 iconSystemName:(id)a5;
- (LACEnvironmentMechanism)initWithCoder:(id)a3;
- (NSError)availabilityError;
- (NSString)iconSystemName;
- (NSString)localizedName;
- (id)description;
- (id)descriptionDetails;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LACEnvironmentMechanism

- (LACEnvironmentMechanism)initWithAvailabilityError:(id)a3 localizedName:(id)a4 iconSystemName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)LACEnvironmentMechanism;
  v12 = [(LACEnvironmentMechanism *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_availabilityError, a3);
    objc_storeStrong((id *)&v13->_localizedName, a4);
    objc_storeStrong((id *)&v13->_iconSystemName, a5);
  }

  return v13;
}

+ (id)environmentMechanismForUser:(unsigned int)a3 auditToken:(id *)a4 dependencies:(id)a5 error:(id *)a6
{
  if (a6)
  {
    *a6 = +[LACError errorWithCode:-1000, @"Call must be made on a subclass", a5 debugDescription];
  }
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LACEnvironmentMechanism *)self availabilityError];
  v6 = NSStringFromSelector(sel_availabilityError);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(LACEnvironmentMechanism *)self localizedName];
  v8 = NSStringFromSelector(sel_localizedName);
  [v4 encodeObject:v7 forKey:v8];

  id v10 = [(LACEnvironmentMechanism *)self iconSystemName];
  id v9 = NSStringFromSelector(sel_iconSystemName);
  [v4 encodeObject:v10 forKey:v9];
}

- (LACEnvironmentMechanism)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_availabilityError);
  v6 = [v4 decodeObjectForKey:v5];
  v7 = NSStringFromSelector(sel_localizedName);
  v8 = [v4 decodeObjectForKey:v7];
  id v9 = NSStringFromSelector(sel_iconSystemName);
  id v10 = [v4 decodeObjectForKey:v9];

  id v11 = [(LACEnvironmentMechanism *)self initWithAvailabilityError:v6 localizedName:v8 iconSystemName:v10];
  return v11;
}

- (id)description
{
  v3 = [(LACEnvironmentMechanism *)self descriptionDetails];
  id v4 = [(LACEnvironmentMechanism *)self availabilityError];
  if (+[LACError error:v4 hasCode:-1004])
  {
    v5 = @"usable";
  }
  else
  {
    v6 = NSString;
    v7 = [(LACEnvironmentMechanism *)self availabilityError];
    v8 = [v7 domain];
    id v9 = [(LACEnvironmentMechanism *)self availabilityError];
    v5 = [v6 stringWithFormat:@"%@ error %d", v8, objc_msgSend(v9, "code")];
  }
  id v10 = NSString;
  id v11 = [(LACEnvironmentMechanism *)self localizedName];
  v12 = [v3 componentsJoinedByString:@", "];
  v13 = [v10 stringWithFormat:@"<'%@' %@ (%@)>", v11, v5, v12];

  return v13;
}

- (id)descriptionDetails
{
  return (id)MEMORY[0x263EFFA68];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LACEnvironmentMechanism *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(LACEnvironmentMechanism *)self availabilityError];
      uint64_t v7 = [(LACEnvironmentMechanism *)v5 availabilityError];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        v8 = (void *)v7;
        id v9 = [(LACEnvironmentMechanism *)self availabilityError];
        id v10 = [(LACEnvironmentMechanism *)v5 availabilityError];
        int v11 = [v9 isEqual:v10];

        if (!v11) {
          goto LABEL_11;
        }
      }
      v13 = [(LACEnvironmentMechanism *)self localizedName];
      uint64_t v14 = [(LACEnvironmentMechanism *)v5 localizedName];
      if (v13 == (void *)v14)
      {
      }
      else
      {
        objc_super v15 = (void *)v14;
        v16 = [(LACEnvironmentMechanism *)self localizedName];
        v17 = [(LACEnvironmentMechanism *)v5 localizedName];
        int v18 = [v16 isEqualToString:v17];

        if (!v18)
        {
LABEL_11:
          char v12 = 0;
LABEL_17:

          goto LABEL_18;
        }
      }
      v19 = [(LACEnvironmentMechanism *)self iconSystemName];
      uint64_t v20 = [(LACEnvironmentMechanism *)v5 iconSystemName];
      if (v19 == (void *)v20)
      {
        char v12 = 1;
        v21 = v19;
      }
      else
      {
        v21 = (void *)v20;
        v22 = [(LACEnvironmentMechanism *)self iconSystemName];
        v23 = [(LACEnvironmentMechanism *)v5 iconSystemName];
        char v12 = [v22 isEqualToString:v23];
      }
      goto LABEL_17;
    }
    char v12 = 0;
  }
LABEL_18:

  return v12;
}

- (NSError)availabilityError
{
  return self->_availabilityError;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (NSString)iconSystemName
{
  return self->_iconSystemName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconSystemName, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_availabilityError, 0);
}

@end