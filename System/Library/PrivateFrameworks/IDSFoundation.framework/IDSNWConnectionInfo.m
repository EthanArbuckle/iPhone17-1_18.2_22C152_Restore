@interface IDSNWConnectionInfo
- (BOOL)isCellular;
- (BOOL)isQUICPod;
- (BOOL)isRelay;
- (BOOL)isValid;
- (NSString)protocolStackDescription;
- (NSString)sessionID;
- (NSString)token;
- (NSUUID)childConnectionID;
- (OS_nw_connection)connection;
- (unint64_t)clientUniquePID;
- (unint64_t)connectionID;
- (void)setChildConnectionID:(id)a3;
- (void)setClientUniquePID:(unint64_t)a3;
- (void)setConnection:(id)a3;
- (void)setConnectionID:(unint64_t)a3;
- (void)setIsCellular:(BOOL)a3;
- (void)setIsQUICPod:(BOOL)a3;
- (void)setIsRelay:(BOOL)a3;
- (void)setIsValid:(BOOL)a3;
- (void)setProtocolStackDescription:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setToken:(id)a3;
@end

@implementation IDSNWConnectionInfo

- (unint64_t)connectionID
{
  return self->_connectionID;
}

- (void)setConnectionID:(unint64_t)a3
{
  self->_connectionID = a3;
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (BOOL)isQUICPod
{
  return self->_isQUICPod;
}

- (void)setIsQUICPod:(BOOL)a3
{
  self->_isQUICPod = a3;
}

- (BOOL)isRelay
{
  return self->_isRelay;
}

- (void)setIsRelay:(BOOL)a3
{
  self->_isRelay = a3;
}

- (BOOL)isCellular
{
  return self->_isCellular;
}

- (void)setIsCellular:(BOOL)a3
{
  self->_isCellular = a3;
}

- (unint64_t)clientUniquePID
{
  return self->_clientUniquePID;
}

- (void)setClientUniquePID:(unint64_t)a3
{
  self->_clientUniquePID = a3;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (NSUUID)childConnectionID
{
  return self->_childConnectionID;
}

- (void)setChildConnectionID:(id)a3
{
}

- (NSString)protocolStackDescription
{
  return self->_protocolStackDescription;
}

- (void)setProtocolStackDescription:(id)a3
{
}

- (OS_nw_connection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_protocolStackDescription, 0);
  objc_storeStrong((id *)&self->_childConnectionID, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end