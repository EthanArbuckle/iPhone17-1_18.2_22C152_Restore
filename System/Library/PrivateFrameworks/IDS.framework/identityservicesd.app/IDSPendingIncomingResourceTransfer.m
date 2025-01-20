@interface IDSPendingIncomingResourceTransfer
- (IDSURI)specificOriginatorURI;
- (IDSURI)toURI;
- (IMMessageContext)messageContext;
- (NSDictionary)context;
- (NSDictionary)topLevelPayload;
- (NSString)broadcastTopic;
- (NSString)guid;
- (NSString)topic;
- (void)setBroadcastTopic:(id)a3;
- (void)setContext:(id)a3;
- (void)setGuid:(id)a3;
- (void)setMessageContext:(id)a3;
- (void)setSpecificOriginatorURI:(id)a3;
- (void)setToURI:(id)a3;
- (void)setTopLevelPayload:(id)a3;
- (void)setTopic:(id)a3;
@end

@implementation IDSPendingIncomingResourceTransfer

- (NSDictionary)topLevelPayload
{
  return self->_topLevelPayload;
}

- (void)setTopLevelPayload:(id)a3
{
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (IDSURI)specificOriginatorURI
{
  return self->_specificOriginatorURI;
}

- (void)setSpecificOriginatorURI:(id)a3
{
}

- (NSString)broadcastTopic
{
  return self->_broadcastTopic;
}

- (void)setBroadcastTopic:(id)a3
{
}

- (IDSURI)toURI
{
  return self->_toURI;
}

- (void)setToURI:(id)a3
{
}

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
}

- (IMMessageContext)messageContext
{
  return self->_messageContext;
}

- (void)setMessageContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageContext, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_toURI, 0);
  objc_storeStrong((id *)&self->_broadcastTopic, 0);
  objc_storeStrong((id *)&self->_specificOriginatorURI, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_guid, 0);

  objc_storeStrong((id *)&self->_topLevelPayload, 0);
}

@end