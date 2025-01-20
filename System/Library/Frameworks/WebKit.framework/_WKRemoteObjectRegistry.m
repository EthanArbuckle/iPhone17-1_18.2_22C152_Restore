@interface _WKRemoteObjectRegistry
- (id).cxx_construct;
- (id)_initWithWebPage:(NakedRef<WebKit::WebPage>)a3;
- (id)_initWithWebPageProxy:(NakedRef<WebKit::WebPageProxy>)a3;
- (id)remoteObjectProxyWithInterface:(id)a3;
- (uint64_t)_invokeMethod:()WTF::DestructionThread;
- (uint64_t)_invokeMethod:(uint64_t)a1;
- (uint64_t)_invokeMethod:(uint64_t)a3;
- (unsigned)_invokeMethod:()WTF::DestructionThread;
- (void)_callReplyWithID:(unint64_t)a3 blockInvocation:(const void *)a4;
- (void)_invalidate;
- (void)_invokeMethod:(const void *)a3;
- (void)_invokeMethod:(void *)a1;
- (void)_releaseReplyWithID:(unint64_t)a3;
- (void)_sendInvocation:(id)a3 interface:(id)a4;
- (void)registerExportedObject:(id)a3 interface:(id)a4;
- (void)remoteObjectRegistry;
- (void)unregisterExportedObject:(id)a3 interface:(id)a4;
@end

@implementation _WKRemoteObjectRegistry

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (id)remoteObjectProxyWithInterface:(id)a3
{
  p_remoteObjectProxies = &self->_remoteObjectProxies;
  m_ptr = self->_remoteObjectProxies.m_ptr;
  if (!m_ptr)
  {
    WTF::RetainPtr<NSURLSession>::operator=((const void **)&p_remoteObjectProxies->m_ptr, (CFTypeRef)[MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable]);
    m_ptr = p_remoteObjectProxies->m_ptr;
  }
  CFTypeRef v7 = (CFTypeRef)objc_msgSend(m_ptr, "objectForKey:", objc_msgSend(a3, "identifier"));
  if (!v7)
  {
    v9 = (const void *)objc_msgSend((id)objc_msgSend(a3, "identifier"), "copy");
    id v10 = [[WKRemoteObject alloc] _initWithObjectRegistry:self interface:a3];
    [p_remoteObjectProxies->m_ptr setObject:v10 forKey:v9];
    CFTypeRef v7 = (id)CFMakeCollectable(v10);
    if (v9) {
      CFRelease(v9);
    }
  }
  return (id)v7;
}

