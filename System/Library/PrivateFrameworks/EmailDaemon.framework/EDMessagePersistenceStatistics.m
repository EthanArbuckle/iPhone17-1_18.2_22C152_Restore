@interface EDMessagePersistenceStatistics
- (double)duration;
- (double)start;
- (unint64_t)messageData;
- (unint64_t)messageDataDeleted;
- (unint64_t)messages;
- (unint64_t)messagesDeleted;
- (void)setDuration:(double)a3;
- (void)setMessageData:(unint64_t)a3;
- (void)setMessageDataDeleted:(unint64_t)a3;
- (void)setMessages:(unint64_t)a3;
- (void)setMessagesDeleted:(unint64_t)a3;
- (void)setStart:(double)a3;
@end

@implementation EDMessagePersistenceStatistics

- (double)start
{
  return self->_start;
}

- (void)setStart:(double)a3
{
  self->_start = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (unint64_t)messages
{
  return self->_messages;
}

- (void)setMessages:(unint64_t)a3
{
  self->_messages = a3;
}

- (unint64_t)messageData
{
  return self->_messageData;
}

- (void)setMessageData:(unint64_t)a3
{
  self->_messageData = a3;
}

- (unint64_t)messagesDeleted
{
  return self->_messagesDeleted;
}

- (void)setMessagesDeleted:(unint64_t)a3
{
  self->_messagesDeleted = a3;
}

- (unint64_t)messageDataDeleted
{
  return self->_messageDataDeleted;
}

- (void)setMessageDataDeleted:(unint64_t)a3
{
  self->_messageDataDeleted = a3;
}

@end