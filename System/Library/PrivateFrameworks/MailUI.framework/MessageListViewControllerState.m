@interface MessageListViewControllerState
- (BOOL)canShowReadLaterDate;
- (BOOL)containsArchiveMailbox;
- (BOOL)containsDraftsMailbox;
- (BOOL)containsDraftsOrOutbox;
- (BOOL)containsFollowUpMailbox;
- (BOOL)containsInbox;
- (BOOL)containsOnlyInboxScope;
- (BOOL)containsOutbox;
- (BOOL)containsReadLaterMailbox;
- (BOOL)containsSendLaterMailbox;
- (BOOL)containsSent;
- (BOOL)containsSmartMailbox;
- (BOOL)containsTrashMailbox;
- (BOOL)didAlertOnBlankCell;
- (BOOL)didRecordTailspin;
- (BOOL)hasDateBasedSortOrder;
- (BOOL)isCommerceMailbox;
- (BOOL)isCompact;
- (BOOL)isEditing;
- (BOOL)isOutgoingMailbox;
- (BOOL)isSearch;
- (BOOL)isSenderSpecificMailbox;
- (BOOL)isSortedAscending;
- (BOOL)isUnifiedMailbox;
- (BOOL)shouldDisplayUnreadAndVIP;
- (BOOL)useSplitViewStyling;
- (NSArray)sortDescriptors;
- (NSString)debugDescription;
- (NSString)ef_publicDescription;
- (NSString)sortKeyPath;
- (id)_dateBasedSortDescriptor;
- (void)setCanShowReadLaterDate:(BOOL)a3;
- (void)setContainsArchiveMailbox:(BOOL)a3;
- (void)setContainsDraftsMailbox:(BOOL)a3;
- (void)setContainsDraftsOrOutbox:(BOOL)a3;
- (void)setContainsFollowUpMailbox:(BOOL)a3;
- (void)setContainsInbox:(BOOL)a3;
- (void)setContainsOnlyInboxScope:(BOOL)a3;
- (void)setContainsOutbox:(BOOL)a3;
- (void)setContainsReadLaterMailbox:(BOOL)a3;
- (void)setContainsSendLaterMailbox:(BOOL)a3;
- (void)setContainsSent:(BOOL)a3;
- (void)setContainsSmartMailbox:(BOOL)a3;
- (void)setContainsTrashMailbox:(BOOL)a3;
- (void)setDidAlertOnBlankCell:(BOOL)a3;
- (void)setDidRecordTailspin:(BOOL)a3;
- (void)setHasDateBasedSortOrder:(BOOL)a3;
- (void)setIsCommerceMailbox:(BOOL)a3;
- (void)setIsCompact:(BOOL)a3;
- (void)setIsEditing:(BOOL)a3;
- (void)setIsOutgoingMailbox:(BOOL)a3;
- (void)setIsSearch:(BOOL)a3;
- (void)setIsSenderSpecificMailbox:(BOOL)a3;
- (void)setIsSortedAscending:(BOOL)a3;
- (void)setIsUnifiedMailbox:(BOOL)a3;
- (void)setShouldDisplayUnreadAndVIP:(BOOL)a3;
- (void)setSortKeyPath:(id)a3;
- (void)setUseSplitViewStyling:(BOOL)a3;
- (void)updateWithMailboxes:(id)a3 senderSpecificMessageListItem:(id)a4;
@end

@implementation MessageListViewControllerState

- (void)setCanShowReadLaterDate:(BOOL)a3
{
  self->_canShowReadLaterDate = a3;
}

