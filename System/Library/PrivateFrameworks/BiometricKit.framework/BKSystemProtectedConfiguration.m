@interface BKSystemProtectedConfiguration
- (BKSystemProtectedConfiguration)initWithDictionary:(id)a3;
- (NSNumber)bioMatchLifespan;
- (NSNumber)biometryEnabled;
- (NSNumber)identificationEnabled;
- (NSNumber)loginEnabled;
- (NSNumber)passcodeInputLifespan;
- (NSNumber)periocularFaceIDMatchEnabled;
- (NSNumber)unlockEnabled;
- (NSNumber)unlockTokenMaxLifetime;
- (id)description;
- (id)dictionary;
- (void)setBioMatchLifespan:(id)a3;
- (void)setBiometryEnabled:(id)a3;
- (void)setIdentificationEnabled:(id)a3;
- (void)setLoginEnabled:(id)a3;
- (void)setPasscodeInputLifespan:(id)a3;
- (void)setPeriocularFaceIDMatchEnabled:(id)a3;
- (void)setUnlockEnabled:(id)a3;
- (void)setUnlockTokenMaxLifetime:(id)a3;
@end

@implementation BKSystemProtectedConfiguration

- (BKSystemProtectedConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BKSystemProtectedConfiguration;
  v5 = [(BKSystemProtectedConfiguration *)&v24 init];
  v6 = v5;
  if (v4 && v5)
  {
    uint64_t v7 = [v4 objectForKeyedSubscript:@"BKSysCfgTouchIDEnabled"];
    biometryEnabled = v6->_biometryEnabled;
    v6->_biometryEnabled = (NSNumber *)v7;

    uint64_t v9 = [v4 objectForKeyedSubscript:@"BKSysCfgTouchIDUnlockEnabled"];
    unlockEnabled = v6->_unlockEnabled;
    v6->_unlockEnabled = (NSNumber *)v9;

    uint64_t v11 = [v4 objectForKeyedSubscript:@"BKSysCfgTouchIDIdentificationEnabled"];
    identificationEnabled = v6->_identificationEnabled;
    v6->_identificationEnabled = (NSNumber *)v11;

    uint64_t v13 = [v4 objectForKeyedSubscript:@"BKSysCfgTouchIDLoginEnabled"];
    loginEnabled = v6->_loginEnabled;
    v6->_loginEnabled = (NSNumber *)v13;

    uint64_t v15 = [v4 objectForKeyedSubscript:@"BKSysCfgTouchIDUnlockTokenMaxLifetime"];
    unlockTokenMaxLifetime = v6->_unlockTokenMaxLifetime;
    v6->_unlockTokenMaxLifetime = (NSNumber *)v15;

    uint64_t v17 = [v4 objectForKeyedSubscript:@"BKSysCfgTouchIDBioMatchLifespan"];
    bioMatchLifespan = v6->_bioMatchLifespan;
    v6->_bioMatchLifespan = (NSNumber *)v17;

    uint64_t v19 = [v4 objectForKeyedSubscript:@"BKSysCfgTouchIDPasscodeInputLifespan"];
    passcodeInputLifespan = v6->_passcodeInputLifespan;
    v6->_passcodeInputLifespan = (NSNumber *)v19;

    uint64_t v21 = [v4 objectForKeyedSubscript:@"BKSysCfgPeriocularMatchEnabled"];
    periocularFaceIDMatchEnabled = v6->_periocularFaceIDMatchEnabled;
    v6->_periocularFaceIDMatchEnabled = (NSNumber *)v21;
  }
  return v6;
}

