@interface NSSQLAliasGenerator
- (NSSQLAliasGenerator)init;
- (NSSQLAliasGenerator)initWithNestingLevel:(unsigned int)a3;
- (id)generateSubqueryVariableAlias;
- (id)generateTableAlias;
- (uint64_t)generateTempTableName;
- (uint64_t)generateVariableAlias;
- (void)dealloc;
@end

@implementation NSSQLAliasGenerator

- (uint64_t)generateTempTableName
{
  if (result)
  {
    v1 = NSString;
    uint64_t v2 = *(unsigned int *)(result + 16);
    *(_DWORD *)(result + 16) = v2 + 1;
    return objc_msgSend(v1, "stringWithFormat:", @"_Z_intarray%u", v2);
  }
  return result;
}

- (NSSQLAliasGenerator)initWithNestingLevel:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v7.receiver = self;
  v7.super_class = (Class)NSSQLAliasGenerator;
  v4 = [(NSSQLAliasGenerator *)&v7 init];
  if (v4)
  {
    if (v3)
    {
      v4->_tableBase = (NSString *)objc_msgSend([NSString alloc], "initWithFormat:", @"n%u_t%cu", v3, 37);
      v5 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"__n%u_var%cu", v3, 37);
    }
    else
    {
      v4->_tableBase = (NSString *)@"t%u";
      v5 = @"__var%u";
    }
    v4->_variableBase = (NSString *)v5;
    *(void *)&v4->_nextTableAlias = 0;
    v4->_nextTempTableAlias = 0;
  }
  return v4;
}

- (id)generateTableAlias
{
  uint64_t v2 = NSString;
  tableBase = self->_tableBase;
  uint64_t nextTableAlias = self->_nextTableAlias;
  self->_uint64_t nextTableAlias = nextTableAlias + 1;
  return (id)objc_msgSend(v2, "stringWithFormat:", tableBase, nextTableAlias);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSSQLAliasGenerator;
  [(NSSQLAliasGenerator *)&v3 dealloc];
}

- (id)generateSubqueryVariableAlias
{
  if (self)
  {
    uint64_t v2 = NSString;
    uint64_t v3 = *((void *)self + 4);
    uint64_t v4 = *((unsigned int *)self + 3);
    *((_DWORD *)self + 3) = v4 + 1;
    return (id)objc_msgSend(v2, "stringWithFormat:", v3, v4);
  }
  return self;
}

- (NSSQLAliasGenerator)init
{
  return [(NSSQLAliasGenerator *)self initWithNestingLevel:0];
}

- (uint64_t)generateVariableAlias
{
  if (result)
  {
    v1 = NSString;
    uint64_t v2 = *(void *)(result + 32);
    uint64_t v3 = *(unsigned int *)(result + 12);
    *(_DWORD *)(result + 12) = v3 + 1;
    return objc_msgSend(v1, "stringWithFormat:", v2, v3);
  }
  return result;
}

@end