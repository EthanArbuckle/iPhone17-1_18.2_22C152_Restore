@interface CNAssistantCommandClear
- (CNContactStore)contactStore;
- (void)clearAceDomainObjects;
- (void)setContactStore:(id)a3;
@end

@implementation CNAssistantCommandClear

- (void)setContactStore:(id)a3
{
}

- (CNContactStore)contactStore
{
  contactStore = self->_contactStore;
  if (!contactStore)
  {
    v4 = (CNContactStore *)objc_alloc_init(MEMORY[0x263EFEA58]);
    v5 = self->_contactStore;
    self->_contactStore = v4;

    contactStore = self->_contactStore;
  }

  return contactStore;
}

- (void)clearAceDomainObjects
{
  if ((objc_msgSend_removeAllUpdates(CNAssistantCache, a2, v2) & 1) == 0)
  {
    v3 = *MEMORY[0x263F28380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28380], OS_LOG_TYPE_DEBUG)) {
      sub_221CB0D10(v3);
    }
  }
}

- (void).cxx_destruct
{
}

@end