@interface HDIDSIncomingResponse
- (HDIDSParticipant)fromParticipant;
- (NSData)data;
- (NSDate)requestSent;
- (NSDictionary)requestPersistentUserInfo;
- (NSString)description;
- (NSString)idsIdentifier;
- (NSString)requestIDSIdentifier;
- (PBCodable)pbResponse;
- (id)nanoSyncDescription;
- (unsigned)messageID;
@end

@implementation HDIDSIncomingResponse

- (id)nanoSyncDescription
{
  v3 = [(HDIDSIncomingResponse *)self pbResponse];
  v4 = HDNanoSyncDescriptionSafe(v3);

  LODWORD(v3) = [(HDIDSIncomingResponse *)self messageID];
  v5 = [(HDIDSIncomingResponse *)self idsIdentifier];
  v6 = FormattedMessageDescription((int)v3, 1, 0, v5, v4);

  return v6;
}

- (PBCodable)pbResponse
{
  return self->_pbResponse;
}

- (unsigned)messageID
{
  return self->_messageID;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pbResponse, 0);
  objc_destroyWeak((id *)&self->_messageCenter);
  objc_storeStrong((id *)&self->_requestPersistentUserInfo, 0);
  objc_storeStrong((id *)&self->_requestSent, 0);
  objc_storeStrong((id *)&self->_requestIDSIdentifier, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_fromParticipant, 0);
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ %p> messageID: %hu", v5, self, self->_messageID];

  return (NSString *)v6;
}

- (HDIDSParticipant)fromParticipant
{
  return self->_fromParticipant;
}

- (NSData)data
{
  return self->_data;
}

- (NSString)requestIDSIdentifier
{
  return self->_requestIDSIdentifier;
}

- (NSDate)requestSent
{
  return self->_requestSent;
}

- (NSDictionary)requestPersistentUserInfo
{
  return self->_requestPersistentUserInfo;
}

@end