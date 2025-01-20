@interface HMDCameraSignificantEventNotificationRecord
- (BOOL)isEqual:(id)a3;
- (HMDCameraSignificantEventNotificationRecord)initWithUUID:(id)a3 notificationReasons:(unint64_t)a4 date:(id)a5;
- (NSDate)date;
- (NSUUID)UUID;
- (unint64_t)hash;
- (unint64_t)notificationReasons;
@end

@implementation HMDCameraSignificantEventNotificationRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)notificationReasons
{
  return self->_notificationReasons;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)hash
{
  v2 = [(HMDCameraSignificantEventNotificationRecord *)self UUID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    v7 = [(HMDCameraSignificantEventNotificationRecord *)self UUID];
    v8 = [v6 UUID];
    if ([v7 isEqual:v8]
      && (unint64_t v9 = [(HMDCameraSignificantEventNotificationRecord *)self notificationReasons],
          v9 == [v6 notificationReasons]))
    {
      v10 = [(HMDCameraSignificantEventNotificationRecord *)self date];
      v11 = [v6 date];
      char v12 = [v10 isEqualToDate:v11];
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (HMDCameraSignificantEventNotificationRecord)initWithUUID:(id)a3 notificationReasons:(unint64_t)a4 date:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v10 = v9;
  if (!v9)
  {
LABEL_7:
    v17 = (HMDCameraSignificantEventNotificationFilter *)_HMFPreconditionFailure();
    [(HMDCameraSignificantEventNotificationFilter *)v17 .cxx_destruct];
    return result;
  }
  v19.receiver = self;
  v19.super_class = (Class)HMDCameraSignificantEventNotificationRecord;
  v11 = [(HMDCameraSignificantEventNotificationRecord *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    UUID = v11->_UUID;
    v11->_UUID = (NSUUID *)v12;

    v11->_notificationReasons = a4;
    uint64_t v14 = [v10 copy];
    date = v11->_date;
    v11->_date = (NSDate *)v14;
  }
  return v11;
}

@end