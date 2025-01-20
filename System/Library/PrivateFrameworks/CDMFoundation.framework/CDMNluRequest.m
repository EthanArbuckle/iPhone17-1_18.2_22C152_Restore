@interface CDMNluRequest
+ (BOOL)supportsSecureCoding;
- (CDMNluRequest)init;
- (CDMNluRequest)initWithCoder:(id)a3;
- (CDMNluRequest)initWithObjcProto:(id)a3;
- (SIRINLUEXTERNALCDMNluRequest)objcProto;
- (void)encodeWithCoder:(id)a3;
- (void)setObjcProto:(id)a3;
@end

@implementation CDMNluRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SIRINLUEXTERNALCDMNluRequest)objcProto
{
  v2 = sub_2265116C8();
  return (SIRINLUEXTERNALCDMNluRequest *)v2;
}

- (void)setObjcProto:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_226511774(a3);
}

- (CDMNluRequest)initWithObjcProto:(id)a3
{
  return (CDMNluRequest *)CDMNluRequest.init(objcProto:)(a3);
}

- (CDMNluRequest)initWithCoder:(id)a3
{
  return (CDMNluRequest *)CDMNluRequest.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_22651227C(v4);
}

- (CDMNluRequest)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___CDMNluRequest_swiftProto;
  sub_2265F7410();
  OUTLINED_FUNCTION_1();
  v6 = *(void (**)(char *, uint64_t))(v5 + 8);
  v6(v3, v4);
}

@end