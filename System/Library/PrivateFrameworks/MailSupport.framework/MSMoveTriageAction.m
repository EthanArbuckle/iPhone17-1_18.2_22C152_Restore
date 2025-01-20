@interface MSMoveTriageAction
- (MSMoveTriageAction)initWithMessageListSelection:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 delegate:(id)a6 destinationMailbox:(id)a7 flagChange:(id)a8 copyMessages:(BOOL)a9;
- (MSMoveTriageAction)initWithMessageListSelection:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 delegate:(id)a6 destinationMailboxType:(int64_t)a7 flagChange:(id)a8 copyMessages:(BOOL)a9;
- (MSMoveTriageAction)initWithQuery:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 delegate:(id)a6 destinationMailboxType:(int64_t)a7 flagChange:(id)a8 copyMessages:(BOOL)a9;
- (id)_changeAction;
@end

@implementation MSMoveTriageAction

- (MSMoveTriageAction)initWithMessageListSelection:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 delegate:(id)a6 destinationMailbox:(id)a7 flagChange:(id)a8 copyMessages:(BOOL)a9
{
  id v16 = a7;
  id v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)MSMoveTriageAction;
  v18 = [(MSTriageAction *)&v21 initWithMessageListSelection:a3 origin:a4 actor:a5 delegate:a6];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_destinationMailbox, a7);
    objc_storeStrong((id *)&v19->_flagChange, a8);
    v19->_copyMessages = a9;
  }

  return v19;
}

- (MSMoveTriageAction)initWithMessageListSelection:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 delegate:(id)a6 destinationMailboxType:(int64_t)a7 flagChange:(id)a8 copyMessages:(BOOL)a9
{
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)MSMoveTriageAction;
  id v17 = [(MSTriageAction *)&v20 initWithMessageListSelection:a3 origin:a4 actor:a5 delegate:a6];
  v18 = v17;
  if (v17)
  {
    v17->_destinationMailboxType = a7;
    objc_storeStrong((id *)&v17->_flagChange, a8);
    v18->_copyMessages = a9;
  }

  return v18;
}

- (MSMoveTriageAction)initWithQuery:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 delegate:(id)a6 destinationMailboxType:(int64_t)a7 flagChange:(id)a8 copyMessages:(BOOL)a9
{
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)MSMoveTriageAction;
  id v17 = [(MSTriageAction *)&v20 initWithQuery:a3 origin:a4 actor:a5 delegate:a6];
  v18 = v17;
  if (v17)
  {
    v17->_destinationMailboxType = a7;
    objc_storeStrong((id *)&v17->_flagChange, a8);
    v18->_copyMessages = a9;
  }

  return v18;
}

- (id)_changeAction
{
  v3 = [(MSTriageAction *)self messageListItemSelection];
  int v4 = [v3 isSelectAll];

  destinationMailbox = self->_destinationMailbox;
  if (!v4)
  {
    if (destinationMailbox)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F603D8]);
      v7 = [(MSTriageAction *)self messageListItemSelection];
      v8 = [v7 messageListItems];
      uint64_t v13 = objc_msgSend(v12, "initWithMessageListItems:origin:actor:destinationMailbox:copyMessages:", v8, -[MSTriageAction origin](self, "origin"), -[MSTriageAction actor](self, "actor"), self->_destinationMailbox, self->_copyMessages);
    }
    else
    {
      if (!self->_destinationMailboxType) {
        goto LABEL_18;
      }
      id v17 = [(MSTriageAction *)self query];

      id v18 = objc_alloc(MEMORY[0x1E4F603D8]);
      if (v17)
      {
        v7 = [(MSTriageAction *)self query];
        v14 = objc_msgSend(v18, "initWithQuery:origin:actor:specialDestinationMailboxType:flagChange:copyMessages:", v7, -[MSTriageAction origin](self, "origin"), -[MSTriageAction actor](self, "actor"), self->_destinationMailboxType, self->_flagChange, self->_copyMessages);
        goto LABEL_11;
      }
      v7 = [(MSTriageAction *)self messageListItemSelection];
      v8 = [v7 messageListItems];
      uint64_t v13 = objc_msgSend(v18, "initWithMessageListItems:origin:actor:specialDestinationMailboxType:flagChange:copyMessages:", v8, -[MSTriageAction origin](self, "origin"), -[MSTriageAction actor](self, "actor"), self->_destinationMailboxType, self->_flagChange, self->_copyMessages);
    }
    v14 = (void *)v13;
LABEL_10:

LABEL_11:
    goto LABEL_12;
  }
  if (destinationMailbox)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F603E0]);
    v7 = [(MSTriageAction *)self messageListItemSelection];
    v8 = [v7 mailboxes];
    v9 = [(MSTriageAction *)self messageListItemSelection];
    v10 = [v9 messageListItems];
    uint64_t v11 = objc_msgSend(v6, "initWithMailboxes:messageListItemsToExclude:destinationMailbox:copyMessages:origin:actor:", v8, v10, self->_destinationMailbox, self->_copyMessages, -[MSTriageAction origin](self, "origin"), -[MSTriageAction actor](self, "actor"));
LABEL_9:
    v14 = (void *)v11;

    goto LABEL_10;
  }
  if (self->_destinationMailboxType)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F603E0]);
    v7 = [(MSTriageAction *)self messageListItemSelection];
    v8 = [v7 mailboxes];
    v9 = [(MSTriageAction *)self messageListItemSelection];
    v10 = [v9 messageListItems];
    uint64_t v11 = objc_msgSend(v15, "initWithMailboxes:messageListItemsToExclude:specialDestinationMailboxType:flagChange:copyMessages:origin:actor:", v8, v10, self->_destinationMailboxType, self->_flagChange, self->_copyMessages, -[MSTriageAction origin](self, "origin"), -[MSTriageAction actor](self, "actor"));
    goto LABEL_9;
  }
LABEL_18:
  v14 = 0;
LABEL_12:
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flagChange, 0);
  objc_storeStrong((id *)&self->_destinationMailbox, 0);
}

@end