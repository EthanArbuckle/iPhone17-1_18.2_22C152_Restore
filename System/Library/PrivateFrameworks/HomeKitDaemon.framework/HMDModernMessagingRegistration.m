@interface HMDModernMessagingRegistration
+ (id)clientHMMMMessageNameFromPrefixedMessageName:(id)a3;
+ (id)prefixedHMMMMessageNameWithMessageName:(id)a3;
- (BOOL)matchesPrefixedMessageName:(id)a3;
- (HMDModernMessagingRegistration)initWithMessageName:(id)a3 xpcConnection:(id)a4;
- (HMDXPCClientConnection)xpcConnection;
- (NSString)messageName;
- (id)prefixedMessageName;
@end

@implementation HMDModernMessagingRegistration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_messageName, 0);
}

- (HMDXPCClientConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (NSString)messageName
{
  return self->_messageName;
}

- (BOOL)matchesPrefixedMessageName:(id)a3
{
  id v4 = a3;
  v5 = [(HMDModernMessagingRegistration *)self messageName];
  v6 = +[HMDModernMessagingRegistration prefixedHMMMMessageNameWithMessageName:v5];
  char v7 = [v6 isEqualToString:v4];

  return v7;
}

- (id)prefixedMessageName
{
  v2 = [(HMDModernMessagingRegistration *)self messageName];
  v3 = +[HMDModernMessagingRegistration prefixedHMMMMessageNameWithMessageName:v2];

  return v3;
}

- (HMDModernMessagingRegistration)initWithMessageName:(id)a3 xpcConnection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDModernMessagingRegistration;
  v9 = [(HMDModernMessagingRegistration *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_messageName, a3);
    objc_storeStrong((id *)&v10->_xpcConnection, a4);
  }

  return v10;
}

+ (id)clientHMMMMessageNameFromPrefixedMessageName:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 length];
  if (v4 <= [@"HMMM.message.name.prefix_" length])
  {
    v5 = 0;
  }
  else
  {
    v5 = [v3 substringFromIndex:objc_msgSend(@"HMMM.message.name.prefix_", "length")];
  }

  return v5;
}

+ (id)prefixedHMMMMessageNameWithMessageName:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@%@", @"HMMM.message.name.prefix_", a3];
}

@end