@interface IMDRecentsController
+ (IMDRecentsController)sharedInstance;
- (BOOL)hasRecentMessageFrom:(id)a3;
- (BOOL)hasRecentlyMessaged:(id)a3;
- (id)activeDeviceForHandle:(id)a3;
- (void)__pruneTypingContexts;
- (void)_setTimerForPruningTypingContext;
- (void)noteRecentMessageForPeople:(id)a3;
- (void)noteRecentMessageFromChatID:(id)a3;
- (void)updateLatestActiveDestination:(id)a3 ForHandle:(id)a4 incomingType:(unsigned __int8)a5;
@end

@implementation IMDRecentsController

+ (IMDRecentsController)sharedInstance
{
  if (qword_1EBE2B8F0 != -1) {
    dispatch_once(&qword_1EBE2B8F0, &unk_1F3392200);
  }
  v2 = (void *)qword_1EBE2BA30;

  return (IMDRecentsController *)v2;
}

- (void)_setTimerForPruningTypingContext
{
  if (!self->_typingContextTimer)
  {
    self->_typingContextTimer = (IMTimer *)[objc_alloc(MEMORY[0x1E4F6C3F0]) initWithTimeInterval:@"typing-indicator-cleanup" name:0 shouldWake:self target:sel___pruneTypingContexts selector:0 userInfo:1500.0];
    MEMORY[0x1F41817F8]();
  }
}

- (void)__pruneTypingContexts
{
  [(IMTimer *)self->_typingContextTimer invalidate];
  typingContextTimer = self->_typingContextTimer;
  self->_typingContextTimer = 0;

  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_1D98507F8;
  v20 = sub_1D9850808;
  id v21 = 0;
  typingContext = self->_typingContext;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1D9850810;
  v15[3] = &unk_1E6B780A8;
  v15[4] = &v16;
  [(NSMutableDictionary *)typingContext enumerateKeysAndObjectsUsingBlock:v15];
  if ([(id)v17[5] count]) {
    [(NSMutableDictionary *)self->_typingContext removeObjectsForKeys:v17[5]];
  }
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = sub_1D98507F8;
  v13 = sub_1D9850808;
  id v14 = 0;
  incomingMessagesTypingContext = self->_incomingMessagesTypingContext;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1D98508F4;
  v8[3] = &unk_1E6B780A8;
  v8[4] = &v9;
  [(NSMutableDictionary *)incomingMessagesTypingContext enumerateKeysAndObjectsUsingBlock:v8];
  if ([(id)v10[5] count]) {
    [(NSMutableDictionary *)self->_incomingMessagesTypingContext removeObjectsForKeys:v10[5]];
  }
  if (![(NSMutableDictionary *)self->_typingContext count])
  {
    v6 = self->_typingContext;
    self->_typingContext = 0;
  }
  if (![(NSMutableDictionary *)self->_incomingMessagesTypingContext count])
  {
    v7 = self->_incomingMessagesTypingContext;
    self->_incomingMessagesTypingContext = 0;
  }
  if ([(NSMutableDictionary *)self->_typingContext count]
    || [(NSMutableDictionary *)self->_incomingMessagesTypingContext count])
  {
    [(IMDRecentsController *)self _setTimerForPruningTypingContext];
  }
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v16, 8);
}

- (BOOL)hasRecentMessageFrom:(id)a3
{
  if (!a3) {
    return 0;
  }
  v3 = -[NSMutableDictionary objectForKey:](self->_incomingMessagesTypingContext, "objectForKey:");
  v4 = v3;
  BOOL v5 = v3 && !sub_1D98508A8(v3);

  return v5;
}

- (void)noteRecentMessageFromChatID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    if (!self->_incomingMessagesTypingContext)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      incomingMessagesTypingContext = self->_incomingMessagesTypingContext;
      self->_incomingMessagesTypingContext = Mutable;
    }
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:300.0];
    if (v7) {
      [(NSMutableDictionary *)self->_incomingMessagesTypingContext setObject:v7 forKey:v8];
    }

    id v4 = v8;
  }
}

- (BOOL)hasRecentlyMessaged:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = -[NSMutableDictionary objectForKey:](self->_typingContext, "objectForKey:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
          uint64_t v11 = v10;
          if (v10 && !sub_1D98508A8(v10))
          {

            BOOL v12 = 1;
            goto LABEL_14;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    BOOL v12 = 0;
LABEL_14:
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)noteRecentMessageForPeople:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    if (!self->_typingContext)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      typingContext = self->_typingContext;
      self->_typingContext = Mutable;
    }
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:300.0];
    if (v7)
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v8 = v4;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v14;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v14 != v11) {
              objc_enumerationMutation(v8);
            }
            -[NSMutableDictionary setObject:forKey:](self->_typingContext, "setObject:forKey:", v7, *(void *)(*((void *)&v13 + 1) + 8 * v12++), (void)v13);
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v10);
      }
    }
    [(IMDRecentsController *)self _setTimerForPruningTypingContext];
  }
}

- (void)updateLatestActiveDestination:(id)a3 ForHandle:(id)a4 incomingType:(unsigned __int8)a5
{
  int v5 = a5;
  id v19 = a3;
  id v8 = a4;
  if (v19 && v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    uint64_t v10 = v9;
    if (v9)
    {
      if (v5 == 1) {
        uint64_t v11 = v9;
      }
      else {
        uint64_t v11 = 0;
      }
      id v12 = v11;
      long long v13 = [[IMDMessageActiveDevice alloc] initWithIDSDestination:v19 latestDate:v10 latestReadReceiptDate:v12 hasReceivedReadReceipt:v5 == 1];
      long long v14 = [(NSMutableDictionary *)self->_activeDeviceForHandle objectForKey:v8];
      long long v15 = v14;
      if (v14 && [v14 isEqual:v13])
      {
        [v15 setLatestActiveDate:v10];
        if (v5 == 1)
        {
          [v15 setHasReceivedReadReceipt:1];
          [v15 setLatestReadReceipt:v10];
        }
      }
      else
      {
        activeDeviceForHandle = self->_activeDeviceForHandle;
        if (!activeDeviceForHandle)
        {
          Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
          uint64_t v18 = self->_activeDeviceForHandle;
          self->_activeDeviceForHandle = Mutable;

          activeDeviceForHandle = self->_activeDeviceForHandle;
        }
        [(NSMutableDictionary *)activeDeviceForHandle setObject:v13 forKey:v8];
      }
    }
  }
}

- (id)activeDeviceForHandle:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_activeDeviceForHandle objectForKey:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeDeviceForHandle, 0);
  objc_storeStrong((id *)&self->_typingContextTimer, 0);
  objc_storeStrong((id *)&self->_incomingMessagesTypingContext, 0);

  objc_storeStrong((id *)&self->_typingContext, 0);
}

@end