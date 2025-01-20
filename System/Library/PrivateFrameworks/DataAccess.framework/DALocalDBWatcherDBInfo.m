@interface DALocalDBWatcherDBInfo
- (DALocalDBWatcherDBInfo)initWithPath:(id)a3;
- (NSMutableDictionary)blocksByConcernedParty;
- (NSString)path;
- (id)allBlocks;
- (id)allConcernedParties;
- (int)lastSavedSequenceNumber;
- (void)addBlock:(id)a3 forConcernedParty:(id)a4 account:(id)a5;
- (void)removeBlockForConcernedParty:(id)a3 account:(id)a4;
- (void)setBlocksByConcernedParty:(id)a3;
- (void)setLastSavedSequenceNumber:(int)a3;
@end

@implementation DALocalDBWatcherDBInfo

- (DALocalDBWatcherDBInfo)initWithPath:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DALocalDBWatcherDBInfo;
  v6 = [(DALocalDBWatcherDBInfo *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_path, a3);
    v7->_lastSavedSequenceNumber = 0;
    uint64_t v8 = objc_opt_new();
    blocksByConcernedParty = v7->_blocksByConcernedParty;
    v7->_blocksByConcernedParty = (NSMutableDictionary *)v8;
  }
  return v7;
}

- (void)addBlock:(id)a3 forConcernedParty:(id)a4 account:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v12 = [[DALocalDBWatcherCalConcernedParty alloc] initWithConcernedParty:v9 accountID:v8];

  objc_super v11 = (void *)MEMORY[0x1BA9EA500](v10);
  [(NSMutableDictionary *)self->_blocksByConcernedParty setObject:v11 forKeyedSubscript:v12];
}

- (void)removeBlockForConcernedParty:(id)a3 account:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[DALocalDBWatcherCalConcernedParty alloc] initWithConcernedParty:v7 accountID:v6];

  [(NSMutableDictionary *)self->_blocksByConcernedParty setObject:0 forKeyedSubscript:v8];
  if (![(NSMutableDictionary *)self->_blocksByConcernedParty count]) {
    self->_lastSavedSequenceNumber = 0;
  }
}

- (id)allConcernedParties
{
  return (id)[(NSMutableDictionary *)self->_blocksByConcernedParty allKeys];
}

- (id)allBlocks
{
  return (id)[(NSMutableDictionary *)self->_blocksByConcernedParty allValues];
}

- (NSString)path
{
  return self->_path;
}

- (int)lastSavedSequenceNumber
{
  return self->_lastSavedSequenceNumber;
}

- (void)setLastSavedSequenceNumber:(int)a3
{
  self->_lastSavedSequenceNumber = a3;
}

- (NSMutableDictionary)blocksByConcernedParty
{
  return self->_blocksByConcernedParty;
}

- (void)setBlocksByConcernedParty:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blocksByConcernedParty, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end