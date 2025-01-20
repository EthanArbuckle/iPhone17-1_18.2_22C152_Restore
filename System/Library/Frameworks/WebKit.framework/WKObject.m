@interface WKObject
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)isMemberOfClass:(Class)a3;
- (BOOL)isNSArray__;
- (BOOL)isNSCFConstantString__;
- (BOOL)isNSData__;
- (BOOL)isNSDate__;
- (BOOL)isNSDictionary__;
- (BOOL)isNSNumber__;
- (BOOL)isNSObject__;
- (BOOL)isNSOrderedSet__;
- (BOOL)isNSSet__;
- (BOOL)isNSString__;
- (BOOL)isNSTimeZone__;
- (BOOL)isNSValue__;
- (BOOL)respondsToSelector:(SEL)a3;
- (Class)classForCoder;
- (Class)classForKeyedArchiver;
- (NSString)debugDescription;
- (NSString)description;
- (Object)_apiObject;
- (id).cxx_construct;
- (id)_web_createTarget;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)forwardInvocation:(id)a3;
@end

@implementation WKObject

- (Object)_apiObject
{
  size_t __space = 16;
  IndexedIvars = object_getIndexedIvars(self);
  return (Object *)std::align(8uLL, 0x10uLL, &IndexedIvars, &__space);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  m_ptr = self->_target.m_ptr;
  self->_target.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    size_t __space = 16;
    __ptr = object_getIndexedIvars(self);
    v4 = *(void (***)(void))std::align(8uLL, 0x10uLL, &__ptr, &__space);
    (*v4)();
    v5.receiver = self;
    v5.super_class = (Class)WKObject;
    [(WKObject *)&v5 dealloc];
  }
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  if (!self->_hasInitializedTarget)
  {
    self->_hasInitializedTarget = 1;
    id v6 = [(WKObject *)self _web_createTarget];
    m_ptr = self->_target.m_ptr;
    self->_target.m_ptr = v6;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  v8 = self->_target.m_ptr;

  return [v8 isEqual:a3];
}

- (unint64_t)hash
{
  if (!self->_hasInitializedTarget)
  {
    self->_hasInitializedTarget = 1;
    id v3 = [(WKObject *)self _web_createTarget];
    m_ptr = self->_target.m_ptr;
    self->_target.m_ptr = v3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  objc_super v5 = self->_target.m_ptr;
  if (v5)
  {
    return [v5 hash];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)WKObject;
    return [(WKObject *)&v7 hash];
  }
}