- (void)registerExportedObject:(id)a3 interface:(id)a4
{
  MEMORY[0x19972EAD0](&v35, [a4 identifier]);
  if (a3) {
    CFRetain(a3);
  }
  if (a4) {
    CFRetain(a4);
  }
  cf = (WTF::StringImpl *)a3;
  v34 = (WTF::StringImpl *)a4;
  m_table = self->_exportedObjects.m_impl.var0.m_table;
  p_exportedObjects = (uint64_t *)&self->_exportedObjects;
  uint64_t v10 = (uint64_t)m_table;
  if (m_table
    || (WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,std::pair<WTF::RetainPtr<objc_object *>,WTF::RetainPtr<_WKRemoteObjectInterface>>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,std::pair<WTF::RetainPtr<objc_object *>,WTF::RetainPtr<_WKRemoteObjectInterface>>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,std::pair<WTF::RetainPtr<objc_object *>,WTF::RetainPtr<_WKRemoteObjectInterface>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<std::pair<WTF::RetainPtr<objc_object *>,WTF::RetainPtr<_WKRemoteObjectInterface>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::expand(p_exportedObjects),
        (uint64_t v10 = *p_exportedObjects) != 0))
  {
    int v12 = *(_DWORD *)(v10 - 8);
  }
  else
  {
    int v12 = 0;
  }
  unsigned int v13 = *((_DWORD *)v35 + 4);
  if (v13 >= 0x100) {
    unsigned int v14 = v13 >> 8;
  }
  else {
    unsigned int v14 = WTF::StringImpl::hashSlowCase(v35);
  }
  v15 = 0;
  for (int i = 1; ; ++i)
  {
    int v17 = v14 & v12;
    v18 = (WTF::StringImpl **)(v10 + 24 * (v14 & v12));
    v19 = *v18;
    if (!*v18) {
      break;
    }
    if (v19 != (WTF *)-1)
    {
      v18 = v15;
      if (WTF::equal(v19, v35, v8)) {
        goto LABEL_29;
      }
    }
    unsigned int v14 = i + v17;
    v15 = v18;
  }
  if (v15)
  {
    *v15 = 0;
    v15[1] = 0;
    v15[2] = 0;
    --*(_DWORD *)(*p_exportedObjects - 16);
    v18 = v15;
  }
  v20 = v35;
  v35 = 0;
  v21 = *v18;
  *v18 = v20;
  if (v21)
  {
    if (*(_DWORD *)v21 == 2) {
      WTF::StringImpl::destroy(v21, v7);
    }
    else {
      *(_DWORD *)v21 -= 2;
    }
  }
  v22 = cf;
  v23 = v34;
  cf = 0;
  v34 = 0;
  v24 = v18[1];
  v18[1] = v22;
  if (v24) {
    CFRelease(v24);
  }
  v25 = v18[2];
  v18[2] = v23;
  if (v25) {
    CFRelease(v25);
  }
  uint64_t v26 = *p_exportedObjects;
  if (*p_exportedObjects) {
    int v27 = *(_DWORD *)(v26 - 12) + 1;
  }
  else {
    int v27 = 1;
  }
  *(_DWORD *)(v26 - 12) = v27;
  uint64_t v28 = *p_exportedObjects;
  if (*p_exportedObjects) {
    int v29 = *(_DWORD *)(v28 - 12);
  }
  else {
    int v29 = 0;
  }
  uint64_t v30 = (*(_DWORD *)(v28 - 16) + v29);
  unint64_t v31 = *(unsigned int *)(v28 - 4);
  if (v31 > 0x400)
  {
    if (v31 > 2 * v30) {
      goto LABEL_29;
    }
  }
  else if (3 * v31 > 4 * v30)
  {
    goto LABEL_29;
  }
  WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,std::pair<WTF::RetainPtr<objc_object *>,WTF::RetainPtr<_WKRemoteObjectInterface>>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,std::pair<WTF::RetainPtr<objc_object *>,WTF::RetainPtr<_WKRemoteObjectInterface>>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,std::pair<WTF::RetainPtr<objc_object *>,WTF::RetainPtr<_WKRemoteObjectInterface>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<std::pair<WTF::RetainPtr<objc_object *>,WTF::RetainPtr<_WKRemoteObjectInterface>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::expand(p_exportedObjects);
LABEL_29:
  if (v34) {
    CFRelease(v34);
  }
  if (cf) {
    CFRelease(cf);
  }
  v32 = v35;
  v35 = 0;
  if (v32)
  {
    if (*(_DWORD *)v32 == 2) {
      WTF::StringImpl::destroy(v32, v7);
    }
    else {
      *(_DWORD *)v32 -= 2;
    }
  }
}

- (id)_initWithWebPage:(NakedRef<WebKit::WebPage>)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_WKRemoteObjectRegistry;
  v4 = [(_WKRemoteObjectRegistry *)&v8 init];
  v9 = v4;
  if (v4)
  {
    std::make_unique[abi:sn180100]<WebKit::WebRemoteObjectRegistry,_WKRemoteObjectRegistry *&,WebKit::WebPage &>((WebKit::WebRemoteObjectRegistry **)&v7, &v9, (WebKit::WebPage *)a3.var0);
    value = v4->_remoteObjectRegistry.__ptr_.__value_;
    v4->_remoteObjectRegistry.__ptr_.__value_ = v7;
    if (value) {
      (*(void (**)(RemoteObjectRegistry *))(*(void *)value + 8))(value);
    }
  }
  return v4;
}

- (void)remoteObjectRegistry
{
  return self->_remoteObjectRegistry.__ptr_.__value_;
}

