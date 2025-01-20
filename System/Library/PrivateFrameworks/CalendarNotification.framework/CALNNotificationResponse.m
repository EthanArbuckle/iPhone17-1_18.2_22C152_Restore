@interface CALNNotificationResponse
+ (id)responseWithNotification:(id)a3 actionIdentifier:(id)a4 originIdentifier:(id)a5 targetConnectionEndpoint:(id)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToResponse:(id)a3;
- (BSServiceConnectionEndpoint)targetConnectionEndpoint;
- (CALNNotification)notification;
- (CALNNotificationResponse)initWithNotification:(id)a3 actionIdentifier:(id)a4 originIdentifier:(id)a5 targetConnectionEndpoint:(id)a6;
- (NSString)actionIdentifier;
- (NSString)originIdentifier;
- (id)description;
- (unint64_t)hash;
@end

@implementation CALNNotificationResponse

+ (id)responseWithNotification:(id)a3 actionIdentifier:(id)a4 originIdentifier:(id)a5 targetConnectionEndpoint:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[objc_alloc((Class)a1) initWithNotification:v13 actionIdentifier:v12 originIdentifier:v11 targetConnectionEndpoint:v10];

  return v14;
}

- (CALNNotificationResponse)initWithNotification:(id)a3 actionIdentifier:(id)a4 originIdentifier:(id)a5 targetConnectionEndpoint:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CALNNotificationResponse;
  v15 = [(CALNNotificationResponse *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_notification, a3);
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

- (unint64_t)hash
{
  v3 = [(CALNNotificationResponse *)self notification];
  uint64_t v4 = [v3 hash];

  v5 = [(CALNNotificationResponse *)self actionIdentifier];
  uint64_t v6 = [v5 hash] ^ v4;

  v7 = [(CALNNotificationResponse *)self originIdentifier];
  uint64_t v8 = [v7 hash];

  v9 = [(CALNNotificationResponse *)self targetConnectionEndpoint];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(CALNNotificationResponse *)self isEqualToResponse:v4];

  return v5;
}

- (BOOL)isEqualToResponse:(id)a3
{
  id v4 = (CALNNotificationResponse *)a3;
  if (self == v4)
  {
    char v16 = 1;
  }
  else
  {
    BOOL v5 = [(CALNNotificationResponse *)self notification];
    uint64_t v6 = [(CALNNotificationResponse *)v4 notification];
    int v7 = CalEqualObjects();

    if (!v7) {
      goto LABEL_6;
    }
    uint64_t v8 = [(CALNNotificationResponse *)self actionIdentifier];
    v9 = [(CALNNotificationResponse *)v4 actionIdentifier];
    int v10 = CalEqualStrings();

    if (!v10) {
      goto LABEL_6;
    }
    id v11 = [(CALNNotificationResponse *)self originIdentifier];
    id v12 = [(CALNNotificationResponse *)v4 originIdentifier];
    int v13 = CalEqualStrings();

    if (v13)
    {
      id v14 = [(CALNNotificationResponse *)self targetConnectionEndpoint];
      v15 = [(CALNNotificationResponse *)v4 targetConnectionEndpoint];
      char v16 = CalEqualObjects();
    }
    else
    {
LABEL_6:
      char v16 = 0;
    }
  }

  return v16;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(CALNNotificationResponse *)self notification];
  uint64_t v6 = [(CALNNotificationResponse *)self actionIdentifier];
  int v7 = [(CALNNotificationResponse *)self originIdentifier];
  uint64_t v8 = [(CALNNotificationResponse *)self targetConnectionEndpoint];
  v9 = [v3 stringWithFormat:@"<%@: %p>(notification = %@, actionIdentifier = %@, originIdentifier = %@, targetConnectionEndpoint = %@)", v4, self, v5, v6, v7, v8];

  return v9;
}

- (CALNNotification)notification
{
  return self->_notification;
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
  objc_storeStrong((id *)&self->_notification, 0);
}

@end