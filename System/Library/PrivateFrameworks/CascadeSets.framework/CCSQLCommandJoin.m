@interface CCSQLCommandJoin
- (CCSQLCommandJoin)init;
- (CCSQLCommandJoin)initWithJoinType:(int64_t)a3 joinTables:(id)a4;
- (NSArray)joinTables;
- (id)description;
- (int64_t)joinType;
@end

@implementation CCSQLCommandJoin

- (CCSQLCommandJoin)initWithJoinType:(int64_t)a3 joinTables:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CCSQLCommandJoin;
  v8 = [(CCSQLCommandJoin *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_joinType = a3;
    objc_storeStrong((id *)&v8->_joinTables, a4);
  }

  return v9;
}

- (int64_t)joinType
{
  return self->_joinType;
}

- (NSArray)joinTables
{
  return self->_joinTables;
}

- (void).cxx_destruct
{
}

- (CCSQLCommandJoin)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)CCSQLCommandJoin;
  v3 = [(CCSQLCommandJoin *)&v6 description];
  v4 = [v3 stringByAppendingFormat:@" joinTables: %@", self->_joinTables];

  return v4;
}

@end