@interface CKCatchUpButtonManager
- (UIViewController)catchUpButtonHost;
- (_TtC7ChatKit22CKCatchUpButtonManager)init;
- (_TtC7ChatKit22CKCatchUpButtonManager)initWithDidTapButton:(id)a3;
- (void)animateInResumingFromBackground:(BOOL)a3;
- (void)animateOutWithCompletion:(id)a3;
@end

@implementation CKCatchUpButtonManager

- (UIViewController)catchUpButtonHost
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtC7ChatKit22CKCatchUpButtonManager_catchUpButtonHost));
}

- (_TtC7ChatKit22CKCatchUpButtonManager)initWithDidTapButton:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  return (_TtC7ChatKit22CKCatchUpButtonManager *)CKCatchUpButtonManager.init(didTapButton:)((uint64_t)sub_18F75ABCC, v4);
}

- (void)animateInResumingFromBackground:(BOOL)a3
{
  uint64_t v4 = self;
  sub_18F7594CC(a3);
}

- (void)animateOutWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  if (v4)
  {
    *(void *)(swift_allocObject() + 16) = v4;
    v5 = sub_18F75AAC0;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  sub_18F7598A4((uint64_t)v5);
  sub_18EF6E880((uint64_t)v5);
}

- (_TtC7ChatKit22CKCatchUpButtonManager)init
{
  result = (_TtC7ChatKit22CKCatchUpButtonManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end