@interface _EFSQLDataBinding
- (NSData)dataValue;
- (_EFSQLDataBinding)initWithData:(id)a3;
- (void)bindTo:(sqlite3_stmt *)a3 withSQLIndex:(int)a4;
@end

@implementation _EFSQLDataBinding

- (_EFSQLDataBinding)initWithData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EFSQLDataBinding;
  v5 = [(_EFSQLDataBinding *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dataValue = v5->_dataValue;
    v5->_dataValue = (NSData *)v6;
  }
  return v5;
}

- (void)bindTo:(sqlite3_stmt *)a3 withSQLIndex:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v7 = [(_EFSQLDataBinding *)self dataValue];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
    sqlite3_bind_blob64(a3, v4, (const void *)[v9 bytes], objc_msgSend(v9, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_EFSQLDataBinding;
    [(EFSQLBinding *)&v10 bindTo:a3 withSQLIndex:v4];
  }
}

- (NSData)dataValue
{
  return self->_dataValue;
}

- (void).cxx_destruct
{
}

@end