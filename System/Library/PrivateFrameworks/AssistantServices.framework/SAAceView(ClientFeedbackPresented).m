@interface SAAceView(ClientFeedbackPresented)
- (uint64_t)_af_dialogIdentifier;
- (uint64_t)_af_dialogPhase;
- (void)_af_enumerateClientFeedbackDetails:()ClientFeedbackPresented;
@end

@implementation SAAceView(ClientFeedbackPresented)

- (void)_af_enumerateClientFeedbackDetails:()ClientFeedbackPresented
{
  v4 = a3;
  if (v4)
  {
    v5 = objc_msgSend(a1, "_af_dialogPhase");
    v6 = objc_msgSend(a1, "_af_dialogIdentifier");
    v7 = [a1 aceId];
    v8 = [a1 encodedClassName];
    v9 = [a1 listenAfterSpeaking];
    char v10 = [v9 BOOLValue];

    if (v5 || v6 || v7)
    {
      v12[0] = v7;
      v12[1] = v8;
      v12[3] = v6;
      v12[2] = v5;
      char v13 = v10;
      __copy_constructor_8_8_s0_s8_s16_s24_t32w1((uint64_t)v11, (uint64_t)v12);
      v4[2](v4, v11);
      __destructor_8_s0_s8_s16_s24((uint64_t)v12);
    }
  }
}

- (uint64_t)_af_dialogIdentifier
{
  return 0;
}

- (uint64_t)_af_dialogPhase
{
  return 0;
}

@end