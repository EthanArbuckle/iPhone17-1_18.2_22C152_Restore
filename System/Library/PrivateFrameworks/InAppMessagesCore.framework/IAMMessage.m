@interface IAMMessage
- (BOOL)requiresCloseButton;
- (IAMMessage)initWithICInAppMessageEntry:(id)a3;
- (IAMMessage)initWithIdentifier:(id)a3 messageGroupIdentifier:(id)a4 contentPages:(id)a5 requiresCloseButton:(BOOL)a6;
- (NSArray)contentPages;
- (NSString)identifier;
- (NSString)messageGroupIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation IAMMessage

- (IAMMessage)initWithIdentifier:(id)a3 messageGroupIdentifier:(id)a4 contentPages:(id)a5 requiresCloseButton:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)IAMMessage;
  v13 = [(IAMMessage *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    messageGroupIdentifier = v13->_messageGroupIdentifier;
    v13->_messageGroupIdentifier = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    contentPages = v13->_contentPages;
    v13->_contentPages = (NSArray *)v18;

    v13->_requiresCloseButton = a6;
  }

  return v13;
}

- (IAMMessage)initWithICInAppMessageEntry:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IAMMessage;
  v5 = [(IAMMessage *)&v17 init];
  if (v5)
  {
    v6 = [v4 applicationMessage];
    v7 = [v6 identifier];
    uint64_t v8 = [v7 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    id v10 = [v4 bundleIdentifier];
    uint64_t v11 = [v10 copy];
    messageGroupIdentifier = v5->_messageGroupIdentifier;
    v5->_messageGroupIdentifier = (NSString *)v11;

    v13 = [v6 contentPages];
    uint64_t v14 = objc_msgSend(v13, "iam_map:", &__block_literal_global_2);
    contentPages = v5->_contentPages;
    v5->_contentPages = (NSArray *)v14;
  }
  return v5;
}

IAMContent *__42__IAMMessage_initWithICInAppMessageEntry___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[IAMContent alloc] initWithICMessageContent:v2];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  identifier = self->_identifier;
  messageGroupIdentifier = self->_messageGroupIdentifier;
  contentPages = self->_contentPages;
  BOOL requiresCloseButton = self->_requiresCloseButton;
  return (id)[v4 initWithIdentifier:identifier messageGroupIdentifier:messageGroupIdentifier contentPages:contentPages requiresCloseButton:requiresCloseButton];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)messageGroupIdentifier
{
  return self->_messageGroupIdentifier;
}

- (NSArray)contentPages
{
  return self->_contentPages;
}

- (BOOL)requiresCloseButton
{
  return self->_requiresCloseButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentPages, 0);
  objc_storeStrong((id *)&self->_messageGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end