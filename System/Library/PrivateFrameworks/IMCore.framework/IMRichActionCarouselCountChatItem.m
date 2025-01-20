@interface IMRichActionCarouselCountChatItem
+ (id)richCardCountChatItemGUIDPrefix;
- (id)_initWithItem:(id)a3 selectedIndex:(int64_t)a4 totalCount:(int64_t)a5;
- (id)handle;
- (int64_t)selectedIndex;
- (int64_t)totalCount;
@end

@implementation IMRichActionCarouselCountChatItem

- (id)_initWithItem:(id)a3 selectedIndex:(int64_t)a4 totalCount:(int64_t)a5
{
  id v8 = a3;
  v25.receiver = self;
  v25.super_class = (Class)IMRichActionCarouselCountChatItem;
  v12 = [(IMChatItem *)&v25 _initWithItem:v8];
  if (v12)
  {
    v13 = objc_msgSend_guid(v8, v9, v10, v11);
    v16 = objc_msgSend_stringByAppendingString_(@"rcc:", v14, (uint64_t)v13, v15);
    objc_msgSend__setGUID_(v12, v17, (uint64_t)v16, v18);

    uint64_t v22 = objc_msgSend__senderHandle(v8, v19, v20, v21);
    v23 = (void *)v12[7];
    v12[7] = v22;

    v12[8] = a4;
    v12[9] = a5;
  }

  return v12;
}

+ (id)richCardCountChatItemGUIDPrefix
{
  return @"rcc:";
}

- (id)handle
{
  return self->_handle;
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (int64_t)totalCount
{
  return self->_totalCount;
}

- (void).cxx_destruct
{
}

@end