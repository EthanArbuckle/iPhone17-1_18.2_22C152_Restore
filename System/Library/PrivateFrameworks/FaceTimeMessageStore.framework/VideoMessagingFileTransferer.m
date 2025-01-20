@interface VideoMessagingFileTransferer
- (_TtC20FaceTimeMessageStore28VideoMessagingFileTransferer)init;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 pendingResourceWithMetadata:(id)a5 fromID:(id)a6 acknowledgementBlock:(id)a7 context:(id)a8;
@end

@implementation VideoMessagingFileTransferer

- (_TtC20FaceTimeMessageStore28VideoMessagingFileTransferer)init
{
}

- (void).cxx_destruct
{
  sub_24DE2A720((uint64_t)self + OBJC_IVAR____TtC20FaceTimeMessageStore28VideoMessagingFileTransferer_incomingDelegate);
  sub_24DE2A720((uint64_t)self + OBJC_IVAR____TtC20FaceTimeMessageStore28VideoMessagingFileTransferer_outgoingDelegate);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC20FaceTimeMessageStore28VideoMessagingFileTransferer_service);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC20FaceTimeMessageStore28VideoMessagingFileTransferer_serverBag);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20FaceTimeMessageStore28VideoMessagingFileTransferer_queue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20FaceTimeMessageStore28VideoMessagingFileTransferer_transactionLock));
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1A6230);
  MEMORY[0x270FA5388](v15 - 8);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    sub_24DF1E3A0();
    uint64_t v18 = sub_24DF1E400();
    uint64_t v19 = 0;
  }
  else
  {
    uint64_t v18 = sub_24DF1E400();
    uint64_t v19 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v17, v19, 1, v18);
  if (a6) {
    a6 = (id)sub_24DF1EC00();
  }
  if (a7)
  {
    unint64_t v20 = sub_24DF1ECE0();
    a7 = v21;
  }
  else
  {
    unint64_t v20 = 0;
  }
  id v22 = a3;
  id v23 = a4;
  id v24 = a8;
  v25 = self;
  sub_24DE7CAD8((uint64_t)v25, v26, (uint64_t)v17, a6, v20, a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24DE2E158((uint64_t)v17, (uint64_t *)&unk_26B1A6230);
}

- (void)service:(id)a3 account:(id)a4 pendingResourceWithMetadata:(id)a5 fromID:(id)a6 acknowledgementBlock:(id)a7 context:(id)a8
{
  v14 = _Block_copy(a7);
  if (a5) {
    a5 = (id)sub_24DF1EC00();
  }
  if (a6)
  {
    unint64_t v15 = sub_24DF1ECE0();
    a6 = v16;
    if (v14)
    {
LABEL_5:
      uint64_t v17 = swift_allocObject();
      *(void *)(v17 + 16) = v14;
      v14 = sub_24DE8003C;
      goto LABEL_8;
    }
  }
  else
  {
    unint64_t v15 = 0;
    if (v14) {
      goto LABEL_5;
    }
  }
  uint64_t v17 = 0;
LABEL_8:
  id v18 = a3;
  id v19 = a4;
  id v20 = a8;
  v21 = self;
  sub_24DE7E278((uint64_t)v21, v22, (uint64_t)a5, v15, (unint64_t)a6, (uint64_t)v14, v17, a8);
  sub_24DE4ED98((uint64_t)v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  BOOL v10 = a6;
  if (a5)
  {
    uint64_t v14 = sub_24DF1ECE0();
    uint64_t v16 = v15;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v16 = 0;
  }
  id v17 = a3;
  id v18 = a4;
  id v19 = a7;
  id v20 = a8;
  v21 = self;
  sub_24DE7EE44((uint64_t)v21, v22, v14, v16, v10, a7);

  swift_bridgeObjectRelease();
}

@end