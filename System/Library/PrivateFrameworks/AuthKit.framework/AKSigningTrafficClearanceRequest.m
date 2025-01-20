@interface AKSigningTrafficClearanceRequest
- (AKClient)client;
- (AKSigningTrafficClearanceRequest)initWithClient:(id)a3 signingBlock:(id)a4;
- (BOOL)shouldProvisionIfNeccessary;
- (NSDate)requestDate;
- (id)description;
- (id)signingBlock;
- (unsigned)requestQosClass;
- (void)setShouldProvisionIfNeccessary:(BOOL)a3;
@end

@implementation AKSigningTrafficClearanceRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_signingBlock, 0);
  objc_storeStrong((id *)&self->_requestDate, 0);

  objc_storeStrong((id *)&self->_client, 0);
}

- (id)signingBlock
{
  return self->_signingBlock;
}

- (void)setShouldProvisionIfNeccessary:(BOOL)a3
{
  self->_shouldProvisionIfNeccessary = a3;
}

- (AKSigningTrafficClearanceRequest)initWithClient:(id)a3 signingBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AKSigningTrafficClearanceRequest;
  v9 = [(AKSigningTrafficClearanceRequest *)&v15 init];
  if (v9)
  {
    uint64_t v10 = +[NSDate now];
    requestDate = v9->_requestDate;
    v9->_requestDate = (NSDate *)v10;

    v9->_requestQosClass = qos_class_self();
    id v12 = objc_retainBlock(v8);
    id signingBlock = v9->_signingBlock;
    v9->_id signingBlock = v12;

    objc_storeStrong((id *)&v9->_client, a3);
  }

  return v9;
}

- (unsigned)requestQosClass
{
  return self->_requestQosClass;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(AKClient *)self->_client name];
  requestDate = self->_requestDate;
  if (self->_shouldProvisionIfNeccessary) {
    CFStringRef v7 = @"YES";
  }
  else {
    CFStringRef v7 = @"NO";
  }
  id v8 = +[NSNumber numberWithUnsignedInt:self->_requestQosClass];
  v9 = +[NSString stringWithFormat:@"<%@: %p : %@ : %@> provisioning desired: %@, request qos: %@", v4, self, v5, requestDate, v7, v8];

  return v9;
}

- (AKClient)client
{
  return self->_client;
}

- (NSDate)requestDate
{
  return self->_requestDate;
}

- (BOOL)shouldProvisionIfNeccessary
{
  return self->_shouldProvisionIfNeccessary;
}

@end