@interface BYODGetDnsRecordsResponse
- (BYODGetDnsRecordsResponse)initWithDictionary:(id)a3;
- (BYODGetDnsRecordsResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (NSArray)dnsRecords;
- (void)setDnsRecords:(id)a3;
@end

@implementation BYODGetDnsRecordsResponse

- (BYODGetDnsRecordsResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BYODGetDnsRecordsResponse;
  v8 = [(BYODGetDnsRecordsResponse *)&v11 initWithHTTPResponse:v6 data:v7 bodyIsPlist:0];
  v9 = v8;
  if (v8
    && [*(id *)&v8->super.AAResponse_opaque[OBJC_IVAR___AAResponse__httpResponse] statusCode] == stru_B8.segname)
  {
    v9 = [(BYODGetDnsRecordsResponse *)v9 initWithDictionary:*(void *)&v9->super.AAResponse_opaque[OBJC_IVAR___AAResponse__responseDictionary]];
  }

  return v9;
}

- (BYODGetDnsRecordsResponse)initWithDictionary:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BYODGetDnsRecordsResponse;
  v5 = [(BYODBaseResponse *)&v24 initWithDictionary:v4];
  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:@"result"];
    BOOL v7 = v6 == 0;

    if (!v7)
    {
      v8 = [v4 objectForKeyedSubscript:@"result"];
      v9 = [v8 objectForKeyedSubscript:@"records"];

      v10 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v11 = v9;
      id v12 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v21;
        do
        {
          v14 = 0;
          do
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v11);
            }
            uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v14);
            v16 = [BYODDnsRecord alloc];
            v17 = -[BYODDnsRecord initWithDictionary:](v16, "initWithDictionary:", v15, (void)v20);
            [(NSArray *)v10 addObject:v17];

            v14 = (char *)v14 + 1;
          }
          while (v12 != v14);
          id v12 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v12);
      }

      dnsRecords = v5->_dnsRecords;
      v5->_dnsRecords = v10;
    }
  }

  return v5;
}

- (NSArray)dnsRecords
{
  return self->_dnsRecords;
}

- (void)setDnsRecords:(id)a3
{
}

- (void).cxx_destruct
{
}

@end