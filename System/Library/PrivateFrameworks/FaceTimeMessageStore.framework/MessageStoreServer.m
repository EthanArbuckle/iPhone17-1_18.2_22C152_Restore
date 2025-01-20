@interface MessageStoreServer
- (_FTMSMessageStoreControllerClientDelegate)delegate;
- (void)addMessage:(id)a3 completion:(id)a4;
- (void)deleteMessagesWithQuery:(id)a3 completion:(id)a4;
- (void)getAccountInfoWithCompletion:(id)a3;
- (void)getMessageCountFor:(id)a3 completion:(id)a4;
- (void)getMessagesWithFetchRequest:(id)a3 completion:(id)a4;
- (void)isTranscriptionEnabledWithCompletion:(id)a3;
- (void)pingWithCompletion:(id)a3;
- (void)saveMessageToPhotoLibraryWithMessageUUID:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)updateMessages:(id)a3 completion:(id)a4;
@end

@implementation MessageStoreServer

- (_FTMSMessageStoreControllerClientDelegate)delegate
{
  swift_retain();
  v2 = (void *)sub_24DEA8FE4();
  swift_release();
  return (_FTMSMessageStoreControllerClientDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  swift_retain();
  sub_24DEA90C4();
  swift_release();
}

- (void)pingWithCompletion:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  swift_retain();
  sub_24DEA915C((uint64_t)sub_24DEAD2E4, v4);
  swift_release();
  swift_release();
}

- (void)addMessage:(id)a3 completion:(id)a4
{
}

- (void)getMessagesWithFetchRequest:(id)a3 completion:(id)a4
{
}

- (void)deleteMessagesWithQuery:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  id v7 = a3;
  swift_retain();
  sub_24DEAA404(v7, (uint64_t)sub_24DEAD2E4, v6);

  swift_release();
  swift_release();
}

- (void)getMessageCountFor:(id)a3 completion:(id)a4
{
}

- (void)updateMessages:(id)a3 completion:(id)a4
{
  uint64_t v4 = _Block_copy(a4);
  type metadata accessor for MessageUpdate();
  uint64_t v5 = sub_24DF1EEE0();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v4;
  swift_retain();
  sub_24DEAB260(v5, (uint64_t)sub_24DEAD2E4, v6);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)saveMessageToPhotoLibraryWithMessageUUID:(id)a3 completion:(id)a4
{
  uint64_t v5 = sub_24DF1E630();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  sub_24DF1E610();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  swift_retain();
  sub_24DEAB734((uint64_t)v8, (uint64_t)sub_24DEACC94, v10);
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)isTranscriptionEnabledWithCompletion:(id)a3
{
}

- (void)getAccountInfoWithCompletion:(id)a3
{
}

@end