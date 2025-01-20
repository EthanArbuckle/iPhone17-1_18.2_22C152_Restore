@interface LCFDatabaseColumn
- (NSString)name;
- (NSString)typeDb;
- (id)init:(id)a3 typeDb:(id)a4;
- (int64_t)type;
@end

@implementation LCFDatabaseColumn

- (id)init:(id)a3 typeDb:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)LCFDatabaseColumn;
  v9 = [(LCFDatabaseColumn *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    p_typeDb = (id *)&v10->_typeDb;
    objc_storeStrong((id *)&v10->_typeDb, a4);
    if ([(NSString *)v10->_typeDb isEqualToString:@"TEXT"])
    {
      uint64_t v12 = 1;
    }
    else if ([*p_typeDb isEqualToString:@"INTEGER"])
    {
      uint64_t v12 = 2;
    }
    else if ([*p_typeDb isEqualToString:@"FLOAT"])
    {
      uint64_t v12 = 3;
    }
    else
    {
      if (![(NSString *)v10->_typeDb isEqualToString:@"BOOL"])
      {
        v10->_type = 0;
        goto LABEL_11;
      }
      uint64_t v12 = 4;
    }
    v10->_type = v12;
  }
LABEL_11:

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)typeDb
{
  return self->_typeDb;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeDb, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end