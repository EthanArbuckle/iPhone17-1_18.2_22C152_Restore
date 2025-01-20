@interface CNCardGroup
+ (id)groupForContact:(id)a3;
- (BOOL)addSpacerFromPreviousGroup;
- (BOOL)displaysDropdownMenu;
- (BOOL)useSplitActions;
- (CNCardGroup)initWithContact:(id)a3;
- (CNContact)contact;
- (NSArray)actionItems;
- (NSArray)actions;
- (NSArray)displayItems;
- (NSArray)editingItems;
- (NSString)title;
- (SEL)unwrappedSelectorForAction:(id)a3;
- (id)_loadActionItems;
- (id)addActionWithTitle:(id)a3 menuProvider:(id)a4 destructive:(BOOL)a5;
- (id)addActionWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5;
- (id)addActionWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5 destructive:(BOOL)a6;
- (id)description;
- (id)unwrappedTargetForAction:(id)a3;
- (void)addAction:(id)a3 withTitle:(id)a4;
- (void)addAction:(id)a3 withTitle:(id)a4 color:(id)a5 glyphColor:(id)a6 transportType:(int64_t)a7;
- (void)addAction:(id)a3 withTitle:(id)a4 color:(id)a5 glyphColor:(id)a6 transportType:(int64_t)a7 wrapTitle:(BOOL)a8;
- (void)addAction:(id)a3 withTitle:(id)a4 color:(id)a5 transportType:(int64_t)a6;
- (void)addAction:(id)a3 withTitle:(id)a4 color:(id)a5 transportType:(int64_t)a6 wrapTitle:(BOOL)a7;
- (void)addAction:(id)a3 withTitle:(id)a4 wrapTitle:(BOOL)a5;
- (void)removeActionWithTarget:(id)a3 selector:(SEL)a4;
- (void)removeActionWithTitle:(id)a3;
- (void)removeAllActions;
- (void)setAddSpacerFromPreviousGroup:(BOOL)a3;
- (void)setContact:(id)a3;
- (void)setDisplaysDropdownMenu:(BOOL)a3;
- (void)setUseSplitActions:(BOOL)a3;
@end

@implementation CNCardGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_actionItems, 0);
  objc_storeStrong((id *)&self->_actions, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

- (void)setAddSpacerFromPreviousGroup:(BOOL)a3
{
  self->_addSpacerFromPreviousGroup = a3;
}

- (BOOL)addSpacerFromPreviousGroup
{
  return self->_addSpacerFromPreviousGroup;
}

- (void)setUseSplitActions:(BOOL)a3
{
  self->_useSplitActions = a3;
}

- (BOOL)useSplitActions
{
  return self->_useSplitActions;
}

- (void)setDisplaysDropdownMenu:(BOOL)a3
{
  self->_displaysDropdownMenu = a3;
}

- (BOOL)displaysDropdownMenu
{
  return self->_displaysDropdownMenu;
}

- (NSArray)actions
{
  return &self->_actions->super;
}

- (NSString)title
{
  return self->_title;
}

- (void)setContact:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (id)_loadActionItems
{
  v31[2] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  if ([(CNCardGroup *)self useSplitActions])
  {
    v4 = [(CNCardGroup *)self actions];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      unint64_t v6 = 0;
      do
      {
        v7 = [(CNCardGroup *)self actions];
        unint64_t v8 = [v7 count];

        v9 = [(CNCardGroup *)self actions];
        uint64_t v10 = [v9 objectAtIndexedSubscript:v6];
        v11 = (void *)v10;
        if (v6 + 1 >= v8)
        {
          uint64_t v30 = v10;
          v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
        }
        else
        {
          v31[0] = v10;
          v12 = [(CNCardGroup *)self actions];
          v13 = [v12 objectAtIndexedSubscript:v6 + 1];
          v31[1] = v13;
          v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
        }
        v15 = +[CNCardActionGroupItem actionGroupItemWithActions:v14];
        [v3 addObject:v15];

        v6 += 2;
        v16 = [(CNCardGroup *)self actions];
        unint64_t v17 = [v16 count];
      }
      while (v6 < v17);
    }
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v18 = [(CNCardGroup *)self actions];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = +[CNCardActionGroupItem actionGroupItemWithAction:*(void *)(*((void *)&v25 + 1) + 8 * i)];
          [v3 addObject:v23];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v20);
    }
  }

  return v3;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(CNCardGroup *)self actions];
  unint64_t v6 = [v3 stringWithFormat:@"<%@ %p> %d actions", v4, self, objc_msgSend(v5, "count")];

  return v6;
}

- (void)removeAllActions
{
  [(NSMutableArray *)self->_actions removeAllObjects];
  actionItems = self->_actionItems;
  self->_actionItems = 0;
}

- (void)removeActionWithTitle:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = self->_actions;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "title", (void)v14);
        int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          [(NSMutableArray *)self->_actions removeObject:v10];
          actionItems = self->_actionItems;
          self->_actionItems = 0;

          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (SEL)unwrappedSelectorForAction:(id)a3
{
  id v3 = a3;
  id v4 = [v3 target];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v6 = [v3 target];

    uint64_t v7 = (const char *)[v6 action];
    id v3 = v6;
  }
  else
  {
    uint64_t v7 = (const char *)[v3 selector];
  }

  return v7;
}

- (id)unwrappedTargetForAction:(id)a3
{
  id v3 = a3;
  id v4 = [v3 target];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v6 = [v3 target];

  if (isKindOfClass)
  {
    uint64_t v7 = [v6 target];

    uint64_t v6 = (void *)v7;
  }

  return v6;
}

