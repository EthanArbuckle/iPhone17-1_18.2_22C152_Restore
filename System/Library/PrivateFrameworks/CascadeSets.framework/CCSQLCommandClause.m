@interface CCSQLCommandClause
- (CCSQLCommandClause)init;
- (CCSQLCommandClause)initWithClause:(id)a3 parameters:(id)a4;
- (NSArray)parameters;
- (NSString)clause;
- (id)description;
@end

@implementation CCSQLCommandClause

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);

  objc_storeStrong((id *)&self->_clause, 0);
}

- (CCSQLCommandClause)initWithClause:(id)a3 parameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CCSQLCommandClause;
  v8 = [(CCSQLCommandClause *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    clause = v8->_clause;
    v8->_clause = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    parameters = v8->_parameters;
    v8->_parameters = (NSArray *)v11;
  }
  return v8;
}

- (NSString)clause
{
  return self->_clause;
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (CCSQLCommandClause)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)CCSQLCommandClause;
  v3 = [(CCSQLCommandClause *)&v6 description];
  v4 = [v3 stringByAppendingFormat:@" clause: %@, parameters: %@", self->_clause, self->_parameters];

  return v4;
}

@end