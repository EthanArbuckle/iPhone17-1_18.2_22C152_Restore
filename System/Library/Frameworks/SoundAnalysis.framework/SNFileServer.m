@interface SNFileServer
- (SNFileServer)init;
- (SNFileServer)initWithRootDirectory:(id)a3;
- (void)activateWithCompletion:(id)a3;
@end

@implementation SNFileServer

- (SNFileServer)initWithRootDirectory:(id)a3
{
  uint64_t v3 = sub_1DCB87938();
  return (SNFileServer *)sub_1DCA08A20(v3, v4);
}

- (void)activateWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  v6 = self;

  sub_1DCA0BA74((uint64_t)&unk_1EAAA4910, v5);
}

- (SNFileServer)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end