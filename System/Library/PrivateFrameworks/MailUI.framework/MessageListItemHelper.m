@interface MessageListItemHelper
- (BOOL)_isItemAfterItemIDSelected:(id)a3 snapshot:(id)a4;
- (BOOL)_isItemBeforeItemIDSelected:(id)a3 snapshot:(id)a4;
- (BOOL)_isItemIDSelected:(id)a3;
- (BOOL)_isNextItemLastExpandedItemID:(id)a3 snapshot:(id)a4;
- (MessageListItemHelper)initWithDelegate:(id)a3;
- (MessageListItemHelperDelegate)delegate;
- (id)itemIDAfterItemID:(id)a3 snapshot:(id)a4;
- (id)itemIDBeforeItemID:(id)a3 snapshot:(id)a4;
- (int64_t)cellGroupingForItemID:(id)a3 snapshot:(id)a4 isThreaded:(BOOL)a5;
- (void)setDelegate:(id)a3;
@end

@implementation MessageListItemHelper

- (id)itemIDBeforeItemID:(id)a3 snapshot:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 indexOfItemIdentifier:v5];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = 0;
  }
  else if (v7)
  {
    uint64_t v9 = v7 - 1;
    v10 = [v6 itemIdentifiers];
    v11 = [v10 objectAtIndexedSubscript:v9];

    v12 = [v6 sectionIdentifierForSectionContainingItemIdentifier:v5];
    v13 = [v6 sectionIdentifierForSectionContainingItemIdentifier:v11];
    if (EFObjectsAreEqual()) {
      v14 = v11;
    }
    else {
      v14 = v5;
    }
    id v8 = v14;
  }
  else
  {
    id v8 = v5;
  }

  return v8;
}

- (id)itemIDAfterItemID:(id)a3 snapshot:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 indexOfItemIdentifier:v5];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = 0;
  }
  else
  {
    unint64_t v9 = v7 + 1;
    v10 = [v6 itemIdentifiers];
    if (v9 >= [v10 count])
    {
      id v11 = v5;
    }
    else
    {
      id v11 = [v10 objectAtIndexedSubscript:v9];
    }
    id v8 = v11;
  }
  return v8;
}

- (int64_t)cellGroupingForItemID:(id)a3 snapshot:(id)a4 isThreaded:(BOOL)a5
{
  int v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    v10 = [(MessageListItemHelper *)self delegate];
    id v11 = v10;
    if (v5)
    {
      int v12 = [v10 messageListItemHelper:self isItemIDExpandedThread:v8] ^ 1;
      int v5 = [v11 messageListItemHelper:self anyExpandedThreadContainsItemID:v8];
      int v13 = [(MessageListItemHelper *)self _isNextItemLastExpandedItemID:v8 snapshot:v9] & v5 ^ 1;
    }
    else
    {
      int v12 = 1;
      int v13 = 1;
    }
    BOOL v15 = [(MessageListItemHelper *)self _isItemBeforeItemIDSelected:v8 snapshot:v9];
    BOOL v16 = [(MessageListItemHelper *)self _isItemAfterItemIDSelected:v8 snapshot:v9];
    BOOL v17 = [(MessageListItemHelper *)self _isItemIDSelected:v8];
    if ((v12 & 1) != 0 || v15 && v17)
    {
      int v18 = !v17;
      int v19 = !v16;
      int v20 = v15 || !v17 || !v16;
      int v21 = v20 | v5;
      char v22 = v20 ^ 1;
      if (v5) {
        char v22 = v13;
      }
      if (v21) {
        int64_t v14 = 3;
      }
      else {
        int64_t v14 = 2;
      }
      if ((v22 & 1) == 0)
      {
        int v23 = v13 | v19 | v18;
        int v24 = v18 | !v15;
        int v25 = v24 | v19;
        int v26 = v24 | v16;
        uint64_t v27 = (v18 | v15 | v16) ^ 1u;
        if (!(v13 | (v16 && v17))) {
          uint64_t v27 = 4;
        }
        if (v26 != 1) {
          uint64_t v27 = 4;
        }
        if (v25 != 1) {
          uint64_t v27 = 3;
        }
        if (!v23) {
          uint64_t v27 = 3;
        }
        if ((v12 | !v15) == 1) {
          int64_t v14 = v27;
        }
        else {
          int64_t v14 = 3;
        }
      }
    }
    else
    {
      int64_t v14 = 2;
    }
  }
  else
  {
    int64_t v14 = 0;
  }

  return v14;
}

- (BOOL)_isItemIDSelected:(id)a3
{
  id v4 = a3;
  int v5 = [(MessageListItemHelper *)self delegate];
  id v6 = v5;
  if (v5) {
    char v7 = [v5 messageListItemHelper:self isItemIDSelected:v4];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (MessageListItemHelperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MessageListItemHelperDelegate *)WeakRetained;
}

- (BOOL)_isNextItemLastExpandedItemID:(id)a3 snapshot:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(MessageListItemHelper *)self itemIDAfterItemID:v6 snapshot:a4];
  id v8 = (void *)v7;
  if (v7)
  {
    if ((id)v7 == v6)
    {
      char v11 = 1;
    }
    else
    {
      id v9 = [(MessageListItemHelper *)self delegate];
      char v10 = [v9 messageListItemHelper:self anyExpandedThreadContainsItemID:v8];

      char v11 = v10 ^ 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)_isItemBeforeItemIDSelected:(id)a3 snapshot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MessageListItemHelper *)self itemIDBeforeItemID:v6 snapshot:v7];
  id v9 = v8;
  BOOL v13 = v8
     && ([v8 isEqual:v6] & 1) == 0
     && ([v7 itemIdentifiers],
         char v10 = objc_claimAutoreleasedReturnValue(),
         [v10 firstObject],
         char v11 = objc_claimAutoreleasedReturnValue(),
         char v12 = [v6 isEqual:v11],
         v11,
         v10,
         (v12 & 1) == 0)
     && [(MessageListItemHelper *)self _isItemIDSelected:v9];

  return v13;
}

- (BOOL)_isItemAfterItemIDSelected:(id)a3 snapshot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MessageListItemHelper *)self itemIDAfterItemID:v6 snapshot:v7];
  id v9 = v8;
  BOOL v13 = v8
     && ([v8 isEqual:v6] & 1) == 0
     && ([v7 itemIdentifiers],
         char v10 = objc_claimAutoreleasedReturnValue(),
         [v10 lastObject],
         char v11 = objc_claimAutoreleasedReturnValue(),
         char v12 = [v6 isEqual:v11],
         v11,
         v10,
         (v12 & 1) == 0)
     && [(MessageListItemHelper *)self _isItemIDSelected:v9];

  return v13;
}

- (MessageListItemHelper)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MessageListItemHelper;
  int v5 = [(MessageListItemHelper *)&v8 init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end