@interface CCSQLCommandOrder
- (CCSQLCommandOrder)init;
- (CCSQLCommandOrder)initWithOrderMode:(int64_t)a3 columnNames:(id)a4;
- (NSArray)columnNames;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)orderMode;
@end

@implementation CCSQLCommandOrder

- (CCSQLCommandOrder)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

- (CCSQLCommandOrder)initWithOrderMode:(int64_t)a3 columnNames:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CCSQLCommandOrder;
  v7 = [(CCSQLCommandOrder *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_orderMode = a3;
    uint64_t v9 = [v6 copy];
    columnNames = v8->_columnNames;
    v8->_columnNames = (NSArray *)v9;
  }
  return v8;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CCSQLCommandOrder;
  v3 = [(CCSQLCommandOrder *)&v7 description];
  v4 = [NSNumber numberWithInteger:self->_orderMode];
  v5 = [v3 stringByAppendingFormat:@" orderMode: %@, columnNames: %@", v4, self->_columnNames];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5[1] = self->_orderMode;
  uint64_t v6 = [(NSArray *)self->_columnNames copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  return v5;
}

- (int64_t)orderMode
{
  return self->_orderMode;
}

- (NSArray)columnNames
{
  return self->_columnNames;
}

- (void).cxx_destruct
{
}

@end