@interface CNSaveRequestVisitationTask
- (CNChangeHistoryEventFactory)factory;
- (CNChangeHistoryEventVisitorPrivate)visitor;
- (CNSaveRequest)saveRequest;
- (CNSaveRequestVisitationTask)initWithSaveRequest:(id)a3 visitor:(id)a4 factory:(id)a5;
- (id)run:(id *)a3;
- (void)sendAddMemberToGroupEvents;
- (void)sendAddSubgroupToGroupEvents;
- (void)sendAddedContactEvents;
- (void)sendAddedGroupEvents;
- (void)sendDeletedContactEvents;
- (void)sendDeletedGroupEvents;
- (void)sendDifferentMeCardEvent;
- (void)sendLinkContactsEvents;
- (void)sendPreferredContactForImageEvents;
- (void)sendPreferredContactForNameEvents;
- (void)sendRemoveMemberFromGroupEvents;
- (void)sendRemoveSubgroupFromGroupEvents;
- (void)sendUnlinkContactEvents;
- (void)sendUpdatedContactEvents;
- (void)sendUpdatedGroupEvents;
@end

@implementation CNSaveRequestVisitationTask

- (CNSaveRequestVisitationTask)initWithSaveRequest:(id)a3 visitor:(id)a4 factory:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CNSaveRequestVisitationTask;
  v12 = [(CNTask *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_saveRequest, a3);
    objc_storeStrong((id *)&v13->_visitor, a4);
    objc_storeStrong((id *)&v13->_factory, a5);
    v14 = v13;
  }

  return v13;
}

- (id)run:(id *)a3
{
  [(CNSaveRequestVisitationTask *)self sendAddedContactEvents];
  [(CNSaveRequestVisitationTask *)self sendUpdatedContactEvents];
  [(CNSaveRequestVisitationTask *)self sendDeletedContactEvents];
  [(CNSaveRequestVisitationTask *)self sendAddedGroupEvents];
  [(CNSaveRequestVisitationTask *)self sendUpdatedGroupEvents];
  [(CNSaveRequestVisitationTask *)self sendDeletedGroupEvents];
  [(CNSaveRequestVisitationTask *)self sendAddMemberToGroupEvents];
  [(CNSaveRequestVisitationTask *)self sendRemoveMemberFromGroupEvents];
  [(CNSaveRequestVisitationTask *)self sendAddSubgroupToGroupEvents];
  [(CNSaveRequestVisitationTask *)self sendRemoveSubgroupFromGroupEvents];
  [(CNSaveRequestVisitationTask *)self sendLinkContactsEvents];
  [(CNSaveRequestVisitationTask *)self sendUnlinkContactEvents];
  [(CNSaveRequestVisitationTask *)self sendPreferredContactForNameEvents];
  [(CNSaveRequestVisitationTask *)self sendPreferredContactForImageEvents];
  [(CNSaveRequestVisitationTask *)self sendDifferentMeCardEvent];
  v4 = (void *)MEMORY[0x1E4F1CA98];

  return (id)[v4 null];
}

- (void)sendAddedContactEvents
{
  if (objc_opt_respondsToSelector())
  {
    saveRequest = self->_saveRequest;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __53__CNSaveRequestVisitationTask_sendAddedContactEvents__block_invoke;
    v4[3] = &unk_1E56B7BC8;
    v4[4] = self;
    [(CNSaveRequest *)saveRequest withEachAddedContact:v4];
  }
}

void __53__CNSaveRequestVisitationTask_sendAddedContactEvents__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 40) addContactEventWithContact:a2 containerIdentifier:a3];
  [*(id *)(*(void *)(a1 + 32) + 32) visitAddContactEvent:v4];
}

- (void)sendUpdatedContactEvents
{
  if (objc_opt_respondsToSelector())
  {
    saveRequest = self->_saveRequest;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __55__CNSaveRequestVisitationTask_sendUpdatedContactEvents__block_invoke;
    v4[3] = &unk_1E56B7BF0;
    v4[4] = self;
    [(CNSaveRequest *)saveRequest withEachUpdatedContact:v4];
  }
}

void __55__CNSaveRequestVisitationTask_sendUpdatedContactEvents__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 40) updateContactEventWithContact:a2 imagesChanged:0];
  [*(id *)(*(void *)(a1 + 32) + 32) visitUpdateContactEvent:v3];
}

- (void)sendDeletedContactEvents
{
  if (objc_opt_respondsToSelector())
  {
    saveRequest = self->_saveRequest;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __55__CNSaveRequestVisitationTask_sendDeletedContactEvents__block_invoke;
    v4[3] = &unk_1E56B7C18;
    v4[4] = self;
    [(CNSaveRequest *)saveRequest withEachDeletedContact:v4];
  }
}

