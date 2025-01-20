@interface MobileTimerAlarmObject
+ (id)alarmObjectWithDictionary:(id)a3;
- (NSDictionary)dictionary;
- (NSNumber)enabled;
- (NSURL)alarmId;
- (void)setDictionary:(id)a3;
@end

@implementation MobileTimerAlarmObject

+ (id)alarmObjectWithDictionary:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(MobileTimerAlarmObject);
  [(MobileTimerAlarmObject *)v4 setDictionary:v3];

  return v4;
}

- (NSURL)alarmId
{
  v2 = [(NSDictionary *)self->_dictionary valueForKey:SAAlarmUpdateAlarmIdPListKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = +[NSURL URLWithString:v2];
  }
  else
  {
    id v3 = 0;
  }

  return (NSURL *)v3;
}

- (NSNumber)enabled
{
  return (NSNumber *)[(NSDictionary *)self->_dictionary valueForKey:SAAlarmUpdateEnabledPListKey];
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end