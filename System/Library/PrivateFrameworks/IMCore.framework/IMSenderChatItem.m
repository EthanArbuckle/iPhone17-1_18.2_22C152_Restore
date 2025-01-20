@interface IMSenderChatItem
- (IMHandle)handle;
- (NSString)displayName;
- (id)_initWithItem:(id)a3 handle:(id)a4;
- (id)_initWithItem:(id)a3 handle:(id)a4 displayName:(id)a5 transcriptSharingMessageType:(int64_t)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)transcriptSharingMessageType;
- (void)setDisplayName:(id)a3;
@end

@implementation IMSenderChatItem

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, (uint64_t)a3, v3);
  int isTranscriptSharingEnabled = objc_msgSend_isTranscriptSharingEnabled(v5, v6, v7, v8);

  id v10 = objc_alloc((Class)objc_opt_class());
  v15 = objc_msgSend__item(self, v11, v12, v13);
  handle = self->_handle;
  if (isTranscriptSharingEnabled) {
    uint64_t v17 = objc_msgSend__initWithItem_handle_displayName_transcriptSharingMessageType_(v10, v14, (uint64_t)v15, (uint64_t)handle, self->_displayName, self->_transcriptSharingMessageType);
  }
  else {
    uint64_t v17 = objc_msgSend__initWithItem_handle_(v10, v14, (uint64_t)v15, (uint64_t)handle);
  }
  v18 = (void *)v17;

  return v18;
}

- (id)_initWithItem:(id)a3 handle:(id)a4 displayName:(id)a5 transcriptSharingMessageType:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v27.receiver = self;
  v27.super_class = (Class)IMSenderChatItem;
  uint64_t v13 = [(IMChatItem *)&v27 _initWithItem:v10];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong(v13 + 7, a4);
    objc_storeStrong(v14 + 8, a5);
    v14[9] = (id)a6;
    v18 = objc_msgSend_ID(v11, v15, v16, v17);
    v22 = objc_msgSend_guid(v10, v19, v20, v21);
    v23 = (void *)sub_1A4C4EEE8();

    objc_msgSend__setGUID_(v14, v24, (uint64_t)v23, v25);
  }

  return v14;
}

- (id)_initWithItem:(id)a3 handle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)IMSenderChatItem;
  uint64_t v8 = [(IMChatItem *)&v22 _initWithItem:v6];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(v8 + 7, a4);
    uint64_t v13 = objc_msgSend_ID(v7, v10, v11, v12);
    uint64_t v17 = objc_msgSend_guid(v6, v14, v15, v16);
    v18 = (void *)sub_1A4C4EEE8();

    objc_msgSend__setGUID_(v9, v19, (uint64_t)v18, v20);
  }

  return v9;
}

- (IMHandle)handle
{
  return self->_handle;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (int64_t)transcriptSharingMessageType
{
  return self->_transcriptSharingMessageType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

@end