@interface COMTAlarmNotificationAction
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (COMTAlarmNotificationAction)initWithCoder:(id)a3;
- (COMTAlarmNotificationAction)initWithReason:(id)a3 alarms:(id)a4;
- (NSArray)alarms;
- (NSString)reason;
- (void)encodeWithCoder:(id)a3;
@end

@implementation COMTAlarmNotificationAction

- (COMTAlarmNotificationAction)initWithReason:(id)a3 alarms:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)COMTAlarmNotificationAction;
  v8 = [(COMTAction *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    reason = v8->_reason;
    v8->_reason = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    alarms = v8->_alarms;
    v8->_alarms = (NSArray *)v11;
  }
  return v8;
}

- (COMTAlarmNotificationAction)initWithCoder:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)COMTAlarmNotificationAction;
  v5 = [(COMTAction *)&v24 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reason"];
    reason = v5->_reason;
    v5->_reason = (NSString *)v6;

    if (![(NSString *)v5->_reason length])
    {
LABEL_14:
      v18 = 0;
      goto LABEL_15;
    }
    v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"alarms"];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v12 = v11;
    uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      while (2)
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_14;
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    alarms = v5->_alarms;
    v5->_alarms = v12;
  }
  v18 = v5;
LABEL_15:

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)COMTAlarmNotificationAction;
  id v4 = a3;
  [(COMTAction *)&v7 encodeWithCoder:v4];
  v5 = [(COMTAlarmNotificationAction *)self reason];
  [v4 encodeObject:v5 forKey:@"reason"];

  uint64_t v6 = [(COMTAlarmNotificationAction *)self alarms];
  [v4 encodeObject:v6 forKey:@"alarms"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)COMTAlarmNotificationAction;
  if ([(COMTAction *)&v11 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [(COMTAlarmNotificationAction *)self reason];
      objc_super v7 = [v4 reason];
      if ([v6 isEqual:v7])
      {
        v8 = [(COMTAlarmNotificationAction *)self alarms];
        uint64_t v9 = [v4 alarms];
        char v5 = [v8 isEqual:v9];
      }
      else
      {
        char v5 = 0;
      }
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSArray)alarms
{
  return self->_alarms;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarms, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end