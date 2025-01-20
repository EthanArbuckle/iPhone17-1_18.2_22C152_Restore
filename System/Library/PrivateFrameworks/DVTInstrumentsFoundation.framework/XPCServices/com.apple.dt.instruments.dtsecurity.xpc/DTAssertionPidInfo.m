@interface DTAssertionPidInfo
- (BOOL)hasNoMoreClients;
- (BOOL)removeClaimFromClient:(id)a3;
- (NSArray)blocks;
- (id)initForPid:(int)a3 withRemoveBlocks:(id)a4 onBehalfOfClient:(id)a5;
- (int)pid;
- (void)addClaimForClient:(id)a3;
- (void)removeAssertions;
@end

@implementation DTAssertionPidInfo

- (id)initForPid:(int)a3 withRemoveBlocks:(id)a4 onBehalfOfClient:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)DTAssertionPidInfo;
  v10 = [(DTAssertionPidInfo *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_pid = a3;
    v12 = (NSArray *)[v8 copy];
    blocks = v11->_blocks;
    v11->_blocks = v12;

    uint64_t v14 = +[NSMutableSet setWithObject:v9];
    clientsWithClaim = v11->_clientsWithClaim;
    v11->_clientsWithClaim = (NSMutableSet *)v14;
  }
  return v11;
}

- (void)removeAssertions
{
  blocks = self->_blocks;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000C930;
  v3[3] = &unk_100015160;
  v3[4] = self;
  [(NSArray *)blocks enumerateObjectsUsingBlock:v3];
}

- (void)addClaimForClient:(id)a3
{
}

- (BOOL)removeClaimFromClient:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(NSMutableSet *)self->_clientsWithClaim containsObject:v4];
  if (v5) {
    [(NSMutableSet *)self->_clientsWithClaim removeObject:v4];
  }

  return v5;
}

- (BOOL)hasNoMoreClients
{
  v2 = [(NSMutableSet *)self->_clientsWithClaim anyObject];
  BOOL v3 = v2 == 0;

  return v3;
}

- (NSArray)blocks
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (int)pid
{
  return self->_pid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientsWithClaim, 0);
  objc_storeStrong((id *)&self->_blocks, 0);
}

@end