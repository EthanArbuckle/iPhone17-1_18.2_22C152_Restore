@interface NSXPCInterface
+ (NSXPCInterface)interfaceWithProtocol:(Protocol *)protocol;
+ (id)signatureForBlock:(id)a3;
- (BOOL)_hasProxiesInArgumentsOfSelector:(SEL)a3;
- (BOOL)_hasProxiesInReplyBlockArgumentsOfSelector:(SEL)a3;
- (BOOL)_selectorIsAllowed:(SEL)a3 isReply:(BOOL)a4 methodSignature:(id *)a5 allowedClasses:(id *)a6;
- (BOOL)_specialCaseObject;
- (Class)_customSubclass;
- (Class)_returnClassForSelector:(SEL)a3;
- (Class)classForSelector:(SEL)a3 argumentIndex:(unint64_t)a4 ofReply:(BOOL)a5;
- (NSSet)classesForSelector:(SEL)sel argumentIndex:(NSUInteger)arg ofReply:(BOOL)ofReply;
- (NSXPCInterface)init;
- (NSXPCInterface)interfaceForSelector:(SEL)sel argumentIndex:(NSUInteger)arg ofReply:(BOOL)ofReply;
- (Protocol)protocol;
- (id)_generateAndCacheMethodSignatureForRemoteSelector:(SEL)a3;
- (id)_interfaceForArgument:(unint64_t)a3 ofSelector:(SEL)a4 reply:(BOOL)a5;
- (id)_methodSignatureForRemoteSelector:(SEL)a3;
- (id)_methodSignatureForReplyBlockOfSelector:(SEL)a3;
- (id)debugDescription;
- (id)replyBlockSignatureForSelector:(SEL)a3;
- (unint64_t)_remoteVersion;
- (unint64_t)_respondsToRemoteSelector:(SEL)a3;
- (unint64_t)version;
- (unint64_t)versionForSelector:(SEL)a3;
- (void)_locked_methodInfoForSelector:(int)a3 createIfNecessary:;
- (void)dealloc;
- (void)setClass:(Class)a3 forSelector:(SEL)a4 argumentIndex:(unint64_t)a5 ofReply:(BOOL)a6;
- (void)setClasses:(NSSet *)classes forSelector:(SEL)sel argumentIndex:(NSUInteger)arg ofReply:(BOOL)ofReply;
- (void)setInterface:(NSXPCInterface *)ifc forSelector:(SEL)sel argumentIndex:(NSUInteger)arg ofReply:(BOOL)ofReply;
- (void)setProtocol:(Protocol *)protocol;
- (void)setVersion:(unint64_t)a3 forSelector:(SEL)a4;
- (void)setXPCType:(xpc_type_t)type forSelector:(SEL)sel argumentIndex:(NSUInteger)arg ofReply:(BOOL)ofReply;
- (void)set_remoteVersion:(unint64_t)a3;
- (xpc_type_t)XPCTypeForSelector:(SEL)sel argumentIndex:(NSUInteger)arg ofReply:(BOOL)ofReply;
@end

@implementation NSXPCInterface

- (BOOL)_specialCaseObject
{
  return self->_specialCaseObject;
}

- (Protocol)protocol
{
  return self->_protocol;
}

+ (NSXPCInterface)interfaceWithProtocol:(Protocol *)protocol
{
  v4 = objc_opt_new();
  [v4 setProtocol:protocol];

  return (NSXPCInterface *)v4;
}

- (NSXPCInterface)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSXPCInterface;
  result = [(NSXPCInterface *)&v3 init];
  if (result)
  {
    result->_remoteVersion = 1;
    result->_knownSelectorsLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)setProtocol:(Protocol *)protocol
{
  cls[386] = *(Class *)MEMORY[0x1E4F143B8];
  if (self->_protocol != protocol)
  {
    v5 = (void *)MEMORY[0x185308110]();
    os_unfair_lock_lock(&self->_knownSelectorsLock);
    os_unfair_lock_lock_with_options();
    Name = (char *)protocol_getName(protocol);
    if (!strncmp(Name, "EXExtensionContextHosting", 0x19uLL)) {
      self->_specialCaseObject = 1;
    }
    if (strchr(Name, 46)) {
      v7 = @"..__NSXPCInterfaceProxy_%s";
    }
    else {
      v7 = @"__NSXPCInterfaceProxy_%s";
    }
    v8 = [+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, Name) UTF8String];
    Class v9 = objc_lookUpClass(v8);
    bzero(cls, 0xC10uLL);
    if (!v9)
    {
      v10 = (objc_class *)objc_opt_class();
      cls[0] = objc_allocateClassPair(v10, v8, 0);
    }
    methodInfo = self->_methodInfo;
    if (methodInfo) {
      CFRelease(methodInfo);
    }
    self->_methodInfo = 0;
    setProtocolMetadata(protocol, (uint64_t)cls);
    if (cls[0])
    {
      setProtocolContextFlush((uint64_t)cls);
      objc_registerClassPair(cls[0]);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&setProtocol__globalRuntimeLockForObjC);
    v12 = cls[0];
    if (v9) {
      v12 = v9;
    }
    self->_xpcDOSubclass = v12;
    os_unfair_lock_unlock(&self->_knownSelectorsLock);
    self->_protocol = protocol;
  }
}

