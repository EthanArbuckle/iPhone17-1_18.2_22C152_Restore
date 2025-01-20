@interface _GEOConfigDBInsertOperation
- (BOOL)performOperation;
- (id)init:(id)a3 rowId:(int64_t)a4 type:(id)a5 key:(id)a6 value:(id)a7 parentId:(int64_t)a8;
@end

@implementation _GEOConfigDBInsertOperation

- (id)init:(id)a3 rowId:(int64_t)a4 type:(id)a5 key:(id)a6 value:(id)a7 parentId:(int64_t)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v22.receiver = self;
  v22.super_class = (Class)_GEOConfigDBInsertOperation;
  v18 = [(_GEOConfigDBOperationBase *)&v22 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_configDB, a3);
    v19->_rowId = a4;
    objc_storeStrong((id *)&v19->_type, a5);
    objc_storeStrong((id *)&v19->_key, a6);
    objc_storeStrong((id *)&v19->_value, a7);
    v19->_parentId = a8;
  }

  return v19;
}

- (BOOL)performOperation
{
  v2 = self;
  v3 = [(_GEOConfigDB *)self->_configDB addFunction];
  v4 = [(_GEOConfigDB *)v2->_configDB db];
  LOBYTE(v2) = v3(v4, 0, v2->_rowId, v2->_key, v2->_parentId, v2->_type, v2->_value);

  return (char)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_configDB, 0);
}

@end