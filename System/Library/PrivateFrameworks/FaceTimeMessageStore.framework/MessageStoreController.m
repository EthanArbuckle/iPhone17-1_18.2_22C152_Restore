@interface MessageStoreController
- (void)messageStoreAccountInfoDidChange:(id)a3;
- (void)messageStoreDidAddMessages:(id)a3;
- (void)messageStoreDidDeleteMessages:(id)a3;
- (void)messageStoreDidDeleteMessagesWithUUIDs:(id)a3;
- (void)messageStoreDidReconnect;
- (void)messageStoreDidUpdateMessages:(id)a3;
- (void)messageStoreRequiresRefetch;
@end

@implementation MessageStoreController

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
  id v3 = a3;
  swift_retain();
  MessageStoreController.messageStoreAccountInfoDidChange(_:)(v3);

  swift_release();
}

- (void)messageStoreDidReconnect
{
}

- (void)messageStoreRequiresRefetch
{
}

@end