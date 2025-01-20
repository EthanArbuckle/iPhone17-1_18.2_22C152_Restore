@interface HDSeriesFreezeResult
- (HDSeriesFreezeResult)initWithStatus:(int64_t)a3 frozenIdentifier:(id)a4;
- (NSUUID)frozenIdentifier;
- (int64_t)status;
@end

@implementation HDSeriesFreezeResult

- (HDSeriesFreezeResult)initWithStatus:(int64_t)a3 frozenIdentifier:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDSeriesFreezeResult;
  v7 = [(HDSeriesFreezeResult *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_status = a3;
    uint64_t v9 = [v6 copy];
    frozenIdentifier = v8->_frozenIdentifier;
    v8->_frozenIdentifier = (NSUUID *)v9;
  }
  return v8;
}

- (int64_t)status
{
  return self->_status;
}

- (NSUUID)frozenIdentifier
{
  return self->_frozenIdentifier;
}

- (void).cxx_destruct
{
}

@end