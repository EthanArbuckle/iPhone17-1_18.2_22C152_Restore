@interface WKContentRuleListStore
+ (BOOL)accessInstanceVariablesDirectly;
+ (WKContentRuleListStore)defaultStore;
+ (WKContentRuleListStore)storeWithURL:(NSURL *)url;
+ (WKContentRuleListStore)storeWithURLAndLegacyFilename:(id)a3;
+ (id)defaultStoreWithLegacyFilename;
- (Object)_apiObject;
- (uint64_t)compileContentRuleListForIdentifier:(const void *)a1 encodedContentRuleList:completionHandler:;
- (uint64_t)compileContentRuleListForIdentifier:(uint64_t)a1 encodedContentRuleList:completionHandler:;
- (uint64_t)getAvailableContentRuleListIdentifiers:(const void *)a1;
- (uint64_t)getAvailableContentRuleListIdentifiers:(uint64_t)a1;
- (uint64_t)lookUpContentRuleListForIdentifier:(const void *)a1 completionHandler:;
- (uint64_t)lookUpContentRuleListForIdentifier:(uint64_t)a1 completionHandler:;
- (uint64_t)removeContentRuleListForIdentifier:(const std::error_category *)a3 completionHandler:;
- (uint64_t)removeContentRuleListForIdentifier:(const void *)a1 completionHandler:;
- (uint64_t)removeContentRuleListForIdentifier:(uint64_t)a1 completionHandler:;
- (void)_getContentRuleListSourceForIdentifier:(id)a3 completionHandler:(id)a4;
- (void)_invalidateContentRuleListVersionForIdentifier:(id)a3;
- (void)_removeAllContentRuleLists;
- (void)compileContentRuleListForIdentifier:(NSString *)identifier encodedContentRuleList:(NSString *)encodedContentRuleList completionHandler:(void *)completionHandler;
- (void)compileContentRuleListForIdentifier:(uint64_t)a3 encodedContentRuleList:(const std::error_category *)a4 completionHandler:;
- (void)dealloc;
- (void)getAvailableContentRuleListIdentifiers:(void *)completionHandler;
- (void)lookUpContentRuleListForIdentifier:(NSString *)identifier completionHandler:(void *)completionHandler;
- (void)lookUpContentRuleListForIdentifier:(uint64_t)a3 completionHandler:(const std::error_category *)a4;
- (void)removeContentRuleListForIdentifier:(NSString *)identifier completionHandler:(void *)completionHandler;
@end

@implementation WKContentRuleListStore

- (Object)_apiObject
{
  return (Object *)&self->_contentRuleListStore;
}

+ (WKContentRuleListStore)storeWithURL:(NSURL *)url
{
  MEMORY[0x19972EAD0](&v10, [[(NSURL *)url absoluteURL] path]);
  v3 = (CFTypeRef *)API::Object::newObject(0x30uLL, 49);
  v4 = API::ContentRuleListStore::ContentRuleListStore((API::ContentRuleListStore *)v3, (const WTF::String *)&v10);
  v5 = (const void *)*((void *)v4 + 1);
  if (v5) {
    CFRetain(*((CFTypeRef *)v4 + 1));
  }
  v6 = (id)CFMakeCollectable(v5);
  CFRelease(v3[1]);
  v8 = v10;
  v10 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2) {
      WTF::StringImpl::destroy(v8, v7);
    }
    else {
      *(_DWORD *)v8 -= 2;
    }
  }
  return v6;
}

- (void)lookUpContentRuleListForIdentifier:(NSString *)identifier completionHandler:(void *)completionHandler
{
  MEMORY[0x19972EAD0](&v11, identifier);
  v6 = _Block_copy(completionHandler);
  v7 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v7 = &unk_1EE9C2BB0;
  v7[1] = v6;
  v10 = v7;
  API::ContentRuleListStore::lookupContentRuleList((uint64_t)&self->_contentRuleListStore, (const WTF::String *)&v11, (const WTF::String *)&v10);
  if (v10) {
    (*(void (**)(void *))(*v10 + 8))(v10);
  }
  _Block_release(0);
  v9 = v11;
  v11 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      WTF::StringImpl::destroy(v9, v8);
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
}

