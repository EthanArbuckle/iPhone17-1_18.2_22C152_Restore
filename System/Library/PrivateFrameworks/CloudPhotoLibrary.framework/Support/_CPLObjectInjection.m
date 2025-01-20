@interface _CPLObjectInjection
- (NSArray)variables;
- (NSData)sql;
- (_CPLObjectInjection)initWithVariables:(id)a3 object:(id)a4 sql:(id)a5;
- (id)bindValuesToKeepAlive;
- (id)object;
- (int)bindWithStatement:(sqlite3_stmt *)a3 startingAtIndex:(int)a4;
@end

@implementation _CPLObjectInjection

- (_CPLObjectInjection)initWithVariables:(id)a3 object:(id)a4 sql:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_CPLObjectInjection;
  v12 = [(_CPLObjectInjection *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_variables, a3);
    objc_storeStrong(&v13->_object, a4);
    objc_storeStrong((id *)&v13->_sql, a5);
  }

  return v13;
}

- (int)bindWithStatement:(sqlite3_stmt *)a3 startingAtIndex:(int)a4
{
  v7 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSArray count](self->_variables, "count"));
  bindValuesToKeepAlive = self->_bindValuesToKeepAlive;
  self->_bindValuesToKeepAlive = v7;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obj = self->_variables;
  id v9 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  int v10 = a4;
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v24;
    int v21 = a4;
    do
    {
      v13 = 0;
      int v14 = a4;
      do
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(obj);
        }
        objc_super v15 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v13);
        id object = self->_object;
        v17 = [v15 variableName];
        v18 = [object valueForKey:v17];
        v19 = [v15 bindableValueForValue:v18];

        if (v19)
        {
          [v19 sqliteBind:a3 index:(char *)v13 + a4];
          [(NSMutableArray *)self->_bindValuesToKeepAlive addObject:v19];
        }
        else
        {
          sqlite3_bind_null(a3, a4 + v13);
        }

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      a4 += (int)v13;
    }
    while (v11);
    int v10 = v14 + v13;
    a4 = v21;
  }

  return v10 - a4;
}

- (id)bindValuesToKeepAlive
{
  return self->_bindValuesToKeepAlive;
}

- (NSArray)variables
{
  return self->_variables;
}

- (id)object
{
  return self->_object;
}

- (NSData)sql
{
  return self->_sql;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sql, 0);
  objc_storeStrong(&self->_object, 0);
  objc_storeStrong((id *)&self->_variables, 0);
  objc_storeStrong((id *)&self->_bindValuesToKeepAlive, 0);
}

@end