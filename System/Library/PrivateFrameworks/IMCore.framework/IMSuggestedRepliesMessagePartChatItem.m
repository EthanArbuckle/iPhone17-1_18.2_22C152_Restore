@interface IMSuggestedRepliesMessagePartChatItem
+ (id)suggestedRepliesChatItemGUIDPrefix;
- (BOOL)isEqual:(id)a3;
- (IMSuggestedRepliesMessagePartChatItem)initWithItem:(id)a3 suggestedRepliesList:(id)a4 selectedIndex:(int64_t)a5;
- (NSArray)suggestedRepliesList;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)selectedIndex;
@end

@implementation IMSuggestedRepliesMessagePartChatItem

- (IMSuggestedRepliesMessagePartChatItem)initWithItem:(id)a3 suggestedRepliesList:(id)a4 selectedIndex:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)IMSuggestedRepliesMessagePartChatItem;
  v13 = [(IMChatItem *)&v21 _initWithItem:v8];
  if (v13)
  {
    v14 = objc_msgSend_guid(v8, v10, v11, v12);
    v17 = objc_msgSend_stringByAppendingString_(@"lre:", v15, (uint64_t)v14, v16);
    objc_msgSend__setGUID_(v13, v18, (uint64_t)v17, v19);

    objc_storeStrong((id *)&v13->_suggestedRepliesList, a4);
    v13->_selectedIndex = a5;
  }

  return v13;
}

+ (id)suggestedRepliesChatItemGUIDPrefix
{
  return @"lre:";
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v9 = objc_msgSend_guid(self, v6, v7, v8);
    v13 = objc_msgSend_guid(v5, v10, v11, v12);
    if (objc_msgSend_isEqualToString_(v9, v14, (uint64_t)v13, v15))
    {
      uint64_t v19 = objc_msgSend_suggestedRepliesList(self, v16, v17, v18);
      v23 = objc_msgSend_suggestedRepliesList(v5, v20, v21, v22);
      if (objc_msgSend_isEqual_(v19, v24, (uint64_t)v23, v25))
      {
        uint64_t v29 = objc_msgSend_selectedIndex(self, v26, v27, v28);
        BOOL v33 = v29 == objc_msgSend_selectedIndex(v5, v30, v31, v32);
      }
      else
      {
        BOOL v33 = 0;
      }
    }
    else
    {
      BOOL v33 = 0;
    }
  }
  else
  {
    BOOL v33 = 0;
  }

  return v33;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v8 = objc_msgSend_messageItem(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_suggestedRepliesList(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_selectedIndex(self, v13, v14, v15);
  uint64_t v18 = objc_msgSend_initWithItem_suggestedRepliesList_selectedIndex_(v4, v17, (uint64_t)v8, (uint64_t)v12, v16);

  return v18;
}

- (NSArray)suggestedRepliesList
{
  return self->_suggestedRepliesList;
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void).cxx_destruct
{
}

@end