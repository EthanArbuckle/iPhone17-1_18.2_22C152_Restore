@interface DMFSecurityInformation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)passcodeIsCompliantWithGlobalRestrictions;
- (BOOL)passcodeIsCompliantWithProfileRestrictions;
- (BOOL)passcodeIsSet;
- (BOOL)supportsBlockLevelEncryption;
- (BOOL)supportsFileLevelEncryption;
- (DMFSecurityInformation)initWithCoder:(id)a3;
- (DMFSecurityInformation)initWithSupportsBlockLevelEncryption:(BOOL)a3 supportsFileLevelEncryption:(BOOL)a4 passcodeIsSet:(BOOL)a5 passcodeIsCompliantWithGlobalRestrictions:(BOOL)a6 passcodeIsCompliantWithProfileRestrictions:(BOOL)a7 passcodeLockGracePeriodEnforced:(unint64_t)a8 passcodeLockGracePeriod:(unint64_t)a9;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)passcodeLockGracePeriod;
- (unint64_t)passcodeLockGracePeriodEnforced;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DMFSecurityInformation

- (DMFSecurityInformation)initWithSupportsBlockLevelEncryption:(BOOL)a3 supportsFileLevelEncryption:(BOOL)a4 passcodeIsSet:(BOOL)a5 passcodeIsCompliantWithGlobalRestrictions:(BOOL)a6 passcodeIsCompliantWithProfileRestrictions:(BOOL)a7 passcodeLockGracePeriodEnforced:(unint64_t)a8 passcodeLockGracePeriod:(unint64_t)a9
{
  v16.receiver = self;
  v16.super_class = (Class)DMFSecurityInformation;
  result = [(DMFSecurityInformation *)&v16 init];
  if (result)
  {
    result->_supportsBlockLevelEncryption = a3;
    result->_supportsFileLevelEncryption = a4;
    result->_passcodeIsSet = a5;
    result->_passcodeIsCompliantWithGlobalRestrictions = a6;
    result->_passcodeIsCompliantWithProfileRestrictions = a7;
    result->_passcodeLockGracePeriod = a9;
    result->_passcodeLockGracePeriodEnforced = a8;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSupportsBlockLevelEncryption:supportsFileLevelEncryption:passcodeIsSet:passcodeIsCompliantWithGlobalRestrictions:passcodeIsCompliantWithProfileRestrictions:passcodeLockGracePeriodEnforced:passcodeLockGracePeriod:", -[DMFSecurityInformation supportsBlockLevelEncryption](self, "supportsBlockLevelEncryption"), -[DMFSecurityInformation supportsFileLevelEncryption](self, "supportsFileLevelEncryption"), -[DMFSecurityInformation passcodeIsSet](self, "passcodeIsSet"), -[DMFSecurityInformation passcodeIsCompliantWithGlobalRestrictions](self, "passcodeIsCompliantWithGlobalRestrictions"), -[DMFSecurityInformation passcodeIsCompliantWithProfileRestrictions](self, "passcodeIsCompliantWithProfileRestrictions"), -[DMFSecurityInformation passcodeLockGracePeriodEnforced](self, "passcodeLockGracePeriodEnforced"), -[DMFSecurityInformation passcodeLockGracePeriod](self, "passcodeLockGracePeriod"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFSecurityInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DMFSecurityInformation;
  v5 = [(DMFSecurityInformation *)&v14 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"supportsBlockLevelEncryption"];
    v5->_supportsBlockLevelEncryption = [v6 BOOLValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"supportsFileLevelEncryption"];
    v5->_supportsFileLevelEncryption = [v7 BOOLValue];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passcodeIsSet"];
    v5->_passcodeIsSet = [v8 BOOLValue];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passcodeIsCompliantWithGlobalRestrictions"];
    v5->_passcodeIsCompliantWithGlobalRestrictions = [v9 BOOLValue];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passcodeIsCompliantWithProfileRestrictions"];
    v5->_passcodeIsCompliantWithProfileRestrictions = [v10 BOOLValue];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passcodeLockGracePeriodEnforced"];
    v5->_passcodeLockGracePeriodEnforced = [v11 unsignedIntegerValue];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passcodeLockGracePeriod"];
    v5->_passcodeLockGracePeriod = [v12 unsignedIntegerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithBool:", -[DMFSecurityInformation supportsBlockLevelEncryption](self, "supportsBlockLevelEncryption"));
  [v5 encodeObject:v6 forKey:@"supportsBlockLevelEncryption"];

  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[DMFSecurityInformation supportsFileLevelEncryption](self, "supportsFileLevelEncryption"));
  [v5 encodeObject:v7 forKey:@"supportsFileLevelEncryption"];

  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[DMFSecurityInformation passcodeIsSet](self, "passcodeIsSet"));
  [v5 encodeObject:v8 forKey:@"passcodeIsSet"];

  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[DMFSecurityInformation passcodeIsCompliantWithGlobalRestrictions](self, "passcodeIsCompliantWithGlobalRestrictions"));
  [v5 encodeObject:v9 forKey:@"passcodeIsCompliantWithGlobalRestrictions"];

  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[DMFSecurityInformation passcodeIsCompliantWithProfileRestrictions](self, "passcodeIsCompliantWithProfileRestrictions"));
  [v5 encodeObject:v10 forKey:@"passcodeIsCompliantWithProfileRestrictions"];

  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DMFSecurityInformation passcodeLockGracePeriodEnforced](self, "passcodeLockGracePeriodEnforced"));
  [v5 encodeObject:v11 forKey:@"passcodeLockGracePeriodEnforced"];

  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DMFSecurityInformation passcodeLockGracePeriod](self, "passcodeLockGracePeriod"));
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v12 forKey:@"passcodeLockGracePeriod"];
}

