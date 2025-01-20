@interface EFSQLDisqualifiedColumnExpression
- (BOOL)isEqual:(id)a3;
- (EFSQLColumnExpression)columnExpression;
- (id)cachedSelf;
- (unint64_t)hash;
- (void)ef_renderSQLExpressionInto:(id)a3;
@end

@implementation EFSQLDisqualifiedColumnExpression

- (id)cachedSelf
{
  if (cachedSelf_onceToken_133 != -1) {
    dispatch_once(&cachedSelf_onceToken_133, &__block_literal_global_135);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&cachedSelf_sTableLock_131);
  v3 = objc_msgSend((id)cachedSelf_sUniqueObjectIDs_132, "ef_uniquedObject:", self);
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedSelf_sTableLock_131);
  return v3;
}

void __60__EFSQLDisqualifiedColumnExpression_EFCacheable__cachedSelf__block_invoke()
{
  cachedSelf_sTableLock_131 = 0;
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:0];
  v1 = (void *)cachedSelf_sUniqueObjectIDs_132;
  cachedSelf_sUniqueObjectIDs_132 = v0;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (EFSQLDisqualifiedColumnExpression *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else if ([(EFSQLDisqualifiedColumnExpression *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    v6 = [(EFSQLColumnExpression *)self name];
    v7 = [(EFSQLColumnExpression *)v5 name];
    if ([v6 isEqualToString:v7])
    {
      v8 = [(EFSQLColumnExpression *)self tableName];
      v9 = [(EFSQLColumnExpression *)v5 tableName];
      char v10 = EFObjectsAreEqual(v8, v9);
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)EFSQLDisqualifiedColumnExpression;
  return 33 * [(EFSQLColumnExpression *)&v3 hash] + 1;
}

- (void)ef_renderSQLExpressionInto:(id)a3
{
  id v4 = a3;
  [v4 appendString:@"+"];
  v5.receiver = self;
  v5.super_class = (Class)EFSQLDisqualifiedColumnExpression;
  [(EFSQLColumnExpression *)&v5 ef_renderSQLExpressionInto:v4];
}

- (EFSQLColumnExpression)columnExpression
{
  return self->_columnExpression;
}

- (void).cxx_destruct
{
}

@end