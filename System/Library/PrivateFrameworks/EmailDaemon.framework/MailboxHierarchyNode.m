@interface MailboxHierarchyNode
- (MFMailboxUid)parentMailbox;
- (MailboxHierarchyNode)initWithMailbox:(id)a3;
- (NSString)displayName;
- (id)_findNodeForMailbox:(id)a3 removeNode:(BOOL)a4;
- (id)children;
- (id)description;
- (id)findNodeForMailbox:(id)a3;
- (id)mailbox;
- (id)removeNodeForMailbox:(id)a3;
- (int)level;
- (void)addChild:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setLevel:(int)a3;
- (void)setParentMailbox:(id)a3;
@end

@implementation MailboxHierarchyNode

- (MailboxHierarchyNode)initWithMailbox:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MailboxHierarchyNode;
  v6 = [(MailboxHierarchyNode *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mailbox, a3);
    if (![(MFMailboxUid *)v7->_mailbox mailboxType])
    {
      v8 = [v5 displayName];
      [(MailboxHierarchyNode *)v7 setDisplayName:v8];
    }
  }

  return v7;
}

- (id)children
{
  return self->_children;
}

- (id)mailbox
{
  return self->_mailbox;
}

- (void)addChild:(id)a3
{
  id v4 = a3;
  children = self->_children;
  id v8 = v4;
  if (!children)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_children;
    self->_children = v6;

    children = self->_children;
    id v4 = v8;
  }
  [(NSMutableArray *)children ef_insertObject:v4 usingSortFunction:sub_100031930 context:0 allowDuplicates:1];
}

- (id)_findNodeForMailbox:(id)a3 removeNode:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(MailboxHierarchyNode *)self children];
  id v8 = [(MailboxHierarchyNode *)self mailbox];

  if (v8 == v6)
  {
    v19 = self;
    v18 = v19;
    if (!v19) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v22;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_msgSend(v13, "mailbox", (void)v21);
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        BOOL v15 = v14 == v6;

        if (v15)
        {
          v17 = v13;
          v18 = v17;
          goto LABEL_18;
        }
        v16 = [v13 children];

        if (v16)
        {
          v17 = [v13 _findNodeForMailbox:v6 removeNode:v4];
          if (v17) {
            goto LABEL_17;
          }
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      v17 = 0;
      v18 = 0;
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    v17 = 0;
LABEL_17:
    v18 = 0;
  }
LABEL_18:

  v19 = v17;
  if (v18)
  {
LABEL_19:
    if (v4) {
      [v7 removeObject:v18];
    }
  }
LABEL_21:

  return v19;
}

- (id)removeNodeForMailbox:(id)a3
{
  v3 = [(MailboxHierarchyNode *)self _findNodeForMailbox:a3 removeNode:1];

  return v3;
}

- (id)findNodeForMailbox:(id)a3
{
  v3 = [(MailboxHierarchyNode *)self _findNodeForMailbox:a3 removeNode:0];

  return v3;
}

- (void)setLevel:(int)a3
{
  self->_level = a3;
}

- (int)level
{
  return self->_level;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)MailboxHierarchyNode;
  v3 = [(MailboxHierarchyNode *)&v7 description];
  BOOL v4 = [(MailboxHierarchyNode *)self mailbox];
  id v5 = +[NSString stringWithFormat:@"%@, %@", v3, v4];

  return v5;
}

- (MFMailboxUid)parentMailbox
{
  return (MFMailboxUid *)objc_getProperty(self, a2, 24, 1);
}

- (void)setParentMailbox:(id)a3
{
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_parentMailbox, 0);
  objc_storeStrong((id *)&self->_mailbox, 0);

  objc_storeStrong((id *)&self->_children, 0);
}

@end