void __55__CNSaveRequestVisitationTask_sendDeletedContactEvents__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 40) deleteContactEventWithContactIdentifier:a2];
  [*(id *)(*(void *)(a1 + 32) + 32) visitDeleteContactEvent:v3];
}

- (void)sendAddedGroupEvents
{
  if (objc_opt_respondsToSelector())
  {
    saveRequest = self->_saveRequest;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __51__CNSaveRequestVisitationTask_sendAddedGroupEvents__block_invoke;
    v4[3] = &unk_1E56B7C40;
    v4[4] = self;
    [(CNSaveRequest *)saveRequest withEachAddedGroup:v4];
  }
}

void __51__CNSaveRequestVisitationTask_sendAddedGroupEvents__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 40) addGroupEventWithGroup:a2 containerIdentifier:a3];
  [*(id *)(*(void *)(a1 + 32) + 32) visitAddGroupEvent:v4];
}

- (void)sendUpdatedGroupEvents
{
  if (objc_opt_respondsToSelector())
  {
    saveRequest = self->_saveRequest;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __53__CNSaveRequestVisitationTask_sendUpdatedGroupEvents__block_invoke;
    v4[3] = &unk_1E56B7C68;
    v4[4] = self;
    [(CNSaveRequest *)saveRequest withEachUpdatedGroup:v4];
  }
}

void __53__CNSaveRequestVisitationTask_sendUpdatedGroupEvents__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 40) updateGroupEventWithGroup:a2];
  [*(id *)(*(void *)(a1 + 32) + 32) visitUpdateGroupEvent:v3];
}

- (void)sendDeletedGroupEvents
{
  if (objc_opt_respondsToSelector())
  {
    saveRequest = self->_saveRequest;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __53__CNSaveRequestVisitationTask_sendDeletedGroupEvents__block_invoke;
    v4[3] = &unk_1E56B7C18;
    v4[4] = self;
    [(CNSaveRequest *)saveRequest withEachDeletedGroup:v4];
  }
}

void __53__CNSaveRequestVisitationTask_sendDeletedGroupEvents__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 40) deleteGroupEventWithGroupIdentifier:a2];
  [*(id *)(*(void *)(a1 + 32) + 32) visitDeleteGroupEvent:v3];
}

- (void)sendAddMemberToGroupEvents
{
  if (objc_opt_respondsToSelector())
  {
    saveRequest = self->_saveRequest;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __57__CNSaveRequestVisitationTask_sendAddMemberToGroupEvents__block_invoke;
    v4[3] = &unk_1E56B7C90;
    v4[4] = self;
    [(CNSaveRequest *)saveRequest withEachMemberAddedToGroup:v4];
  }
}

void __57__CNSaveRequestVisitationTask_sendAddMemberToGroupEvents__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 40) addMemberToGroupEventWithMember:a2 group:a3];
  [*(id *)(*(void *)(a1 + 32) + 32) visitAddMemberToGroupEvent:v4];
}

- (void)sendRemoveMemberFromGroupEvents
{
  if (objc_opt_respondsToSelector())
  {
    saveRequest = self->_saveRequest;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __62__CNSaveRequestVisitationTask_sendRemoveMemberFromGroupEvents__block_invoke;
    v4[3] = &unk_1E56B7C90;
    v4[4] = self;
    [(CNSaveRequest *)saveRequest withEachMemberRemovedFromGroup:v4];
  }
}

void __62__CNSaveRequestVisitationTask_sendRemoveMemberFromGroupEvents__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 40) removeMemberFromGroupEventWithMember:a2 group:a3];
  [*(id *)(*(void *)(a1 + 32) + 32) visitRemoveMemberFromGroupEvent:v4];
}

- (void)sendAddSubgroupToGroupEvents
{
  if (objc_opt_respondsToSelector())
  {
    saveRequest = self->_saveRequest;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __59__CNSaveRequestVisitationTask_sendAddSubgroupToGroupEvents__block_invoke;
    v4[3] = &unk_1E56B7CB8;
    v4[4] = self;
    [(CNSaveRequest *)saveRequest withEachSubgroupAddedToGroup:v4];
  }
}

void __59__CNSaveRequestVisitationTask_sendAddSubgroupToGroupEvents__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 40) addSubgroupToGroupEventWithSubgroup:a2 group:a3];
  [*(id *)(*(void *)(a1 + 32) + 32) visitAddSubgroupToGroupEvent:v4];
}

- (void)sendRemoveSubgroupFromGroupEvents
{
  if (objc_opt_respondsToSelector())
  {
    saveRequest = self->_saveRequest;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __64__CNSaveRequestVisitationTask_sendRemoveSubgroupFromGroupEvents__block_invoke;
    v4[3] = &unk_1E56B7CB8;
    v4[4] = self;
    [(CNSaveRequest *)saveRequest withEachSubgroupRemovedFromGroup:v4];
  }
}

