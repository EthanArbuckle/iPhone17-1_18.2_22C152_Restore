@interface GDEntityResolutionInProcessTextClient
- (BOOL)cooldownWithError:(id *)a3;
- (BOOL)recordDirectFeedbackWithEngagedIds:(id)a3 rejectedIds:(id)a4 ignored:(id)a5 neverPresented:(id)a6 error:(id *)a7;
- (BOOL)warmupForMode:(int64_t)a3 error:(id *)a4;
- (GDEntityResolutionInProcessTextClient)initWithMode:(int64_t)a3 error:(id)a4;
- (GDEntityResolutionInProcessTextClient)initWithMode:(int64_t)a3 warmup:(BOOL)a4 error:(id *)a5;
- (id)generateMentionsForQuery:(id)a3 error:(id *)a4;
- (id)initForMode:(int64_t)a3 error:(id *)a4;
- (id)resolveEntitiesForBatchRequests:(id)a3 error:(id *)a4;
- (id)resolveEntitiesForRequest:(id)a3 error:(id *)a4;
- (void)resolveEntitiesForBatchRequests:(id)a3 completionHandler:(id)a4;
- (void)resolveEntitiesForRequest:(id)a3 completionHandler:(id)a4;
- (void)warmupForMode:(int64_t)a3 completionHandler:(id)a4;
@end

@implementation GDEntityResolutionInProcessTextClient

- (void).cxx_destruct
{
}

- (BOOL)recordDirectFeedbackWithEngagedIds:(id)a3 rejectedIds:(id)a4 ignored:(id)a5 neverPresented:(id)a6 error:(id *)a7
{
  return MEMORY[0x1F4181798](self->ecrClient, sel_recordDirectFeedbackWithEngagedIds_rejectedIds_ignoredIds_neverPresentedIds_error_, a3, a4, a5);
}

- (void)resolveEntitiesForBatchRequests:(id)a3 completionHandler:(id)a4
{
  id v11 = 0;
  v6 = (void (**)(id, void *, id))a4;
  v9 = objc_msgSend_resolveEntitiesForBatchRequests_error_(self, v7, (uint64_t)a3, (uint64_t)&v11, v8);
  id v10 = v11;
  v6[2](v6, v9, v10);
}

- (void)resolveEntitiesForRequest:(id)a3 completionHandler:(id)a4
{
  id v11 = 0;
  v6 = (void (**)(id, void *, id))a4;
  v9 = objc_msgSend_resolveEntitiesForRequest_error_(self, v7, (uint64_t)a3, (uint64_t)&v11, v8);
  id v10 = v11;
  v6[2](v6, v9, v10);
}

- (void)warmupForMode:(int64_t)a3 completionHandler:(id)a4
{
  id v11 = 0;
  v6 = (void (**)(id, uint64_t, id))a4;
  uint64_t v9 = objc_msgSend_warmupForMode_error_(self, v7, a3, (uint64_t)&v11, v8);
  id v10 = v11;
  v6[2](v6, v9, v10);
}

- (id)generateMentionsForQuery:(id)a3 error:(id *)a4
{
  return (id)((uint64_t (*)(GDEntityResolutionTextClientInner *, char *, id, id *))MEMORY[0x1F4181798])(self->ecrClient, sel_generateMentionsForQuery_error_, a3, a4);
}

- (id)resolveEntitiesForBatchRequests:(id)a3 error:(id *)a4
{
  return (id)((uint64_t (*)(GDEntityResolutionTextClientInner *, char *, id, id *))MEMORY[0x1F4181798])(self->ecrClient, sel_resolveEntitiesSyncForBatchRequests_error_, a3, a4);
}

- (id)resolveEntitiesForRequest:(id)a3 error:(id *)a4
{
  return (id)((uint64_t (*)(GDEntityResolutionTextClientInner *, char *, id, id *))MEMORY[0x1F4181798])(self->ecrClient, sel_resolveEntitiesSyncForRequest_error_, a3, a4);
}

- (BOOL)cooldownWithError:(id *)a3
{
  return ((uint64_t (*)(GDEntityResolutionTextClientInner *, char *, id *))MEMORY[0x1F4181798])(self->ecrClient, sel_cooldownSyncAndReturnError_, a3);
}

- (BOOL)warmupForMode:(int64_t)a3 error:(id *)a4
{
  return ((uint64_t (*)(GDEntityResolutionTextClientInner *, char *, int64_t, id *))MEMORY[0x1F4181798])(self->ecrClient, sel_warmupSyncFor_error_, a3, a4);
}

- (GDEntityResolutionInProcessTextClient)initWithMode:(int64_t)a3 warmup:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GDEntityResolutionInProcessTextClient;
  uint64_t v8 = [(GDEntityResolutionInProcessTextClient *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [GDEntityResolutionTextClientInner alloc];
    uint64_t v11 = objc_msgSend_initFor_warmup_error_(v9, v10, a3, v6, (uint64_t)a5);
    ecrClient = v8->ecrClient;
    v8->ecrClient = (GDEntityResolutionTextClientInner *)v11;
  }
  return v8;
}

- (id)initForMode:(int64_t)a3 error:(id *)a4
{
  v12.receiver = self;
  v12.super_class = (Class)GDEntityResolutionInProcessTextClient;
  BOOL v6 = [(GDEntityResolutionInProcessTextClient *)&v12 init];
  if (v6)
  {
    v7 = [GDEntityResolutionTextClientInner alloc];
    uint64_t v9 = objc_msgSend_initFor_warmup_error_(v7, v8, a3, 1, (uint64_t)a4);
    ecrClient = v6->ecrClient;
    v6->ecrClient = (GDEntityResolutionTextClientInner *)v9;
  }
  return v6;
}

- (GDEntityResolutionInProcessTextClient)initWithMode:(int64_t)a3 error:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)GDEntityResolutionInProcessTextClient;
  id v12 = a4;
  v5 = [(GDEntityResolutionInProcessTextClient *)&v11 init];
  if (v5)
  {
    BOOL v6 = [GDEntityResolutionTextClientInner alloc];
    uint64_t v8 = objc_msgSend_initFor_warmup_error_(v6, v7, a3, 1, (uint64_t)&v12);
    ecrClient = v5->ecrClient;
    v5->ecrClient = (GDEntityResolutionTextClientInner *)v8;
  }
  return v5;
}

@end