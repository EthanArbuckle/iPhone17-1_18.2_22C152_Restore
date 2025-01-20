@interface UNNotificationResponse
+ (BOOL)supportsSecureCoding;
+ (UNNotificationResponse)responseWithNotification:(id)a3 actionIdentifier:(id)a4;
+ (UNNotificationResponse)responseWithNotification:(id)a3 actionIdentifier:(id)a4 originIdentifier:(id)a5 targetConnectionEndpoint:(id)a6;
+ (UNNotificationResponse)responseWithNotification:(id)a3 actionIdentifier:(id)a4 originIdentifier:(id)a5 targetConnectionEndpoint:(id)a6 targetSceneIdentifier:(id)a7;
- (BOOL)isEqual:(id)a3;
- (BSServiceConnectionEndpoint)targetConnectionEndpoint;
- (NSString)actionIdentifier;
- (NSString)description;
- (NSString)originIdentifier;
- (NSString)targetSceneIdentifier;
- (UNNotification)notification;
- (UNNotificationResponse)initWithCoder:(id)a3;
- (UNNotificationResponse)initWithNotification:(id)a3 actionIdentifier:(id)a4;
- (UNNotificationResponse)initWithXPCDictionary:(id)a3;
- (id)_initWithNotification:(id)a3 actionIdentifier:(id)a4 originIdentifier:(id)a5 targetConnectionEndpoint:(id)a6 targetSceneIdentifier:(id)a7;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation UNNotificationResponse

+ (UNNotificationResponse)responseWithNotification:(id)a3 actionIdentifier:(id)a4
{
  return (UNNotificationResponse *)[a1 responseWithNotification:a3 actionIdentifier:a4 originIdentifier:&stru_1F062A810 targetConnectionEndpoint:0];
}

+ (UNNotificationResponse)responseWithNotification:(id)a3 actionIdentifier:(id)a4 originIdentifier:(id)a5 targetConnectionEndpoint:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[objc_alloc((Class)a1) _initWithNotification:v13 actionIdentifier:v12 originIdentifier:v11 targetConnectionEndpoint:v10 targetSceneIdentifier:0];

  return (UNNotificationResponse *)v14;
}

+ (UNNotificationResponse)responseWithNotification:(id)a3 actionIdentifier:(id)a4 originIdentifier:(id)a5 targetConnectionEndpoint:(id)a6 targetSceneIdentifier:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = (void *)[objc_alloc((Class)a1) _initWithNotification:v16 actionIdentifier:v15 originIdentifier:v14 targetConnectionEndpoint:v13 targetSceneIdentifier:v12];

  return (UNNotificationResponse *)v17;
}

- (id)_initWithNotification:(id)a3 actionIdentifier:(id)a4 originIdentifier:(id)a5 targetConnectionEndpoint:(id)a6 targetSceneIdentifier:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)UNNotificationResponse;
  v17 = [(UNNotificationResponse *)&v25 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    notification = v17->_notification;
    v17->_notification = (UNNotification *)v18;

    uint64_t v20 = [v13 copy];
    actionIdentifier = v17->_actionIdentifier;
    v17->_actionIdentifier = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    originIdentifier = v17->_originIdentifier;
    v17->_originIdentifier = (NSString *)v22;

    objc_storeStrong((id *)&v17->_targetConnectionEndpoint, a6);
    objc_storeStrong((id *)&v17->_targetSceneIdentifier, a7);
  }

  return v17;
}

- (UNNotificationResponse)initWithNotification:(id)a3 actionIdentifier:(id)a4
{
  return (UNNotificationResponse *)[(UNNotificationResponse *)self _initWithNotification:a3 actionIdentifier:a4 originIdentifier:&stru_1F062A810 targetConnectionEndpoint:0 targetSceneIdentifier:0];
}