- (void)updateWithMailboxes:(id)a3 senderSpecificMessageListItem:(id)a4
{
  id v8 = a3;
  -[MessageListViewControllerState setContainsInbox:](self, "setContainsInbox:", objc_msgSend(v8, "ef_any:", &__block_literal_global_9));
  -[MessageListViewControllerState setContainsSent:](self, "setContainsSent:", objc_msgSend(v8, "ef_any:", &__block_literal_global_4_0));
  if ([(MessageListViewControllerState *)self containsInbox]) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = objc_msgSend(v8, "ef_any:", &__block_literal_global_6);
  }
  [(MessageListViewControllerState *)self setContainsOnlyInboxScope:v6];
  -[MessageListViewControllerState setContainsArchiveMailbox:](self, "setContainsArchiveMailbox:", objc_msgSend(v8, "ef_any:", &__block_literal_global_8));
  -[MessageListViewControllerState setContainsDraftsMailbox:](self, "setContainsDraftsMailbox:", objc_msgSend(v8, "ef_any:", &__block_literal_global_10));
  -[MessageListViewControllerState setContainsOutbox:](self, "setContainsOutbox:", objc_msgSend(v8, "ef_any:", &__block_literal_global_12));
  BOOL v7 = [(MessageListViewControllerState *)self containsDraftsMailbox]
    || [(MessageListViewControllerState *)self containsOutbox];
  [(MessageListViewControllerState *)self setContainsDraftsOrOutbox:v7];
  -[MessageListViewControllerState setIsOutgoingMailbox:](self, "setIsOutgoingMailbox:", objc_msgSend(v8, "ef_all:", &__block_literal_global_14));
  -[MessageListViewControllerState setContainsTrashMailbox:](self, "setContainsTrashMailbox:", objc_msgSend(v8, "ef_any:", &__block_literal_global_16));
  -[MessageListViewControllerState setIsUnifiedMailbox:](self, "setIsUnifiedMailbox:", objc_msgSend(v8, "ef_all:", &__block_literal_global_18));
  -[MessageListViewControllerState setContainsSmartMailbox:](self, "setContainsSmartMailbox:", objc_msgSend(v8, "ef_any:", &__block_literal_global_20));
  -[MessageListViewControllerState setContainsReadLaterMailbox:](self, "setContainsReadLaterMailbox:", objc_msgSend(v8, "em_containsSmartMailboxType:", 9));
  -[MessageListViewControllerState setContainsSendLaterMailbox:](self, "setContainsSendLaterMailbox:", objc_msgSend(v8, "em_containsSmartMailboxType:", 11));
  -[MessageListViewControllerState setContainsFollowUpMailbox:](self, "setContainsFollowUpMailbox:", objc_msgSend(v8, "em_containsSmartMailboxType:", 10));
  if (a4)
  {
    [(MessageListViewControllerState *)self setIsCommerceMailbox:0];
    [(MessageListViewControllerState *)self setIsSenderSpecificMailbox:1];
  }
}

- (BOOL)containsDraftsMailbox
{
  return self->_containsDraftsMailbox;
}

- (BOOL)containsOutbox
{
  return self->_containsOutbox;
}

- (void)setIsUnifiedMailbox:(BOOL)a3
{
  self->_isUnifiedMailbox = a3;
}

- (void)setIsOutgoingMailbox:(BOOL)a3
{
  self->_isOutgoingMailbox = a3;
}

- (void)setContainsTrashMailbox:(BOOL)a3
{
  self->_containsTrashMailbox = a3;
}

- (void)setContainsSmartMailbox:(BOOL)a3
{
  self->_containsSmartMailbox = a3;
}

- (void)setContainsSent:(BOOL)a3
{
  self->_containsSent = a3;
}

- (void)setContainsSendLaterMailbox:(BOOL)a3
{
  self->_containsSendLaterMailbox = a3;
}

- (void)setContainsReadLaterMailbox:(BOOL)a3
{
  self->_containsReadLaterMailbox = a3;
}

- (void)setContainsOutbox:(BOOL)a3
{
  self->_containsOutbox = a3;
}

- (void)setContainsOnlyInboxScope:(BOOL)a3
{
  self->_containsOnlyInboxScope = a3;
}

- (void)setContainsInbox:(BOOL)a3
{
  self->_containsInbox = a3;
}

- (void)setContainsFollowUpMailbox:(BOOL)a3
{
  self->_containsFollowUpMailbox = a3;
}

- (void)setContainsDraftsOrOutbox:(BOOL)a3
{
  self->_containsDraftsOrOutbox = a3;
}

- (void)setContainsDraftsMailbox:(BOOL)a3
{
  self->_containsDraftsMailbox = a3;
}

- (void)setContainsArchiveMailbox:(BOOL)a3
{
  self->_containsArchiveMailbox = a3;
}

