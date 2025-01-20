@interface _WKGeolocationPosition
+ (id)positionWithLocation:(id)a3;
- (Object)_apiObject;
- (void)dealloc;
@end

@implementation _WKGeolocationPosition

+ (id)positionWithLocation:(id)a3
{
  if (!a3) {
    return 0;
  }
  MEMORY[0x1997378A0](v12, a3);
  uint64_t v3 = API::Object::newObject(0x80uLL, 68);
  *(void *)uint64_t v3 = &unk_1EE9D1E28;
  WebKit::InitializeWebKit2((WebKit *)v3);
  *(void *)uint64_t v3 = &unk_1EE9D15C8;
  long long v5 = v12[5];
  long long v4 = v12[6];
  *(_OWORD *)(v3 + 80) = v12[4];
  *(_OWORD *)(v3 + 96) = v5;
  *(_OWORD *)(v3 + 112) = v4;
  long long v7 = v12[2];
  long long v6 = v12[3];
  long long v8 = v12[1];
  *(_OWORD *)(v3 + 16) = v12[0];
  *(_OWORD *)(v3 + 32) = v8;
  *(_OWORD *)(v3 + 48) = v7;
  *(_OWORD *)(v3 + 64) = v6;
  v9 = *(const void **)(v3 + 8);
  if (v9) {
    CFRetain(*(CFTypeRef *)(v3 + 8));
  }
  CFTypeRef v10 = (id)CFMakeCollectable(v9);
  CFRelease(*(CFTypeRef *)(v3 + 8));
  return (id)v10;
}

- (void)dealloc
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    (**(void (***)(void))self->_geolocationPosition.data.__lx)();
    v4.receiver = self;
    v4.super_class = (Class)_WKGeolocationPosition;
    [(_WKGeolocationPosition *)&v4 dealloc];
  }
}

- (Object)_apiObject
{
  return (Object *)&self->_geolocationPosition;
}

@end