- (BOOL)_selectorIsAllowed:(SEL)a3 isReply:(BOOL)a4 methodSignature:(id *)a5 allowedClasses:(id *)a6
{
  BOOL v8 = a4;
  p_knownSelectorsLock = &self->_knownSelectorsLock;
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  v12 = (void **)-[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)a3, 1);
  v13 = v12;
  if (v12)
  {
    if (v8)
    {
      Value = *v12;
    }
    else
    {
      knownSelectors = self->_knownSelectors;
      if (!knownSelectors)
      {
        knownSelectors = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], 0, &kNSXPCSelKeyCallbacks, MEMORY[0x1E4F1D540]);
        self->_knownSelectors = knownSelectors;
      }
      Value = (void *)CFDictionaryGetValue(knownSelectors, a3);
    }
    id v16 = Value;
    uint64_t v17 = 2;
    if (v8) {
      uint64_t v17 = 1;
    }
    *a6 = (id)[v13[v17] copy];
    os_unfair_lock_unlock(p_knownSelectorsLock);
    if (!v16) {
      id v16 = [(NSXPCInterface *)self _generateAndCacheMethodSignatureForRemoteSelector:a3];
    }
    *a5 = v16;
  }
  else
  {
    os_unfair_lock_unlock(p_knownSelectorsLock);
  }
  return v13 != 0;
}

- (id)_interfaceForArgument:(unint64_t)a3 ofSelector:(SEL)a4 reply:(BOOL)a5
{
  BOOL v5 = a5;
  p_knownSelectorsLock = &self->_knownSelectorsLock;
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  v10 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)a4, 0);
  if (v10)
  {
    uint64_t v11 = 2;
    if (v5) {
      uint64_t v11 = 1;
    }
    v12 = (void *)v10[v11];
  }
  else
  {
    v12 = 0;
  }
  if ([v12 count] <= a3)
  {
    id v13 = 0;
  }
  else
  {
    id v13 = (id)[v12 objectAtIndex:a3];
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      id v13 = 0;
    }
  }
  os_unfair_lock_unlock(p_knownSelectorsLock);
  return v13;
}

- (void)setClasses:(NSSet *)classes forSelector:(SEL)sel argumentIndex:(NSUInteger)arg ofReply:(BOOL)ofReply
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  protocol = self->_protocol;
  if (!protocol)
  {
    v31 = _NSMethodExceptionProem((objc_class *)self, a2);
    v26 = @"%@: Protocol must be set before calling this method.";
    goto LABEL_29;
  }
  if (!sel)
  {
    v31 = _NSMethodExceptionProem((objc_class *)self, a2);
    v26 = @"%@: Selector argument must be non-NULL.";
    goto LABEL_29;
  }
  BOOL v10 = ofReply;
  if (!selectorInProtocol(sel, protocol))
  {
    v27 = _NSMethodExceptionProem((objc_class *)self, a2);
    Name = sel_getName(sel);
    v33 = protocol_getName(protocol);
    v31 = v27;
    v26 = @"%@: Selector '%s' is not in protocol '%s', or is not an instance method.";
LABEL_29:
    v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v26, v31, Name, v33);
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v28 userInfo:0]);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_22:
    v21 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Classes argument must be an NSSet of Class objects.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v21);
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v13 = [(NSSet *)classes countByEnumeratingWithState:&v35 objects:v34 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(classes);
        }
        if (!class_getName(*(Class *)(*((void *)&v35 + 1) + 8 * i))) {
          goto LABEL_22;
        }
      }
      uint64_t v13 = [(NSSet *)classes countByEnumeratingWithState:&v35 objects:v34 count:16];
    }
    while (v13);
  }
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  id v16 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)sel, 1);
  uint64_t v17 = v16;
  if (!v16) {
    goto LABEL_23;
  }
  uint64_t v18 = 2;
  if (v10) {
    uint64_t v18 = 1;
  }
  id v19 = (id)[(id)v16[v18] mutableCopy];
  v20 = v19;
  if (!v19)
  {
LABEL_23:
    v22 = _NSMethodExceptionProem((objc_class *)self, a2);
    v23 = sel_getName(sel);
    v24 = @"selector";
    if (v10) {
      v24 = @"reply block of selector";
    }
    v25 = +[NSString stringWithFormat:@"%@: No arguments were detected for %@ %s", v22, v24, v23];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v25 userInfo:0]);
  }
  if ([v19 count] <= arg)
  {
    v29 = _NSMethodExceptionProem((objc_class *)self, a2);
    v30 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Argument index  '%ld' is out of range for selector %s. The maximum index is %ld.", v29, arg, sel_getName(sel), objc_msgSend(v20, "count") - 1), 0 reason userInfo];
    objc_exception_throw(v30);
  }
  [v20 replaceObjectAtIndex:arg withObject:classes];
  if (v10)
  {

    v17[1] = [v20 copy];
  }
  else
  {

    v17[2] = [v20 copy];
  }
  os_unfair_lock_unlock(&self->_knownSelectorsLock);
}

