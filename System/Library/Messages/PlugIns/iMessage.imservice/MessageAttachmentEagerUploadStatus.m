@interface MessageAttachmentEagerUploadStatus
- (BOOL)cancel;
- (BOOL)isCanceled;
- (BOOL)isComplete;
- (BOOL)isSuccess;
- (MessageAttachmentEagerUploadStatus)initWithOriginalURL:(id)a3 transferId:(id)a4 targetSize:(int64_t)a5;
- (MessageAttachmentSingleStatus)attachmentStatus;
- (NSArray)attachmentSendContexts;
- (NSString)transferId;
- (NSString)transferredName;
- (NSURL)originalURL;
- (double)expiration;
- (id)description;
- (int64_t)state;
- (int64_t)targetSize;
- (int64_t)useCount;
- (unint64_t)totalBytes;
- (void)attachToTransfer:(id)a3 message:(id)a4 commonCapabilities:(id)a5;
- (void)finish;
- (void)incrementUseCount;
- (void)setAttachmentSendContexts:(id)a3;
- (void)setAttachmentStatus:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTotalBytes:(unint64_t)a3;
- (void)setTransferredName:(id)a3;
- (void)start;
- (void)wait:(id)a3;
@end

@implementation MessageAttachmentEagerUploadStatus

- (MessageAttachmentEagerUploadStatus)initWithOriginalURL:(id)a3 transferId:(id)a4 targetSize:(int64_t)a5
{
  v8 = (NSURL *)a3;
  v22.receiver = self;
  v22.super_class = (Class)MessageAttachmentEagerUploadStatus;
  id v9 = a4;
  v10 = [(MessageAttachmentEagerUploadStatus *)&v22 init];
  v10->_state = 0;
  originalURL = v10->_originalURL;
  v10->_originalURL = v8;
  v12 = v8;

  v13 = (NSString *)objc_msgSend(v9, "copy", v22.receiver, v22.super_class);
  transferId = v10->_transferId;
  v10->_transferId = v13;

  v10->_targetSize = a5;
  v15 = objc_alloc_init(MessageAttachmentSingleStatus);
  attachmentStatus = v10->_attachmentStatus;
  v10->_attachmentStatus = v15;

  dispatch_group_t v17 = dispatch_group_create();
  uploadGroup = v10->_uploadGroup;
  v10->_uploadGroup = (OS_dispatch_group *)v17;

  +[NSDate timeIntervalSinceReferenceDate];
  double v20 = v19;

  v10->_expiration = v20 + 86400.0;
  return v10;
}

- (void)wait:(id)a3
{
  id v4 = a3;
  uploadGroup = self->_uploadGroup;
  ++self->_waitCount;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_4C65C;
  v7[3] = &unk_DE958;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_group_notify(uploadGroup, (dispatch_queue_t)&_dispatch_main_q, v7);
}

- (void)start
{
  uploadGroup = self->_uploadGroup;
  if (uploadGroup) {
    dispatch_group_enter(uploadGroup);
  }
}

- (void)finish
{
  uploadGroup = self->_uploadGroup;
  if (uploadGroup)
  {
    dispatch_group_leave(uploadGroup);
    uploadGroup = self->_uploadGroup;
  }
  self->_uploadGroup = 0;
}

- (BOOL)isCanceled
{
  return self->_state == 3;
}

- (BOOL)isSuccess
{
  if ([(MessageAttachmentEagerUploadStatus *)self isCanceled]) {
    return 0;
  }
  id v4 = [(MessageAttachmentSingleStatus *)self->_attachmentStatus transferError];
  BOOL v3 = v4 == 0;

  return v3;
}

- (BOOL)isComplete
{
  return self->_uploadGroup == 0;
}

- (void)incrementUseCount
{
}

- (void)attachToTransfer:(id)a3 message:(id)a4 commonCapabilities:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v17 = +[IMDFileTransferCenter sharedInstance];
  v11 = [(MessageAttachmentEagerUploadStatus *)self attachmentSendContexts];
  v12 = +[MessageAttachmentController _combinedTransferUserInfoForAttachmentSendContexts:v11 transfer:v10 message:v9 commonCapabilities:v8];

  v13 = [v10 guid];
  [v17 startTransfer:v13];
  [v10 setUserInfo:v12];
  [v10 setAttachmentSendContexts:v11];
  v14 = [v9 guid];

  [v10 setMessageGUID:v14];
  v15 = [(MessageAttachmentEagerUploadStatus *)self transferredName];
  [v10 setTransferredFilename:v15];

  unint64_t v16 = [(MessageAttachmentEagerUploadStatus *)self totalBytes];
  [v17 updateTransfer:v13 currentBytes:v16 totalBytes:v16];
  [v17 endTransfer:v13];
}

- (BOOL)cancel
{
  if ([(MessageAttachmentEagerUploadStatus *)self isCanceled]
    || [(MessageAttachmentEagerUploadStatus *)self isComplete]
    || self->_waitCount)
  {
    return 0;
  }
  self->_state = 3;
  [(MessageAttachmentEagerUploadStatus *)self finish];
  return 1;
}

- (id)description
{
  unint64_t state = self->_state;
  if (state > 5) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = (uint64_t)*(&off_DF188 + state);
  }
  return +[NSString stringWithFormat:@"<%@:%p> transferId=%@ originalURL=%@ state=%@ useCount=%zd waitCount=%zd", objc_opt_class(), self, self->_transferId, self->_originalURL, v3, self->_useCount, self->_waitCount];
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_unint64_t state = a3;
}

- (MessageAttachmentSingleStatus)attachmentStatus
{
  return (MessageAttachmentSingleStatus *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAttachmentStatus:(id)a3
{
}

- (NSURL)originalURL
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)transferredName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTransferredName:(id)a3
{
}

- (NSString)transferId
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (int64_t)targetSize
{
  return self->_targetSize;
}

- (NSArray)attachmentSendContexts
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAttachmentSendContexts:(id)a3
{
}

- (unint64_t)totalBytes
{
  return self->_totalBytes;
}

- (void)setTotalBytes:(unint64_t)a3
{
  self->_totalBytes = a3;
}

- (int64_t)useCount
{
  return self->_useCount;
}

- (double)expiration
{
  return self->_expiration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentSendContexts, 0);
  objc_storeStrong((id *)&self->_transferId, 0);
  objc_storeStrong((id *)&self->_transferredName, 0);
  objc_storeStrong((id *)&self->_originalURL, 0);
  objc_storeStrong((id *)&self->_attachmentStatus, 0);

  objc_storeStrong((id *)&self->_uploadGroup, 0);
}

@end