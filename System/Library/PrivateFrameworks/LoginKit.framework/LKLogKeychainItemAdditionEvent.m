@interface LKLogKeychainItemAdditionEvent
+ (id)eventFromLKLogEvent:(id)a3;
- (NSString)keychainItemAdded;
- (id)dictionary;
- (void)setKeychainItemAdded:(id)a3;
@end

@implementation LKLogKeychainItemAdditionEvent

+ (id)eventFromLKLogEvent:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v3 process];
  v6 = (void *)[v5 copy];
  [v4 setProcess:v6];

  v7 = [v3 date];
  v8 = (void *)[v7 copy];
  [v4 setDate:v8];

  v9 = [v3 senderImagePath];
  v10 = (void *)[v9 copy];
  [v4 setSenderImagePath:v10];

  objc_msgSend(v4, "setActivityIdentifier:", objc_msgSend(v3, "activityIdentifier"));
  v11 = [v3 composedMessage];

  v12 = (void *)[v11 copy];
  [v4 setComposedMessage:v12];

  return v4;
}

- (void)setKeychainItemAdded:(id)a3
{
  if (self->_keychainItemAdded != a3) {
    objc_storeStrong((id *)&self->_keychainItemAdded, a3);
  }
  MEMORY[0x270F9A758]();
}

- (id)dictionary
{
  v9.receiver = self;
  v9.super_class = (Class)LKLogKeychainItemAdditionEvent;
  id v3 = [(LKLogEvent *)&v9 dictionary];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(LKLogKeychainItemAdditionEvent *)self keychainItemAdded];
  if (v5)
  {
    [v4 setObject:v5 forKeyedSubscript:@"keychainItemAdded"];
  }
  else
  {
    v6 = objc_opt_new();
    [v4 setObject:v6 forKeyedSubscript:@"keychainItemAdded"];
  }
  v7 = (void *)[v4 copy];

  return v7;
}

- (NSString)keychainItemAdded
{
  return self->_keychainItemAdded;
}

- (void).cxx_destruct
{
}

@end