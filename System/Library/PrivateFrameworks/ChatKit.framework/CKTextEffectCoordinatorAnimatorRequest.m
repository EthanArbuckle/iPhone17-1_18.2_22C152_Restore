@interface CKTextEffectCoordinatorAnimatorRequest
- (CKTextEffectCoordinatorAnimatorRequest)init;
- (UITextView)textView;
- (_NSTextAnimation)animation;
@end

@implementation CKTextEffectCoordinatorAnimatorRequest

- (UITextView)textView
{
  return (UITextView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR___CKTextEffectCoordinatorAnimatorRequest_textView));
}

- (_NSTextAnimation)animation
{
  v2 = (void *)swift_unknownObjectRetain();

  return (_NSTextAnimation *)v2;
}

- (CKTextEffectCoordinatorAnimatorRequest)init
{
  result = (CKTextEffectCoordinatorAnimatorRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end