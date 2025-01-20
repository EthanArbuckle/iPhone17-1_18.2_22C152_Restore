@interface MailAccount
+ (id)accountImageForAccounts:(id)a3;
+ (id)nano_activeMailAccounts;
+ (id)nano_bridgeSettingsInboxesFromAccounts:(id)a3;
- (id)_allMailboxesIncludingLocals:(BOOL)a3 withOutbox:(id)a4 hideInbox:(BOOL)a5 hideNotes:(BOOL)a6;
- (id)_emailAddressStringsFromObjects:(id)a3;
- (id)_treeOfAllMailboxesIncludingLocals:(BOOL)a3 withOutbox:(id)a4 hideInbox:(BOOL)a5 hideNotes:(BOOL)a6;
- (id)allMailboxUidsSortedWithSpecialsAtTopIncludingLocals:(BOOL)a3;
- (id)nano_emailAddressesAndAliasesList;
- (id)treeOfAllGenericMailboxes;
- (id)treeOfAllMailboxUidsSortedWithSpecialsAtTopIncludingLocals:(BOOL)a3 client:(id)a4 outbox:(id)a5;
- (void)_addGenericChildrenToMailboxTree:(id)a3 forNode:(id)a4 hideNotes:(BOOL)a5;
- (void)_addSpecialMailbox:(id)a3 toTree:(id)a4;
- (void)_loadOutbox:(id)a3;
- (void)_putMailboxesRootedAt:(id)a3 intoArray:(id)a4 hideNotes:(BOOL)a5;
- (void)addSpecialMailbox:(id)a3 toArray:(id)a4;
@end

@implementation MailAccount

+ (id)nano_activeMailAccounts
{
  id v15 = 0;
  v2 = +[MailAccount activeAccountsWithError:&v15];
  id v3 = v15;
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v2 count]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = v2;
    id v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v12;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            objc_msgSend(v4, "addObject:", v9, (void)v11);
          }
        }
        id v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v6);
    }
  }

  return v4;
}

+ (id)nano_bridgeSettingsInboxesFromAccounts:(id)a3
{
  id v3 = objc_msgSend(a3, "ef_map:", &stru_38C28);
  v4 = objc_msgSend(v3, "ef_filter:", &stru_38C68);

  return v4;
}

- (id)nano_emailAddressesAndAliasesList
{
  id v3 = [(MailAccount *)self emailAddressesAndAliasesList];
  v4 = [(MailAccount *)self _emailAddressStringsFromObjects:v3];

  return v4;
}

- (id)_emailAddressStringsFromObjects:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "ea_uncommentedAddress", (void)v11);
        [v4 addObject:v9];
      }
      id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v4;
}

+ (id)accountImageForAccounts:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 count] <= 1)
  {
    id v5 = [v3 anyObject];
    if (!qword_40AB0)
    {
      id v6 = objc_alloc_init((Class)NSMutableDictionary);
      uint64_t v7 = (void *)qword_40AB0;
      qword_40AB0 = (uint64_t)v6;
    }
    v8 = [v5 iconString];
    v4 = [(id)qword_40AB0 objectForKey:v8];
    if (!v4)
    {
      if (!qword_40AB8)
      {
        uint64_t v9 = +[NSBundle bundleForClass:objc_opt_class()];
        v10 = (void *)qword_40AB8;
        qword_40AB8 = v9;
      }
      long long v11 = +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:](UIImage, "imageNamed:inBundle:compatibleWithTraitCollection:", v8);
      v4 = [v11 _applicationIconImageForFormat:0 precomposed:1];
      if (!v4)
      {
        v4 = +[NSNull null];
      }
      [(id)qword_40AB0 setObject:v4 forKey:v8];
    }
    long long v12 = +[NSNull null];

    if (v12 == v4)
    {

      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_putMailboxesRootedAt:(id)a3 intoArray:(id)a4 hideNotes:(BOOL)a5
{
  BOOL v5 = a5;
  id v15 = a3;
  id v8 = a4;
  uint64_t v9 = [v15 childEnumerator];
  v10 = 0;
  while (1)
  {
    long long v11 = [v9 nextObject];

    if (!v11) {
      break;
    }
    id v12 = [v11 type];
    if (v12 || !v5)
    {
      v10 = v11;
      if (!v12)
      {
LABEL_8:
        [v8 addObject:v11];
        v10 = v11;
        if ([v11 hasChildren])
        {
          v10 = v11;
          [(MailAccount *)self _putMailboxesRootedAt:v11 intoArray:v8 hideNotes:0];
        }
      }
    }
    else
    {
      long long v13 = [v11 name];
      unsigned __int8 v14 = [v13 isEqualToString:@"Notes"];

      v10 = v11;
      if ((v14 & 1) == 0) {
        goto LABEL_8;
      }
    }
  }
}

- (void)_addGenericChildrenToMailboxTree:(id)a3 forNode:(id)a4 hideNotes:(BOOL)a5
{
  BOOL v5 = a5;
  id v18 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 mailbox];
  if (v9)
  {
    id v17 = v9;
    v10 = [v9 childEnumerator];
    long long v11 = 0;
    while (1)
    {
      while (1)
      {
        do
        {
          id v12 = [v10 nextObject];

          if (!v12)
          {

            uint64_t v9 = v17;
            goto LABEL_14;
          }
          objc_opt_class();
          long long v11 = v12;
        }
        while ((objc_opt_isKindOfClass() & 1) == 0);
        id v13 = [v12 type];
        if (!v13 && v5) {
          break;
        }
        long long v11 = v12;
        if (!v13) {
          goto LABEL_10;
        }
      }
      unsigned __int8 v14 = [v12 name];
      unsigned __int8 v15 = [v14 isEqualToString:@"Notes"];

      long long v11 = v12;
      if ((v15 & 1) == 0)
      {
LABEL_10:
        v16 = [v18 addChildMailbox:v12 forMailboxNode:v8];
        if ([v12 hasChildren]) {
          [(MailAccount *)self _addGenericChildrenToMailboxTree:v18 forNode:v16 hideNotes:0];
        }

        long long v11 = v12;
      }
    }
  }
LABEL_14:
}

