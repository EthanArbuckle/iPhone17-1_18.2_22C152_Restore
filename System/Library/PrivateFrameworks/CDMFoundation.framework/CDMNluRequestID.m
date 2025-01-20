@interface CDMNluRequestID
- (CDMNluRequestID)init;
- (CDMNluRequestID)initWithObjcProto:(id)a3;
- (SIRINLUEXTERNALRequestID)objcProto;
- (void)setObjcProto:(id)a3;
@end

@implementation CDMNluRequestID

- (SIRINLUEXTERNALRequestID)objcProto
{
  v2 = sub_2264E6B88();
  return (SIRINLUEXTERNALRequestID *)v2;
}

- (void)setObjcProto:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_2264E6C34(a3);
}

- (CDMNluRequestID)initWithObjcProto:(id)a3
{
  return (CDMNluRequestID *)CDMNluRequestID.init(objcProto:)(a3);
}

- (CDMNluRequestID)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___CDMNluRequestID_swiftProto;
  sub_2265F5610();
  OUTLINED_FUNCTION_1();
  v6 = *(void (**)(char *, uint64_t))(v5 + 8);
  v6(v3, v4);
}

@end