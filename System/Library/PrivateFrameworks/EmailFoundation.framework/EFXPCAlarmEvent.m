@interface EFXPCAlarmEvent
+ (id)_eventWithName:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUserVisible;
- (EFXPCAlarmEvent)initWithName:(id)a3 fireDate:(id)a4 isUserVisible:(BOOL)a5;
- (NSDate)fireDate;
- (NSString)name;
- (id)description;
- (unint64_t)hash;
@end

@implementation EFXPCAlarmEvent

+ (id)_eventWithName:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = [MEMORY[0x1E4F1C9C8] date];
  v7 = (void *)[v5 initWithName:v4 fireDate:v6 isUserVisible:0];

  return v7;
}

- (EFXPCAlarmEvent)initWithName:(id)a3 fireDate:(id)a4 isUserVisible:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)EFXPCAlarmEvent;
  v10 = [(EFXPCAlarmEvent *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    name = v10->_name;
    v10->_name = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    fireDate = v10->_fireDate;
    v10->_fireDate = (NSDate *)v13;

    v10->_isUserVisible = a5;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 name];
    v6 = [(EFXPCAlarmEvent *)self name];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(EFXPCAlarmEvent *)self name];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p name:%@ fireDate:%@ isUserVisible:%d>", objc_opt_class(), self, self->_name, self->_fireDate, self->_isUserVisible];
}

- (NSString)name
{
  return self->_name;
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (BOOL)isUserVisible
{
  return self->_isUserVisible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end