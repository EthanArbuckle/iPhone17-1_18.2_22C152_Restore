@interface GEONetworkSessionTaskTransactionMetrics(ClientMetrics)
- (id)initWithClientNetworkTransactionMetrics:()ClientMetrics;
@end

@implementation GEONetworkSessionTaskTransactionMetrics(ClientMetrics)

- (id)initWithClientNetworkTransactionMetrics:()ClientMetrics
{
  id v4 = a3;
  v7.receiver = a1;
  v7.super_class = (Class)&off_27017F480;
  id v5 = objc_msgSendSuper2(&v7, sel_init);
  if (v5)
  {
    if ([v4 hasConnectStart])
    {
      [v4 connectStart];
      objc_msgSend(v5, "setConnectStart:");
    }
    if ([v4 hasConnectEnd])
    {
      [v4 connectEnd];
      objc_msgSend(v5, "setConnectEnd:");
    }
    if ([v4 hasDomainLookupStart])
    {
      [v4 domainLookupStart];
      objc_msgSend(v5, "setDomainLookupStart:");
    }
    if ([v4 hasDomainLookupEnd])
    {
      [v4 domainLookupEnd];
      objc_msgSend(v5, "setDomainLookupEnd:");
    }
    if ([v4 hasFetchStart])
    {
      [v4 fetchStart];
      objc_msgSend(v5, "setFetchStart:");
    }
    if ([v4 hasRequestStart])
    {
      [v4 requestStart];
      objc_msgSend(v5, "setRequestStart:");
    }
    if ([v4 hasRequestEnd])
    {
      [v4 requestEnd];
      objc_msgSend(v5, "setRequestEnd:");
    }
    if ([v4 hasResponseStart])
    {
      [v4 responseStart];
      objc_msgSend(v5, "setResponseStart:");
    }
    if ([v4 hasResponseEnd])
    {
      [v4 responseEnd];
      objc_msgSend(v5, "setResponseEnd:");
    }
    if ([v4 hasSecureConnectStart])
    {
      [v4 secureConnectStart];
      objc_msgSend(v5, "setSecureConnectStart:");
    }
    if ([v4 hasSecureConnectEnd])
    {
      [v4 secureConnectEnd];
      objc_msgSend(v5, "setSecureConnectEnd:");
    }
    if ([v4 hasProxyConnection]) {
      objc_msgSend(v5, "setProxyConnection:", objc_msgSend(v4, "proxyConnection"));
    }
    if ([v4 hasReusedConnection]) {
      objc_msgSend(v5, "setReusedConnection:", objc_msgSend(v4, "reusedConnection"));
    }
  }

  return v5;
}

@end