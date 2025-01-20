@interface HFRoomSuggestion
+ (id)priorityComparator;
+ (id)suggestionWithName:(id)a3 priority:(int64_t)a4;
+ (id)suggestionWithName:(id)a3 priority:(int64_t)a4 aliases:(id)a5;
- (NSSet)aliases;
- (NSString)name;
- (int64_t)priority;
@end

@implementation HFRoomSuggestion

+ (id)suggestionWithName:(id)a3 priority:(int64_t)a4
{
  v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = a3;
  v8 = [v6 set];
  v9 = [a1 suggestionWithName:v7 priority:a4 aliases:v8];

  return v9;
}

+ (id)suggestionWithName:(id)a3 priority:(int64_t)a4 aliases:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = objc_opt_new();
  uint64_t v10 = [v8 copy];

  v11 = (void *)v9[1];
  v9[1] = v10;

  v9[3] = a4;
  if (v7)
  {
    id v12 = v7;
  }
  else
  {
    id v12 = [MEMORY[0x263EFFA08] set];
  }
  v13 = (void *)v9[2];
  v9[2] = v12;

  return v9;
}

+ (id)priorityComparator
{
  return &__block_literal_global_149;
}

uint64_t __38__HFRoomSuggestion_priorityComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a2;
  v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a3, "priority"));
  id v7 = NSNumber;
  uint64_t v8 = [v5 priority];

  v9 = [v7 numberWithInteger:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (NSSet)aliases
{
  return self->_aliases;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aliases, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end