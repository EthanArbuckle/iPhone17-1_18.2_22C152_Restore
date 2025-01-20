@interface NSSet(IntentsFoundation)
- (id)if_compactMap:()IntentsFoundation;
- (id)if_map:()IntentsFoundation;
@end

@implementation NSSet(IntentsFoundation)

- (id)if_compactMap:()IntentsFoundation
{
  return _IFSetTransform(a1, a3);
}

- (id)if_map:()IntentsFoundation
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__NSSet_IntentsFoundation__if_map___block_invoke;
  v8[3] = &unk_1E6CA0C38;
  id v9 = v4;
  id v5 = v4;
  v6 = _IFSetTransform(a1, (uint64_t)v8);

  return v6;
}

@end