- (void)_locked_methodInfoForSelector:(int)a3 createIfNecessary:
{
  if (!a1) {
    return 0;
  }
  CFDictionaryRef Mutable = *(const __CFDictionary **)(a1 + 32);
  if (!Mutable)
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], 0, &kNSXPCSelKeyCallbacks, 0);
    *(void *)(a1 + 32) = Mutable;
  }
  Value = CFDictionaryGetValue(Mutable, key);
  if (Value) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = a3 == 0;
  }
  if (!v8)
  {
    uint64_t MethodTypeEncoding = _protocol_getMethodTypeEncoding();
    BOOL v10 = *(Protocol **)(a1 + 8);
    uint64_t v11 = (const char *)key;
    if (MethodTypeEncoding)
    {
      BOOL v12 = 1;
    }
    else
    {
      uint64_t MethodTypeEncoding = _protocol_getMethodTypeEncoding();
      BOOL v10 = *(Protocol **)(a1 + 8);
      uint64_t v11 = (const char *)key;
      if (!MethodTypeEncoding)
      {
        if ((unint64_t)protocol_getMethodDescription(v10, (SEL)key, 1, 1).name
          || (unint64_t)protocol_getMethodDescription((Protocol *)*(void *)(a1 + 8), (SEL)key, 0, 1).name)
        {
          Name = protocol_getName(*(Protocol **)(a1 + 8));
          uint64_t v18 = +[NSString stringWithFormat:@"NSXPCInterface: Unable to get extended method signature from Protocol data (%s / %s). Use of clang is required for NSXPCInterface.", Name, sel_getName((SEL)key)];
          goto LABEL_21;
        }
        return 0;
      }
      BOOL v12 = 0;
    }
    if (!isMethodFromNSObjectProtocol(v10, v11, v12))
    {
      uint64_t v13 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:MethodTypeEncoding];
      if (v13)
      {
        uint64_t v14 = (void *)v13;
        Value = malloc_type_malloc(0x30uLL, 0x10800402B8B78F1uLL);
        void *Value = 0;
        Value[1] = 0;
        Value[2] = 0;
        Value[3] = 1;
        Value[4] = 0;
        *((_DWORD *)Value + 10) = -1;
        *((_WORD *)Value + 22) = 0;
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), key, Value);
        v15 = protocol_getName(*(Protocol **)(a1 + 8));
        setProtocolMetadataWithSignature((const char *)key, (uint64_t)v15, v14, (uint64_t)Value, 0);
        return Value;
      }
      uint64_t v17 = protocol_getName(*(Protocol **)(a1 + 8));
      uint64_t v18 = +[NSString stringWithFormat:@"NSXPCInterface: Unable to get method signature from Protocol data (%s / %s)", v17, sel_getName((SEL)key)];
LABEL_21:
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v18 userInfo:0]);
    }
    return 0;
  }
  return Value;
}

- (id)_methodSignatureForRemoteSelector:(SEL)a3
{
  if (!self->_protocol)
  {
    BOOL v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: No protocol has been set on interface", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v8);
  }
  if (!a3) {
    return 0;
  }
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  knownSelectors = self->_knownSelectors;
  if (!knownSelectors)
  {
    knownSelectors = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], 0, &kNSXPCSelKeyCallbacks, MEMORY[0x1E4F1D540]);
    self->_knownSelectors = knownSelectors;
  }
  Value = (void *)CFDictionaryGetValue(knownSelectors, a3);
  os_unfair_lock_unlock(&self->_knownSelectorsLock);
  if (Value) {
    return Value;
  }

  return [(NSXPCInterface *)self _generateAndCacheMethodSignatureForRemoteSelector:a3];
}

- (id)_generateAndCacheMethodSignatureForRemoteSelector:(SEL)a3
{
  uint64_t v5 = methodSignatureForSelectorInProtocol(a3, self->_protocol);
  if (!v5) {
    return 0;
  }
  v6 = (const void *)v5;
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  knownSelectors = self->_knownSelectors;
  if (!knownSelectors)
  {
    knownSelectors = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], 0, &kNSXPCSelKeyCallbacks, MEMORY[0x1E4F1D540]);
    self->_knownSelectors = knownSelectors;
  }
  Value = (void *)CFDictionaryGetValue(knownSelectors, a3);
  if (!Value)
  {
    CFDictionaryRef Mutable = self->_knownSelectors;
    if (!Mutable)
    {
      CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], 0, &kNSXPCSelKeyCallbacks, MEMORY[0x1E4F1D540]);
      self->_knownSelectors = Mutable;
    }
    CFDictionarySetValue(Mutable, a3, v6);
    Value = (void *)v6;
  }
  os_unfair_lock_unlock(&self->_knownSelectorsLock);
  return Value;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  methodInfo = self->_methodInfo;
  if (methodInfo)
  {
    CFDictionaryApplyFunction(methodInfo, (CFDictionaryApplierFunction)_NSXPCInterfaceMethodInfoDealloc, 0);
    CFRelease(self->_methodInfo);
  }
  knownSelectors = self->_knownSelectors;
  if (knownSelectors) {
    CFRelease(knownSelectors);
  }
  v5.receiver = self;
  v5.super_class = (Class)NSXPCInterface;
  [(NSXPCInterface *)&v5 dealloc];
}

