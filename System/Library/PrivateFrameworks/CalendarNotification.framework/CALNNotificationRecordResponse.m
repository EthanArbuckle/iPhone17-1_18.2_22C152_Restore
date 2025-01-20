@interface CALNNotificationRecordResponse
+ (id)responseWithNotificationRecord:(id)a3 actionIdentifier:(id)a4 originIdentifier:(id)a5 targetConnectionEndpoint:(id)a6;
- (BSServiceConnectionEndpoint)targetConnectionEndpoint;
- (CALNNotificationRecord)notificationRecord;
- (CALNNotificationRecordResponse)initWithNotificationRecord:(id)a3 actionIdentifier:(id)a4 originIdentifier:(id)a5 targetConnectionEndpoint:(id)a6;
- (NSString)actionIdentifier;
- (NSString)originIdentifier;
- (id)description;
@end

@implementation CALNNotificationRecordResponse

+ (id)responseWithNotificationRecord:(id)a3 actionIdentifier:(id)a4 originIdentifier:(id)a5 targetConnectionEndpoint:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[objc_alloc((Class)a1) initWithNotificationRecord:v13 actionIdentifier:v12 originIdentifier:v11 targetConnectionEndpoint:v10];

  return v14;
}

- (CALNNotificationRecordResponse)initWithNotificationRecord:(id)a3 actionIdentifier:(id)a4 originIdentifier:(id)a5 targetConnectionEndpoint:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CALNNotificationRecordResponse;
  v15 = [(CALNNotificationRecordResponse *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_notificationRecord, a3);
    uint64_t v17 = [v12 copy];
    actionIdentifier = v16->_actionIdentifier;
    v16->_actionIdentifier = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    originIdentifier = v16->_originIdentifier;
    v16->_originIdentifier = (NSString *)v19;

    objc_storeStrong((id *)&v16->_targetConnectionEndpoint, a6);
  }

  return v16;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CALNNotificationRecordResponse *)self notificationRecord];
  v6 = [(CALNNotificationRecordResponse *)self actionIdentifier];
  v7 = [(CALNNotificationRecordResponse *)self originIdentifier];
  v8 = [(CALNNotificationRecordResponse *)self targetConnectionEndpoint];
  v9 = [v3 stringWithFormat:@"<%@: %p>(notificationRecord = %@, actionIdentifier = %@, originIdentifier = %@, targetConnectionEndpoint = %@)", v4, self, v5, v6, v7, v8];

  return v9;
}

- (CALNNotificationRecord)notificationRecord
{
  return self->_notificationRecord;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (NSString)originIdentifier
{
  return self->_originIdentifier;
}

- (BSServiceConnectionEndpoint)targetConnectionEndpoint
{
  return self->_targetConnectionEndpoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetConnectionEndpoint, 0);
  objc_storeStrong((id *)&self->_originIdentifier, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_notificationRecord, 0);
}

@end