@interface GDSubgraphViewContext
- (GDSubgraphViewContext)initWithInner:(id)a3;
- (GDSubgraphViewContext)initWithViewName:(id)a3 tableName:(id)a4 error:(id *)a5;
- (id)context;
@end

@implementation GDSubgraphViewContext

- (void).cxx_destruct
{
}

- (GDSubgraphViewContext)initWithInner:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GDSubgraphViewContext;
  v6 = [(GDSubgraphViewContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->subgraphViewContext, a3);
  }

  return v7;
}

- (GDSubgraphViewContext)initWithViewName:(id)a3 tableName:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v14 = objc_msgSend_clientService(GDSwiftViewService, v10, v11, v12, v13);
  v16 = objc_msgSend_gdSwiftSubgraphViewContextWithName_tableName_error_(v14, v15, (uint64_t)v9, (uint64_t)v8, (uint64_t)a5);

  if (v16)
  {
    self = (GDSubgraphViewContext *)(id)objc_msgSend_initWithInner_(self, v17, (uint64_t)v16, v18, v19);
    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)context
{
  return self->subgraphViewContext;
}

@end