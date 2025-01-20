@interface BNPenderQueueEntry
- (BNPenderQueueEntry)initWithPender:(id)a3;
- (BNPending)pender;
- (NSUUID)entryIdentifier;
@end

@implementation BNPenderQueueEntry

- (BNPenderQueueEntry)initWithPender:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"BNPenderQueue.m", 194, @"Invalid parameter not satisfying: %@", @"pender" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)BNPenderQueueEntry;
  v7 = [(BNPenderQueueEntry *)&v13 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_pender, a3);
    uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
    entryIdentifier = v8->_entryIdentifier;
    v8->_entryIdentifier = (NSUUID *)v9;
  }
  return v8;
}

- (BNPending)pender
{
  return self->_pender;
}

- (NSUUID)entryIdentifier
{
  return self->_entryIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryIdentifier, 0);
  objc_storeStrong((id *)&self->_pender, 0);
}

@end