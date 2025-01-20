@interface CTLazuliGroupChatInformation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliGroupChatInformation:(id)a3;
- (CTLazuliGroupChatContributionID)contributionID;
- (CTLazuliGroupChatConversationID)conversationID;
- (CTLazuliGroupChatIcon)icon;
- (CTLazuliGroupChatInformation)initWithCoder:(id)a3;
- (CTLazuliGroupChatInformation)initWithReflection:(const void *)a3;
- (CTLazuliGroupChatParticipant)mastermind;
- (CTLazuliGroupChatParticipantList)participants;
- (CTLazuliGroupChatSubject)subject;
- (CTLazuliGroupChatUri)remoteUri;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setContributionID:(id)a3;
- (void)setConversationID:(id)a3;
- (void)setIcon:(id)a3;
- (void)setMastermind:(id)a3;
- (void)setParticipants:(id)a3;
- (void)setRemoteUri:(id)a3;
- (void)setSubject:(id)a3;
@end

@implementation CTLazuliGroupChatInformation

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliGroupChatInformation *)self participants];
  [v3 appendFormat:@", participants = %@", v4];

  v5 = [(CTLazuliGroupChatInformation *)self conversationID];
  [v3 appendFormat:@", conversationID = %@", v5];

  v6 = [(CTLazuliGroupChatInformation *)self contributionID];
  [v3 appendFormat:@", contributionID = %@", v6];

  v7 = [(CTLazuliGroupChatInformation *)self remoteUri];
  [v3 appendFormat:@", remoteUri = %@", v7];

  v8 = [(CTLazuliGroupChatInformation *)self subject];
  [v3 appendFormat:@", subject = %@", v8];

  v9 = [(CTLazuliGroupChatInformation *)self icon];
  [v3 appendFormat:@", icon = %@", v9];

  v10 = [(CTLazuliGroupChatInformation *)self mastermind];
  [v3 appendFormat:@", mastermind = %@", v10];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliGroupChatInformation:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliGroupChatInformation *)self participants];
  v6 = [v4 participants];
  if ([v5 isEqualToCTLazuliGroupChatParticipantList:v6])
  {
    v7 = [(CTLazuliGroupChatInformation *)self conversationID];
    v8 = [v4 conversationID];
    if (![v7 isEqualToCTLazuliGroupChatConversationID:v8])
    {
      char v11 = 0;
LABEL_38:

      goto LABEL_39;
    }
    v9 = [(CTLazuliGroupChatInformation *)self contributionID];
    v10 = [v4 contributionID];
    if (![v9 isEqualToCTLazuliGroupChatContributionID:v10])
    {
      char v11 = 0;
LABEL_37:

      goto LABEL_38;
    }
    v29 = [(CTLazuliGroupChatInformation *)self remoteUri];
    if (v29 || ([v4 remoteUri], (v23 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v30 = [(CTLazuliGroupChatInformation *)self remoteUri];
      v28 = [v4 remoteUri];
      if (!objc_msgSend(v30, "isEqualToCTLazuliGroupChatUri:"))
      {
        char v11 = 0;
LABEL_33:

LABEL_34:
        if (!v29) {

        }
        goto LABEL_37;
      }
      int v25 = 1;
    }
    else
    {
      v23 = 0;
      int v25 = 0;
    }
    v26 = [(CTLazuliGroupChatInformation *)self subject];
    if (v26 || ([v4 subject], (v18 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v27 = [(CTLazuliGroupChatInformation *)self subject];
      v24 = [v4 subject];
      if (!objc_msgSend(v27, "isEqualToCTLazuliGroupChatSubject:"))
      {
        char v11 = 0;
LABEL_29:

        goto LABEL_30;
      }
      int v20 = 1;
    }
    else
    {
      v18 = 0;
      int v20 = 0;
    }
    v21 = [(CTLazuliGroupChatInformation *)self icon];
    if (v21 || ([v4 icon], (v16 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v22 = [(CTLazuliGroupChatInformation *)self icon];
      v19 = [v4 icon];
      if (!objc_msgSend(v22, "isEqualToCTLazuliGroupChatIcon:"))
      {
        char v11 = 0;
        goto LABEL_26;
      }
      int v17 = 1;
    }
    else
    {
      v16 = 0;
      int v17 = 0;
    }
    v12 = [(CTLazuliGroupChatInformation *)self mastermind];
    v13 = [v4 mastermind];
    char v11 = [v12 isEqualToCTLazuliGroupChatParticipant:v13];

    if (!v17)
    {
      v15 = v21;
      if (!v21) {
        v15 = v16;
      }

      if (v20) {
        goto LABEL_29;
      }
      goto LABEL_30;
    }
LABEL_26:

    if (!v21) {
    if (v20)
    }
      goto LABEL_29;
LABEL_30:
    if (!v26) {

    }
    if (!v25) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  char v11 = 0;
LABEL_39:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliGroupChatInformation *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliGroupChatInformation *)self isEqualToCTLazuliGroupChatInformation:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliGroupChatInformation allocWithZone:a3];
  [(CTLazuliGroupChatInformation *)v4 setParticipants:self->_participants];
  [(CTLazuliGroupChatInformation *)v4 setConversationID:self->_conversationID];
  [(CTLazuliGroupChatInformation *)v4 setContributionID:self->_contributionID];
  [(CTLazuliGroupChatInformation *)v4 setRemoteUri:self->_remoteUri];
  [(CTLazuliGroupChatInformation *)v4 setSubject:self->_subject];
  [(CTLazuliGroupChatInformation *)v4 setIcon:self->_icon];
  [(CTLazuliGroupChatInformation *)v4 setMastermind:self->_mastermind];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_participants forKey:@"kParticipantsKey"];
  [v4 encodeObject:self->_conversationID forKey:@"kConversationIDKey"];
  [v4 encodeObject:self->_contributionID forKey:@"kContributionIDKey"];
  [v4 encodeObject:self->_remoteUri forKey:@"kRemoteUriKey"];
  [v4 encodeObject:self->_subject forKey:@"kSubjectKey"];
  [v4 encodeObject:self->_icon forKey:@"kIconKey"];
  [v4 encodeObject:self->_mastermind forKey:@"kMastermindKey"];
}

- (CTLazuliGroupChatInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CTLazuliGroupChatInformation;
  v5 = [(CTLazuliGroupChatInformation *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kParticipantsKey"];
    participants = v5->_participants;
    v5->_participants = (CTLazuliGroupChatParticipantList *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kConversationIDKey"];
    conversationID = v5->_conversationID;
    v5->_conversationID = (CTLazuliGroupChatConversationID *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kContributionIDKey"];
    contributionID = v5->_contributionID;
    v5->_contributionID = (CTLazuliGroupChatContributionID *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kRemoteUriKey"];
    remoteUri = v5->_remoteUri;
    v5->_remoteUri = (CTLazuliGroupChatUri *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSubjectKey"];
    subject = v5->_subject;
    v5->_subject = (CTLazuliGroupChatSubject *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kIconKey"];
    icon = v5->_icon;
    v5->_icon = (CTLazuliGroupChatIcon *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMastermindKey"];
    mastermind = v5->_mastermind;
    v5->_mastermind = (CTLazuliGroupChatParticipant *)v18;
  }
  return v5;
}

- (CTLazuliGroupChatInformation)initWithReflection:(const void *)a3
{
  v23.receiver = self;
  v23.super_class = (Class)CTLazuliGroupChatInformation;
  id v4 = [(CTLazuliGroupChatInformation *)&v23 init];
  if (!v4) {
    return v4;
  }
  v5 = [[CTLazuliGroupChatParticipantList alloc] initWithReflection:a3];
  participants = v4->_participants;
  v4->_participants = v5;

  v7 = [[CTLazuliGroupChatConversationID alloc] initWithReflection:(char *)a3 + 48];
  conversationID = v4->_conversationID;
  v4->_conversationID = v7;

  v9 = [[CTLazuliGroupChatContributionID alloc] initWithReflection:(char *)a3 + 72];
  contributionID = v4->_contributionID;
  v4->_contributionID = v9;

  if (*((unsigned char *)a3 + 168))
  {
    char v11 = [CTLazuliGroupChatUri alloc];
    if (!*((unsigned char *)a3 + 168)) {
      goto LABEL_16;
    }
    uint64_t v12 = [(CTLazuliGroupChatUri *)v11 initWithReflection:(char *)a3 + 96];
    remoteUri = v4->_remoteUri;
    v4->_remoteUri = (CTLazuliGroupChatUri *)v12;
  }
  else
  {
    remoteUri = v4->_remoteUri;
    v4->_remoteUri = 0;
  }

  if (*((unsigned char *)a3 + 200))
  {
    uint64_t v14 = [CTLazuliGroupChatSubject alloc];
    if (!*((unsigned char *)a3 + 200)) {
      goto LABEL_16;
    }
    uint64_t v15 = [(CTLazuliGroupChatSubject *)v14 initWithReflection:(char *)a3 + 176];
    subject = v4->_subject;
    v4->_subject = (CTLazuliGroupChatSubject *)v15;
  }
  else
  {
    subject = v4->_subject;
    v4->_subject = 0;
  }

  if (!*((unsigned char *)a3 + 280))
  {
    icon = v4->_icon;
    v4->_icon = 0;
    goto LABEL_14;
  }
  int v17 = [CTLazuliGroupChatIcon alloc];
  if (*((unsigned char *)a3 + 280))
  {
    uint64_t v18 = [(CTLazuliGroupChatIcon *)v17 initWithReflection:(char *)a3 + 208];
    icon = v4->_icon;
    v4->_icon = (CTLazuliGroupChatIcon *)v18;
LABEL_14:

    int v20 = [[CTLazuliGroupChatParticipant alloc] initWithReflection:(char *)a3 + 288];
    mastermind = v4->_mastermind;
    v4->_mastermind = v20;

    return v4;
  }
LABEL_16:
  result = (CTLazuliGroupChatInformation *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliGroupChatParticipantList)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
}

- (CTLazuliGroupChatConversationID)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(id)a3
{
}

- (CTLazuliGroupChatContributionID)contributionID
{
  return self->_contributionID;
}

- (void)setContributionID:(id)a3
{
}

- (CTLazuliGroupChatUri)remoteUri
{
  return self->_remoteUri;
}

- (void)setRemoteUri:(id)a3
{
}

- (CTLazuliGroupChatSubject)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
}

- (CTLazuliGroupChatIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (CTLazuliGroupChatParticipant)mastermind
{
  return self->_mastermind;
}

- (void)setMastermind:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mastermind, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_remoteUri, 0);
  objc_storeStrong((id *)&self->_contributionID, 0);
  objc_storeStrong((id *)&self->_conversationID, 0);

  objc_storeStrong((id *)&self->_participants, 0);
}

@end