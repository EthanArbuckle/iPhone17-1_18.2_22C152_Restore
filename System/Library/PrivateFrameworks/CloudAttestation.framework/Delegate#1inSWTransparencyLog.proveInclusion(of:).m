@interface Delegate#1inSWTransparencyLog.proveInclusion(of:)
- (_TtCFV16CloudAttestation17SWTransparencyLog14proveInclusionFzZT2ofVS_7Release_VS_21TransparencyLogProofsL_8Delegate)init;
- (void)URLSession:()of: didReceiveChallenge:completionHandler:;
@end

@implementation Delegate#1inSWTransparencyLog.proveInclusion(of:)

- (void)URLSession:()of: didReceiveChallenge:completionHandler:
{
  v8 = _Block_copy(a5);
  uint64_t v9 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCFV16CloudAttestation17SWTransparencyLog14proveInclusionFzZT2ofVS_7Release_VS_21TransparencyLogProofsL_8Delegate_credential);
  v10 = (void (*)(void *, void, uint64_t))v8[2];
  id v11 = a3;
  id v12 = a4;
  v13 = self;
  v10(v8, 0, v9);
  _Block_release(v8);
}

- (_TtCFV16CloudAttestation17SWTransparencyLog14proveInclusionFzZT2ofVS_7Release_VS_21TransparencyLogProofsL_8Delegate)init
{
  result = (_TtCFV16CloudAttestation17SWTransparencyLog14proveInclusionFzZT2ofVS_7Release_VS_21TransparencyLogProofsL_8Delegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCFV16CloudAttestation17SWTransparencyLog14proveInclusionFzZT2ofVS_7Release_VS_21TransparencyLogProofsL_8Delegate_credential));
}

@end