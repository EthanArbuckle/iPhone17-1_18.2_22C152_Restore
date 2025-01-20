@interface NMSUnpairedResponse
- (NMSMessageCenter)messageCenter;
- (NSData)data;
- (NSString)idsIdentifier;
- (id)pbResponse;
- (unsigned)messageID;
- (void)setData:(id)a3;
- (void)setIdsIdentifier:(id)a3;
- (void)setMessageCenter:(id)a3;
- (void)setMessageID:(unsigned __int16)a3;
- (void)setPbResponse:(id)a3;
@end

@implementation NMSUnpairedResponse

- (id)pbResponse
{
  id pbResponse = self->_pbResponse;
  if (!pbResponse)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_messageCenter);
    v5 = [WeakRetained _pbMappingForMessageID:self->_messageID];

    if (!v5) {
      +[NSException raise:@"NMSMisuseException", @"Can't access -pbResponse without a mapping for messageID: %hu", self->_messageID format];
    }
    id v6 = objc_msgSend(objc_alloc((Class)objc_msgSend(v5, "responseClass")), "initWithData:", self->_data);
    id v7 = self->_pbResponse;
    self->_id pbResponse = v6;

    id pbResponse = self->_pbResponse;
  }
  return pbResponse;
}

- (NMSMessageCenter)messageCenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageCenter);
  return (NMSMessageCenter *)WeakRetained;
}

- (void)setMessageCenter:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (unsigned)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(unsigned __int16)a3
{
  self->_messageID = a3;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setIdsIdentifier:(id)a3
{
}

- (void)setPbResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pbResponse, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_destroyWeak((id *)&self->_messageCenter);
}

@end