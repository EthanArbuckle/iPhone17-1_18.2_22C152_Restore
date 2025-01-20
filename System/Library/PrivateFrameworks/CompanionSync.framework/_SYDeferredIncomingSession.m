@interface _SYDeferredIncomingSession
- (IDSMessageContext)idsContext;
- (NSDictionary)metadata;
- (NSString)identifier;
- (NSURL)resourceURL;
- (void)setIdentifier:(id)a3;
- (void)setIdsContext:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setResourceURL:(id)a3;
@end

@implementation _SYDeferredIncomingSession

- (NSURL)resourceURL
{
  return self->_resourceURL;
}

- (void)setResourceURL:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
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
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_resourceURL, 0);
}

@end