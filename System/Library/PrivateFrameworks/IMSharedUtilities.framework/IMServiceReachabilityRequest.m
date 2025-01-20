@interface IMServiceReachabilityRequest
+ (BOOL)supportsSecureCoding;
- (IMServiceReachabilityContext)context;
- (IMServiceReachabilityRequest)initWithCoder:(id)a3;
- (IMServiceReachabilityRequest)initWithHandleIDs:(id)a3 requestID:(id)a4 serviceName:(id)a5 accountID:(id)a6 context:(id)a7;
- (NSArray)handleIDs;
- (NSString)accountID;
- (NSString)requestID;
- (NSString)serviceName;
- (id)_signature;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IMServiceReachabilityRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IMServiceReachabilityRequest)initWithHandleIDs:(id)a3 requestID:(id)a4 serviceName:(id)a5 accountID:(id)a6 context:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)IMServiceReachabilityRequest;
  v17 = [(IMServiceReachabilityRequest *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_handleIDs, a3);
    objc_storeStrong((id *)&v18->_requestID, a4);
    objc_storeStrong((id *)&v18->_serviceName, a5);
    objc_storeStrong((id *)&v18->_accountID, a6);
    objc_storeStrong((id *)&v18->_context, a7);
  }

  return v18;
}

- (IMServiceReachabilityRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IMServiceReachabilityRequest;
  v5 = [(IMServiceReachabilityRequest *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"handleIDs"];
    handleIDs = v5->_handleIDs;
    v5->_handleIDs = (NSArray *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestID"];
    requestID = v5->_requestID;
    v5->_requestID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceName"];
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountID"];
    accountID = v5->_accountID;
    v5->_accountID = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"context"];
    context = v5->_context;
    v5->_context = (IMServiceReachabilityContext *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  handleIDs = self->_handleIDs;
  id v5 = a3;
  [v5 encodeObject:handleIDs forKey:@"handleIDs"];
  [v5 encodeObject:self->_requestID forKey:@"requestID"];
  [v5 encodeObject:self->_serviceName forKey:@"serviceName"];
  [v5 encodeObject:self->_accountID forKey:@"accountID"];
  [v5 encodeObject:self->_context forKey:@"context"];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(IMServiceReachabilityRequest *)self requestID];
  uint64_t v6 = [(IMServiceReachabilityRequest *)self serviceName];
  v7 = [(IMServiceReachabilityRequest *)self accountID];
  uint64_t v8 = [(IMServiceReachabilityRequest *)self context];
  v9 = [(IMServiceReachabilityRequest *)self handleIDs];
  uint64_t v10 = [v3 stringWithFormat:@"<%@ %p [requestID: %@ serviceName: %@ accountID: %@ context: %@ handleIDs: %@]>", v4, self, v5, v6, v7, v8, v9];

  return v10;
}

- (id)_signature
{
  v3 = NSString;
  uint64_t v4 = [(IMServiceReachabilityRequest *)self serviceName];
  id v5 = [(IMServiceReachabilityRequest *)self handleIDs];
  uint64_t v6 = [v5 sortedArrayUsingSelector:sel_compare_];
  v7 = [(IMServiceReachabilityRequest *)self context];
  uint64_t v8 = [v7 _signature];
  v9 = [v3 stringWithFormat:@"%@%@%@", v4, v6, v8];

  return v9;
}

- (NSArray)handleIDs
{
  return self->_handleIDs;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (IMServiceReachabilityContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_requestID, 0);

  objc_storeStrong((id *)&self->_handleIDs, 0);
}

@end