@interface AKBagTrafficClearanceRequest
- (AKBagTrafficClearanceRequest)init;
- (AKURLBagFetchContext)context;
- (BOOL)fromURLCache;
- (BOOL)ignoreMemoryCache;
- (NSDate)requestDate;
- (NSString)urlSwitchData;
- (id)clearanceHandler;
- (id)description;
- (void)setClearanceHandler:(id)a3;
- (void)setContext:(id)a3;
- (void)setFromURLCache:(BOOL)a3;
- (void)setIgnoreMemoryCache:(BOOL)a3;
- (void)setUrlSwitchData:(id)a3;
@end

@implementation AKBagTrafficClearanceRequest

- (AKBagTrafficClearanceRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)AKBagTrafficClearanceRequest;
  v2 = [(AKBagTrafficClearanceRequest *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSDate now];
    requestDate = v2->_requestDate;
    v2->_requestDate = (NSDate *)v3;
  }
  return v2;
}

- (id)description
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  requestDate = self->_requestDate;
  uint64_t v6 = [(AKURLBagFetchContext *)self->_context altDSID];
  v7 = (void *)v6;
  CFStringRef v8 = @"YES";
  if (self->_fromURLCache) {
    CFStringRef v9 = @"YES";
  }
  else {
    CFStringRef v9 = @"NO";
  }
  if (!self->_ignoreMemoryCache) {
    CFStringRef v8 = @"NO";
  }
  v10 = +[NSString stringWithFormat:@"<%@: %p : %@> altDSID %@, require HTTP cache: %@, ignore memory cache: %@", v4, self, requestDate, v6, v9, v8];

  return v10;
}

- (AKURLBagFetchContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (id)clearanceHandler
{
  return self->_clearanceHandler;
}

- (void)setClearanceHandler:(id)a3
{
}

- (NSDate)requestDate
{
  return self->_requestDate;
}

- (NSString)urlSwitchData
{
  return self->_urlSwitchData;
}

- (void)setUrlSwitchData:(id)a3
{
}

- (BOOL)fromURLCache
{
  return self->_fromURLCache;
}

- (void)setFromURLCache:(BOOL)a3
{
  self->_fromURLCache = a3;
}

- (BOOL)ignoreMemoryCache
{
  return self->_ignoreMemoryCache;
}

- (void)setIgnoreMemoryCache:(BOOL)a3
{
  self->_ignoreMemoryCache = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlSwitchData, 0);
  objc_storeStrong((id *)&self->_requestDate, 0);
  objc_storeStrong(&self->_clearanceHandler, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end