- (BOOL)isKindOfClass:(Class)a3
{
  if (!self->_hasInitializedTarget)
  {
    self->_hasInitializedTarget = 1;
    id v4 = [(WKObject *)self _web_createTarget];
    m_ptr = self->_target.m_ptr;
    self->_target.m_ptr = v4;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isMemberOfClass:(Class)a3
{
  if (!self->_hasInitializedTarget)
  {
    self->_hasInitializedTarget = 1;
    id v5 = [(WKObject *)self _web_createTarget];
    m_ptr = self->_target.m_ptr;
    self->_target.m_ptr = v5;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  objc_super v7 = self->_target.m_ptr;

  return [v7 isMemberOfClass:a3];
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (!self->_hasInitializedTarget)
  {
    self->_hasInitializedTarget = 1;
    id v5 = [(WKObject *)self _web_createTarget];
    m_ptr = self->_target.m_ptr;
    self->_target.m_ptr = v5;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  if (objc_opt_respondsToSelector()) {
    return 1;
  }
  v8.receiver = self;
  v8.super_class = (Class)WKObject;
  return [(WKObject *)&v8 respondsToSelector:a3];
}

- (BOOL)conformsToProtocol:(id)a3
{
  if (!self->_hasInitializedTarget)
  {
    self->_hasInitializedTarget = 1;
    id v5 = [(WKObject *)self _web_createTarget];
    m_ptr = self->_target.m_ptr;
    self->_target.m_ptr = v5;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  if ([self->_target.m_ptr conformsToProtocol:a3]) {
    return 1;
  }
  v8.receiver = self;
  v8.super_class = (Class)WKObject;
  return [(WKObject *)&v8 conformsToProtocol:a3];
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  if (!self->_hasInitializedTarget)
  {
    self->_hasInitializedTarget = 1;
    id v4 = [(WKObject *)self _web_createTarget];
    m_ptr = self->_target.m_ptr;
    self->_target.m_ptr = v4;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  return self->_target.m_ptr;
}

- (NSString)description
{
  if (!self->_hasInitializedTarget)
  {
    self->_hasInitializedTarget = 1;
    id v3 = [(WKObject *)self _web_createTarget];
    m_ptr = self->_target.m_ptr;
    self->_target.m_ptr = v3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  id v5 = self->_target.m_ptr;
  if (v5)
  {
    return (NSString *)[v5 description];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)WKObject;
    return [(WKObject *)&v7 description];
  }
}

- (NSString)debugDescription
{
  if (!self->_hasInitializedTarget)
  {
    self->_hasInitializedTarget = 1;
    id v3 = [(WKObject *)self _web_createTarget];
    m_ptr = self->_target.m_ptr;
    self->_target.m_ptr = v3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  id v5 = self->_target.m_ptr;
  if (v5)
  {
    return (NSString *)[v5 debugDescription];
  }
  else
  {
    return [(WKObject *)self description];
  }
}

- (Class)classForCoder
{
  if (!self->_hasInitializedTarget)
  {
    self->_hasInitializedTarget = 1;
    id v3 = [(WKObject *)self _web_createTarget];
    m_ptr = self->_target.m_ptr;
    self->_target.m_ptr = v3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  id v5 = self->_target.m_ptr;

  return (Class)[v5 classForCoder];
}

- (Class)classForKeyedArchiver
{
  if (!self->_hasInitializedTarget)
  {
    self->_hasInitializedTarget = 1;
    id v3 = [(WKObject *)self _web_createTarget];
    m_ptr = self->_target.m_ptr;
    self->_target.m_ptr = v3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  id v5 = self->_target.m_ptr;

  return (Class)[v5 classForKeyedArchiver];
}

- (id)_web_createTarget
{
  return 0;
}

- (void)forwardInvocation:(id)a3
{
  if (!self->_hasInitializedTarget)
  {
    self->_hasInitializedTarget = 1;
    id v5 = [(WKObject *)self _web_createTarget];
    m_ptr = self->_target.m_ptr;
    self->_target.m_ptr = v5;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  objc_super v7 = self->_target.m_ptr;

  [a3 invokeWithTarget:v7];
}

- (id)methodSignatureForSelector:(SEL)a3
{
  if (!self->_hasInitializedTarget)
  {
    self->_hasInitializedTarget = 1;
    id v5 = [(WKObject *)self _web_createTarget];
    m_ptr = self->_target.m_ptr;
    self->_target.m_ptr = v5;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  objc_super v7 = self->_target.m_ptr;

  return (id)[v7 methodSignatureForSelector:a3];
}

- (BOOL)isNSObject__
{
  if (!self->_hasInitializedTarget)
  {
    self->_hasInitializedTarget = 1;
    id v3 = [(WKObject *)self _web_createTarget];
    m_ptr = self->_target.m_ptr;
    self->_target.m_ptr = v3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  id v5 = self->_target.m_ptr;

  return [v5 isNSObject];
}

- (BOOL)isNSArray__
{
  if (!self->_hasInitializedTarget)
  {
    self->_hasInitializedTarget = 1;
    id v3 = [(WKObject *)self _web_createTarget];
    m_ptr = self->_target.m_ptr;
    self->_target.m_ptr = v3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  id v5 = self->_target.m_ptr;

  return [v5 isNSArray];
}

- (BOOL)isNSCFConstantString__
{
  if (!self->_hasInitializedTarget)
  {
    self->_hasInitializedTarget = 1;
    id v3 = [(WKObject *)self _web_createTarget];
    m_ptr = self->_target.m_ptr;
    self->_target.m_ptr = v3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  id v5 = self->_target.m_ptr;

  return [v5 isNSCFConstantString];
}

- (BOOL)isNSData__
{
  if (!self->_hasInitializedTarget)
  {
    self->_hasInitializedTarget = 1;
    id v3 = [(WKObject *)self _web_createTarget];
    m_ptr = self->_target.m_ptr;
    self->_target.m_ptr = v3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  id v5 = self->_target.m_ptr;

  return [v5 isNSData];
}

- (BOOL)isNSDate__
{
  if (!self->_hasInitializedTarget)
  {
    self->_hasInitializedTarget = 1;
    id v3 = [(WKObject *)self _web_createTarget];
    m_ptr = self->_target.m_ptr;
    self->_target.m_ptr = v3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  id v5 = self->_target.m_ptr;

  return [v5 isNSDate];
}

- (BOOL)isNSDictionary__
{
  if (!self->_hasInitializedTarget)
  {
    self->_hasInitializedTarget = 1;
    id v3 = [(WKObject *)self _web_createTarget];
    m_ptr = self->_target.m_ptr;
    self->_target.m_ptr = v3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  id v5 = self->_target.m_ptr;

  return [v5 isNSDictionary];
}

- (BOOL)isNSNumber__
{
  if (!self->_hasInitializedTarget)
  {
    self->_hasInitializedTarget = 1;
    id v3 = [(WKObject *)self _web_createTarget];
    m_ptr = self->_target.m_ptr;
    self->_target.m_ptr = v3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  id v5 = self->_target.m_ptr;

  return [v5 isNSNumber];
}

- (BOOL)isNSOrderedSet__
{
  if (!self->_hasInitializedTarget)
  {
    self->_hasInitializedTarget = 1;
    id v3 = [(WKObject *)self _web_createTarget];
    m_ptr = self->_target.m_ptr;
    self->_target.m_ptr = v3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  id v5 = self->_target.m_ptr;

  return [v5 isNSOrderedSet];
}

- (BOOL)isNSSet__
{
  if (!self->_hasInitializedTarget)
  {
    self->_hasInitializedTarget = 1;
    id v3 = [(WKObject *)self _web_createTarget];
    m_ptr = self->_target.m_ptr;
    self->_target.m_ptr = v3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  id v5 = self->_target.m_ptr;

  return [v5 isNSSet];
}

- (BOOL)isNSString__
{
  if (!self->_hasInitializedTarget)
  {
    self->_hasInitializedTarget = 1;
    id v3 = [(WKObject *)self _web_createTarget];
    m_ptr = self->_target.m_ptr;
    self->_target.m_ptr = v3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  id v5 = self->_target.m_ptr;

  return [v5 isNSString];
}

- (BOOL)isNSTimeZone__
{
  if (!self->_hasInitializedTarget)
  {
    self->_hasInitializedTarget = 1;
    id v3 = [(WKObject *)self _web_createTarget];
    m_ptr = self->_target.m_ptr;
    self->_target.m_ptr = v3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  id v5 = self->_target.m_ptr;

  return [v5 isNSTimeZone];
}

- (BOOL)isNSValue__
{
  if (!self->_hasInitializedTarget)
  {
    self->_hasInitializedTarget = 1;
    id v3 = [(WKObject *)self _web_createTarget];
    m_ptr = self->_target.m_ptr;
    self->_target.m_ptr = v3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  id v5 = self->_target.m_ptr;

  return [v5 isNSValue];
}

@end