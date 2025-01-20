@interface ATXMailSenderImportanceWeights
- (ATXMailSenderImportanceWeights)init;
- (double)isContactChatPinnedInMessage;
- (double)isEmergencyContact;
- (double)isFavoriteContact;
- (double)isFrequentlyContacted;
- (double)isFromMailingList;
- (double)isVIP;
- (double)isiCloudFamilyMember;
- (double)mailContactHasBeencontactedToday;
- (double)speedOfResponseToMailContact;
@end

@implementation ATXMailSenderImportanceWeights

- (ATXMailSenderImportanceWeights)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXMailSenderImportanceWeights;
  v2 = [(ATXMailSenderImportanceWeights *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F4AF08] dictionaryForResource:@"ATXMailSenderImportance" ofType:@"plist" specifiedABGroup:0];
    mailSenderImportanceWeights = v2->_mailSenderImportanceWeights;
    v2->_mailSenderImportanceWeights = (NSDictionary *)v3;
  }
  return v2;
}

- (double)isiCloudFamilyMember
{
  v2 = [(NSDictionary *)self->_mailSenderImportanceWeights objectForKeyedSubscript:@"isiCloudFamilyMember"];
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
  v2 = [(NSDictionary *)self->_mailSenderImportanceWeights objectForKeyedSubscript:@"isEmergencyContact"];
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
  v2 = [(NSDictionary *)self->_mailSenderImportanceWeights objectForKeyedSubscript:@"isFavoriteContact"];
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
  v2 = [(NSDictionary *)self->_mailSenderImportanceWeights objectForKeyedSubscript:@"isVIP"];
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
  v2 = [(NSDictionary *)self->_mailSenderImportanceWeights objectForKeyedSubscript:@"isContactChatPinnedInMessage"];
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
  v2 = [(NSDictionary *)self->_mailSenderImportanceWeights objectForKeyedSubscript:@"isFrequentlyContacted"];
  uint64_t v3 = v2;
  if (v2) {
    double v4 = (double)(int)[v2 intValue];
  }
  else {
    double v4 = 0.25;
  }

  return v4;
}

- (double)mailContactHasBeencontactedToday
{
  v2 = [(NSDictionary *)self->_mailSenderImportanceWeights objectForKeyedSubscript:@"contactedToday"];
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

- (double)speedOfResponseToMailContact
{
  v2 = [(NSDictionary *)self->_mailSenderImportanceWeights objectForKeyedSubscript:@"speedOfResponse"];
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

- (double)isFromMailingList
{
  v2 = [(NSDictionary *)self->_mailSenderImportanceWeights objectForKeyedSubscript:@"isFromMailingList"];
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

- (void).cxx_destruct
{
}

@end