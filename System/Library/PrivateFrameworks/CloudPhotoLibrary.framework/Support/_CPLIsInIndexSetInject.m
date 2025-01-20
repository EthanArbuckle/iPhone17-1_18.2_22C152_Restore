@interface _CPLIsInIndexSetInject
- (NSData)sql;
- (NSIndexSet)indexSet;
- (NSString)description;
- (_CPLIsInIndexSetInject)initWithInjection:(id)a3 indexSet:(id)a4 exclude:(BOOL)a5;
- (id)bindValuesToKeepAlive;
- (int)bindWithStatement:(sqlite3_stmt *)a3 startingAtIndex:(int)a4;
@end

@implementation _CPLIsInIndexSetInject

- (_CPLIsInIndexSetInject)initWithInjection:(id)a3 indexSet:(id)a4 exclude:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v37.receiver = self;
  v37.super_class = (Class)_CPLIsInIndexSetInject;
  v11 = [(_CPLIsInIndexSetInject *)&v37 init];
  if (v11)
  {
    id v12 = [v10 count];
    if (v12)
    {
      id v13 = v12;
      objc_storeStrong(&v11->_injection, a3);
      v14 = [v9 sql];
      id v15 = objc_alloc((Class)NSMutableData);
      v16 = (char *)[v14 length];
      if (v13 == (id)1)
      {
        uint64_t v17 = 4;
        if (v5) {
          uint64_t v17 = 5;
        }
        id v18 = [v15 initWithCapacity:&v16[v17]];
        objc_msgSend(v18, "appendBytes:length:", "(", 1);
        [v18 appendData:v14];
        if (v5)
        {
          v19 = "!=?)";
          v20 = v18;
          uint64_t v21 = 4;
        }
        else
        {
          v19 = "=?)";
          v20 = v18;
          uint64_t v21 = 3;
        }
        [v20 appendBytes:v19 length:v21];
        objc_storeStrong((id *)&v11->_sql, v18);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v30 = [v9 bindValuesToKeepAlive];
          id keepAlive = v11->_keepAlive;
          v11->_id keepAlive = (id)v30;
        }
        v11->_onlyIndex = (unint64_t)[v10 firstIndex];
      }
      else
      {
        uint64_t v26 = 20;
        if (v5) {
          uint64_t v26 = 21;
        }
        id v27 = [v15 initWithCapacity:&v16[v26]];
        id v18 = v27;
        if (v5)
        {
          v28 = "(!is_in_indexset(";
          uint64_t v29 = 17;
        }
        else
        {
          v28 = "(is_in_indexset(";
          uint64_t v29 = 16;
        }
        [v27 appendBytes:v28 length:v29];
        [v18 appendData:v14];
        objc_msgSend(v18, "appendBytes:length:", ",?))", 4);
        objc_storeStrong((id *)&v11->_sql, v18);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v32 = [v9 bindValuesToKeepAlive];
          id v33 = v11->_keepAlive;
          v11->_id keepAlive = (id)v32;
        }
        if (v11->_keepAlive)
        {
          v38[0] = v11->_keepAlive;
          v38[1] = v10;
          id v34 = +[NSArray arrayWithObjects:v38 count:2];
        }
        else
        {
          id v34 = v10;
        }
        id v35 = v11->_keepAlive;
        v11->_id keepAlive = v34;

        objc_storeStrong((id *)&v11->_indexSet, a4);
      }
    }
    else
    {
      id v22 = objc_alloc((Class)NSData);
      if (v5) {
        v23 = "(1)";
      }
      else {
        v23 = "(0)";
      }
      v24 = (NSData *)[v22 initWithBytes:v23 length:3];
      sql = v11->_sql;
      v11->_sql = v24;

      v11->_onlyIndex = 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  return v11;
}

- (int)bindWithStatement:(sqlite3_stmt *)a3 startingAtIndex:(int)a4
{
  indexSet = self->_indexSet;
  if (*(_OWORD *)&self->_onlyIndex == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  id injection = self->_injection;
  if (injection)
  {
    int v8 = [injection bindWithStatement:a3 startingAtIndex:*(void *)&a4] + 1;
    if (self->_indexSet)
    {
LABEL_5:
      pql_sqlite3_bind_pointer();
      return v8;
    }
  }
  else
  {
    int v8 = 1;
    if (indexSet) {
      goto LABEL_5;
    }
  }
  sqlite3_int64 onlyIndex = self->_onlyIndex;
  if (onlyIndex != 0x7FFFFFFFFFFFFFFFLL) {
    sqlite3_bind_int64(a3, a4, onlyIndex);
  }
  return v8;
}

- (NSData)sql
{
  return self->_sql;
}

- (id)bindValuesToKeepAlive
{
  return self->_keepAlive;
}

- (NSString)description
{
  id v3 = [objc_alloc((Class)NSString) initWithData:self->_sql encoding:4];
  indexSet = self->_indexSet;
  id v5 = objc_alloc((Class)NSString);
  if (indexSet) {
    id v6 = [v5 initWithFormat:@"[query: %@, %@]", v3, self->_indexSet];
  }
  else {
    id v6 = [v5 initWithFormat:@"[query: %@]", v3, v9];
  }
  v7 = v6;

  return (NSString *)v7;
}

- (NSIndexSet)indexSet
{
  return self->_indexSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexSet, 0);
  objc_storeStrong(&self->_keepAlive, 0);
  objc_storeStrong(&self->_injection, 0);
  objc_storeStrong((id *)&self->_sql, 0);
}

@end