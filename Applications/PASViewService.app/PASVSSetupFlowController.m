@interface PASVSSetupFlowController
- (void)activateClientConnection;
- (void)enableManualPairing;
- (void)handleScannedCode:(id)a3;
- (void)initiateClientConnectionIfEligible;
- (void)invalidateClientConnection;
@end

@implementation PASVSSetupFlowController

- (void)initiateClientConnectionIfEligible
{
}

- (void)activateClientConnection
{
}

- (void)handleScannedCode:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = v4;
  swift_retain();
  v6._countAndFlagsBits = v3;
  v6._object = v5;
  PASVSSetupFlowController.handleScannedCode(_:)(v6);
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)enableManualPairing
{
}

- (void)invalidateClientConnection
{
}

@end