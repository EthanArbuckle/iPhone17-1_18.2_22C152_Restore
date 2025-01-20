@interface COAlarmNotification
+ (BOOL)supportsSecureCoding;
- (COAlarmNotification)initWithAlarms:(id)a3;
- (COAlarmNotification)initWithCoder:(id)a3;
- (NSArray)alarms;
- (void)encodeWithCoder:(id)a3;
@end

@implementation COAlarmNotification

- (COAlarmNotification)initWithAlarms:(id)a3
{
  id v4 = a3;
  v5 = [(COMeshCommand *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    alarms = v5->_alarms;
    v5->_alarms = (NSArray *)v6;
  }
  return v5;
}

- (COAlarmNotification)initWithCoder:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)COAlarmNotification;
  v5 = [(COMeshCommand *)&v22 initWithCoder:v4];
  if (v5 && [v4 containsValueForKey:@"alarms"])
  {
    uint64_t v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"alarms"];
    alarms = v5->_alarms;
    v5->_alarms = (NSArray *)v9;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      v11 = v5->_alarms;
      uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v19;
        while (2)
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v19 != v14) {
              objc_enumerationMutation(v11);
            }
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              v16 = 0;
              goto LABEL_15;
            }
            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
      v16 = v5;
    }
    else
    {
      v16 = 0;
      v11 = (NSArray *)v5;
    }
LABEL_15:

    v5 = v16;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)COAlarmNotification;
  [(COMeshCommand *)&v6 encodeWithCoder:v4];
  v5 = [(COAlarmNotification *)self alarms];
  if (v5) {
    [v4 encodeObject:v5 forKey:@"alarms"];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)alarms
{
  return self->_alarms;
}

- (void).cxx_destruct
{
}

@end