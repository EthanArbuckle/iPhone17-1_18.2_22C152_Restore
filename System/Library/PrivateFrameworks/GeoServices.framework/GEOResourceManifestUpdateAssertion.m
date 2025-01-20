@interface GEOResourceManifestUpdateAssertion
- (GEOResourceManifestUpdateAssertion)init;
- (GEOResourceManifestUpdateAssertion)initWithReason:(id)a3;
- (id)debugDescription;
- (void)_connectToGeod;
- (void)dealloc;
@end

@implementation GEOResourceManifestUpdateAssertion

- (GEOResourceManifestUpdateAssertion)init
{
  result = (GEOResourceManifestUpdateAssertion *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOResourceManifestUpdateAssertion)initWithReason:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GEOResourceManifestUpdateAssertion;
  v5 = [(GEOResourceManifestUpdateAssertion *)&v17 init];
  if (!v5)
  {
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  if (![v4 length])
  {
    v12 = GEOGetResourceManifestLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_FAULT, "Empty reason provided for update assertion", (uint8_t *)location, 2u);
    }

    goto LABEL_7;
  }
  uint64_t v6 = [v4 copy];
  reason = v5->_reason;
  v5->_reason = (NSString *)v6;

  v5->_creationTimestamp = CFAbsoluteTimeGetCurrent();
  uint64_t v8 = +[GEOXPCConnection createServerConnectionFor:12 debugIdentifier:@"ResourceManifestUpdate" eventHandler:0];
  connection = v5->_connection;
  v5->_connection = (GEOXPCConnection *)v8;

  objc_initWeak(location, v5);
  global_queue = geo_get_global_queue();
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __53__GEOResourceManifestUpdateAssertion_initWithReason___block_invoke;
  handler[3] = &unk_1E53DD2C0;
  objc_copyWeak(&v15, location);
  notify_register_dispatch("GEODaemonDidStartDarwinNotification", &v5->_notifyToken, global_queue, handler);

  [(GEOResourceManifestUpdateAssertion *)v5 _connectToGeod];
  v11 = v5;
  objc_destroyWeak(&v15);
  objc_destroyWeak(location);
LABEL_8:

  return v11;
}

void __53__GEOResourceManifestUpdateAssertion_initWithReason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectToGeod];
}

- (void)dealloc
{
  notify_cancel(self->_notifyToken);
  v3.receiver = self;
  v3.super_class = (Class)GEOResourceManifestUpdateAssertion;
  [(GEOResourceManifestUpdateAssertion *)&v3 dealloc];
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"<%@ %p> %@", objc_opt_class(), self, self->_reason];
}

- (void)_connectToGeod
{
  objc_super v3 = [(GEOXPCRequest *)[GEOResourceManifestUpdateAssertionXPCCheckinRequest alloc] initWithMessage:@"resourcemanifestupdateassertion.checkinForUpdateAssertion" traits:0 auditToken:0 throttleToken:0];
  [(GEOResourceManifestUpdateAssertionXPCCheckinRequest *)v3 setReason:self->_reason];
  [(GEOResourceManifestUpdateAssertionXPCCheckinRequest *)v3 setTimestamp:self->_creationTimestamp];
  [(GEOXPCRequest *)v3 send:self->_connection];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_reason, 0);
}

@end