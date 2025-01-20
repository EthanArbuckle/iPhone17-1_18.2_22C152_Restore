@interface LiveLookupStoreProxy
- (BOOL)enabledForExtensionWith:(id)a3;
- (BOOL)llExtension:(id)a3 containedIn:(id)a4;
- (BOOL)shouldBlockWith:(id)a3;
- (NSString)imagePath;
- (_TtC42com_apple_CallKit_CallDirectoryMaintenance20LiveLookupStoreProxy)init;
- (id)activeExtensions;
- (id)extensionIdentifierFor:(id)a3;
- (id)extensionIdentifierForBlockingInfo:(id)a3;
- (id)extensionIdentifierForIdentityInfo:(id)a3;
- (id)extensionIdentifierFrom:(id)a3;
- (id)extensionUpdateFor:(id)a3 isAppStorVendable:(BOOL)a4;
- (id)fetchIdentityInfoFor:(id)a3 from:(id)a4;
- (id)firstEnabledBlockedExtensionIdentifierFor:(id)a3;
- (id)getBlockingInfoFor:(id)a3;
- (id)getBlockingInfoFor:(id)a3 with:(id)a4;
- (id)iconURLFor:(id)a3;
- (id)nameFor:(id)a3;
- (int64_t)identityTypeFor:(id)a3;
- (void)cleanup;
- (void)resetForExtensionWith:(id)a3;
- (void)setEnabled:(BOOL)a3 forExtensionWith:(NSString *)a4 completionHandler:(id)a5;
- (void)setImagePath:(id)a3;
- (void)updateBlockingInfoFor:(id)a3 with:(id)a4 shouldBlock:(BOOL)a5;
- (void)updateExtensionsWith:(id)a3;
- (void)updateIdentityInfoFor:(id)a3 with:(id)a4 name:(id)a5 iconURL:(id)a6 type:(int64_t)a7 ttlMinutes:(unsigned int)a8;
@end

@implementation LiveLookupStoreProxy

- (_TtC42com_apple_CallKit_CallDirectoryMaintenance20LiveLookupStoreProxy)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v3 = [objc_allocWithZone((Class)type metadata accessor for CoreAnalyticsReporter()) init];
  sub_100025950();
  uint64_t v4 = sub_100025940();
  v5 = (_TtC42com_apple_CallKit_CallDirectoryMaintenance20LiveLookupStoreProxy *)sub_10002240C((uint64_t)v3, v4, (char *)objc_allocWithZone(ObjectType));

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
}

- (NSString)imagePath
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  NSString v2 = sub_100025AF0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setImagePath:(id)a3
{
  uint64_t v4 = sub_100025B00();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC42com_apple_CallKit_CallDirectoryMaintenance20LiveLookupStoreProxy_imagePath);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (id)activeExtensions
{
  NSString v2 = self;
  LiveLookupStoreProxy.activeExtensions()();

  sub_100025860();
  v3.super.isa = sub_100025B70().super.isa;
  swift_bridgeObjectRelease();

  return v3.super.isa;
}

- (id)extensionIdentifierFor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id result = [v4 identifier];
  if (result)
  {
    id v7 = result;
    sub_100025B00();

    NSString v8 = sub_100025AF0();
    swift_bridgeObjectRelease();
    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)extensionIdentifierFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id result = [v4 dbExtension];
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  id v7 = result;
  id v8 = [result identifier];

  if (!v8)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  sub_100025B00();

  NSString v9 = sub_100025AF0();
  swift_bridgeObjectRelease();

  return v9;
}

- (id)extensionIdentifierForIdentityInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = [v4 dbExtension];
  if (v6 && (id v7 = v6, v8 = [v6 identifier], v7, v8))
  {
    sub_100025B00();

    NSString v9 = sub_100025AF0();
    swift_bridgeObjectRelease();
  }
  else
  {

    NSString v9 = 0;
  }

  return v9;
}

- (int64_t)identityTypeFor:(id)a3
{
  unsigned int v3 = [a3 type];
  if (v3 == 1) {
    return 1;
  }
  else {
    return 2 * (v3 == 2);
  }
}

