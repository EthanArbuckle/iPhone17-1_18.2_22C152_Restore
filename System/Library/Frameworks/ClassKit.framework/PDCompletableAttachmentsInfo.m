@interface PDCompletableAttachmentsInfo
- (PDCompletableAttachmentsInfo)init;
@end

@implementation PDCompletableAttachmentsInfo

- (PDCompletableAttachmentsInfo)init
{
  v12.receiver = self;
  v12.super_class = (Class)PDCompletableAttachmentsInfo;
  v2 = [(PDCompletableAttachmentsInfo *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    handoutIDs = v2->_handoutIDs;
    v2->_handoutIDs = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    handoutAttachmentIDs = v2->_handoutAttachmentIDs;
    v2->_handoutAttachmentIDs = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    attachmentsToUpdate = v2->_attachmentsToUpdate;
    v2->_attachmentsToUpdate = (NSMutableArray *)v7;

    uint64_t v9 = objc_opt_new();
    messageInfoArray = v2->_messageInfoArray;
    v2->_messageInfoArray = (NSMutableArray *)v9;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageInfoArray, 0);
  objc_storeStrong((id *)&self->_attachmentsToUpdate, 0);
  objc_storeStrong((id *)&self->_handoutAttachmentIDs, 0);

  objc_storeStrong((id *)&self->_handoutIDs, 0);
}

@end