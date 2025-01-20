@interface CNCardGameCenterGroup
+ (BOOL)relationshipResultsContainsFriend:(id)a3;
+ (BOOL)shouldShowAddFriendActionForRelationshipResults:(id)a3;
+ (id)actionForRelationshipResults:(id)a3 forContact:(id)a4;
- (CNCardGameCenterGroup)initWithContact:(id)a3 relationshipResults:(id)a4;
- (NSArray)relationshipResults;
- (id)displayItems;
- (void)setRelationshipResults:(id)a3;
@end

@implementation CNCardGameCenterGroup

- (void).cxx_destruct
{
}

- (void)setRelationshipResults:(id)a3
{
}

- (NSArray)relationshipResults
{
  return self->_relationshipResults;
}

- (id)displayItems
{
  v2 = [(CNCardGameCenterGroup *)self relationshipResults];
  v3 = objc_msgSend(v2, "_cn_compactMap:", &__block_literal_global_3);

  return v3;
}

CNCardGameCenterGroupItem *__37__CNCardGameCenterGroup_displayItems__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 relationship] == 2) {
    v3 = [[CNCardGameCenterGroupItem alloc] initWithRelationshipResult:v2];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (CNCardGameCenterGroup)initWithContact:(id)a3 relationshipResults:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CNCardGameCenterGroup;
  v8 = [(CNCardGroup *)&v12 initWithContact:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_relationshipResults, a4);
    v10 = v9;
  }

  return v9;
}

+ (id)actionForRelationshipResults:(id)a3 forContact:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = [(id)objc_opt_class() shouldShowAddFriendActionForRelationshipResults:v6];

  if (v7) {
    v8 = [[CNGameCenterAddFriendAction alloc] initWithContact:v5];
  }
  else {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)shouldShowAddFriendActionForRelationshipResults:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      char v7 = 0;
      uint64_t v8 = *(void *)v13;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
        if (objc_msgSend(v10, "relationship", (void)v12) == 2) {
          break;
        }
        v7 |= [v10 relationship] == 1;
        if (v6 == ++v9)
        {
          uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v6) {
            goto LABEL_4;
          }
          goto LABEL_12;
        }
      }
    }
    char v7 = 0;
LABEL_12:
  }
  else
  {
    char v7 = 0;
  }

  return v7 & 1;
}

+ (BOOL)relationshipResultsContainsFriend:(id)a3
{
  id v3 = objc_msgSend(a3, "_cn_firstObjectPassingTest:", &__block_literal_global_3634);
  BOOL v4 = v3 != 0;

  return v4;
}

BOOL __59__CNCardGameCenterGroup_relationshipResultsContainsFriend___block_invoke(uint64_t a1, void *a2)
{
  return [a2 relationship] == 2;
}

@end