@interface ActivityAlertProvider
- (ACAlertPresentationOptions)presentationOptions;
- (NSString)body;
- (NSString)bundleIdentifier;
- (NSString)deviceIdentifier;
- (NSString)identifier;
- (NSString)payloadIdentifier;
- (NSString)title;
- (TLAlertConfiguration)configuration;
- (_TtC18ActivityUIServices21ActivityAlertProvider)init;
- (_TtC18ActivityUIServices21ActivityAlertProvider)initWithIdentifier:(id)a3 action:(int64_t)a4 presentationOptions:(id)a5 payload:(id)a6;
- (int64_t)action;
- (void)setConfiguration:(id)a3;
- (void)setPresentationOptions:(id)a3;
@end

@implementation ActivityAlertProvider

- (int64_t)action
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_alertAction);
}

- (NSString)identifier
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_23C990FC0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)bundleIdentifier
{
  return (NSString *)sub_23C959C84(self, (uint64_t)a2, (void (*)(void))sub_23C9594B8);
}

- (NSString)payloadIdentifier
{
  return (NSString *)sub_23C959C84(self, (uint64_t)a2, (void (*)(void))sub_23C9594E8);
}

- (TLAlertConfiguration)configuration
{
  return (TLAlertConfiguration *)sub_23C95982C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_configuration);
}

- (void)setConfiguration:(id)a3
{
}

- (ACAlertPresentationOptions)presentationOptions
{
  return (ACAlertPresentationOptions *)sub_23C95982C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_presentationOptions);
}

- (void)setPresentationOptions:(id)a3
{
}

- (NSString)title
{
  return (NSString *)sub_23C959C84(self, (uint64_t)a2, (void (*)(void))sub_23C959A5C);
}

- (NSString)body
{
  return (NSString *)sub_23C959C84(self, (uint64_t)a2, (void (*)(void))sub_23C959C54);
}

- (NSString)deviceIdentifier
{
  return (NSString *)sub_23C959C84(self, (uint64_t)a2, (void (*)(void))sub_23C959D04);
}

- (_TtC18ActivityUIServices21ActivityAlertProvider)initWithIdentifier:(id)a3 action:(int64_t)a4 presentationOptions:(id)a5 payload:(id)a6
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBAE78);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_23C990FD0();
  uint64_t v14 = v13;
  if (a6)
  {
    uint64_t v15 = sub_23C990D50();
    sub_23C95ADFC();
    sub_23C990DD0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v11, 0, 1, v15);
  }
  else
  {
    uint64_t v16 = sub_23C990D50();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v11, 1, 1, v16);
  }
  id v17 = a5;
  v18 = (_TtC18ActivityUIServices21ActivityAlertProvider *)sub_23C95A1B4(v12, v14, (char *)a4, a5, (uint64_t)v11);

  return v18;
}

- (_TtC18ActivityUIServices21ActivityAlertProvider)init
{
  result = (_TtC18ActivityUIServices21ActivityAlertProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_configuration));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_presentationOptions));
  swift_bridgeObjectRelease();
  sub_23C95AEBC((uint64_t)self + OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_alertConfiguration, &qword_268BBAF20);
  sub_23C95AEBC((uint64_t)self + OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_payload, &qword_268BBAE78);
}

@end