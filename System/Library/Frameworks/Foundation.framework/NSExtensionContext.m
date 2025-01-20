@interface NSExtensionContext
+ (BOOL)supportsSecureCoding;
+ (id)_allowedErrorClasses;
+ (id)_defaultExtensionContextProtocol;
+ (id)_defaultExtensionContextVendorProtocol;
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
+ (id)_extensionContextForIdentifier:(id)a3;
+ (id)_extensionContextHostProtocolAllowedClassesForItems;
+ (id)_extensionContextHostProtocolWithAllowedErrorClasses:(id)a3;
+ (id)_extensionContextVendorProtocolWithAllowedErrorClasses:(id)a3;
- ($115C4C562B26FF47E01F9F4EA65B5887)_extensionHostAuditToken;
- (BOOL)_isDummyExtension;
- (BOOL)_isHost;
- (NSArray)inputItems;
- (NSExtensionContext)init;
- (NSExtensionContext)initWithCoder:(id)a3;
- (NSExtensionContext)initWithInputItems:(id)a3;
- (NSExtensionContext)initWithInputItems:(id)a3 contextUUID:(id)a4;
- (NSExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5;
- (NSString)description;
- (NSUUID)_UUID;
- (NSXPCConnection)_auxiliaryConnection;
- (NSXPCListener)_auxiliaryListener;
- (OS_os_transaction)_transaction;
- (_NSExtensionContextHosting)_extensionHostProxy;
- (_NSExtensionContextVending)_extensionVendorProxy;
- (id)_principalObject;
- (id)_processAssertion;
- (id)_requestCleanUpBlock;
- (id)internalImplementation;
- (void)___nsx_pingHost:(id)a3;
- (void)_loadItemForPayload:(id)a3 completionHandler:(id)a4;
- (void)_loadPreviewImageForPayload:(id)a3 completionHandler:(id)a4;
- (void)_openURL:(id)a3 completion:(id)a4;
- (void)_setAuxiliaryConnection:(id)a3;
- (void)_setAuxiliaryListener:(id)a3;
- (void)_setDummyExtension:(BOOL)a3;
- (void)_setExtensionHostAuditToken:(id *)a3;
- (void)_setExtensionHostProxy:(id)a3;
- (void)_setExtensionVendorProxy:(id)a3;
- (void)_setPrincipalObject:(id)a3;
- (void)_setProcessAssertion:(id)a3;
- (void)_setRequestCleanUpBlock:(id)a3;
- (void)_setTransaction:(id)a3;
- (void)_willPerformHostCallback:(id)a3;
- (void)cancelRequestWithError:(NSError *)error;
- (void)completeRequestReturningItems:(NSArray *)items completionHandler:(void *)completionHandler;
- (void)completeRequestReturningItems:(id)a3 expirationHandler:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)openURL:(NSURL *)URL completionHandler:(void *)completionHandler;
- (void)openURL:(id)a3 completion:(id)a4;
- (void)setInputItems:(id)a3;
- (void)set_UUID:(id)a3;
@end

@implementation NSExtensionContext

+ (id)_extensionContextForIdentifier:(id)a3
{
  id v4 = +[_NSExtensionContextVendor _sharedExtensionContextVendor];

  return (id)[v4 _extensionContextForUUID:a3];
}

- (void)setInputItems:(id)a3
{
  id v4 = [(NSExtensionContext *)self internalImplementation];

  [v4 _setInputItems:a3];
}

- (NSArray)inputItems
{
  id v2 = [(NSExtensionContext *)self internalImplementation];

  return (NSArray *)[v2 inputItems];
}

- (void)completeRequestReturningItems:(NSArray *)items completionHandler:(void *)completionHandler
{
  id v6 = [(NSExtensionContext *)self internalImplementation];

  [v6 completeRequestReturningItems:items completionHandler:completionHandler];
}

- (void)cancelRequestWithError:(NSError *)error
{
  id v4 = [(NSExtensionContext *)self internalImplementation];

  [v4 cancelRequestWithError:error];
}

- (void)openURL:(NSURL *)URL completionHandler:(void *)completionHandler
{
  id v6 = [(NSExtensionContext *)self internalImplementation];

  [v6 openURL:URL completionHandler:completionHandler];
}

+ (id)_allowedErrorClasses
{
  return 0;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return 0;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return 0;
}

