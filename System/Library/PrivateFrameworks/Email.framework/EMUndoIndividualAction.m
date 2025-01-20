@interface EMUndoIndividualAction
+ (BOOL)supportsSecureCoding;
- (BOOL)blockSender;
- (ECMessageFlagChange)flagChange;
- (EMCategory)category;
- (EMFollowUp)followUp;
- (EMUndoIndividualAction)initWithCoder:(id)a3;
- (NSArray)messageDatabaseIDs;
- (NSDate)readLaterDate;
- (NSURL)destinationMailboxURL;
- (int64_t)actionType;
- (int64_t)conversationID;
- (int64_t)conversationNotificationLevel;
- (void)encodeWithCoder:(id)a3;
- (void)setActionType:(int64_t)a3;
- (void)setBlockSender:(BOOL)a3;
- (void)setCategory:(id)a3;
- (void)setConversationID:(int64_t)a3;
- (void)setConversationNotificationLevel:(int64_t)a3;
- (void)setDestinationMailboxURL:(id)a3;
- (void)setFlagChange:(id)a3;
- (void)setFollowUp:(id)a3;
- (void)setMessageDatabaseIDs:(id)a3;
- (void)setReadLaterDate:(id)a3;
@end

@implementation EMUndoIndividualAction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMUndoIndividualAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)EMUndoIndividualAction;
  v5 = [(EMUndoIndividualAction *)&v22 init];
  if (v5)
  {
    v5->_actionType = [v4 decodeIntegerForKey:@"EFPropertyKey_actionType"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"EFPropertyKey_messageDatabaseIDs"];
    messageDatabaseIDs = v5->_messageDatabaseIDs;
    v5->_messageDatabaseIDs = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_destinationMailboxURL"];
    destinationMailboxURL = v5->_destinationMailboxURL;
    v5->_destinationMailboxURL = (NSURL *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_flagChange"];
    flagChange = v5->_flagChange;
    v5->_flagChange = (ECMessageFlagChange *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_readLaterDate"];
    readLaterDate = v5->_readLaterDate;
    v5->_readLaterDate = (NSDate *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_followUp"];
    followUp = v5->_followUp;
    v5->_followUp = (EMFollowUp *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_category"];
    category = v5->_category;
    v5->_category = (EMCategory *)v19;

    v5->_blockSender = [v4 decodeBoolForKey:@"EFPropertyKey_blockSender"];
    v5->_conversationID = [v4 decodeInt64ForKey:@"EFPropertyKey_conversationID"];
    v5->_conversationNotificationLevel = [v4 decodeIntegerForKey:@"EFPropertyKey_conversationNotificationLevel"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  objc_msgSend(v10, "encodeInteger:forKey:", -[EMUndoIndividualAction actionType](self, "actionType"), @"EFPropertyKey_actionType");
  id v4 = [(EMUndoIndividualAction *)self messageDatabaseIDs];
  [v10 encodeObject:v4 forKey:@"EFPropertyKey_messageDatabaseIDs"];

  v5 = [(EMUndoIndividualAction *)self destinationMailboxURL];
  [v10 encodeObject:v5 forKey:@"EFPropertyKey_destinationMailboxURL"];

  v6 = [(EMUndoIndividualAction *)self flagChange];
  [v10 encodeObject:v6 forKey:@"EFPropertyKey_flagChange"];

  uint64_t v7 = [(EMUndoIndividualAction *)self readLaterDate];
  [v10 encodeObject:v7 forKey:@"EFPropertyKey_readLaterDate"];

  v8 = [(EMUndoIndividualAction *)self followUp];
  [v10 encodeObject:v8 forKey:@"EFPropertyKey_followUp"];

  uint64_t v9 = [(EMUndoIndividualAction *)self category];
  [v10 encodeObject:v9 forKey:@"EFPropertyKey_category"];

  objc_msgSend(v10, "encodeBool:forKey:", -[EMUndoIndividualAction blockSender](self, "blockSender"), @"EFPropertyKey_blockSender");
  objc_msgSend(v10, "encodeInt64:forKey:", -[EMUndoIndividualAction conversationID](self, "conversationID"), @"EFPropertyKey_conversationID");
  objc_msgSend(v10, "encodeInteger:forKey:", -[EMUndoIndividualAction conversationNotificationLevel](self, "conversationNotificationLevel"), @"EFPropertyKey_conversationNotificationLevel");
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(int64_t)a3
{
  self->_actionType = a3;
}

- (NSArray)messageDatabaseIDs
{
  return self->_messageDatabaseIDs;
}

- (void)setMessageDatabaseIDs:(id)a3
{
}

- (ECMessageFlagChange)flagChange
{
  return self->_flagChange;
}

- (void)setFlagChange:(id)a3
{
}

- (NSURL)destinationMailboxURL
{
  return self->_destinationMailboxURL;
}

- (void)setDestinationMailboxURL:(id)a3
{
}

- (NSDate)readLaterDate
{
  return self->_readLaterDate;
}

- (void)setReadLaterDate:(id)a3
{
}

- (EMFollowUp)followUp
{
  return self->_followUp;
}

- (void)setFollowUp:(id)a3
{
}

- (BOOL)blockSender
{
  return self->_blockSender;
}

- (void)setBlockSender:(BOOL)a3
{
  self->_blockSender = a3;
}

- (int64_t)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(int64_t)a3
{
  self->_conversationID = a3;
}

- (int64_t)conversationNotificationLevel
{
  return self->_conversationNotificationLevel;
}

- (void)setConversationNotificationLevel:(int64_t)a3
{
  self->_conversationNotificationLevel = a3;
}

- (EMCategory)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_followUp, 0);
  objc_storeStrong((id *)&self->_readLaterDate, 0);
  objc_storeStrong((id *)&self->_destinationMailboxURL, 0);
  objc_storeStrong((id *)&self->_flagChange, 0);
  objc_storeStrong((id *)&self->_messageDatabaseIDs, 0);
}

@end