- (id)_initWithWebPageProxy:(NakedRef<WebKit::WebPageProxy>)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_WKRemoteObjectRegistry;
  v4 = [(_WKRemoteObjectRegistry *)&v9 init];
  if (v4)
  {
    v5 = (WebKit::RemoteObjectRegistry *)WTF::fastMalloc((WTF *)0x28);
    *(void *)WebKit::RemoteObjectRegistry::RemoteObjectRegistry(v5, v4) = &unk_1EE9E2A48;
    WTF::WeakPtrFactory<IPC::MessageReceiver,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)a3.var0 + 6, (uint64_t)a3.var0 + 16);
    v6 = (atomic_uint *)*((void *)a3.var0 + 3);
    atomic_fetch_add(v6, 1u);
    *((void *)v5 + 4) = v6;
    value = v4->_remoteObjectRegistry.__ptr_.__value_;
    v4->_remoteObjectRegistry.__ptr_.__value_ = (RemoteObjectRegistry *)v5;
    if (value) {
      (*(void (**)(RemoteObjectRegistry *))(*(void *)value + 8))(value);
    }
  }
  return v4;
}

- (void)unregisterExportedObject:(id)a3 interface:(id)a4
{
  MEMORY[0x19972EAD0](&v26, objc_msgSend(a4, "identifier", a3));
  m_tableForLLDB = self->_exportedObjects.m_impl.var0.m_tableForLLDB;
  p_exportedObjects = (uint64_t *)&self->_exportedObjects;
  objc_super v8 = m_tableForLLDB;
  if (m_tableForLLDB)
  {
    int v10 = *(v8 - 2);
    unsigned int v11 = *((_DWORD *)v26 + 4);
    if (v11 >= 0x100) {
      unsigned int v12 = v11 >> 8;
    }
    else {
      unsigned int v12 = WTF::StringImpl::hashSlowCase(v26);
    }
    for (i = 0; ; unsigned int v12 = i + v14)
    {
      int v14 = v12 & v10;
      uint64_t v15 = (uint64_t)&v8[6 * (v12 & v10)];
      v16 = *(WTF **)v15;
      if (*(void *)v15 != -1)
      {
        if (!v16)
        {
          uint64_t v17 = *p_exportedObjects;
          if (!*p_exportedObjects) {
            goto LABEL_25;
          }
          uint64_t v15 = v17 + 24 * *(unsigned int *)(v17 - 4);
          goto LABEL_13;
        }
        if (WTF::equal(v16, v26, v6)) {
          break;
        }
      }
      ++i;
    }
    uint64_t v17 = *p_exportedObjects;
    if (!*p_exportedObjects) {
      goto LABEL_14;
    }
LABEL_13:
    v17 += 24 * *(unsigned int *)(v17 - 4);
    if (v17 == v15) {
      goto LABEL_25;
    }
LABEL_14:
    if (v17 != v15)
    {
      WTF::HashTraits<WTF::String>::customDeleteBucket((WTF::StringImpl **)v15, v5);
      v18 = *(const void **)(v15 + 16);
      *(void *)(v15 + 16) = 0;
      if (v18) {
        CFRelease(v18);
      }
      v19 = *(const void **)(v15 + 8);
      *(void *)(v15 + 8) = 0;
      if (v19) {
        CFRelease(v19);
      }
      ++*(_DWORD *)(*p_exportedObjects - 16);
      uint64_t v20 = *p_exportedObjects;
      if (*p_exportedObjects) {
        int v21 = *(_DWORD *)(v20 - 12) - 1;
      }
      else {
        int v21 = -1;
      }
      *(_DWORD *)(v20 - 12) = v21;
      uint64_t v22 = *p_exportedObjects;
      if (*p_exportedObjects)
      {
        unsigned int v23 = 6 * *(_DWORD *)(v22 - 12);
        unsigned int v24 = *(_DWORD *)(v22 - 4);
        if (v23 < v24 && v24 >= 9) {
          WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,std::pair<WTF::RetainPtr<objc_object *>,WTF::RetainPtr<_WKRemoteObjectInterface>>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,std::pair<WTF::RetainPtr<objc_object *>,WTF::RetainPtr<_WKRemoteObjectInterface>>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,std::pair<WTF::RetainPtr<objc_object *>,WTF::RetainPtr<_WKRemoteObjectInterface>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<std::pair<WTF::RetainPtr<objc_object *>,WTF::RetainPtr<_WKRemoteObjectInterface>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::rehash(p_exportedObjects, v24 >> 1);
        }
      }
    }
  }
LABEL_25:
  v25 = v26;
  uint64_t v26 = 0;
  if (v25)
  {
    if (*(_DWORD *)v25 == 2) {
      WTF::StringImpl::destroy(v25, v5);
    }
    else {
      *(_DWORD *)v25 -= 2;
    }
  }
}

