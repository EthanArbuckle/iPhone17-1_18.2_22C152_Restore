@interface IMTranscriptSharingChatItem
- (id)_initWithItem:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation IMTranscriptSharingChatItem

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v8 = objc_msgSend__item(self, v5, v6, v7);
  v11 = objc_msgSend__initWithItem_(v4, v9, (uint64_t)v8, v10);

  return v11;
}

- (id)_initWithItem:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IMTranscriptSharingChatItem;
  id v8 = [(IMChatItem *)&v14 _initWithItem:v4];
  if (v8)
  {
    v9 = objc_msgSend_guid(v4, v5, v6, v7);
    uint64_t v10 = (void *)sub_1A4C4EEE8();

    objc_msgSend__setGUID_(v8, v11, (uint64_t)v10, v12);
  }

  return v8;
}

@end