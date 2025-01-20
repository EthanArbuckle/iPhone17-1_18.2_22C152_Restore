@interface CLUIServer
+ (id)possibleRequiredEntitlementsForProcessingMessageWithIdentifier:(int64_t)a3;
+ (id)sharedInstance;
- (BOOL)messageWithIdentifierShouldBeProcessedAsynchronously:(int64_t)a3;
- (BOOL)shouldAllowMultipleEntryAttemptsForPasscodeViewController:(id)a3;
- (BOOL)shouldShowCancelButtonForPasscodeViewController:(id)a3;
- (CLUIServer)init;
- (id)processMessage:(id)a3 withIdentifier:(int64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6;
- (int64_t)activeInterfaceOrientationForPasscodeViewController:(id)a3;
- (void)passcodeViewController:(id)a3 isPasscode:(id)a4 correctWithCompletionHandler:(id)a5;
- (void)passcodeViewController:(id)a3 passcodeViewIsVisible:(BOOL)a4;
- (void)passcodeViewController:(id)a3 wasDismissedWithReason:(int64_t)a4;
- (void)processMessageAsynchronously:(id)a3 withIdentifier:(int64_t)a4 fromClientWithIdentifier:(id)a5 completion:(id)a6;
@end

@implementation CLUIServer

+ (id)sharedInstance
{
  if (qword_18BE0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_19058;

  return v2;
}

- (id)processMessage:(id)a3 withIdentifier:(int64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6
{
  if (a3) {
    sub_FDF0();
  }
  if (AXTripleClickAttemptToEnterClarityBoardMessageIdentifier == a4)
  {
    v9 = self;
    sub_BCFC();
    sub_41A4((uint64_t)&_swiftEmptyArrayStorage);
    swift_bridgeObjectRelease();

    v10.super.isa = sub_FDE0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_F7D4();
    swift_allocError();
    swift_willThrow();
    swift_bridgeObjectRelease();
    if (a6)
    {
      v11 = (void *)sub_FBE0();
      swift_errorRelease();
      id v12 = v11;
      v10.super.isa = 0;
      *a6 = v11;
    }
    else
    {
      swift_errorRelease();
      v10.super.isa = 0;
    }
  }

  return v10.super.isa;
}

- (BOOL)messageWithIdentifierShouldBeProcessedAsynchronously:(int64_t)a3
{
  return CLFUpdateAppIconsMessageIdentifier == a3;
}

- (void)processMessageAsynchronously:(id)a3 withIdentifier:(int64_t)a4 fromClientWithIdentifier:(id)a5 completion:(id)a6
{
  v9 = _Block_copy(a6);
  if (a3) {
    sub_FDF0();
  }
  _Block_copy(v9);
  NSDictionary v10 = self;
  sub_EA44(a4, v10, (void (**)(void, void, void))v9);
  _Block_release(v9);
  _Block_release(v9);

  swift_bridgeObjectRelease();
}

+ (id)possibleRequiredEntitlementsForProcessingMessageWithIdentifier:(int64_t)a3
{
  if (sub_ED48(a3))
  {
    v3.super.isa = sub_FF10().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v3.super.isa = 0;
  }

  return v3.super.isa;
}

- (BOOL)shouldShowCancelButtonForPasscodeViewController:(id)a3
{
  return 1;
}

- (void)passcodeViewController:(id)a3 passcodeViewIsVisible:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_F088(a4);
}

- (void)passcodeViewController:(id)a3 wasDismissedWithReason:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_F2B4(a4);
}

- (void)passcodeViewController:(id)a3 isPasscode:(id)a4 correctWithCompletionHandler:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = sub_FE50();
  uint64_t v10 = v9;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v7;
  id v12 = a3;
  v13 = self;
  sub_F5A0(v8, v10, (uint64_t)sub_E024, v11);

  swift_bridgeObjectRelease();

  swift_release();
}

- (int64_t)activeInterfaceOrientationForPasscodeViewController:(id)a3
{
  v5 = self;
  id v6 = a3;
  v7 = self;
  int64_t result = (int64_t)[v5 sharedDisplayManager];
  if (result)
  {
    uint64_t v9 = (void *)result;
    id v10 = [(id)result activeInterfaceOrientation];

    return (int64_t)v10;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (BOOL)shouldAllowMultipleEntryAttemptsForPasscodeViewController:(id)a3
{
  return 1;
}

- (CLUIServer)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CLUIServer_presentingViewController) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___CLUIServer_isShowingLoadingView) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(CLUIServer *)&v5 init];
}

- (void).cxx_destruct
{
}

@end