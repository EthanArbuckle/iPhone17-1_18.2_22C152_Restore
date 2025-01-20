@interface MEComposeSession
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MEComposeContext)composeContext;
- (MEComposeSession)initWithCoder:(id)a3;
- (MEComposeSession)initWithSessionID:(id)a3 composeContext:(id)a4 mailMessage:(id)a5;
- (MEComposeSessionHostProtocol_XPC)remoteHostContext;
- (MEMessage)mailMessage;
- (MERemoteExtension)remoteExtension;
- (NSUUID)sessionID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)reloadSession;
- (void)setComposeContext:(id)a3;
- (void)setMailMessage:(id)a3;
- (void)setRemoteExtension:(id)a3;
- (void)setRemoteHostContext:(id)a3;
- (void)setSessionID:(id)a3;
@end

@implementation MEComposeSession

- (MEComposeSession)initWithSessionID:(id)a3 composeContext:(id)a4 mailMessage:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MEComposeSession;
  v12 = [(MEComposeSession *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_composeContext, a4);
    objc_storeStrong((id *)&v13->_sessionID, a3);
    objc_storeStrong((id *)&v13->_mailMessage, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MEComposeSession)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_sessionID"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_composeContext"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_mailMessage"];
  v8 = [(MEComposeSession *)self initWithSessionID:v5 composeContext:v6 mailMessage:v7];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(MEComposeSession *)self sessionID];
  [v7 encodeObject:v4 forKey:@"EFPropertyKey_sessionID"];

  v5 = [(MEComposeSession *)self composeContext];
  [v7 encodeObject:v5 forKey:@"EFPropertyKey_composeContext"];

  v6 = [(MEComposeSession *)self mailMessage];
  [v7 encodeObject:v6 forKey:@"EFPropertyKey_mailMessage"];
}

- (void)reloadSession
{
  id v3 = [(MEComposeSession *)self remoteHostContext];
  [v3 regenerateEmailAddressTokenChangesForSession:self];

  id v4 = [(MEComposeSession *)self remoteHostContext];
  [v4 regenerateSecurityStatusInformationForSession:self];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  if ([v5 isEqual:objc_opt_class()])
  {
    v6 = [v4 sessionID];
    id v7 = [(MEComposeSession *)self sessionID];
    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_sessionID hash] + 33;
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (MEMessage)mailMessage
{
  return self->_mailMessage;
}

- (void)setMailMessage:(id)a3
{
}

- (MEComposeContext)composeContext
{
  return self->_composeContext;
}

- (void)setComposeContext:(id)a3
{
}

- (MERemoteExtension)remoteExtension
{
  return self->_remoteExtension;
}

- (void)setRemoteExtension:(id)a3
{
}

- (MEComposeSessionHostProtocol_XPC)remoteHostContext
{
  return self->_remoteHostContext;
}

- (void)setRemoteHostContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteHostContext, 0);
  objc_storeStrong((id *)&self->_remoteExtension, 0);
  objc_storeStrong((id *)&self->_composeContext, 0);
  objc_storeStrong((id *)&self->_mailMessage, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end