@interface AFUpdateAlarmResponse
+ (BOOL)supportsSecureCoding;
- (AFUpdateAlarmResponse)initWithCoder:(id)a3;
- (NSArray)alarmIdentifiers;
- (void)encodeWithCoder:(id)a3;
- (void)setAlarmIdentifier:(id)a3;
- (void)setAlarmIdentifiers:(id)a3;
@end

@implementation AFUpdateAlarmResponse

- (void).cxx_destruct
{
}

- (void)setAlarmIdentifiers:(id)a3
{
}

- (NSArray)alarmIdentifiers
{
  return self->_alarmIdentifiers;
}

- (AFUpdateAlarmResponse)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AFUpdateAlarmResponse;
  v5 = [(AFSiriResponse *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_alarmIdentifiers"];
    alarmIdentifiers = v5->_alarmIdentifiers;
    v5->_alarmIdentifiers = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AFUpdateAlarmResponse;
  id v4 = a3;
  [(AFSiriResponse *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_alarmIdentifiers, @"_alarmIdentifiers", v5.receiver, v5.super_class);
}

- (void)setAlarmIdentifier:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    v7[0] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [(AFUpdateAlarmResponse *)self setAlarmIdentifiers:v6];
  }
  else
  {
    [(AFUpdateAlarmResponse *)self setAlarmIdentifiers:0];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end