@interface CHSAppIntentsXPCListenerEndpointProvider
- (CHSAppIntentsXPCListenerEndpointProvider)initWithBundleIdentifier:(id)a3;
- (void)getAppIntentsXPCListenerEndpointWithCompletion:(id)a3;
@end

@implementation CHSAppIntentsXPCListenerEndpointProvider

- (CHSAppIntentsXPCListenerEndpointProvider)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CHSAppIntentsXPCListenerEndpointProvider;
  v5 = [(CHSAppIntentsXPCListenerEndpointProvider *)&v11 init];
  if (v5)
  {
    uint64_t v6 = +[CHSChronoServicesConnection sharedInstance];
    connection = v5->_connection;
    v5->_connection = (CHSChronoServicesConnection *)v6;

    uint64_t v8 = [v4 copy];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;
  }
  return v5;
}

- (void)getAppIntentsXPCListenerEndpointWithCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end