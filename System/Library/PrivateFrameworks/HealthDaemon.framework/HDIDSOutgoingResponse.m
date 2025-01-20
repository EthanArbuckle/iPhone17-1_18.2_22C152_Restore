@interface HDIDSOutgoingResponse
- (BOOL)doNotCompress;
- (BOOL)forceLocalDelivery;
- (HDIDSMessageCenter)messageCenter;
- (HDIDSOutgoingResponse)init;
- (HDIDSParticipant)toParticipant;
- (NSData)data;
- (NSDictionary)persistentUserInfo;
- (NSString)description;
- (NSString)idsIdentifier;
- (NSString)requestIdsIdentifier;
- (PBCodable)pbResponse;
- (double)sendTimeout;
- (id)nanoSyncDescription;
- (unint64_t)priority;
- (unsigned)messageID;
- (unsigned)requestMessageID;
- (void)configureWithActivationRestore:(id)a3 syncStore:(id)a4 profile:(id)a5;
- (void)configureWithStatus:(id)a3 syncStore:(id)a4 profile:(id)a5;
- (void)dealloc;
- (void)send;
- (void)setData:(id)a3;
- (void)setDoNotCompress:(BOOL)a3;
- (void)setForceLocalDelivery:(BOOL)a3;
- (void)setPbResponse:(id)a3;
- (void)setPersistentUserInfo:(id)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setSendTimeout:(double)a3;
@end

@implementation HDIDSOutgoingResponse

- (HDIDSOutgoingResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)HDIDSOutgoingResponse;
  v2 = [(HDIDSOutgoingResponse *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[HKDaemonTransaction transactionWithOwner:v2];
    transaction = v2->_transaction;
    v2->_transaction = (HDDaemonTransaction *)v3;
  }
  return v2;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (unsigned)messageID
{
  return self->_messageID;
}

- (void)setPbResponse:(id)a3
{
  v5 = (PBCodable *)a3;
  objc_super v6 = -[HDIDSMessageCenter _pbMappingForMessageID:]((uint64_t)self->_messageCenter, self->_messageID);
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    [v11 handleFailureInMethod:a2, self, @"HDIDSMessageCenter.m", 859, @"Invalid pbResponse of type %@", v13 object file lineNumber description];
  }
  pbResponse = self->_pbResponse;
  self->_pbResponse = v5;
  v14 = v5;

  v9 = [(PBCodable *)self->_pbResponse data];
  data = self->_data;
  self->_data = v9;
}

- (void)setPersistentUserInfo:(id)a3
{
}

- (void)setForceLocalDelivery:(BOOL)a3
{
  self->_forceLocalDelivery = a3;
}

- (void)setSendTimeout:(double)a3
{
  self->_sendTimeout = a3;
}

- (void)send
{
  messageCenter = self->_messageCenter;
  uint64_t v3 = self;
  v4 = v3;
  if (messageCenter)
  {
    unsigned __int16 v5 = [(HDIDSOutgoingResponse *)v3 messageID];
    unsigned __int16 v6 = [(HDIDSOutgoingResponse *)v4 requestMessageID];
    v7 = [(HDIDSOutgoingResponse *)v4 idsIdentifier];
    if (!v7)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:sel__sendResponse_ object:messageCenter file:@"HDIDSMessageCenter.m" lineNumber:425 description:@"Response's request needs an idsIdentifier"];
    }
    v8 = [(HDIDSOutgoingResponse *)v4 toParticipant];

    if (!v8)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:sel__sendResponse_ object:messageCenter file:@"HDIDSMessageCenter.m" lineNumber:426 description:@"Response's to participant not found"];
    }
    if (v4->_sent)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:sel__sendResponse_ object:messageCenter file:@"HDIDSMessageCenter.m" lineNumber:427 description:@"You cannot call send twice for the same response object"];
    }
    v4->_sent = 1;
    queue = messageCenter->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__HDIDSMessageCenter__sendResponse___block_invoke;
    block[3] = &unk_1E630A7B0;
    block[4] = messageCenter;
    v17 = sel__sendResponse_;
    unsigned __int16 v18 = v5;
    v15 = v4;
    id v16 = v7;
    unsigned __int16 v19 = v6;
    id v10 = v7;
    dispatch_async(queue, block);
  }
}

