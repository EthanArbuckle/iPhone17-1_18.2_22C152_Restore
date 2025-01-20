@interface MessageStoreProviderServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC20FaceTimeMessageStore35MessageStoreProviderServiceDelegate)init;
- (void)messageStoreAccountInfoDidChange:(id)a3;
- (void)messageStoreDidAddMessages:(id)a3;
- (void)messageStoreDidDeleteMessages:(id)a3;
- (void)messageStoreDidDeleteMessagesWithUUIDs:(id)a3;
- (void)messageStoreDidUpdateMessages:(id)a3;
- (void)messageStoreRequiresRefetch;
@end

@implementation MessageStoreProviderServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  v7 = a4;
  v8 = self;
  char v9 = sub_24DEAE4A0((uint64_t)v8, v7);

  return v9 & 1;
}

- (_TtC20FaceTimeMessageStore35MessageStoreProviderServiceDelegate)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20FaceTimeMessageStore35MessageStoreProviderServiceDelegate_listener));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20FaceTimeMessageStore35MessageStoreProviderServiceDelegate_connectionsQueue));
  swift_release();
}

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
}

- (void)messageStoreAccountInfoDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  MessageStoreProviderServiceDelegate.messageStoreAccountInfoDidChange(_:)((uint64_t)v4);
}

- (void)messageStoreRequiresRefetch
{
  v2 = self;
  MessageStoreProviderServiceDelegate.messageStoreRequiresRefetch()();
}

@end