- (id)dictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  biometryEnabled = self->_biometryEnabled;
  if (biometryEnabled) {
    [v3 setObject:biometryEnabled forKey:@"BKSysCfgTouchIDEnabled"];
  }
  unlockEnabled = self->_unlockEnabled;
  if (unlockEnabled) {
    [v4 setObject:unlockEnabled forKey:@"BKSysCfgTouchIDUnlockEnabled"];
  }
  identificationEnabled = self->_identificationEnabled;
  if (identificationEnabled) {
    [v4 setObject:identificationEnabled forKey:@"BKSysCfgTouchIDIdentificationEnabled"];
  }
  loginEnabled = self->_loginEnabled;
  if (loginEnabled) {
    [v4 setObject:loginEnabled forKey:@"BKSysCfgTouchIDLoginEnabled"];
  }
  unlockTokenMaxLifetime = self->_unlockTokenMaxLifetime;
  if (unlockTokenMaxLifetime) {
    [v4 setObject:unlockTokenMaxLifetime forKey:@"BKSysCfgTouchIDUnlockTokenMaxLifetime"];
  }
  bioMatchLifespan = self->_bioMatchLifespan;
  if (bioMatchLifespan) {
    [v4 setObject:bioMatchLifespan forKey:@"BKSysCfgTouchIDBioMatchLifespan"];
  }
  passcodeInputLifespan = self->_passcodeInputLifespan;
  if (passcodeInputLifespan) {
    [v4 setObject:passcodeInputLifespan forKey:@"BKSysCfgTouchIDPasscodeInputLifespan"];
  }
  periocularFaceIDMatchEnabled = self->_periocularFaceIDMatchEnabled;
  if (periocularFaceIDMatchEnabled) {
    [v4 setObject:periocularFaceIDMatchEnabled forKey:@"BKSysCfgPeriocularMatchEnabled"];
  }
  return v4;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p:(biometryEnabled:%@, unlockEnabled:%@, identificationEnabled:%@, loginEnabled:%@, unlockTokenMaxLifetime:%@, bioMatchLifespan:%@, passcodeInputLifespan:%@, periocularFaceIDMatchEnabled:%@)>", v5, self, self->_biometryEnabled, self->_unlockEnabled, self->_identificationEnabled, self->_loginEnabled, self->_unlockTokenMaxLifetime, self->_bioMatchLifespan, self->_passcodeInputLifespan, self->_periocularFaceIDMatchEnabled];

  return v6;
}

- (NSNumber)biometryEnabled
{
  return self->_biometryEnabled;
}

- (void)setBiometryEnabled:(id)a3
{
}

- (NSNumber)unlockEnabled
{
  return self->_unlockEnabled;
}

- (void)setUnlockEnabled:(id)a3
{
}

- (NSNumber)identificationEnabled
{
  return self->_identificationEnabled;
}

- (void)setIdentificationEnabled:(id)a3
{
}

- (NSNumber)loginEnabled
{
  return self->_loginEnabled;
}

- (void)setLoginEnabled:(id)a3
{
}

- (NSNumber)unlockTokenMaxLifetime
{
  return self->_unlockTokenMaxLifetime;
}

- (void)setUnlockTokenMaxLifetime:(id)a3
{
}

- (NSNumber)bioMatchLifespan
{
  return self->_bioMatchLifespan;
}

- (void)setBioMatchLifespan:(id)a3
{
}

- (NSNumber)passcodeInputLifespan
{
  return self->_passcodeInputLifespan;
}

- (void)setPasscodeInputLifespan:(id)a3
{
}

- (NSNumber)periocularFaceIDMatchEnabled
{
  return self->_periocularFaceIDMatchEnabled;
}

- (void)setPeriocularFaceIDMatchEnabled:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_periocularFaceIDMatchEnabled, 0);
  objc_storeStrong((id *)&self->_passcodeInputLifespan, 0);
  objc_storeStrong((id *)&self->_bioMatchLifespan, 0);
  objc_storeStrong((id *)&self->_unlockTokenMaxLifetime, 0);
  objc_storeStrong((id *)&self->_loginEnabled, 0);
  objc_storeStrong((id *)&self->_identificationEnabled, 0);
  objc_storeStrong((id *)&self->_unlockEnabled, 0);
  objc_storeStrong((id *)&self->_biometryEnabled, 0);
}

@end