- (id)extensionIdentifierForBlockingInfo:(id)a3
{
  id v4 = self;
  id v5 = a3;
  _s018com_apple_CallKit_C20DirectoryMaintenance20LiveLookupStoreProxyC19extensionIdentifier3forSSSg08IdentityH012BlockingInfoCSg_tF_0(a3);
  uint64_t v7 = v6;

  if (v7)
  {
    NSString v8 = sub_100025AF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }

  return v8;
}

- (id)getBlockingInfoFor:(id)a3
{
  sub_100025B00();
  sub_1000193C8((Class *)((char *)&self->super.isa+ OBJC_IVAR____TtC42com_apple_CallKit_CallDirectoryMaintenance20LiveLookupStoreProxy_liveLookupStore), *(void *)&self->keyRotationBeforeExpirationMinutes[OBJC_IVAR____TtC42com_apple_CallKit_CallDirectoryMaintenance20LiveLookupStoreProxy_liveLookupStore]);
  id v4 = self;
  sub_1000258C0();

  swift_bridgeObjectRelease();
  sub_100025970();
  v5.super.isa = sub_100025B70().super.isa;
  swift_bridgeObjectRelease();

  return v5.super.isa;
}

- (BOOL)llExtension:(id)a3 containedIn:(id)a4
{
  sub_100025970();
  unint64_t v6 = sub_100025B80();
  id v7 = a3;
  NSString v8 = self;
  NSString v9 = sub_1000225C0(v6, v7);

  swift_bridgeObjectRelease();
  if (v9) {

  }
  return v9 != 0;
}

- (id)firstEnabledBlockedExtensionIdentifierFor:(id)a3
{
  sub_100025970();
  unint64_t v4 = sub_100025B80();
  NSArray v5 = self;
  _s018com_apple_CallKit_C20DirectoryMaintenance20LiveLookupStoreProxyC38firstEnabledBlockedExtensionIdentifier3forSSSgSay08IdentityH012BlockingInfoCG_tF_0(v4);
  uint64_t v7 = v6;

  swift_bridgeObjectRelease();
  if (v7)
  {
    NSString v8 = sub_100025AF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }

  return v8;
}

- (id)getBlockingInfoFor:(id)a3 with:(id)a4
{
  sub_100025B00();
  id v6 = a4;
  uint64_t v7 = self;
  NSString v8 = LiveLookupStoreProxy.getBlockingInfo(for:with:)();

  swift_bridgeObjectRelease();

  return v8;
}

