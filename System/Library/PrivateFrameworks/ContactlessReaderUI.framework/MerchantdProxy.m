@interface MerchantdProxy
- (void)closePINUI;
- (void)closePINUIImmediate;
- (void)closeUI;
- (void)closeUIImmediate;
- (void)errorInDaemonWithError:(int64_t)a3;
- (void)pinAuthNeeded;
- (void)pinAuthResultWithError:(id)a3 cancelsFlow:(BOOL)a4;
- (void)pinDataReceivedWithPinData:(id)a3 isCardRequest:(BOOL)a4 isAccessibilityEnabled:(BOOL)a5 accessibilityEntryType:(int64_t)a6 drawNumberFailures:(int64_t)a7;
- (void)pinUIDidLoad;
- (void)pinValidateSession;
- (void)reportGuidanceUpdateWithVisible:(BOOL)a3 trigger:(id)a4;
- (void)reportPINErrorWithError:(int64_t)a3 isCardRequest:(BOOL)a4 isAccessibilityEnabled:(BOOL)a5 accessibilityEntryType:(int64_t)a6 drawNumberFailures:(int64_t)a7;
- (void)reportProxEventInRange:(BOOL)a3 inRangeTime:(unsigned int)a4;
- (void)requiresCardPIN:(id)a3;
- (void)setVoiceOverWithEnabled:(BOOL)a3;
- (void)tapUIDidLoad;
- (void)tapUIFinishedWithExpected:(BOOL)a3 issuerPIN:(BOOL)a4;
- (void)tapUIRequestingCancel;
- (void)tapUIRequestingRetry;
- (void)updateSessionEventWithSessionEvent:(int64_t)a3;
- (void)updateWithTransactionEvent:(int64_t)a3;
- (void)vasReadSuccessWithMerchantNames:(id)a3;
@end

@implementation MerchantdProxy

- (void)tapUIDidLoad
{
  v2 = *(void **)self->remoteProxy;
  if (v2) {
    objc_msgSend(v2, sel_tapUIDidLoad);
  }
}

- (void)tapUIRequestingCancel
{
  v2 = *(void **)self->remoteProxy;
  if (v2) {
    objc_msgSend(v2, sel_tapUIRequestingCancel);
  }
}

- (void)tapUIRequestingRetry
{
  v2 = *(void **)self->remoteProxy;
  if (v2) {
    objc_msgSend(v2, sel_tapUIRequestingRetry);
  }
}

- (void)tapUIFinishedWithExpected:(BOOL)a3 issuerPIN:(BOOL)a4
{
  swift_retain();
  sub_23EE2B20C(a3, a4);
  swift_release();
}

- (void)pinDataReceivedWithPinData:(id)a3 isCardRequest:(BOOL)a4 isAccessibilityEnabled:(BOOL)a5 accessibilityEntryType:(int64_t)a6 drawNumberFailures:(int64_t)a7
{
}

- (void)reportPINErrorWithError:(int64_t)a3 isCardRequest:(BOOL)a4 isAccessibilityEnabled:(BOOL)a5 accessibilityEntryType:(int64_t)a6 drawNumberFailures:(int64_t)a7
{
}

- (void)reportGuidanceUpdateWithVisible:(BOOL)a3 trigger:(id)a4
{
  uint64_t v5 = sub_23EF05418();
  uint64_t v7 = v6;
  swift_retain();
  sub_23EE2B488(a3, v5, v7);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)reportProxEventInRange:(BOOL)a3 inRangeTime:(unsigned int)a4
{
  swift_retain();
  sub_23EE2B880(a3, a4);
  swift_release();
}

- (void)setVoiceOverWithEnabled:(BOOL)a3
{
  v3 = *(void **)self->remoteProxy;
  if (v3) {
    objc_msgSend(v3, sel_setVoiceOverWithEnabled_, a3);
  }
}

- (void)pinUIDidLoad
{
  v2 = *(void **)self->remoteProxy;
  if (v2) {
    objc_msgSend(v2, sel_pinUIDidLoad);
  }
}

- (void)pinValidateSession
{
  v2 = *(void **)self->remoteProxy;
  if (v2) {
    objc_msgSend(v2, sel_pinValidateSession);
  }
}

- (void)pinAuthNeeded
{
  v2 = *(void **)self->remoteProxy;
  if (v2) {
    objc_msgSend(v2, sel_pinAuthNeeded);
  }
}

- (void)pinAuthResultWithError:(id)a3 cancelsFlow:(BOOL)a4
{
  if (a3)
  {
    uint64_t v5 = sub_23EF05418();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  swift_retain();
  sub_23EE2BC98(v5, v7, a4);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)updateWithTransactionEvent:(int64_t)a3
{
  uint64_t v4 = MEMORY[0x2455BFAE0](self->tapUI, a2);
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    swift_retain();
    objc_msgSend(v5, sel_updateWithTransactionEvent_, a3);
    swift_release();
    swift_unknownObjectRelease();
  }
}

- (void)vasReadSuccessWithMerchantNames:(id)a3
{
  sub_23EF05628();
  swift_retain();
  sub_23EE2BE48();
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)closeUI
{
}

- (void)closeUIImmediate
{
}

- (void)requiresCardPIN:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_23EE2C320((uint64_t)v3);

  swift_release();
}

- (void)closePINUI
{
  swift_retain();
  sub_23EE2C560();
  swift_release();
}

- (void)closePINUIImmediate
{
  uint64_t v2 = MEMORY[0x2455BFAE0](self->pinUI, a2);
  if (v2)
  {
    id v3 = (void *)v2;
    swift_retain();
    objc_msgSend(v3, sel_closePINUIImmediate);
    swift_release();
    swift_unknownObjectRelease();
  }
}

- (void)errorInDaemonWithError:(int64_t)a3
{
}

- (void)updateSessionEventWithSessionEvent:(int64_t)a3
{
}

@end