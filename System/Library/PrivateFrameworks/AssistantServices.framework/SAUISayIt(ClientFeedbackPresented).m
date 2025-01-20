@interface SAUISayIt(ClientFeedbackPresented)
- (void)_af_enumerateClientFeedbackDetails:()ClientFeedbackPresented;
@end

@implementation SAUISayIt(ClientFeedbackPresented)

- (void)_af_enumerateClientFeedbackDetails:()ClientFeedbackPresented
{
  v4 = a3;
  if (v4)
  {
    v7[0] = [a1 aceId];
    v7[1] = [a1 encodedClassName];
    v7[2] = 0;
    uint64_t v8 = [a1 dialogIdentifier];
    v5 = [a1 listenAfterSpeaking];
    char v9 = [v5 BOOLValue];

    if (v7[0] | v8)
    {
      __copy_constructor_8_8_s0_s8_s16_s24_t32w1((uint64_t)v6, (uint64_t)v7);
      v4[2](v4, v6);
    }
    __destructor_8_s0_s8_s16_s24((uint64_t)v7);
  }
}

@end