@interface CCUISConfiguredControl
- (CCUISConfiguredControl)init;
- (CCUISConfiguredControl)initWithIdentity:(id)a3 type:(unint64_t)a4;
- (CCUISConfiguredControl)initWithIdentity:(id)a3 type:(unint64_t)a4 size:(unint64_t)a5;
- (CHSControlIdentity)identity;
- (NSString)description;
- (unint64_t)size;
- (unint64_t)type;
@end

@implementation CCUISConfiguredControl

- (CHSControlIdentity)identity
{
  return (CHSControlIdentity *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR___CCUISConfiguredControl_identity));
}

- (unint64_t)type
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___CCUISConfiguredControl_type);
}

- (unint64_t)size
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___CCUISConfiguredControl_size);
}

- (CCUISConfiguredControl)initWithIdentity:(id)a3 type:(unint64_t)a4
{
  return [(CCUISConfiguredControl *)self initWithIdentity:a3 type:a4 size:0];
}

- (CCUISConfiguredControl)initWithIdentity:(id)a3 type:(unint64_t)a4 size:(unint64_t)a5
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CCUISConfiguredControl_identity) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CCUISConfiguredControl_type) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CCUISConfiguredControl_size) = (Class)a5;
  v7.receiver = self;
  v7.super_class = (Class)CCUISConfiguredControl;
  id v5 = a3;
  return [(CCUISConfiguredControl *)&v7 init];
}

- (NSString)description
{
  v2 = self;
  CCUISConfiguredControl.description.getter();

  v3 = (void *)sub_24A7DCA10();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (CCUISConfiguredControl)init
{
  result = (CCUISConfiguredControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end