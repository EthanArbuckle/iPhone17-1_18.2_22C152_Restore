@interface IMAssistiveAccessCommunicationLimitManager
+ (IMAssistiveAccessCommunicationLimitManager)sharedManager;
- (BOOL)_allowsHandleIDs:(id)a3 forCommunicationLimit:(id)a4;
- (BOOL)_isAllowedContact:(id)a3 forCommunicationLimit:(id)a4;
- (BOOL)_isSelectedContact:(id)a3;
- (BOOL)_shouldFilterMessagesForCommunicationLimit:(id)a3;
- (BOOL)allowsConversationWithHandleIDs:(id)a3;
- (BOOL)allowsSendingToHandleIDs:(id)a3;
- (BOOL)isAssistiveAccessRunning;
- (BOOL)shouldFilterIncomingMessages;
- (BOOL)shouldFilterOutgoingMessages;
- (CNFavorites)favorites;
- (NSArray)favoriteHandleStrings;
- (id)_handleStringForFavoritesEntry:(id)a3;
- (id)_selectedContactFavoritesEntries;
- (void)setFavorites:(id)a3;
@end

@implementation IMAssistiveAccessCommunicationLimitManager

- (BOOL)isAssistiveAccessRunning
{
  v2 = [MEMORY[0x1E4F59088] sharedSystemShellSwitcher];
  char v3 = [v2 isClarityBoardEnabled];

  return v3;
}

+ (IMAssistiveAccessCommunicationLimitManager)sharedManager
{
  if (qword_1EB4A6200 != -1) {
    dispatch_once(&qword_1EB4A6200, &unk_1EF2BF9A0);
  }
  v2 = (void *)qword_1EB4A6120;

  return (IMAssistiveAccessCommunicationLimitManager *)v2;
}

- (BOOL)_shouldFilterMessagesForCommunicationLimit:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(IMAssistiveAccessCommunicationLimitManager *)self isAssistiveAccessRunning])
  {
LABEL_9:
    BOOL v5 = 0;
    goto LABEL_10;
  }
  if (([v4 isEqualToString:*MEMORY[0x1E4F59040]] & 1) == 0
    && ([v4 isEqualToString:*MEMORY[0x1E4F59020]] & 1) == 0)
  {
    if (([v4 isEqualToString:*MEMORY[0x1E4F59030]] & 1) == 0)
    {
      v6 = [MEMORY[0x1E4F59050] commonLog];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138412290;
        id v9 = v4;
        _os_log_impl(&dword_1A0772000, v6, OS_LOG_TYPE_DEFAULT, "Unhandled Messages communication limit: %@", (uint8_t *)&v8, 0xCu);
      }
    }
    goto LABEL_9;
  }
  BOOL v5 = 1;
LABEL_10:

  return v5;
}

- (BOOL)shouldFilterIncomingMessages
{
  char v3 = [MEMORY[0x1E4F59060] sharedInstance];
  id v4 = [v3 incomingCommunicationLimit];
  LOBYTE(self) = [(IMAssistiveAccessCommunicationLimitManager *)self _shouldFilterMessagesForCommunicationLimit:v4];

  return (char)self;
}

- (BOOL)shouldFilterOutgoingMessages
{
  char v3 = [MEMORY[0x1E4F59060] sharedInstance];
  id v4 = [v3 outgoingCommunicationLimit];
  LOBYTE(self) = [(IMAssistiveAccessCommunicationLimitManager *)self _shouldFilterMessagesForCommunicationLimit:v4];

  return (char)self;
}

- (NSArray)favoriteHandleStrings
{
  char v3 = [(IMAssistiveAccessCommunicationLimitManager *)self _selectedContactFavoritesEntries];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1A08458DC;
  v6[3] = &unk_1E5A13928;
  v6[4] = self;
  id v4 = objc_msgSend(v3, "__imArrayByApplyingBlock:", v6);

  return (NSArray *)v4;
}

- (BOOL)_allowsHandleIDs:(id)a3 forCommunicationLimit:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(IMAssistiveAccessCommunicationLimitManager *)self _shouldFilterMessagesForCommunicationLimit:v7])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          v14 = +[IMContactStore sharedInstance];
          v15 = [v14 fetchCNContactForHandleWithID:v13];

          LODWORD(v14) = [(IMAssistiveAccessCommunicationLimitManager *)self _isAllowedContact:v15 forCommunicationLimit:v7];
          if (!v14)
          {
            BOOL v16 = 0;
            goto LABEL_13;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    BOOL v16 = 1;
LABEL_13:
  }
  else
  {
    BOOL v16 = 1;
  }

  return v16;
}

- (BOOL)allowsConversationWithHandleIDs:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F59060];
  id v5 = a3;
  id v6 = [v4 sharedInstance];
  id v7 = [v6 incomingCommunicationLimit];
  LOBYTE(self) = [(IMAssistiveAccessCommunicationLimitManager *)self _allowsHandleIDs:v5 forCommunicationLimit:v7];

  return (char)self;
}

- (BOOL)allowsSendingToHandleIDs:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F59060];
  id v5 = a3;
  id v6 = [v4 sharedInstance];
  id v7 = [v6 outgoingCommunicationLimit];
  LOBYTE(self) = [(IMAssistiveAccessCommunicationLimitManager *)self _allowsHandleIDs:v5 forCommunicationLimit:v7];

  return (char)self;
}

- (BOOL)_isAllowedContact:(id)a3 forCommunicationLimit:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = +[IMContactStore isCNContactAKnownContact:v6]
    && (![v7 isEqualToString:*MEMORY[0x1E4F59040]]
     || [(IMAssistiveAccessCommunicationLimitManager *)self _isSelectedContact:v6]);

  return v8;
}

- (BOOL)_isSelectedContact:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(IMAssistiveAccessCommunicationLimitManager *)self _selectedContactFavoritesEntries];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = [v4 identifier];
        uint64_t v11 = [v9 contactProperty];
        v12 = [v11 contact];
        uint64_t v13 = [v12 identifier];
        char v14 = [v10 isEqual:v13];

        if (v14)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_selectedContactFavoritesEntries
{
  char v3 = [(IMAssistiveAccessCommunicationLimitManager *)self favorites];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1B9E8]);
    id v5 = +[IMContactStore sharedInstance];
    uint64_t v6 = [v5 getContactStore];
    uint64_t v7 = (void *)[v4 initWithContactStore:v6];
    [(IMAssistiveAccessCommunicationLimitManager *)self setFavorites:v7];
  }
  BOOL v8 = [(IMAssistiveAccessCommunicationLimitManager *)self favorites];
  uint64_t v9 = [v8 entries];
  uint64_t v10 = objc_msgSend(v9, "__imArrayByFilteringWithBlock:", &unk_1EF2C0BC0);

  return v10;
}

- (id)_handleStringForFavoritesEntry:(id)a3
{
  char v3 = [a3 contactProperty];
  id v4 = [v3 key];
  if ([v4 isEqualToString:*MEMORY[0x1E4F1AEE0]])
  {
    id v5 = [v3 value];
    uint64_t v6 = [v5 formattedStringValue];
  }
  else if ([v4 isEqualToString:*MEMORY[0x1E4F1ADC8]])
  {
    uint64_t v6 = [v3 value];
  }
  else
  {
    uint64_t v6 = &stru_1EF2CAD28;
  }

  return v6;
}

- (CNFavorites)favorites
{
  return self->_favorites;
}

- (void)setFavorites:(id)a3
{
}

- (void).cxx_destruct
{
}

@end