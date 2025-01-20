@interface IDSUTunControlChannelIdentityPair
- (IDSMPFullLegacyIdentity)localFullIdentity;
- (IDSMPPublicLegacyIdentity)remotePublicIdentity;
- (IDSUTunControlChannelIdentityPair)initWithLocalFullIdentity:(id)a3 remotePublicIdentity:(id)a4;
- (id)description;
@end

@implementation IDSUTunControlChannelIdentityPair

- (IDSUTunControlChannelIdentityPair)initWithLocalFullIdentity:(id)a3 remotePublicIdentity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSUTunControlChannelIdentityPair;
  v9 = [(IDSUTunControlChannelIdentityPair *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_localFullIdentity, a3);
    objc_storeStrong((id *)&v10->_remotePublicIdentity, a4);
  }

  return v10;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(IDSUTunControlChannelIdentityPair *)self localFullIdentity];
  v6 = [(IDSUTunControlChannelIdentityPair *)self remotePublicIdentity];
  id v7 = +[NSString stringWithFormat:@"<%@:%p local: %@ remote: %@>", v4, self, v5, v6];

  return v7;
}

- (IDSMPFullLegacyIdentity)localFullIdentity
{
  return self->_localFullIdentity;
}

- (IDSMPPublicLegacyIdentity)remotePublicIdentity
{
  return self->_remotePublicIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remotePublicIdentity, 0);

  objc_storeStrong((id *)&self->_localFullIdentity, 0);
}

@end