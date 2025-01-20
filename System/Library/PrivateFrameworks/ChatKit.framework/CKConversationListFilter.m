@interface CKConversationListFilter
+ (BOOL)supportsSecureCoding;
+ (CKConversationListFilter)defaultFilter;
- (BOOL)_conversation:(id)a3 matchesInbox:(unint64_t)a4;
- (BOOL)_conversation:(id)a3 matchesSpamFilterInbox:(unint64_t)a4;
- (BOOL)_conversation:(id)a3 matchesSpamFilterInboxGroup:(unint64_t)a4;
- (BOOL)_isSpamFilteredConversation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConversationListFilter:(id)a3;
- (BOOL)unreadOnly;
- (CKConversationListFilter)initWithCoder:(id)a3;
- (DNDConfiguration)focusConfiguration;
- (NSPredicate)cachedConversationPredicate;
- (NSPredicate)conversationPredicate;
- (id)_focusConfigurationSubPredicate;
- (id)_inboxSubPredicate;
- (id)_initWithInbox:(unint64_t)a3 unreadOnly:(BOOL)a4 focusConfiguration:(id)a5;
- (id)_unreadOnlySubPredicate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)filterByChangingFocusConfiguration:(id)a3;
- (id)filterByChangingInbox:(unint64_t)a3;
- (id)filterByChangingUnreadOnly:(BOOL)a3;
- (unint64_t)_defaultSpamFilterInboxForCategory:(int64_t)a3;
- (unint64_t)_spamFilterInboxForCategory:(int64_t)a3 subCategory:(int64_t)a4;
- (unint64_t)_spamFilterInboxForConversation:(id)a3;
- (unint64_t)_spamFilterInboxForConversationListInbox:(unint64_t)a3;
- (unint64_t)_spamFilterInboxGroupForConversationListInbox:(unint64_t)a3;
- (unint64_t)_spamFilterInboxGroupForInbox:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)inbox;
- (void)encodeWithCoder:(id)a3;
- (void)setCachedConversationPredicate:(id)a3;
@end

@implementation CKConversationListFilter

- (id)_inboxSubPredicate
{
  v3 = [(CKConversationListFilter *)self inbox];
  if (v3)
  {
    id location = 0;
    objc_initWeak(&location, self);
    v4 = (void *)MEMORY[0x1E4F28F60];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __53__CKConversationListFilter_Inbox___inboxSubPredicate__block_invoke;
    v6[3] = &unk_1E562A1A0;
    objc_copyWeak(v7, &location);
    v7[1] = v3;
    v3 = [v4 predicateWithBlock:v6];
    objc_destroyWeak(v7);
    objc_destroyWeak(&location);
  }

  return v3;
}

uint64_t __53__CKConversationListFilter_Inbox___inboxSubPredicate__block_invoke(uint64_t a1, void *a2)
{
  if (!a2) {
    return 0;
  }
  v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v6 = [WeakRetained _conversation:v4 matchesInbox:*(void *)(a1 + 40)];

  return v6;
}

- (BOOL)_conversation:(id)a3 matchesInbox:(unint64_t)a4
{
  id v6 = a3;
  v7 = v6;
  switch(a4)
  {
    case 0uLL:
      goto LABEL_10;
    case 1uLL:
      int v11 = [v6 isKnownSender];
      LODWORD(self) = v11 & [v7 wasKnownSender];
      break;
    case 2uLL:
      int v10 = [v6 isKnownSender];
      LODWORD(self) = v10 & [v7 wasKnownSender] ^ 1;
      break;
    case 3uLL:
      if ([(CKConversationListFilter *)self _isSpamFilteredConversation:v6]) {
        LOBYTE(self) = [(CKConversationListFilter *)self _spamFilterInboxForConversation:v7] != 0;
      }
      else {
LABEL_10:
      }
        LOBYTE(self) = 1;
      break;
    case 4uLL:
    case 5uLL:
    case 0xFuLL:
      BOOL v8 = [(CKConversationListFilter *)self _conversation:v6 matchesSpamFilterInboxGroup:[(CKConversationListFilter *)self _spamFilterInboxGroupForConversationListInbox:a4]];
      goto LABEL_4;
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
      BOOL v8 = [(CKConversationListFilter *)self _conversation:v6 matchesSpamFilterInbox:[(CKConversationListFilter *)self _spamFilterInboxForConversationListInbox:a4]];
LABEL_4:
      LOBYTE(self) = v8;
      break;
    case 0x13uLL:
      v12 = [v6 chat];
      LOBYTE(self) = [v12 recoverableMessagesCount] != 0;

      break;
    default:
      LOBYTE(self) = 0;
      break;
  }

  return (char)self;
}

