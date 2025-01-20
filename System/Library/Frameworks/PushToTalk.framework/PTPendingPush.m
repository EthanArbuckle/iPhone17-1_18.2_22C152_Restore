@interface PTPendingPush
- (BOOL)isHighPriority;
- (BOOL)isServiceUpdateMessage;
- (NSDictionary)payload;
- (NSUUID)uuid;
- (id)reply;
- (int64_t)remainingHighPriorityBudget;
- (void)setIsHighPriority:(BOOL)a3;
- (void)setIsServiceUpdateMessage:(BOOL)a3;
- (void)setPayload:(id)a3;
- (void)setRemainingHighPriorityBudget:(int64_t)a3;
- (void)setReply:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation PTPendingPush

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (id)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
}

- (BOOL)isServiceUpdateMessage
{
  return self->_isServiceUpdateMessage;
}

- (void)setIsServiceUpdateMessage:(BOOL)a3
{
  self->_isServiceUpdateMessage = a3;
}

- (BOOL)isHighPriority
{
  return self->_isHighPriority;
}

- (void)setIsHighPriority:(BOOL)a3
{
  self->_isHighPriority = a3;
}

- (int64_t)remainingHighPriorityBudget
{
  return self->_remainingHighPriorityBudget;
}

- (void)setRemainingHighPriorityBudget:(int64_t)a3
{
  self->_remainingHighPriorityBudget = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reply, 0);
  objc_storeStrong((id *)&self->_payload, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end