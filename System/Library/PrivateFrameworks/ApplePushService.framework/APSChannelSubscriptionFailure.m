@interface APSChannelSubscriptionFailure
- (NSString)channelID;
- (NSString)pushTopic;
- (id)description;
- (int)failureReason;
- (void)setChannelID:(id)a3;
- (void)setFailureReason:(int)a3;
- (void)setPushTopic:(id)a3;
@end

@implementation APSChannelSubscriptionFailure

- (id)description
{
  v3 = NSString;
  v4 = [(APSChannelSubscriptionFailure *)self pushTopic];
  v5 = [(APSChannelSubscriptionFailure *)self channelID];
  v6 = [v3 stringWithFormat:@"pushTopic %@ channelID %@ failureReason %d", v4, v5, -[APSChannelSubscriptionFailure failureReason](self, "failureReason")];

  return v6;
}

- (NSString)pushTopic
{
  return self->_pushTopic;
}

- (void)setPushTopic:(id)a3
{
}

- (NSString)channelID
{
  return self->_channelID;
}

- (void)setChannelID:(id)a3
{
}

- (int)failureReason
{
  return self->_failureReason;
}

- (void)setFailureReason:(int)a3
{
  self->_failureReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelID, 0);
  objc_storeStrong((id *)&self->_pushTopic, 0);
}

@end