- (NSString)ef_publicDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v4 = objc_opt_class();
  [(MessageListViewControllerState *)self isCompact];
  v5 = NSStringFromBOOL();
  [(MessageListViewControllerState *)self useSplitViewStyling];
  uint64_t v6 = NSStringFromBOOL();
  [(MessageListViewControllerState *)self isEditing];
  BOOL v7 = NSStringFromBOOL();
  [(MessageListViewControllerState *)self isSearch];
  id v8 = NSStringFromBOOL();
  v9 = (void *)[v3 initWithFormat:@"<%@: %p> isCompact=%@, useSplitViewStyling=%@, isEditing=%@, isSearch=%@", v4, self, v5, v6, v7, v8];

  [(MessageListViewControllerState *)self isCommerceMailbox];
  v10 = NSStringFromBOOL();
  [(MessageListViewControllerState *)self isSenderSpecificMailbox];
  v11 = NSStringFromBOOL();
  [v9 appendFormat:@", isCommerceMailbox=%@, isSenderSpecificMailbox=%@", v10, v11];

  v12 = (void *)[v9 copy];
  return (NSString *)v12;
}

- (BOOL)isCommerceMailbox
{
  return self->_isCommerceMailbox;
}

- (BOOL)containsInbox
{
  return self->_containsInbox;
}

- (BOOL)isOutgoingMailbox
{
  return self->_isOutgoingMailbox;
}

- (BOOL)isSearch
{
  return self->_isSearch;
}

- (BOOL)canShowReadLaterDate
{
  return self->_canShowReadLaterDate;
}

- (BOOL)shouldDisplayUnreadAndVIP
{
  return self->_shouldDisplayUnreadAndVIP;
}

- (BOOL)containsFollowUpMailbox
{
  return self->_containsFollowUpMailbox;
}

- (BOOL)useSplitViewStyling
{
  return self->_useSplitViewStyling;
}

- (BOOL)isSenderSpecificMailbox
{
  return self->_isSenderSpecificMailbox;
}

- (BOOL)isCompact
{
  return self->_isCompact;
}

- (BOOL)containsSmartMailbox
{
  return self->_containsSmartMailbox;
}

- (void)setIsSearch:(BOOL)a3
{
  self->_isSearch = a3;
}

- (void)setIsCompact:(BOOL)a3
{
  self->_isCompact = a3;
}

- (BOOL)isEditing
{
  return self->_isEditing;
}

- (BOOL)containsDraftsOrOutbox
{
  return self->_containsDraftsOrOutbox;
}

uint64_t __84__MessageListViewControllerState_updateWithMailboxes_senderSpecificMessageListItem___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 isOutgoingMailbox];
}

uint64_t __84__MessageListViewControllerState_updateWithMailboxes_senderSpecificMessageListItem___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isSentMailbox];
}

uint64_t __84__MessageListViewControllerState_updateWithMailboxes_senderSpecificMessageListItem___block_invoke_10(uint64_t a1, void *a2)
{
  return [a2 isSmartMailbox];
}

- (void)setUseSplitViewStyling:(BOOL)a3
{
  self->_useSplitViewStyling = a3;
}

- (BOOL)isUnifiedMailbox
{
  return self->_isUnifiedMailbox;
}

- (void)setShouldDisplayUnreadAndVIP:(BOOL)a3
{
  self->_shouldDisplayUnreadAndVIP = a3;
}

- (BOOL)containsSent
{
  return self->_containsSent;
}

- (NSArray)sortDescriptors
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(MessageListViewControllerState *)self sortKeyPath];
  if ([v3 length])
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F60390], "sortDescriptorForKeyPath:ascending:", v3, -[MessageListViewControllerState isSortedAscending](self, "isSortedAscending"));
    v5 = [MEMORY[0x1E4F1CA48] arrayWithObject:v4];
    if (![(MessageListViewControllerState *)self hasDateBasedSortOrder])
    {
      uint64_t v6 = -[MessageListViewControllerState _dateBasedSortDescriptor](self);
      [v5 addObject:v6];
    }
  }
  else
  {
    BOOL v7 = -[MessageListViewControllerState _dateBasedSortDescriptor](self);
    v9[0] = v7;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  return (NSArray *)v5;
}

- (NSString)sortKeyPath
{
  return self->_sortKeyPath;
}

