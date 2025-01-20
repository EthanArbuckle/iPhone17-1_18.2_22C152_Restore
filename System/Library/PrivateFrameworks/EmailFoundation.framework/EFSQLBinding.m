@interface EFSQLBinding
+ (id)bindingWithData:(id)a3;
+ (id)bindingWithDouble:(double)a3;
+ (id)bindingWithInt64:(int64_t)a3;
+ (id)bindingWithString:(id)a3;
+ (id)nullBinding;
- (void)bindTo:(sqlite3_stmt *)a3 withSQLIndex:(int)a4;
- (void)bindToStatement:(id)a3 usingIndex:(unint64_t)a4;
- (void)bindToStatement:(id)a3 usingName:(id)a4;
@end

@implementation EFSQLBinding

- (void)bindToStatement:(id)a3 usingIndex:(unint64_t)a4
{
  id v10 = a3;
  v6 = (sqlite3_stmt *)[v10 compiled];
  int v7 = sqlite3_bind_parameter_count(v6);
  if ((v7 & ~(v7 >> 31)) <= a4)
  {
    uint64_t v8 = [[NSString alloc] initWithFormat:@"Index %lu beyond number of parameters in statement: %@", a4, v10];
    id v9 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v8 userInfo:0];
    objc_exception_throw(v9);
  }
  [(EFSQLBinding *)self bindTo:v6 withSQLIndex:(a4 + 1)];
}

- (void)bindToStatement:(id)a3 usingName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v13 = v6;
  uint64_t v8 = (sqlite3_stmt *)[v13 compiled];
  id v9 = v7;
  uint64_t v10 = sqlite3_bind_parameter_index(v8, (const char *)[v9 UTF8String]);
  if (!v10)
  {
    uint64_t v11 = [[NSString alloc] initWithFormat:@"Named parameter %@ not found in statement: %@", v9, v13];
    id v12 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v11 userInfo:0];
    objc_exception_throw(v12);
  }
  [(EFSQLBinding *)self bindTo:v8 withSQLIndex:v10];
}

+ (id)bindingWithString:(id)a3
{
  id v3 = a3;
  v4 = [[_EFSQLStringBinding alloc] initWithString:v3];

  return v4;
}

+ (id)bindingWithInt64:(int64_t)a3
{
  id v3 = [[_EFSQLInt64Binding alloc] initWithInt64:a3];
  return v3;
}

+ (id)bindingWithData:(id)a3
{
  id v3 = a3;
  v4 = [[_EFSQLDataBinding alloc] initWithData:v3];

  return v4;
}

+ (id)bindingWithDouble:(double)a3
{
  id v3 = [[_EFSQLDoubleBinding alloc] initWithDouble:a3];
  return v3;
}

+ (id)nullBinding
{
  v2 = objc_alloc_init(EFSQLBinding);
  return v2;
}

- (void)bindTo:(sqlite3_stmt *)a3 withSQLIndex:(int)a4
{
}

@end