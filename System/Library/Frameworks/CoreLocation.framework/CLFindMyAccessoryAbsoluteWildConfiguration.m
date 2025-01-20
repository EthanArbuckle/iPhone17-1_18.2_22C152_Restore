@interface CLFindMyAccessoryAbsoluteWildConfiguration
+ (BOOL)supportsSecureCoding;
- (CLFindMyAccessoryAbsoluteWildConfiguration)init;
- (CLFindMyAccessoryAbsoluteWildConfiguration)initWithCoder:(id)a3;
- (CLFindMyAccessoryAbsoluteWildConfiguration)initWithDesiredNextKeyRollDate:(id)a3 nextWildIndex:(unsigned int)a4;
- (NSDate)desiredKeyRollDate;
- (id)description;
- (id)encodeConfiguration;
- (unsigned)nextWildIndex;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLFindMyAccessoryAbsoluteWildConfiguration

- (CLFindMyAccessoryAbsoluteWildConfiguration)init
{
  return 0;
}

- (CLFindMyAccessoryAbsoluteWildConfiguration)initWithDesiredNextKeyRollDate:(id)a3 nextWildIndex:(unsigned int)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CLFindMyAccessoryAbsoluteWildConfiguration;
  v6 = [(CLFindMyAccessoryAbsoluteWildConfiguration *)&v8 init];
  if (v6)
  {
    v6->_desiredKeyRollDate = (NSDate *)[a3 copy];
    v6->_nextWildIndex = a4;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLFindMyAccessoryAbsoluteWildConfiguration;
  [(CLFindMyAccessoryAbsoluteWildConfiguration *)&v3 dealloc];
}

- (id)encodeConfiguration
{
  -[NSDate timeIntervalSinceDate:](self->_desiredKeyRollDate, "timeIntervalSinceDate:", [MEMORY[0x1E4F1C9C8] date]);
  unsigned int nextWildIndex = self->_nextWildIndex;
  v6[0] = (v3 * 1000.0);
  v6[1] = nextWildIndex;
  return (id)[MEMORY[0x1E4F1C9B8] dataWithBytes:v6 length:8];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"CLFindMyAccessoryAbsoluteWildConfiguration <%p> DesiredKeyRollDate:%@ NextWildKeyIndex: %u", self, self->_desiredKeyRollDate, self->_nextWildIndex];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLFindMyAccessoryAbsoluteWildConfiguration)initWithCoder:(id)a3
{
  [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLFindMyAccessoryWildConfigurationRollDate"];
  [a3 decodeIntForKey:@"kCLFindMyAccessoryWildConfigurationNextWildKeyIndex"];

  return (CLFindMyAccessoryAbsoluteWildConfiguration *)MEMORY[0x1F4181798](self, sel_initWithDesiredNextKeyRollDate_nextWildIndex_);
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_desiredKeyRollDate forKey:@"kCLFindMyAccessoryWildConfigurationRollDate"];
  uint64_t nextWildIndex = self->_nextWildIndex;

  [a3 encodeInt:nextWildIndex forKey:@"kCLFindMyAccessoryWildConfigurationNextWildKeyIndex"];
}

- (NSDate)desiredKeyRollDate
{
  return self->_desiredKeyRollDate;
}

- (unsigned)nextWildIndex
{
  return self->_nextWildIndex;
}

@end