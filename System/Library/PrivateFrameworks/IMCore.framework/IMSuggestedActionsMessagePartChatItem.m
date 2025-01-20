@interface IMSuggestedActionsMessagePartChatItem
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsSuggestedActionsMenu;
- (IMSuggestedActionsMessagePartChatItem)initWithItem:(id)a3 suggestedActionsList:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation IMSuggestedActionsMessagePartChatItem

- (IMSuggestedActionsMessagePartChatItem)initWithItem:(id)a3 suggestedActionsList:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)IMSuggestedActionsMessagePartChatItem;
  v11 = [(IMChatItem *)&v19 _initWithItem:v6];
  if (v11)
  {
    v12 = objc_msgSend_guid(v6, v8, v9, v10);
    v13 = (void *)sub_1A4C4EEE8();
    objc_msgSend__setGUID_(v11, v14, (uint64_t)v13, v15);

    objc_msgSend_setSuggestedActionsList_(v11, v16, (uint64_t)v7, v17);
  }

  return v11;
}

- (BOOL)supportsSuggestedActionsMenu
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v9 = objc_msgSend_guid(self, v6, v7, v8);
    v13 = objc_msgSend_guid(v5, v10, v11, v12);
    if (objc_msgSend_isEqualToString_(v9, v14, (uint64_t)v13, v15))
    {
      objc_super v19 = objc_msgSend_suggestedActionsList(self, v16, v17, v18);
      v23 = objc_msgSend_suggestedActionsList(v5, v20, v21, v22);
      char isEqual = objc_msgSend_isEqual_(v19, v24, (uint64_t)v23, v25);
    }
    else
    {
      char isEqual = 0;
    }
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [IMSuggestedActionsMessagePartChatItem alloc];
  uint64_t v8 = objc_msgSend_messageItem(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_suggestedActionsList(self, v9, v10, v11);
  v14 = objc_msgSend_initWithItem_suggestedActionsList_(v4, v13, (uint64_t)v8, (uint64_t)v12);

  return v14;
}

@end