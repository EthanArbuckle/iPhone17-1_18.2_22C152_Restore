@interface WKWebProcessPlugInScriptWorld
+ (id)normalWorld;
+ (id)world;
- (NSString)name;
- (Object)_apiObject;
- (void)_scriptWorld;
- (void)clearWrappers;
- (void)dealloc;
- (void)disableOverrideBuiltinsBehavior;
- (void)makeAllShadowRootsOpen;
@end

@implementation WKWebProcessPlugInScriptWorld

+ (id)world
{
  WebKit::InjectedBundleScriptWorld::create((WebKit::InjectedBundleScriptWorld **)&v6);
  v2 = (WebKit::InjectedBundleScriptWorld *)v6;
  CFTypeRef v3 = v6[1];
  if (v3) {
    CFRetain(v6[1]);
  }
  CFTypeRef v4 = (id)CFMakeCollectable(v3);
  CFRelease(*((CFTypeRef *)v2 + 1));
  return (id)v4;
}

+ (id)normalWorld
{
  return (id)*((void *)WebKit::InjectedBundleScriptWorld::normalWorld((WebKit::InjectedBundleScriptWorld *)a1) + 1);
}

- (void)dealloc
{
  CFTypeRef v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    (**(void (***)(void))self->_world.data.__lx)();
    v4.receiver = self;
    v4.super_class = (Class)WKWebProcessPlugInScriptWorld;
    [(WKWebProcessPlugInScriptWorld *)&v4 dealloc];
  }
}

- (void)clearWrappers
{
}

- (void)makeAllShadowRootsOpen
{
  *(unsigned char *)(*(void *)&self->_world.data.__lx[24] + 52) = 1;
}

- (void)disableOverrideBuiltinsBehavior
{
  *(unsigned char *)(*(void *)&self->_world.data.__lx[24] + 53) = 1;
}

- (NSString)name
{
  if (*(void *)&self->_world.data.__lx[32]) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (void)_scriptWorld
{
  return &self->_world;
}

- (Object)_apiObject
{
  return (Object *)&self->_world;
}

@end