- (uint64_t)lookUpContentRuleListForIdentifier:(const void *)a1 completionHandler:
{
  *a1 = &unk_1EE9C2BB0;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)lookUpContentRuleListForIdentifier:(uint64_t)a3 completionHandler:(const std::error_category *)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *a2;
  *a2 = 0;
  *(void *)&v11.__val_ = a3;
  v11.__cat_ = a4;
  if (!a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
LABEL_12:
    CFRelease(*(CFTypeRef *)(v5 + 8));
    return;
  }
  uint64_t v12 = *MEMORY[0x1E4F28458];
  v6 = NSString;
  std::error_code::message(&v10, &v11);
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v7 = &v10;
  }
  else {
    v7 = (std::string *)v10.__r_.__value_.__r.__words[0];
  }
  v13[0] = objc_msgSend(v6, "stringWithFormat:", @"Rule list lookup failed: %s", v7);
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v10.__r_.__value_.__l.__data_);
  }
  if ((v11.__val_ - 1) > 3) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = qword_1994F61C8[v11.__val_ - 1];
  }
  [MEMORY[0x1E4F28C58] errorWithDomain:@"WKErrorDomain" code:v9 userInfo:v8];
  (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
  if (v5) {
    goto LABEL_12;
  }
}

+ (BOOL)accessInstanceVariablesDirectly
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  char v3 = WTF::linkedOnOrAfterSDKWithBehavior();
  if ((v3 & 1) == 0 && (+[WKContentRuleListStore accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKContentRuleListStore accessInstanceVariablesDirectly]::didLogFault = 1;
    v4 = qword_1EB357B50;
    if (os_log_type_enabled((os_log_t)qword_1EB357B50, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136446210;
      Name = class_getName((Class)a1);
      _os_log_fault_impl(&dword_1985F2000, v4, OS_LOG_TYPE_FAULT, "Do not access private instance variables of %{public}s via key-value coding. This will raise an exception when linking against newer SDKs.", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 ^ 1;
}

- (void)dealloc
{
  char v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    API::ContentRuleListStore::~ContentRuleListStore((API::ContentRuleListStore *)&self->_contentRuleListStore, v4);
    v5.receiver = self;
    v5.super_class = (Class)WKContentRuleListStore;
    [(WKContentRuleListStore *)&v5 dealloc];
  }
}

+ (WKContentRuleListStore)defaultStore
{
  return (WKContentRuleListStore *)*((void *)API::ContentRuleListStore::defaultStore((API::ContentRuleListStore *)a1)
                                   + 1);
}

- (void)compileContentRuleListForIdentifier:(NSString *)identifier encodedContentRuleList:(NSString *)encodedContentRuleList completionHandler:(void *)completionHandler
{
  MEMORY[0x19972EAD0](&v15, identifier);
  MEMORY[0x19972EAD0](&v14, encodedContentRuleList);
  uint64_t v8 = _Block_copy(completionHandler);
  uint64_t v9 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v9 = &unk_1EE9C2B88;
  v9[1] = v8;
  v13 = v9;
  API::ContentRuleListStore::compileContentRuleList((uint64_t)&self->_contentRuleListStore, (const WTF::String *)&v15, (const WTF::String *)&v14, (uint64_t *)&v13);
  if (v13) {
    (*(void (**)(void *))(*v13 + 8))(v13);
  }
  _Block_release(0);
  std::error_code v11 = v14;
  v14 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy(v11, v10);
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  uint64_t v12 = v15;
  v15 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2) {
      WTF::StringImpl::destroy(v12, v10);
    }
    else {
      *(_DWORD *)v12 -= 2;
    }
  }
}

- (void)getAvailableContentRuleListIdentifiers:(void *)completionHandler
{
  v4 = _Block_copy(completionHandler);
  objc_super v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v5 = &unk_1EE9C2BD8;
  v5[1] = v4;
  int v6 = v5;
  API::ContentRuleListStore::getAvailableContentRuleListIdentifiers((uint64_t)&self->_contentRuleListStore, (uint64_t *)&v6);
  if (v6) {
    (*(void (**)(void *))(*v6 + 8))(v6);
  }

  _Block_release(0);
}

- (void)removeContentRuleListForIdentifier:(NSString *)identifier completionHandler:(void *)completionHandler
{
  MEMORY[0x19972EAD0](&v11, identifier);
  int v6 = _Block_copy(completionHandler);
  v7 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v7 = &unk_1EE9C2C00;
  v7[1] = v6;
  std::string v10 = v7;
  API::ContentRuleListStore::removeContentRuleList((uint64_t)&self->_contentRuleListStore, (const WTF::String *)&v11, (const WTF::String *)&v10);
  if (v10) {
    (*(void (**)(void *))(*v10 + 8))(v10);
  }
  _Block_release(0);
  uint64_t v9 = v11;
  std::error_code v11 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      WTF::StringImpl::destroy(v9, v8);
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
}

- (void)_removeAllContentRuleLists
{
}

- (void)_invalidateContentRuleListVersionForIdentifier:(id)a3
{
  p_contentRuleListStore = &self->_contentRuleListStore;
  MEMORY[0x19972EAD0](&v7, a3);
  API::ContentRuleListStore::invalidateContentRuleListVersion((API::ContentRuleListStore *)p_contentRuleListStore, (const WTF::String *)&v7, v4);
  int v6 = v7;
  v7 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v5);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
}

