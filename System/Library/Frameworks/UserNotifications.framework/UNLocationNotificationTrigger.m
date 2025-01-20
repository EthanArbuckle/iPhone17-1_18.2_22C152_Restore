@interface UNLocationNotificationTrigger
+ (BOOL)supportsSecureCoding;
+ (UNLocationNotificationTrigger)triggerWithRegion:(CLRegion *)region repeats:(BOOL)repeats;
- (BOOL)isEqual:(id)a3;
- (BOOL)willTriggerAfterDate:(id)a3 withRequestedDate:(id)a4;
- (CLRegion)region;
- (UNLocationNotificationTrigger)initWithCoder:(id)a3;
- (id)_initWithRegion:(id)a3 repeats:(BOOL)a4;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UNLocationNotificationTrigger

+ (UNLocationNotificationTrigger)triggerWithRegion:(CLRegion *)region repeats:(BOOL)repeats
{
  BOOL v4 = repeats;
  v6 = region;
  v7 = (void *)[objc_alloc((Class)a1) _initWithRegion:v6 repeats:v4];

  return (UNLocationNotificationTrigger *)v7;
}

- (id)_initWithRegion:(id)a3 repeats:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"UNNotificationTrigger.m" lineNumber:415 description:@"region must not be nil"];
  }
  v13.receiver = self;
  v13.super_class = (Class)UNLocationNotificationTrigger;
  v8 = [(UNNotificationTrigger *)&v13 _initWithRepeats:v4];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    v10 = (void *)v8[2];
    v8[2] = v9;
  }
  return v8;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)UNLocationNotificationTrigger;
  unint64_t v3 = [(UNNotificationTrigger *)&v7 hash];
  BOOL v4 = [(UNLocationNotificationTrigger *)self region];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v9.receiver = self,
        v9.super_class = (Class)UNLocationNotificationTrigger,
        [(UNNotificationTrigger *)&v9 isEqual:v4]))
  {
    unint64_t v5 = [(UNLocationNotificationTrigger *)self region];
    v6 = [v4 region];
    char v7 = UNEqualObjects(v5, v6);
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(UNNotificationTrigger *)self repeats];
  unint64_t v5 = NSStringFromBOOL();
  v6 = [(UNLocationNotificationTrigger *)self region];
  char v7 = [v3 stringWithFormat:@"<%@: %p; repeats: %@, region: %@>", v4, self, v5, v6];

  return v7;
}

- (BOOL)willTriggerAfterDate:(id)a3 withRequestedDate:(id)a4
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UNLocationNotificationTrigger;
  id v4 = a3;
  [(UNNotificationTrigger *)&v6 encodeWithCoder:v4];
  unint64_t v5 = [(UNLocationNotificationTrigger *)self region];
  [v4 encodeObject:v5 forKey:@"region"];
}

- (UNLocationNotificationTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UNLocationNotificationTrigger;
  unint64_t v5 = [(UNNotificationTrigger *)&v10 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClass:NSClassFromString((NSString *)@"CLRegion") forKey:@"region"];
    uint64_t v7 = [v6 copy];
    region = v5->_region;
    v5->_region = (CLRegion *)v7;
  }
  return v5;
}

- (CLRegion)region
{
  return self->_region;
}

- (void).cxx_destruct
{
}

@end