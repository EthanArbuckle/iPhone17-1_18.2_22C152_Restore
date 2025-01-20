@interface TerminateAssertion
- (_TtC10CoreAuthUI18TerminateAssertion)init;
- (void)dealloc;
@end

@implementation TerminateAssertion

- (_TtC10CoreAuthUI18TerminateAssertion)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10CoreAuthUI18TerminateAssertion_completion);
  void *v4 = 0;
  v4[1] = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(TerminateAssertion *)&v6 init];
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10CoreAuthUI18TerminateAssertion_completion);
  v5 = *(void (**)(_TtC10CoreAuthUI18TerminateAssertion *))((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtC10CoreAuthUI18TerminateAssertion_completion);
  if (v5)
  {
    objc_super v6 = self;
    sub_100029A94((uint64_t)v5);
    v5(v6);
    sub_10002A998((uint64_t)v5);
    uint64_t v7 = *v4;
    uint64_t *v4 = 0;
    v4[1] = 0;
    sub_10002A998(v7);
  }
  else
  {
    v8 = self;
  }
  v9.receiver = self;
  v9.super_class = ObjectType;
  [(TerminateAssertion *)&v9 dealloc];
}

- (void).cxx_destruct
{
}

@end