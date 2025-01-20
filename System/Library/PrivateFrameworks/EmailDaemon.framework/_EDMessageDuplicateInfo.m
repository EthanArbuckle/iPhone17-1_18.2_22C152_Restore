@interface _EDMessageDuplicateInfo
- (EDMailboxProvider)mailboxProvider;
- (EDPersistedMessage)primaryPersistedMessage;
- (NSMutableArray)dates;
- (NSMutableArray)flags;
- (NSMutableSet)mailboxes;
- (_EDMessageDuplicateInfo)initWithMailboxProvider:(id)a3;
- (id)combinedDate;
- (id)combinedMailboxes;
- (id)combinedMessageFlags;
- (void)addMessage:(id)a3;
- (void)setDates:(id)a3;
- (void)setFlags:(id)a3;
- (void)setMailboxProvider:(id)a3;
- (void)setMailboxes:(id)a3;
- (void)setPrimaryPersistedMessage:(id)a3;
@end

@implementation _EDMessageDuplicateInfo

- (_EDMessageDuplicateInfo)initWithMailboxProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EDMessageDuplicateInfo;
  v6 = [(_EDMessageDuplicateInfo *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mailboxProvider, a3);
  }

  return v7;
}

- (NSMutableSet)mailboxes
{
  mailboxes = self->_mailboxes;
  if (!mailboxes)
  {
    v4 = [MEMORY[0x1E4F1CA80] set];
    id v5 = self->_mailboxes;
    self->_mailboxes = v4;

    mailboxes = self->_mailboxes;
  }

  return mailboxes;
}

- (NSMutableArray)flags
{
  flags = self->_flags;
  if (!flags)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    id v5 = self->_flags;
    self->_flags = v4;

    flags = self->_flags;
  }

  return flags;
}

- (NSMutableArray)dates
{
  dates = self->_dates;
  if (!dates)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    id v5 = self->_dates;
    self->_dates = v4;

    dates = self->_dates;
  }

  return dates;
}

- (void)addMessage:(id)a3
{
  id v16 = a3;
  if (!v16)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"EDMessageTransformer.m", 83, @"Invalid parameter not satisfying: %@", @"message != nil" object file lineNumber description];
  }
  if (!self->_primaryPersistedMessage
    || ([v16 persistedMessageID],
        v6 = objc_claimAutoreleasedReturnValue(),
        [(EDPersistedMessage *)self->_primaryPersistedMessage persistedMessageID],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v6 < v7))
  {
    objc_storeStrong((id *)&self->_primaryPersistedMessage, a3);
  }
  v8 = [(_EDMessageDuplicateInfo *)self mailboxProvider];
  objc_super v9 = +[EDMessageTransformer mailboxesForPersistedMessage:v16 mailboxProvider:v8];

  v10 = [(_EDMessageDuplicateInfo *)self mailboxes];
  [v10 addObjectsFromArray:v9];

  v11 = [(_EDMessageDuplicateInfo *)self flags];
  v12 = [v16 flags];
  [v11 addObject:v12];

  v13 = [(_EDMessageDuplicateInfo *)self dates];
  v14 = [v16 dateReceived];
  [v13 addObject:v14];
}

- (id)combinedMailboxes
{
  v2 = [(_EDMessageDuplicateInfo *)self mailboxes];
  v3 = objc_msgSend(v2, "ef_notEmpty");
  v4 = [v3 allObjects];

  return v4;
}

- (id)combinedMessageFlags
{
  v3 = [(_EDMessageDuplicateInfo *)self flags];
  if ([v3 count])
  {
    v4 = (void *)MEMORY[0x1E4F60320];
    id v5 = [(_EDMessageDuplicateInfo *)self flags];
    v6 = [v4 combinedFlagsForMessageListItemFlags:v5 forDisplay:1];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)combinedDate
{
  v2 = [(_EDMessageDuplicateInfo *)self dates];
  v3 = objc_msgSend(v2, "ef_reduce:", &__block_literal_global_51);

  return v3;
}

- (EDMailboxProvider)mailboxProvider
{
  return self->_mailboxProvider;
}

- (void)setMailboxProvider:(id)a3
{
}

- (EDPersistedMessage)primaryPersistedMessage
{
  return self->_primaryPersistedMessage;
}

- (void)setPrimaryPersistedMessage:(id)a3
{
}

- (void)setMailboxes:(id)a3
{
}

- (void)setFlags:(id)a3
{
}

- (void)setDates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dates, 0);
  objc_storeStrong((id *)&self->_flags, 0);
  objc_storeStrong((id *)&self->_mailboxes, 0);
  objc_storeStrong((id *)&self->_primaryPersistedMessage, 0);

  objc_storeStrong((id *)&self->_mailboxProvider, 0);
}

@end