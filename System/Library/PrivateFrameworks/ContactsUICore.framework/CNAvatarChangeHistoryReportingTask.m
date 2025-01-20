@interface CNAvatarChangeHistoryReportingTask
- (CNAvatarCacheChangeListenerDelegate)delegate;
- (CNAvatarChangeHistoryReportingTask)initWithIdentifiers:(id)a3 delegate:(id)a4;
- (NSArray)identifiers;
- (id)run:(id *)a3;
@end

@implementation CNAvatarChangeHistoryReportingTask

- (CNAvatarChangeHistoryReportingTask)initWithIdentifiers:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNAvatarChangeHistoryReportingTask;
  v8 = [(CNTask *)&v13 initWithName:@"com.apple.contacts.ui.avatar-cache.change-history-reporting"];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifiers = v8->_identifiers;
    v8->_identifiers = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_delegate, a4);
    v11 = v8;
  }

  return v8;
}

- (id)run:(id *)a3
{
  uint64_t v4 = *MEMORY[0x263F334B0];
  v5 = [(CNAvatarChangeHistoryReportingTask *)self identifiers];
  LOBYTE(v4) = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  if ((v4 & 1) == 0)
  {
    id v6 = [(CNAvatarChangeHistoryReportingTask *)self delegate];
    id v7 = [(CNAvatarChangeHistoryReportingTask *)self identifiers];
    [v6 updateContactsWithIdentifiers:v7];
  }
  v8 = [MEMORY[0x263EFF9D0] null];
  return v8;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (CNAvatarCacheChangeListenerDelegate)delegate
{
  return self->_delegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end