- (BOOL)_isSpamFilteredConversation:(id)a3
{
  id v3 = a3;
  if (!CKMessageSpamFilteringEnabled()) {
    goto LABEL_3;
  }
  id v4 = [v3 chat];
  v5 = [v4 account];
  id v6 = [v5 service];
  v7 = [MEMORY[0x1E4F6BDB8] smsService];

  if (v6 != v7) {
    goto LABEL_3;
  }
  if ([v3 wasDetectedAsSMSCategory]) {
    int v8 = [v3 isKnownSender] ^ 1;
  }
  else {
LABEL_3:
  }
    LOBYTE(v8) = 0;

  return v8;
}

- (unint64_t)_spamFilterInboxForConversation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 spamCategory];
  uint64_t v6 = [v4 spamSubCategory];

  return [(CKConversationListFilter *)self _spamFilterInboxForCategory:v5 subCategory:v6];
}

- (unint64_t)_spamFilterInboxGroupForConversationListInbox:(unint64_t)a3
{
  unint64_t result = 0;
  switch(a3)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 0x13uLL:
      id v4 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v5 = *MEMORY[0x1E4F1C3B8];
      uint64_t v6 = @"Attempted to convert non-spam message conversation list inbox to a spam filter inbox group";
      goto LABEL_7;
    case 5uLL:
      return 1;
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
      id v4 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v5 = *MEMORY[0x1E4F1C3B8];
      uint64_t v6 = @"Attempted to convert conversation list spam inbox to a spam inbox group";
LABEL_7:
      id v7 = [v4 exceptionWithName:v5 reason:v6 userInfo:0];
      objc_exception_throw(v7);
    case 0xFuLL:
      unint64_t result = 2;
      break;
    default:
      return result;
  }
  return result;
}

- (unint64_t)_spamFilterInboxForConversationListInbox:(unint64_t)a3
{
  unint64_t result = 0;
  switch(a3)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 0x13uLL:
      id v4 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v5 = *MEMORY[0x1E4F1C3B8];
      uint64_t v6 = @"Attempted to convert non-spam message conversation list inbox to a spam filter inbox";
      goto LABEL_17;
    case 5uLL:
    case 0xFuLL:
      id v4 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v5 = *MEMORY[0x1E4F1C3B8];
      uint64_t v6 = @"Attempted to convert conversation list spam inbox group to a spam filter inbox";
LABEL_17:
      id v7 = [v4 exceptionWithName:v5 reason:v6 userInfo:0];
      objc_exception_throw(v7);
    case 6uLL:
      unint64_t result = 1;
      break;
    case 7uLL:
      unint64_t result = 2;
      break;
    case 8uLL:
      unint64_t result = 3;
      break;
    case 9uLL:
      unint64_t result = 4;
      break;
    case 0xAuLL:
      unint64_t result = 5;
      break;
    case 0xBuLL:
      unint64_t result = 6;
      break;
    case 0xCuLL:
      unint64_t result = 7;
      break;
    case 0xDuLL:
      unint64_t result = 8;
      break;
    case 0xEuLL:
      unint64_t result = 9;
      break;
    case 0x10uLL:
      unint64_t result = 10;
      break;
    case 0x11uLL:
      unint64_t result = 11;
      break;
    case 0x12uLL:
      unint64_t result = 12;
      break;
    default:
      return result;
  }
  return result;
}

- (unint64_t)_spamFilterInboxGroupForInbox:(unint64_t)a3
{
  if (a3 - 1 > 0xB) {
    return 0;
  }
  else {
    return qword_18F81D2A8[a3 - 1];
  }
}

