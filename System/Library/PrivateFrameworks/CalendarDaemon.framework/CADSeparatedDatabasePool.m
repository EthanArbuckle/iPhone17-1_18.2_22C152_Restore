@interface CADSeparatedDatabasePool
- (CADSeparatedDatabasePool)initWithConfig:(id)a3 databaseID:(int)a4;
- (CalDatabaseInitializationConfiguration)config;
- (NSMutableArray)connections;
- (NSString)databasePath;
- (int)databaseID;
- (unint64_t)lastChangeTimestamp;
- (void)_returnConnectionToPool:(id)a3;
- (void)purgeConnectionsLastUsedPriorTo:(unint64_t)a3 stats:(id *)a4;
- (void)setLastChangeTimestamp:(unint64_t)a3;
@end

@implementation CADSeparatedDatabasePool

- (NSMutableArray)connections
{
  return self->_connections;
}

- (void)_returnConnectionToPool:(id)a3
{
  id v4 = a3;
  [v4 setLastUsedTimestamp:CalApproximateContinuousTime()];
  [(NSMutableArray *)self->_connections addObject:v4];
}

- (unint64_t)lastChangeTimestamp
{
  return self->_lastChangeTimestamp;
}

- (int)databaseID
{
  return self->_databaseID;
}

- (CalDatabaseInitializationConfiguration)config
{
  return self->_config;
}

- (CADSeparatedDatabasePool)initWithConfig:(id)a3 databaseID:(int)a4
{
  id v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CADSeparatedDatabasePool;
  v8 = [(CADSeparatedDatabasePool *)&v18 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_config, a3);
    v10 = [v7 directoryURL];
    uint64_t v11 = [v10 path];
    databasePath = v9->_databasePath;
    v9->_databasePath = (NSString *)v11;

    if (![(NSString *)v9->_databasePath hasSuffix:@"/"])
    {
      uint64_t v13 = [(NSString *)v9->_databasePath stringByAppendingString:@"/"];
      v14 = v9->_databasePath;
      v9->_databasePath = (NSString *)v13;
    }
    v9->_databaseID = a4;
    uint64_t v15 = objc_opt_new();
    connections = v9->_connections;
    v9->_connections = (NSMutableArray *)v15;
  }
  return v9;
}

- (void)purgeConnectionsLastUsedPriorTo:(unint64_t)a3 stats:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = self->_connections;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v8)
  {
    uint64_t v11 = v7;
    goto LABEL_18;
  }
  uint64_t v9 = v8;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = *(void *)v17;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v17 != v12) {
        objc_enumerationMutation(v7);
      }
      unint64_t v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "lastUsedTimestamp", (void)v16);
      if (v14 >= a3)
      {
        ++a4->var1;
        unint64_t var2 = a4->var2;
        if (var2 >= v14) {
          unint64_t var2 = v14;
        }
        a4->unint64_t var2 = var2;
      }
      else
      {
        if (!v11) {
          uint64_t v11 = objc_opt_new();
        }
        [v11 addIndex:v10 + i];
        ++a4->var0;
      }
    }
    uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    v10 += i;
  }
  while (v9);

  if (v11)
  {
    [(NSMutableArray *)self->_connections removeObjectsAtIndexes:v11];
LABEL_18:
  }
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (void)setLastChangeTimestamp:(unint64_t)a3
{
  self->_lastChangeTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_databasePath, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end