- (void)_invalidate
{
  value = self->_remoteObjectRegistry.__ptr_.__value_;
  self->_remoteObjectRegistry.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void))(*(void *)value + 8))();
  }
}

- (void)_sendInvocation:(id)a3 interface:(id)a4
{
  v37 = 0;
  CFTypeRef v7 = (void *)[a3 methodSignature];
  uint64_t v8 = [v7 numberOfArguments];
  if (v8)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (!strcmp((const char *)[v7 getArgumentTypeAtIndex:i], "@?"))
      {
        uint64_t v21 = *MEMORY[0x1E4F1C3C8];
        if (v37) {
          objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", v21, @"Only one reply block is allowed per message send. (%s)", sel_getName((SEL)objc_msgSend(a3, "selector")));
        }
        aBlock = 0;
        [a3 getArgument:&aBlock atIndex:i];
        uint64_t v22 = aBlock;
        if (!aBlock)
        {
          objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", v21, @"A NULL reply block was passed into a message. (%s)", sel_getName((SEL)objc_msgSend(a3, "selector")));
          uint64_t v22 = aBlock;
        }
        unsigned int v23 = _Block_signature(v22);
        if (strcmp((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA38], "signatureWithObjCTypes:", v23), "methodReturnType"), "v"))
        {
          objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", v21, @"Return value of block argument must be 'void'. (%s)", sel_getName((SEL)objc_msgSend(a3, "selector")));
        }
        uint64_t v24 = ++generateReplyIdentifier(void)::identifier;
        WTF::String::String((WTF::String *)v31, v23);
        v25 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x10);
        *(void *)v25 = v24;
        uint64_t v26 = v31[0];
        v31[0] = 0;
        *((void *)v25 + 1) = v26;
        v32 = 0;
        int v27 = v37;
        v37 = v25;
        if (v27)
        {
          std::default_delete<WebKit::RemoteObjectInvocation::ReplyInfo>::operator()[abi:sn180100]((int)&v37, v27);
          int v27 = v32;
          v32 = 0;
          if (v27) {
            std::default_delete<WebKit::RemoteObjectInvocation::ReplyInfo>::operator()[abi:sn180100]((int)&v32, v27);
          }
        }
        uint64_t v28 = v31[0];
        v31[0] = 0;
        if (v28)
        {
          if (*(_DWORD *)v28 == 2) {
            WTF::StringImpl::destroy(v28, v27);
          }
          else {
            *(_DWORD *)v28 -= 2;
          }
        }
        uint64_t v35 = 0;
        [a3 setArgument:&v35 atIndex:i];
        int v29 = (uint64_t *)v37;
        uint64_t v30 = (objc_selector *)[a3 selector];
        PendingReply::PendingReply((PendingReply *)&v32, a4, v30, (objc_object *)aBlock);
        WTF::HashMap<unsigned long long,PendingReply,WTF::DefaultHash<unsigned long long>,WTF::HashTraits<unsigned long long>,WTF::HashTraits<PendingReply>,WTF::HashTableTraits>::add<PendingReply>((uint64_t)v31, (uint64_t *)&self->_pendingReplies, v29, (uint64_t)&v32);
        PendingReply::~PendingReply((PendingReply *)&v32);
      }
    }
  }
  int v10 = objc_alloc_init(WKRemoteObjectEncoder);
  [(WKRemoteObjectEncoder *)v10 encodeObject:a3 forKey:@"invocation"];
  value = self->_remoteObjectRegistry.__ptr_.__value_;
  if (value)
  {
    MEMORY[0x19972EAD0](v31, [a4 identifier]);
    uint64_t v12 = [(WKRemoteObjectEncoder *)v10 rootObjectDictionary];
    uint64_t v13 = v12;
    if (v12) {
      CFRetain(*(CFTypeRef *)(v12 + 8));
    }
    int v14 = v31[0];
    if (v31[0]) {
      *(_DWORD *)v31[0] += 2;
    }
    v32 = v14;
    uint64_t v33 = v13;
    uint64_t v15 = v37;
    v37 = 0;
    v34 = v15;
    (*(void (**)(RemoteObjectRegistry *, WTF::StringImpl **))(*(void *)value + 40))(value, &v32);
    v16 = v34;
    v34 = 0;
    if (v16) {
      std::default_delete<WebKit::RemoteObjectInvocation::ReplyInfo>::operator()[abi:sn180100]((int)&v34, v16);
    }
    uint64_t v17 = v33;
    uint64_t v33 = 0;
    if (v17) {
      CFRelease(*(CFTypeRef *)(v17 + 8));
    }
    v18 = v32;
    v32 = 0;
    if (v18)
    {
      if (*(_DWORD *)v18 == 2) {
        WTF::StringImpl::destroy(v18, v16);
      }
      else {
        *(_DWORD *)v18 -= 2;
      }
    }
    v19 = v31[0];
    v31[0] = 0;
    if (v19)
    {
      if (*(_DWORD *)v19 == 2) {
        WTF::StringImpl::destroy(v19, v16);
      }
      else {
        *(_DWORD *)v19 -= 2;
      }
    }
  }
  if (v10) {
    CFRelease(v10);
  }
  uint64_t v20 = v37;
  v37 = 0;
  if (v20) {
    std::default_delete<WebKit::RemoteObjectInvocation::ReplyInfo>::operator()[abi:sn180100]((int)&v37, v20);
  }
}