- (void)addSpecialMailbox:(id)a3 toArray:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (v7)
  {
    [v6 addObject:v7];
    if ([v7 hasChildren]) {
      [(MailAccount *)self _putMailboxesRootedAt:v7 intoArray:v6 hideNotes:0];
    }
  }
}

- (void)_addSpecialMailbox:(id)a3 toTree:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9)
  {
    id v7 = [v6 rootMailboxNode];
    id v8 = [v6 addChildMailbox:v9 forMailboxNode:v7];

    if ([v9 hasChildren]) {
      [(MailAccount *)self _addGenericChildrenToMailboxTree:v6 forNode:v8 hideNotes:0];
    }
  }
}

- (id)_treeOfAllMailboxesIncludingLocals:(BOOL)a3 withOutbox:(id)a4 hideInbox:(BOOL)a5 hideNotes:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v26 = a4;
  v10 = [MailboxHierarchyTree alloc];
  long long v11 = [(MailAccount *)self rootMailbox];
  id v12 = [(MailboxHierarchyTree *)v10 initWithRootMailbox:v11];

  v24 = [(MailboxHierarchyTree *)v12 rootMailboxNode];
  BOOL v23 = v6;
  if (a3)
  {
    id v13 = 0;
  }
  else
  {
    id v13 = +[LocalAccount localAccount];
  }
  v25 = [(MailAccount *)self primaryMailboxUid];
  unsigned __int8 v14 = [(MailAccount *)self mailboxUidOfType:5 createIfNeeded:0];
  unsigned __int8 v15 = [(MailAccount *)self mailboxUidOfType:4 createIfNeeded:0];
  v16 = [(MailAccount *)self mailboxUidOfType:3 createIfNeeded:0];
  id v17 = [(MailAccount *)self mailboxUidOfType:2 createIfNeeded:0];
  id v18 = [(MailAccount *)self mailboxUidOfType:1 createIfNeeded:0];
  if (!v7 || [v25 hasChildren]) {
    [(MailAccount *)self _addSpecialMailbox:v25 toTree:v12];
  }
  if (a3
    || v13
    && ([v14 account], v19 = objc_claimAutoreleasedReturnValue(), v19, v19 != v13))
  {
    [(MailAccount *)self _addSpecialMailbox:v14 toTree:v12];
  }
  if (v26) {
    [(MailAccount *)self _addSpecialMailbox:v26 toTree:v12];
  }
  if (a3
    || v13
    && ([v15 account], v20 = objc_claimAutoreleasedReturnValue(), v20, v20 != v13))
  {
    [(MailAccount *)self _addSpecialMailbox:v15 toTree:v12];
  }
  if (v18) {
    [(MailAccount *)self _addSpecialMailbox:v18 toTree:v12];
  }
  if (a3
    || v13
    && ([v16 account], v21 = objc_claimAutoreleasedReturnValue(), v21, v21 != v13))
  {
    [(MailAccount *)self _addSpecialMailbox:v16 toTree:v12];
  }
  if (v17) {
    [(MailAccount *)self _addSpecialMailbox:v17 toTree:v12];
  }
  [(MailAccount *)self _addGenericChildrenToMailboxTree:v12 forNode:v24 hideNotes:v23];

  return v12;
}

