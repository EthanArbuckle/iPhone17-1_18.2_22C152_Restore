@interface AKTrafficClearenceRequest
- (AKAuthenticatedServerRequest)context;
- (AKAuthenticationContext_Internal)authContext;
- (AKTrafficClearenceRequest)init;
- (NSDate)requestDate;
- (NSString)clientBundleID;
- (id)clearanceHandler;
- (id)description;
- (unsigned)requestQosClass;
- (void)setAuthContext:(id)a3;
- (void)setClearanceHandler:(id)a3;
- (void)setClientBundleID:(id)a3;
- (void)setContext:(id)a3;
- (void)setRequestDate:(id)a3;
@end

@implementation AKTrafficClearenceRequest

- (AKTrafficClearenceRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)AKTrafficClearenceRequest;
  v2 = [(AKTrafficClearenceRequest *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSDate now];
    requestDate = v2->_requestDate;
    v2->_requestDate = (NSDate *)v3;

    v2->_requestQosClass = qos_class_self();
  }
  return v2;
}

- (id)description
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  context = self->_context;
  clientBundleID = self->_clientBundleID;
  requestDate = self->_requestDate;
  v8 = +[NSNumber numberWithUnsignedInt:self->_requestQosClass];
  v9 = +[NSString stringWithFormat:@"<%@: %p : %@> context %@, requested by %@, qos: %@", v4, self, requestDate, context, clientBundleID, v8];

  return v9;
}

- (AKAuthenticatedServerRequest)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (AKAuthenticationContext_Internal)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
}

- (id)clearanceHandler
{
  return self->_clearanceHandler;
}

- (void)setClearanceHandler:(id)a3
{
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setClientBundleID:(id)a3
{
}

- (NSDate)requestDate
{
  return self->_requestDate;
}

- (void)setRequestDate:(id)a3
{
}

- (unsigned)requestQosClass
{
  return self->_requestQosClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestDate, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong(&self->_clearanceHandler, 0);
  objc_storeStrong((id *)&self->_authContext, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end