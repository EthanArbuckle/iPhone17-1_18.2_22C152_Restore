@interface APStateDump
+ (BOOL)supportsSecureCoding;
- (APStateDump)init;
- (APStateDump)initWithCoder:(id)a3;
- (APStateDump)initWithState:(id)a3 accesses:(id)a4 dtoEnabled:(BOOL)a5;
- (BOOL)writeToFileHandle:(id)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation APStateDump

- (APStateDump)initWithState:(id)a3 accesses:(id)a4 dtoEnabled:(BOOL)a5
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APStateDump_clientState) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APStateDump_extantAccesses) = *(Class *)((char *)a4
                                                                                           + OBJC_IVAR____TtCE13AppProtectionCSo11APStateDumpP33_08AD371E34EDC7245D13D99B4228357017AccessListWrapper_accesses);
  *((unsigned char *)&self->super.isa + OBJC_IVAR___APStateDump_dtoEnabled) = a5;
  v7.receiver = self;
  v7.super_class = (Class)APStateDump;
  id v5 = a3;
  swift_bridgeObjectRetain();
  return [(APStateDump *)&v7 init];
}

- (APStateDump)initWithCoder:(id)a3
{
  return (APStateDump *)APStateDump.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_247DC38D4(v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)writeToFileHandle:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  sub_247DC3B50();

  return 1;
}

- (APStateDump)init
{
  result = (APStateDump *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end