- (id)_allMailboxesIncludingLocals:(BOOL)a3 withOutbox:(id)a4 hideInbox:(BOOL)a5 hideNotes:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v24 = a4;
  id v10 = objc_alloc_init((Class)NSMutableArray);
  BOOL v22 = v6;
  if (a3)
  {
    long long v11 = 0;
  }
  else
  {
    long long v11 = +[LocalAccount localAccount];
  }
  BOOL v23 = [(MailAccount *)self primaryMailboxUid];
  id v12 = [(MailAccount *)self mailboxUidOfType:5 createIfNeeded:0];
  id v13 = [(MailAccount *)self mailboxUidOfType:4 createIfNeeded:0];
  unsigned __int8 v14 = [(MailAccount *)self mailboxUidOfType:3 createIfNeeded:0];
  unsigned __int8 v15 = [(MailAccount *)self mailboxUidOfType:2 createIfNeeded:0];
  v16 = [(MailAccount *)self mailboxUidOfType:1 createIfNeeded:0];
  if (!v7 || [v23 hasChildren]) {
    [(MailAccount *)self addSpecialMailbox:v23 toArray:v10];
  }
  if (a3
    || v11
    && ([v12 account], id v17 = objc_claimAutoreleasedReturnValue(), v17, v17 != v11))
  {
    [(MailAccount *)self addSpecialMailbox:v12 toArray:v10];
  }
  if (v24) {
    [v10 addObject:v24];
  }
  if (!a3)
  {
    if (!v11) {
      goto LABEL_20;
    }
    id v18 = [v13 account];

    if (v18 == v11) {
      goto LABEL_18;
    }
  }
  [(MailAccount *)self addSpecialMailbox:v13 toArray:v10];
  if (!a3)
  {
    if (!v11) {
      goto LABEL_20;
    }
LABEL_18:
    v19 = [v14 account];

    if (v19 == v11) {
      goto LABEL_20;
    }
  }
  [(MailAccount *)self addSpecialMailbox:v14 toArray:v10];
LABEL_20:
  if (v15) {
    [(MailAccount *)self addSpecialMailbox:v15 toArray:v10];
  }
  if (v16) {
    [(MailAccount *)self addSpecialMailbox:v16 toArray:v10];
  }
  v20 = [(MailAccount *)self rootMailbox];
  [(MailAccount *)self _putMailboxesRootedAt:v20 intoArray:v10 hideNotes:v22];

  return v10;
}

- (void)_loadOutbox:(id)a3
{
  id v13 = a3;
  v4 = +[UIApplication sharedApplication];
  BOOL v5 = [v4 daemonInterface];
  BOOL v6 = [v5 accountRepository];

  BOOL v7 = [(MailAccount *)self identifier];
  id v8 = [v6 accountForAccountIdentifier:v7];

  id v9 = +[UIApplication sharedApplication];
  id v10 = [v9 daemonInterface];
  long long v11 = [v10 outgoingMessageRepository];

  if ([v11 outboxContainsMessageFromAccount:v8])
  {
    id v12 = +[MailAccount outboxMailboxUid];
    [v13 shouldReloadMailboxesWithOutbox:v12];
  }
}

- (id)treeOfAllMailboxUidsSortedWithSpecialsAtTopIncludingLocals:(BOOL)a3 client:(id)a4 outbox:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = objc_opt_respondsToSelector();
  long long v11 = +[MailAccount log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [(MailAccount *)self ef_publicDescription];
    int v17 = 138543874;
    id v18 = v12;
    __int16 v19 = 2114;
    id v20 = v8;
    __int16 v21 = 1024;
    int v22 = v10 & 1;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "<%{public}@> client:%{public}@, clientRespondsToReload:%{BOOL}d", (uint8_t *)&v17, 0x1Cu);
  }
  if (!v9 && v6 && ((v10 ^ 1) & 1) == 0)
  {
    id v13 = +[MFMonitoredInvocation invocationWithSelector:"_loadOutbox:" target:self object:v8 taskName:@"LoadOutboxTask" priority:12 canBeCancelled:1];
    unsigned __int8 v14 = +[MFInvocationQueue sharedInvocationQueue];
    [v14 addInvocation:v13];
  }
  unsigned __int8 v15 = -[MailAccount _treeOfAllMailboxesIncludingLocals:withOutbox:hideInbox:hideNotes:](self, "_treeOfAllMailboxesIncludingLocals:withOutbox:hideInbox:hideNotes:", v6, v9, [v8 shouldHideInbox], objc_msgSend(v8, "shouldHideNotesForAccount:", self));

  return v15;
}

- (id)treeOfAllGenericMailboxes
{
  id v3 = [MailboxHierarchyTree alloc];
  v4 = [(MailAccount *)self rootMailbox];
  BOOL v5 = [(MailboxHierarchyTree *)v3 initWithRootMailbox:v4];

  BOOL v6 = [(MailboxHierarchyTree *)v5 rootMailboxNode];
  [(MailAccount *)self _addGenericChildrenToMailboxTree:v5 forNode:v6 hideNotes:[(MailAccount *)self isSyncingNotes]];

  return v5;
}

- (id)allMailboxUidsSortedWithSpecialsAtTopIncludingLocals:(BOOL)a3
{
  return [(MailAccount *)self _allMailboxesIncludingLocals:a3 withOutbox:0 hideInbox:0 hideNotes:0];
}

@end