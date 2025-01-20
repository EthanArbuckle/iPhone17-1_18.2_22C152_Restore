@interface IDSMPFullAccountIdentityCluster
+ (IDSMPFullAccountIdentityCluster)clusterWithDataRepresentation:(id)a3 error:(id *)a4;
+ (IDSMPFullAccountIdentityCluster)clusterWithFullAccountIdentity:(id)a3 fullAdminServiceIdentities:(id)a4 fullSigningServiceIdentities:(id)a5 error:(id *)a6;
- (BOOL)isParentOfCluster:(id)a3;
- (ENGroupID)groupID;
- (IDSMPFullAccountIdentity)fullAccountIdentity;
- (NSArray)fullServiceIdentitiesAdmin;
- (NSArray)fullServiceIdentitiesSigning;
- (NSData)forwardingTicket;
- (__SecKey)publicKey;
- (id)adminServiceIdentityWithType:(int64_t)a3;
- (id)clusterByUpdatingGroupID:(id)a3 error:(id *)a4;
- (id)dataRepresentationWithError:(id *)a3;
- (id)publicAccountClusterWithError:(id *)a3;
- (id)rolledClusterWithFullAccountIdentity:(id)a3 fullAdminServiceIdentities:(id)a4 fullSigningServiceIdentities:(id)a5 error:(id *)a6;
- (id)signData:(id)a3 withError:(id *)a4;
- (id)signingServiceIdentityWithType:(int64_t)a3;
@end

@implementation IDSMPFullAccountIdentityCluster

+ (IDSMPFullAccountIdentityCluster)clusterWithFullAccountIdentity:(id)a3 fullAdminServiceIdentities:(id)a4 fullSigningServiceIdentities:(id)a5 error:(id *)a6
{
  return 0;
}

+ (IDSMPFullAccountIdentityCluster)clusterWithDataRepresentation:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)publicAccountClusterWithError:(id *)a3
{
  return 0;
}

- (id)dataRepresentationWithError:(id *)a3
{
  return 0;
}

- (IDSMPFullAccountIdentity)fullAccountIdentity
{
  return 0;
}

- (id)clusterByUpdatingGroupID:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)rolledClusterWithFullAccountIdentity:(id)a3 fullAdminServiceIdentities:(id)a4 fullSigningServiceIdentities:(id)a5 error:(id *)a6
{
  return 0;
}

- (NSArray)fullServiceIdentitiesAdmin
{
  return 0;
}

- (NSArray)fullServiceIdentitiesSigning
{
  return 0;
}

- (BOOL)isParentOfCluster:(id)a3
{
  return 0;
}

- (ENGroupID)groupID
{
  return 0;
}

- (NSData)forwardingTicket
{
  return 0;
}

- (id)adminServiceIdentityWithType:(int64_t)a3
{
  return 0;
}

- (id)signingServiceIdentityWithType:(int64_t)a3
{
  return 0;
}

- (id)signData:(id)a3 withError:(id *)a4
{
  return 0;
}

- (__SecKey)publicKey
{
  return self->_publicKey;
}

@end