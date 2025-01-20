@interface JSCookieProviderObject
- (_TtC9JetEngine22JSCookieProviderObject)init;
- (id)cookieForUrlWithName:(id)a3 :(id)a4;
@end

@implementation JSCookieProviderObject

- (id)cookieForUrlWithName:(id)a3 :(id)a4
{
  v7 = self;
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = objc_msgSend(v7, sel_currentContext);
  if (v11)
  {
    v12 = v11;
    id v13 = v8;
    id v14 = v9;
    v15 = v10;
    v16 = (void *)sub_19EFA59CC((uint64_t)v12, (uint64_t)v13, (uint64_t)v14, (uint64_t)v15);

    return v16;
  }
  else
  {
    id result = (id)sub_19F1DCFCC();
    __break(1u);
  }
  return result;
}

- (_TtC9JetEngine22JSCookieProviderObject)init
{
  id result = (_TtC9JetEngine22JSCookieProviderObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end