@interface CMCaptureFrameSenderEndpoint
- (CMCaptureFrameSenderEndpoint)initWithDictionary:(id)a3;
- (NSData)endpointAuditToken;
- (NSData)endpointProxyAuditToken;
- (NSString)endpointCameraUniqueID;
- (NSString)endpointType;
- (NSString)endpointUniqueID;
- (OS_xpc_object)endpoint;
- (id)description;
- (int)endpointPID;
- (int)endpointProxyPID;
- (void)dealloc;
@end

@implementation CMCaptureFrameSenderEndpoint

- (CMCaptureFrameSenderEndpoint)initWithDictionary:(id)a3
{
  v5 = (void *)[a3 objectForKeyedSubscript:@"endpoint"];
  v6 = (void *)[a3 objectForKeyedSubscript:@"endpoint-uid"];
  v7 = (void *)[a3 objectForKeyedSubscript:@"endpoint-type"];
  int v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"endpoint-pid"), "intValue");
  v9 = (void *)[a3 objectForKeyedSubscript:@"endpoint-audit-token"];
  uint64_t v10 = [a3 objectForKeyedSubscript:@"endpoint-camera-uid"];
  if (v5) {
    BOOL v11 = v6 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11 || v7 == 0 || v8 < 1 || v9 == 0)
  {

    return 0;
  }
  else
  {
    v16 = (void *)v10;
    v19.receiver = self;
    v19.super_class = (Class)CMCaptureFrameSenderEndpoint;
    v17 = [(CMCaptureFrameSenderEndpoint *)&v19 init];
    v15 = v17;
    if (v17)
    {
      v17->_endpoint = (OS_xpc_object *)xpc_retain(v5);
      v15->_endpointUniqueID = (NSString *)v6;
      v15->_endpointType = (NSString *)v7;
      v15->_endpointPID = v8;
      v15->_endpointProxyPID = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"endpoint-proxy-pid"), "intValue");
      v15->_endpointAuditToken = (NSData *)v9;
      v15->_endpointProxyAuditToken = (NSData *)(id)[a3 objectForKeyedSubscript:@"endpoint-proxy-audit-token"];
      v15->_endpointCameraUniqueID = (NSString *)v16;
    }
  }
  return v15;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMCaptureFrameSenderEndpoint;
  [(CMCaptureFrameSenderEndpoint *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@ [%d:%d] %p %@ %@ %@>", NSStringFromClass(v4), self->_endpointPID, self->_endpointProxyPID, self->_endpoint, self->_endpointUniqueID, self->_endpointType, self->_endpointCameraUniqueID];
}

- (OS_xpc_object)endpoint
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)endpointUniqueID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)endpointType
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (int)endpointPID
{
  return self->_endpointPID;
}

- (int)endpointProxyPID
{
  return self->_endpointProxyPID;
}

- (NSData)endpointAuditToken
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (NSData)endpointProxyAuditToken
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)endpointCameraUniqueID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

@end