@interface IMTypingPluginChatItem
- (IMBalloonPluginDataSource)dataSource;
- (NSData)typingIndicatorIcon;
- (NSString)type;
- (id)_initWithItem:(id)a3 dataSource:(id)a4;
- (void)setDataSource:(id)a3;
@end

@implementation IMTypingPluginChatItem

- (NSString)type
{
  return (NSString *)objc_msgSend_bundleID(self->_dataSource, a2, v2, v3);
}

- (id)_initWithItem:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)IMTypingPluginChatItem;
  v11 = [(IMTypingChatItem *)&v24 _initWithItem:v6];
  if (v11)
  {
    v12 = objc_msgSend_guid(v6, v8, v9, v10);
    v13 = (void *)sub_1A4C4EEE8();

    objc_msgSend__setGUID_(v11, v14, (uint64_t)v13, v15);
    objc_msgSend_setDataSource_(v11, v16, (uint64_t)v7, v17);
    uint64_t v21 = objc_msgSend_typingIndicatorIcon(v6, v18, v19, v20);
    v22 = (void *)v11[7];
    v11[7] = v21;
  }
  return v11;
}

- (NSData)typingIndicatorIcon
{
  return self->_typingIndicatorIcon;
}

- (IMBalloonPluginDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_storeStrong((id *)&self->_typingIndicatorIcon, 0);
}

@end