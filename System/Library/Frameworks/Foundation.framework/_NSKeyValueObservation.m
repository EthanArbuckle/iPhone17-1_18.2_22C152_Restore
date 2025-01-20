@interface _NSKeyValueObservation
- (_NSKeyValueObservation)init;
- (void)dealloc;
- (void)invalidate;
@end

@implementation _NSKeyValueObservation

- (void)dealloc
{
  v3 = (void *)MEMORY[0x185309640]((char *)self + OBJC_IVAR____NSKeyValueObservation_helper, a2);
  v4 = self;
  if (v3)
  {
    NSKeyValueObservation.Helper.invalidate()();
  }
  swift_unknownObjectWeakAssign();
  v5.receiver = v4;
  v5.super_class = (Class)type metadata accessor for NSKeyValueObservation();
  [(_NSKeyValueObservation *)&v5 dealloc];
}

- (void).cxx_destruct
{
}

- (void)invalidate
{
  v3 = (void *)MEMORY[0x185309640]((char *)self + OBJC_IVAR____NSKeyValueObservation_helper, a2);
  v4 = self;
  if (v3)
  {
    NSKeyValueObservation.Helper.invalidate()();
  }
  swift_unknownObjectWeakAssign();
}

- (_NSKeyValueObservation)init
{
  result = (_NSKeyValueObservation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end