@interface AFDeleteAlarmRequest
+ (BOOL)supportsSecureCoding;
- (AFDeleteAlarmRequest)initWithCoder:(id)a3;
- (NSArray)alarmIdentifiers;
- (id)createResponse;
- (void)encodeWithCoder:(id)a3;
- (void)setAlarmIdentifiers:(id)a3;
@end

@implementation AFDeleteAlarmRequest

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

- (AFDeleteAlarmRequest)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AFDeleteAlarmRequest;
  v5 = [(AFSiriRequest *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"AlarmIdentifiers"];
    alarmIdentifiers = v5->_alarmIdentifiers;
    v5->_alarmIdentifiers = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AFDeleteAlarmRequest;
  id v4 = a3;
  [(AFSiriRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_alarmIdentifiers, @"AlarmIdentifiers", v5.receiver, v5.super_class);
}

- (id)createResponse
{
  id v2 = [(AFSiriResponse *)[AFSiriRequestSucceededResponse alloc] _initWithRequest:self];
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end