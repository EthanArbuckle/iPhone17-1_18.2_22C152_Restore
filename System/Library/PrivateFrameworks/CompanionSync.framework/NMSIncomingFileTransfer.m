@interface NMSIncomingFileTransfer
- (IDSMessageContext)idsContext;
- (NMSMessageCenter)messageCenter;
- (NSDictionary)metadata;
- (NSString)description;
- (NSString)idsIdentifier;
- (NSString)sourceDeviceID;
- (NSURL)fileURL;
- (id)CPObfuscatedDescriptionObject;
- (id)pbHeaderInfo;
- (unint64_t)priority;
- (void)setFileURL:(id)a3;
- (void)setIdsContext:(id)a3;
- (void)setIdsIdentifier:(id)a3;
- (void)setMessageCenter:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setPbHeaderInfo:(id)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setSourceDeviceID:(id)a3;
@end

@implementation NMSIncomingFileTransfer

- (NSString)description
{
  id v3 = [NSString alloc];
  v11.receiver = self;
  v11.super_class = (Class)NMSIncomingFileTransfer;
  v4 = [(NMSIncomingFileTransfer *)&v11 description];
  v5 = NMSPriorityString([(NMSIncomingFileTransfer *)self priority]);
  v6 = [(NMSIncomingFileTransfer *)self idsIdentifier];
  v7 = [(NMSIncomingFileTransfer *)self fileURL];
  v8 = [(NMSIncomingFileTransfer *)self metadata];
  v9 = (void *)[v3 initWithFormat:@"%@ {%@ priority, idsID=%@, URL=%@, metadata=%@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (id)CPObfuscatedDescriptionObject
{
  id v3 = objc_alloc_init(NMSObfuscatableDescription);
  v10.receiver = self;
  v10.super_class = (Class)NMSIncomingFileTransfer;
  v4 = [(NMSIncomingFileTransfer *)&v10 debugDescription];
  [(NMSObfuscatableDescription *)v3 setPrefixString:v4];

  v5 = NMSPriorityString([(NMSIncomingFileTransfer *)self priority]);
  [(NMSObfuscatableDescription *)v3 addDescription:@"Priority" value:v5];

  v6 = [(NMSIncomingFileTransfer *)self idsIdentifier];
  [(NMSObfuscatableDescription *)v3 addDescription:@"IDS ID" value:v6];

  v7 = [(NMSIncomingFileTransfer *)self fileURL];
  [(NMSObfuscatableDescription *)v3 addDescription:@"URL" value:v7];

  v8 = [(NMSIncomingFileTransfer *)self metadata];
  [(NMSObfuscatableDescription *)v3 addObfuscatedDescription:@"Metadata" value:v8];

  return v3;
}

- (NSString)sourceDeviceID
{
  return self->sourceDeviceID;
}

- (void)setSourceDeviceID:(id)a3
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

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setIdsIdentifier:(id)a3
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

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (IDSMessageContext)idsContext
{
  return self->_idsContext;
}

- (void)setIdsContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsContext, 0);
  objc_storeStrong(&self->_pbHeaderInfo, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_destroyWeak((id *)&self->_messageCenter);
  objc_storeStrong((id *)&self->sourceDeviceID, 0);
}

@end