@interface IMScheduledSectionLabelChatItem
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToScheduledLabelChatItem:(id)a3;
- (IMScheduledSectionDateChatItem)dateChatItem;
- (IMScheduledSectionLabelChatItem)initWithAssociatedDateChatItem:(id)a3;
- (unint64_t)hash;
- (void)setDateChatItem:(id)a3;
@end

@implementation IMScheduledSectionLabelChatItem

- (IMScheduledSectionLabelChatItem)initWithAssociatedDateChatItem:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IMScheduledSectionLabelChatItem;
  v5 = [(IMScheduledSectionLabelChatItem *)&v10 init];
  v8 = v5;
  if (v5) {
    objc_msgSend_setDateChatItem_(v5, v6, (uint64_t)v4, v7);
  }

  return v8;
}

- (unint64_t)hash
{
  id v4 = objc_msgSend_dateChatItem(self, a2, v2, v3);
  unint64_t v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

- (BOOL)isEqualToScheduledLabelChatItem:(id)a3
{
  id v4 = a3;
  unint64_t v8 = objc_msgSend_dateChatItem(self, v5, v6, v7);
  v12 = objc_msgSend_dateChatItem(v4, v9, v10, v11);

  LOBYTE(v4) = objc_msgSend_isEqual_(v8, v13, (uint64_t)v12, v14);
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char isEqualToScheduledLabelChatItem = objc_msgSend_isEqualToScheduledLabelChatItem_(self, v5, (uint64_t)v4, v6);
  }
  else {
    char isEqualToScheduledLabelChatItem = 0;
  }

  return isEqualToScheduledLabelChatItem;
}

- (IMScheduledSectionDateChatItem)dateChatItem
{
  return self->dateChatItem;
}

- (void)setDateChatItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end