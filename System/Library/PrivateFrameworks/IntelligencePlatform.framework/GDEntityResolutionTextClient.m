@interface GDEntityResolutionTextClient
- (BOOL)warmupForMode:(int64_t)a3 error:(id *)a4;
- (GDEntityResolutionTextClient)init;
- (id)generateMentionsForQuery:(id)a3 error:(id *)a4;
- (id)resolveEntitiesForRequest:(id)a3 error:(id *)a4;
@end

@implementation GDEntityResolutionTextClient

- (void).cxx_destruct
{
}

- (id)generateMentionsForQuery:(id)a3 error:(id *)a4
{
  return (id)((uint64_t (*)(GDXPCEntityResolutionService *, char *, id, id *))MEMORY[0x1F4181798])(self->xpcClient, sel_generateMentionsForQuery_error_, a3, a4);
}

- (id)resolveEntitiesForRequest:(id)a3 error:(id *)a4
{
  return (id)((uint64_t (*)(GDXPCEntityResolutionService *, char *, id, id *))MEMORY[0x1F4181798])(self->xpcClient, sel_submitQuery_withError_, a3, a4);
}

- (BOOL)warmupForMode:(int64_t)a3 error:(id *)a4
{
  return objc_msgSend_warmupForMode_error_(self->xpcClient, a2, a3, (uint64_t)a4, v4);
}

- (GDEntityResolutionTextClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)GDEntityResolutionTextClient;
  v2 = [(GDEntityResolutionTextClient *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(GDXPCEntityResolutionService);
    xpcClient = v2->xpcClient;
    v2->xpcClient = v3;
  }
  return v2;
}

@end