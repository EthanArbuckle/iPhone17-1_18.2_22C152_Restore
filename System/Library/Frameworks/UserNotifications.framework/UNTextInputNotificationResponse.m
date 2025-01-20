@interface UNTextInputNotificationResponse
+ (BOOL)supportsSecureCoding;
+ (UNTextInputNotificationResponse)responseWithNotification:(id)a3 actionIdentifier:(id)a4 originIdentifier:(id)a5 targetConnectionEndpoint:(id)a6 targetSceneIdentifier:(id)a7 userText:(id)a8;
+ (UNTextInputNotificationResponse)responseWithNotification:(id)a3 actionIdentifier:(id)a4 originIdentifier:(id)a5 targetConnectionEndpoint:(id)a6 userText:(id)a7;
+ (UNTextInputNotificationResponse)responseWithNotification:(id)a3 actionIdentifier:(id)a4 userText:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)userText;
- (UNTextInputNotificationResponse)initWithCoder:(id)a3;
- (UNTextInputNotificationResponse)initWithNotification:(id)a3 actionIdentifier:(id)a4 userText:(id)a5;
- (UNTextInputNotificationResponse)initWithXPCDictionary:(id)a3;
- (id)_initWithNotification:(id)a3 actionIdentifier:(id)a4 originIdentifier:(id)a5 targetConnectionEndpoint:(id)a6 targetSceneIdentifier:(id)a7;
- (id)_initWithNotification:(id)a3 actionIdentifier:(id)a4 originIdentifier:(id)a5 targetConnectionEndpoint:(id)a6 targetSceneIdentifier:(id)a7 userText:(id)a8;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation UNTextInputNotificationResponse

+ (UNTextInputNotificationResponse)responseWithNotification:(id)a3 actionIdentifier:(id)a4 userText:(id)a5
{
  return (UNTextInputNotificationResponse *)[a1 responseWithNotification:a3 actionIdentifier:a4 originIdentifier:&stru_1F062A810 targetConnectionEndpoint:0 userText:a5];
}

+ (UNTextInputNotificationResponse)responseWithNotification:(id)a3 actionIdentifier:(id)a4 originIdentifier:(id)a5 targetConnectionEndpoint:(id)a6 userText:(id)a7
{
  return (UNTextInputNotificationResponse *)[a1 responseWithNotification:a3 actionIdentifier:a4 originIdentifier:a5 targetConnectionEndpoint:a6 targetSceneIdentifier:0 userText:a7];
}

+ (UNTextInputNotificationResponse)responseWithNotification:(id)a3 actionIdentifier:(id)a4 originIdentifier:(id)a5 targetConnectionEndpoint:(id)a6 targetSceneIdentifier:(id)a7 userText:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = (void *)[objc_alloc((Class)a1) _initWithNotification:v19 actionIdentifier:v18 originIdentifier:v17 targetConnectionEndpoint:v16 targetSceneIdentifier:v15 userText:v14];

  return (UNTextInputNotificationResponse *)v20;
}

- (id)_initWithNotification:(id)a3 actionIdentifier:(id)a4 originIdentifier:(id)a5 targetConnectionEndpoint:(id)a6 targetSceneIdentifier:(id)a7
{
  return [(UNTextInputNotificationResponse *)self _initWithNotification:a3 actionIdentifier:a4 originIdentifier:a5 targetConnectionEndpoint:a6 targetSceneIdentifier:a7 userText:&stru_1F062A810];
}

- (id)_initWithNotification:(id)a3 actionIdentifier:(id)a4 originIdentifier:(id)a5 targetConnectionEndpoint:(id)a6 targetSceneIdentifier:(id)a7 userText:(id)a8
{
  id v13 = a8;
  v18.receiver = self;
  v18.super_class = (Class)UNTextInputNotificationResponse;
  id v14 = [(UNNotificationResponse *)&v18 _initWithNotification:a3 actionIdentifier:a4 originIdentifier:a5 targetConnectionEndpoint:a6 targetSceneIdentifier:0];
  if (v14)
  {
    uint64_t v15 = [v13 copy];
    id v16 = (void *)v14[6];
    v14[6] = v15;
  }
  return v14;
}

