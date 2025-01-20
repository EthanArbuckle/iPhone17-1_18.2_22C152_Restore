@interface HDIDSOutgoingRequest
+ (id)_requestWithMessageID:(void *)a3 message:(void *)a4 syncStore:;
+ (id)activationRequestWithRestore:(id)a3 syncStore:(id)a4 profile:(id)a5;
+ (id)changeRequestWithChangeSet:(id)a3 status:(id)a4 syncStore:(id)a5 profile:(id)a6;
+ (id)requestWithMessageID:(unsigned __int16)a3 participant:(id)a4;
+ (id)speculativeChangeRequestWithChangeSet:(id)a3 syncStore:(id)a4 profile:(id)a5;
- (BOOL)doNotCompress;
- (BOOL)forceLocalDelivery;
- (BOOL)nonWaking;
- (BOOL)queueOnly1;
- (HDIDSOutgoingRequest)init;
- (HDIDSParticipant)toParticipant;
- (NSData)data;
- (NSDictionary)persistentUserInfo;
- (NSString)description;
- (NSString)idsIdentifier;
- (PBCodable)pbRequest;
- (double)responseTimeout;
- (double)sendTimeout;
- (id)nanoSyncDescription;
- (unint64_t)priority;
- (unsigned)messageID;
- (void)setData:(id)a3;
- (void)setDoNotCompress:(BOOL)a3;
- (void)setForceLocalDelivery:(BOOL)a3;
- (void)setNonWaking:(BOOL)a3;
- (void)setPbRequest:(id)a3;
- (void)setPersistentUserInfo:(id)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setQueueOnly1:(BOOL)a3;
- (void)setResponseTimeout:(double)a3;
- (void)setSendTimeout:(double)a3;
@end

@implementation HDIDSOutgoingRequest

- (HDIDSOutgoingRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)HDIDSOutgoingRequest;
  result = [(HDIDSOutgoingRequest *)&v3 init];
  if (result) {
    result->_priority = 0;
  }
  return result;
}

- (unsigned)messageID
{
  return self->_messageID;
}

- (void)setForceLocalDelivery:(BOOL)a3
{
  self->_forceLocalDelivery = a3;
}

- (void)setSendTimeout:(double)a3
{
  self->_sendTimeout = a3;
}

- (void)setResponseTimeout:(double)a3
{
  self->_responseTimeout = a3;
}

- (void)setPbRequest:(id)a3
{
  objc_storeStrong((id *)&self->_pbRequest, a3);
  id v7 = a3;
  v5 = [(PBCodable *)self->_pbRequest data];
  data = self->_data;
  self->_data = v5;
}

- (void)setPersistentUserInfo:(id)a3
{
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (NSData)data
{
  return self->_data;
}

- (double)sendTimeout
{
  return self->_sendTimeout;
}

- (BOOL)doNotCompress
{
  return self->_doNotCompress;
}

- (BOOL)forceLocalDelivery
{
  return self->_forceLocalDelivery;
}

- (BOOL)queueOnly1
{
  return self->_queueOnly1;
}

- (NSDictionary)persistentUserInfo
{
  return self->_persistentUserInfo;
}

- (id)nanoSyncDescription
{
  objc_super v3 = [(HDIDSOutgoingRequest *)self persistentUserInfo];
  v4 = +[HDCodableNanoSyncMessage messageFromPersistentUserInfo:v3];

  LODWORD(v3) = [(HDIDSOutgoingRequest *)self messageID];
  v5 = [(HDIDSOutgoingRequest *)self idsIdentifier];
  v6 = [v4 nanoSyncDescription];
  id v7 = FormattedMessageDescription((int)v3, 0, 1, v5, v6);

  return v7;
}

- (double)responseTimeout
{
  return self->_responseTimeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pbRequest, 0);
  objc_destroyWeak((id *)&self->_messageCenter);
  objc_storeStrong((id *)&self->_persistentUserInfo, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_toParticipant, 0);
}

+ (id)activationRequestWithRestore:(id)a3 syncStore:(id)a4 profile:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = +[HDCodableNanoSyncMessage messageWithSyncStore:v8 profile:a5];
  [v10 setActivationRestore:v9];

  v11 = +[HDIDSOutgoingRequest _requestWithMessageID:message:syncStore:]((uint64_t)a1, 1, v10, v8);

  return v11;
}

+ (id)_requestWithMessageID:(void *)a3 message:(void *)a4 syncStore:
{
  id v6 = a4;
  id v7 = a3;
  self;
  id v8 = [v6 createRequestWithMessageID:a2];

  [v8 setPbRequest:v7];
  id v9 = (void *)[v7 copyPersistentUserInfo];

  [v8 setPersistentUserInfo:v9];

  return v8;
}

+ (id)changeRequestWithChangeSet:(id)a3 status:(id)a4 syncStore:(id)a5 profile:(id)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = +[HDCodableNanoSyncMessage messageWithSyncStore:v10 profile:a6];
  [v13 setChangeSet:v12];

  [v13 setStatus:v11];
  v14 = +[HDIDSOutgoingRequest _requestWithMessageID:message:syncStore:]((uint64_t)a1, 2, v13, v10);

  return v14;
}

+ (id)speculativeChangeRequestWithChangeSet:(id)a3 syncStore:(id)a4 profile:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = +[HDCodableNanoSyncMessage messageWithSyncStore:v8 profile:a5];
  [v10 setChangeSet:v9];

  id v11 = +[HDIDSOutgoingRequest _requestWithMessageID:message:syncStore:]((uint64_t)a1, 7, v10, v8);

  return v11;
}

+ (id)requestWithMessageID:(unsigned __int16)a3 participant:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init((Class)a1);
  v7[6] = a3;
  id v8 = (void *)*((void *)v7 + 2);
  *((void *)v7 + 2) = v6;

  return v7;
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@ %p> messageID: %hu", v5, self, self->_messageID];

  return (NSString *)v6;
}

- (HDIDSParticipant)toParticipant
{
  return self->_toParticipant;
}

- (void)setData:(id)a3
{
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (void)setDoNotCompress:(BOOL)a3
{
  self->_doNotCompress = a3;
}

- (void)setQueueOnly1:(BOOL)a3
{
  self->_queueOnly1 = a3;
}

- (BOOL)nonWaking
{
  return self->_nonWaking;
}

- (void)setNonWaking:(BOOL)a3
{
  self->_nonWaking = a3;
}

- (PBCodable)pbRequest
{
  return self->_pbRequest;
}

@end