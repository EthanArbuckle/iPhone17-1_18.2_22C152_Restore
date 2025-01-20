@interface CCUIGamePolicyProxy
- (_TtC15ControlCenterUIP33_5C556405AB7AB4F2600F1BC1CA1813A619CCUIGamePolicyProxy)init;
- (void)dealloc;
@end

@implementation CCUIGamePolicyProxy

- (_TtC15ControlCenterUIP33_5C556405AB7AB4F2600F1BC1CA1813A619CCUIGamePolicyProxy)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC15ControlCenterUIP33_5C556405AB7AB4F2600F1BC1CA1813A619CCUIGamePolicyProxy__connection) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CCUIGamePolicyProxy();
  return [(CCUIGamePolicyProxy *)&v3 init];
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC15ControlCenterUIP33_5C556405AB7AB4F2600F1BC1CA1813A619CCUIGamePolicyProxy__connection);
  objc_super v3 = self;
  objc_msgSend(v2, sel_invalidate);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for CCUIGamePolicyProxy();
  [(CCUIGamePolicyProxy *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ControlCenterUIP33_5C556405AB7AB4F2600F1BC1CA1813A619CCUIGamePolicyProxy__connection));
}

@end