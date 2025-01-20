@interface IMDMomentShareIngestionContext
- (IMDChat)chat;
- (IMDMomentShareIngestionContext)initWithURL:(id)a3 message:(id)a4 inChat:(id)a5;
- (IMMessageItem)message;
- (NSDictionary)assetUUIDsToFileTransfers;
- (NSURL)shareURL;
- (PHFetchResult)assetsFetch;
- (PHMomentShare)momentShare;
- (int64_t)fetchType;
- (int64_t)state;
- (void)addTransfers:(id)a3;
- (void)clearAllTransfers;
- (void)completeTransferForAssetUUID:(id)a3;
- (void)setAssetsFetch:(id)a3;
- (void)setFetchType:(int64_t)a3;
- (void)setMomentShare:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation IMDMomentShareIngestionContext

- (IMDMomentShareIngestionContext)initWithURL:(id)a3 message:(id)a4 inChat:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)IMDMomentShareIngestionContext;
  v12 = [(IMDMomentShareIngestionContext *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_shareURL, a3);
    objc_storeStrong((id *)&v13->_message, a4);
    objc_storeStrong((id *)&v13->_chat, a5);
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    assetUUIDsToFileTransfers = v13->_assetUUIDsToFileTransfers;
    v13->_assetUUIDsToFileTransfers = v14;
  }
  return v13;
}

- (NSDictionary)assetUUIDsToFileTransfers
{
  return (NSDictionary *)self->_assetUUIDsToFileTransfers;
}

- (void)addTransfers:(id)a3
{
}

- (void)clearAllTransfers
{
}

- (void)completeTransferForAssetUUID:(id)a3
{
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (IMMessageItem)message
{
  return self->_message;
}

- (IMDChat)chat
{
  return self->_chat;
}

- (PHMomentShare)momentShare
{
  return self->_momentShare;
}

- (void)setMomentShare:(id)a3
{
}

- (PHFetchResult)assetsFetch
{
  return self->_assetsFetch;
}

- (void)setAssetsFetch:(id)a3
{
}

- (int64_t)fetchType
{
  return self->_fetchType;
}

- (void)setFetchType:(int64_t)a3
{
  self->_fetchType = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsFetch, 0);
  objc_storeStrong((id *)&self->_momentShare, 0);
  objc_storeStrong((id *)&self->_chat, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);

  objc_storeStrong((id *)&self->_assetUUIDsToFileTransfers, 0);
}

@end