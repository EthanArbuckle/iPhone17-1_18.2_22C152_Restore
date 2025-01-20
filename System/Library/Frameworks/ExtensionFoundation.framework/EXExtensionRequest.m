@interface EXExtensionRequest
- (EXExtensionRequest)init;
- (NSArray)inputItems;
- (NSExtensionContext)context;
- (NSString)sandboxProfileName;
- (NSUUID)pkUUID;
- (NSXPCConnection)xpcConnection;
- (NSXPCListenerEndpoint)endpoint;
- (PKPlugInPrivate)plugIn;
- (RBSProcessIdentifier)processIdentifier;
- (_EXExtensionInstanceIdentifier)instanceIdentifier;
- (_EXPersona)persona;
- (id)assertion;
- (id)description;
- (unint64_t)options;
- (void)applyActiveWebPageAlternativeIfNeededForExtension:(id)a3;
- (void)dealloc;
- (void)setAssertion:(id)a3;
- (void)setContext:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setInputItems:(id)a3;
- (void)setInstanceIdentifier:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setPersona:(id)a3;
- (void)setPkUUID:(id)a3;
- (void)setPlugIn:(id)a3;
- (void)setProcessIdentifier:(id)a3;
- (void)setSandboxProfileName:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation EXExtensionRequest

- (NSString)sandboxProfileName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSUUID)pkUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (_EXPersona)persona
{
  return (_EXPersona *)objc_getProperty(self, a2, 48, 1);
}

- (void)applyActiveWebPageAlternativeIfNeededForExtension:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  v6 = [(EXExtensionRequest *)self inputItems];
  LODWORD(v5) = [v5 _inputItemsMatchActiveWebPageAlternative:v6];

  if (v5)
  {
    v7 = _EXLegacyLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[EXExtensionRequest(NSExtensionActiveWebPageAlternative) applyActiveWebPageAlternativeIfNeededForExtension:](v7);
    }

    v8 = [v4 infoDictionary];
    v9 = objc_msgSend(v8, "_EX_dictionaryForKey:", @"NSExtensionAttributes");

    v10 = objc_msgSend(v9, "_EX_dictionaryForKey:", @"NSExtensionAttributes");
    v11 = [v10 objectForKeyedSubscript:@"NSExtensionActivationRule"];
    if (v11)
    {
      v12 = _EXLegacyLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        [(EXExtensionRequest(NSExtensionActiveWebPageAlternative) *)self applyActiveWebPageAlternativeIfNeededForExtension:v12];
      }

      v13 = objc_opt_class();
      v14 = [(EXExtensionRequest *)self inputItems];
      v15 = [v13 _inputItemsByApplyingActiveWebPageAlternative:v14 ifNeededByActivationRule:v11];
      [(EXExtensionRequest *)self setInputItems:v15];
    }
  }
}

- (EXExtensionRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)EXExtensionRequest;
  v2 = [(EXExtensionRequest *)&v6 init];
  if (v2)
  {
    v3 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
    pkUUID = v2->_pkUUID;
    v2->_pkUUID = v3;
  }
  return v2;
}

- (void)dealloc
{
  [self->_assertion setInvalidationHandler:0];
  [self->_assertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)EXExtensionRequest;
  [(EXExtensionRequest *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)EXExtensionRequest;
  id v4 = [(EXExtensionRequest *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ Request PK UUID: %@ with item count %lu", v4, self->_pkUUID, -[NSArray count](self->_inputItems, "count")];

  return v5;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (NSArray)inputItems
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInputItems:(id)a3
{
}

- (NSXPCListenerEndpoint)endpoint
{
  return (NSXPCListenerEndpoint *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEndpoint:(id)a3
{
}

- (_EXExtensionInstanceIdentifier)instanceIdentifier
{
  return (_EXExtensionInstanceIdentifier *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInstanceIdentifier:(id)a3
{
}

- (void)setSandboxProfileName:(id)a3
{
}

- (void)setPersona:(id)a3
{
}

- (void)setPkUUID:(id)a3
{
}

- (id)assertion
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setAssertion:(id)a3
{
}

- (RBSProcessIdentifier)processIdentifier
{
  return (RBSProcessIdentifier *)objc_getProperty(self, a2, 72, 1);
}

- (void)setProcessIdentifier:(id)a3
{
}

- (PKPlugInPrivate)plugIn
{
  return (PKPlugInPrivate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPlugIn:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 88, 1);
}

- (void)setXpcConnection:(id)a3
{
}

- (NSExtensionContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);

  return (NSExtensionContext *)WeakRetained;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_plugIn, 0);
  objc_storeStrong((id *)&self->_processIdentifier, 0);
  objc_storeStrong(&self->_assertion, 0);
  objc_storeStrong((id *)&self->_pkUUID, 0);
  objc_storeStrong((id *)&self->_persona, 0);
  objc_storeStrong((id *)&self->_sandboxProfileName, 0);
  objc_storeStrong((id *)&self->_instanceIdentifier, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);

  objc_storeStrong((id *)&self->_inputItems, 0);
}

@end