- (NSExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)NSExtensionContext;
  v8 = [(NSExtensionContext *)&v10 init];
  if (v8)
  {
    if (qword_1EB1ED390 != -1) {
      dispatch_once(&qword_1EB1ED390, &__block_literal_global_2_0);
    }
    v8->_internalImplementation = (id)[objc_alloc((Class)qword_1EB1ED388) initWithInputItems:a3 listenerEndpoint:a4 contextUUID:a5 extensionContext:v8];
  }
  return v8;
}

- (NSExtensionContext)initWithInputItems:(id)a3 contextUUID:(id)a4
{
  return [(NSExtensionContext *)self initWithInputItems:a3 listenerEndpoint:0 contextUUID:a4];
}

- (NSExtensionContext)initWithInputItems:(id)a3
{
  return [(NSExtensionContext *)self initWithInputItems:a3 contextUUID:0];
}

- (NSExtensionContext)init
{
  return [(NSExtensionContext *)self initWithInputItems:MEMORY[0x1E4F1CBF0]];
}

+ (id)_extensionContextHostProtocolAllowedClassesForItems
{
  if (qword_1EB1ED390 != -1) {
    dispatch_once(&qword_1EB1ED390, &__block_literal_global_2_0);
  }
  id v2 = (void *)qword_1EB1ED388;

  return (id)[v2 _extensionContextHostProtocolAllowedClassesForItems];
}

+ (id)_defaultExtensionContextProtocol
{
  if (qword_1EB1ED390 != -1) {
    dispatch_once(&qword_1EB1ED390, &__block_literal_global_2_0);
  }
  id v2 = (void *)qword_1EB1ED388;

  return (id)[v2 _defaultExtensionContextProtocol];
}

+ (id)_extensionContextHostProtocolWithAllowedErrorClasses:(id)a3
{
  if (qword_1EB1ED390 != -1) {
    dispatch_once(&qword_1EB1ED390, &__block_literal_global_2_0);
  }
  id v4 = (void *)qword_1EB1ED388;

  return (id)[v4 _extensionContextHostProtocolWithAllowedErrorClasses:a3];
}

+ (id)_defaultExtensionContextVendorProtocol
{
  if (qword_1EB1ED390 != -1) {
    dispatch_once(&qword_1EB1ED390, &__block_literal_global_2_0);
  }
  id v2 = (void *)qword_1EB1ED388;

  return (id)[v2 _defaultExtensionContextVendorProtocol];
}

+ (id)_extensionContextVendorProtocolWithAllowedErrorClasses:(id)a3
{
  if (qword_1EB1ED390 != -1) {
    dispatch_once(&qword_1EB1ED390, &__block_literal_global_2_0);
  }
  id v4 = (void *)qword_1EB1ED388;

  return (id)[v4 _extensionContextVendorProtocolWithAllowedErrorClasses:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSExtensionContext;
  [(NSExtensionContext *)&v3 dealloc];
}

- (NSExtensionContext)initWithCoder:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (qword_1EB1ED390 != -1) {
    dispatch_once(&qword_1EB1ED390, &__block_literal_global_2_0);
  }
  v5 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"self.internalExtensionContext"];
  v8.receiver = self;
  v8.super_class = (Class)NSExtensionContext;
  id v6 = [(NSExtensionContext *)&v8 init];
  if (v6) {
    v6->_internalImplementation = v5;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = [(NSExtensionContext *)self internalImplementation];

  [a3 encodeObject:v4 forKey:@"self.internalExtensionContext"];
}

- (void)completeRequestReturningItems:(id)a3 expirationHandler:(id)a4 completion:(id)a5
{
}

- (void)openURL:(id)a3 completion:(id)a4
{
}

- (NSUUID)_UUID
{
  id v2 = [(NSExtensionContext *)self internalImplementation];

  return (NSUUID *)[v2 _UUID];
}

- (void)set_UUID:(id)a3
{
  id v4 = [(NSExtensionContext *)self internalImplementation];

  objc_msgSend(v4, "set_UUID:", a3);
}

- (NSXPCConnection)_auxiliaryConnection
{
  id v2 = [(NSExtensionContext *)self internalImplementation];

  return (NSXPCConnection *)[v2 _auxiliaryConnection];
}

- (void)_setAuxiliaryConnection:(id)a3
{
  id v4 = [(NSExtensionContext *)self internalImplementation];

  [v4 _setAuxiliaryConnection:a3];
}

- (NSXPCListener)_auxiliaryListener
{
  id v2 = [(NSExtensionContext *)self internalImplementation];

  return (NSXPCListener *)[v2 _auxiliaryListener];
}