- (id)_methodSignatureForReplyBlockOfSelector:(SEL)a3
{
  if (!self->_protocol) {
    return 0;
  }
  p_knownSelectorsLock = &self->_knownSelectorsLock;
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  uint64_t v6 = (id *)-[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)a3, 1);
  if (v6) {
    id v7 = *v6;
  }
  else {
    id v7 = 0;
  }
  os_unfair_lock_unlock(p_knownSelectorsLock);
  return v7;
}

- (BOOL)_hasProxiesInReplyBlockArgumentsOfSelector:(SEL)a3
{
  if (!self->_protocol)
  {
    Class v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: No protocol has been set on interface", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
  }
  p_knownSelectorsLock = &self->_knownSelectorsLock;
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  uint64_t v6 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)a3, 1);
  if (v6) {
    BOOL v7 = *((unsigned char *)v6 + 45) != 0;
  }
  else {
    BOOL v7 = 0;
  }
  os_unfair_lock_unlock(p_knownSelectorsLock);
  return v7;
}

- (Class)_returnClassForSelector:(SEL)a3
{
  p_knownSelectorsLock = &self->_knownSelectorsLock;
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  uint64_t v6 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)a3, 1);
  if (v6) {
    BOOL v7 = (objc_class *)v6[4];
  }
  else {
    BOOL v7 = 0;
  }
  os_unfair_lock_unlock(p_knownSelectorsLock);
  return v7;
}

- (void)setClass:(Class)a3 forSelector:(SEL)a4 argumentIndex:(unint64_t)a5 ofReply:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithObject:a3];

  [(NSXPCInterface *)self setClasses:v10 forSelector:a4 argumentIndex:a5 ofReply:v6];
}

- (Class)_customSubclass
{
  p_knownSelectorsLock = &self->_knownSelectorsLock;
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  xpcDOSubclass = self->_xpcDOSubclass;
  os_unfair_lock_unlock(p_knownSelectorsLock);
  if (xpcDOSubclass) {
    return xpcDOSubclass;
  }

  return (Class)objc_opt_class();
}

