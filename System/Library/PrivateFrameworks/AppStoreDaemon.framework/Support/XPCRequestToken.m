@interface XPCRequestToken
- (AMSProcessInfo)processInfo;
- (BOOL)isInternal;
- (XPCNotificationClient)notificationClient;
- (id)description;
- (void)dealloc;
@end

@implementation XPCRequestToken

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processInfo, 0);
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_requestingBundleID, 0);
  objc_storeStrong((id *)&self->_originatingClientID, 0);
  objc_storeStrong((id *)&self->_serviceClient, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_transactionID, 0);
}

- (id)description
{
  return +[NSString stringWithFormat:@"[%@]", self->_logKey];
}

- (void)dealloc
{
  sub_100015B94((uint64_t)TransactionStore, self->_transactionID);
  v3.receiver = self;
  v3.super_class = (Class)XPCRequestToken;
  [(XPCRequestToken *)&v3 dealloc];
}

- (AMSProcessInfo)processInfo
{
  return (AMSProcessInfo *)objc_getProperty(self, a2, 72, 1);
}

- (XPCNotificationClient)notificationClient
{
  return (XPCNotificationClient *)self->_serviceClient;
}

- (BOOL)isInternal
{
  return self->_internal;
}

@end