- (unsigned)requestMessageID
{
  return self->_requestMessageID;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (NSData)data
{
  return self->_data;
}

- (unint64_t)priority
{
  return self->_priority;
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

- (NSDictionary)persistentUserInfo
{
  return self->_persistentUserInfo;
}

- (id)nanoSyncDescription
{
  uint64_t v3 = [(HDIDSOutgoingResponse *)self persistentUserInfo];
  v4 = +[HDCodableNanoSyncMessage messageFromPersistentUserInfo:v3];

  LODWORD(v3) = [(HDIDSOutgoingResponse *)self messageID];
  unsigned __int16 v5 = [(HDIDSOutgoingResponse *)self idsIdentifier];
  unsigned __int16 v6 = [v4 nanoSyncDescription];
  v7 = FormattedMessageDescription((int)v3, 0, 0, v5, v6);

  return v7;
}

- (void)dealloc
{
  [(HKDaemonTransaction *)self->_transaction invalidate];
  v3.receiver = self;
  v3.super_class = (Class)HDIDSOutgoingResponse;
  [(HDIDSOutgoingResponse *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pbResponse, 0);
  objc_storeStrong((id *)&self->_persistentUserInfo, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_toParticipant, 0);
  objc_storeStrong((id *)&self->_messageCenter, 0);
  objc_storeStrong((id *)&self->_requestIdsIdentifier, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

- (void)configureWithActivationRestore:(id)a3 syncStore:(id)a4 profile:(id)a5
{
  id v14 = a4;
  id v9 = a5;
  id v10 = a3;
  if ([(HDIDSOutgoingResponse *)self messageID] != 1)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HDNanoSyncSupport.m", 648, @"Invalid parameter not satisfying: %@", @"[self messageID] == HDNanoSyncMessageRestore" object file lineNumber description];
  }
  v11 = +[HDCodableNanoSyncMessage messageWithSyncStore:v14 profile:v9];
  [v11 setActivationRestore:v10];

  [(HDIDSOutgoingResponse *)self setPbResponse:v11];
  v12 = (void *)[v11 copyPersistentUserInfo];
  [(HDIDSOutgoingResponse *)self setPersistentUserInfo:v12];
}

- (void)configureWithStatus:(id)a3 syncStore:(id)a4 profile:(id)a5
{
  id v14 = a4;
  id v9 = a5;
  id v10 = a3;
  if ([(HDIDSOutgoingResponse *)self messageID] != 2)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HDNanoSyncSupport.m", 660, @"Invalid parameter not satisfying: %@", @"[self messageID] == HDNanoSyncMessageChanges" object file lineNumber description];
  }
  v11 = +[HDCodableNanoSyncMessage messageWithSyncStore:v14 profile:v9];
  [v11 setStatus:v10];

  [(HDIDSOutgoingResponse *)self setPbResponse:v11];
  v12 = (void *)[v11 copyPersistentUserInfo];
  [(HDIDSOutgoingResponse *)self setPersistentUserInfo:v12];
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  unsigned __int16 v5 = NSStringFromClass(v4);
  unsigned __int16 v6 = [v3 stringWithFormat:@"<%@ %p> messageID: %hu", v5, self, self->_messageID];

  return (NSString *)v6;
}

- (NSString)requestIdsIdentifier
{
  return self->_requestIdsIdentifier;
}

- (HDIDSMessageCenter)messageCenter
{
  return self->_messageCenter;
}

- (HDIDSParticipant)toParticipant
{
  return self->_toParticipant;
}

- (void)setData:(id)a3
{
}

- (void)setDoNotCompress:(BOOL)a3
{
  self->_doNotCompress = a3;
}

- (PBCodable)pbResponse
{
  return self->_pbResponse;
}

@end