- (void)_invokeMethod:(const void *)a3
{
  uint64_t v5 = *((void *)a3 + 1);
  if (v5) {
    CFRetain(*(CFTypeRef *)(v5 + 8));
  }
  WTF::HashMap<WTF::String,std::pair<WTF::RetainPtr<objc_object *>,WTF::RetainPtr<_WKRemoteObjectInterface>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<std::pair<WTF::RetainPtr<objc_object *>,WTF::RetainPtr<_WKRemoteObjectInterface>>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<WTF::String,std::pair<WTF::RetainPtr<objc_object *>,WTF::RetainPtr<_WKRemoteObjectInterface>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<std::pair<WTF::RetainPtr<objc_object *>,WTF::RetainPtr<_WKRemoteObjectInterface>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::String>>,WTF::String>(&v26, (uint64_t)self->_exportedObjects.m_impl.var0.m_table, (WTF::StringImpl **)a3);
  v6 = (void *)v27;
  if (!v27)
  {
    if (*(void *)a3) {
      uint64_t v12 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v12 = &stru_1EEA10550;
    }
    NSLog(&cfstr_DidNotFindAReg.isa, v12);
    goto LABEL_12;
  }
  CFRetain(v27);
  CFTypeRef v7 = [[WKRemoteObjectDecoder alloc] initWithInterface:v6 rootObjectDictionary:v5 replyToSelector:0];
  uint64_t v8 = (void *)[(WKRemoteObjectDecoder *)v7 decodeObjectOfClass:objc_opt_class() forKey:@"invocation"];
  objc_super v9 = (void *)[v8 methodSignature];
  uint64_t v10 = [v9 numberOfArguments];
  if (v10)
  {
    uint64_t v11 = 0;
    while (strcmp((const char *)[v9 getArgumentTypeAtIndex:v11], "@?"))
    {
      if (v10 == ++v11) {
        goto LABEL_8;
      }
    }
    if (!*((void *)a3 + 2))
    {
      NSLog(&cfstr_InvokemethodEx.isa);
      goto LABEL_9;
    }
    uint64_t v13 = (void *)MEMORY[0x1E4F1CA38];
    WTF::String::utf8();
    if (v23[0]) {
      int v14 = (char *)v23[0] + 16;
    }
    else {
      int v14 = 0;
    }
    v16 = (WebKit *)objc_msgSend((id)objc_msgSend(v13, "signatureWithObjCTypes:", v14), "_typeString");
    uint64_t v17 = v23[0];
    v23[0] = 0;
    if (v17)
    {
      if (*(_DWORD *)v17 == 1) {
        WTF::fastFree(v17, v15);
      }
      else {
        --*(_DWORD *)v17;
      }
    }
    v19 = (NSString *)replyBlockSignature((Protocol *)[v6 protocol], (objc_selector *)objc_msgSend(v8, "selector"), v11);
    if (!v19)
    {
      NSLog(&cfstr_InvokemethodFa.isa);
      goto LABEL_9;
    }
    if (!WebKit::methodSignaturesAreCompatible(v16, v19, v18))
    {
      NSLog(&cfstr_InvokemethodFa_0.isa, v16, v19);
      goto LABEL_9;
    }
    if (self) {
      CFRetain(self);
    }
    uint64_t v20 = (WTF *)**((void **)a3 + 2);
    [(_WKRemoteObjectRegistry *)(uint64_t *)v23 _invokeMethod:(uint64_t)v20];
    uint64_t v21 = (atomic_uint *)v23[0];
    id v25 = 0;
    [(WebKit *)v16 UTF8String];
    v23[4] = (WTF *)MEMORY[0x1E4F143A8];
    v23[5] = (WTF *)3321888768;
    v23[6] = (WTF *)__41___WKRemoteObjectRegistry__invokeMethod___block_invoke;
    v23[7] = (WTF *)&__block_descriptor_64_e8_32c54_ZTSKZ41___WKRemoteObjectRegistry__invokeMethod__E3__1_e22_v16__0__NSInvocation_8l;
    v23[0] = (WTF *)v6;
    CFRetain(v6);
    v23[1] = (WTF *)self;
    if (self) {
      CFRetain(self);
    }
    v23[2] = v20;
    if (v21) {
      atomic_fetch_add(v21, 1u);
    }
    v23[3] = (WTF *)v21;
    -[_WKRemoteObjectRegistry _invokeMethod:]::$_1::$_1(v24, (uint64_t)v23);
    uint64_t v22 = (void *)__NSMakeSpecialForwardingCaptureBlock();
    -[_WKRemoteObjectRegistry _invokeMethod:]::$_1::~$_1((uint64_t)v23);
    id v25 = v22;
    [v8 setArgument:&v25 atIndex:v11];
    objc_setAssociatedObject(v8, (const void *)replyBlockKey, v25, (void *)0x301);

    -[_WKRemoteObjectRegistry _invokeMethod:]::$_1::~$_1((uint64_t)v24);
    if (v21) {
      WTF::ThreadSafeRefCounted<-[_WKRemoteObjectRegistry _invokeMethod:]::ReplyBlockCallChecker,(WTF::DestructionThread)2>::deref((unsigned int *)v21);
    }
    if (self) {
      CFRelease(self);
    }
  }
LABEL_8:
  [v8 setTarget:v26];
  [v8 invoke];
LABEL_9:
  if (v7) {
    CFRelease(v7);
  }
  CFRelease(v6);
LABEL_12:
  std::pair<WTF::RetainPtr<objc_object *>,WTF::RetainPtr<_WKRemoteObjectInterface>>::~pair((uint64_t)&v26);
  if (v5) {
    CFRelease(*(CFTypeRef *)(v5 + 8));
  }
}

