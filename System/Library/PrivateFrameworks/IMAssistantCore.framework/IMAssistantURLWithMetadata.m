@interface IMAssistantURLWithMetadata
- (IMAssistantURLWithMetadata)initWithURL:(id)a3 metadata:(id)a4;
- (LPLinkMetadata)metadata;
- (NSURL)url;
- (void)setMetadata:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation IMAssistantURLWithMetadata

- (IMAssistantURLWithMetadata)initWithURL:(id)a3 metadata:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IMAssistantURLWithMetadata;
  v9 = [(IMAssistantURLWithMetadata *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeStrong((id *)&v10->_metadata, a4);
  }

  return v10;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (LPLinkMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end