@interface LNMessageConversation
+ (BOOL)supportsSecureCoding;
- (LNMessageConversation)initWithCoder:(id)a3;
- (LNMessageConversation)initWithMessageConversationIdentifier:(id)a3 groupName:(id)a4 recipients:(id)a5;
- (NSArray)recipients;
- (NSString)groupName;
- (NSString)messageConversationIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNMessageConversation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_messageConversationIdentifier, 0);
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (NSString)messageConversationIdentifier
{
  return self->_messageConversationIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNMessageConversation *)self messageConversationIdentifier];
  [v4 encodeObject:v5 forKey:@"messageConversationIdentifier"];

  v6 = [(LNMessageConversation *)self groupName];
  [v4 encodeObject:v6 forKey:@"groupName"];

  id v7 = [(LNMessageConversation *)self recipients];
  [v4 encodeObject:v7 forKey:@"recipients"];
}

- (LNMessageConversation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"messageConversationIdentifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupName"];
  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"recipients"];

  if (v5)
  {
    self = [(LNMessageConversation *)self initWithMessageConversationIdentifier:v5 groupName:v6 recipients:v10];
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (LNMessageConversation)initWithMessageConversationIdentifier:(id)a3 groupName:(id)a4 recipients:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"LNMessageConversation.m", 20, @"Invalid parameter not satisfying: %@", @"messageConversationIdentifier" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)LNMessageConversation;
  v12 = [(LNMessageConversation *)&v22 init];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    messageConversationIdentifier = v12->_messageConversationIdentifier;
    v12->_messageConversationIdentifier = (NSString *)v13;

    uint64_t v15 = [v10 copy];
    groupName = v12->_groupName;
    v12->_groupName = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    recipients = v12->_recipients;
    v12->_recipients = (NSArray *)v17;

    v19 = v12;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end