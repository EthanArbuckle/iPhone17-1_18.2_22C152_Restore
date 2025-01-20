@interface FKFriendGroup
- (BOOL)containsFriend:(id)a3;
- (BOOL)isFull;
- (FKFriendGroup)init;
- (FKFriendGroup)initWithDelegate:(id)a3 groupSize:(unint64_t)a4;
- (FKFriendGroup)initWithGroupSize:(unint64_t)a3;
- (FKFriendGroupDelegate)delegate;
- (NSString)title;
- (id)displayNameForGroupWithSeparator:(id)a3;
- (id)friendAtPosition:(unint64_t)a3;
- (id)friends;
- (int64_t)_firstEmptyPosition;
- (unint64_t)count;
- (unint64_t)positionOfFriend:(id)a3;
- (unint64_t)selectedPosition;
- (void)addFriend:(id)a3 error:(unsigned int *)a4;
- (void)removeFriendAtPosition:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setFriend:(id)a3 atPosition:(unint64_t)a4 error:(unsigned int *)a5;
- (void)setFriends:(id)a3;
- (void)setSelectedPosition:(unint64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation FKFriendGroup

- (FKFriendGroup)initWithDelegate:(id)a3 groupSize:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(FKFriendGroup *)self initWithGroupSize:a4];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    v9 = v8;
  }

  return v8;
}

- (FKFriendGroup)initWithGroupSize:(unint64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)FKFriendGroup;
  v4 = [(FKFriendGroup *)&v12 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263EFF980] array];
    friendsManager = v4->_friendsManager;
    v4->_friendsManager = (NSMutableArray *)v5;

    v4->_groupSize = a3;
    if (a3)
    {
      unint64_t v7 = 0;
      do
      {
        v8 = v4->_friendsManager;
        v9 = [MEMORY[0x263EFF9D0] null];
        [(NSMutableArray *)v8 addObject:v9];

        ++v7;
      }
      while (v7 < v4->_groupSize);
    }
    v10 = v4;
  }

  return v4;
}

- (FKFriendGroup)init
{
  return [(FKFriendGroup *)self initWithGroupSize:10];
}

- (id)friendAtPosition:(unint64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || self->_groupSize <= a3)
  {
    id v5 = 0;
  }
  else
  {
    v3 = -[NSMutableArray objectAtIndex:](self->_friendsManager, "objectAtIndex:");
    v4 = [MEMORY[0x263EFF9D0] null];

    if (v3 == v4) {
      id v5 = 0;
    }
    else {
      id v5 = v3;
    }
  }
  return v5;
}

- (unint64_t)positionOfFriend:(id)a3
{
  return [(NSMutableArray *)self->_friendsManager indexOfObject:a3];
}

- (BOOL)containsFriend:(id)a3
{
  if (a3) {
    return -[NSMutableArray containsObject:](self->_friendsManager, "containsObject:");
  }
  else {
    return 0;
  }
}

- (unint64_t)count
{
  uint64_t v11 = 0;
  objc_super v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v3 = [MEMORY[0x263EFF9D0] null];
  friendsManager = self->_friendsManager;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __22__FKFriendGroup_count__block_invoke;
  v8[3] = &unk_264437D50;
  id v5 = v3;
  id v9 = v5;
  v10 = &v11;
  [(NSMutableArray *)friendsManager enumerateObjectsUsingBlock:v8];
  unint64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __22__FKFriendGroup_count__block_invoke(uint64_t result, uint64_t a2)
{
  if (*(void *)(result + 32) != a2) {
    ++*(void *)(*(void *)(*(void *)(result + 40) + 8) + 24);
  }
  return result;
}

- (BOOL)isFull
{
  return [(FKFriendGroup *)self _firstEmptyPosition] == 0x7FFFFFFFFFFFFFFFLL;
}

- (void)addFriend:(id)a3 error:(unsigned int *)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  unint64_t v7 = [(FKFriendGroup *)self _firstEmptyPosition];
  if ((v7 & 0x8000000000000000) != 0 || v7 >= self->_groupSize)
  {
    v8 = _FKGetLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      v10 = "-[FKFriendGroup addFriend:error:]";
      __int16 v11 = 1024;
      int v12 = 110;
      _os_log_impl(&dword_21CBC2000, v8, OS_LOG_TYPE_DEFAULT, "%s (%d) \"unable to add friend: capacity reached\"", (uint8_t *)&v9, 0x12u);
    }

    *a4 = 1;
  }
  else
  {
    [(FKFriendGroup *)self setFriend:v6 atPosition:v7 error:a4];
  }
}

