@interface CKPinnedConversationContactItemFromHandle
- (CKEntity)entity;
- (CKPinnedConversationContactItemFromHandle)initWithEntity:(id)a3;
- (NSString)contactItemIdentifier;
- (double)contentScale;
- (id)cnContactWithKeys:(id)a3;
- (id)contactItemView;
- (int64_t)contactItemAlignment;
- (void)setContactItemAlignment:(int64_t)a3;
- (void)setContentScale:(double)a3;
- (void)setEntity:(id)a3;
@end

@implementation CKPinnedConversationContactItemFromHandle

- (CKPinnedConversationContactItemFromHandle)initWithEntity:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKPinnedConversationContactItemFromHandle;
  v6 = [(CKPinnedConversationContactItemFromHandle *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_entity, a3);
  }

  return v7;
}

- (NSString)contactItemIdentifier
{
  return (NSString *)[(CKEntity *)self->_entity pinnedConversationContactItemIdentifier];
}

- (id)cnContactWithKeys:(id)a3
{
  return [(CKEntity *)self->_entity cnContactWithKeys:a3];
}

- (id)contactItemView
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(CKPinnedConversationContactItemAvatarView);
  v4 = [MEMORY[0x1E4F1BB38] descriptorForRequiredKeysWithThreeDTouchEnabled:0];
  v8[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  v6 = [(CKEntity *)self->_entity cnContactWithKeys:v5];
  [(CNAvatarView *)v3 setContact:v6];
  [(CKPinnedConversationContactItemAvatarView *)v3 setPinnedConversationContactItem:self];

  return v3;
}

- (CKEntity)entity
{
  return self->_entity;
}

- (void)setEntity:(id)a3
{
}

- (double)contentScale
{
  return self->_contentScale;
}

- (void)setContentScale:(double)a3
{
  self->_contentScale = a3;
}

- (int64_t)contactItemAlignment
{
  return self->_contactItemAlignment;
}

- (void)setContactItemAlignment:(int64_t)a3
{
  self->_contactItemAlignment = a3;
}

- (void).cxx_destruct
{
}

@end