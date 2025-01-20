@interface ShieldActionExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (_TtC15ManagedSettings28ShieldActionExtensionContext)init;
- (_TtC15ManagedSettings28ShieldActionExtensionContext)initWithInputItems:(id)a3;
- (_TtC15ManagedSettings28ShieldActionExtensionContext)initWithInputItems:(id)a3 contextUUID:(id)a4;
- (_TtC15ManagedSettings28ShieldActionExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5;
- (void)handleWithAction:(int64_t)a3 applicationTokenData:(id)a4 replyHandler:(id)a5;
- (void)handleWithAction:(int64_t)a3 categoryTokenData:(id)a4 replyHandler:(id)a5;
- (void)handleWithAction:(int64_t)a3 webDomainTokenData:(id)a4 replyHandler:(id)a5;
@end

@implementation ShieldActionExtensionContext

+ (id)_extensionAuxiliaryHostProtocol
{
  return sub_1BC9B0168((uint64_t)a1, (uint64_t)a2, &qword_1E9FABAD0, (void **)&qword_1E9FAC250);
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return sub_1BC9B0168((uint64_t)a1, (uint64_t)a2, &qword_1E9FABAD8, (void **)&qword_1E9FAC258);
}

- (void)handleWithAction:(int64_t)a3 applicationTokenData:(id)a4 replyHandler:(id)a5
{
}

- (void)handleWithAction:(int64_t)a3 categoryTokenData:(id)a4 replyHandler:(id)a5
{
}

- (void)handleWithAction:(int64_t)a3 webDomainTokenData:(id)a4 replyHandler:(id)a5
{
}

- (_TtC15ManagedSettings28ShieldActionExtensionContext)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC15ManagedSettings28ShieldActionExtensionContext____lazy_storage___shieldActionDelegate) = (Class)1;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ShieldActionExtensionContext();
  return [(ShieldActionExtensionContext *)&v3 init];
}

- (_TtC15ManagedSettings28ShieldActionExtensionContext)initWithInputItems:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_1BCA48898();
  }
  else {
    uint64_t v3 = 0;
  }
  return (_TtC15ManagedSettings28ShieldActionExtensionContext *)sub_1BC9B0520(v3);
}

- (_TtC15ManagedSettings28ShieldActionExtensionContext)initWithInputItems:(id)a3 contextUUID:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABE30);
  MEMORY[0x1F4188790](v6 - 8, v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3) {
    a3 = (id)sub_1BCA48898();
  }
  if (a4)
  {
    sub_1BCA484A8();
    uint64_t v10 = sub_1BCA484B8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = sub_1BCA484B8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  return (_TtC15ManagedSettings28ShieldActionExtensionContext *)sub_1BC9B0604((uint64_t)a3, (uint64_t)v9);
}

- (_TtC15ManagedSettings28ShieldActionExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABE30);
  MEMORY[0x1F4188790](v8 - 8, v9);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3) {
    a3 = (id)sub_1BCA48898();
  }
  if (a5)
  {
    sub_1BCA484A8();
    uint64_t v12 = sub_1BCA484B8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = sub_1BCA484B8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  id v14 = a4;
  return (_TtC15ManagedSettings28ShieldActionExtensionContext *)sub_1BC9B08D0((uint64_t)a3, a4, (uint64_t)v11);
}

- (void).cxx_destruct
{
  sub_1BC9B0C24(*(id *)((char *)&self->super.super.isa
                      + OBJC_IVAR____TtC15ManagedSettings28ShieldActionExtensionContext____lazy_storage___shieldActionDelegate));
}

@end