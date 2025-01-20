@interface IDSOffGridMessageContext
- (IDSOffGridMessageContext)initWithIDSMessageContext:(id)a3;
- (NSString)identifier;
- (NSString)senderMergeID;
- (int64_t)transportType;
- (void)setTransportType:(int64_t)a3;
@end

@implementation IDSOffGridMessageContext

- (IDSOffGridMessageContext)initWithIDSMessageContext:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IDSOffGridMessageContext;
  v5 = [(IDSOffGridMessageContext *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 senderCorrelationIdentifier];
    senderMergeID = v5->_senderMergeID;
    v5->_senderMergeID = (NSString *)v6;

    uint64_t v8 = [v4 originalGUID];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;
  }
  return v5;
}

- (NSString)senderMergeID
{
  return self->_senderMergeID;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_senderMergeID, 0);
}

@end