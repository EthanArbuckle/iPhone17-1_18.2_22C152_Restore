@interface ECSMTPAccount
+ (id)standardPorts;
+ (id)standardSSLPorts;
- (id)_hostnameFromParentAccount:(id)a3;
- (id)portNumberObject;
- (id)usesSSLObject;
- (int64_t)defaultPortNumber;
@end

@implementation ECSMTPAccount

+ (id)standardPorts
{
  return &unk_1F1A731E8;
}

+ (id)standardSSLPorts
{
  return &unk_1F1A73200;
}

- (int64_t)defaultPortNumber
{
  return 25;
}

- (id)_hostnameFromParentAccount:(id)a3
{
  v3 = [a3 propertiesForDataclass:*MEMORY[0x1E4F17AD8]];
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F17700]];

  return v4;
}

- (id)usesSSLObject
{
  v9.receiver = self;
  v9.super_class = (Class)ECSMTPAccount;
  id v3 = [(ECAccount *)&v9 usesSSLObject];
  if (!v3)
  {
    v4 = [(ECAccount *)self systemAccount];
    v5 = [v4 parentAccount];

    v6 = [v5 propertiesForDataclass:*MEMORY[0x1E4F17AD8]];
    v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F17710]];

    if ([v7 BOOLValue]) {
      id v3 = v7;
    }
    else {
      id v3 = 0;
    }
  }
  return v3;
}

- (id)portNumberObject
{
  v12.receiver = self;
  v12.super_class = (Class)ECSMTPAccount;
  id v3 = [(ECAccount *)&v12 portNumberObject];
  if (!v3)
  {
    v4 = [(ECAccount *)self systemAccount];
    v5 = [v4 parentAccount];

    v6 = [v5 propertiesForDataclass:*MEMORY[0x1E4F17AD8]];
    v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F17708]];

    if (v7)
    {
      v8 = [(ECAccount *)self standardPorts];
      if ([v8 containsObject:v7])
      {
      }
      else
      {
        objc_super v9 = [(ECAccount *)self standardSSLPorts];
        char v10 = [v9 containsObject:v7];

        if ((v10 & 1) == 0)
        {
          id v3 = v7;
          goto LABEL_7;
        }
      }
    }
    id v3 = 0;
LABEL_7:
  }
  return v3;
}

@end