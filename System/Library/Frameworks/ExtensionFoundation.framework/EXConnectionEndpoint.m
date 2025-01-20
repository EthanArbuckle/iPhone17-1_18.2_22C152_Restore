@interface EXConnectionEndpoint
+ (BOOL)supportsSecureCoding;
- (BSServiceConnectionEndpoint)bsServiceConnectionEndpoint;
- (EXConnectionEndpoint)init;
- (EXConnectionEndpoint)initWithCoder:(id)a3;
- (EXConnectionEndpoint)initWithIdentifier:(id)a3 bsServiceConnectionEndpoint:(id)a4;
- (EXConnectionEndpoint)initWithIdentifier:(id)a3 xpcEndpoint:(id)a4;
- (NSString)identifier;
- (NSString)service;
- (OS_xpc_object)xpcEndpoint;
- (void)encodeWithCoder:(id)a3;
- (void)setXpcEndpoint:(id)a3;
@end

@implementation EXConnectionEndpoint

- (NSString)identifier
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_191FB9DA8();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSString)service
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___EXConnectionEndpoint_bsServiceConnectionEndpoint);
  if (v2)
  {
    v3 = self;
    id v4 = objc_msgSend(v2, sel_service);
    sub_191FB9DC8();

    v2 = (void *)sub_191FB9DA8();
    swift_bridgeObjectRelease();
  }

  return (NSString *)v2;
}

- (BSServiceConnectionEndpoint)bsServiceConnectionEndpoint
{
  return (BSServiceConnectionEndpoint *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                + OBJC_IVAR___EXConnectionEndpoint_bsServiceConnectionEndpoint));
}

- (OS_xpc_object)xpcEndpoint
{
  v2 = (void *)swift_unknownObjectRetain();

  return (OS_xpc_object *)v2;
}

- (void)setXpcEndpoint:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___EXConnectionEndpoint_xpcEndpoint) = (Class)a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

- (EXConnectionEndpoint)initWithIdentifier:(id)a3 bsServiceConnectionEndpoint:(id)a4
{
  uint64_t v6 = sub_191FB9DC8();
  uint64_t v7 = OBJC_IVAR___EXConnectionEndpoint_xpcEndpoint;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___EXConnectionEndpoint_xpcEndpoint) = 0;
  v8 = (uint64_t *)((char *)self + OBJC_IVAR___EXConnectionEndpoint_identifier);
  uint64_t *v8 = v6;
  v8[1] = v9;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___EXConnectionEndpoint_bsServiceConnectionEndpoint) = (Class)a4;
  *(Class *)((char *)&self->super.isa + v7) = 0;
  id v10 = a4;
  swift_unknownObjectRelease();
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for EXConnectionEndpoint();
  v11 = [(EXConnectionEndpoint *)&v13 init];

  return v11;
}

- (EXConnectionEndpoint)initWithIdentifier:(id)a3 xpcEndpoint:(id)a4
{
  uint64_t v6 = sub_191FB9DC8();
  uint64_t v7 = OBJC_IVAR___EXConnectionEndpoint_xpcEndpoint;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___EXConnectionEndpoint_xpcEndpoint) = 0;
  v8 = (uint64_t *)((char *)self + OBJC_IVAR___EXConnectionEndpoint_identifier);
  uint64_t *v8 = v6;
  v8[1] = v9;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___EXConnectionEndpoint_bsServiceConnectionEndpoint) = 0;
  *(Class *)((char *)&self->super.isa + v7) = (Class)a4;
  swift_unknownObjectRetain_n();
  swift_unknownObjectRelease();
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for EXConnectionEndpoint();
  id v10 = [(EXConnectionEndpoint *)&v12 init];
  swift_unknownObjectRelease();
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_191F9E2CC(v4);
}

- (EXConnectionEndpoint)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (EXConnectionEndpoint *)sub_191F9E5F8(v3);

  return v4;
}

- (EXConnectionEndpoint)init
{
  result = (EXConnectionEndpoint *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

@end