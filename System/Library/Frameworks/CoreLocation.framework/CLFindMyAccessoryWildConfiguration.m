@interface CLFindMyAccessoryWildConfiguration
+ (BOOL)supportsSecureCoding;
- (CLFindMyAccessoryWildConfiguration)init;
- (CLFindMyAccessoryWildConfiguration)initWithCoder:(id)a3;
- (CLFindMyAccessoryWildConfiguration)initWithDesiredNextKeyRollDate:(id)a3 keyRollInterval:(unsigned int)a4 keysRemainingInWildPeriod:(unsigned __int16)a5 wildPeriodKeyCount:(unsigned __int16)a6;
- (NSDate)desiredKeyRollDate;
- (id)description;
- (id)encodeConfiguration;
- (unsigned)keyCount;
- (unsigned)keyRollInterval;
- (unsigned)keysRemaining;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLFindMyAccessoryWildConfiguration

- (CLFindMyAccessoryWildConfiguration)init
{
  return 0;
}

- (CLFindMyAccessoryWildConfiguration)initWithDesiredNextKeyRollDate:(id)a3 keyRollInterval:(unsigned int)a4 keysRemainingInWildPeriod:(unsigned __int16)a5 wildPeriodKeyCount:(unsigned __int16)a6
{
  v12.receiver = self;
  v12.super_class = (Class)CLFindMyAccessoryWildConfiguration;
  v10 = [(CLFindMyAccessoryWildConfiguration *)&v12 init];
  if (v10)
  {
    v10->_desiredKeyRollDate = (NSDate *)[a3 copy];
    v10->_keyRollInterval = a4;
    v10->_keysRemaining = a5;
    v10->_keyCount = a6;
  }
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLFindMyAccessoryWildConfiguration;
  [(CLFindMyAccessoryWildConfiguration *)&v3 dealloc];
}

- (id)encodeConfiguration
{
  -[NSDate timeIntervalSinceDate:](self->_desiredKeyRollDate, "timeIntervalSinceDate:", [MEMORY[0x1E4F1C9C8] date]);
  if (v3 <= 0.0)
  {
    LODWORD(v4) = self->_keyRollInterval;
    double v3 = v3 + (double)v4;
    int keysRemaining = self->_keysRemaining;
    BOOL v7 = keysRemaining != 0;
    int v5 = keysRemaining - 1;
    if (v5 == 0 || !v7) {
      LOWORD(v5) = self->_keyCount;
    }
    self->_int keysRemaining = v5;
  }
  else
  {
    LOWORD(v5) = self->_keysRemaining;
  }
  unsigned int v9 = (v3 * 1000.0);
  __int16 v10 = v5;
  unsigned __int16 keyCount = self->_keyCount;
  return (id)[MEMORY[0x1E4F1C9B8] dataWithBytes:&v9 length:8];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"CLFindMyAccessoryWildConfiguration <%p> DesiredKeyRollDate:%@ KeyRollInterval:%u KeysRemaining:%hu KeyCount:%hu", self, self->_desiredKeyRollDate, self->_keyRollInterval, self->_keysRemaining, self->_keyCount];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLFindMyAccessoryWildConfiguration)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CLFindMyAccessoryWildConfiguration;
  unint64_t v4 = [(CLFindMyAccessoryWildConfiguration *)&v6 init];
  if (v4)
  {
    v4->_desiredKeyRollDate = (NSDate *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLFindMyAccessoryWildConfigurationRollDate"];
    v4->_keyRollInterval = [a3 decodeIntForKey:@"kCLFindMyAccessoryWildConfigurationKeyRollInterval"];
    v4->_int keysRemaining = [a3 decodeIntForKey:@"kCLFindMyAccessoryWildConfigurationKeysRemaining"];
    v4->_unsigned __int16 keyCount = [a3 decodeIntForKey:@"kCLFindMyAccessoryWildConfigurationKeyCount"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInt:self->_keyCount forKey:@"kCLFindMyAccessoryWildConfigurationKeyCount"];
  [a3 encodeInt:self->_keysRemaining forKey:@"kCLFindMyAccessoryWildConfigurationKeysRemaining"];
  [a3 encodeInt:self->_keyRollInterval forKey:@"kCLFindMyAccessoryWildConfigurationKeyRollInterval"];
  desiredKeyRollDate = self->_desiredKeyRollDate;

  [a3 encodeObject:desiredKeyRollDate forKey:@"kCLFindMyAccessoryWildConfigurationRollDate"];
}

- (NSDate)desiredKeyRollDate
{
  return self->_desiredKeyRollDate;
}

- (unsigned)keyRollInterval
{
  return self->_keyRollInterval;
}

- (unsigned)keysRemaining
{
  return self->_keysRemaining;
}

- (unsigned)keyCount
{
  return self->_keyCount;
}

@end