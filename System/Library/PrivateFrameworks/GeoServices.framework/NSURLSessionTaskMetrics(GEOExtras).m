@interface NSURLSessionTaskMetrics(GEOExtras)
- (GEOClientMetrics)_geo_clientMetrics;
- (id)_geo_remoteAddressAndPort;
@end

@implementation NSURLSessionTaskMetrics(GEOExtras)

- (GEOClientMetrics)_geo_clientMetrics
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(GEOClientMetrics);
  v3 = objc_alloc_init(GEOClientNetworkMetrics);
  v35 = v2;
  [(GEOClientMetrics *)v2 setNetworkMetrics:v3];
  v4 = objc_msgSend(a1, "_geo_remoteAddressAndPort");
  [(GEOClientNetworkMetrics *)v3 setServiceIpAddress:v4];

  -[GEOClientNetworkMetrics setRedirectCount:](v3, "setRedirectCount:", [a1 redirectCount]);
  v5 = [a1 taskInterval];
  v6 = [v5 startDate];
  [v6 timeIntervalSince1970];
  -[GEOClientNetworkMetrics setRequestStart:](v3, "setRequestStart:");

  v7 = [a1 taskInterval];
  v8 = [v7 endDate];
  [v8 timeIntervalSince1970];
  -[GEOClientNetworkMetrics setRequestEnd:](v3, "setRequestEnd:");

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v9 = [a1 transactionMetrics];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v15 = objc_alloc_init(GEOClientNetworkTransactionMetrics);
        [(GEOClientNetworkMetrics *)v3 addTransactionMetrics:v15];
        v16 = [v14 response];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v18 = [v14 response];
          -[GEOClientNetworkMetrics setHttpResponseCode:](v3, "setHttpResponseCode:", [v18 statusCode]);
        }
        v19 = [v14 fetchStartDate];
        [v19 timeIntervalSince1970];
        -[GEOClientNetworkTransactionMetrics setFetchStart:](v15, "setFetchStart:");

        v20 = [v14 domainLookupStartDate];
        [v20 timeIntervalSince1970];
        -[GEOClientNetworkTransactionMetrics setDomainLookupStart:](v15, "setDomainLookupStart:");

        v21 = [v14 domainLookupEndDate];
        [v21 timeIntervalSince1970];
        -[GEOClientNetworkTransactionMetrics setDomainLookupEnd:](v15, "setDomainLookupEnd:");

        v22 = [v14 connectStartDate];
        [v22 timeIntervalSince1970];
        -[GEOClientNetworkTransactionMetrics setConnectStart:](v15, "setConnectStart:");

        v23 = [v14 connectEndDate];
        [v23 timeIntervalSince1970];
        -[GEOClientNetworkTransactionMetrics setConnectEnd:](v15, "setConnectEnd:");

        v24 = [v14 secureConnectionStartDate];
        [v24 timeIntervalSince1970];
        -[GEOClientNetworkTransactionMetrics setSecureConnectStart:](v15, "setSecureConnectStart:");

        v25 = [v14 secureConnectionEndDate];
        [v25 timeIntervalSince1970];
        -[GEOClientNetworkTransactionMetrics setSecureConnectEnd:](v15, "setSecureConnectEnd:");

        v26 = [v14 requestStartDate];
        [v26 timeIntervalSince1970];
        -[GEOClientNetworkTransactionMetrics setRequestStart:](v15, "setRequestStart:");

        v27 = [v14 requestEndDate];
        [v27 timeIntervalSince1970];
        -[GEOClientNetworkTransactionMetrics setRequestEnd:](v15, "setRequestEnd:");

        v28 = [v14 responseStartDate];
        [v28 timeIntervalSince1970];
        -[GEOClientNetworkTransactionMetrics setResponseStart:](v15, "setResponseStart:");

        v29 = [v14 responseEndDate];
        [v29 timeIntervalSince1970];
        -[GEOClientNetworkTransactionMetrics setResponseEnd:](v15, "setResponseEnd:");

        -[GEOClientNetworkTransactionMetrics setProxyConnection:](v15, "setProxyConnection:", [v14 isProxyConnection]);
        -[GEOClientNetworkTransactionMetrics setReusedConnection:](v15, "setReusedConnection:", [v14 isReusedConnection]);
        v30 = [v14 networkProtocolName];
        v31 = [v30 lowercaseString];

        if ([v31 isEqualToString:@"http/1.1"])
        {
          uint64_t v32 = 1;
        }
        else if ([v31 isEqualToString:@"h2"])
        {
          uint64_t v32 = 2;
        }
        else if ([v31 isEqualToString:@"h2c"])
        {
          uint64_t v32 = 3;
        }
        else if ([v31 isEqualToString:@"spdy/1"])
        {
          uint64_t v32 = 4;
        }
        else if ([v31 isEqualToString:@"spdy/2"])
        {
          uint64_t v32 = 5;
        }
        else
        {
          if (![v31 isEqualToString:@"spdy/3"]) {
            goto LABEL_21;
          }
          uint64_t v32 = 6;
        }
        [(GEOClientNetworkTransactionMetrics *)v15 setProtocolName:v32];
LABEL_21:
        unint64_t v33 = [v14 resourceFetchType];
        if (v33 <= 3) {
          [(GEOClientNetworkTransactionMetrics *)v15 setResourceFetchType:v33];
        }
        -[GEOClientNetworkTransactionMetrics setIsMultipath:](v15, "setIsMultipath:", [v14 isMultipath]);
        -[GEOClientNetworkTransactionMetrics setUsedCellular:](v15, "setUsedCellular:", [v14 isCellular]);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v11);
  }

  return v35;
}

- (id)_geo_remoteAddressAndPort
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v1 = [a1 transactionMetrics];
  v2 = (void *)[v1 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v2; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v3) {
          objc_enumerationMutation(v1);
        }
        v5 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v6 = [v5 remoteAddress];
        if (v6)
        {
          v7 = (void *)v6;
          v8 = [v5 remoteAddress];

          if (v8)
          {
            v9 = NSString;
            uint64_t v10 = [v5 remoteAddress];
            uint64_t v11 = [v5 remotePort];
            v2 = [v9 stringWithFormat:@"%@:%@", v10, v11];

            goto LABEL_12;
          }
        }
      }
      v2 = (void *)[v1 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v2;
}

@end