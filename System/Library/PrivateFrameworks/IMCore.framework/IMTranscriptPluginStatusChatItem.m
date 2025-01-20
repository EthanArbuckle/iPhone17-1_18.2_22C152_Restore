@interface IMTranscriptPluginStatusChatItem
- (IMBalloonPluginDataSource)dataSource;
- (id)_initWithItem:(id)a3 dataSource:(id)a4 statusItemSequenceNumber:(unint64_t)a5;
- (id)copyWithStatusItemSequenceNumber:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation IMTranscriptPluginStatusChatItem

- (id)_initWithItem:(id)a3 dataSource:(id)a4 statusItemSequenceNumber:(unint64_t)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IMTranscriptPluginStatusChatItem;
  v10 = [(IMMessageStatusChatItem *)&v13 _initWithItem:a3 statusType:15 time:0 count:0 expireStatusType:0 statusItemSequenceNumber:a5];
  v11 = v10;
  if (v10) {
    objc_storeStrong(v10 + 15, a4);
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend_messageItem(self, a2, (uint64_t)a3, v3);
  uint64_t v9 = objc_msgSend_statusItemSequenceNumber(self, v6, v7, v8);
  id v10 = objc_alloc((Class)objc_opt_class());
  v12 = objc_msgSend__initWithItem_dataSource_statusItemSequenceNumber_(v10, v11, (uint64_t)v5, (uint64_t)self->_dataSource, v9);

  return v12;
}

- (id)copyWithStatusItemSequenceNumber:(unint64_t)a3
{
  v6 = objc_msgSend_messageItem(self, a2, a3, v3);
  id v7 = objc_alloc((Class)objc_opt_class());
  uint64_t v9 = objc_msgSend__initWithItem_dataSource_statusItemSequenceNumber_(v7, v8, (uint64_t)v6, (uint64_t)self->_dataSource, a3);

  return v9;
}

- (IMBalloonPluginDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
}

@end