- (void)setInterface:(NSXPCInterface *)ifc forSelector:(SEL)sel argumentIndex:(NSUInteger)arg ofReply:(BOOL)ofReply
{
  protocol = self->_protocol;
  if (!protocol)
  {
    v48 = _NSMethodExceptionProem((objc_class *)self, a2);
    v31 = @"%@: Protocol must be set before calling this method.";
LABEL_37:
    v34 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v31, v48, v49, v50);
LABEL_38:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v34 userInfo:0]);
  }
  if (!sel)
  {
    v48 = _NSMethodExceptionProem((objc_class *)self, a2);
    v31 = @"%@: Selector argument must be non-NULL.";
    goto LABEL_37;
  }
  BOOL v10 = ofReply;
  if (!selectorInProtocol(sel, protocol))
  {
    v32 = _NSMethodExceptionProem((objc_class *)self, a2);
    Name = sel_getName(sel);
    v34 = +[NSString stringWithFormat:@"%@: Selector '%s' is not in protocol '%s', or is not an instance method.", v32, Name, protocol_getName(protocol)];
    goto LABEL_38;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v48 = _NSMethodExceptionProem((objc_class *)self, a2);
    v31 = @"%@: Invalid value for interface argument.";
    goto LABEL_37;
  }
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  uint64_t v13 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)sel, 1);
  uint64_t v14 = v13;
  if (!v13) {
    goto LABEL_30;
  }
  uint64_t v15 = 2;
  if (v10) {
    uint64_t v15 = 1;
  }
  id v16 = (id)[(id)v13[v15] mutableCopy];
  uint64_t v17 = v16;
  if (!v16)
  {
LABEL_30:
    v27 = _NSMethodExceptionProem((objc_class *)self, a2);
    v28 = sel_getName(sel);
    v29 = @"selector";
    if (v10) {
      v29 = @"reply block of selector";
    }
    v30 = +[NSString stringWithFormat:@"%@: No arguments were detected for %@ %s", v27, v29, v28];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v30 userInfo:0]);
  }
  if ([v16 count] <= arg)
  {
    long long v35 = _NSMethodExceptionProem((objc_class *)self, a2);
    long long v36 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Argument index %ld is out of range for selector (%s). The maximum index is %ld.", v35, arg, sel_getName(sel), objc_msgSend(v17, "count") - 1), 0 reason userInfo];
    objc_exception_throw(v36);
  }
  if (v10)
  {
    id v18 = (id)*v14;
    if (!*v14)
    {
      v41 = _NSMethodExceptionProem((objc_class *)self, a2);
      v42 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: No reply block signature has been set for selector %s", v41, sel_getName(sel)), 0 reason userInfo];
      objc_exception_throw(v42);
    }
    if ((unint64_t)[(id)*v14 numberOfArguments] < 2
      || arg + 1 >= [v18 numberOfArguments])
    {
      long long v37 = _NSMethodExceptionProem((objc_class *)self, a2);
      long long v38 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Argument '%ld' of selector '%s' does not exist.", v37, arg, sel_getName(sel)), 0 reason userInfo];
      objc_exception_throw(v38);
    }
    id v19 = (_WORD *)objc_msgSend(v18, "_argInfo:");
    __int16 v20 = v19[17];
    if ((v20 & 0x80) != 0) {
      __int16 v20 = *(_WORD *)(*(void *)v19 + 34);
    }
    if ((v20 & 0x2000) == 0)
    {
      v21 = _NSMethodExceptionProem((objc_class *)self, a2);
      v22 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Argument '%ld' of selector '%s' is not an object.", v21, arg, sel_getName(sel)), 0 reason userInfo];
      objc_exception_throw(v22);
    }
  }
  else
  {
    v23 = (void *)methodSignatureForSelectorInProtocol(sel, self->_protocol);
    v24 = v23;
    if (!v23)
    {
      v43 = _NSMethodExceptionProem((objc_class *)self, a2);
      v44 = sel_getName(sel);
      v45 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Selector '%s' not found in protocol '%s'.", v43, v44, protocol_getName(self->_protocol)), 0 reason userInfo];
      objc_exception_throw(v45);
    }
    if ((unint64_t)[v23 numberOfArguments] < 3
      || arg + 2 >= [v24 numberOfArguments])
    {
      uint64_t v39 = _NSMethodExceptionProem((objc_class *)self, a2);
      v40 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Argument '%ld' of selector '%s' does not exist.", v39, arg, sel_getName(sel)), 0 reason userInfo];
      objc_exception_throw(v40);
    }
    v25 = (_WORD *)objc_msgSend(v24, "_argInfo:");
    __int16 v26 = v25[17];
    if ((v26 & 0x80) != 0) {
      __int16 v26 = *(_WORD *)(*(void *)v25 + 34);
    }
    if ((v26 & 0x2000) == 0)
    {
      v46 = _NSMethodExceptionProem((objc_class *)self, a2);
      v47 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Argument '%ld' of selector '%s' is not an object.", v46, arg, sel_getName(sel)), 0 reason userInfo];
      objc_exception_throw(v47);
    }
  }
  [v17 replaceObjectAtIndex:arg withObject:ifc];
  if (v10)
  {

    v14[1] = [v17 copy];
    *((unsigned char *)v14 + 45) = 1;
  }
  else
  {

    v14[2] = [v17 copy];
    *((unsigned char *)v14 + 44) = 1;
  }

  os_unfair_lock_unlock(&self->_knownSelectorsLock);
}

- (id)replyBlockSignatureForSelector:(SEL)a3
{
  protocol = self->_protocol;
  if (!protocol)
  {
    id v16 = _NSMethodExceptionProem((objc_class *)self, a2);
    uint64_t v13 = @"%@: Protocol must be set before calling this method.";
    goto LABEL_12;
  }
  if (!a3)
  {
    id v16 = _NSMethodExceptionProem((objc_class *)self, a2);
    uint64_t v13 = @"%@: Selector argument must be non-NULL.";
    goto LABEL_12;
  }
  if (!selectorInProtocol(a3, protocol))
  {
    uint64_t v14 = _NSMethodExceptionProem((objc_class *)self, a2);
    Name = sel_getName(a3);
    id v18 = protocol_getName(protocol);
    id v16 = v14;
    uint64_t v13 = @"%@: Selector '%s' is not in protocol '%s', or is not an instance method.";
LABEL_12:
    uint64_t v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v16, Name, v18);
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v15 userInfo:0]);
  }
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  BOOL v7 = (id *)-[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)a3, 1);
  BOOL v8 = v7;
  if (v7)
  {
    Class v9 = (void *)[*v7 _typeString];
    if ((v8[5] & 0x80000000) != 0)
    {
      BOOL v10 = _NSMethodExceptionProem((objc_class *)self, a2);
      uint64_t v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Selector %s has no reply block.", v10, sel_getName(a3)), 0 reason userInfo];
      objc_exception_throw(v11);
    }
  }
  else
  {
    Class v9 = 0;
  }
  os_unfair_lock_unlock(&self->_knownSelectorsLock);
  return v9;
}

- (unint64_t)_respondsToRemoteSelector:(SEL)a3
{
  p_knownSelectorsLock = &self->_knownSelectorsLock;
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  BOOL v6 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)a3, 1);
  if (v6)
  {
    unint64_t v7 = v6[3];
    os_unfair_lock_unlock(p_knownSelectorsLock);
    if (v7) {
      return 2 * ([(NSXPCInterface *)self _remoteVersion] < v7);
    }
  }
  else
  {
    os_unfair_lock_unlock(p_knownSelectorsLock);
  }
  return 1;
}

