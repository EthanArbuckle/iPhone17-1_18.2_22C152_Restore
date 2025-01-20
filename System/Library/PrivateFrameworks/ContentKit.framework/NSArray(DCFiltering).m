@interface NSArray(DCFiltering)
- (uint64_t)filteredArrayForKey:()DCFiltering BOOLValue:;
- (uint64_t)filteredArrayForKey:()DCFiltering intValue:;
- (uint64_t)filteredArrayForKey:()DCFiltering value:;
- (uint64_t)objectMatchingKey:()DCFiltering BOOLValue:;
- (uint64_t)objectMatchingKey:()DCFiltering intValue:;
- (uint64_t)objectMatchingKey:()DCFiltering value:;
@end

@implementation NSArray(DCFiltering)

- (uint64_t)objectMatchingKey:()DCFiltering intValue:
{
  return objc_msgSend(a1, "if_firstObjectWithIntValue:forKey:", a4, a3);
}

- (uint64_t)objectMatchingKey:()DCFiltering BOOLValue:
{
  return objc_msgSend(a1, "if_firstObjectWithBoolValue:forKey:", a4, a3);
}

- (uint64_t)objectMatchingKey:()DCFiltering value:
{
  return objc_msgSend(a1, "if_firstObjectWithValue:forKey:", a4, a3);
}

- (uint64_t)filteredArrayForKey:()DCFiltering intValue:
{
  return objc_msgSend(a1, "if_objectsWithIntValue:forKey:", a4, a3);
}

- (uint64_t)filteredArrayForKey:()DCFiltering BOOLValue:
{
  return objc_msgSend(a1, "if_objectsWithBoolValue:forKey:", a4, a3);
}

- (uint64_t)filteredArrayForKey:()DCFiltering value:
{
  return objc_msgSend(a1, "if_objectsWithValue:forKey:", a4, a3);
}

@end