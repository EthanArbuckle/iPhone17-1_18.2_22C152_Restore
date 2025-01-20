@interface NSSQLFetchDictionaryCountIntermediate
- (NSSQLFetchDictionaryCountIntermediate)initWithFetchIntermediate:(id)a3 inScope:(id)a4;
- (id)generateSQLStringInContext:(id)a3;
- (void)dealloc;
@end

@implementation NSSQLFetchDictionaryCountIntermediate

- (NSSQLFetchDictionaryCountIntermediate)initWithFetchIntermediate:(id)a3 inScope:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NSSQLFetchDictionaryCountIntermediate;
  v5 = [(NSSQLIntermediate *)&v7 initWithScope:a4];
  if (v5) {
    v5->_realFetch = (NSSQLFetchIntermediate *)a3;
  }
  return v5;
}

- (id)generateSQLStringInContext:(id)a3
{
  if ([a3 objectForKey:@"NSUnderlyingException"]) {
    return 0;
  }
  id v6 = [(NSSQLFetchIntermediate *)self->_realFetch generateSQLStringInContext:a3];
  if (!v6)
  {
    if (![a3 objectForKey:@"NSUnderlyingException"]) {
      objc_msgSend(a3, "setValue:forKey:", objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], @"Unable to generate SQL for fetch", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", objc_msgSend(a3, "objectForKey:", @"outerFetch"), @"Bad request")), @"NSUnderlyingException");
    }
    return 0;
  }
  objc_super v7 = v6;
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"SELECT COUNT(*) from (%@)", v6];

  return v8;
}

- (void)dealloc
{
  self->_realFetch = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLFetchDictionaryCountIntermediate;
  [(NSSQLStatementIntermediate *)&v3 dealloc];
}

@end