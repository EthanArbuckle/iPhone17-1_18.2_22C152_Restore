@interface XPCCaller
- (_TtC25CloudSubscriptionFeatures9XPCCaller)init;
- (void)dealloc;
@end

@implementation XPCCaller

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25CloudSubscriptionFeatures9XPCCaller____lazy_storage___connection));
}

- (_TtC25CloudSubscriptionFeatures9XPCCaller)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC25CloudSubscriptionFeatures9XPCCaller____lazy_storage___connection) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(XPCCaller *)&v5 init];
}

- (void)dealloc
{
  v2 = self;
  sub_1A8C85514();
}

@end