- (void)_getContentRuleListSourceForIdentifier:(id)a3 completionHandler:(id)a4
{
  int v6 = (const void *)[a4 copy];
  MEMORY[0x19972EAD0](&v12, a3);
  if (v6) {
    CFRetain(v6);
  }
  v7 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v7 = &unk_1EE9C2C28;
  v7[1] = v6;
  std::error_code v11 = v7;
  API::ContentRuleListStore::getContentRuleListSource((uint64_t)&self->_contentRuleListStore, (const WTF::String *)&v12, (uint64_t *)&v11);
  uint64_t v9 = (uint64_t)v11;
  std::error_code v11 = 0;
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
  }
  std::string v10 = v12;
  uint64_t v12 = 0;
  if (!v10)
  {
LABEL_8:
    if (!v6) {
      return;
    }
    goto LABEL_9;
  }
  if (*(_DWORD *)v10 != 2)
  {
    *(_DWORD *)v10 -= 2;
    goto LABEL_8;
  }
  WTF::StringImpl::destroy(v10, v8);
  if (!v6) {
    return;
  }
LABEL_9:
  CFRelease(v6);
}

+ (id)defaultStoreWithLegacyFilename
{
  return (id)*((void *)API::ContentRuleListStore::defaultStore((API::ContentRuleListStore *)a1) + 1);
}

+ (WKContentRuleListStore)storeWithURLAndLegacyFilename:(id)a3
{
  MEMORY[0x19972EAD0](&v10, objc_msgSend((id)objc_msgSend(a3, "absoluteURL"), "path"));
  char v3 = (CFTypeRef *)API::Object::newObject(0x30uLL, 49);
  v4 = API::ContentRuleListStore::ContentRuleListStore((API::ContentRuleListStore *)v3, (const WTF::String *)&v10);
  objc_super v5 = (const void *)*((void *)v4 + 1);
  if (v5) {
    CFRetain(*((CFTypeRef *)v4 + 1));
  }
  int v6 = (id)CFMakeCollectable(v5);
  CFRelease(v3[1]);
  uint64_t v8 = v10;
  std::string v10 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2) {
      WTF::StringImpl::destroy(v8, v7);
    }
    else {
      *(_DWORD *)v8 -= 2;
    }
  }
  return v6;
}

