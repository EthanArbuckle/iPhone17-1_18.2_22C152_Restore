@interface _NMReplyInfo
- (NSString)idsMessageIdentifier;
- (_NMReplyInfo)init;
- (double)requestReceivedTimestamp;
- (void)dealloc;
- (void)setIdsMessageIdentifier:(id)a3;
- (void)setRequestReceivedTimestamp:(double)a3;
@end

@implementation _NMReplyInfo

- (_NMReplyInfo)init
{
  v10.receiver = self;
  v10.super_class = (Class)_NMReplyInfo;
  v2 = [(_NMReplyInfo *)&v10 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = NSStringFromClass(v3);
    id v5 = +[NSString stringWithFormat:@"%@.%p", v4, v2];
    [v5 UTF8String];
    uint64_t v6 = os_transaction_create();
    transaction = v2->_transaction;
    v2->_transaction = (OS_os_transaction *)v6;

    v8 = v2;
  }

  return v2;
}

- (void)dealloc
{
  transaction = self->_transaction;
  self->_transaction = 0;

  v4.receiver = self;
  v4.super_class = (Class)_NMReplyInfo;
  [(_NMReplyInfo *)&v4 dealloc];
}

- (NSString)idsMessageIdentifier
{
  return self->idsMessageIdentifier;
}

- (void)setIdsMessageIdentifier:(id)a3
{
}

- (double)requestReceivedTimestamp
{
  return self->_requestReceivedTimestamp;
}

- (void)setRequestReceivedTimestamp:(double)a3
{
  self->_requestReceivedTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->idsMessageIdentifier, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end