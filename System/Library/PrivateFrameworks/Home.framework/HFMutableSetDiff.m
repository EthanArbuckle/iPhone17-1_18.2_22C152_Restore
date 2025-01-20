@interface HFMutableSetDiff
- (BOOL)hasChanges;
- (HFMutableSetDiff)initWithFromSet:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)_updateHasChanges;
- (void)addObject:(id)a3;
- (void)addObjects:(id)a3;
- (void)deleteAllObjects;
- (void)deleteObject:(id)a3;
- (void)deleteObjects:(id)a3;
- (void)updateObject:(id)a3;
- (void)updateObjects:(id)a3;
@end

@implementation HFMutableSetDiff

- (HFMutableSetDiff)initWithFromSet:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HFMutableSetDiff;
  v5 = [(HFMutableSetDiff *)&v17 init];
  if (v5)
  {
    if (v4)
    {
      uint64_t v6 = [v4 copy];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x263EFFA08] set];
    }
    fromSet = v5->super._fromSet;
    v5->super._fromSet = (NSSet *)v6;

    uint64_t v8 = [MEMORY[0x263EFF9C0] setWithSet:v5->super._fromSet];
    toSet = v5->super._toSet;
    v5->super._toSet = (NSMutableSet *)v8;

    uint64_t v10 = [MEMORY[0x263EFF9C0] set];
    additions = v5->super._additions;
    v5->super._additions = (NSMutableSet *)v10;

    uint64_t v12 = [MEMORY[0x263EFF9C0] set];
    deletions = v5->super._deletions;
    v5->super._deletions = (NSMutableSet *)v12;

    uint64_t v14 = [MEMORY[0x263EFF9C0] set];
    updates = v5->super._updates;
    v5->super._updates = (NSMutableSet *)v14;
  }
  return v5;
}

- (void)addObject:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    if ([(NSSet *)self->super._fromSet containsObject:v5]
      && ([(NSMutableSet *)self->super._deletions containsObject:v5] & 1) == 0)
    {
      NSLog(&cfstr_AttemptingToAd.isa);
    }
    [(NSMutableSet *)self->super._toSet na_safeAddObject:v5];
    if ([(NSSet *)self->super._fromSet containsObject:v5])
    {
      if ([(NSMutableSet *)self->super._deletions containsObject:v5])
      {
        [(NSMutableSet *)self->super._deletions removeObject:v5];
        [(NSMutableSet *)self->super._updates na_safeAddObject:v5];
      }
    }
    else
    {
      [(NSMutableSet *)self->super._additions na_safeAddObject:v5];
      [(NSMutableSet *)self->super._updates removeObject:v5];
    }
    [(HFMutableSetDiff *)self _updateHasChanges];
  }
  else
  {
    uint64_t v6 = HFLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      v9 = NSStringFromSelector(a2);
      int v10 = 138412546;
      v11 = v8;
      __int16 v12 = 2112;
      v13 = v9;
      _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "Ignoring %@ %@ because object is nil", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)deleteObject:(id)a3
{
  id v4 = a3;
  [(NSMutableSet *)self->super._toSet removeObject:v4];
  if ([(NSSet *)self->super._fromSet containsObject:v4]) {
    [(NSMutableSet *)self->super._deletions na_safeAddObject:v4];
  }
  [(NSMutableSet *)self->super._additions removeObject:v4];
  [(NSMutableSet *)self->super._updates removeObject:v4];
  [(HFMutableSetDiff *)self _updateHasChanges];
}

- (void)deleteAllObjects
{
  [(NSMutableSet *)self->super._toSet removeAllObjects];
  [(NSMutableSet *)self->super._additions removeAllObjects];
  [(NSMutableSet *)self->super._updates removeAllObjects];
  v3 = [MEMORY[0x263EFF9C0] setWithSet:self->super._fromSet];
  deletions = self->super._deletions;
  self->super._deletions = v3;

  [(HFMutableSetDiff *)self _updateHasChanges];
}

- (void)updateObject:(id)a3
{
  id v6 = a3;
  if (!-[NSSet containsObject:](self->super._fromSet, "containsObject:")
    && ([(NSMutableSet *)self->super._toSet containsObject:v6] & 1) == 0)
  {
    id v5 = [MEMORY[0x263F08690] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"HFSetDiff.m", 185, @"Invalid parameter not satisfying: %@", @"[_fromSet containsObject:object] || [_toSet containsObject:object]" object file lineNumber description];
  }
  if ([(NSSet *)self->super._fromSet containsObject:v6])
  {
    [(NSMutableSet *)self->super._updates na_safeAddObject:v6];
    [(HFMutableSetDiff *)self _updateHasChanges];
  }
}