- (id)_dateBasedSortDescriptor
{
  id v1 = a1;
  if (a1)
  {
    id v2 = (id)*MEMORY[0x1E4F5FE38];
    int v3 = [v1 containsReadLaterMailbox];
    int v4 = [v1 containsSendLaterMailbox];
    int v5 = [v1 containsSent];
    if ((v5 & 1) != 0 || (v4 & 1) != 0 || v3)
    {
      BOOL v7 = (id *)MEMORY[0x1E4F5FE30];
      id v8 = (id *)MEMORY[0x1E4F5FF18];
      uint64_t v6 = v5 ^ 1u;
      if (!v4) {
        id v8 = (id *)MEMORY[0x1E4F5FEF8];
      }
      if (!v5) {
        BOOL v7 = v8;
      }
      id v9 = *v7;

      id v2 = v9;
    }
    else
    {
      uint64_t v6 = 0;
    }
    id v1 = [MEMORY[0x1E4F60390] sortDescriptorForKeyPath:v2 ascending:v6];
  }
  return v1;
}

- (BOOL)containsSendLaterMailbox
{
  return self->_containsSendLaterMailbox;
}

- (BOOL)containsReadLaterMailbox
{
  return self->_containsReadLaterMailbox;
}

BOOL __84__MessageListViewControllerState_updateWithMailboxes_senderSpecificMessageListItem___block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 isSmartMailbox] && objc_msgSend(v2, "smartMailboxType") == 8;

  return v3;
}

BOOL __84__MessageListViewControllerState_updateWithMailboxes_senderSpecificMessageListItem___block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 type] == 3;
}

BOOL __84__MessageListViewControllerState_updateWithMailboxes_senderSpecificMessageListItem___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 type] == 6;
}

BOOL __84__MessageListViewControllerState_updateWithMailboxes_senderSpecificMessageListItem___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 type] == 5;
}

BOOL __84__MessageListViewControllerState_updateWithMailboxes_senderSpecificMessageListItem___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 type] == 2;
}

BOOL __84__MessageListViewControllerState_updateWithMailboxes_senderSpecificMessageListItem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 7;
}

- (void)setDidRecordTailspin:(BOOL)a3
{
  self->_didRecordTailspin = a3;
}

- (void)setDidAlertOnBlankCell:(BOOL)a3
{
  self->_didAlertOnBlankCell = a3;
}

uint64_t __84__MessageListViewControllerState_updateWithMailboxes_senderSpecificMessageListItem___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isSmartMailbox])
  {
    BOOL v3 = [v2 mailboxScope];
  }
  else
  {
    BOOL v3 = 0;
  }
  uint64_t v4 = [v3 containsOnlyInboxType];

  return v4;
}

