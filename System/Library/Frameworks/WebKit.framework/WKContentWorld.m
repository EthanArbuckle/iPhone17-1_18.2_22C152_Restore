@interface WKContentWorld
+ (BOOL)accessInstanceVariablesDirectly;
+ (WKContentWorld)defaultClientWorld;
+ (WKContentWorld)pageWorld;
+ (WKContentWorld)worldWithName:(NSString *)name;
- (NSString)name;
- (Object)_apiObject;
- (_WKUserContentWorld)_userContentWorld;
- (void)dealloc;
@end

@implementation WKContentWorld

+ (BOOL)accessInstanceVariablesDirectly
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  char v3 = WTF::linkedOnOrAfterSDKWithBehavior();
  if ((v3 & 1) == 0 && (+[WKContentWorld accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKContentWorld accessInstanceVariablesDirectly]::didLogFault = 1;
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

+ (WKContentWorld)pageWorld
{
  return (WKContentWorld *)*((void *)API::ContentWorld::pageContentWorld((API::ContentWorld *)a1) + 1);
}

+ (WKContentWorld)defaultClientWorld
{
  return (WKContentWorld *)*((void *)API::ContentWorld::defaultClientWorld((API::ContentWorld *)a1) + 1);
}

+ (WKContentWorld)worldWithName:(NSString *)name
{
  MEMORY[0x19972EAD0](&v10, name);
  API::ContentWorld::sharedWorldWithName(&v10, v3, &v11);
  v4 = *(const void **)(v11 + 8);
  if (v4) {
    CFRetain(*(CFTypeRef *)(v11 + 8));
  }
  int v6 = (id)CFMakeCollectable(v4);
  uint64_t v7 = v11;
  uint64_t v11 = 0;
  if (v7) {
    CFRelease(*(CFTypeRef *)(v7 + 8));
  }
  uint64_t v8 = v10;
  v10 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2) {
      WTF::StringImpl::destroy(v8, v5);
    }
    else {
      *(_DWORD *)v8 -= 2;
    }
  }
  return v6;
}

- (void)dealloc
{
  char v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    API::ContentWorld::~ContentWorld((API::ContentWorld *)&self->_contentWorld, v4, v5);
    v6.receiver = self;
    v6.super_class = (Class)WKContentWorld;
    [(WKContentWorld *)&v6 dealloc];
  }
}

- (NSString)name
{
  result = *(NSString **)&self->_contentWorld.data.__lx[32];
  if (result) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  return result;
}

- (Object)_apiObject
{
  return (Object *)&self->_contentWorld;
}

- (_WKUserContentWorld)_userContentWorld
{
  v2 = (void *)CFMakeCollectable([[_WKUserContentWorld alloc] _initWithContentWorld:self]);

  return (_WKUserContentWorld *)v2;
}

@end