- (BOOL)enabledForExtensionWith:(id)a3
{
  uint64_t v4 = sub_100025B00();
  id v6 = v5;
  uint64_t v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  LOBYTE(v4) = LiveLookupStoreProxy.enabled(forExtensionWith:)(v8);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (void)setEnabled:(BOOL)a3 forExtensionWith:(NSString *)a4 completionHandler:(id)a5
{
  sub_100015FC4(&qword_10003CF28);
  __chkstk_darwin();
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  uint64_t v12 = swift_allocObject();
  *(unsigned char *)(v12 + 16) = a3;
  *(void *)(v12 + 24) = a4;
  *(void *)(v12 + 32) = v11;
  *(void *)(v12 + 40) = self;
  uint64_t v13 = sub_100025C00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10003D040;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_10003CF40;
  v15[5] = v14;
  v16 = a4;
  v17 = self;
  sub_100022104((uint64_t)v10, (uint64_t)&unk_10003CF48, (uint64_t)v15);
  swift_release();
}

- (void)cleanup
{
  NSString v2 = self;
  LiveLookupStoreProxy.cleanup()();
}

- (void)resetForExtensionWith:(id)a3
{
  sub_100025B00();
  sub_1000193C8((Class *)((char *)&self->super.isa+ OBJC_IVAR____TtC42com_apple_CallKit_CallDirectoryMaintenance20LiveLookupStoreProxy_liveLookupStore), *(void *)&self->keyRotationBeforeExpirationMinutes[OBJC_IVAR____TtC42com_apple_CallKit_CallDirectoryMaintenance20LiveLookupStoreProxy_liveLookupStore]);
  uint64_t v4 = self;
  sub_100025890();

  swift_bridgeObjectRelease();
}

- (BOOL)shouldBlockWith:(id)a3
{
  sub_100025970();
  unint64_t v4 = sub_100025B80();
  NSArray v5 = self;
  unsigned __int8 v6 = _s018com_apple_CallKit_C20DirectoryMaintenance20LiveLookupStoreProxyC11shouldBlock4withSbSay08IdentityH012BlockingInfoCG_tF_0(v4);

  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (void)updateBlockingInfoFor:(id)a3 with:(id)a4 shouldBlock:(BOOL)a5
{
  uint64_t v7 = sub_100025B00();
  unint64_t v9 = v8;
  id v10 = a4;
  v11 = self;
  LiveLookupStoreProxy.updateBlockingInfo(for:with:shouldBlock:)(v7, v9);

  swift_bridgeObjectRelease();
}

- (void)updateIdentityInfoFor:(id)a3 with:(id)a4 name:(id)a5 iconURL:(id)a6 type:(int64_t)a7 ttlMinutes:(unsigned int)a8
{
  uint64_t v14 = sub_100015FC4(&qword_10003CEF0);
  __chkstk_darwin(v14 - 8);
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100025B00();
  uint64_t v19 = v18;
  if (!a5)
  {
    uint64_t v20 = 0;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v23 = sub_1000257B0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v16, 1, 1, v23);
    goto LABEL_6;
  }
  uint64_t v20 = sub_100025B00();
  a5 = v21;
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  sub_100025790();
  uint64_t v22 = sub_1000257B0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v16, 0, 1, v22);
LABEL_6:
  id v24 = a4;
  v25 = self;
  LiveLookupStoreProxy.updateIdentityInfo(for:with:name:iconURL:type:ttlMinutes:)(v17, v19, (uint64_t)v24, v20, (uint64_t)a5, (uint64_t)v16, a7, a8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10001A434((uint64_t)v16, &qword_10003CEF0);
}

- (id)nameFor:(id)a3
{
  id v4 = a3;
  NSArray v5 = self;
  id v6 = [v4 name];
  if (v6)
  {
    uint64_t v7 = v6;
    sub_100025B00();

    NSString v8 = sub_100025AF0();
    swift_bridgeObjectRelease();
  }
  else
  {

    NSString v8 = 0;
  }

  return v8;
}

- (id)iconURLFor:(id)a3
{
  uint64_t v5 = sub_100015FC4(&qword_10003CEF0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = a3;
  unint64_t v9 = self;
  id v10 = [v8 iconURL];
  if (v10)
  {
    v11 = v10;
    sub_100025B00();

    sub_1000257A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = sub_1000257B0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v7, 1, 1, v12);
  }
  uint64_t v13 = sub_1000257B0();
  uint64_t v14 = *(void *)(v13 - 8);
  v16 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v7, 1, v13) != 1)
  {
    sub_100025770(v15);
    v16 = v17;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v7, v13);
  }

  return v16;
}

- (id)fetchIdentityInfoFor:(id)a3 from:(id)a4
{
  sub_100025B00();
  sub_1000193C8((Class *)((char *)&self->super.isa+ OBJC_IVAR____TtC42com_apple_CallKit_CallDirectoryMaintenance20LiveLookupStoreProxy_liveLookupStore), *(void *)&self->keyRotationBeforeExpirationMinutes[OBJC_IVAR____TtC42com_apple_CallKit_CallDirectoryMaintenance20LiveLookupStoreProxy_liveLookupStore]);
  id v6 = a4;
  uint64_t v7 = self;
  id v8 = (void *)sub_100025910();

  swift_bridgeObjectRelease();

  return v8;
}

- (id)extensionUpdateFor:(id)a3 isAppStorVendable:(BOOL)a4
{
  sub_100025B00();
  id v4 = objc_allocWithZone((Class)sub_100025990());
  uint64_t v5 = (void *)sub_100025980();

  return v5;
}

- (void)updateExtensionsWith:(id)a3
{
  sub_100025990();
  uint64_t v4 = sub_100025B80();
  uint64_t v5 = self;
  LiveLookupStoreProxy.updateExtensions(with:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_100019F0C((uint64_t)self + OBJC_IVAR____TtC42com_apple_CallKit_CallDirectoryMaintenance20LiveLookupStoreProxy_liveLookupStore);

  swift_bridgeObjectRelease();
}

@end