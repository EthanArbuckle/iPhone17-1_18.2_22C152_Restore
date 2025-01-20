@interface ECIMAPAccount
+ (id)standardPorts;
+ (id)standardSSLPorts;
- (BOOL)compactWhenClosingMailboxes;
- (BOOL)hasServerDefinedAllMailMailbox;
- (BOOL)hasServerDefinedArchiveMailbox;
- (BOOL)hasServerDefinedDraftsMailbox;
- (BOOL)hasServerDefinedJunkMailbox;
- (BOOL)hasServerDefinedSentMailbox;
- (BOOL)hasServerDefinedTrashMailbox;
- (BOOL)ignoreServerDefinedArchiveMailbox;
- (BOOL)ignoreServerDefinedDraftsMailbox;
- (BOOL)ignoreServerDefinedJunkMailbox;
- (BOOL)ignoreServerDefinedSentMailbox;
- (BOOL)ignoreServerDefinedTrashMailbox;
- (BOOL)needsGmailLablesCleanup;
- (BOOL)queriedUserToSetPathPrefix;
- (BOOL)shouldUseGmailLabelStores;
- (BOOL)shouldUseGmailLabelStoresIsSet;
- (NSDate)dateOfLastSync;
- (id)_hostnameFromParentAccount:(id)a3;
- (id)portNumberObject;
- (id)usesSSLObject;
- (int64_t)daysBetweenSyncs;
- (int64_t)defaultPortNumber;
- (int64_t)defaultSecurePortNumber;
- (void)clearDaysBetweenSyncs;
- (void)clearQueriedUserToSetPathPrefix;
- (void)setCompactWhenClosingMailboxes:(BOOL)a3;
- (void)setDateOfLastSync:(id)a3;
- (void)setDaysBetweenSyncs:(int64_t)a3;
- (void)setHasServerDefinedAllMailMailbox:(BOOL)a3;
- (void)setHasServerDefinedArchiveMailbox:(BOOL)a3;
- (void)setHasServerDefinedDraftsMailbox:(BOOL)a3;
- (void)setHasServerDefinedJunkMailbox:(BOOL)a3;
- (void)setHasServerDefinedSentMailbox:(BOOL)a3;
- (void)setHasServerDefinedTrashMailbox:(BOOL)a3;
- (void)setIgnoreServerDefinedArchiveMailbox:(BOOL)a3;
- (void)setIgnoreServerDefinedDraftsMailbox:(BOOL)a3;
- (void)setIgnoreServerDefinedJunkMailbox:(BOOL)a3;
- (void)setIgnoreServerDefinedSentMailbox:(BOOL)a3;
- (void)setIgnoreServerDefinedTrashMailbox:(BOOL)a3;
- (void)setNeedsGmailLablesCleanup:(BOOL)a3;
- (void)setQueriedUserToSetPathPrefix:(BOOL)a3;
- (void)setShouldUseGmailLabelStores:(BOOL)a3;
@end

@implementation ECIMAPAccount

