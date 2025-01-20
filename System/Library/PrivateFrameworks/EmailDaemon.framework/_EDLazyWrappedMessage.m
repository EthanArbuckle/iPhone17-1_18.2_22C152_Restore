@interface _EDLazyWrappedMessage
- (EDMessagePersistence)messagePersistence;
- (_EDLazyWrappedMessage)initWithMessage:(id)a3 messagePersistence:(id)a4;
- (int64_t)databaseID;
@end

@implementation _EDLazyWrappedMessage

- (_EDLazyWrappedMessage)initWithMessage:(id)a3 messagePersistence:(id)a4
{
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x1E4F5FCC8];
  v12.receiver = self;
  v12.super_class = (Class)_EDLazyWrappedMessage;
  v9 = [(_EDWrappedMessage *)&v12 initWithMessage:a3 databaseID:v8];
  v10 = v9;
  if (v9) {
    objc_storeStrong((id *)&v9->_messagePersistence, a4);
  }

  return v10;
}

- (int64_t)databaseID
{
  v11[1] = *MEMORY[0x1E4F143B8];
  int64_t result = self->super._databaseID;
  if (result == *MEMORY[0x1E4F5FCC8])
  {
    v4 = [(_EDLazyWrappedMessage *)self messagePersistence];
    v5 = [(_EDWrappedMessage *)self message];
    v6 = [v5 objectID];
    v11[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    uint64_t v8 = [v4 databaseIDsDictionaryForMessageObjectIDs:v7];
    v9 = [v8 keyEnumerator];
    v10 = [v9 nextObject];

    if (v10) {
      self->super._databaseID = [v10 longLongValue];
    }

    return self->super._databaseID;
  }
  return result;
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (void).cxx_destruct
{
}

@end