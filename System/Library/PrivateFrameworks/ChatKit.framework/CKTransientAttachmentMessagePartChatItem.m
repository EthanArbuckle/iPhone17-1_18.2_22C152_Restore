@interface CKTransientAttachmentMessagePartChatItem
- (CKTransientAttachmentMessagePartChatItem)initWithParentChatItem:(id)a3;
- (NSString)parentGUID;
- (id)IMChatItem;
- (void)setParentGUID:(id)a3;
@end

@implementation CKTransientAttachmentMessagePartChatItem

- (CKTransientAttachmentMessagePartChatItem)initWithParentChatItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKTransientAttachmentMessagePartChatItem;
  v6 = [(CKMessagePartChatItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_parentGUID, a3);
  }

  return v7;
}

- (id)IMChatItem
{
  id v3 = objc_alloc(MEMORY[0x1E4F6BE28]);
  v4 = [(CKTransientAttachmentMessagePartChatItem *)self parentGUID];
  id v5 = (void *)[v3 initWithGUID:v4];

  return v5;
}

- (NSString)parentGUID
{
  return self->_parentGUID;
}

- (void)setParentGUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end