- (BOOL)compactWhenClosingMailboxes
{
  v2 = [(ECAccount *)self dataclassProperties];
  v3 = [v2 objectForKeyedSubscript:@"CompactWhenClosingMailboxes"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setCompactWhenClosingMailboxes:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");
}

- (int64_t)daysBetweenSyncs
{
  v2 = [(ECAccount *)self dataclassProperties];
  v3 = [v2 objectForKeyedSubscript:@"DaysBetweenSyncs"];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (void)setDaysBetweenSyncs:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");
}

- (void)clearDaysBetweenSyncs
{
}

- (BOOL)queriedUserToSetPathPrefix
{
  v2 = [(ECAccount *)self dataclassProperties];
  v3 = [v2 objectForKeyedSubscript:@"QueriedUserToSetPathPrefix"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setQueriedUserToSetPathPrefix:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");
}

- (void)clearQueriedUserToSetPathPrefix
{
}

- (BOOL)shouldUseGmailLabelStores
{
  v2 = [(ECAccount *)self dataclassProperties];
  v3 = [v2 objectForKeyedSubscript:@"ShouldUseGmailLabelStores"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setShouldUseGmailLabelStores:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");
}

- (BOOL)shouldUseGmailLabelStoresIsSet
{
  v2 = [(ECAccount *)self dataclassProperties];
  v3 = [v2 objectForKeyedSubscript:@"ShouldUseGmailLabelStores"];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)needsGmailLablesCleanup
{
  v2 = [(ECAccount *)self dataclassProperties];
  v3 = [v2 objectForKeyedSubscript:@"NeedsGmailLabelsCleanup"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setNeedsGmailLablesCleanup:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");
}

- (BOOL)hasServerDefinedAllMailMailbox
{
  v2 = [(ECAccount *)self dataclassProperties];
  v3 = [v2 objectForKeyedSubscript:@"HasServerDefinedAllMailMailbox"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setHasServerDefinedAllMailMailbox:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");
}

- (BOOL)hasServerDefinedArchiveMailbox
{
  v2 = [(ECAccount *)self dataclassProperties];
  v3 = [v2 objectForKeyedSubscript:@"HasServerDefinedArchiveMailbox"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setHasServerDefinedArchiveMailbox:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");
}

- (BOOL)hasServerDefinedDraftsMailbox
{
  v2 = [(ECAccount *)self dataclassProperties];
  v3 = [v2 objectForKeyedSubscript:@"HasServerDefinedDraftsMailbox"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setHasServerDefinedDraftsMailbox:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");
}

- (BOOL)hasServerDefinedJunkMailbox
{
  v2 = [(ECAccount *)self dataclassProperties];
  v3 = [v2 objectForKeyedSubscript:@"HasServerDefinedJunkMailbox"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setHasServerDefinedJunkMailbox:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");
}

- (BOOL)hasServerDefinedSentMailbox
{
  v2 = [(ECAccount *)self dataclassProperties];
  v3 = [v2 objectForKeyedSubscript:@"HasServerDefinedSentMailbox"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setHasServerDefinedSentMailbox:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");
}

- (BOOL)hasServerDefinedTrashMailbox
{
  v2 = [(ECAccount *)self dataclassProperties];
  v3 = [v2 objectForKeyedSubscript:@"HasServerDefinedTrashMailbox"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setHasServerDefinedTrashMailbox:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");
}

- (BOOL)ignoreServerDefinedArchiveMailbox
{
  v2 = [(ECAccount *)self dataclassProperties];
  v3 = [v2 objectForKeyedSubscript:@"IgnoreServerDefinedArchiveMailbox"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setIgnoreServerDefinedArchiveMailbox:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");
}

- (BOOL)ignoreServerDefinedDraftsMailbox
{
  v2 = [(ECAccount *)self dataclassProperties];
  v3 = [v2 objectForKeyedSubscript:@"IgnoreServerDefinedDraftsMailbox"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setIgnoreServerDefinedDraftsMailbox:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");
}

- (BOOL)ignoreServerDefinedJunkMailbox
{
  v2 = [(ECAccount *)self dataclassProperties];
  v3 = [v2 objectForKeyedSubscript:@"IgnoreServerDefinedJunkMailbox"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setIgnoreServerDefinedJunkMailbox:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");
}

- (BOOL)ignoreServerDefinedSentMailbox
{
  v2 = [(ECAccount *)self dataclassProperties];
  v3 = [v2 objectForKeyedSubscript:@"IgnoreServerDefinedSentMailbox"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setIgnoreServerDefinedSentMailbox:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");
}

- (BOOL)ignoreServerDefinedTrashMailbox
{
  v2 = [(ECAccount *)self dataclassProperties];
  v3 = [v2 objectForKeyedSubscript:@"IgnoreServerDefinedTrashMailbox"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setIgnoreServerDefinedTrashMailbox:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");
}

+ (id)standardPorts
{
  return &unk_1F1A73188;
}

+ (id)standardSSLPorts
{
  return &unk_1F1A731A0;
}

- (int64_t)defaultPortNumber
{
  return 143;
}

- (int64_t)defaultSecurePortNumber
{
  return 993;
}

- (id)_hostnameFromParentAccount:(id)a3
{
  v3 = [a3 propertiesForDataclass:*MEMORY[0x1E4F17AD8]];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F176B0]];

  return v4;
}

- (id)portNumberObject
{
  v12.receiver = self;
  v12.super_class = (Class)ECIMAPAccount;
  id v3 = [(ECAccount *)&v12 portNumberObject];
  if (!v3)
  {
    id v4 = [(ECAccount *)self systemAccount];
    v5 = [v4 parentAccount];

    v6 = [v5 propertiesForDataclass:*MEMORY[0x1E4F17AD8]];
    v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F176B8]];

    if (v7)
    {
      v8 = [(ECAccount *)self standardPorts];
      if ([v8 containsObject:v7])
      {
      }
      else
      {
        v9 = [(ECAccount *)self standardSSLPorts];
        char v10 = [v9 containsObject:v7];

        if ((v10 & 1) == 0)
        {
          id v3 = v7;
          goto LABEL_7;
        }
      }
    }
    id v3 = 0;
LABEL_7:
  }
  return v3;
}

- (id)usesSSLObject
{
  v9.receiver = self;
  v9.super_class = (Class)ECIMAPAccount;
  id v3 = [(ECAccount *)&v9 usesSSLObject];
  if (!v3)
  {
    id v4 = [(ECAccount *)self systemAccount];
    v5 = [v4 parentAccount];

    v6 = [v5 propertiesForDataclass:*MEMORY[0x1E4F17AD8]];
    v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F176C0]];

    if ([v7 BOOLValue]) {
      id v3 = v7;
    }
    else {
      id v3 = 0;
    }
  }
  return v3;
}

- (NSDate)dateOfLastSync
{
  return self->_dateOfLastSync;
}

- (void)setDateOfLastSync:(id)a3
{
}

- (void).cxx_destruct
{
}

@end