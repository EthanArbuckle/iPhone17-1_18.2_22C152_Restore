@interface ECExchangeAccount
+ (id)standardPorts;
+ (id)standardSSLPorts;
- (NSDate)lastSyncDate;
- (NSString)folderHierarchySyncState;
- (NSString)inboxMailboxName;
- (NSString)journalMailboxName;
- (int64_t)defaultPortNumber;
- (int64_t)defaultSecurePortNumber;
- (void)setFolderHierarchySyncState:(id)a3;
- (void)setInboxMailboxName:(id)a3;
- (void)setJournalMailboxName:(id)a3;
- (void)setLastSyncDate:(id)a3;
@end

@implementation ECExchangeAccount

- (NSString)inboxMailboxName
{
  v2 = [(ECAccount *)self dataclassProperties];
  v3 = [v2 objectForKeyedSubscript:@"InboxMailboxName"];

  return (NSString *)v3;
}

- (void)setInboxMailboxName:(id)a3
{
}

- (NSString)journalMailboxName
{
  v2 = [(ECAccount *)self dataclassProperties];
  v3 = [v2 objectForKeyedSubscript:@"JournalMailboxName"];

  return (NSString *)v3;
}

- (void)setJournalMailboxName:(id)a3
{
}

- (NSString)folderHierarchySyncState
{
  v2 = [(ECAccount *)self dataclassProperties];
  v3 = [v2 objectForKeyedSubscript:@"FolderHierarchySyncState"];

  return (NSString *)v3;
}

- (void)setFolderHierarchySyncState:(id)a3
{
}

+ (id)standardPorts
{
  return &unk_1F1A73158;
}

+ (id)standardSSLPorts
{
  return &unk_1F1A73170;
}

- (int64_t)defaultPortNumber
{
  return 80;
}

- (int64_t)defaultSecurePortNumber
{
  return 443;
}

- (NSDate)lastSyncDate
{
  return self->_lastSyncDate;
}

- (void)setLastSyncDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end