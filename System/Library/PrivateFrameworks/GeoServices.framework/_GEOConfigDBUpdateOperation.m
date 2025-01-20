@interface _GEOConfigDBUpdateOperation
- (BOOL)performOperation;
- (id)init:(id)a3 rowId:(int64_t)a4 type:(id)a5 value:(id)a6;
@end

@implementation _GEOConfigDBUpdateOperation

- (id)init:(id)a3 rowId:(int64_t)a4 type:(id)a5 value:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)_GEOConfigDBUpdateOperation;
  v14 = [(_GEOConfigDBOperationBase *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_configDB, a3);
    v15->_rowId = a4;
    objc_storeStrong((id *)&v15->_type, a5);
    objc_storeStrong((id *)&v15->_value, a6);
  }

  return v15;
}

- (BOOL)performOperation
{
  v2 = self;
  v3 = [(_GEOConfigDB *)self->_configDB setFunction];
  v4 = [(_GEOConfigDB *)v2->_configDB db];
  LOBYTE(v2) = v3(v4, 0, v2->_rowId, v2->_type, v2->_value);

  return (char)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_configDB, 0);
}

@end