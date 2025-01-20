@interface SESRKESessionContinuationDelegateHandler
- (_TtC6CarKeyP33_86CE746C1DFB40AB47D6F76682ACEEE140SESRKESessionContinuationDelegateHandler)init;
- (void)sesSession:(id)a3 didReceiveContinuationRequestFor:(id)a4 actionIdentifier:(id)a5 arbitraryData:(id)a6 fromVehicle:(id)a7;
@end

@implementation SESRKESessionContinuationDelegateHandler

- (void)sesSession:(id)a3 didReceiveContinuationRequestFor:(id)a4 actionIdentifier:(id)a5 arbitraryData:(id)a6 fromVehicle:(id)a7
{
  if (a6)
  {
    id v12 = a3;
    id v13 = a4;
    id v14 = a5;
    id v15 = a7;
    v16 = self;
    id v17 = a6;
    uint64_t v18 = sub_2211D7BD0();
    unint64_t v20 = v19;
  }
  else
  {
    id v21 = a3;
    id v22 = a4;
    id v23 = a5;
    v24 = self;
    uint64_t v18 = 0;
    unint64_t v20 = 0xF000000000000000;
  }
  sub_2211D6B60(v18, v20);
  sub_2211D6CE4(v18, v20);
}

- (_TtC6CarKeyP33_86CE746C1DFB40AB47D6F76682ACEEE140SESRKESessionContinuationDelegateHandler)init
{
  result = (_TtC6CarKeyP33_86CE746C1DFB40AB47D6F76682ACEEE140SESRKESessionContinuationDelegateHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2211D7964((uint64_t)self+ OBJC_IVAR____TtC6CarKeyP33_86CE746C1DFB40AB47D6F76682ACEEE140SESRKESessionContinuationDelegateHandler_delegate, &qword_267F469F8);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC6CarKeyP33_86CE746C1DFB40AB47D6F76682ACEEE140SESRKESessionContinuationDelegateHandler_session);
}

@end