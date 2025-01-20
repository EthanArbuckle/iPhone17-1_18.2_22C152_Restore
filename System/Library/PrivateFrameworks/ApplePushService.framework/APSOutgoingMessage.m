@interface APSOutgoingMessage
- (BOOL)ackReceived;
- (BOOL)hasTimedOut;
- (BOOL)isCritical;
- (BOOL)isEager;
- (BOOL)sendRetried;
- (BOOL)wasCancelled;
- (BOOL)wasSent;
- (id)channelID;
- (id)eagernessTimeoutTime;
- (id)originator;
- (id)rawTimeoutTime;
- (id)sendInterfaceIdentifier;
- (id)sendTimeoutTime;
- (id)sentTimestamp;
- (id)timestamp;
- (int64_t)priority;
- (unint64_t)ackTimestamp;
- (unint64_t)messageID;
- (unint64_t)payloadFormat;
- (unint64_t)payloadLength;
- (unint64_t)pushType;
- (unint64_t)timeout;
- (unsigned)pushFlags;
- (void)setAckReceived:(BOOL)a3;
- (void)setAckTimestamp:(unint64_t)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setChannelID:(id)a3;
- (void)setCritical:(BOOL)a3;
- (void)setMessageID:(unint64_t)a3;
- (void)setOriginator:(id)a3;
- (void)setPayloadFormat:(unint64_t)a3;
- (void)setPayloadLength:(unint64_t)a3;
- (void)setPriority:(int64_t)a3;
- (void)setPushFlags:(unsigned int)a3;
- (void)setPushType:(unint64_t)a3;
- (void)setSendInterfaceIdentifier:(id)a3;
- (void)setSendRetried:(BOOL)a3;
- (void)setSent:(BOOL)a3;
- (void)setSentTimestamp:(id)a3;
- (void)setTimedOut:(BOOL)a3;
- (void)setTimeout:(unint64_t)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation APSOutgoingMessage

- (unint64_t)messageID
{
  v2 = [(APSMessage *)self objectForKey:@"APSMessageID"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setMessageID:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(APSMessage *)self setObject:v4 forKey:@"APSMessageID"];
}

- (id)timestamp
{
  return [(APSMessage *)self objectForKey:@"APSTimestamp"];
}

- (void)setTimestamp:(id)a3
{
}

- (unint64_t)timeout
{
  v2 = [(APSMessage *)self objectForKey:@"APSTimeout"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setTimeout:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(APSMessage *)self setObject:v4 forKey:@"APSTimeout"];
}

- (id)sendTimeoutTime
{
  unint64_t v3 = [(APSOutgoingMessage *)self timestamp];
  id v4 = objc_msgSend(v3, "dateByAddingTimeInterval:", (double)-[APSOutgoingMessage timeout](self, "timeout"));

  return v4;
}

- (id)eagernessTimeoutTime
{
  if ([(APSOutgoingMessage *)self priority] == 1) {
    double v3 = 60.0;
  }
  else {
    double v3 = 120.0;
  }
  id v4 = [(APSOutgoingMessage *)self timestamp];
  v5 = [v4 dateByAddingTimeInterval:v3];

  return v5;
}

- (id)rawTimeoutTime
{
  double v3 = [(APSOutgoingMessage *)self timestamp];
  id v4 = objc_msgSend(v3, "dateByAddingTimeInterval:", (double)-[APSOutgoingMessage timeout](self, "timeout"));

  return v4;
}

- (BOOL)isEager
{
  v2 = [(APSOutgoingMessage *)self eagernessTimeoutTime];
  if (v2)
  {
    double v3 = [MEMORY[0x1E4F1C9C8] date];
    BOOL v4 = [v3 compare:v2] == -1;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)isCritical
{
  double v3 = [(APSMessage *)self objectForKey:@"APSCritical"];
  if ([v3 BOOLValue]) {
    BOOL v4 = [(APSOutgoingMessage *)self isEager];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)setCritical:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(APSMessage *)self setObject:v4 forKey:@"APSCritical"];
}

- (BOOL)wasSent
{
  v2 = [(APSMessage *)self objectForKey:@"APSSent"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setSent:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(APSMessage *)self setObject:v4 forKey:@"APSSent"];
}

- (id)sendInterfaceIdentifier
{
  return [(APSMessage *)self objectForKey:@"APSOutgoingMessageSendInterfaceIdentifier"];
}

- (void)setSendInterfaceIdentifier:(id)a3
{
}

- (BOOL)wasCancelled
{
  v2 = [(APSMessage *)self objectForKey:@"APSCancelled"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setCancelled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(APSMessage *)self setObject:v4 forKey:@"APSCancelled"];
}

- (BOOL)hasTimedOut
{
  v2 = [(APSMessage *)self objectForKey:@"APSTimedOut"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setTimedOut:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(APSMessage *)self setObject:v4 forKey:@"APSTimedOut"];
}

- (unint64_t)payloadFormat
{
  v2 = [(APSMessage *)self objectForKey:@"APSPayloadFormat"];
  unint64_t v3 = [v2 unsignedIntValue];

  return v3;
}

- (void)setPayloadFormat:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(APSMessage *)self setObject:v4 forKey:@"APSPayloadFormat"];
}

- (unint64_t)payloadLength
{
  v2 = [(APSMessage *)self objectForKey:@"APSOutgoingMessagePayloadLength"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setPayloadLength:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(APSMessage *)self setObject:v4 forKey:@"APSOutgoingMessagePayloadLength"];
}

- (int64_t)priority
{
  v2 = [(APSMessage *)self objectForKey:@"APSOutgoingMessagePriority"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setPriority:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(APSMessage *)self setObject:v4 forKey:@"APSOutgoingMessagePriority"];
}

- (unint64_t)pushType
{
  v2 = [(APSMessage *)self objectForKey:@"APSOutgoingMessagePushType"];
  unint64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setPushType:(unint64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(APSMessage *)self setObject:v4 forKey:@"APSOutgoingMessagePushType"];
}

- (void)setOriginator:(id)a3
{
}

- (id)originator
{
  return [(APSMessage *)self instanceObjectForKey:@"APSOriginator"];
}

- (void)setSentTimestamp:(id)a3
{
}

- (id)sentTimestamp
{
  return [(APSMessage *)self instanceObjectForKey:@"APSSentTimestamp"];
}

- (void)setSendRetried:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(APSMessage *)self setObject:v4 forKey:@"APSSendRetried"];
}

- (BOOL)sendRetried
{
  v2 = [(APSMessage *)self objectForKey:@"APSSendRetried"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setAckTimestamp:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(APSMessage *)self setObject:v4 forKey:@"APSAckTimestamp"];
}

- (unint64_t)ackTimestamp
{
  v2 = [(APSMessage *)self objectForKey:@"APSAckTimestamp"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (unsigned)pushFlags
{
  v2 = [(APSMessage *)self objectForKey:@"APSOutgoingMessagePushFlags"];
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (void)setPushFlags:(unsigned int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  [(APSMessage *)self setObject:v4 forKey:@"APSOutgoingMessagePushFlags"];
}

- (id)channelID
{
  return [(APSMessage *)self objectForKey:@"APSOutgoingMessageChannelIDKey"];
}

- (void)setChannelID:(id)a3
{
}

- (BOOL)ackReceived
{
  return self->_ackReceived;
}

- (void)setAckReceived:(BOOL)a3
{
  self->_ackReceived = a3;
}

@end