- (void)setTitle:(id)a3
{
  unint64_t v5 = (unint64_t)a3;
  title = self->_title;
  if (v5 | (unint64_t)title && ![(NSString *)title isEqualToString:v5])
  {
    objc_storeStrong((id *)&self->_title, a3);
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __26__FKFriendGroup_setTitle___block_invoke;
    v7[3] = &unk_264437CB0;
    objc_copyWeak(&v8, &location);
    dispatch_async(MEMORY[0x263EF83A0], v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __26__FKFriendGroup_setTitle___block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 postNotificationName:@"FKFriendGroupTitleChangedNotification" object:WeakRetained];
}

- (void)setFriend:(id)a3 atPosition:(unint64_t)a4 error:(unsigned int *)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (self->_groupSize <= a4)
  {
    int v12 = _FKGetLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315650;
      v17 = "-[FKFriendGroup setFriend:atPosition:error:]";
      __int16 v18 = 1024;
      int v19 = 132;
      __int16 v20 = 2048;
      unint64_t v21 = a4;
      _os_log_impl(&dword_21CBC2000, v12, OS_LOG_TYPE_DEFAULT, "%s (%d) \"unable to add friend at position %tu: out of range\"", (uint8_t *)&v16, 0x1Cu);
    }
    unsigned int v13 = 2;
  }
  else
  {
    int v9 = _FKGetLogSystem();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        __int16 v11 = [v8 displayName];
        int v16 = 136315906;
        v17 = "-[FKFriendGroup setFriend:atPosition:error:]";
        __int16 v18 = 1024;
        int v19 = 142;
        __int16 v20 = 2112;
        unint64_t v21 = (unint64_t)v11;
        __int16 v22 = 2048;
        unint64_t v23 = a4;
        _os_log_impl(&dword_21CBC2000, v9, OS_LOG_TYPE_DEFAULT, "%s (%d) \"setting [%@] in friend list at position %tu\"", (uint8_t *)&v16, 0x26u);
      }
      [(NSMutableArray *)self->_friendsManager setObject:v8 atIndexedSubscript:a4];
      int v12 = [(FKFriendGroup *)self delegate];
      [v12 friendGroup:self didSetFriend:v8 atPosition:a4];
    }
    else
    {
      if (v10)
      {
        int v16 = 136315650;
        v17 = "-[FKFriendGroup setFriend:atPosition:error:]";
        __int16 v18 = 1024;
        int v19 = 138;
        __int16 v20 = 2048;
        unint64_t v21 = a4;
        _os_log_impl(&dword_21CBC2000, v9, OS_LOG_TYPE_DEFAULT, "%s (%d) \"setting empty slot in friend list at position %tu\"", (uint8_t *)&v16, 0x1Cu);
      }

      friendsManager = self->_friendsManager;
      v15 = [MEMORY[0x263EFF9D0] null];
      [(NSMutableArray *)friendsManager setObject:v15 atIndexedSubscript:a4];

      int v12 = [(FKFriendGroup *)self delegate];
      [v12 friendGroup:self didRemoveFriend:0 atPosition:a4];
    }
    unsigned int v13 = 0;
  }

  *a5 = v13;
}

