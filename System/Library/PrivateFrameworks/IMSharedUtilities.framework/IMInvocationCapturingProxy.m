@interface IMInvocationCapturingProxy
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (IMInvocationCapturingProxy)initWithProtocol:(id)a3 forwardingHandler:(id)a4;
- (Protocol)protocol;
- (id)forwardingHandler;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
@end

@implementation IMInvocationCapturingProxy

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  [v4 retainArguments];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1A0777D84;
  aBlock[3] = &unk_1E5A10220;
  id v8 = v4;
  id v5 = v4;
  v6 = _Block_copy(aBlock);
  (*((void (**)(id, uint64_t, void *))self->_forwardingHandler + 2))(self->_forwardingHandler, [v5 selector], v6);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v3 = [(IMInvocationCapturingProxy *)self methodSignatureForSelector:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  objc_method_description MethodDescription = protocol_getMethodDescription(self->_protocol, a3, 1, 1);
  types = MethodDescription.types;
  if (MethodDescription.name
    || (objc_method_description v7 = protocol_getMethodDescription(self->_protocol, a3, 0, 1), types = v7.types, v7.name)
    || (sel_respondsToSelector_ != a3 ? (BOOL v8 = sel_conformsToProtocol_ == a3) : (BOOL v8 = 1), !v8))
  {
    v9 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:types];
  }
  else
  {
    v9 = [MEMORY[0x1E4FBA8A8] methodSignatureForSelector:a3];
  }

  return v9;
}

- (BOOL)conformsToProtocol:(id)a3
{
  return protocol_conformsToProtocol(self->_protocol, (Protocol *)a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_forwardingHandler, 0);

  objc_storeStrong((id *)&self->_protocol, 0);
}

- (IMInvocationCapturingProxy)initWithProtocol:(id)a3 forwardingHandler:(id)a4
{
  objc_storeStrong((id *)&self->_protocol, a3);
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)[v8 copy];

  id forwardingHandler = self->_forwardingHandler;
  self->_id forwardingHandler = v9;

  return self;
}

- (Protocol)protocol
{
  return self->_protocol;
}

- (id)forwardingHandler
{
  return self->_forwardingHandler;
}

@end