- (void)addObjects:(id)a3
{
  id v8 = a3;
  if ([v8 count])
  {
    if ([(NSSet *)self->super._fromSet intersectsSet:v8]
      && ([(NSMutableSet *)self->super._deletions intersectsSet:v8] & 1) == 0)
    {
      v7 = [MEMORY[0x263F08690] currentHandler];
      [v7 handleFailureInMethod:a2, self, @"HFSetDiff.m", 200, @"Invalid parameter not satisfying: %@", @"![_fromSet intersectsSet:objects] || [_deletions intersectsSet:objects]" object file lineNumber description];
    }
    [(NSMutableSet *)self->super._toSet unionSet:v8];
    id v5 = [(NSMutableSet *)self->super._deletions na_setByIntersectingWithSet:v8];
    id v6 = objc_msgSend(v8, "na_setByRemovingObjectsFromSet:", v5);
    [(NSMutableSet *)self->super._updates minusSet:v6];
    [(NSMutableSet *)self->super._additions unionSet:v6];
    [(NSMutableSet *)self->super._deletions minusSet:v5];
    [(NSMutableSet *)self->super._updates unionSet:v5];
    [(HFMutableSetDiff *)self _updateHasChanges];
  }
}

- (void)updateObjects:(id)a3
{
  id v9 = a3;
  uint64_t v5 = [v9 count];
  id v6 = v9;
  if (v5)
  {
    if (![(NSSet *)self->super._fromSet intersectsSet:v9]
      && ([(NSMutableSet *)self->super._toSet intersectsSet:v9] & 1) == 0)
    {
      id v8 = [MEMORY[0x263F08690] currentHandler];
      [v8 handleFailureInMethod:a2, self, @"HFSetDiff.m", 222, @"Invalid parameter not satisfying: %@", @"[_fromSet intersectsSet:objects] || [_toSet intersectsSet:objects]" object file lineNumber description];
    }
    v7 = [(NSSet *)self->super._fromSet na_setByIntersectingWithSet:v9];
    [(NSMutableSet *)self->super._updates unionSet:v7];
    if ([v7 count]) {
      [(HFMutableSetDiff *)self _updateHasChanges];
    }

    id v6 = v9;
  }
  MEMORY[0x270F9A758](v5, v6);
}

- (void)deleteObjects:(id)a3
{
  id v5 = a3;
  if ([v5 count])
  {
    [(NSMutableSet *)self->super._toSet minusSet:v5];
    id v4 = [(NSSet *)self->super._fromSet na_setByIntersectingWithSet:v5];
    [(NSMutableSet *)self->super._deletions unionSet:v4];
    [(NSMutableSet *)self->super._additions minusSet:v5];
    [(NSMutableSet *)self->super._updates minusSet:v5];
    [(HFMutableSetDiff *)self _updateHasChanges];
  }
}

- (void)_updateHasChanges
{
  BOOL v3 = [(NSMutableSet *)self->super._additions count]
    || [(NSMutableSet *)self->super._deletions count]
    || [(NSMutableSet *)self->super._updates count] != 0;
  self->_hasChanges = v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [HFSetDiff alloc];
  v16 = [(HFSetDiff *)self fromSet];
  id v5 = (void *)[v16 copy];
  id v6 = [(HFSetDiff *)self toSet];
  v7 = (void *)[v6 mutableCopy];
  id v8 = [(HFSetDiff *)self additions];
  id v9 = (void *)[v8 mutableCopy];
  int v10 = [(HFSetDiff *)self deletions];
  v11 = (void *)[v10 mutableCopy];
  __int16 v12 = [(HFSetDiff *)self updates];
  v13 = (void *)[v12 mutableCopy];
  id v14 = [(HFSetDiff *)v4 _initWithFromSet:v5 toSet:v7 additions:v9 deletions:v11 updates:v13];

  return v14;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [HFMutableSetDiff alloc];
  v16 = [(HFSetDiff *)self fromSet];
  id v5 = (void *)[v16 copy];
  id v6 = [(HFSetDiff *)self toSet];
  v7 = (void *)[v6 mutableCopy];
  id v8 = [(HFSetDiff *)self additions];
  id v9 = (void *)[v8 mutableCopy];
  int v10 = [(HFSetDiff *)self deletions];
  v11 = (void *)[v10 mutableCopy];
  __int16 v12 = [(HFSetDiff *)self updates];
  v13 = (void *)[v12 mutableCopy];
  id v14 = [(HFSetDiff *)v4 _initWithFromSet:v5 toSet:v7 additions:v9 deletions:v11 updates:v13];

  [v14 _updateHasChanges];
  return v14;
}

- (BOOL)hasChanges
{
  return self->_hasChanges;
}

@end