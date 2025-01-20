@interface _GEOConfigDBDeleteOperation
- (BOOL)performOperation;
- (id)init:(id)a3 rowId:(int64_t)a4;
@end

@implementation _GEOConfigDBDeleteOperation

- (id)init:(id)a3 rowId:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_GEOConfigDBDeleteOperation;
  v8 = [(_GEOConfigDBOperationBase *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_configDB, a3);
    v9->_rowId = a4;
  }

  return v9;
}

- (void).cxx_destruct
{
}

- (BOOL)performOperation
{
  v2 = self;
  v3 = [(_GEOConfigDB *)self->_configDB clearFunction];
  v4 = [(_GEOConfigDB *)v2->_configDB db];
  LOBYTE(v2) = v3(v4, 0, v2->_rowId);

  return (char)v2;
}

@end