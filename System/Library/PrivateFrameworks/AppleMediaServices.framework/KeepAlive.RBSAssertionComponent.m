@interface KeepAlive.RBSAssertionComponent
- (_TtCV18AppleMediaServices9KeepAliveP33_8D5EA5EE57B6E86A66C300315FB9941621RBSAssertionComponent)init;
- (void)assertion:(id)a3 didInvalidateWithError:(id)a4;
- (void)assertionWillInvalidate:(id)a3;
@end

@implementation KeepAlive.RBSAssertionComponent

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV18AppleMediaServices9KeepAliveP33_8D5EA5EE57B6E86A66C300315FB9941621RBSAssertionComponent_assertion));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCV18AppleMediaServices9KeepAliveP33_8D5EA5EE57B6E86A66C300315FB9941621RBSAssertionComponent_invalidationHandler);
  sub_18D678EAC(v3);
}

- (_TtCV18AppleMediaServices9KeepAliveP33_8D5EA5EE57B6E86A66C300315FB9941621RBSAssertionComponent)init
{
  return (_TtCV18AppleMediaServices9KeepAliveP33_8D5EA5EE57B6E86A66C300315FB9941621RBSAssertionComponent *)sub_18D67BD58();
}

- (void)assertionWillInvalidate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18D7C67FC(v4);
}

- (void)assertion:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  sub_18D7C6CA0(v6, (uint64_t)a4);
}

@end