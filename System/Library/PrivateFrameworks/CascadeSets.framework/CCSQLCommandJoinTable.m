@interface CCSQLCommandJoinTable
- (CCSQLCommandJoinCriterion)joinCriterion;
- (CCSQLCommandJoinTable)init;
- (CCSQLCommandJoinTable)initWithTable:(id)a3 joinCriterion:(id)a4;
- (NSString)table;
- (id)description;
@end

@implementation CCSQLCommandJoinTable

- (CCSQLCommandJoinTable)initWithTable:(id)a3 joinCriterion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CCSQLCommandJoinTable;
  v8 = [(CCSQLCommandJoinTable *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    table = v8->_table;
    v8->_table = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    joinCriterion = v8->_joinCriterion;
    v8->_joinCriterion = (CCSQLCommandJoinCriterion *)v11;
  }
  return v8;
}

- (NSString)table
{
  return self->_table;
}

- (CCSQLCommandJoinCriterion)joinCriterion
{
  return self->_joinCriterion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_joinCriterion, 0);

  objc_storeStrong((id *)&self->_table, 0);
}

- (CCSQLCommandJoinTable)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)CCSQLCommandJoinTable;
  v3 = [(CCSQLCommandJoinTable *)&v6 description];
  v4 = [v3 stringByAppendingFormat:@" table: %@, criterion: %@", self->_table, self->_joinCriterion];

  return v4;
}

@end