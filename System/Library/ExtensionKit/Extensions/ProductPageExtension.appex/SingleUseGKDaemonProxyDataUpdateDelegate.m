@interface SingleUseGKDaemonProxyDataUpdateDelegate
- (_TtC20ProductPageExtensionP33_450B634D436B86263B9E02C5925CFEE140SingleUseGKDaemonProxyDataUpdateDelegate)init;
- (void)dealloc;
- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4;
@end

@implementation SingleUseGKDaemonProxyDataUpdateDelegate

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  uint64_t v6 = sub_10077BB40();
  if (*(_DWORD *)((char *)&self->super.isa
                 + OBJC_IVAR____TtC20ProductPageExtensionP33_450B634D436B86263B9E02C5925CFEE140SingleUseGKDaemonProxyDataUpdateDelegate_updateType) == a3)
  {
    v7 = *(uint64_t (**)(uint64_t))((char *)&self->super.isa
                                           + OBJC_IVAR____TtC20ProductPageExtensionP33_450B634D436B86263B9E02C5925CFEE140SingleUseGKDaemonProxyDataUpdateDelegate_updateBlock);
    v8 = self;
    uint64_t v9 = v7(v6);
    (*(void (**)(uint64_t))((char *)&v8->super.isa
                                    + OBJC_IVAR____TtC20ProductPageExtensionP33_450B634D436B86263B9E02C5925CFEE140SingleUseGKDaemonProxyDataUpdateDelegate_cleanupBlock))(v9);
  }

  swift_bridgeObjectRelease();
}

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = [v3 daemonProxy];
  [v5 removeDataUpdateDelegate:v4];

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for SingleUseGKDaemonProxyDataUpdateDelegate();
  [(SingleUseGKDaemonProxyDataUpdateDelegate *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

- (_TtC20ProductPageExtensionP33_450B634D436B86263B9E02C5925CFEE140SingleUseGKDaemonProxyDataUpdateDelegate)init
{
  result = (_TtC20ProductPageExtensionP33_450B634D436B86263B9E02C5925CFEE140SingleUseGKDaemonProxyDataUpdateDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end