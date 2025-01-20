@interface EMMessageTransferAction
+ (BOOL)supportsSecureCoding;
- (BOOL)copyMessages;
- (ECMessageFlagChange)flagChange;
- (EMMessageTransferAction)initWithCoder:(id)a3;
- (EMMessageTransferAction)initWithMessageListItems:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 destinationMailbox:(id)a6 copyMessages:(BOOL)a7;
- (EMMessageTransferAction)initWithMessageListItems:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 specialDestinationMailboxType:(int64_t)a6 flagChange:(id)a7 copyMessages:(BOOL)a8;
- (EMMessageTransferAction)initWithObjectIDs:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 specialDestinationMailboxType:(int64_t)a6 flagChange:(id)a7 copyMessages:(BOOL)a8;
- (EMMessageTransferAction)initWithQuery:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 specialDestinationMailboxType:(int64_t)a6 flagChange:(id)a7 copyMessages:(BOOL)a8;
- (NSURL)destinationMailboxURL;
- (int64_t)signpostType;
- (int64_t)specialDestinationMailboxType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EMMessageTransferAction

- (EMMessageTransferAction)initWithMessageListItems:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 destinationMailbox:(id)a6 copyMessages:(BOOL)a7
{
  id v12 = a3;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)EMMessageTransferAction;
  v14 = [(EMMessageChangeAction *)&v19 initWithMessageListItems:v12 origin:a4 actor:a5];
  if (v14)
  {
    v15 = [v13 objectID];
    uint64_t v16 = [v15 url];
    destinationMailboxURL = v14->_destinationMailboxURL;
    v14->_destinationMailboxURL = (NSURL *)v16;

    v14->_copyMessages = a7;
  }

  return v14;
}

- (EMMessageTransferAction)initWithQuery:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 specialDestinationMailboxType:(int64_t)a6 flagChange:(id)a7 copyMessages:(BOOL)a8
{
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)EMMessageTransferAction;
  uint64_t v16 = [(EMMessageChangeAction *)&v19 initWithQuery:a3 origin:a4 actor:a5];
  v17 = v16;
  if (v16)
  {
    v16->_specialDestinationMailboxType = a6;
    v16->_copyMessages = a8;
    objc_storeStrong((id *)&v16->_flagChange, a7);
  }

  return v17;
}

- (EMMessageTransferAction)initWithMessageListItems:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 specialDestinationMailboxType:(int64_t)a6 flagChange:(id)a7 copyMessages:(BOOL)a8
{
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)EMMessageTransferAction;
  uint64_t v16 = [(EMMessageChangeAction *)&v19 initWithMessageListItems:a3 origin:a4 actor:a5];
  v17 = v16;
  if (v16)
  {
    v16->_specialDestinationMailboxType = a6;
    v16->_copyMessages = a8;
    objc_storeStrong((id *)&v16->_flagChange, a7);
  }

  return v17;
}

- (EMMessageTransferAction)initWithObjectIDs:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 specialDestinationMailboxType:(int64_t)a6 flagChange:(id)a7 copyMessages:(BOOL)a8
{
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)EMMessageTransferAction;
  uint64_t v16 = [(EMMessageChangeAction *)&v19 initWithObjectIDs:a3 origin:a4 actor:a5];
  v17 = v16;
  if (v16)
  {
    v16->_specialDestinationMailboxType = a6;
    v16->_copyMessages = a8;
    objc_storeStrong((id *)&v16->_flagChange, a7);
  }

  return v17;
}

- (int64_t)signpostType
{
  return 8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMessageTransferAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EMMessageTransferAction;
  v5 = [(EMMessageChangeAction *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_destinationMailboxURL"];
    destinationMailboxURL = v5->_destinationMailboxURL;
    v5->_destinationMailboxURL = (NSURL *)v6;

    v5->_specialDestinationMailboxType = [v4 decodeIntegerForKey:@"EFPropertyKey_specialDestinationMailboxType"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_flagChange"];
    flagChange = v5->_flagChange;
    v5->_flagChange = (ECMessageFlagChange *)v8;

    v5->_copyMessages = [v4 decodeBoolForKey:@"EFPropertyKey_copyMessages"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)EMMessageTransferAction;
  [(EMMessageChangeAction *)&v7 encodeWithCoder:v4];
  v5 = [(EMMessageTransferAction *)self destinationMailboxURL];
  [v4 encodeObject:v5 forKey:@"EFPropertyKey_destinationMailboxURL"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[EMMessageTransferAction specialDestinationMailboxType](self, "specialDestinationMailboxType"), @"EFPropertyKey_specialDestinationMailboxType");
  uint64_t v6 = [(EMMessageTransferAction *)self flagChange];
  [v4 encodeObject:v6 forKey:@"EFPropertyKey_flagChange"];

  objc_msgSend(v4, "encodeBool:forKey:", -[EMMessageTransferAction copyMessages](self, "copyMessages"), @"EFPropertyKey_copyMessages");
}

- (NSURL)destinationMailboxURL
{
  return self->_destinationMailboxURL;
}

- (int64_t)specialDestinationMailboxType
{
  return self->_specialDestinationMailboxType;
}

- (ECMessageFlagChange)flagChange
{
  return self->_flagChange;
}

- (BOOL)copyMessages
{
  return self->_copyMessages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flagChange, 0);
  objc_storeStrong((id *)&self->_destinationMailboxURL, 0);
}

@end