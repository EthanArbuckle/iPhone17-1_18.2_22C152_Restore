@interface CAMFocusLockGestureRecognizer
- (CAMFocusLockGestureRecognizer)init;
- (CAMFocusLockGestureRecognizer)initWithGestureBegan:(id)a3 gestureEnded:(id)a4;
- (void)contactEndedWithAction:(id)a3;
- (void)contactUpdatedWithAction:(id)a3;
@end

@implementation CAMFocusLockGestureRecognizer

- (CAMFocusLockGestureRecognizer)initWithGestureBegan:(id)a3 gestureEnded:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  v8 = _Block_copy(a3);
  v9 = _Block_copy(a4);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v8;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v9;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CAMFocusLockGestureRecognizer_halfPressTimer) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___CAMFocusLockGestureRecognizer_active) = 0;
  v12 = (uint64_t (**)())((char *)self + OBJC_IVAR___CAMFocusLockGestureRecognizer_beganHandler);
  *v12 = sub_10000A904;
  v12[1] = (uint64_t (*)())v10;
  v13 = (uint64_t (**)())((char *)self + OBJC_IVAR___CAMFocusLockGestureRecognizer_endedHandler);
  *v13 = sub_10000A918;
  v13[1] = (uint64_t (*)())v11;
  v15.receiver = self;
  v15.super_class = ObjectType;
  return [(CAMFocusLockGestureRecognizer *)&v15 init];
}

- (void)contactUpdatedWithAction:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000A068(v4);
}

- (void)contactEndedWithAction:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000A778();
}

- (CAMFocusLockGestureRecognizer)init
{
  result = (CAMFocusLockGestureRecognizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CAMFocusLockGestureRecognizer_halfPressTimer);
}

@end