void __64__CNSaveRequestVisitationTask_sendRemoveSubgroupFromGroupEvents__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 40) removeSubgroupFromGroupEventWithSubgroup:a2 group:a3];
  [*(id *)(*(void *)(a1 + 32) + 32) visitRemoveSubgroupFromGroupEvent:v4];
}

- (void)sendLinkContactsEvents
{
  if (objc_opt_respondsToSelector())
  {
    saveRequest = self->_saveRequest;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __53__CNSaveRequestVisitationTask_sendLinkContactsEvents__block_invoke;
    v4[3] = &unk_1E56B7CE0;
    v4[4] = self;
    [(CNSaveRequest *)saveRequest withEachLinkedContact:v4];
  }
}

void __53__CNSaveRequestVisitationTask_sendLinkContactsEvents__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 40) linkContactsEventWithFromContact:a2 toContact:a3 unifiedContact:0];
  [*(id *)(*(void *)(a1 + 32) + 32) visitLinkContactsEvent:v4];
}

- (void)sendUnlinkContactEvents
{
  if (objc_opt_respondsToSelector())
  {
    saveRequest = self->_saveRequest;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __54__CNSaveRequestVisitationTask_sendUnlinkContactEvents__block_invoke;
    v4[3] = &unk_1E56B7BF0;
    v4[4] = self;
    [(CNSaveRequest *)saveRequest withEachUnlinkedContact:v4];
  }
}

void __54__CNSaveRequestVisitationTask_sendUnlinkContactEvents__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 40) unlinkContactEventWithContact:a2];
  [*(id *)(*(void *)(a1 + 32) + 32) visitUnlinkContactEvent:v3];
}

- (void)sendPreferredContactForNameEvents
{
  objc_opt_respondsToSelector();
  saveRequest = self->_saveRequest;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__CNSaveRequestVisitationTask_sendPreferredContactForNameEvents__block_invoke;
  v4[3] = &unk_1E56B7CE0;
  v4[4] = self;
  [(CNSaveRequest *)saveRequest withEachContactPreferredForName:v4];
}

void __64__CNSaveRequestVisitationTask_sendPreferredContactForNameEvents__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 40) preferredContactForNameEventWithPreferredContact:a2 unifiedContact:a3];
  [*(id *)(*(void *)(a1 + 32) + 32) visitPreferredContactForNameEvent:v4];
}

- (void)sendPreferredContactForImageEvents
{
  if (objc_opt_respondsToSelector())
  {
    saveRequest = self->_saveRequest;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __65__CNSaveRequestVisitationTask_sendPreferredContactForImageEvents__block_invoke;
    v4[3] = &unk_1E56B7CE0;
    v4[4] = self;
    [(CNSaveRequest *)saveRequest withEachContactPreferredForImage:v4];
  }
}

void __65__CNSaveRequestVisitationTask_sendPreferredContactForImageEvents__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 40) preferredContactForImageEventWithPreferredContact:a2 unifiedContact:a3];
  [*(id *)(*(void *)(a1 + 32) + 32) visitPreferredContactForImageEvent:v4];
}

- (void)sendDifferentMeCardEvent
{
  if (objc_opt_respondsToSelector())
  {
    saveRequest = self->_saveRequest;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __55__CNSaveRequestVisitationTask_sendDifferentMeCardEvent__block_invoke;
    v4[3] = &unk_1E56B7C18;
    v4[4] = self;
    [(CNSaveRequest *)saveRequest withDifferentMeCard:v4];
  }
}

void __55__CNSaveRequestVisitationTask_sendDifferentMeCardEvent__block_invoke(uint64_t a1, __CFString *a2)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 40);
  if (a2) {
    id v4 = a2;
  }
  else {
    id v4 = &stru_1EE052B80;
  }
  id v5 = [v3 differentMeCardEventWithContactIdentifier:v4];
  [*(id *)(*(void *)(a1 + 32) + 32) visitDifferentMeCardEvent:v5];
}

- (CNSaveRequest)saveRequest
{
  return (CNSaveRequest *)objc_getProperty(self, a2, 24, 1);
}

- (CNChangeHistoryEventVisitorPrivate)visitor
{
  return (CNChangeHistoryEventVisitorPrivate *)objc_getProperty(self, a2, 32, 1);
}

- (CNChangeHistoryEventFactory)factory
{
  return (CNChangeHistoryEventFactory *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_visitor, 0);

  objc_storeStrong((id *)&self->_saveRequest, 0);
}

@end