@interface CDMNluResponse
+ (BOOL)supportsSecureCoding;
- (CDMNluResponse)init;
- (CDMNluResponse)initWithCoder:(id)a3;
- (CDMNluResponse)initWithObjcProto:(id)a3;
- (SIRINLUEXTERNALCDMNluResponse)objcProto;
- (void)encodeWithCoder:(id)a3;
- (void)setObjcProto:(id)a3;
@end

@implementation CDMNluResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SIRINLUEXTERNALCDMNluResponse)objcProto
{
  v2 = sub_226482088();
  return (SIRINLUEXTERNALCDMNluResponse *)v2;
}

- (void)setObjcProto:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_226482134(a3);
}

- (CDMNluResponse)initWithObjcProto:(id)a3
{
  return (CDMNluResponse *)CDMNluResponse.init(objcProto:)(a3);
}

- (CDMNluResponse)initWithCoder:(id)a3
{
  return (CDMNluResponse *)CDMNluResponse.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_226482D34(v4);
}

- (CDMNluResponse)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___CDMNluResponse_swiftProto;
  sub_2265F74A0();
  OUTLINED_FUNCTION_1();
  v6 = *(void (**)(char *, uint64_t))(v5 + 8);
  v6(v3, v4);
}

@end