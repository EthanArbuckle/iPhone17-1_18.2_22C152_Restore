@interface DOCServiceContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (_TtC17RecentsAppPopover17DOCServiceContext)init;
- (_TtC17RecentsAppPopover17DOCServiceContext)initWithInputItems:(id)a3;
- (_TtC17RecentsAppPopover17DOCServiceContext)initWithInputItems:(id)a3 contextUUID:(id)a4;
- (_TtC17RecentsAppPopover17DOCServiceContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5;
- (void)configureAsDocumentBrowserWithHostProxy:(id)a3 configuration:(id)a4 initialUIPBrowserState:(id)a5 completionBlock:(id)a6;
- (void)updateAppearance:(id)a3 completionBlock:(id)a4;
- (void)updateAppearance:(id)a3 shouldFlushCA:(BOOL)a4 completionBlock:(id)a5;
- (void)updateEditingTo:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation DOCServiceContext

+ (id)_extensionAuxiliaryHostProtocol
{
  return sub_1000D501C((uint64_t)a1, (uint64_t)a2, (SEL *)&selRef_hostProtocol);
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return sub_1000D501C((uint64_t)a1, (uint64_t)a2, (SEL *)&selRef_vendorProtocol);
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
  v12[6] = sub_1000D79A4;
  v12[7] = v11;
  v20[4] = sub_1000D7A10;
  v20[5] = v12;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 1107296256;
  v20[2] = sub_100429F8C;
  v20[3] = &unk_1005AC558;
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
  v6 = (uint64_t (*)())_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_1000A6A30;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_1000D57C8(v8, (uint64_t)v6, v7);
  sub_100035EB4((uint64_t)v6);
}

- (void)updateAppearance:(id)a3 shouldFlushCA:(BOOL)a4 completionBlock:(id)a5
{
  id v8 = (uint64_t (*)())_Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    id v8 = sub_1000A6A30;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = a3;
  uint64_t v11 = self;
  sub_1000D59DC(v10, a4, (uint64_t)v8, v9);
  sub_100035EB4((uint64_t)v8);
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
    v11[4] = sub_1000D76A4;
    v11[5] = v8;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 1107296256;
    v11[2] = sub_100429F8C;
    v11[3] = &unk_1005AC490;
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

- (_TtC17RecentsAppPopover17DOCServiceContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCServiceContext();
  return [(DOCServiceContext *)&v3 init];
}

- (_TtC17RecentsAppPopover17DOCServiceContext)initWithInputItems:(id)a3
{
  if (a3)
  {
    sub_1004BEDE0();
    v4.super.isa = sub_1004BEDC0().super.isa;
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

- (_TtC17RecentsAppPopover17DOCServiceContext)initWithInputItems:(id)a3 contextUUID:(id)a4
{
  uint64_t v6 = sub_100031860((uint64_t *)&unk_100619030);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3) {
    a3 = (id)sub_1004BEDE0();
  }
  if (a4)
  {
    sub_1004BBE10();
    uint64_t v9 = sub_1004BBE30();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = sub_1004BBE30();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  return (_TtC17RecentsAppPopover17DOCServiceContext *)sub_1000D5E10((uint64_t)a3, (uint64_t)v8);
}

- (_TtC17RecentsAppPopover17DOCServiceContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  uint64_t v8 = sub_100031860((uint64_t *)&unk_100619030);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3) {
    a3 = (id)sub_1004BEDE0();
  }
  if (a5)
  {
    sub_1004BBE10();
    uint64_t v11 = sub_1004BBE30();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 0, 1, v11);
  }
  else
  {
    uint64_t v12 = sub_1004BBE30();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
  }
  id v13 = a4;
  return (_TtC17RecentsAppPopover17DOCServiceContext *)sub_1000D60CC((uint64_t)a3, a4, (uint64_t)v10);
}

@end