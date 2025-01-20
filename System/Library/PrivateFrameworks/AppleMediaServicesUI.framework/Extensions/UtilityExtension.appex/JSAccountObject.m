@interface JSAccountObject
- (JSValue)appStore;
- (JSValue)appStoreLocal;
- (JSValue)current;
- (JSValue)currentLocal;
- (JSValue)iCloud;
- (JSValue)iTunesStore;
- (JSValue)iTunesStoreLocal;
- (_TtC16UtilityExtension15JSAccountObject)init;
- (id)privacyAcknowledgementState:(id)a3 :(id)a4;
@end

@implementation JSAccountObject

- (JSValue)current
{
  v2 = self;
  v3 = (void *)sub_100010C3C();

  return (JSValue *)v3;
}

- (JSValue)currentLocal
{
  v2 = self;
  v3 = (void *)sub_100010CC0();

  return (JSValue *)v3;
}

- (JSValue)appStore
{
  v2 = self;
  v3 = (void *)sub_100010DAC();

  return (JSValue *)v3;
}

- (JSValue)iTunesStore
{
  v2 = self;
  v3 = (void *)sub_100010DFC();

  return (JSValue *)v3;
}

- (JSValue)iCloud
{
  v2 = self;
  v3 = (void *)sub_100010E80();

  return (JSValue *)v3;
}

- (JSValue)appStoreLocal
{
  v2 = self;
  v3 = (void *)sub_100010ED0();

  return (JSValue *)v3;
}

- (JSValue)iTunesStoreLocal
{
  v2 = self;
  v3 = (void *)sub_100010F90();

  return (JSValue *)v3;
}

- (id)privacyAcknowledgementState:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  v9 = (void *)sub_100011030();

  return v9;
}

- (_TtC16UtilityExtension15JSAccountObject)init
{
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16UtilityExtension15JSAccountObject_clientInfo);
}

@end