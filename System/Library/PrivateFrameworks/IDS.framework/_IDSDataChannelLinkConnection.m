@interface _IDSDataChannelLinkConnection
- (BOOL)allowOutgoing;
- (BOOL)isQUICPod;
- (NSString)nwConnectionToken;
- (NSString)protocolStack;
- (NSString)type;
- (NSUUID)childConnectionID;
- (id)description;
- (unint64_t)clientNWConnectionID;
- (unint64_t)nwConnectionID;
- (void)setAllowOutgoing:(BOOL)a3;
- (void)setChildConnectionID:(id)a3;
- (void)setClientNWConnectionID:(unint64_t)a3;
- (void)setIsQUICPod:(BOOL)a3;
- (void)setNwConnectionID:(unint64_t)a3;
- (void)setNwConnectionToken:(id)a3;
- (void)setProtocolStack:(id)a3;
- (void)setType:(id)a3;
@end

@implementation _IDSDataChannelLinkConnection

- (id)description
{
  v3 = NSString;
  v4 = [(_IDSDataChannelLinkConnection *)self type];
  unint64_t v5 = [(_IDSDataChannelLinkConnection *)self clientNWConnectionID];
  v6 = [(_IDSDataChannelLinkConnection *)self protocolStack];
  v7 = [(_IDSDataChannelLinkConnection *)self childConnectionID];
  BOOL v8 = [(_IDSDataChannelLinkConnection *)self allowOutgoing];
  v9 = @"NO";
  if (v8) {
    v9 = @"YES";
  }
  v10 = [v3 stringWithFormat:@"<_IDSDataChannelLinkConnection %@ [C%llu] %@ — childConnectionID:%@ allowOutgoing:%@>", v4, v5, v6, v7, v9];

  return v10;
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setType:(id)a3
{
}

- (NSUUID)childConnectionID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setChildConnectionID:(id)a3
{
}

- (NSString)protocolStack
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProtocolStack:(id)a3
{
}

- (unint64_t)nwConnectionID
{
  return self->_nwConnectionID;
}

- (void)setNwConnectionID:(unint64_t)a3
{
  self->_nwConnectionID = a3;
}

- (unint64_t)clientNWConnectionID
{
  return self->_clientNWConnectionID;
}

- (void)setClientNWConnectionID:(unint64_t)a3
{
  self->_clientNWConnectionID = a3;
}

- (NSString)nwConnectionToken
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNwConnectionToken:(id)a3
{
}

- (BOOL)allowOutgoing
{
  return self->_allowOutgoing;
}

- (void)setAllowOutgoing:(BOOL)a3
{
  self->_allowOutgoing = a3;
}

- (BOOL)isQUICPod
{
  return self->_isQUICPod;
}

- (void)setIsQUICPod:(BOOL)a3
{
  self->_isQUICPod = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nwConnectionToken, 0);
  objc_storeStrong((id *)&self->_protocolStack, 0);
  objc_storeStrong((id *)&self->_childConnectionID, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

@end