- (void)removeFriendAtPosition:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  unint64_t v5 = -[FKFriendGroup friendAtPosition:](self, "friendAtPosition:");
  if (v5)
  {
    friendsManager = self->_friendsManager;
    unint64_t v7 = [MEMORY[0x263EFF9D0] null];
    [(NSMutableArray *)friendsManager setObject:v7 atIndexedSubscript:a3];

    id v8 = _FKGetLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [v5 displayName];
      int v11 = 136315906;
      int v12 = "-[FKFriendGroup removeFriendAtPosition:]";
      __int16 v13 = 1024;
      int v14 = 160;
      __int16 v15 = 2112;
      unint64_t v16 = (unint64_t)v9;
      __int16 v17 = 2048;
      unint64_t v18 = a3;
      _os_log_impl(&dword_21CBC2000, v8, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Removing friend [%@] from position %lu in friend group\"", (uint8_t *)&v11, 0x26u);
    }
    BOOL v10 = [(FKFriendGroup *)self delegate];
    [v10 friendGroup:self didRemoveFriend:v5 atPosition:a3];
  }
  else
  {
    BOOL v10 = _FKGetLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315650;
      int v12 = "-[FKFriendGroup removeFriendAtPosition:]";
      __int16 v13 = 1024;
      int v14 = 155;
      __int16 v15 = 2048;
      unint64_t v16 = a3;
      _os_log_impl(&dword_21CBC2000, v10, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Position %lu is already empty\"", (uint8_t *)&v11, 0x1Cu);
    }
  }
}

- (void)setFriends:(id)a3
{
  friendsManager = self->_friendsManager;
  id v5 = a3;
  [(NSMutableArray *)friendsManager removeAllObjects];
  [(NSMutableArray *)self->_friendsManager addObjectsFromArray:v5];
}

- (id)friends
{
  return self->_friendsManager;
}

- (int64_t)_firstEmptyPosition
{
  if (!self->_groupSize) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  int64_t v3 = 0;
  while (1)
  {
    v4 = [(NSMutableArray *)self->_friendsManager objectAtIndex:v3];
    id v5 = [MEMORY[0x263EFF9D0] null];

    if (v4 == v5) {
      break;
    }
    if (++v3 >= self->_groupSize) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v3;
}

- (id)displayNameForGroupWithSeparator:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(FKFriendGroup *)self title];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    unint64_t v7 = [(FKFriendGroup *)self title];
  }
  else if ([(NSMutableArray *)self->_friendsManager count])
  {
    id v30 = v4;
    id v8 = [MEMORY[0x263EFF980] array];
    int v9 = [MEMORY[0x263EFF980] array];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    BOOL v10 = self->_friendsManager;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v36 != v13) {
            objc_enumerationMutation(v10);
          }
          __int16 v15 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          unint64_t v16 = [MEMORY[0x263EFF9D0] null];

          if (v15 != v16)
          {
            id v17 = v15;
            int v18 = [v17 hasName];
            uint64_t v19 = [v17 displayName];

            if (v18) {
              __int16 v20 = v8;
            }
            else {
              __int16 v20 = v9;
            }
            [v20 addObject:v19];
          }
        }
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v12);
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v21 = v9;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v32 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = *(void **)(*((void *)&v31 + 1) + 8 * j);
          if ([v26 fkMessageDestinationType] == 2)
          {
            v27 = [v26 componentsSeparatedByString:@"@"];
            v28 = [v27 objectAtIndexedSubscript:0];
            [v8 addObject:v28];
          }
          else
          {
            [v8 addObject:v26];
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v23);
    }

    if ([v8 count])
    {
      id v4 = v30;
      unint64_t v7 = [v8 componentsJoinedByString:v30];
    }
    else
    {
      unint64_t v7 = 0;
      id v4 = v30;
    }
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)selectedPosition
{
  return self->_selectedPosition;
}

- (void)setSelectedPosition:(unint64_t)a3
{
  self->_selectedPosition = a3;
}

- (FKFriendGroupDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FKFriendGroupDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_friendsManager, 0);
}

@end