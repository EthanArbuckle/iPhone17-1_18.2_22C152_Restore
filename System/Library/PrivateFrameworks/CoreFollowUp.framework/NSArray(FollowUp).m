@interface NSArray(FollowUp)
- (id)fl_map:()FollowUp;
- (id)fl_multiMap:()FollowUp;
@end

@implementation NSArray(FollowUp)

- (id)fl_multiMap:()FollowUp
{
  id v4 = a3;
  if (v4)
  {
    v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __33__NSArray_FollowUp__fl_multiMap___block_invoke;
    v12 = &unk_1E637AD70;
    id v13 = v5;
    id v14 = v4;
    id v6 = v5;
    [a1 enumerateObjectsUsingBlock:&v9];
    v7 = objc_msgSend(v6, "copy", v9, v10, v11, v12);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)fl_map:()FollowUp
{
  id v4 = a3;
  if (v4)
  {
    v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __28__NSArray_FollowUp__fl_map___block_invoke;
    v12 = &unk_1E637AD70;
    id v13 = v5;
    id v14 = v4;
    id v6 = v5;
    [a1 enumerateObjectsUsingBlock:&v9];
    v7 = objc_msgSend(v6, "copy", v9, v10, v11, v12);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end