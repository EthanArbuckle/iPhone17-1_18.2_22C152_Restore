@interface INSendMessageIntentDonationMetadata
+ (BOOL)supportsSecureCoding;
+ (Class)_intentClass;
- (BOOL)isBusinessChat;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReplyToCurrentUser;
- (BOOL)mentionsCurrentUser;
- (BOOL)notifyRecipientAnyway;
- (INSendMessageIntentDonationMetadata)init;
- (INSendMessageIntentDonationMetadata)initWithCoder:(id)a3;
- (NSUInteger)recipientCount;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBusinessChat:(BOOL)a3;
- (void)setMentionsCurrentUser:(BOOL)mentionsCurrentUser;
- (void)setNotifyRecipientAnyway:(BOOL)notifyRecipientAnyway;
- (void)setRecipientCount:(NSUInteger)recipientCount;
- (void)setReplyToCurrentUser:(BOOL)replyToCurrentUser;
@end

@implementation INSendMessageIntentDonationMetadata

- (void)setBusinessChat:(BOOL)a3
{
  self->_businessChat = a3;
}

- (BOOL)isBusinessChat
{
  return self->_businessChat;
}

- (void)setRecipientCount:(NSUInteger)recipientCount
{
  self->_recipientCount = recipientCount;
}

- (NSUInteger)recipientCount
{
  return self->_recipientCount;
}

- (void)setNotifyRecipientAnyway:(BOOL)notifyRecipientAnyway
{
  self->_notifyRecipientAnyway = notifyRecipientAnyway;
}

- (BOOL)notifyRecipientAnyway
{
  return self->_notifyRecipientAnyway;
}

- (void)setReplyToCurrentUser:(BOOL)replyToCurrentUser
{
  self->_replyToCurrentUser = replyToCurrentUser;
}

- (BOOL)isReplyToCurrentUser
{
  return self->_replyToCurrentUser;
}

- (void)setMentionsCurrentUser:(BOOL)mentionsCurrentUser
{
  self->_mentionsCurrentUser = mentionsCurrentUser;
}

- (BOOL)mentionsCurrentUser
{
  return self->_mentionsCurrentUser;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INSendMessageIntentDonationMetadata;
  id v4 = a3;
  [(INIntentDonationMetadata *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_mentionsCurrentUser, @"mentionsCurrentUser", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_replyToCurrentUser forKey:@"replyToCurrentUser"];
  [v4 encodeBool:self->_businessChat forKey:@"businessChat"];
  [v4 encodeBool:self->_notifyRecipientAnyway forKey:@"notifyRecipientAnyway"];
  [v4 encodeInteger:self->_recipientCount forKey:@"recipientCount"];
}

- (INSendMessageIntentDonationMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)INSendMessageIntentDonationMetadata;
  objc_super v5 = [(INIntentDonationMetadata *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->_mentionsCurrentUser = [v4 decodeBoolForKey:@"mentionsCurrentUser"];
    v5->_replyToCurrentUser = [v4 decodeBoolForKey:@"replyToCurrentUser"];
    v5->_businessChat = [v4 decodeBoolForKey:@"businessChat"];
    v5->_notifyRecipientAnyway = [v4 decodeBoolForKey:@"notifyRecipientAnyway"];
    v5->_recipientCount = [v4 decodeIntegerForKey:@"recipientCount"];
    v6 = v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)INSendMessageIntentDonationMetadata;
  id v4 = [(INIntentDonationMetadata *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setMentionsCurrentUser:", -[INSendMessageIntentDonationMetadata mentionsCurrentUser](self, "mentionsCurrentUser"));
  objc_msgSend(v4, "setReplyToCurrentUser:", -[INSendMessageIntentDonationMetadata isReplyToCurrentUser](self, "isReplyToCurrentUser"));
  objc_msgSend(v4, "setBusinessChat:", -[INSendMessageIntentDonationMetadata isBusinessChat](self, "isBusinessChat"));
  objc_msgSend(v4, "setNotifyRecipientAnyway:", -[INSendMessageIntentDonationMetadata notifyRecipientAnyway](self, "notifyRecipientAnyway"));
  objc_msgSend(v4, "setRecipientCount:", -[INSendMessageIntentDonationMetadata recipientCount](self, "recipientCount"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INSendMessageIntentDonationMetadata *)a3;
  objc_super v5 = v4;
  if (self == v4)
  {
    BOOL v12 = 1;
    goto LABEL_13;
  }
  objc_super v6 = v4;
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    objc_super v6 = 0;
LABEL_10:
    BOOL v12 = 0;
    goto LABEL_11;
  }
  BOOL v7 = [(INSendMessageIntentDonationMetadata *)self mentionsCurrentUser];
  if (v7 != [(INSendMessageIntentDonationMetadata *)v6 mentionsCurrentUser]) {
    goto LABEL_10;
  }
  BOOL v8 = [(INSendMessageIntentDonationMetadata *)self isReplyToCurrentUser];
  if (v8 != [(INSendMessageIntentDonationMetadata *)v6 isReplyToCurrentUser]) {
    goto LABEL_10;
  }
  BOOL v9 = [(INSendMessageIntentDonationMetadata *)self isBusinessChat];
  if (v9 != [(INSendMessageIntentDonationMetadata *)v6 isBusinessChat]) {
    goto LABEL_10;
  }
  BOOL v10 = [(INSendMessageIntentDonationMetadata *)self notifyRecipientAnyway];
  if (v10 != [(INSendMessageIntentDonationMetadata *)v6 notifyRecipientAnyway]) {
    goto LABEL_10;
  }
  NSUInteger v11 = [(INSendMessageIntentDonationMetadata *)self recipientCount];
  BOOL v12 = v11 == [(INSendMessageIntentDonationMetadata *)v6 recipientCount];
LABEL_11:

LABEL_13:
  return v12;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)INSendMessageIntentDonationMetadata;
  return [(INSendMessageIntentDonationMetadata *)&v3 hash] ^ self->_mentionsCurrentUser ^ self->_recipientCount;
}

- (INSendMessageIntentDonationMetadata)init
{
  v3.receiver = self;
  v3.super_class = (Class)INSendMessageIntentDonationMetadata;
  return (INSendMessageIntentDonationMetadata *)[(INIntentDonationMetadata *)&v3 _init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)_intentClass
{
  return (Class)objc_opt_class();
}

@end