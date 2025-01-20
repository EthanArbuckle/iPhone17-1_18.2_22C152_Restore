@interface EKResourceChangeNotification
+ (Class)frozenClass;
+ (id)knownRelationshipMultiValueKeys;
- (NSDate)lastModifiedDate;
- (NSSet)resourceChanges;
- (void)addResourceChange:(id)a3;
- (void)removeResourceChange:(id)a3;
- (void)setLastModifiedDate:(id)a3;
- (void)setResourceChanges:(id)a3;
@end

@implementation EKResourceChangeNotification

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (id)knownRelationshipMultiValueKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__EKResourceChangeNotification_knownRelationshipMultiValueKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (knownRelationshipMultiValueKeys_onceToken_1 != -1) {
    dispatch_once(&knownRelationshipMultiValueKeys_onceToken_1, block);
  }
  v2 = (void *)knownRelationshipMultiValueKeys_keys_1;

  return v2;
}

void __63__EKResourceChangeNotification_knownRelationshipMultiValueKeys__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA48] array];
  [v2 addObject:*MEMORY[0x1E4F57118]];
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)&OBJC_METACLASS___EKResourceChangeNotification;
  v3 = objc_msgSendSuper2(&v6, sel_knownRelationshipMultiValueKeys);
  [v2 addObjectsFromArray:v3];

  uint64_t v4 = [v2 copy];
  v5 = (void *)knownRelationshipMultiValueKeys_keys_1;
  knownRelationshipMultiValueKeys_keys_1 = v4;
}

- (NSDate)lastModifiedDate
{
  return (NSDate *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57110]];
}

- (void)setLastModifiedDate:(id)a3
{
}

- (NSSet)resourceChanges
{
  return (NSSet *)[(EKObject *)self meltedAndCachedMultiRelationObjectsForKey:*MEMORY[0x1E4F57118]];
}

- (void)setResourceChanges:(id)a3
{
}

- (void)addResourceChange:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Nil resource change passed."];
    id v4 = 0;
  }
  [(EKObject *)self addCachedMeltedObject:v4 forMultiValueKey:*MEMORY[0x1E4F57118]];
}

- (void)removeResourceChange:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Nil resource change passed."];
    id v4 = 0;
  }
  [(EKObject *)self removeCachedMeltedObject:v4 forMultiValueKey:*MEMORY[0x1E4F57118]];
}

@end