@interface NMSOutgoingFileTransfer
- (NMSMessageCenter)messageCenter;
- (NSDictionary)extraIDSOptions;
- (NSDictionary)metadata;
- (NSDictionary)persistentUserInfo;
- (NSSet)targetDeviceIDs;
- (NSString)description;
- (NSString)idsIdentifier;
- (NSURL)fileURL;
- (double)sendTimeout;
- (id)CPObfuscatedDescriptionObject;
- (id)pbHeaderInfo;
- (unint64_t)priority;
- (void)setExtraIDSOptions:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setIdsIdentifier:(id)a3;
- (void)setMessageCenter:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setPbHeaderInfo:(id)a3;
- (void)setPersistentUserInfo:(id)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setSendTimeout:(double)a3;
- (void)setTargetDeviceIDs:(id)a3;
@end

@implementation NMSOutgoingFileTransfer

- (NSString)description
{
  id v3 = [NSString alloc];
  v11.receiver = self;
  v11.super_class = (Class)NMSOutgoingFileTransfer;
  v4 = [(NMSOutgoingFileTransfer *)&v11 description];
  v5 = NMSPriorityString([(NMSOutgoingFileTransfer *)self priority]);
  v6 = [(NMSOutgoingFileTransfer *)self idsIdentifier];
  v7 = [(NMSOutgoingFileTransfer *)self fileURL];
  v8 = [(NMSOutgoingFileTransfer *)self metadata];
  v9 = (void *)[v3 initWithFormat:@"%@ {%@ priority, idsID=%@, URL=%@, metadata=%@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (id)CPObfuscatedDescriptionObject
{
  id v3 = objc_alloc_init(NMSObfuscatableDescription);
  v11.receiver = self;
  v11.super_class = (Class)NMSOutgoingFileTransfer;
  v4 = [(NMSOutgoingFileTransfer *)&v11 debugDescription];
  [(NMSObfuscatableDescription *)v3 setPrefixString:v4];

  v5 = NMSPriorityString([(NMSOutgoingFileTransfer *)self priority]);
  [(NMSObfuscatableDescription *)v3 addDescription:@"Priority" value:v5];

  v6 = [(NMSOutgoingFileTransfer *)self idsIdentifier];
  [(NMSObfuscatableDescription *)v3 addDescription:@"IDS ID" value:v6];

  v7 = [(NMSOutgoingFileTransfer *)self fileURL];
  [(NMSObfuscatableDescription *)v3 addDescription:@"URL" value:v7];

  v8 = [(NMSOutgoingFileTransfer *)self metadata];
  [(NMSObfuscatableDescription *)v3 addObfuscatedDescription:@"Metadata" value:v8];

  v9 = [(NMSOutgoingFileTransfer *)self persistentUserInfo];
  [(NMSObfuscatableDescription *)v3 addObfuscatedDescription:@"User Info" value:v9];

  return v3;
}

- (NSSet)targetDeviceIDs
{
  return self->targetDeviceIDs;
}

- (void)setTargetDeviceIDs:(id)a3
{
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (id)pbHeaderInfo
{
  return self->_pbHeaderInfo;
}

- (void)setPbHeaderInfo:(id)a3
{
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setIdsIdentifier:(id)a3
{
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (double)sendTimeout
{
  return self->_sendTimeout;
}

- (void)setSendTimeout:(double)a3
{
  self->_sendTimeout = a3;
}

- (NSDictionary)persistentUserInfo
{
  return self->_persistentUserInfo;
}

- (void)setPersistentUserInfo:(id)a3
{
}

- (NSDictionary)extraIDSOptions
{
  return self->_extraIDSOptions;
}

- (void)setExtraIDSOptions:(id)a3
{
}

- (NMSMessageCenter)messageCenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageCenter);
  return (NMSMessageCenter *)WeakRetained;
}

- (void)setMessageCenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_messageCenter);
  objc_storeStrong((id *)&self->_extraIDSOptions, 0);
  objc_storeStrong((id *)&self->_persistentUserInfo, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong(&self->_pbHeaderInfo, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->targetDeviceIDs, 0);
}

@end