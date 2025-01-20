@interface LACDTOMutableFeatureRequirements
+ (id)nullInstance;
- (BOOL)hasAPRequirements;
- (BOOL)hasBiometricEnrollments;
- (BOOL)hasHSA2Account;
- (BOOL)hasLocationServicesEnabled;
- (BOOL)hasPasscodeSet;
- (BOOL)hasSEPRequirements;
- (BOOL)isEqual:(id)a3;
- (LACDTOMutableFeatureRequirements)initWithRequirements:(id)a3;
- (NSString)description;
- (void)setHasBiometricEnrollments:(BOOL)a3;
- (void)setHasHSA2Account:(BOOL)a3;
- (void)setHasLocationServicesEnabled:(BOOL)a3;
- (void)setHasPasscodeSet:(BOOL)a3;
@end

@implementation LACDTOMutableFeatureRequirements

- (LACDTOMutableFeatureRequirements)initWithRequirements:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)LACDTOMutableFeatureRequirements;
  v5 = [(LACDTOMutableFeatureRequirements *)&v7 init];
  if (v5)
  {
    v5->_hasPasscodeSet = [v4 hasPasscodeSet];
    v5->_hasBiometricEnrollments = [v4 hasBiometricEnrollments];
    v5->_hasHSA2Account = [v4 hasHSA2Account];
    v5->_hasLocationServicesEnabled = [v4 hasLocationServicesEnabled];
  }

  return v5;
}

+ (id)nullInstance
{
  v2 = objc_alloc_init(LACDTOMutableFeatureRequirements);
  [(LACDTOMutableFeatureRequirements *)v2 setHasPasscodeSet:0];
  [(LACDTOMutableFeatureRequirements *)v2 setHasBiometricEnrollments:0];
  [(LACDTOMutableFeatureRequirements *)v2 setHasHSA2Account:0];
  [(LACDTOMutableFeatureRequirements *)v2 setHasLocationServicesEnabled:0];
  return v2;
}

- (BOOL)hasAPRequirements
{
  BOOL v3 = [(LACDTOMutableFeatureRequirements *)self hasPasscodeSet];
  char v4 = v3 & [(LACDTOMutableFeatureRequirements *)self hasBiometricEnrollments];
  BOOL v5 = [(LACDTOMutableFeatureRequirements *)self hasHSA2Account];
  return v4 & v5 & [(LACDTOMutableFeatureRequirements *)self hasLocationServicesEnabled];
}

- (BOOL)hasSEPRequirements
{
  BOOL v3 = [(LACDTOMutableFeatureRequirements *)self hasPasscodeSet];
  return v3 & [(LACDTOMutableFeatureRequirements *)self hasBiometricEnrollments];
}

- (NSString)description
{
  v27[6] = *MEMORY[0x263EF8340];
  v23 = NSString;
  uint64_t v21 = objc_opt_class();
  BOOL v3 = NSString;
  v26 = objc_msgSend(NSNumber, "numberWithBool:", -[LACDTOMutableFeatureRequirements hasPasscodeSet](self, "hasPasscodeSet"));
  v25 = [v3 stringWithFormat:@"hasPasscodeSet: %@", v26];
  v27[0] = v25;
  char v4 = NSString;
  v24 = objc_msgSend(NSNumber, "numberWithBool:", -[LACDTOMutableFeatureRequirements hasBiometricEnrollments](self, "hasBiometricEnrollments"));
  v22 = [v4 stringWithFormat:@"hasBiometricEnrollments: %@", v24];
  v27[1] = v22;
  BOOL v5 = NSString;
  v20 = objc_msgSend(NSNumber, "numberWithBool:", -[LACDTOMutableFeatureRequirements hasLocationServicesEnabled](self, "hasLocationServicesEnabled"));
  v6 = [v5 stringWithFormat:@"hasLocationServicesEnabled: %@", v20];
  v27[2] = v6;
  objc_super v7 = NSString;
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[LACDTOMutableFeatureRequirements hasHSA2Account](self, "hasHSA2Account"));
  v9 = [v7 stringWithFormat:@"hasHSA2Account: %@", v8];
  v27[3] = v9;
  v10 = NSString;
  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[LACDTOMutableFeatureRequirements hasSEPRequirements](self, "hasSEPRequirements"));
  v12 = [v10 stringWithFormat:@"hasSEPRequirements: %@", v11];
  v27[4] = v12;
  v13 = NSString;
  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[LACDTOMutableFeatureRequirements hasAPRequirements](self, "hasAPRequirements"));
  v15 = [v13 stringWithFormat:@"hasAPRequirements: %@", v14];
  v27[5] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:6];
  v17 = [v16 componentsJoinedByString:@"; "];
  v18 = [v23 stringWithFormat:@"<%@ %p; %@>", v21, self, v17];

  return (NSString *)v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_2704358D0])
  {
    id v5 = v4;
    int v6 = [(LACDTOMutableFeatureRequirements *)self hasPasscodeSet];
    if (v6 == [v5 hasPasscodeSet]
      && (int v7 = [(LACDTOMutableFeatureRequirements *)self hasBiometricEnrollments],
          v7 == [v5 hasBiometricEnrollments])
      && (int v8 = [(LACDTOMutableFeatureRequirements *)self hasLocationServicesEnabled],
          v8 == [v5 hasLocationServicesEnabled])
      && (int v9 = [(LACDTOMutableFeatureRequirements *)self hasHSA2Account],
          v9 == [v5 hasHSA2Account])
      && (int v10 = [(LACDTOMutableFeatureRequirements *)self hasSEPRequirements],
          v10 == [v5 hasSEPRequirements]))
    {
      BOOL v13 = [(LACDTOMutableFeatureRequirements *)self hasAPRequirements];
      int v11 = v13 ^ [v5 hasAPRequirements] ^ 1;
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (BOOL)hasPasscodeSet
{
  return self->_hasPasscodeSet;
}

- (void)setHasPasscodeSet:(BOOL)a3
{
  self->_hasPasscodeSet = a3;
}

- (BOOL)hasBiometricEnrollments
{
  return self->_hasBiometricEnrollments;
}

- (void)setHasBiometricEnrollments:(BOOL)a3
{
  self->_hasBiometricEnrollments = a3;
}

- (BOOL)hasLocationServicesEnabled
{
  return self->_hasLocationServicesEnabled;
}

- (void)setHasLocationServicesEnabled:(BOOL)a3
{
  self->_hasLocationServicesEnabled = a3;
}

- (BOOL)hasHSA2Account
{
  return self->_hasHSA2Account;
}

- (void)setHasHSA2Account:(BOOL)a3
{
  self->_hasHSA2Account = a3;
}

@end