- (UNTextInputNotificationResponse)initWithNotification:(id)a3 actionIdentifier:(id)a4 userText:(id)a5
{
  return (UNTextInputNotificationResponse *)[(UNTextInputNotificationResponse *)self _initWithNotification:a3 actionIdentifier:a4 originIdentifier:&stru_1F062A810 targetConnectionEndpoint:0 targetSceneIdentifier:0 userText:a5];
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)UNTextInputNotificationResponse;
  unint64_t v3 = [(UNNotificationResponse *)&v7 hash];
  v4 = [(UNTextInputNotificationResponse *)self userText];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UNTextInputNotificationResponse;
  if ([(UNNotificationResponse *)&v9 isEqual:v4])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = [(UNTextInputNotificationResponse *)self userText];
      v6 = [v4 userText];
      char v7 = UNEqualObjects(v5, v6);
    }
    else
    {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(UNNotificationResponse *)self actionIdentifier];
  v6 = [(UNTextInputNotificationResponse *)self userText];
  char v7 = [(UNNotificationResponse *)self notification];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; actionIdentifier: %@, userText: %@, notification: %@>",
    v4,
    self,
    v5,
    v6,
  v8 = v7);

  return (NSString *)v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(UNNotificationResponse *)self notification];
  [v4 encodeObject:v5 forKey:@"notification"];

  v6 = [(UNNotificationResponse *)self actionIdentifier];
  [v4 encodeObject:v6 forKey:@"actionIdentifier"];

  char v7 = [(UNTextInputNotificationResponse *)self userText];
  [v4 encodeObject:v7 forKey:@"userText"];

  v8 = [(UNNotificationResponse *)self originIdentifier];
  [v4 encodeObject:v8 forKey:@"originIdentifier"];

  objc_super v9 = [(UNNotificationResponse *)self targetConnectionEndpoint];
  [v4 encodeObject:v9 forKey:@"targetConnectionEndpoint"];

  id v10 = [(UNNotificationResponse *)self targetSceneIdentifier];
  [v4 encodeObject:v10 forKey:@"targetSceneIdentifier"];
}

- (UNTextInputNotificationResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"notification"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionIdentifier"];
  char v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userText"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originIdentifier"];
  objc_super v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetConnectionEndpoint"];
  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetSceneIdentifier"];

  v11 = [(UNTextInputNotificationResponse *)self _initWithNotification:v5 actionIdentifier:v6 originIdentifier:v8 targetConnectionEndpoint:v9 targetSceneIdentifier:v10 userText:v7];
  return v11;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(UNNotificationResponse *)self actionIdentifier];
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();

  v6 = [(UNNotificationResponse *)self originIdentifier];
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();

  char v7 = [(UNTextInputNotificationResponse *)self userText];
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();

  v8 = [(UNNotificationResponse *)self notification];
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();

  objc_super v9 = [(UNNotificationResponse *)self targetSceneIdentifier];
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();

  id v11 = [MEMORY[0x1E4F4F870] coderWithMessage:v4];

  id v10 = [(UNNotificationResponse *)self targetConnectionEndpoint];
  [v11 encodeObject:v10 forKey:@"targetConnectionEndpoint"];
}

- (UNTextInputNotificationResponse)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  unint64_t v5 = BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
  objc_opt_class();
  v6 = BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
  objc_opt_class();
  char v7 = BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
  objc_opt_class();
  v8 = BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
  objc_opt_class();
  objc_super v9 = BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
  id v10 = [MEMORY[0x1E4F4F870] coderWithMessage:v4];

  id v11 = [v10 decodeObjectOfClass:objc_opt_class() forKey:@"targetConnectionEndpoint"];
  v12 = [(UNTextInputNotificationResponse *)self _initWithNotification:v8 actionIdentifier:v5 originIdentifier:v6 targetConnectionEndpoint:v11 targetSceneIdentifier:v9 userText:v7];

  return v12;
}

- (NSString)userText
{
  return self->_userText;
}

- (void).cxx_destruct
{
}

@end