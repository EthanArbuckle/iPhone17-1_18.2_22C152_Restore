@interface AMSBlindedData
+ (BOOL)supportsSecureCoding;
- (AMSBlindedData)init;
- (AMSBlindedData)initWithBlindedElement:(id)a3 privateInput:(id)a4 timestamp:(id)a5;
- (AMSBlindedData)initWithCoder:(id)a3;
- (NSData)blindedElement;
- (NSData)privateInput;
- (NSString)blindedElementString;
- (NSString)timestamp;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AMSBlindedData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)blindedElement
{
  return (NSData *)sub_18D75DD10((uint64_t)self, (uint64_t)a2, (void (*)(void))BlindedData.blindedElement.getter);
}

- (NSData)privateInput
{
  return (NSData *)sub_18D75DD10((uint64_t)self, (uint64_t)a2, (void (*)(void))BlindedData.privateInput.getter);
}

- (NSString)timestamp
{
  return (NSString *)sub_18D75DDF4((uint64_t)self, (uint64_t)a2, (void (*)(void))BlindedData.timestamp.getter);
}

- (AMSBlindedData)initWithBlindedElement:(id)a3 privateInput:(id)a4 timestamp:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = sub_18DD4D8C0();
  uint64_t v12 = v11;

  uint64_t v13 = sub_18DD4D8C0();
  uint64_t v15 = v14;

  uint64_t v16 = sub_18DD4DEB0();
  uint64_t v18 = v17;

  return (AMSBlindedData *)sub_18D75D4C8(v10, v12, v13, v15, v16, v18);
}

- (AMSBlindedData)initWithCoder:(id)a3
{
  return (AMSBlindedData *)BlindedData.init(coder:)(a3);
}

- (NSString)blindedElementString
{
  v2 = self;
  BlindedData.blindedElementString.getter();

  v3 = (void *)sub_18DD4DE80();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  BlindedData.encode(with:)((NSCoder)v4);
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  BlindedData.copy(with:)();

  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  id v4 = (void *)sub_18DD4EA30();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v6);
  return v4;
}

- (AMSBlindedData)init
{
}

- (void).cxx_destruct
{
  sub_18D69616C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AMSBlindedData_blindedElement), *(void *)&self->blindedElement[OBJC_IVAR___AMSBlindedData_blindedElement]);
  sub_18D69616C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AMSBlindedData_privateInput), *(void *)&self->blindedElement[OBJC_IVAR___AMSBlindedData_privateInput]);
  swift_bridgeObjectRelease();
}

@end