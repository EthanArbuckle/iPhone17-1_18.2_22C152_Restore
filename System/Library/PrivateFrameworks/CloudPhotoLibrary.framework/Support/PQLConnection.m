@interface PQLConnection
+ (id)cplInjectionFor:(id)a3 isInIndexSet:(id)a4;
+ (id)cplInjectionFor:(id)a3 isNotInIndexSet:(id)a4;
- (BOOL)cplExecute:(id)a3;
- (BOOL)cplRegisterDeterministicFunction:(id)a3 nArgs:(int)a4 handler:(id)a5;
- (BOOL)cplRegisterIndexSetMatch;
- (id)cplFetch:(id)a3;
- (id)cplFetchObject:(id)a3 sql:(id)a4;
- (id)cplFetchObjectOfClass:(Class)a3 initializer:(SEL)a4 sql:(id)a5;
- (id)cplFetchObjectOfClass:(Class)a3 sql:(id)a4;
- (id)lastCPLError;
@end

@implementation PQLConnection

- (id)lastCPLError
{
  v2 = [(PQLConnection *)self lastError];
  v3 = [v2 domain];
  unsigned int v4 = [v3 isEqualToString:PQLSqliteErrorDomain];

  if (v4 && [v2 code] == 11)
  {
    id v5 = +[CPLErrors cplErrorWithCode:3 underlyingError:v2 description:@"Library database is corrupted"];
  }
  else
  {
    id v5 = v2;
  }
  v6 = v5;

  return v6;
}

- (BOOL)cplExecute:(id)a3
{
  return [(PQLConnection *)self execute:a3 args:&v4];
}

- (id)cplFetch:(id)a3
{
  return [(PQLConnection *)self fetch:a3 args:&v4];
}

- (id)cplFetchObjectOfClass:(Class)a3 initializer:(SEL)a4 sql:(id)a5
{
  return [(PQLConnection *)self fetchObjectOfClass:a3 initializer:a4 sql:a5 args:&v6];
}

- (id)cplFetchObjectOfClass:(Class)a3 sql:(id)a4
{
  return [(PQLConnection *)self fetchObjectOfClass:a3 sql:a4 args:&v5];
}

- (id)cplFetchObject:(id)a3 sql:(id)a4
{
  return [(PQLConnection *)self fetchObject:a3 sql:a4 args:&v5];
}

- (BOOL)cplRegisterDeterministicFunction:(id)a3 nArgs:(int)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (sqlite3 *)[(PQLConnection *)self dbHandle];
  id v11 = v9;
  v12 = (const char *)[v11 UTF8String];

  id v13 = [v8 copy];
  id v14 = v13;
  int function_v2 = sqlite3_create_function_v2(v10, v12, a4, 2053, v14, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sub_10019D6C4, 0, 0, (void (__cdecl *)(void *))j__CFRelease);

  if (function_v2)
  {
    v16 = +[NSError errorForDB:[(PQLConnection *)self dbHandle]];
    [(PQLConnection *)self setLastError:v16];

    v17 = [(PQLConnection *)self sqliteErrorHandler];

    if (v17)
    {
      v18 = [(PQLConnection *)self sqliteErrorHandler];
      v19 = [(PQLConnection *)self lastError];
      ((void (**)(void, PQLConnection *, void, void *))v18)[2](v18, self, 0, v19);
    }
  }
  return function_v2 == 0;
}

- (BOOL)cplRegisterIndexSetMatch
{
  return [(PQLConnection *)self cplRegisterDeterministicFunction:@"is_in_indexset" nArgs:2 handler:&stru_10027F5A0];
}

+ (id)cplInjectionFor:(id)a3 isInIndexSet:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[_CPLIsInIndexSetInject alloc] initWithInjection:v6 indexSet:v5 exclude:0];

  return v7;
}

+ (id)cplInjectionFor:(id)a3 isNotInIndexSet:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[_CPLIsInIndexSetInject alloc] initWithInjection:v6 indexSet:v5 exclude:1];

  return v7;
}

@end