- (BOOL)_conversation:(id)a3 matchesSpamFilterInbox:(unint64_t)a4
{
  id v6 = a3;
  if ([(CKConversationListFilter *)self _isSpamFilteredConversation:v6]) {
    BOOL v7 = [(CKConversationListFilter *)self _spamFilterInboxForConversation:v6] == a4;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_conversation:(id)a3 matchesSpamFilterInboxGroup:(unint64_t)a4
{
  id v6 = a3;
  if ([(CKConversationListFilter *)self _isSpamFilteredConversation:v6]) {
    BOOL v7 = [(CKConversationListFilter *)self _spamFilterInboxGroupForInbox:[(CKConversationListFilter *)self _spamFilterInboxForConversation:v6]] == a4;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)_spamFilterInboxForCategory:(int64_t)a3 subCategory:(int64_t)a4
{
  switch(a4)
  {
    case 0:
      unint64_t result = [(CKConversationListFilter *)self _defaultSpamFilterInboxForCategory:a3];
      break;
    case 1:
      unint64_t result = 9;
      break;
    case 2:
      unint64_t result = 1;
      break;
    case 3:
      unint64_t result = 2;
      break;
    case 4:
      unint64_t result = 3;
      break;
    case 5:
      unint64_t result = 4;
      break;
    case 6:
      unint64_t result = 5;
      break;
    case 7:
      unint64_t result = 6;
      break;
    case 8:
      unint64_t result = 7;
      break;
    case 9:
      unint64_t result = 8;
      break;
    case 10:
      unint64_t result = 12;
      break;
    case 11:
      unint64_t result = 10;
      break;
    case 12:
      unint64_t result = 11;
      break;
    default:
      unint64_t result = 0;
      break;
  }
  return result;
}

- (unint64_t)_defaultSpamFilterInboxForCategory:(int64_t)a3
{
  if (a3 == 3) {
    return 12;
  }
  if (a3 == 4) {
    return 9;
  }
  if ((unint64_t)a3 < 2)
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3B8], @"Attempted to convert non-spam message filter action to a spam filter inbox", 0, v3, v4);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  return 0;
}

- (id)_initWithInbox:(unint64_t)a3 unreadOnly:(BOOL)a4 focusConfiguration:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CKConversationListFilter;
  v9 = [(CKConversationListFilter *)&v14 init];
  int v10 = v9;
  if (v9)
  {
    v9->_inbox = a3;
    v9->_unreadOnly = a4;
    uint64_t v11 = [v8 copy];
    focusConfiguration = v10->_focusConfiguration;
    v10->_focusConfiguration = (DNDConfiguration *)v11;
  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CKConversationListFilter *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CKConversationListFilter *)self isEqualToConversationListFilter:v4];
  }

  return v5;
}

- (BOOL)isEqualToConversationListFilter:(id)a3
{
  uint64_t v4 = a3;
  BOOL v5 = v4;
  if (self->_inbox == v4[2] && self->_unreadOnly == *((unsigned __int8 *)v4 + 8))
  {
    focusConfiguration = self->_focusConfiguration;
    if ((unint64_t)focusConfiguration | v5[3]) {
      char v7 = -[DNDConfiguration isEqual:](focusConfiguration, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v2 = self->_inbox ^ self->_unreadOnly;
  return v2 ^ [(DNDConfiguration *)self->_focusConfiguration hash];
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; inbox = %ld, unreadOnly = %ld, focusConfiguration = %@>",
               objc_opt_class(),
               self,
               self->_inbox,
               self->_unreadOnly,
               self->_focusConfiguration);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [CKConversationListFilter alloc];
  BOOL unreadOnly = self->_unreadOnly;
  unint64_t inbox = self->_inbox;
  focusConfiguration = self->_focusConfiguration;

  return [(CKConversationListFilter *)v4 _initWithInbox:inbox unreadOnly:unreadOnly focusConfiguration:focusConfiguration];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t inbox = self->_inbox;
  id v5 = a3;
  [v5 encodeInteger:inbox forKey:@"i"];
  [v5 encodeBool:self->_unreadOnly forKey:@"u"];
  [v5 encodeObject:self->_focusConfiguration forKey:@"f"];
}

- (CKConversationListFilter)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKConversationListFilter;
  id v5 = [(CKConversationListFilter *)&v9 init];
  if (v5)
  {
    v5->_unint64_t inbox = [v4 decodeIntegerForKey:@"i"];
    v5->_BOOL unreadOnly = [v4 decodeBoolForKey:@"u"];
    uint64_t v6 = [v4 decodeObjectOfClass:MEMORY[0x192FBA860](@"DNDConfiguration", @"DoNotDisturb", @"f" forKey];
    focusConfiguration = v5->_focusConfiguration;
    v5->_focusConfiguration = (DNDConfiguration *)v6;
  }
  return v5;
}

- (unint64_t)inbox
{
  return self->_inbox;
}

- (BOOL)unreadOnly
{
  return self->_unreadOnly;
}

- (DNDConfiguration)focusConfiguration
{
  return self->_focusConfiguration;
}

- (NSPredicate)cachedConversationPredicate
{
  return self->_cachedConversationPredicate;
}

- (void)setCachedConversationPredicate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedConversationPredicate, 0);

  objc_storeStrong((id *)&self->_focusConfiguration, 0);
}