- (void)removeActionWithTarget:(id)a3 selector:(SEL)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obj = self->_actions;
  uint64_t v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v31;
    uint64_t v10 = &off_1E5494000;
    long long v28 = self;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(id *)(*((void *)&v30 + 1) + 8 * i);
        v13 = [v12 target];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        long long v15 = v12;
        if (isKindOfClass)
        {
          uint64_t v16 = v8;
          uint64_t v17 = v9;
          v18 = a4;
          id v19 = v6;
          long long v15 = [v12 target];

          uint64_t v20 = [v15 target];
          uint64_t v21 = v10;
          objc_opt_class();
          char v22 = objc_opt_isKindOfClass();

          if (v22)
          {
            uint64_t v23 = [v15 target];

            long long v15 = (void *)v23;
          }
          uint64_t v10 = v21;
          id v6 = v19;
          a4 = v18;
          uint64_t v9 = v17;
          uint64_t v8 = v16;
          self = v28;
        }
        -[CNCardGroup unwrappedTargetForAction:](self, "unwrappedTargetForAction:", v15, v28);
        id v24 = (id)objc_claimAutoreleasedReturnValue();
        long long v25 = [(CNCardGroup *)self unwrappedSelectorForAction:v15];
        if (v24 == v6 && v25 == a4)
        {
          [(NSMutableArray *)self->_actions removeObject:v12];
          actionItems = self->_actionItems;
          self->_actionItems = 0;

          goto LABEL_18;
        }
      }
      uint64_t v8 = [(NSMutableArray *)obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_18:
}

- (void)addAction:(id)a3 withTitle:(id)a4 color:(id)a5 glyphColor:(id)a6 transportType:(int64_t)a7 wrapTitle:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  [(CNCardGroup *)self removeActionWithTitle:v16];
  +[CNContactAction contactActionWithTitle:target:selector:destructive:](CNContactAction, "contactActionWithTitle:target:selector:destructive:", v16, v17, sel_performActionWithSender_, [v17 isDestructive]);
  id v20 = (id)objc_claimAutoreleasedReturnValue();

  [v20 setColor:v15];
  [v20 setGlyphColor:v14];

  [v20 setTransportType:a7];
  uint64_t v18 = [v17 showBackgroundPlatter];

  [v20 setShowBackgroundPlatter:v18];
  [v20 setWrapTitle:v8];
  [(NSMutableArray *)self->_actions addObject:v20];
  actionItems = self->_actionItems;
  self->_actionItems = 0;
}

- (void)addAction:(id)a3 withTitle:(id)a4 color:(id)a5 glyphColor:(id)a6 transportType:(int64_t)a7
{
}

- (void)addAction:(id)a3 withTitle:(id)a4 color:(id)a5 transportType:(int64_t)a6 wrapTitle:(BOOL)a7
{
}

- (void)addAction:(id)a3 withTitle:(id)a4 color:(id)a5 transportType:(int64_t)a6
{
}

- (id)addActionWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5
{
  return [(CNCardGroup *)self addActionWithTitle:a3 target:a4 selector:a5 destructive:0];
}

- (id)addActionWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5 destructive:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  v11 = +[CNContactAction contactActionWithTitle:v10 target:a4 selector:a5 destructive:v6];
  [(CNCardGroup *)self addAction:v11 withTitle:v10];

  return v11;
}

- (id)addActionWithTitle:(id)a3 menuProvider:(id)a4 destructive:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  uint64_t v9 = +[CNContactMenuDisplayingAction contactActionWithTitle:v8 menuProvider:a4 destructive:v5];
  [(CNCardGroup *)self addAction:v9 withTitle:v8];

  return v9;
}

- (void)addAction:(id)a3 withTitle:(id)a4 wrapTitle:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  [(CNCardGroup *)self removeActionWithTitle:v9];
  objc_opt_class();
  id v15 = v8;
  if (objc_opt_isKindOfClass()) {
    id v10 = v15;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  if (v11)
  {
    uint64_t v12 = [v11 menuProvider];
    v13 = +[CNContactMenuDisplayingAction contactActionWithTitle:menuProvider:destructive:](CNContactMenuDisplayingAction, "contactActionWithTitle:menuProvider:destructive:", v9, v12, [v11 isDestructive]);

    id v9 = (id)v12;
  }
  else
  {
    v13 = +[CNContactAction contactActionWithTitle:target:selector:destructive:](CNContactAction, "contactActionWithTitle:target:selector:destructive:", v9, v15, sel_performActionWithSender_, [v15 isDestructive]);
  }

  [v13 setWrapTitle:v5];
  [(NSMutableArray *)self->_actions addObject:v13];
  actionItems = self->_actionItems;
  self->_actionItems = 0;
}

- (void)addAction:(id)a3 withTitle:(id)a4
{
}

- (NSArray)actionItems
{
  actionItems = self->_actionItems;
  if (!actionItems)
  {
    id v4 = [(CNCardGroup *)self _loadActionItems];
    BOOL v5 = self->_actionItems;
    self->_actionItems = v4;

    actionItems = self->_actionItems;
  }

  return actionItems;
}

- (NSArray)editingItems
{
  return 0;
}

- (NSArray)displayItems
{
  return 0;
}

- (CNCardGroup)initWithContact:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNCardGroup;
  BOOL v6 = [(CNCardGroup *)&v11 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contact, a3);
    id v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    actions = v7->_actions;
    v7->_actions = v8;
  }
  return v7;
}

+ (id)groupForContact:(id)a3
{
  id v3 = a3;
  id v4 = [[CNCardGroup alloc] initWithContact:v3];

  return v4;
}

@end