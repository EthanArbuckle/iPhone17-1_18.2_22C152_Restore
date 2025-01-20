@interface EMMessageConversationFlagChangeAction
+ (BOOL)supportsSecureCoding;
- (EMMessageConversationFlagChangeAction)initWithCoder:(id)a3;
- (EMMessageConversationFlagChangeAction)initWithConversationIDs:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 conversationNotificationLevel:(int64_t)a6;
- (NSArray)conversationIDs;
- (int64_t)conversationNotificationLevel;
- (int64_t)signpostType;
- (void)encodeWithCoder:(id)a3;
- (void)setConversationIDs:(id)a3;
@end

@implementation EMMessageConversationFlagChangeAction

- (EMMessageConversationFlagChangeAction)initWithConversationIDs:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 conversationNotificationLevel:(int64_t)a6
{
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)EMMessageConversationFlagChangeAction;
  v11 = [(EMMessageChangeAction *)&v15 initWithMessageListItems:0 origin:a4 actor:a5];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    conversationIDs = v11->_conversationIDs;
    v11->_conversationIDs = (NSArray *)v12;

    v11->_conversationNotificationLevel = a6;
  }

  return v11;
}

- (int64_t)signpostType
{
  return 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMessageConversationFlagChangeAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EMMessageConversationFlagChangeAction;
  v5 = [(EMMessageChangeAction *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"EFPropertyKey_conversationIDs"];
    conversationIDs = v5->_conversationIDs;
    v5->_conversationIDs = (NSArray *)v9;

    v5->_conversationNotificationLevel = [v4 decodeIntegerForKey:@"EFPropertyKey_conversationNotificationLevel"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)EMMessageConversationFlagChangeAction;
  [(EMMessageChangeAction *)&v6 encodeWithCoder:v4];
  v5 = [(EMMessageConversationFlagChangeAction *)self conversationIDs];
  [v4 encodeObject:v5 forKey:@"EFPropertyKey_conversationIDs"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[EMMessageConversationFlagChangeAction conversationNotificationLevel](self, "conversationNotificationLevel"), @"EFPropertyKey_conversationNotificationLevel");
}

- (int64_t)conversationNotificationLevel
{
  return self->_conversationNotificationLevel;
}

- (NSArray)conversationIDs
{
  return self->_conversationIDs;
}

- (void)setConversationIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end