- (uint64_t)_invokeMethod:(uint64_t)a3
{
  uint64_t result = WTF::fastMalloc((WTF *)0x20);
  uint64_t v7 = result;
  *(_DWORD *)uint64_t result = 1;
  *(void *)(result + 8) = a2;
  if (a2) {
    uint64_t result = (uint64_t)CFRetain(a2);
  }
  *(void *)(v7 + 16) = a3;
  *(unsigned char *)(v7 + 24) = 0;
  *a1 = v7;
  return result;
}

- (void)_invokeMethod:(void *)a1
{
  v4 = *(const void **)a2;
  *a1 = *(void *)a2;
  if (v4) {
    CFRetain(v4);
  }
  uint64_t v5 = *(const void **)(a2 + 8);
  a1[1] = v5;
  if (v5) {
    CFRetain(v5);
  }
  v6 = *(atomic_uint **)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  if (v6) {
    atomic_fetch_add(v6, 1u);
  }
  a1[3] = v6;
  return a1;
}

- (uint64_t)_invokeMethod:(uint64_t)a1
{
  v2 = *(unsigned int **)(a1 + 24);
  *(void *)(a1 + 24) = 0;
  if (v2) {
    WTF::ThreadSafeRefCounted<-[_WKRemoteObjectRegistry _invokeMethod:]::ReplyBlockCallChecker,(WTF::DestructionThread)2>::deref(v2);
  }
  v3 = *(const void **)(a1 + 8);
  *(void *)(a1 + 8) = 0;
  if (v3) {
    CFRelease(v3);
  }
  v4 = *(const void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    CFRelease(v4);
  }
  return a1;
}