- (void)_setAuxiliaryListener:(id)a3
{
  id v4 = [(NSExtensionContext *)self internalImplementation];

  [v4 _setAuxiliaryListener:a3];
}

- (_NSExtensionContextHosting)_extensionHostProxy
{
  id v2 = [(NSExtensionContext *)self internalImplementation];

  return (_NSExtensionContextHosting *)[v2 _extensionHostProxy];
}

- (void)_setExtensionHostProxy:(id)a3
{
  id v4 = [(NSExtensionContext *)self internalImplementation];

  [v4 _setExtensionHostProxy:a3];
}

- (BOOL)_isHost
{
  id v2 = [(NSExtensionContext *)self internalImplementation];

  return [v2 _isHost];
}

- (_NSExtensionContextVending)_extensionVendorProxy
{
  id v2 = [(NSExtensionContext *)self internalImplementation];

  return (_NSExtensionContextVending *)[v2 _extensionVendorProxy];
}

- (void)_setExtensionVendorProxy:(id)a3
{
  id v4 = [(NSExtensionContext *)self internalImplementation];

  [v4 _setExtensionVendorProxy:a3];
}

- (id)_processAssertion
{
  id v2 = [(NSExtensionContext *)self internalImplementation];

  return (id)[v2 _processAssertion];
}

- (void)_setProcessAssertion:(id)a3
{
  id v4 = [(NSExtensionContext *)self internalImplementation];

  [v4 _setProcessAssertion:a3];
}

- (OS_os_transaction)_transaction
{
  id v2 = [(NSExtensionContext *)self internalImplementation];

  return (OS_os_transaction *)[v2 _transaction];
}

- (void)_setTransaction:(id)a3
{
  id v4 = [(NSExtensionContext *)self internalImplementation];

  [v4 _setTransaction:a3];
}

- ($115C4C562B26FF47E01F9F4EA65B5887)_extensionHostAuditToken
{
  result = [(NSExtensionContext *)self internalImplementation];
  if (result)
  {
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)[($115C4C562B26FF47E01F9F4EA65B5887 *)result _extensionHostAuditToken];
  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }
  return result;
}

- (void)_setExtensionHostAuditToken:(id *)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = [(NSExtensionContext *)self internalImplementation];
  long long v5 = *(_OWORD *)&a3->var0[4];
  v6[0] = *(_OWORD *)a3->var0;
  v6[1] = v5;
  [v4 _setExtensionHostAuditToken:v6];
}

- (id)_requestCleanUpBlock
{
  id v2 = [(NSExtensionContext *)self internalImplementation];

  return (id)[v2 _requestCleanUpBlock];
}

- (void)_setRequestCleanUpBlock:(id)a3
{
  id v4 = [(NSExtensionContext *)self internalImplementation];

  [v4 _setRequestCleanUpBlock:a3];
}

- (id)_principalObject
{
  id v2 = [(NSExtensionContext *)self internalImplementation];

  return (id)[v2 _principalObject];
}

- (void)_setPrincipalObject:(id)a3
{
  id v4 = [(NSExtensionContext *)self internalImplementation];

  [v4 _setPrincipalObject:a3];
}

- (void)invalidate
{
  id v2 = [(NSExtensionContext *)self internalImplementation];

  [v2 invalidate];
}

- (void)_willPerformHostCallback:(id)a3
{
  id v4 = [(NSExtensionContext *)self internalImplementation];

  [v4 _willPerformHostCallback:a3];
}

- (void)___nsx_pingHost:(id)a3
{
}

- (void)_loadItemForPayload:(id)a3 completionHandler:(id)a4
{
  id v6 = [(NSExtensionContext *)self internalImplementation];

  [v6 _loadItemForPayload:a3 completionHandler:a4];
}

- (void)_loadPreviewImageForPayload:(id)a3 completionHandler:(id)a4
{
  id v6 = [(NSExtensionContext *)self internalImplementation];

  [v6 _loadPreviewImageForPayload:a3 completionHandler:a4];
}

- (void)_openURL:(id)a3 completion:(id)a4
{
  id v6 = [(NSExtensionContext *)self internalImplementation];

  [v6 _openURL:a3 completion:a4];
}

- (NSString)description
{
  id v2 = [(NSExtensionContext *)self internalImplementation];

  return (NSString *)[v2 description];
}

- (BOOL)_isDummyExtension
{
  return self->__dummyExtension;
}

- (void)_setDummyExtension:(BOOL)a3
{
  self->__dummyExtension = a3;
}

- (id)internalImplementation
{
  return objc_getProperty(self, a2, 16, 1);
}

@end