- (unint64_t)_remoteVersion
{
  return self->_remoteVersion;
}

- (Class)classForSelector:(SEL)a3 argumentIndex:(unint64_t)a4 ofReply:(BOOL)a5
{
  objc_super v5 = [(NSXPCInterface *)self classesForSelector:a3 argumentIndex:a4 ofReply:a5];

  return (Class)[(NSSet *)v5 anyObject];
}

- (NSSet)classesForSelector:(SEL)sel argumentIndex:(NSUInteger)arg ofReply:(BOOL)ofReply
{
  protocol = self->_protocol;
  if (!protocol)
  {
    v28 = _NSMethodExceptionProem((objc_class *)self, a2);
    v23 = @"%@: Protocol must be set before calling this method.";
    goto LABEL_25;
  }
  if (!sel)
  {
    v28 = _NSMethodExceptionProem((objc_class *)self, a2);
    v23 = @"%@: Selector argument must be non-NULL.";
    goto LABEL_25;
  }
  BOOL v9 = ofReply;
  if (!selectorInProtocol(sel, protocol))
  {
    v24 = _NSMethodExceptionProem((objc_class *)self, a2);
    Name = sel_getName(sel);
    v30 = protocol_getName(protocol);
    v28 = v24;
    v23 = @"%@: Selector '%s' is not in protocol '%s', or is not an instance method.";
LABEL_25:
    v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v28, Name, v30);
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v25 userInfo:0]);
  }
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  uint64_t v11 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)sel, 1);
  if (!v11) {
    goto LABEL_19;
  }
  uint64_t v12 = 2;
  if (v9) {
    uint64_t v12 = 1;
  }
  uint64_t v13 = (void *)v11[v12];
  if (!v13)
  {
LABEL_19:
    id v19 = _NSMethodExceptionProem((objc_class *)self, a2);
    __int16 v20 = sel_getName(sel);
    v21 = @"selector";
    if (v9) {
      v21 = @"reply block of selector";
    }
    v22 = +[NSString stringWithFormat:@"%@: No arguments were detected for %@ %s", v19, v21, v20];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v22 userInfo:0]);
  }
  if ([(id)v11[v12] count] <= arg)
  {
    __int16 v26 = _NSMethodExceptionProem((objc_class *)self, a2);
    v27 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Argument index  '%ld' is out of range for selector %s. The maximum index is %ld.", v26, arg, sel_getName(sel), objc_msgSend(v13, "count") - 1), 0 reason userInfo];
    objc_exception_throw(v27);
  }
  uint64_t v14 = (NSSet *)(id)[v13 objectAtIndex:arg];
  os_unfair_lock_unlock(&self->_knownSelectorsLock);
  if (v14 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    Class = object_getClass(v14);
    if (class_isMetaClass(Class))
    {
      id v18 = (void *)MEMORY[0x1E4F1CAD0];
      return (NSSet *)[v18 setWithObject:v14];
    }
    else
    {
      return v14;
    }
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
    return (NSSet *)[v15 set];
  }
}

- (NSXPCInterface)interfaceForSelector:(SEL)sel argumentIndex:(NSUInteger)arg ofReply:(BOOL)ofReply
{
  protocol = self->_protocol;
  if (!protocol)
  {
    v25 = _NSMethodExceptionProem((objc_class *)self, a2);
    id v16 = @"%@: Protocol must be set before calling this method.";
    goto LABEL_16;
  }
  if (!sel)
  {
    v25 = _NSMethodExceptionProem((objc_class *)self, a2);
    id v16 = @"%@: Selector argument must be non-NULL.";
    goto LABEL_16;
  }
  BOOL v9 = ofReply;
  if (!selectorInProtocol(sel, protocol))
  {
    uint64_t v17 = _NSMethodExceptionProem((objc_class *)self, a2);
    Name = sel_getName(sel);
    v27 = protocol_getName(protocol);
    v25 = v17;
    id v16 = @"%@: Selector '%s' is not in protocol '%s', or is not an instance method.";
LABEL_16:
    id v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v25, Name, v27);
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v18 userInfo:0]);
  }
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  uint64_t v11 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)sel, 0);
  if (v11)
  {
    uint64_t v12 = 2;
    if (v9) {
      uint64_t v12 = 1;
    }
    uint64_t v13 = (void *)v11[v12];
    if (!v13)
    {
      id v19 = _NSMethodExceptionProem((objc_class *)self, a2);
      __int16 v20 = sel_getName(sel);
      v21 = @"selector";
      if (v9) {
        v21 = @"reply block of selector";
      }
      v22 = +[NSString stringWithFormat:@"%@: No arguments were detected for %@ %s", v19, v21, v20];
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v22 userInfo:0]);
    }
    if ([(id)v11[v12] count] <= arg)
    {
      v23 = _NSMethodExceptionProem((objc_class *)self, a2);
      v24 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Argument index %ld is out of range for selector (%s)", v23, arg, sel_getName(sel)), 0 reason userInfo];
      objc_exception_throw(v24);
    }
    uint64_t v14 = (NSXPCInterface *)(id)[v13 objectAtIndex:arg];
    os_unfair_lock_unlock(&self->_knownSelectorsLock);
    if (objc_opt_isKindOfClass()) {
      return v14;
    }
    else {
      return 0;
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_knownSelectorsLock);
    return 0;
  }
}

