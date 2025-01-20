@interface DKReportingConcurrentRequestGroup
- (BOOL)addComponentIdentity:(id)a3 usingGenerator:(id)a4;
- (DKReportingConcurrentRequestGroup)init;
- (NSMutableDictionary)requestLookupByGenerator;
- (NSMutableSet)requests;
- (NSMutableSet)resources;
- (void)setRequestLookupByGenerator:(id)a3;
- (void)setRequests:(id)a3;
- (void)setResources:(id)a3;
@end

@implementation DKReportingConcurrentRequestGroup

- (DKReportingConcurrentRequestGroup)init
{
  v10.receiver = self;
  v10.super_class = (Class)DKReportingConcurrentRequestGroup;
  v2 = [(DKReportingConcurrentRequestGroup *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9C0] set];
    resources = v2->_resources;
    v2->_resources = (NSMutableSet *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9C0] set];
    requests = v2->_requests;
    v2->_requests = (NSMutableSet *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    requestLookupByGenerator = v2->_requestLookupByGenerator;
    v2->_requestLookupByGenerator = (NSMutableDictionary *)v7;
  }
  return v2;
}

- (BOOL)addComponentIdentity:(id)a3 usingGenerator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(DKReportingConcurrentRequestGroup *)self resources];
  v9 = [v6 resources];
  char v10 = [v8 intersectsSet:v9];

  if (v10)
  {
    BOOL v11 = 0;
  }
  else
  {
    v12 = [(DKReportingConcurrentRequestGroup *)self requestLookupByGenerator];
    v13 = [v7 extensionAttributes];
    v14 = [v12 objectForKeyedSubscript:v13];

    if (!v14)
    {
      v14 = +[DKReportingConcurrentRequest concurrentRequestWithGenerator:v7];
      v15 = [(DKReportingConcurrentRequestGroup *)self requestLookupByGenerator];
      v16 = [v7 extensionAttributes];
      [v15 setObject:v14 forKeyedSubscript:v16];
    }
    v17 = [v14 manifest];
    uint64_t v18 = [v17 count];
    BOOL v11 = v18 == 0;

    if (!v18)
    {
      v19 = [v14 manifest];
      [v19 addObject:v6];

      v20 = [(DKReportingConcurrentRequestGroup *)self requests];
      [v20 addObject:v14];

      v21 = [(DKReportingConcurrentRequestGroup *)self resources];
      v22 = [v6 resources];
      [v21 unionSet:v22];
    }
  }

  return v11;
}

- (NSMutableSet)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
}

- (NSMutableDictionary)requestLookupByGenerator
{
  return self->_requestLookupByGenerator;
}

- (void)setRequestLookupByGenerator:(id)a3
{
}

- (NSMutableSet)resources
{
  return self->_resources;
}

- (void)setResources:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_requestLookupByGenerator, 0);
  objc_storeStrong((id *)&self->_requests, 0);
}

@end