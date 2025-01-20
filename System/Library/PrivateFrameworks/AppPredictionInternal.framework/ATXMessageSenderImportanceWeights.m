@interface ATXMessageSenderImportanceWeights
- (ATXMessageSenderImportanceWeights)init;
- (double)contactHasBeencontactedToday;
- (double)isAudioMessage;
- (double)isContactChatPinnedInMessage;
- (double)isEmergencyContact;
- (double)isFavoriteContact;
- (double)isFrequentlyContacted;
- (double)isMentionedInGroupMessage;
- (double)isVIP;
- (double)isiCloudFamilyMember;
- (double)speedOfResponseToMessageContact;
@end

@implementation ATXMessageSenderImportanceWeights

- (ATXMessageSenderImportanceWeights)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXMessageSenderImportanceWeights;
  v2 = [(ATXMessageSenderImportanceWeights *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F4AF08] dictionaryForResource:@"ATXMessageSenderImportance" ofType:@"plist" specifiedABGroup:0];
    messageSenderImportanceWeights = v2->_messageSenderImportanceWeights;
    v2->_messageSenderImportanceWeights = (NSDictionary *)v3;
  }
  return v2;
}

- (double)isiCloudFamilyMember
{
  v2 = [(NSDictionary *)self->_messageSenderImportanceWeights objectForKeyedSubscript:@"isiCloudFamilyMember"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.5;
  }

  return v5;
}

- (double)isEmergencyContact
{
  v2 = [(NSDictionary *)self->_messageSenderImportanceWeights objectForKeyedSubscript:@"isEmergencyContact"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.5;
  }

  return v5;
}

- (double)isFavoriteContact
{
  v2 = [(NSDictionary *)self->_messageSenderImportanceWeights objectForKeyedSubscript:@"isFavoriteContact"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.5;
  }

  return v5;
}

- (double)isVIP
{
  v2 = [(NSDictionary *)self->_messageSenderImportanceWeights objectForKeyedSubscript:@"isVIP"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.5;
  }

  return v5;
}

- (double)isAudioMessage
{
  v2 = [(NSDictionary *)self->_messageSenderImportanceWeights objectForKeyedSubscript:@"isAudioMessage"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.5;
  }

  return v5;
}

- (double)isContactChatPinnedInMessage
{
  v2 = [(NSDictionary *)self->_messageSenderImportanceWeights objectForKeyedSubscript:@"isContactChatPinnedInMessage"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.5;
  }

  return v5;
}

- (double)isMentionedInGroupMessage
{
  v2 = [(NSDictionary *)self->_messageSenderImportanceWeights objectForKeyedSubscript:@"isMentionedInGroupMessage"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.5;
  }

  return v5;
}

- (double)isFrequentlyContacted
{
  v2 = [(NSDictionary *)self->_messageSenderImportanceWeights objectForKeyedSubscript:@"isFrequentlyContacted"];
  uint64_t v3 = v2;
  if (v2) {
    double v4 = (double)(int)[v2 intValue];
  }
  else {
    double v4 = 0.25;
  }

  return v4;
}

- (double)contactHasBeencontactedToday
{
  v2 = [(NSDictionary *)self->_messageSenderImportanceWeights objectForKeyedSubscript:@"contactedToday"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.25;
  }

  return v5;
}

- (double)speedOfResponseToMessageContact
{
  v2 = [(NSDictionary *)self->_messageSenderImportanceWeights objectForKeyedSubscript:@"speedOfResponse"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end