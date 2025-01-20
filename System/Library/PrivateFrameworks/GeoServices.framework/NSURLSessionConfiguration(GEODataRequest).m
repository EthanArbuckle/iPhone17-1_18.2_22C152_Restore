@interface NSURLSessionConfiguration(GEODataRequest)
- (uint64_t)geo_isCompatibleWithRequest:()GEODataRequest;
- (void)geo_configureWithRequest:()GEODataRequest;
@end

@implementation NSURLSessionConfiguration(GEODataRequest)

- (uint64_t)geo_isCompatibleWithRequest:()GEODataRequest
{
  id v4 = a3;
  v5 = [v4 auditToken];
  uint64_t v6 = objc_msgSend(a1, "geo_hasApplicationAttribution:", v5);

  if (v6)
  {
    int v7 = [a1 _allowsTLSSessionTickets];
    if (v7 != [v4 allowTLSSessionTicketUse]) {
      goto LABEL_24;
    }
    int v8 = [a1 _allowsExpensiveAccess];
    if (v8 == [v4 requireInexpensiveNetwork]) {
      goto LABEL_24;
    }
    int v9 = [a1 allowsCellularAccess];
    if (v9 == [v4 disallowCellularNetwork]) {
      goto LABEL_24;
    }
    int v10 = [a1 _requiresPowerPluggedIn];
    if (v10 != [v4 requirePluggedIn]) {
      goto LABEL_24;
    }
    v11 = [v4 backgroundSessionIdentifier];

    if (((v11 != 0) ^ [a1 isDiscretionary])) {
      goto LABEL_24;
    }
    if (v11)
    {
      v12 = [v4 backgroundSessionIdentifier];
      v13 = [a1 identifier];
      int v14 = [v12 isEqualToString:v13];

      if (!v14) {
        goto LABEL_24;
      }
    }
    v15 = [a1 connectionProxyDictionary];

    if ((v15 != 0) == [v4 needsProxy])
    {
      if (v15)
      {
        v18 = [a1 connectionProxyDictionary];
        v19 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F190D8]];

        v20 = [a1 connectionProxyDictionary];
        v21 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F190E0]];

        v22 = [v4 URL];
        v23 = [v22 scheme];
        int v24 = [v23 isEqualToString:@"https"];

        uint64_t v6 = 0;
        if (!v24 || !v19 || !v21) {
          goto LABEL_25;
        }
      }
    }
    else if (v15 {
           || (GEOGetURLWithSource(39, 0),
    }
               v16 = objc_claimAutoreleasedReturnValue(),
               BOOL v17 = GEOAuthProxyURLIsValid(v16),
               v16,
               v17))
    {
LABEL_24:
      uint64_t v6 = 0;
      goto LABEL_25;
    }
    uint64_t v25 = [a1 multipathServiceType];
    uint64_t v26 = [v4 multipathServiceType];
    if ((unint64_t)(v26 - 1) >= 3) {
      uint64_t v27 = 0;
    }
    else {
      uint64_t v27 = v26;
    }
    if (v25 != v27) {
      goto LABEL_24;
    }
    if ([v4 multipathServiceType])
    {
      uint64_t v28 = [a1 _multipathAlternatePort];
      if (v28 != [v4 multipathAlternatePort]) {
        goto LABEL_24;
      }
    }
    uint64_t v6 = 1;
  }
LABEL_25:

  return v6;
}

- (void)geo_configureWithRequest:()GEODataRequest
{
  id v9 = a3;
  id v4 = [v9 auditToken];
  objc_msgSend(a1, "geo_setApplicationAttribution:", v4);

  if ([v9 needsProxy])
  {
    v5 = +[GEOMapsAuthServiceHelper sharedAuthHelper];
    uint64_t v6 = [v9 URL];
    [v5 setConnectionProxyDictionary:a1 url:v6 proxyURL:0];
  }
  objc_msgSend(a1, "set_allowsTLSSessionTickets:", objc_msgSend(v9, "allowTLSSessionTicketUse"));
  objc_msgSend(a1, "set_allowsExpensiveAccess:", objc_msgSend(v9, "requireInexpensiveNetwork") ^ 1);
  objc_msgSend(a1, "set_requiresPowerPluggedIn:", objc_msgSend(v9, "requirePluggedIn"));
  if ([v9 disallowCellularNetwork]) {
    [a1 setAllowsCellularAccess:0];
  }
  uint64_t v7 = [v9 multipathServiceType];
  if ((unint64_t)(v7 - 1) >= 3) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = v7;
  }
  [a1 setMultipathServiceType:v8];
  if ([v9 multipathServiceType] && objc_msgSend(v9, "multipathAlternatePort")) {
    objc_msgSend(a1, "set_multipathAlternatePort:", objc_msgSend(v9, "multipathAlternatePort"));
  }
}

@end