- (unint64_t)hash
{
  v3 = [(UNNotificationResponse *)self notification];
  uint64_t v4 = [v3 hash];
  v5 = [(UNNotificationResponse *)self actionIdentifier];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(UNNotificationResponse *)self originIdentifier];
  uint64_t v8 = [v7 hash];
  v9 = [(UNNotificationResponse *)self targetConnectionEndpoint];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  id v11 = [(UNNotificationResponse *)self targetSceneIdentifier];
  unint64_t v12 = v10 ^ [v11 hash];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(UNNotificationResponse *)self notification];
    uint64_t v6 = [v4 notification];
    if (UNEqualObjects(v5, v6))
    {
      v7 = [(UNNotificationResponse *)self actionIdentifier];
      uint64_t v8 = [v4 actionIdentifier];
      if (UNEqualStrings(v7, v8))
      {
        v9 = [(UNNotificationResponse *)self originIdentifier];
        uint64_t v10 = [v4 originIdentifier];
        if (UNEqualStrings(v9, v10))
        {
          id v11 = [(UNNotificationResponse *)self targetConnectionEndpoint];
          unint64_t v12 = [v4 targetConnectionEndpoint];
          if (UNEqualObjects(v11, v12))
          {
            id v16 = [(UNNotificationResponse *)self targetSceneIdentifier];
            [v4 targetSceneIdentifier];
            id v13 = v17 = v11;
            char v14 = UNEqualStrings(v16, v13);

            id v11 = v17;
          }
          else
          {
            char v14 = 0;
          }
        }
        else
        {
          char v14 = 0;
        }
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(UNNotificationResponse *)self actionIdentifier];
  uint64_t v6 = [(UNNotificationResponse *)self notification];
  v7 = [v3 stringWithFormat:@"<%@: %p; actionIdentifier: %@, notification: %@>", v4, self, v5, v6];

  return (NSString *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(UNNotificationResponse *)self notification];
  [v4 encodeObject:v5 forKey:@"notification"];

  uint64_t v6 = [(UNNotificationResponse *)self actionIdentifier];
  [v4 encodeObject:v6 forKey:@"actionIdentifier"];

  v7 = [(UNNotificationResponse *)self originIdentifier];
  [v4 encodeObject:v7 forKey:@"originIdentifier"];

  uint64_t v8 = [(UNNotificationResponse *)self targetConnectionEndpoint];
  [v4 encodeObject:v8 forKey:@"targetConnectionEndpoint"];

  id v9 = [(UNNotificationResponse *)self targetSceneIdentifier];
  [v4 encodeObject:v9 forKey:@"targetSceneIdentifier"];
}

- (UNNotificationResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"notification"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionIdentifier"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originIdentifier"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetConnectionEndpoint"];
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetSceneIdentifier"];

  uint64_t v10 = [(UNNotificationResponse *)self _initWithNotification:v5 actionIdentifier:v6 originIdentifier:v7 targetConnectionEndpoint:v8 targetSceneIdentifier:v9];
  return v10;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(UNNotificationResponse *)self actionIdentifier];
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();

  uint64_t v6 = [(UNNotificationResponse *)self originIdentifier];
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();

  v7 = [(UNNotificationResponse *)self notification];
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();

  uint64_t v8 = [(UNNotificationResponse *)self targetSceneIdentifier];
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();

  id v10 = [MEMORY[0x1E4F4F870] coderWithMessage:v4];

  id v9 = [(UNNotificationResponse *)self targetConnectionEndpoint];
  [v10 encodeObject:v9 forKey:@"targetConnectionEndpoint"];
}

- (UNNotificationResponse)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
  objc_opt_class();
  uint64_t v6 = BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
  objc_opt_class();
  v7 = BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
  objc_opt_class();
  uint64_t v8 = BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
  id v9 = [MEMORY[0x1E4F4F870] coderWithMessage:v4];

  id v10 = [v9 decodeObjectOfClass:objc_opt_class() forKey:@"targetConnectionEndpoint"];
  id v11 = [(UNNotificationResponse *)self _initWithNotification:v7 actionIdentifier:v5 originIdentifier:v6 targetConnectionEndpoint:v10 targetSceneIdentifier:v8];

  return v11;
}

- (UNNotification)notification
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

- (NSString)targetSceneIdentifier
{
  return self->_targetSceneIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_targetConnectionEndpoint, 0);
  objc_storeStrong((id *)&self->_originIdentifier, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);

  objc_storeStrong((id *)&self->_notification, 0);
}

@end