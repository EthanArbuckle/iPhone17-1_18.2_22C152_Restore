@interface MessageStoreControllerXPCClient
- (void)messageStoreAccountInfoDidChange:(id)a3;
- (void)messageStoreDidAddMessages:(id)a3;
- (void)messageStoreDidDeleteMessages:(id)a3;
- (void)messageStoreDidDeleteMessagesWithUUIDs:(id)a3;
- (void)messageStoreDidUpdateMessages:(id)a3;
- (void)messageStoreRequiresRefetch;
@end

@implementation MessageStoreControllerXPCClient

- (void)messageStoreDidAddMessages:(id)a3
{
}

- (void)messageStoreDidUpdateMessages:(id)a3
{
}

- (void)messageStoreDidDeleteMessages:(id)a3
{
}

- (void)messageStoreDidDeleteMessagesWithUUIDs:(id)a3
{
  sub_24DF1E630();
  uint64_t v4 = sub_24DF1EEE0();
  v5 = self;
  v6.i64[0] = 0x8002200010002;
  sub_24DE26F50(v6, v4, MEMORY[0x263F07508], "MessageStoreControllerXPCClient: Received deletions from host with messages: %{public}s", (SEL *)&selRef_messageStoreDidDeleteMessagesWithUUIDs_);

  swift_bridgeObjectRelease();
}

- (void)messageStoreAccountInfoDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24DE27218();
}

- (void)messageStoreRequiresRefetch
{
  v2 = self;
  sub_24DE275E4();
}

@end