- (void)_callReplyWithID:(unint64_t)a3 blockInvocation:(const void *)a4
{
  v4 = *(CFTypeRef **)a4;
  if (!*(void *)a4) {
    return;
  }
  CFRetain(v4[1]);
  if ((*((unsigned int (**)(CFTypeRef *))*v4 + 2))(v4) == 9)
  {
    m_table = (char *)self->_pendingReplies.m_impl.var0.m_table;
    p_pendingReplies = (uint64_t *)&self->_pendingReplies;
    uint64_t v7 = m_table;
    uint64_t v10 = WTF::HashTable<unsigned long long,WTF::KeyValuePair<unsigned long long,PendingReply>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<unsigned long long,PendingReply>>,WTF::DefaultHash<unsigned long long>,WTF::HashMap<unsigned long long,PendingReply,WTF::DefaultHash<unsigned long long>,WTF::HashTraits<unsigned long long>,WTF::HashTraits<PendingReply>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<unsigned long long>>::find<WTF::IdentityHashTranslator<WTF::HashMap<unsigned long long,PendingReply,WTF::DefaultHash<unsigned long long>,WTF::HashTraits<unsigned long long>,WTF::HashTraits<PendingReply>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<unsigned long long>>,unsigned long long>((uint64_t)m_table, a3);
    uint64_t v11 = v10;
    uint64_t v12 = m_table ? (uint64_t)&v7[32 * *((unsigned int *)v7 - 1)] : 0;
    if (v12 != v10)
    {
      uint64_t v13 = *(const void **)(v10 + 8);
      if (v13) {
        CFRetain(*(CFTypeRef *)(v10 + 8));
      }
      uint64_t v15 = *(void *)(v11 + 16);
      int v14 = *(const void **)(v11 + 24);
      if (v14) {
        CFRetain(*(CFTypeRef *)(v11 + 24));
      }
      if (*p_pendingReplies)
      {
        uint64_t v16 = *p_pendingReplies + 32 * *(unsigned int *)(*p_pendingReplies - 4);
        if (v16 == v11) {
          goto LABEL_18;
        }
      }
      else
      {
        if (!v11)
        {
LABEL_18:
          uint64_t v17 = [[WKRemoteObjectDecoder alloc] initWithInterface:v13 rootObjectDictionary:v4 replyToSelector:v15];
          v18 = (void *)[(WKRemoteObjectDecoder *)v17 decodeObjectOfClass:objc_opt_class() forKey:@"invocation"];
          [v18 setTarget:v14];
          [v18 invoke];
          if (v17) {
            CFRelease(v17);
          }
          if (v14) {
            CFRelease(v14);
          }
          if (v13) {
            CFRelease(v13);
          }
          goto LABEL_24;
        }
        uint64_t v16 = 0;
      }
      if (v16 != v11) {
        WTF::HashTable<unsigned long long,WTF::KeyValuePair<unsigned long long,PendingReply>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<unsigned long long,PendingReply>>,WTF::DefaultHash<unsigned long long>,WTF::HashMap<unsigned long long,PendingReply,WTF::DefaultHash<unsigned long long>,WTF::HashTraits<unsigned long long>,WTF::HashTraits<PendingReply>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<unsigned long long>>::remove(p_pendingReplies, (void *)v11);
      }
      goto LABEL_18;
    }
  }
LABEL_24:
  CFTypeRef v19 = v4[1];

  CFRelease(v19);
}

- (void)_releaseReplyWithID:(unint64_t)a3
{
  p_pendingReplies = (uint64_t *)&self->_pendingReplies;
  m_table = (char *)self->_pendingReplies.m_impl.var0.m_table;
  uint64_t v5 = (char *)WTF::HashTable<unsigned long long,WTF::KeyValuePair<unsigned long long,PendingReply>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<unsigned long long,PendingReply>>,WTF::DefaultHash<unsigned long long>,WTF::HashMap<unsigned long long,PendingReply,WTF::DefaultHash<unsigned long long>,WTF::HashTraits<unsigned long long>,WTF::HashTraits<PendingReply>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<unsigned long long>>::find<WTF::IdentityHashTranslator<WTF::HashMap<unsigned long long,PendingReply,WTF::DefaultHash<unsigned long long>,WTF::HashTraits<unsigned long long>,WTF::HashTraits<PendingReply>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<unsigned long long>>,unsigned long long>((uint64_t)m_table, a3);
  if (m_table)
  {
    v6 = &m_table[32 * *((unsigned int *)m_table - 1)];
    if (v6 == v5) {
      return;
    }
  }
  else
  {
    if (!v5) {
      return;
    }
    v6 = 0;
  }
  if (v6 != v5)
  {
    WTF::HashTable<unsigned long long,WTF::KeyValuePair<unsigned long long,PendingReply>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<unsigned long long,PendingReply>>,WTF::DefaultHash<unsigned long long>,WTF::HashMap<unsigned long long,PendingReply,WTF::DefaultHash<unsigned long long>,WTF::HashTraits<unsigned long long>,WTF::HashTraits<PendingReply>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<unsigned long long>>::remove(p_pendingReplies, v5);
  }
}

