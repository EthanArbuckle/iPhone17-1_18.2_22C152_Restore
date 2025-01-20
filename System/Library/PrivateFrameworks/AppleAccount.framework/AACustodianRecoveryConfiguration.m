@interface AACustodianRecoveryConfiguration
+ (BOOL)supportsSecureCoding;
- (AACustodianRecoveryConfiguration)initWithCoder:(id)a3;
- (AACustodianRecoveryConfiguration)initWithConfigurationDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)codeLength;
- (int64_t)maxSessionTime;
- (void)encodeWithCoder:(id)a3;
- (void)setCodeLength:(int64_t)a3;
- (void)setMaxSessionTime:(int64_t)a3;
@end

@implementation AACustodianRecoveryConfiguration

- (AACustodianRecoveryConfiguration)initWithConfigurationDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AACustodianRecoveryConfiguration;
  v5 = [(AACustodianRecoveryConfiguration *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"codeLength"];
    v5->_codeLength = [v6 integerValue];
    v7 = [v4 objectForKeyedSubscript:@"maxSessionTTL"];
    v5->_maxSessionTime = [v7 integerValue];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AACustodianRecoveryConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AACustodianRecoveryConfiguration;
  v5 = [(AACustodianRecoveryConfiguration *)&v7 init];
  if (v5)
  {
    v5->_codeLength = [v4 decodeIntegerForKey:@"codeLength"];
    v5->_maxSessionTime = [v4 decodeIntegerForKey:@"maxSessionTTL"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t codeLength = self->_codeLength;
  id v5 = a3;
  [v5 encodeInteger:codeLength forKey:@"codeLength"];
  [v5 encodeInteger:self->_maxSessionTime forKey:@"maxSessionTTL"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [+[AACustodianRecoveryConfiguration allocWithZone:a3] init];
  *((void *)result + 1) = self->_codeLength;
  *((void *)result + 2) = self->_maxSessionTime;
  return result;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [NSNumber numberWithInteger:self->_codeLength];
  v6 = [NSNumber numberWithInteger:self->_maxSessionTime];
  objc_super v7 = [v3 stringWithFormat:@"<%@: %p> codeLength: %@, maxSessionTime: %@", v4, self, v5, v6];

  return v7;
}

- (int64_t)codeLength
{
  return self->_codeLength;
}

- (void)setCodeLength:(int64_t)a3
{
  self->_int64_t codeLength = a3;
}

- (int64_t)maxSessionTime
{
  return self->_maxSessionTime;
}

- (void)setMaxSessionTime:(int64_t)a3
{
  self->_maxSessionTime = a3;
}

@end