- (unint64_t)hash
{
  BOOL v3 = [(DMFSecurityInformation *)self supportsBlockLevelEncryption];
  int v4 = v3 ^ [(DMFSecurityInformation *)self supportsFileLevelEncryption];
  BOOL v5 = [(DMFSecurityInformation *)self passcodeIsSet];
  int v6 = v5 ^ [(DMFSecurityInformation *)self passcodeIsCompliantWithGlobalRestrictions] ^ v4;
  uint64_t v7 = [(DMFSecurityInformation *)self passcodeIsCompliantWithProfileRestrictions] ^ v6 ^ 1;
  unint64_t v8 = [(DMFSecurityInformation *)self passcodeLockGracePeriodEnforced];
  return v8 ^ [(DMFSecurityInformation *)self passcodeLockGracePeriod] ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (DMFSecurityInformation *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = v4;
      BOOL v6 = [(DMFSecurityInformation *)self supportsBlockLevelEncryption];
      if (v6 == [(DMFSecurityInformation *)v5 supportsBlockLevelEncryption]
        && (BOOL v7 = [(DMFSecurityInformation *)self supportsFileLevelEncryption],
            v7 == [(DMFSecurityInformation *)v5 supportsFileLevelEncryption])
        && (BOOL v8 = [(DMFSecurityInformation *)self passcodeIsSet],
            v8 == [(DMFSecurityInformation *)v5 passcodeIsSet])
        && (BOOL v9 = [(DMFSecurityInformation *)self passcodeIsCompliantWithGlobalRestrictions], v9 == [(DMFSecurityInformation *)v5 passcodeIsCompliantWithGlobalRestrictions])&& (v10 = [(DMFSecurityInformation *)self passcodeIsCompliantWithProfileRestrictions], v10 == [(DMFSecurityInformation *)v5 passcodeIsCompliantWithProfileRestrictions])&& (v11 = [(DMFSecurityInformation *)self passcodeLockGracePeriodEnforced], v11 == [(DMFSecurityInformation *)v5 passcodeLockGracePeriodEnforced]))
      {
        unint64_t v12 = [(DMFSecurityInformation *)self passcodeLockGracePeriod];
        BOOL v13 = v12 == [(DMFSecurityInformation *)v5 passcodeLockGracePeriod];
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (id)description
{
  BOOL v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@:%p {\n", objc_opt_class(), self];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__DMFSecurityInformation_description__block_invoke;
  v8[3] = &unk_1E6372DE8;
  id v9 = v3;
  id v4 = v3;
  BOOL v5 = (void (**)(void, void, void))MEMORY[0x1C188B2F0](v8);
  ((void (**)(void, __CFString *, BOOL))v5)[2](v5, @"Supports Block Level Encryption                ", [(DMFSecurityInformation *)self supportsBlockLevelEncryption]);
  ((void (**)(void, __CFString *, BOOL))v5)[2](v5, @"Supports File Level Encryption                 ", [(DMFSecurityInformation *)self supportsFileLevelEncryption]);
  ((void (**)(void, __CFString *, BOOL))v5)[2](v5, @"Passcode Is Set                                ", [(DMFSecurityInformation *)self passcodeIsSet]);
  ((void (**)(void, __CFString *, BOOL))v5)[2](v5, @"Passcode is Compliant With Global Restrictions ", [(DMFSecurityInformation *)self passcodeIsCompliantWithGlobalRestrictions]);
  ((void (**)(void, __CFString *, BOOL))v5)[2](v5, @"Passcode is Compliant With Profile Restrictions", [(DMFSecurityInformation *)self passcodeIsCompliantWithProfileRestrictions]);
  objc_msgSend(v4, "appendFormat:", @"Passcode Lock Grace Period Enforced             : %lu\n", -[DMFSecurityInformation passcodeLockGracePeriodEnforced](self, "passcodeLockGracePeriodEnforced"));
  objc_msgSend(v4, "appendFormat:", @"Passcode Lock Grace Period                      : %lu\n", -[DMFSecurityInformation passcodeLockGracePeriod](self, "passcodeLockGracePeriod"));
  [v4 appendString:@"}>"];
  BOOL v6 = (void *)[v4 copy];

  return v6;
}

uint64_t __37__DMFSecurityInformation_description__block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = @"NO";
  if (a3) {
    id v4 = @"YES";
  }
  return [v3 appendFormat:@"\t%@ : %@\n", a2, v4];
}

- (BOOL)supportsBlockLevelEncryption
{
  return self->_supportsBlockLevelEncryption;
}

- (BOOL)supportsFileLevelEncryption
{
  return self->_supportsFileLevelEncryption;
}

- (BOOL)passcodeIsSet
{
  return self->_passcodeIsSet;
}

- (BOOL)passcodeIsCompliantWithGlobalRestrictions
{
  return self->_passcodeIsCompliantWithGlobalRestrictions;
}

- (BOOL)passcodeIsCompliantWithProfileRestrictions
{
  return self->_passcodeIsCompliantWithProfileRestrictions;
}

- (unint64_t)passcodeLockGracePeriod
{
  return self->_passcodeLockGracePeriod;
}

- (unint64_t)passcodeLockGracePeriodEnforced
{
  return self->_passcodeLockGracePeriodEnforced;
}

@end