- (void).cxx_destruct
{
  m_tableForLLDB = self->_pendingReplies.m_impl.var0.m_tableForLLDB;
  if (m_tableForLLDB)
  {
    uint64_t v4 = *(m_tableForLLDB - 1);
    if (v4)
    {
      uint64_t v5 = (const void **)(m_tableForLLDB + 6);
      do
      {
        if (*(v5 - 3) != (const void *)-1)
        {
          v6 = *v5;
          char *v5 = 0;
          if (v6) {
            CFRelease(v6);
          }
          uint64_t v7 = *(v5 - 2);
          *(v5 - 2) = 0;
          if (v7) {
            CFRelease(v7);
          }
        }
        v5 += 4;
        --v4;
      }
      while (v4);
    }
    WTF::fastFree((WTF *)(m_tableForLLDB - 4), (void *)a2);
  }
  uint64_t v8 = self->_exportedObjects.m_impl.var0.m_tableForLLDB;
  if (v8)
  {
    uint64_t v9 = *(v8 - 1);
    if (v9)
    {
      m_table = (WTF::StringImpl **)self->_exportedObjects.m_impl.var0.m_table;
      do
      {
        if (*m_table != (WTF::StringImpl *)-1)
        {
          uint64_t v11 = m_table[2];
          m_table[2] = 0;
          if (v11) {
            CFRelease(v11);
          }
          uint64_t v12 = m_table[1];
          m_table[1] = 0;
          if (v12) {
            CFRelease(v12);
          }
          uint64_t v13 = *m_table;
          char *m_table = 0;
          if (v13)
          {
            if (*(_DWORD *)v13 == 2) {
              WTF::StringImpl::destroy(v13, (WTF::StringImpl *)a2);
            }
            else {
              *(_DWORD *)v13 -= 2;
            }
          }
        }
        m_table += 3;
        --v9;
      }
      while (v9);
    }
    WTF::fastFree((WTF *)(v8 - 4), (void *)a2);
  }
  m_ptr = self->_remoteObjectProxies.m_ptr;
  self->_remoteObjectProxies.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  value = self->_remoteObjectRegistry.__ptr_.__value_;
  self->_remoteObjectRegistry.__ptr_.__value_ = 0;
  if (value)
  {
    uint64_t v16 = *(void (**)(void))(*(void *)value + 8);
    v16();
  }
}

- (unsigned)_invokeMethod:()WTF::DestructionThread
{
  if (atomic_fetch_add((atomic_uint *volatile)result, 0xFFFFFFFF) == 1)
  {
    v1 = result;
    atomic_store(1u, result);
    v2 = (unsigned int *)WTF::fastMalloc((WTF *)0x10);
    *(void *)v2 = &unk_1EE9BE1D8;
    *((void *)v2 + 1) = v1;
    v3 = v2;
    WTF::ensureOnMainRunLoop();
    uint64_t result = v3;
    if (v3) {
      return (unsigned int *)(*(uint64_t (**)(unsigned int *))(*(void *)v3 + 8))(v3);
    }
  }
  return result;
}

- (uint64_t)_invokeMethod:()WTF::DestructionThread
{
  uint64_t v2 = *(void *)(result + 8);
  if (v2)
  {
    if (!*(unsigned char *)(v2 + 24))
    {
      v3 = *(uint64_t **)(*(void *)(v2 + 8) + 8);
      if (v3)
      {
        uint64_t v5 = *(void *)(v2 + 16);
        WebKit::RemoteObjectRegistry::send<Messages::RemoteObjectRegistry::ReleaseUnusedReplyBlock>(v3, &v5);
      }
    }
    uint64_t v4 = *(const void **)(v2 + 8);
    *(void *)(v2 + 8) = 0;
    if (v4) {
      CFRelease(v4);
    }
    return WTF::fastFree((WTF *)v2, a2);
  }
  return result;
}

@end