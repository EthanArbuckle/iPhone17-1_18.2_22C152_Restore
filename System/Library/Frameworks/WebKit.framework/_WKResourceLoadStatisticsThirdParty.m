@interface _WKResourceLoadStatisticsThirdParty
- (NSArray)underFirstParties;
- (NSString)thirdPartyDomain;
- (Object)_apiObject;
- (void)dealloc;
@end

@implementation _WKResourceLoadStatisticsThirdParty

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    API::ResourceLoadStatisticsThirdParty::~ResourceLoadStatisticsThirdParty((WTF::StringImpl **)&self->_thirdParty);
    v4.receiver = self;
    v4.super_class = (Class)_WKResourceLoadStatisticsThirdParty;
    [(_WKResourceLoadStatisticsThirdParty *)&v4 dealloc];
  }
}

- (NSString)thirdPartyDomain
{
  if (*(void *)&self->_thirdParty.data.__lx[16]) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (NSArray)underFirstParties
{
  v3 = (WTF::RunLoop *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(unsigned int *)&self->_thirdParty.data.__lx[36]];
  objc_super v4 = v3;
  unsigned int v5 = *(_DWORD *)&self->_thirdParty.data.__lx[36];
  if (v5)
  {
    uint64_t v6 = *(void *)&self->_thirdParty.data.__lx[24];
    uint64_t v7 = v6 + 24 * v5;
    while (1)
    {
      v8 = (WTF::RunLoop *)WTF::RunLoop::main(v3);
      if ((WTF::RunLoop::isCurrent(v8) & 1) == 0) {
        break;
      }
      uint64_t v9 = API::Object::newObject(0x28uLL, 95);
      *(void *)uint64_t v9 = &unk_1EE9D1E28;
      WebKit::InitializeWebKit2((WebKit *)v9);
      *(void *)uint64_t v9 = &unk_1EE9B2578;
      v10 = *(_DWORD **)v6;
      if (*(void *)v6) {
        *v10 += 2;
      }
      *(void *)(v9 + 16) = v10;
      *(_OWORD *)(v9 + 24) = *(_OWORD *)(v6 + 8);
      v11 = *(const void **)(v9 + 8);
      if (v11)
      {
        CFRetain(*(CFTypeRef *)(v9 + 8));
        CFRelease(*(CFTypeRef *)(v9 + 8));
        [(WTF::RunLoop *)v4 addObject:v11];
        v12 = v11;
      }
      else
      {
        v12 = 0;
      }
      CFRelease(v12);
      v6 += 24;
      if (v6 == v7) {
        goto LABEL_10;
      }
    }
    result = (NSArray *)39;
    __break(0xC471u);
  }
  else
  {
LABEL_10:
    v13 = (void *)CFMakeCollectable(v4);
    return (NSArray *)v13;
  }
  return result;
}

- (Object)_apiObject
{
  return (Object *)&self->_thirdParty;
}

@end