+ (CKConversationListFilter)defaultFilter
{
  id v2 = [[CKConversationListFilter alloc] _initWithInbox:0 unreadOnly:0 focusConfiguration:0];

  return (CKConversationListFilter *)v2;
}

- (id)filterByChangingInbox:(unint64_t)a3
{
  id v3 = [[CKConversationListFilter alloc] _initWithInbox:a3 unreadOnly:self->_unreadOnly focusConfiguration:self->_focusConfiguration];

  return v3;
}

- (id)filterByChangingUnreadOnly:(BOOL)a3
{
  id v3 = [[CKConversationListFilter alloc] _initWithInbox:self->_inbox unreadOnly:a3 focusConfiguration:self->_focusConfiguration];

  return v3;
}

- (id)filterByChangingFocusConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [[CKConversationListFilter alloc] _initWithInbox:self->_inbox unreadOnly:self->_unreadOnly focusConfiguration:v4];

  return v5;
}

- (NSPredicate)conversationPredicate
{
  p_cachedConversationPredicate = &self->_cachedConversationPredicate;
  cachedConversationPredicate = self->_cachedConversationPredicate;
  if (cachedConversationPredicate)
  {
    id v4 = cachedConversationPredicate;
    goto LABEL_16;
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  char v7 = [(CKConversationListFilter *)self _inboxSubPredicate];
  if (v7) {
    [v6 addObject:v7];
  }
  id v8 = [(CKConversationListFilter *)self _unreadOnlySubPredicate];
  if (v8) {
    [v6 addObject:v8];
  }
  objc_super v9 = [(CKConversationListFilter *)self _focusConfigurationSubPredicate];
  if (v9) {
    [v6 addObject:v9];
  }
  if ([v6 count])
  {
    if ([v6 count] != 1)
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F28BA0];
      v12 = (void *)[v6 copy];
      id v4 = [v11 andPredicateWithSubpredicates:v12];

      goto LABEL_15;
    }
    uint64_t v10 = [v6 firstObject];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }
  id v4 = (NSPredicate *)v10;
LABEL_15:
  objc_storeStrong((id *)p_cachedConversationPredicate, v4);

LABEL_16:

  return v4;
}

- (id)_unreadOnlySubPredicate
{
  if ([(CKConversationListFilter *)self unreadOnly])
  {
    id v2 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_227];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

uint64_t __62__CKConversationListFilter_Predicate___unreadOnlySubPredicate__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = [v2 hasUnreadMessages];
  unsigned int v4 = [v2 shouldHoldInUnreadFilter];

  return v3 | v4;
}

- (id)_focusConfigurationSubPredicate
{
  id v2 = [(CKConversationListFilter *)self focusConfiguration];
  int v3 = v2;
  if (v2)
  {
    unsigned int v4 = (void *)MEMORY[0x1E4F28F60];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    id v7[2] = __66__CKConversationListFilter_Focus___focusConfigurationSubPredicate__block_invoke;
    v7[3] = &unk_1E5627AB0;
    id v8 = v2;
    id v5 = [v4 predicateWithBlock:v7];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

uint64_t __66__CKConversationListFilter_Focus___focusConfigurationSubPredicate__block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 chat];
  unsigned int v4 = v3;
  if (v3)
  {
    id v5 = [v3 participantDNDContactHandles];
    uint64_t v6 = [MEMORY[0x1E4F6E788] focusConfiguration:*(void *)(a1 + 32) matchesConversationWithHandles:v5];
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

@end