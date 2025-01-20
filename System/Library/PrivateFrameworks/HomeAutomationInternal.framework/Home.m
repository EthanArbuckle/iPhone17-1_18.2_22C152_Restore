@interface Home
- (id)copyWithZone:(void *)a3;
@end

@implementation Home

- (id)copyWithZone:(void *)a3
{
  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC22HomeAutomationInternal4Home_delegate);
  type metadata accessor for Home();
  v4 = (void *)swift_allocObject();
  sub_22E204FAC(v3);
  return v4;
}

@end