- (NSString)debugDescription
{
  id v22 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v21 = objc_opt_class();
  [(MessageListViewControllerState *)self isCompact];
  v35 = NSStringFromBOOL();
  [(MessageListViewControllerState *)self useSplitViewStyling];
  v34 = NSStringFromBOOL();
  [(MessageListViewControllerState *)self shouldDisplayUnreadAndVIP];
  v33 = NSStringFromBOOL();
  [(MessageListViewControllerState *)self canShowReadLaterDate];
  v31 = NSStringFromBOOL();
  [(MessageListViewControllerState *)self containsInbox];
  v32 = NSStringFromBOOL();
  [(MessageListViewControllerState *)self containsSent];
  v20 = NSStringFromBOOL();
  [(MessageListViewControllerState *)self containsOnlyInboxScope];
  v30 = NSStringFromBOOL();
  [(MessageListViewControllerState *)self containsArchiveMailbox];
  v29 = NSStringFromBOOL();
  [(MessageListViewControllerState *)self containsDraftsMailbox];
  v28 = NSStringFromBOOL();
  [(MessageListViewControllerState *)self containsOutbox];
  v27 = NSStringFromBOOL();
  [(MessageListViewControllerState *)self containsDraftsOrOutbox];
  v19 = NSStringFromBOOL();
  [(MessageListViewControllerState *)self isOutgoingMailbox];
  v26 = NSStringFromBOOL();
  [(MessageListViewControllerState *)self containsTrashMailbox];
  v18 = NSStringFromBOOL();
  [(MessageListViewControllerState *)self isUnifiedMailbox];
  v25 = NSStringFromBOOL();
  [(MessageListViewControllerState *)self containsSmartMailbox];
  v24 = NSStringFromBOOL();
  [(MessageListViewControllerState *)self containsReadLaterMailbox];
  v17 = NSStringFromBOOL();
  [(MessageListViewControllerState *)self containsSendLaterMailbox];
  v16 = NSStringFromBOOL();
  [(MessageListViewControllerState *)self containsFollowUpMailbox];
  BOOL v3 = NSStringFromBOOL();
  [(MessageListViewControllerState *)self isEditing];
  uint64_t v4 = NSStringFromBOOL();
  [(MessageListViewControllerState *)self didAlertOnBlankCell];
  int v5 = NSStringFromBOOL();
  [(MessageListViewControllerState *)self didRecordTailspin];
  uint64_t v6 = NSStringFromBOOL();
  [(MessageListViewControllerState *)self isSearch];
  BOOL v7 = NSStringFromBOOL();
  id v8 = [(MessageListViewControllerState *)self sortDescriptors];
  v23 = objc_msgSend(v22, "initWithFormat:", @"<%@: %p> isCompact=%@, useSplitViewStyling=%@, shouldDisplayUnreadAndVIP=%@, canShowReadLaterDate=%@, containsInbox=%@, containsSent=%@, containsOnlyInboxScope=%@, containsArchiveMailbox=%@, containsDraftsMailbox=%@, containsOutbox=%@, containsDraftsOrOutbox=%@, isOutgoingMailbox=%@, containsTrashMailbox=%@, isUnifiedMailbox=%@, containsSmartMailbox=%@, containsReadLaterMailbox=%@, containsSendLaterMailbox=%@, containsFollowUpMailbox=%@, isEditing=%@, didAlertOnBlankCell=%@, didRecordTailspin=%@, isSearch=%@, sortDescriptors=%@", v21, self, v35, v34, v33, v31, v32, v20, v30, v29, v28, v27, v19, v26, v18, v25,
                  v24,
                  v17,
                  v16,
                  v3,
                  v4,
                  v5,
                  v6,
                  v7,
                  v8);

  [(MessageListViewControllerState *)self isCommerceMailbox];
  id v9 = NSStringFromBOOL();
  [(MessageListViewControllerState *)self isSenderSpecificMailbox];
  v10 = NSStringFromBOOL();
  [v23 appendFormat:@", isCommerceMailbox=%@, isSenderSpecificMailbox=%@", v9, v10];

  v11 = [(MessageListViewControllerState *)self sortKeyPath];
  [(MessageListViewControllerState *)self isSortedAscending];
  v12 = NSStringFromBOOL();
  [(MessageListViewControllerState *)self hasDateBasedSortOrder];
  v13 = NSStringFromBOOL();
  [v23 appendFormat:@", sortKeyPath=%@, isSortedAscending=%@, hasDateBasedSortOrder=%@", v11, v12, v13];

  v14 = (void *)[v23 copy];
  return (NSString *)v14;
}

- (BOOL)containsOnlyInboxScope
{
  return self->_containsOnlyInboxScope;
}

- (BOOL)containsArchiveMailbox
{
  return self->_containsArchiveMailbox;
}

- (BOOL)containsTrashMailbox
{
  return self->_containsTrashMailbox;
}

- (void)setIsEditing:(BOOL)a3
{
  self->_isEditing = a3;
}

- (BOOL)didAlertOnBlankCell
{
  return self->_didAlertOnBlankCell;
}

- (BOOL)didRecordTailspin
{
  return self->_didRecordTailspin;
}

- (void)setIsCommerceMailbox:(BOOL)a3
{
  self->_isCommerceMailbox = a3;
}

- (void)setIsSenderSpecificMailbox:(BOOL)a3
{
  self->_isSenderSpecificMailbox = a3;
}

- (void)setSortKeyPath:(id)a3
{
}

- (BOOL)isSortedAscending
{
  return self->_isSortedAscending;
}

- (void)setIsSortedAscending:(BOOL)a3
{
  self->_isSortedAscending = a3;
}

- (BOOL)hasDateBasedSortOrder
{
  return self->_hasDateBasedSortOrder;
}

- (void)setHasDateBasedSortOrder:(BOOL)a3
{
  self->_hasDateBasedSortOrder = a3;
}

- (void).cxx_destruct
{
}

@end