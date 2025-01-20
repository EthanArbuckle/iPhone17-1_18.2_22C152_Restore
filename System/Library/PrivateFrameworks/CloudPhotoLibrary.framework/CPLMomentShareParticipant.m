@interface CPLMomentShareParticipant
+ (BOOL)supportsSecureCoding;
+ (id)momentShareParticipantsFromParticipants:(id)a3;
+ (id)shareParticipantsFromMomentShareParticipants:(id)a3;
- (BOOL)hasiCloudAccount;
- (BOOL)isCurrentUser;
- (CPLMomentShareParticipant)initWithCoder:(id)a3;
- (CPLMomentShareParticipant)initWithShareParticipant:(id)a3;
- (NSPersonNameComponents)nameComponents;
- (NSString)email;
- (NSString)phoneNumber;
- (NSString)userIdentifier;
- (id)asShareParticipant;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (signed)status;
- (signed)type;
- (void)setEmail:(id)a3;
- (void)setHasiCloudAccount:(BOOL)a3;
- (void)setIsCurrentUser:(BOOL)a3;
- (void)setNameComponents:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setStatus:(signed __int16)a3;
- (void)setType:(signed __int16)a3;
- (void)setUserIdentifier:(id)a3;
@end

@implementation CPLMomentShareParticipant

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 cplCopyPropertiesFromObject:self withCopyBlock:0];
  return v4;
}

- (CPLMomentShareParticipant)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPLMomentShareParticipant;
  v5 = [(CPLMomentShareParticipant *)&v8 init];
  v6 = v5;
  if (v5) {
    [v5 cplDecodePropertiesFromCoder:v4];
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_email, 0);
}

- (void)setStatus:(signed __int16)a3
{
  self->_status = a3;
}

- (signed)status
{
  return self->_status;
}

- (void)setType:(signed __int16)a3
{
  self->_type = a3;
}

- (signed)type
{
  return self->_type;
}

- (void)setIsCurrentUser:(BOOL)a3
{
  self->_isCurrentUser = a3;
}

- (BOOL)isCurrentUser
{
  return self->_isCurrentUser;
}

- (void)setHasiCloudAccount:(BOOL)a3
{
  self->_hasiCloudAccount = a3;
}

- (BOOL)hasiCloudAccount
{
  return self->_hasiCloudAccount;
}

- (void)setNameComponents:(id)a3
{
}

- (NSPersonNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (void)setUserIdentifier:(id)a3
{
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setEmail:(id)a3
{
}

- (NSString)email
{
  return self->_email;
}

- (id)description
{
  if (self->_hasiCloudAccount) {
    v2 = @"iCloud";
  }
  else {
    v2 = @"Non-iCloud";
  }
  return (id)[NSString stringWithFormat:@"%@|%@|%@ %@ %@", *(_OWORD *)&self->_email, self->_userIdentifier, self->_nameComponents, v2];
}

- (id)asShareParticipant
{
  v3 = [[CPLShareParticipant alloc] initWithUserIdentifier:self->_userIdentifier];
  [(CPLShareParticipant *)v3 setIsCurrentUser:self->_isCurrentUser];
  [(CPLShareParticipant *)v3 setRole:self->_type];
  [(CPLShareParticipant *)v3 setAcceptanceStatus:self->_status];
  [(CPLShareParticipant *)v3 setEmail:self->_email];
  [(CPLShareParticipant *)v3 setPhoneNumber:self->_phoneNumber];
  [(CPLShareParticipant *)v3 setNameComponents:self->_nameComponents];
  [(CPLShareParticipant *)v3 setHasiCloudAccount:self->_hasiCloudAccount];
  return v3;
}

- (CPLMomentShareParticipant)initWithShareParticipant:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CPLMomentShareParticipant;
  v5 = [(CPLMomentShareParticipant *)&v19 init];
  if (v5)
  {
    v6 = [v4 userIdentifier];
    uint64_t v7 = [v6 copy];
    userIdentifier = v5->_userIdentifier;
    v5->_userIdentifier = (NSString *)v7;

    v5->_isCurrentUser = [v4 isCurrentUser];
    v5->_type = [v4 role];
    v5->_status = [v4 acceptanceStatus];
    v9 = [v4 email];
    uint64_t v10 = [v9 copy];
    email = v5->_email;
    v5->_email = (NSString *)v10;

    v12 = [v4 phoneNumber];
    uint64_t v13 = [v12 copy];
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v13;

    v15 = [v4 nameComponents];
    uint64_t v16 = [v15 copy];
    nameComponents = v5->_nameComponents;
    v5->_nameComponents = (NSPersonNameComponents *)v16;

    v5->_hasiCloudAccount = [v4 hasiCloudAccount];
  }

  return v5;
}

+ (id)shareParticipantsFromMomentShareParticipants:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 count];
  if (v4)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v4];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "asShareParticipant", (void)v13);
          [v5 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

+ (id)momentShareParticipantsFromParticipants:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 count];
  if (v4)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v4];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          v12 = [CPLMomentShareParticipant alloc];
          long long v13 = -[CPLMomentShareParticipant initWithShareParticipant:](v12, "initWithShareParticipant:", v11, (void)v15);
          [v5 addObject:v13];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

@end