@interface PRRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)requestedOnThisDevice;
- (NSDate)dateAddedToLocalCache;
- (NSDictionary)requestInfo;
- (NSNumber)requesterDSID;
- (NSNumber)responderDSID;
- (NSString)ask;
- (NSString)clientIdentifier;
- (NSString)requestID;
- (NSString)statusDescription;
- (PRRequest)initWithAsk:(id)a3 requestInfo:(id)a4;
- (PRRequest)initWithCacheRepresentation:(id)a3;
- (PRRequest)initWithCoder:(id)a3;
- (id)cacheRepresentation;
- (unint64_t)requestStatus;
- (void)setAsk:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setDateAddedToLocalCache:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setRequestInfo:(id)a3;
- (void)setRequestStatus:(unint64_t)a3;
- (void)setRequestedOnThisDevice:(BOOL)a3;
- (void)setRequesterDSID:(id)a3;
- (void)setResponderDSID:(id)a3;
@end

@implementation PRRequest

- (PRRequest)initWithAsk:(id)a3 requestInfo:(id)a4
{
  return 0;
}

- (PRRequest)initWithCacheRepresentation:(id)a3
{
  return 0;
}

- (id)cacheRepresentation
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRRequest)initWithCoder:(id)a3
{
  return 0;
}

- (NSString)requestID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRequestID:(id)a3
{
}

- (NSString)ask
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAsk:(id)a3
{
}

- (NSDictionary)requestInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRequestInfo:(id)a3
{
}

- (unint64_t)requestStatus
{
  return self->_requestStatus;
}

- (void)setRequestStatus:(unint64_t)a3
{
  self->_requestStatus = a3;
}

- (NSNumber)requesterDSID
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRequesterDSID:(id)a3
{
}

- (NSNumber)responderDSID
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setResponderDSID:(id)a3
{
}

- (NSString)clientIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setClientIdentifier:(id)a3
{
}

- (BOOL)requestedOnThisDevice
{
  return self->_requestedOnThisDevice;
}

- (void)setRequestedOnThisDevice:(BOOL)a3
{
  self->_requestedOnThisDevice = a3;
}

- (NSDate)dateAddedToLocalCache
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDateAddedToLocalCache:(id)a3
{
}

- (NSString)statusDescription
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusDescription, 0);
  objc_storeStrong((id *)&self->_dateAddedToLocalCache, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_responderDSID, 0);
  objc_storeStrong((id *)&self->_requesterDSID, 0);
  objc_storeStrong((id *)&self->_requestInfo, 0);
  objc_storeStrong((id *)&self->_ask, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
}

@end