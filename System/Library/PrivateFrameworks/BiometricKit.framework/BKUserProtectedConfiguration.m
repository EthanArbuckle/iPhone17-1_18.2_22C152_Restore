@interface BKUserProtectedConfiguration
- (BKUserProtectedConfiguration)initWithDictionary:(id)a3 effective:(BOOL)a4;
- (NSNumber)applePayEnabled;
- (NSNumber)attentionDetectionEnabled;
- (NSNumber)identificationEnabled;
- (NSNumber)loginEnabled;
- (NSNumber)periocularFaceIDMatchEnabled;
- (NSNumber)unlockEnabled;
- (id)description;
- (id)dictionary;
- (void)setApplePayEnabled:(id)a3;
- (void)setAttentionDetectionEnabled:(id)a3;
- (void)setIdentificationEnabled:(id)a3;
- (void)setLoginEnabled:(id)a3;
- (void)setPeriocularFaceIDMatchEnabled:(id)a3;
- (void)setUnlockEnabled:(id)a3;
@end

@implementation BKUserProtectedConfiguration

- (BKUserProtectedConfiguration)initWithDictionary:(id)a3 effective:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v28.receiver = self;
  v28.super_class = (Class)BKUserProtectedConfiguration;
  v7 = [(BKUserProtectedConfiguration *)&v28 init];
  v8 = v7;
  if (v6 && v7)
  {
    if (v4) {
      v9 = @"BKUserCfgEffectiveTouchIDUnlockEnabled";
    }
    else {
      v9 = @"BKUserCfgTouchIDUnlockEnabled";
    }
    if (v4) {
      v10 = @"BKUserCfgEffectiveTouchIDIdentificationEnabled";
    }
    else {
      v10 = @"BKUserCfgTouchIDIdentificationEnabled";
    }
    if (v4) {
      v11 = @"BKUserCfgEffectiveTouchIDLoginEnabled";
    }
    else {
      v11 = @"BKUserCfgTouchIDLoginEnabled";
    }
    if (v4) {
      v12 = @"BKUserCfgEffectiveTouchIDApplePayEnabled";
    }
    else {
      v12 = @"BKUserCfgTouchIDApplePayEnabled";
    }
    if (v4) {
      v13 = @"BKUserCfgEffectiveAttentionDetectionEnabled";
    }
    else {
      v13 = @"BKUserCfgAttentionDetectionEnabled";
    }
    if (v4) {
      v14 = @"BKUserCfgEffectivePeriocularMatchEnabled";
    }
    else {
      v14 = @"BKUserCfgPeriocularMatchEnabled";
    }
    uint64_t v15 = [v6 objectForKeyedSubscript:v9];
    unlockEnabled = v8->_unlockEnabled;
    v8->_unlockEnabled = (NSNumber *)v15;

    uint64_t v17 = [v6 objectForKeyedSubscript:v10];
    identificationEnabled = v8->_identificationEnabled;
    v8->_identificationEnabled = (NSNumber *)v17;

    uint64_t v19 = [v6 objectForKeyedSubscript:v11];
    loginEnabled = v8->_loginEnabled;
    v8->_loginEnabled = (NSNumber *)v19;

    uint64_t v21 = [v6 objectForKeyedSubscript:v12];
    applePayEnabled = v8->_applePayEnabled;
    v8->_applePayEnabled = (NSNumber *)v21;

    uint64_t v23 = [v6 objectForKeyedSubscript:v13];
    attentionDetectionEnabled = v8->_attentionDetectionEnabled;
    v8->_attentionDetectionEnabled = (NSNumber *)v23;

    uint64_t v25 = [v6 objectForKeyedSubscript:v14];
    periocularFaceIDMatchEnabled = v8->_periocularFaceIDMatchEnabled;
    v8->_periocularFaceIDMatchEnabled = (NSNumber *)v25;
  }
  return v8;
}

- (id)dictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  BOOL v4 = v3;
  unlockEnabled = self->_unlockEnabled;
  if (unlockEnabled) {
    [v3 setObject:unlockEnabled forKey:@"BKUserCfgTouchIDUnlockEnabled"];
  }
  identificationEnabled = self->_identificationEnabled;
  if (identificationEnabled) {
    [v4 setObject:identificationEnabled forKey:@"BKUserCfgTouchIDIdentificationEnabled"];
  }
  loginEnabled = self->_loginEnabled;
  if (loginEnabled) {
    [v4 setObject:loginEnabled forKey:@"BKUserCfgTouchIDLoginEnabled"];
  }
  applePayEnabled = self->_applePayEnabled;
  if (applePayEnabled) {
    [v4 setObject:applePayEnabled forKey:@"BKUserCfgTouchIDApplePayEnabled"];
  }
  attentionDetectionEnabled = self->_attentionDetectionEnabled;
  if (attentionDetectionEnabled) {
    [v4 setObject:attentionDetectionEnabled forKey:@"BKUserCfgAttentionDetectionEnabled"];
  }
  periocularFaceIDMatchEnabled = self->_periocularFaceIDMatchEnabled;
  if (periocularFaceIDMatchEnabled) {
    [v4 setObject:periocularFaceIDMatchEnabled forKey:@"BKUserCfgPeriocularMatchEnabled"];
  }
  return v4;
}

- (id)description
{
  v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: %p:(unlockEnabled:%@, identificationEnabled:%@, loginEnabled:%@, applePayEnabled:%@, attentionDetectionEnabled:%@, periocularFaceIDMatchEnabled:%@)>", v5, self, self->_unlockEnabled, self->_identificationEnabled, self->_loginEnabled, self->_applePayEnabled, self->_attentionDetectionEnabled, self->_periocularFaceIDMatchEnabled];

  return v6;
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

- (NSNumber)applePayEnabled
{
  return self->_applePayEnabled;
}

- (void)setApplePayEnabled:(id)a3
{
}

- (NSNumber)attentionDetectionEnabled
{
  return self->_attentionDetectionEnabled;
}

- (void)setAttentionDetectionEnabled:(id)a3
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
  objc_storeStrong((id *)&self->_attentionDetectionEnabled, 0);
  objc_storeStrong((id *)&self->_applePayEnabled, 0);
  objc_storeStrong((id *)&self->_loginEnabled, 0);
  objc_storeStrong((id *)&self->_identificationEnabled, 0);
  objc_storeStrong((id *)&self->_unlockEnabled, 0);
}

@end