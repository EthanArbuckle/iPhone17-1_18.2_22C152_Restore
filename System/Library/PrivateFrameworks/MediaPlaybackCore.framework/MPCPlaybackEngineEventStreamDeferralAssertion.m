@interface MPCPlaybackEngineEventStreamDeferralAssertion
@end

@implementation MPCPlaybackEngineEventStreamDeferralAssertion

void __90___MPCPlaybackEngineEventStreamDeferralAssertion_initWithEventStream_type_reason_timeout___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained invalidate];
  }
}

@end