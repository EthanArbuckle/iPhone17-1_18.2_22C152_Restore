@interface IMDSharedUtilitiesPluginPayload
- (BOOL)isFromMe;
- (BOOL)supportsCollaboration;
- (NSArray)attachments;
- (NSArray)consumedSessionPayloads;
- (NSData)data;
- (NSString)messageGUID;
- (NSString)pluginBundleID;
- (NSURL)url;
- (id)dataDetectedResult;
- (id)datasource;
- (void)dealloc;
- (void)setAttachments:(id)a3;
- (void)setConsumedSessionPayloads:(id)a3;
- (void)setData:(id)a3;
- (void)setDataDetectedResult:(id)a3;
- (void)setDatasource:(id)a3;
- (void)setIsFromMe:(BOOL)a3;
- (void)setMessageGUID:(id)a3;
- (void)setPluginBundleID:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation IMDSharedUtilitiesPluginPayload

- (BOOL)supportsCollaboration
{
  return 0;
}

- (void)dealloc
{
  [(IMDSharedUtilitiesPluginPayload *)self setData:0];
  [(IMDSharedUtilitiesPluginPayload *)self setMessageGUID:0];
  [(IMDSharedUtilitiesPluginPayload *)self setDataDetectedResult:0];
  [(IMDSharedUtilitiesPluginPayload *)self setUrl:0];
  [(IMDSharedUtilitiesPluginPayload *)self setDatasource:0];
  [(IMDSharedUtilitiesPluginPayload *)self setPluginBundleID:0];
  [(IMDSharedUtilitiesPluginPayload *)self setConsumedSessionPayloads:0];
  [(IMDSharedUtilitiesPluginPayload *)self setAttachments:0];
  v3.receiver = self;
  v3.super_class = (Class)IMDSharedUtilitiesPluginPayload;
  [(IMDSharedUtilitiesPluginPayload *)&v3 dealloc];
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSString)messageGUID
{
  return self->_messageGUID;
}

- (void)setMessageGUID:(id)a3
{
}

- (id)dataDetectedResult
{
  return self->_dataDetectedResult;
}

- (void)setDataDetectedResult:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (id)datasource
{
  return objc_loadWeak(&self->_datasource);
}

- (void)setDatasource:(id)a3
{
}

- (NSString)pluginBundleID
{
  return self->_pluginBundleID;
}

- (void)setPluginBundleID:(id)a3
{
}

- (NSArray)consumedSessionPayloads
{
  return self->_consumedSessionPayloads;
}

- (void)setConsumedSessionPayloads:(id)a3
{
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
}

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (void)setIsFromMe:(BOOL)a3
{
  self->_isFromMe = a3;
}

- (void).cxx_destruct
{
}

@end