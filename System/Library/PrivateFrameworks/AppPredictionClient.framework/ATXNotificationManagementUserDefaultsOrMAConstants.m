@interface ATXNotificationManagementUserDefaultsOrMAConstants
- (ATXNotificationManagementUserDefaultsOrMAConstants)init;
- (double)doubleForKey:(id)a3 defaultReturnValue:(double)a4;
- (id)numberForKey:(id)a3 defaultReturnValue:(id)a4;
@end

@implementation ATXNotificationManagementUserDefaultsOrMAConstants

- (ATXNotificationManagementUserDefaultsOrMAConstants)init
{
  v9.receiver = self;
  v9.super_class = (Class)ATXNotificationManagementUserDefaultsOrMAConstants;
  v2 = [(ATXNotificationManagementUserDefaultsOrMAConstants *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1CB18]);
    uint64_t v4 = [v3 initWithSuiteName:*MEMORY[0x1E4F4B688]];
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v4;

    uint64_t v6 = +[ATXNotificationManagementMAConstants sharedInstance];
    constants = v2->_constants;
    v2->_constants = (ATXNotificationManagementMAConstants *)v6;
  }
  return v2;
}

- (id)numberForKey:(id)a3 defaultReturnValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(NSUserDefaults *)self->_defaults objectForKey:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v9 = v8;
  }
  else
  {
    objc_super v9 = [(ATXNotificationManagementMAConstants *)self->_constants numberForKey:v6];

    if (v9) {
      v8 = v9;
    }
    else {
      v8 = v7;
    }
  }
  id v10 = v8;

  return v10;
}

- (double)doubleForKey:(id)a3 defaultReturnValue:(double)a4
{
  id v6 = NSNumber;
  id v7 = a3;
  v8 = [v6 numberWithDouble:a4];
  objc_super v9 = [(ATXNotificationManagementUserDefaultsOrMAConstants *)self numberForKey:v7 defaultReturnValue:v8];

  [v9 doubleValue];
  double v11 = v10;

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);

  objc_storeStrong((id *)&self->_constants, 0);
}

@end