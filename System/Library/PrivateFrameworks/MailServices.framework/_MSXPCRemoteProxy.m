@interface _MSXPCRemoteProxy
- (BOOL)conformsToProtocol:(id)a3;
- (_MSXPCRemoteProxy)initWithConnection:(id)a3 interface:(id)a4 errorHandler:(id)a5;
- (id)___nsxpc_remoteObjectProxy;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (void)___setNSXPCRemoteObjectProxy:(id)a3;
- (void)dealloc;
- (void)forwardInvocation:(id)a3;
@end

@implementation _MSXPCRemoteProxy

- (void)forwardInvocation:(id)a3
{
}

- (id)___nsxpc_remoteObjectProxy
{
  return self->____nsxpc_remoteObjectProxy;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v5 = [(NSXPCInterface *)self->_remoteInterface protocol];
  if (!v5)
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"%s: No protocol has been set on connection %@", "-[_MSXPCRemoteProxy methodSignatureForSelector:]", self->_connection format];
    goto LABEL_10;
  }
  if (!a3)
  {
LABEL_10:
    v6 = 0;
    goto LABEL_11;
  }
  os_unfair_lock_lock(&self->_selectorLock);
  v6 = CFDictionaryGetValue(self->_knownSelectors, a3);
  os_unfair_lock_unlock(&self->_selectorLock);
  if (!v6)
  {
    objc_method_description MethodDescription = protocol_getMethodDescription(v5, a3, 1, 1);
    types = MethodDescription.types;
    if (MethodDescription.name || (objc_method_description v9 = protocol_getMethodDescription(v5, a3, 0, 1), types = v9.types, v9.name))
    {
      v6 = [MEMORY[0x263EFF970] signatureWithObjCTypes:types];
      if (v6) {
        goto LABEL_8;
      }
    }
    v11.receiver = self;
    v11.super_class = (Class)_MSXPCRemoteProxy;
    v6 = [(_MSXPCRemoteProxy *)&v11 methodSignatureForSelector:a3];
    if (v6)
    {
LABEL_8:
      os_unfair_lock_lock(&self->_selectorLock);
      CFDictionarySetValue(self->_knownSelectors, a3, v6);
      os_unfair_lock_unlock(&self->_selectorLock);
    }
  }
LABEL_11:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->____nsxpc_remoteObjectProxy, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_remoteInterface, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (_MSXPCRemoteProxy)initWithConnection:(id)a3 interface:(id)a4 errorHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_MSXPCRemoteProxy;
  v12 = [(_MSXPCRemoteProxy *)&v18 init];
  v13 = v12;
  if (v12)
  {
    v12->_selectorLock._os_unfair_lock_opaque = 0;
    v12->_knownSelectors = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x263EFFF90]);
    objc_storeStrong((id *)&v13->_connection, a3);
    objc_storeStrong((id *)&v13->_remoteInterface, a4);
    uint64_t v14 = MEMORY[0x2166BBCE0](v11);
    id errorHandler = v13->_errorHandler;
    v13->_id errorHandler = (id)v14;

    v16 = v13;
  }

  return v13;
}

- (void)___setNSXPCRemoteObjectProxy:(id)a3
{
}

- (void)dealloc
{
  knownSelectors = self->_knownSelectors;
  if (knownSelectors) {
    CFRelease(knownSelectors);
  }
  v4.receiver = self;
  v4.super_class = (Class)_MSXPCRemoteProxy;
  [(_MSXPCRemoteProxy *)&v4 dealloc];
}

- (BOOL)conformsToProtocol:(id)a3
{
  objc_super v4 = (Protocol *)a3;
  v8.receiver = self;
  v8.super_class = (Class)_MSXPCRemoteProxy;
  if ([(_MSXPCRemoteProxy *)&v8 conformsToProtocol:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    v6 = [(NSXPCInterface *)self->_remoteInterface protocol];
    BOOL v5 = protocol_conformsToProtocol(v6, v4);
  }
  return v5;
}

- (id)remoteObjectProxy
{
  v2 = [[_MSXPCRemoteProxy alloc] initWithConnection:self->_connection interface:self->_remoteInterface errorHandler:0];

  return v2;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = [[_MSXPCRemoteProxy alloc] initWithConnection:self->_connection interface:self->_remoteInterface errorHandler:v4];

  return v5;
}

@end