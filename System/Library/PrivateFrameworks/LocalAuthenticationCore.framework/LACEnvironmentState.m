@interface LACEnvironmentState
+ (BOOL)supportsSecureCoding;
+ (id)companionsForUser:(unsigned int)a3;
+ (id)environmentStateForUser:(unsigned int)a3 auditToken:(id *)a4 dependencies:(id)a5 error:(id *)a6;
- (BOOL)isEqual:(id)a3;
- (LACEnvironmentMechanismBiometry)biometry;
- (LACEnvironmentMechanismUserPassword)userPassword;
- (LACEnvironmentState)initWithBiometry:(id)a3 userPassword:(id)a4 companions:(id)a5;
- (LACEnvironmentState)initWithCoder:(id)a3;
- (NSArray)companions;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setBiometry:(id)a3;
- (void)setCompanions:(id)a3;
- (void)setUserPassword:(id)a3;
@end

@implementation LACEnvironmentState

- (LACEnvironmentState)initWithBiometry:(id)a3 userPassword:(id)a4 companions:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)LACEnvironmentState;
  v12 = [(LACEnvironmentState *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_biometry, a3);
    objc_storeStrong((id *)&v13->_userPassword, a4);
    objc_storeStrong((id *)&v13->_companions, a5);
  }

  return v13;
}

+ (id)environmentStateForUser:(unsigned int)a3 auditToken:(id *)a4 dependencies:(id)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a3;
  id v9 = a5;
  id v10 = [LACEnvironmentState alloc];
  long long v11 = *(_OWORD *)&a4->var0[4];
  long long v18 = *(_OWORD *)a4->var0;
  long long v19 = v11;
  v12 = +[LACEnvironmentMechanismBiometry environmentMechanismForUser:v7 auditToken:&v18 dependencies:v9 error:0];
  long long v13 = *(_OWORD *)&a4->var0[4];
  long long v18 = *(_OWORD *)a4->var0;
  long long v19 = v13;
  v14 = +[LACEnvironmentMechanismUserPassword environmentMechanismForUser:v7 auditToken:&v18 dependencies:v9 error:0];

  objc_super v15 = [a1 companionsForUser:v7];
  v16 = [(LACEnvironmentState *)v10 initWithBiometry:v12 userPassword:v14 companions:v15];

  return v16;
}

+ (id)companionsForUser:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = objc_opt_new();
  v5 = +[LACEnvironmentMechanismCompanion companionForUser:v3 type:1 error:0];
  if (v5) {
    [v4 addObject:v5];
  }
  v6 = +[LACEnvironmentMechanismCompanion companionForUser:v3 type:2 error:0];
  if (v6) {
    [v4 addObject:v6];
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LACEnvironmentState *)self biometry];
  v6 = NSStringFromSelector(sel_biometry);
  [v4 encodeObject:v5 forKey:v6];

  uint64_t v7 = [(LACEnvironmentState *)self userPassword];
  v8 = NSStringFromSelector(sel_userPassword);
  [v4 encodeObject:v7 forKey:v8];

  id v10 = [(LACEnvironmentState *)self companions];
  id v9 = NSStringFromSelector(sel_companions);
  [v4 encodeObject:v10 forKey:v9];
}

- (LACEnvironmentState)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_biometry);
  v6 = [v4 decodeObjectForKey:v5];
  uint64_t v7 = NSStringFromSelector(sel_userPassword);
  v8 = [v4 decodeObjectForKey:v7];
  id v9 = NSStringFromSelector(sel_companions);
  id v10 = [v4 decodeObjectForKey:v9];

  long long v11 = [(LACEnvironmentState *)self initWithBiometry:v6 userPassword:v8 companions:v10];
  return v11;
}

- (id)description
{
  v18[3] = *MEMORY[0x263EF8340];
  v17 = NSString;
  uint64_t v3 = objc_opt_class();
  id v4 = NSString;
  v5 = [(LACEnvironmentState *)self biometry];
  v6 = [v4 stringWithFormat:@"biometry: %@", v5];
  v18[0] = v6;
  uint64_t v7 = NSString;
  v8 = [(LACEnvironmentState *)self userPassword];
  id v9 = [v7 stringWithFormat:@"userPassword: %@", v8];
  v18[1] = v9;
  id v10 = NSString;
  long long v11 = [(LACEnvironmentState *)self companions];
  v12 = [v10 stringWithFormat:@"companions: %@", v11];
  v18[2] = v12;
  long long v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:3];
  v14 = [v13 componentsJoinedByString:@"; "];
  objc_super v15 = [v17 stringWithFormat:@"<%@ %p; %@>", v3, self, v14];

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LACEnvironmentState *)a3;
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
      v6 = [(LACEnvironmentState *)self biometry];
      uint64_t v7 = [(LACEnvironmentState *)v5 biometry];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        v8 = (void *)v7;
        id v9 = [(LACEnvironmentState *)self biometry];
        id v10 = [(LACEnvironmentState *)v5 biometry];
        int v11 = [v9 isEqual:v10];

        if (!v11) {
          goto LABEL_11;
        }
      }
      long long v13 = [(LACEnvironmentState *)self userPassword];
      uint64_t v14 = [(LACEnvironmentState *)v5 userPassword];
      if (v13 == (void *)v14)
      {
      }
      else
      {
        objc_super v15 = (void *)v14;
        v16 = [(LACEnvironmentState *)self userPassword];
        v17 = [(LACEnvironmentState *)v5 userPassword];
        int v18 = [v16 isEqual:v17];

        if (!v18)
        {
LABEL_11:
          char v12 = 0;
LABEL_17:

          goto LABEL_18;
        }
      }
      long long v19 = [(LACEnvironmentState *)self companions];
      uint64_t v20 = [(LACEnvironmentState *)v5 companions];
      if (v19 == (void *)v20)
      {
        char v12 = 1;
        v21 = v19;
      }
      else
      {
        v21 = (void *)v20;
        v22 = [(LACEnvironmentState *)self companions];
        v23 = [(LACEnvironmentState *)v5 companions];
        char v12 = [v22 isEqualToArray:v23];
      }
      goto LABEL_17;
    }
    char v12 = 0;
  }
LABEL_18:

  return v12;
}

- (LACEnvironmentMechanismBiometry)biometry
{
  return self->_biometry;
}

- (void)setBiometry:(id)a3
{
}

- (LACEnvironmentMechanismUserPassword)userPassword
{
  return self->_userPassword;
}

- (void)setUserPassword:(id)a3
{
}

- (NSArray)companions
{
  return self->_companions;
}

- (void)setCompanions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companions, 0);
  objc_storeStrong((id *)&self->_userPassword, 0);
  objc_storeStrong((id *)&self->_biometry, 0);
}

@end