- (void)setXPCType:(xpc_type_t)type forSelector:(SEL)sel argumentIndex:(NSUInteger)arg ofReply:(BOOL)ofReply
{
  protocol = self->_protocol;
  if (!protocol)
  {
    v29 = _NSMethodExceptionProem((objc_class *)self, a2);
    v24 = @"%@: Protocol must be set before calling this method.";
    goto LABEL_23;
  }
  if (!sel)
  {
    v29 = _NSMethodExceptionProem((objc_class *)self, a2);
    v24 = @"%@: Selector argument must be non-NULL.";
    goto LABEL_23;
  }
  BOOL v10 = ofReply;
  if (!selectorInProtocol(sel, protocol))
  {
    v25 = _NSMethodExceptionProem((objc_class *)self, a2);
    Name = sel_getName(sel);
    v31 = protocol_getName(protocol);
    v29 = v25;
    v24 = @"%@: Selector '%s' is not in protocol '%s', or is not an instance method.";
LABEL_23:
    __int16 v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v24, v29, Name, v31);
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v26 userInfo:0]);
  }
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  uint64_t v13 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)sel, 1);
  uint64_t v14 = v13;
  if (!v13) {
    goto LABEL_17;
  }
  uint64_t v15 = 2;
  if (v10) {
    uint64_t v15 = 1;
  }
  id v16 = (id)[(id)v13[v15] mutableCopy];
  uint64_t v17 = v16;
  if (!v16)
  {
LABEL_17:
    __int16 v20 = _NSMethodExceptionProem((objc_class *)self, a2);
    v21 = sel_getName(sel);
    v22 = @"selector";
    if (v10) {
      v22 = @"reply block of selector";
    }
    v23 = +[NSString stringWithFormat:@"%@: No arguments were detected for %@ %s", v20, v22, v21];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v23 userInfo:0]);
  }
  if ([v16 count] <= arg)
  {
    v27 = _NSMethodExceptionProem((objc_class *)self, a2);
    v28 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Argument index  '%ld' is out of range for selector %s. The maximum index is %ld.", v27, arg, sel_getName(sel), objc_msgSend(v17, "count") - 1), 0 reason userInfo];
    objc_exception_throw(v28);
  }
  uint64_t v18 = objc_opt_new();
  id v19 = (void *)v18;
  if (v18) {
    *(void *)(v18 + 8) = type;
  }
  [v17 replaceObjectAtIndex:arg withObject:v18];

  if (v10)
  {

    v14[1] = [v17 copy];
  }
  else
  {

    v14[2] = [v17 copy];
  }

  os_unfair_lock_unlock(&self->_knownSelectorsLock);
}

- (id)debugDescription
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  protocol = self->_protocol;
  if (protocol) {
    Name = protocol_getName(protocol);
  }
  else {
    Name = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)NSXPCInterface;
  id v5 = [(NSXPCInterface *)&v10 debugDescription];
  BOOL v6 = "(none set)";
  if (Name) {
    BOOL v6 = Name;
  }
  unint64_t v7 = +[NSString stringWithFormat:@"%@\nProtocol: %s\n", v5, v6];
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  methodInfo = self->_methodInfo;
  if (methodInfo) {
    CFDictionaryApplyFunction(methodInfo, (CFDictionaryApplierFunction)_NSXPCInterfaceDebugDescriptionHelper, v7);
  }
  os_unfair_lock_unlock(&self->_knownSelectorsLock);
  return v7;
}

+ (id)signatureForBlock:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = _Block_signature(a3);

  return +[NSString stringWithUTF8String:v4];
}

