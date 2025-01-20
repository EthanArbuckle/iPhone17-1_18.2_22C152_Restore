@interface IDSGroupServerKeyElectionStoreItem
- (ENGroupID)groupID;
- (NSData)ENID;
- (NSData)accountBlob;
- (NSData)forwardingTicket;
- (NSData)signature;
- (NSNumber)parentVersion;
- (__SecKey)newPg;
- (__SecKey)parentPg;
- (void)setAccountBlob:(id)a3;
- (void)setENID:(id)a3;
- (void)setForwardingTicket:(id)a3;
- (void)setGroupID:(id)a3;
- (void)setNewPg:(__SecKey *)a3;
- (void)setParentPg:(__SecKey *)a3;
- (void)setParentVersion:(id)a3;
- (void)setSignature:(id)a3;
@end

@implementation IDSGroupServerKeyElectionStoreItem

- (NSData)accountBlob
{
  return self->_accountBlob;
}

- (void)setAccountBlob:(id)a3
{
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (ENGroupID)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
}

- (NSData)forwardingTicket
{
  return self->_forwardingTicket;
}

- (void)setForwardingTicket:(id)a3
{
}

- (__SecKey)parentPg
{
  return self->_parentPg;
}

- (void)setParentPg:(__SecKey *)a3
{
  self->_parentPg = a3;
}

- (__SecKey)newPg
{
  return self->_newPg;
}

- (void)setNewPg:(__SecKey *)a3
{
  self->_newPg = a3;
}

- (NSNumber)parentVersion
{
  return self->_parentVersion;
}

- (void)setParentVersion:(id)a3
{
}

- (NSData)ENID
{
  return self->_ENID;
}

- (void)setENID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ENID, 0);
  objc_storeStrong((id *)&self->_parentVersion, 0);
  objc_storeStrong((id *)&self->_forwardingTicket, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_signature, 0);

  objc_storeStrong((id *)&self->_accountBlob, 0);
}

@end