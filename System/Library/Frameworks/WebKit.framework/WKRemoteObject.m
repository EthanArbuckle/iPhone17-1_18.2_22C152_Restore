@interface WKRemoteObject
- (BOOL)conformsToProtocol:(id)a3;
- (id).cxx_construct;
- (id)_initWithObjectRegistry:(id)a3 interface:(id)a4;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
@end

@implementation WKRemoteObject

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (id)_initWithObjectRegistry:(id)a3 interface:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)WKRemoteObject;
  v6 = [(WKRemoteObject *)&v10 init];
  if (v6)
  {
    if (a3) {
      CFRetain(a3);
    }
    m_ptr = v6->_objectRegistry.m_ptr;
    v6->_objectRegistry.m_ptr = a3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    if (a4) {
      CFRetain(a4);
    }
    v8 = v6->_interface.m_ptr;
    v6->_interface.m_ptr = a4;
    if (v8) {
      CFRelease(v8);
    }
  }
  return v6;
}

- (BOOL)conformsToProtocol:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WKRemoteObject;
  return -[WKRemoteObject conformsToProtocol:](&v6, sel_conformsToProtocol_)
      || protocol_conformsToProtocol((Protocol *)[self->_interface.m_ptr protocol], (Protocol *)a3);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  if (!a3) {
    return 0;
  }
  v5 = (Protocol *)[self->_interface.m_ptr protocol];
  objc_method_description MethodDescription = protocol_getMethodDescription(v5, a3, 1, 1);
  types = MethodDescription.types;
  if ((MethodDescription.name || (objc_method_description v10 = protocol_getMethodDescription(v5, a3, 0, 1), types = v10.types, v10.name))
    && types)
  {
    v8 = (void *)MEMORY[0x1E4F1CA38];
    return (id)[v8 signatureWithObjCTypes:types];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)WKRemoteObject;
    return [(WKRemoteObject *)&v11 methodSignatureForSelector:a3];
  }
}

- (void)forwardInvocation:(id)a3
{
}

- (void).cxx_destruct
{
  m_ptr = self->_interface.m_ptr;
  self->_interface.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  v4 = self->_objectRegistry.m_ptr;
  self->_objectRegistry.m_ptr = 0;
  if (v4)
  {
    CFRelease(v4);
  }
}

@end