@interface BLTBulletinSendQueueAttachmentSender
- (BLTBulletinSendQueueAttachmentSender)init;
- (BOOL)sendAttachmentsWithSender:(id)a3 timeout:(id)a4 completion:(id)a5;
- (void)addAttachment:(id)a3 key:(id)a4;
@end

@implementation BLTBulletinSendQueueAttachmentSender

- (BLTBulletinSendQueueAttachmentSender)init
{
  v6.receiver = self;
  v6.super_class = (Class)BLTBulletinSendQueueAttachmentSender;
  v2 = [(BLTBulletinSendQueueAttachmentSender *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    urls = v2->_urls;
    v2->_urls = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)addAttachment:(id)a3 key:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v7 = a3;
    v8 = objc_alloc_init(BLTBulletinSendQueueAttachmentInfo);
    [(BLTBulletinSendQueueAttachmentInfo *)v8 setUrl:v7];

    [(BLTBulletinSendQueueAttachmentInfo *)v8 setKey:v6];
    [(NSMutableArray *)self->_urls addObject:v8];
  }
}

- (BOOL)sendAttachmentsWithSender:(id)a3 timeout:(id)a4 completion:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(NSMutableArray *)self->_urls count];
  if (v11)
  {
    uint64_t v23 = v11;
    v12 = [MEMORY[0x263EFF9A0] dictionary];
    [v12 setIdsMetadataFileURLType:1];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v24 = self;
    obj = self->_urls;
    uint64_t v13 = [(NSMutableArray *)obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(obj);
          }
          v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v18 = [v17 key];
          [v12 setIdsMetadataFileKey:v18];

          v19 = [v17 url];
          v20 = (void *)[v12 copy];
          v26[0] = MEMORY[0x263EF8330];
          v26[1] = 3221225472;
          v26[2] = __85__BLTBulletinSendQueueAttachmentSender_sendAttachmentsWithSender_timeout_completion___block_invoke;
          v26[3] = &unk_2646841B8;
          id v27 = v10;
          [v8 sendFileURL:v19 withTimeout:v9 extraMetadata:v20 responseHandlers:0 didSend:v26 didQueue:0];
        }
        uint64_t v14 = [(NSMutableArray *)obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v14);
    }

    [(NSMutableArray *)v24->_urls removeAllObjects];
    uint64_t v11 = v23;
  }
  BOOL v21 = v11 != 0;

  return v21;
}

uint64_t __85__BLTBulletinSendQueueAttachmentSender_sendAttachmentsWithSender_timeout_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void).cxx_destruct
{
}

@end