@interface BBSectionMuteAssertion
+ (BOOL)supportsSecureCoding;
+ (id)sectionMuteAssertionUntilDate:(id)a3;
- (BBSectionMuteAssertion)initWithCoder:(id)a3;
- (BOOL)isActiveForThreadIdentifier:(id)a3 currentDate:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSDate)expirationDate;
- (id)_initWithExpirationDate:(id)a3;
- (id)description;
- (id)toUNCMuteAssertion;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)getNextExpirationDate:(id *)a3 wasPurged:(BOOL *)a4 currentDate:(id)a5;
@end

@implementation BBSectionMuteAssertion

+ (id)sectionMuteAssertionUntilDate:(id)a3
{
  id v3 = a3;
  id v4 = [[BBSectionMuteAssertion alloc] _initWithExpirationDate:v3];

  return v4;
}

- (id)_initWithExpirationDate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BBSectionMuteAssertion;
  v5 = [(BBMuteAssertion *)&v9 _init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    v7 = (void *)v5[1];
    v5[1] = v6;
  }
  return v5;
}

- (BOOL)isActiveForThreadIdentifier:(id)a3 currentDate:(id)a4
{
  id v5 = a4;
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x263EFF910] now];
  }
  v8 = v7;
  BOOL v9 = [(NSDate *)self->_expirationDate compare:v7] == NSOrderedDescending;

  return v9;
}

- (void)getNextExpirationDate:(id *)a3 wasPurged:(BOOL *)a4 currentDate:(id)a5
{
  BOOL v8 = [(BBSectionMuteAssertion *)self isActiveForThreadIdentifier:0 currentDate:a5];
  expirationDate = 0;
  if (v8) {
    expirationDate = self->_expirationDate;
  }
  *a3 = expirationDate;
  *a4 = 0;
}

- (unint64_t)hash
{
  return [(NSDate *)self->_expirationDate hash];
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    && (id v4 = v3) != 0)
  {
    id v5 = v4;
    char v6 = BSEqualObjects();
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; expirationDate: %@>",
               objc_opt_class(),
               self,
               self->_expirationDate);
}

- (id)toUNCMuteAssertion
{
  v2 = (void *)MEMORY[0x263F842E8];
  id v3 = [(BBSectionMuteAssertion *)self expirationDate];
  id v4 = [v2 sectionMuteAssertionUntilDate:v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BBSectionMuteAssertion;
  id v4 = a3;
  [(BBMuteAssertion *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_expirationDate, @"expirationDate", v5.receiver, v5.super_class);
}

- (BBSectionMuteAssertion)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BBSectionMuteAssertion;
  objc_super v5 = [(BBMuteAssertion *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v6;
  }
  return v5;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void).cxx_destruct
{
}

@end