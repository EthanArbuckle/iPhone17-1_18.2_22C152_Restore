@interface HDIDSIncomingRequest
- (BOOL)expectsResponse;
- (HDIDSOutgoingResponse)response;
- (HDIDSParticipant)fromParticipant;
- (NSData)data;
- (NSString)description;
- (NSString)idsIdentifier;
- (PBCodable)pbRequest;
- (id)nanoSyncDescription;
- (unint64_t)priority;
- (unsigned)messageID;
- (void)dealloc;
@end

@implementation HDIDSIncomingRequest

- (id)nanoSyncDescription
{
  v3 = [(HDIDSIncomingRequest *)self pbRequest];
  v4 = HDNanoSyncDescriptionSafe(v3);

  LODWORD(v3) = [(HDIDSIncomingRequest *)self messageID];
  v5 = [(HDIDSIncomingRequest *)self idsIdentifier];
  v6 = FormattedMessageDescription((int)v3, 1, 1, v5, v4);

  return v6;
}

- (PBCodable)pbRequest
{
  id pbRequest = self->_pbRequest;
  if (!pbRequest)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_messageCenter);
    v6 = -[HDIDSMessageCenter _pbMappingForMessageID:]((uint64_t)WeakRetained, self->_messageID);

    if (v6)
    {
      v7 = (objc_class *)v6[1];
    }
    else
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HDIDSMessageCenter.m", 805, @"Can't access -pbRequest without a mapping for messageID: %hu", self->_messageID);

      v7 = 0;
    }
    v8 = (void *)[[v7 alloc] initWithData:self->_data];
    id v9 = self->_pbRequest;
    self->_id pbRequest = v8;

    id pbRequest = self->_pbRequest;
  }

  return (PBCodable *)pbRequest;
}

- (unsigned)messageID
{
  return self->_messageID;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (BOOL)expectsResponse
{
  return self->_expectsResponse;
}

- (HDIDSOutgoingResponse)response
{
  return self->_response;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_expectsResponse)
  {
    response = self->_response;
    if (!response || !response->_sent)
    {
      _HKInitializeLogging();
      v4 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        v5 = v4;
        *(_DWORD *)buf = 138412546;
        id v9 = (id)objc_opt_class();
        __int16 v10 = 2112;
        v11 = self;
        id v6 = v9;
        _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%@ (%@) deallocated without sending a response", buf, 0x16u);
      }
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)HDIDSIncomingRequest;
  [(HDIDSIncomingRequest *)&v7 dealloc];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_messageCenter);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_fromParticipant, 0);

  objc_storeStrong(&self->_pbRequest, 0);
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@ %p> messageID: %hu", v5, self, self->_messageID];

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

- (unint64_t)priority
{
  return self->_priority;
}

@end