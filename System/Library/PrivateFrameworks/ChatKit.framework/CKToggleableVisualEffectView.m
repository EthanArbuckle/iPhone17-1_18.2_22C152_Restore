@interface CKToggleableVisualEffectView
- (BOOL)isEffectActive;
- (CKToggleableVisualEffectView)initWithCoder:(id)a3;
- (CKToggleableVisualEffectView)initWithEffect:(id)a3;
- (void)setIsEffectActive:(BOOL)a3;
@end

@implementation CKToggleableVisualEffectView

- (BOOL)isEffectActive
{
  v2 = (BOOL *)self + OBJC_IVAR___CKToggleableVisualEffectView_isEffectActive;
  swift_beginAccess();
  return *v2;
}

- (void)setIsEffectActive:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (char *)self + OBJC_IVAR___CKToggleableVisualEffectView_isEffectActive;
  swift_beginAccess();
  id v6 = 0;
  unsigned char *v5 = v3;
  if (v3) {
    id v6 = objc_retain(*(id *)((char *)&self->super.super.super.super.isa
  }
                           + OBJC_IVAR___CKToggleableVisualEffectView_toggleableEffect));
  v7 = self;
  [(CKToggleableVisualEffectView *)v7 setEffect:v6];
}

- (CKToggleableVisualEffectView)initWithEffect:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR___CKToggleableVisualEffectView_isEffectActive) = 1;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CKToggleableVisualEffectView_toggleableEffect) = (Class)a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ToggleableVisualEffectView();
  return [(CKToggleableVisualEffectView *)&v5 initWithEffect:a3];
}

- (CKToggleableVisualEffectView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR___CKToggleableVisualEffectView_isEffectActive) = 1;
  id v4 = a3;

  result = (CKToggleableVisualEffectView *)sub_18F7BA5D0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CKToggleableVisualEffectView_toggleableEffect));
}

@end