- (xpc_type_t)XPCTypeForSelector:(SEL)sel argumentIndex:(NSUInteger)arg ofReply:(BOOL)ofReply
{
  protocol = self->_protocol;
  if (!protocol)
  {
    __int16 v26 = _NSMethodExceptionProem((objc_class *)self, a2);
    uint64_t v17 = @"%@: Protocol must be set before calling this method.";
    goto LABEL_17;
  }
  if (!sel)
  {
    __int16 v26 = _NSMethodExceptionProem((objc_class *)self, a2);
    uint64_t v17 = @"%@: Selector argument must be non-NULL.";
    goto LABEL_17;
  }
  BOOL v9 = ofReply;
  if (!selectorInProtocol(sel, protocol))
  {
    uint64_t v18 = _NSMethodExceptionProem((objc_class *)self, a2);
    Name = sel_getName(sel);
    v28 = protocol_getName(protocol);
    __int16 v26 = v18;
    uint64_t v17 = @"%@: Selector '%s' is not in protocol '%s', or is not an instance method.";
LABEL_17:
    id v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v26, Name, v28);
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v19 userInfo:0]);
  }
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  uint64_t v11 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)sel, 0);
  if (v11)
  {
    uint64_t v12 = 2;
    if (v9) {
      uint64_t v12 = 1;
    }
    uint64_t v13 = (void *)v11[v12];
    if (!v13)
    {
      __int16 v20 = _NSMethodExceptionProem((objc_class *)self, a2);
      v21 = sel_getName(sel);
      v22 = @"selector";
      if (v9) {
        v22 = @"reply block of selector";
      }
      v23 = +[NSString stringWithFormat:@"%@: No arguments were detected for %@ %s", v20, v22, v21];
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v23 userInfo:0]);
    }
    if ([(id)v11[v12] count] <= arg)
    {
      v24 = _NSMethodExceptionProem((objc_class *)self, a2);
      v25 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Argument index  '%ld' is out of range for selector %s. The maximum index is %ld.", v24, arg, sel_getName(sel), objc_msgSend(v13, "count") - 1), 0 reason userInfo];
      objc_exception_throw(v25);
    }
    id v14 = (id)[v13 objectAtIndex:arg];
    os_unfair_lock_unlock(&self->_knownSelectorsLock);
    char isKindOfClass = objc_opt_isKindOfClass();
    xpc_type_t result = 0;
    if (isKindOfClass)
    {
      if (v14) {
        return (xpc_type_t)*((void *)v14 + 1);
      }
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_knownSelectorsLock);
    return 0;
  }
  return result;
}

- (void)setVersion:(unint64_t)a3 forSelector:(SEL)a4
{
  protocol = self->_protocol;
  if (!protocol)
  {
    objc_super v10 = +[NSString stringWithFormat:@"%@: Protocol must be set before calling this method.", _NSMethodExceptionProem((objc_class *)self, a2), v13, v14];
    goto LABEL_12;
  }
  if (!a4)
  {
    objc_super v10 = +[NSString stringWithFormat:@"%@: Selector argument must be non-NULL.", _NSMethodExceptionProem((objc_class *)self, a2), v13, v14];
    goto LABEL_12;
  }
  if (!selectorInProtocol(a4, protocol))
  {
    uint64_t v11 = _NSMethodExceptionProem((objc_class *)self, a2);
    Name = sel_getName(a4);
    objc_super v10 = +[NSString stringWithFormat:@"%@: Selector '%s' is not in protocol '%s', or is not an instance method.", v11, Name, protocol_getName(protocol)];
LABEL_12:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v10 userInfo:0]);
  }
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  BOOL v9 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)a4, 1);
  if (v9) {
    v9[3] = a3;
  }

  os_unfair_lock_unlock(&self->_knownSelectorsLock);
}

- (unint64_t)versionForSelector:(SEL)a3
{
  protocol = self->_protocol;
  if (!protocol)
  {
    uint64_t v13 = _NSMethodExceptionProem((objc_class *)self, a2);
    objc_super v10 = @"%@: Protocol must be set before calling this method.";
    goto LABEL_11;
  }
  if (!a3)
  {
    uint64_t v13 = _NSMethodExceptionProem((objc_class *)self, a2);
    objc_super v10 = @"%@: Selector argument must be non-NULL.";
    goto LABEL_11;
  }
  if (!selectorInProtocol(a3, protocol))
  {
    uint64_t v11 = _NSMethodExceptionProem((objc_class *)self, a2);
    Name = sel_getName(a3);
    uint64_t v15 = protocol_getName(protocol);
    uint64_t v13 = v11;
    objc_super v10 = @"%@: Selector '%s' is not in protocol '%s', or is not an instance method.";
LABEL_11:
    uint64_t v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v13, Name, v15);
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v12 userInfo:0]);
  }
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  unint64_t v7 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)a3, 0);
  if (v7) {
    unint64_t v8 = v7[3];
  }
  else {
    unint64_t v8 = 1;
  }
  os_unfair_lock_unlock(&self->_knownSelectorsLock);
  return v8;
}

- (unint64_t)version
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v6[0] = 1;
  p_knownSelectorsLock = &self->_knownSelectorsLock;
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  methodInfo = self->_methodInfo;
  if (methodInfo) {
    CFDictionaryApplyFunction(methodInfo, (CFDictionaryApplierFunction)_maxVersionFinder, v6);
  }
  os_unfair_lock_unlock(p_knownSelectorsLock);
  return v6[0];
}

- (void)set_remoteVersion:(unint64_t)a3
{
  self->_remoteVersion = a3;
}

- (BOOL)_hasProxiesInArgumentsOfSelector:(SEL)a3
{
  if (!self->_protocol)
  {
    BOOL v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: No protocol has been set on interface", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
  }
  p_knownSelectorsLock = &self->_knownSelectorsLock;
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  BOOL v6 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)a3, 1);
  if (v6) {
    BOOL v7 = *((unsigned char *)v6 + 44) != 0;
  }
  else {
    BOOL v7 = 0;
  }
  os_unfair_lock_unlock(p_knownSelectorsLock);
  return v7;
}

@end