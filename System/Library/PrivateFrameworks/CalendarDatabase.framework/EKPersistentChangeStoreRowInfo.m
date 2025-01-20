@interface EKPersistentChangeStoreRowInfo
- (NSString)clientIdentifier;
- (id)description;
- (int)consumedSequenceNumber;
- (void)setClientIdentifier:(id)a3;
- (void)setConsumedSequenceNumber:(int)a3;
@end

@implementation EKPersistentChangeStoreRowInfo

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(EKPersistentChangeStoreRowInfo *)self clientIdentifier];
  objc_msgSend(v3, "stringWithFormat:", @"%@ <%p> {clientIdentifier \"%@\"; consumedSequenceNumber = %d}",
    v4,
    self,
    v5,
  v6 = [(EKPersistentChangeStoreRowInfo *)self consumedSequenceNumber]);

  return v6;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (int)consumedSequenceNumber
{
  return self->_consumedSequenceNumber;
}

- (void)setConsumedSequenceNumber:(int)a3
{
  self->_consumedSequenceNumber = a3;
}

- (void).cxx_destruct
{
}

@end