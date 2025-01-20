@interface JSAccountObject
- (JSValue)appStore;
- (JSValue)appStoreLocal;
- (JSValue)current;
- (JSValue)currentLocal;
- (JSValue)iCloud;
- (JSValue)iTunesStore;
- (JSValue)iTunesStoreLocal;
- (_TtC34AppleMediaServicesUIDynamicService15JSAccountObject)init;
- (id)privacyAcknowledgementState:(id)a3 :(id)a4;
@end

@implementation JSAccountObject

- (JSValue)current
{
  v2 = self;
  v3 = (void *)sub_10000FED4();

  return (JSValue *)v3;
}

- (JSValue)currentLocal
{
  v2 = self;
  v3 = (void *)sub_10000FF58();

  return (JSValue *)v3;
}

- (JSValue)appStore
{
  v2 = self;
  v3 = (void *)sub_100010044();

  return (JSValue *)v3;
}

- (JSValue)iTunesStore
{
  v2 = self;
  v3 = (void *)sub_100010094();

  return (JSValue *)v3;
}

- (JSValue)iCloud
{
  v2 = self;
  v3 = (void *)sub_100010118();

  return (JSValue *)v3;
}

- (JSValue)appStoreLocal
{
  v2 = self;
  v3 = (void *)sub_100010168();

  return (JSValue *)v3;
}

- (JSValue)iTunesStoreLocal
{
  v2 = self;
  v3 = (void *)sub_100010228();

  return (JSValue *)v3;
}

- (id)privacyAcknowledgementState:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  v9 = (void *)sub_1000102C8();

  return v9;
}

- (_TtC34AppleMediaServicesUIDynamicService15JSAccountObject)init
{
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSAccountObject_clientInfo);
}

@end