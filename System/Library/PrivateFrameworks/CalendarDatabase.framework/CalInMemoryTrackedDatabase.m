@interface CalInMemoryTrackedDatabase
- (BOOL)hasClients;
- (CalDatabaseInMemoryChangeTracking)database;
- (CalInMemoryTrackedDatabase)init;
- (NSHashTable)clients;
@end

@implementation CalInMemoryTrackedDatabase

- (CalInMemoryTrackedDatabase)init
{
  v8.receiver = self;
  v8.super_class = (Class)CalInMemoryTrackedDatabase;
  v2 = [(CalInMemoryTrackedDatabase *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(CalDatabaseInMemoryChangeTracking);
    database = v2->_database;
    v2->_database = v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:2];
    clients = v2->_clients;
    v2->_clients = (NSHashTable *)v5;
  }
  return v2;
}

- (BOOL)hasClients
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  memset(v3, 0, sizeof(v3));
  return [(NSHashTable *)self->_clients countByEnumeratingWithState:v3 objects:v4 count:16] != 0;
}

- (CalDatabaseInMemoryChangeTracking)database
{
  return self->_database;
}

- (NSHashTable)clients
{
  return self->_clients;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end