@interface EKPersistentChangeStoreInfo
- (NSString)minConsumedClientIdentifier;
- (id)description;
- (int)minConsumedSequenceNumber;
- (int)secondMinConsumedSequenceNumber;
- (void)setMinConsumedClientIdentifier:(id)a3;
- (void)setMinConsumedSequenceNumber:(int)a3;
- (void)setSecondMinConsumedSequenceNumber:(int)a3;
@end

@implementation EKPersistentChangeStoreInfo

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(EKPersistentChangeStoreInfo *)self minConsumedClientIdentifier];
  objc_msgSend(v3, "stringWithFormat:", @"%@ <%p> {minConsumedClientIdentifier \"%@\"; minConsumedSequenceNumber = %d; secondMinConsumedSequenceNumber = %d}",
    v4,
    self,
    v5,
    [(EKPersistentChangeStoreInfo *)self minConsumedSequenceNumber],
  v6 = [(EKPersistentChangeStoreInfo *)self secondMinConsumedSequenceNumber]);

  return v6;
}

- (int)minConsumedSequenceNumber
{
  return self->_minConsumedSequenceNumber;
}

- (void)setMinConsumedSequenceNumber:(int)a3
{
  self->_minConsumedSequenceNumber = a3;
}

- (NSString)minConsumedClientIdentifier
{
  return self->_minConsumedClientIdentifier;
}

- (void)setMinConsumedClientIdentifier:(id)a3
{
}

- (int)secondMinConsumedSequenceNumber
{
  return self->_secondMinConsumedSequenceNumber;
}

- (void)setSecondMinConsumedSequenceNumber:(int)a3
{
  self->_secondMinConsumedSequenceNumber = a3;
}

- (void).cxx_destruct
{
}

@end