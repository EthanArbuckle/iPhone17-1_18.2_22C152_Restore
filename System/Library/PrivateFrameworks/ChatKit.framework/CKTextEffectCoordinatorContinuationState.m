@interface CKTextEffectCoordinatorContinuationState
- (CKTextEffectCoordinatorContinuationState)init;
- (CKTextEffectCoordinatorContinuationState)initWithTextViewIdentifier:(id)a3 locationInAttributedText:(int64_t)a4 ignoreTextViewEligibilityCheck:(BOOL)a5;
- (NSString)debugDescription;
@end

@implementation CKTextEffectCoordinatorContinuationState

- (CKTextEffectCoordinatorContinuationState)initWithTextViewIdentifier:(id)a3 locationInAttributedText:(int64_t)a4 ignoreTextViewEligibilityCheck:(BOOL)a5
{
  uint64_t v8 = sub_18F7B97E0();
  v9 = (uint64_t *)((char *)self + OBJC_IVAR___CKTextEffectCoordinatorContinuationState_textViewIdentifier);
  uint64_t *v9 = v8;
  v9[1] = v10;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKTextEffectCoordinatorContinuationState_locationInAttributedText) = (Class)a4;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___CKTextEffectCoordinatorContinuationState_ignoreTextViewEligibilityCheck) = a5;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for CKTextEffectCoordinator.ContinuationState();
  return [(CKTextEffectCoordinatorContinuationState *)&v12 init];
}

- (CKTextEffectCoordinatorContinuationState)init
{
  result = (CKTextEffectCoordinatorContinuationState *)sub_18F7BA5D0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (NSString)debugDescription
{
  v2 = self;
  CKTextEffectCoordinator.ContinuationState.debugDescription.getter();

  v3 = (void *)sub_18F7B97A0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

@end