@interface DOCServiceContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (_TtC33com_apple_DocumentManager_Service17DOCServiceContext)init;
- (_TtC33com_apple_DocumentManager_Service17DOCServiceContext)initWithInputItems:(id)a3;
- (_TtC33com_apple_DocumentManager_Service17DOCServiceContext)initWithInputItems:(id)a3 contextUUID:(id)a4;
- (_TtC33com_apple_DocumentManager_Service17DOCServiceContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5;
- (void)configureAsDocumentBrowserWithHostProxy:(id)a3 configuration:(id)a4 initialUIPBrowserState:(id)a5 completionBlock:(id)a6;
- (void)updateAppearance:(id)a3 completionBlock:(id)a4;
- (void)updateAppearance:(id)a3 shouldFlushCA:(BOOL)a4 completionBlock:(id)a5;
- (void)updateEditingTo:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation DOCServiceContext

+ (id)_extensionAuxiliaryHostProtocol
{
  return sub_1004C3A84((uint64_t)a1, (uint64_t)a2, (SEL *)&selRef_hostProtocol);
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return sub_1004C3A84((uint64_t)a1, (uint64_t)a2, (SEL *)&selRef_vendorProtocol);
}

- (void)configureAsDocumentBrowserWithHostProxy:(id)a3 configuration:(id)a4 initialUIPBrowserState:(id)a5 completionBlock:(id)a6
{
  v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  v12 = (void *)swift_allocObject();
  v12[2] = a5;
  v12[3] = a4;
  v12[4] = self;
  v12[5] = a3;
  v12[6] = sub_10018B840;
  v12[7] = v11;
  v20[4] = sub_1004C6404;
  v20[5] = v12;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 1107296256;
  v20[2] = sub_100041BA4;
  v20[3] = &unk_1005DF3F0;
  v13 = _Block_copy(v20);
  swift_unknownObjectRetain_n();
  id v14 = a4;
  id v15 = a5;
  v16 = self;
  id v17 = v15;
  id v18 = v14;
  v19 = v16;
  swift_retain();
  swift_release();
  DOCRunInMainThread();
  _Block_release(v13);
  swift_unknownObjectRelease();

  swift_release();
}

- (void)updateAppearance:(id)a3 completionBlock:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_1004BF478;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_1004C4230(v8, (uint64_t)v6, v7);
  sub_10003B0A8((uint64_t)v6);
}

- (void)updateAppearance:(id)a3 shouldFlushCA:(BOOL)a4 completionBlock:(id)a5
{
  id v8 = _Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    id v8 = sub_1004BF478;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = a3;
  uint64_t v11 = self;
  sub_1004C4444(v10, a4, (uint64_t)v8, v9);
  sub_10003B0A8((uint64_t)v8);
}

- (void)updateEditingTo:(BOOL)a3 animated:(BOOL)a4
{
  v6 = self;
  if ([(DOCServiceContext *)v6 _principalObject])
  {
    type metadata accessor for DOCServiceViewController();
    uint64_t v7 = (void *)swift_dynamicCastClassUnconditional();
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v7;
    *(unsigned char *)(v8 + 24) = a3;
    *(unsigned char *)(v8 + 25) = a4;
    v11[4] = sub_1004C610C;
    v11[5] = v8;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 1107296256;
    v11[2] = sub_100041BA4;
    v11[3] = &unk_1005DF328;
    uint64_t v9 = _Block_copy(v11);
    id v10 = v7;
    swift_release();
    DOCRunInMainThread();
    _Block_release(v9);
  }
  else
  {
    __break(1u);
  }
}

- (_TtC33com_apple_DocumentManager_Service17DOCServiceContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCServiceContext();
  return [(DOCServiceContext *)&v3 init];
}

- (_TtC33com_apple_DocumentManager_Service17DOCServiceContext)initWithInputItems:(id)a3
{
  if (a3)
  {
    sub_1004CD5C0();
    v4.super.isa = sub_1004CD5A0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DOCServiceContext();
  v5 = [(DOCServiceContext *)&v7 initWithInputItems:v4.super.isa];

  if (v5) {
  return v5;
  }
}

- (_TtC33com_apple_DocumentManager_Service17DOCServiceContext)initWithInputItems:(id)a3 contextUUID:(id)a4
{
  uint64_t v6 = sub_100027178((uint64_t *)&unk_10062B380);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3) {
    a3 = (id)sub_1004CD5C0();
  }
  if (a4)
  {
    sub_1004CA5D0();
    uint64_t v9 = sub_1004CA5F0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = sub_1004CA5F0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  return (_TtC33com_apple_DocumentManager_Service17DOCServiceContext *)sub_1004C4878((uint64_t)a3, (uint64_t)v8);
}

- (_TtC33com_apple_DocumentManager_Service17DOCServiceContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  uint64_t v8 = sub_100027178((uint64_t *)&unk_10062B380);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3) {
    a3 = (id)sub_1004CD5C0();
  }
  if (a5)
  {
    sub_1004CA5D0();
    uint64_t v11 = sub_1004CA5F0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 0, 1, v11);
  }
  else
  {
    uint64_t v12 = sub_1004CA5F0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
  }
  id v13 = a4;
  return (_TtC33com_apple_DocumentManager_Service17DOCServiceContext *)sub_1004C4B34((uint64_t)a3, a4, (uint64_t)v10);
}

@end