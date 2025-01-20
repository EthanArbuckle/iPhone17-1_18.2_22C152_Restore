@interface NSSQLGenerateObjectIDRequestContext
- (BOOL)executeRequestCore:(id *)a3;
- (BOOL)isWritingRequest;
- (id)initForEntitiesAndCounts:(id)a3 context:(id)a4 sqlCore:(id)a5;
- (void)dealloc;
@end

@implementation NSSQLGenerateObjectIDRequestContext

- (BOOL)isWritingRequest
{
  return 1;
}

- (id)initForEntitiesAndCounts:(id)a3 context:(id)a4 sqlCore:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)NSSQLGenerateObjectIDRequestContext;
  v7 = -[NSSQLStoreRequestContext initWithRequest:context:sqlCore:](&v9, sel_initWithRequest_context_sqlCore_, 0, a4);
  if (v7)
  {
    v7->_entitiesAndCounts = (NSDictionary *)a3;
    v7->_model = (NSSQLModel *)(id)[a5 model];
  }
  return v7;
}

- (void)dealloc
{
  self->_entitiesAndCounts = 0;
  self->_model = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLGenerateObjectIDRequestContext;
  [(NSSQLStoreRequestContext *)&v3 dealloc];
}

- (BOOL)executeRequestCore:(id *)a3
{
  [(NSSQLStoreRequestContext *)self setResult:_executeGenerateObjectIDRequest(self)];
  if (a3 && *a3)
  {
    if (!self) {
      return [(NSSQLStoreRequestContext *)self result] != 0;
    }
    objc_setProperty_nonatomic(self, v5, *a3, 40);
  }
  else if (!self)
  {
    return [(NSSQLStoreRequestContext *)self result] != 0;
  }
  if (self->super._exception || self->super._error) {
    return 0;
  }
  return [(NSSQLStoreRequestContext *)self result] != 0;
}

@end