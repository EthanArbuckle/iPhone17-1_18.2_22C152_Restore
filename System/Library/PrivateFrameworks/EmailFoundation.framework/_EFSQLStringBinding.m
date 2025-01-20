@interface _EFSQLStringBinding
- (NSString)stringValue;
- (_EFSQLStringBinding)initWithString:(id)a3;
- (void)bindTo:(sqlite3_stmt *)a3 withSQLIndex:(int)a4;
@end

@implementation _EFSQLStringBinding

- (void).cxx_destruct
{
}

- (void)bindTo:(sqlite3_stmt *)a3 withSQLIndex:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v7 = [(_EFSQLStringBinding *)self stringValue];
  v8 = v7;
  if (v7)
  {
    if ([v7 containsString:&stru_1F0EB0128])
    {
      id v9 = [v8 dataUsingEncoding:4];
      sqlite3_bind_text(a3, v4, (const char *)[v9 bytes], objc_msgSend(v9, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      uint64_t v10 = [v8 UTF8String];
      if (v10) {
        v11 = (const char *)v10;
      }
      else {
        v11 = "";
      }
      sqlite3_bind_text(a3, v4, v11, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)_EFSQLStringBinding;
    [(EFSQLBinding *)&v12 bindTo:a3 withSQLIndex:v4];
  }
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (_EFSQLStringBinding)initWithString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EFSQLStringBinding;
  v5 = [(_EFSQLStringBinding *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    stringValue = v5->_stringValue;
    v5->_stringValue = (NSString *)v6;
  }
  return v5;
}

@end