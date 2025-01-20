@interface _EDCombinedMessageInfo
- (EMMessage)deduplicatedMessage;
- (EMMessage)message;
- (NSMutableArray)dates;
- (NSMutableArray)flags;
- (NSMutableSet)mailboxes;
- (_EDCombinedMessageInfo)init;
- (id)combinedDate;
- (id)combinedMailboxes;
- (id)combinedMessageFlags;
- (int64_t)lowestDatabaseID;
- (void)addMessage:(id)a3 withDatabaseID:(int64_t)a4;
- (void)setDates:(id)a3;
- (void)setFlags:(id)a3;
- (void)setLowestDatabaseID:(int64_t)a3;
- (void)setMailboxes:(id)a3;
- (void)setMessage:(id)a3;
@end

@implementation _EDCombinedMessageInfo

- (_EDCombinedMessageInfo)init
{
  v10.receiver = self;
  v10.super_class = (Class)_EDCombinedMessageInfo;
  v2 = [(_EDCombinedMessageInfo *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
    mailboxes = v2->_mailboxes;
    v2->_mailboxes = (NSMutableSet *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    flags = v2->_flags;
    v2->_flags = (NSMutableArray *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    dates = v2->_dates;
    v2->_dates = (NSMutableArray *)v7;
  }
  return v2;
}

- (EMMessage)deduplicatedMessage
{
  v4 = [(_EDCombinedMessageInfo *)self message];
  if (!v4)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"EDBatchingMessageQueryIterator.m" lineNumber:69 description:@"Don't have primary message for combined message info."];
  }
  if ((unint64_t)[(NSMutableArray *)self->_dates count] > 1)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F60320]);
    uint64_t v7 = [v4 objectID];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __45___EDCombinedMessageInfo_deduplicatedMessage__block_invoke;
    v10[3] = &unk_1E6BFF848;
    v10[4] = self;
    id v11 = v4;
    id v5 = (id)[v6 initWithObjectID:v7 builder:v10];
  }
  else
  {
    id v5 = v4;
  }

  return (EMMessage *)v5;
}

- (void)addMessage:(id)a3 withDatabaseID:(int64_t)a4
{
  id v15 = a3;
  if (!v15)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"EDBatchingMessageQueryIterator.m", 125, @"Invalid parameter not satisfying: %@", @"message != nil" object file lineNumber description];
  }
  if (!self->_message || self->_lowestDatabaseID > a4)
  {
    objc_storeStrong((id *)&self->_message, a3);
    self->_lowestDatabaseID = a4;
  }
  v8 = [(_EDCombinedMessageInfo *)self mailboxes];
  v9 = [v15 mailboxes];
  [v8 addObjectsFromArray:v9];

  objc_super v10 = [(_EDCombinedMessageInfo *)self flags];
  id v11 = [v15 flags];
  [v10 addObject:v11];

  v12 = [(_EDCombinedMessageInfo *)self dates];
  v13 = [v15 date];
  [v12 addObject:v13];
}

- (id)combinedMailboxes
{
  v2 = [(_EDCombinedMessageInfo *)self mailboxes];
  uint64_t v3 = objc_msgSend(v2, "ef_notEmpty");
  v4 = [v3 allObjects];

  return v4;
}

- (id)combinedMessageFlags
{
  uint64_t v3 = [(_EDCombinedMessageInfo *)self flags];
  if ([v3 count])
  {
    v4 = (void *)MEMORY[0x1E4F60320];
    id v5 = [(_EDCombinedMessageInfo *)self flags];
    id v6 = [v4 combinedFlagsForMessageListItemFlags:v5 forDisplay:1];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)combinedDate
{
  v2 = [(_EDCombinedMessageInfo *)self dates];
  uint64_t v3 = objc_msgSend(v2, "ef_reduce:", &__block_literal_global_4);

  return v3;
}

- (EMMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (int64_t)lowestDatabaseID
{
  return self->_lowestDatabaseID;
}

- (void)setLowestDatabaseID:(int64_t)a3
{
  self->_lowestDatabaseID = a3;
}

- (NSMutableSet)mailboxes
{
  return self->_mailboxes;
}

- (void)setMailboxes:(id)a3
{
}

- (NSMutableArray)flags
{
  return self->_flags;
}

- (void)setFlags:(id)a3
{
}

- (NSMutableArray)dates
{
  return self->_dates;
}

- (void)setDates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dates, 0);
  objc_storeStrong((id *)&self->_flags, 0);
  objc_storeStrong((id *)&self->_mailboxes, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

@end