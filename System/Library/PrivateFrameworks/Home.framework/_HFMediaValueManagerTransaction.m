@interface _HFMediaValueManagerTransaction
- (NAFuture)writeFuture;
- (NSNumber)transactionNumber;
- (_HFMediaValueManagerTransaction)init;
- (id)description;
- (int64_t)playbackState;
- (void)setPlaybackState:(int64_t)a3;
- (void)setTransactionNumber:(id)a3;
- (void)setWriteFuture:(id)a3;
@end

@implementation _HFMediaValueManagerTransaction

- (_HFMediaValueManagerTransaction)init
{
  v6.receiver = self;
  v6.super_class = (Class)_HFMediaValueManagerTransaction;
  v2 = [(_HFMediaValueManagerTransaction *)&v6 init];
  if (v2)
  {
    ++init_i;
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    transactionNumber = v2->_transactionNumber;
    v2->_transactionNumber = (NSNumber *)v3;
  }
  return v2;
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)_HFMediaValueManagerTransaction;
  uint64_t v3 = [(_HFMediaValueManagerTransaction *)&v9 description];
  v4 = [(_HFMediaValueManagerTransaction *)self transactionNumber];
  v5 = NSStringFromHMMediaPlaybackState([(_HFMediaValueManagerTransaction *)self playbackState]);
  objc_super v6 = [(_HFMediaValueManagerTransaction *)self writeFuture];
  v7 = [v3 stringByAppendingFormat:@"(Transaction ID %@) --> Transitioning to %@; %@", v4, v5, v6];

  return v7;
}

- (NAFuture)writeFuture
{
  return self->_writeFuture;
}

- (void)setWriteFuture:(id)a3
{
}

- (int64_t)playbackState
{
  return self->_playbackState;
}

- (void)setPlaybackState:(int64_t)a3
{
  self->_playbackState = a3;
}

- (NSNumber)transactionNumber
{
  return self->_transactionNumber;
}

- (void)setTransactionNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionNumber, 0);
  objc_storeStrong((id *)&self->_writeFuture, 0);
}

@end