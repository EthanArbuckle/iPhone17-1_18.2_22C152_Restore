@interface ACMutableTrackedSet
- (void)addObject:(id)a3;
- (void)addObjectsFromArray:(id)a3;
- (void)removeObject:(id)a3;
@end

@implementation ACMutableTrackedSet

- (void)addObject:(id)a3
{
  underlyingSet = self->super._underlyingSet;
  id v5 = a3;
  [(NSMutableSet *)underlyingSet addObject:v5];
  [(NSMutableDictionary *)self->super._changesDictionary setObject:@"ACChangeTypeAdded" forKey:v5];
}

- (void)removeObject:(id)a3
{
  underlyingSet = self->super._underlyingSet;
  id v5 = a3;
  [(NSMutableSet *)underlyingSet removeObject:v5];
  [(NSMutableDictionary *)self->super._changesDictionary setObject:@"ACChangeTypeRemoved" forKey:v5];
}

- (void)addObjectsFromArray:(id)a3
{
  underlyingSet = self->super._underlyingSet;
  id v5 = a3;
  [(NSMutableSet *)underlyingSet addObjectsFromArray:v5];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__ACMutableTrackedSet_addObjectsFromArray___block_invoke;
  v6[3] = &unk_1E5BCF028;
  v6[4] = self;
  [v5 enumerateObjectsUsingBlock:v6];
}

uint64_t __43__ACMutableTrackedSet_addObjectsFromArray___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) setObject:@"ACChangeTypeAdded" forKey:a2];
}

@end