- (uint64_t)compileContentRuleListForIdentifier:(uint64_t)a1 encodedContentRuleList:completionHandler:
{
  *(void *)a1 = &unk_1EE9C2B88;
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

- (uint64_t)compileContentRuleListForIdentifier:(const void *)a1 encodedContentRuleList:completionHandler:
{
  *a1 = &unk_1EE9C2B88;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)compileContentRuleListForIdentifier:(uint64_t)a3 encodedContentRuleList:(const std::error_category *)a4 completionHandler:
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *a2;
  *a2 = 0;
  *(void *)&v10.__val_ = a3;
  v10.__cat_ = a4;
  if (!a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
LABEL_10:
    CFRelease(*(CFTypeRef *)(v5 + 8));
    return;
  }
  uint64_t v11 = *MEMORY[0x1E4F28458];
  int v6 = NSString;
  std::error_code::message(&v9, &v10);
  if ((v9.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v7 = &v9;
  }
  else {
    v7 = (std::string *)v9.__r_.__value_.__r.__words[0];
  }
  v12[0] = objc_msgSend(v6, "stringWithFormat:", @"Rule list compilation failed: %s", v7);
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v9.__r_.__value_.__l.__data_);
  }
  [MEMORY[0x1E4F28C58] errorWithDomain:@"WKErrorDomain" code:6 userInfo:v8];
  (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
  if (v5) {
    goto LABEL_10;
  }
}

- (uint64_t)lookUpContentRuleListForIdentifier:(uint64_t)a1 completionHandler:
{
  *(void *)a1 = &unk_1EE9C2BB0;
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

- (uint64_t)getAvailableContentRuleListIdentifiers:(uint64_t)a1
{
  v7[0] = *a2;
  uint64_t v3 = a2[1];
  *a2 = 0;
  a2[1] = 0;
  v7[1] = v3;
  WTF::createNSArray<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> &>((uint64_t)v7, (uint64_t *)&cf);
  (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
  CFTypeRef v5 = cf;
  CFTypeRef cf = 0;
  if (v5) {
    CFRelease(v5);
  }
  return WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v7, v4);
}

- (uint64_t)getAvailableContentRuleListIdentifiers:(const void *)a1
{
  *a1 = &unk_1EE9C2BD8;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)removeContentRuleListForIdentifier:(uint64_t)a1 completionHandler:
{
  *(void *)a1 = &unk_1EE9C2C00;
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

- (uint64_t)removeContentRuleListForIdentifier:(const void *)a1 completionHandler:
{
  *a1 = &unk_1EE9C2C00;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)removeContentRuleListForIdentifier:(const std::error_category *)a3 completionHandler:
{
  v12[1] = *MEMORY[0x1E4F143B8];
  *(void *)&v10.__val_ = a2;
  v10.__cat_ = a3;
  if (a2)
  {
    uint64_t v11 = *MEMORY[0x1E4F28458];
    v4 = NSString;
    std::error_code::message(&v9, &v10);
    if ((v9.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      CFTypeRef v5 = &v9;
    }
    else {
      CFTypeRef v5 = (std::string *)v9.__r_.__value_.__r.__words[0];
    }
    v12[0] = objc_msgSend(v4, "stringWithFormat:", @"Rule list removal failed: %s", v5);
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v9.__r_.__value_.__l.__data_);
    }
    [MEMORY[0x1E4F28C58] errorWithDomain:@"WKErrorDomain" code:8 userInfo:v6];
    return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
  }
  else
  {
    uint64_t v8 = *(uint64_t (**)(void))(*(void *)(a1 + 8) + 16);
    return v8();
  }
}

@end