@interface IMDownloadingPendingMessagesChatItem
- (id)_initWithItem:(id)a3;
- (unint64_t)pendingIncomingSatelliteMessageCount;
- (unint64_t)totalSatelliteMessageCount;
- (void)_setPendingIncomingSatelliteMessageCount:(unint64_t)a3;
- (void)_setTotalSatelliteMessageCount:(unint64_t)a3;
@end

@implementation IMDownloadingPendingMessagesChatItem

- (id)_initWithItem:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)IMDownloadingPendingMessagesChatItem;
  id v3 = [(IMChatItem *)&v8 _initWithItem:a3];
  v6 = v3;
  if (v3) {
    objc_msgSend__setGUID_(v3, v4, @"spm:", v5);
  }
  return v6;
}

- (unint64_t)pendingIncomingSatelliteMessageCount
{
  return self->_pendingIncomingSatelliteMessageCount;
}

- (void)_setPendingIncomingSatelliteMessageCount:(unint64_t)a3
{
  self->_pendingIncomingSatelliteMessageCount = a3;
}

- (unint64_t)totalSatelliteMessageCount
{
  return self->_totalSatelliteMessageCount;
}

- (void)_setTotalSatelliteMessageCount:(unint64_t)a3
{
  self->_totalSatelliteMessageCount = a3;
}

@end