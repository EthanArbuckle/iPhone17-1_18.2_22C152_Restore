@interface MSConversationContextItem
- (NSDate)timestamp;
- (NSString)messageContent;
- (NSString)senderDisplayName;
- (NSString)senderHandle;
- (void)setMessageContent:(id)a3;
- (void)setSenderDisplayName:(id)a3;
- (void)setSenderHandle:(id)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation MSConversationContextItem

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSString)messageContent
{
  return self->_messageContent;
}

- (void)setMessageContent:(id)a3
{
}

- (NSString)senderHandle
{
  return self->_senderHandle;
}

- (void)setSenderHandle:(id)a3
{
}

- (NSString)senderDisplayName
{
  return self->_senderDisplayName;
}

- (void)setSenderDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderDisplayName, 0);
  objc_storeStrong((id *)&self->_senderHandle, 0);
  objc_storeStrong((id *)&self->_messageContent, 0);

  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end