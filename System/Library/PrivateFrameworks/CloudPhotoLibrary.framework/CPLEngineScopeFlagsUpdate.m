@interface CPLEngineScopeFlagsUpdate
+ (id)_arrayDescriptionForFlags:(int64_t)a3 remainingFlags:(int64_t *)a4;
+ (id)descriptionForFlags:(int64_t)a3;
+ (id)flagsDescriptionMapping;
- (BOOL)hasFlagUpdates;
- (BOOL)valueForFlag:(int64_t)a3;
- (CPLEngineScopeFlagsUpdate)init;
- (CPLEngineScopeFlagsUpdate)initWithFlags:(int64_t)a3;
- (NSArray)arrayDescription;
- (id)description;
- (int64_t)flags;
- (int64_t)updatedFlagsFromFlags:(int64_t)a3;
- (int64_t)updatedFlagsMask;
- (void)setValue:(BOOL)a3 forFlag:(int64_t)a4;
- (void)updateFlags:(id)a3;
- (void)updateFlags:(int64_t)a3 withFlagsValue:(int64_t)a4;
@end

@implementation CPLEngineScopeFlagsUpdate

- (int64_t)updatedFlagsMask
{
  return self->_updatedFlagsMask;
}

- (int64_t)flags
{
  return self->_flags;
}

- (NSArray)arrayDescription
{
  uint64_t v8 = 0;
  v2 = [(id)objc_opt_class() _arrayDescriptionForFlags:self->_flags remainingFlags:&v8];
  v3 = v2;
  if (v8)
  {
    id v4 = [NSString alloc];
    v5 = objc_msgSend(v4, "initWithFormat:", @"???(0x%lx)", v8);
    id v6 = [v3 arrayByAddingObject:v5];
  }
  else
  {
    id v6 = v2;
  }

  return (NSArray *)v6;
}

- (id)description
{
  if (self->_updatedFlagsMask)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v4 = [(id)objc_opt_class() flagsDescriptionMapping];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __40__CPLEngineScopeFlagsUpdate_description__block_invoke;
    v16[3] = &unk_1E60A74C0;
    v16[4] = self;
    id v5 = v3;
    id v17 = v5;
    [v4 enumerateKeysAndObjectsUsingBlock:v16];

    uint64_t v6 = [v5 count];
    id v7 = [NSString alloc];
    uint64_t v8 = [(id)objc_opt_class() descriptionForFlags:self->_flags];
    v9 = (void *)v8;
    int64_t flags = self->_flags;
    if (v6)
    {
      v11 = [v5 componentsJoinedByString:@", "];
      v12 = (void *)[v7 initWithFormat:@"%@ (0x%lx %@)", v9, flags, v11];
    }
    else
    {
      v12 = (void *)[v7 initWithFormat:@"%@ (0x%lx)", v8, flags];
    }
  }
  else
  {
    id v13 = [NSString alloc];
    v14 = [(id)objc_opt_class() descriptionForFlags:self->_flags];
    v12 = (void *)[v13 initWithFormat:@"%@ (0x%lx)", v14, self->_flags];
  }
  return v12;
}

void __40__CPLEngineScopeFlagsUpdate_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a3;
  uint64_t v5 = [a2 integerValue];
  uint64_t v6 = *(void *)(a1 + 32);
  if ((v5 & ~*(void *)(v6 + 16)) == 0)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)(v6 + 8);
    id v9 = [NSString alloc];
    if ((v7 & ~v8) != 0) {
      v10 = @"-%@";
    }
    else {
      v10 = @"+%@";
    }
    v11 = objc_msgSend(v9, "initWithFormat:", v10, v12);
    [*(id *)(a1 + 40) addObject:v11];
  }
}

- (BOOL)hasFlagUpdates
{
  return self->_updatedFlagsMask != 0;
}

- (int64_t)updatedFlagsFromFlags:(int64_t)a3
{
  return self->_flags & self->_updatedFlagsMask | a3 & ~self->_updatedFlagsMask;
}

- (void)updateFlags:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 updatedFlagsMask];
  uint64_t v6 = [v4 flags];

  [(CPLEngineScopeFlagsUpdate *)self updateFlags:v5 withFlagsValue:v6];
}

- (void)updateFlags:(int64_t)a3 withFlagsValue:(int64_t)a4
{
  int64_t v4 = self->_updatedFlagsMask | a3;
  self->_int64_t flags = self->_flags & ~a3 | a4 & a3;
  self->_updatedFlagsMask = v4;
}

- (void)setValue:(BOOL)a3 forFlag:(int64_t)a4
{
  int64_t flags = self->_flags;
  int64_t v5 = flags & a4;
  if (a3)
  {
    if (v5 == a4) {
      return;
    }
    int64_t v6 = flags | a4;
  }
  else
  {
    if (!v5) {
      return;
    }
    int64_t v6 = flags & ~a4;
  }
  int64_t v7 = self->_updatedFlagsMask | a4;
  self->_int64_t flags = v6;
  self->_updatedFlagsMask = v7;
}

- (BOOL)valueForFlag:(int64_t)a3
{
  return (self->_flags & a3) != 0;
}

- (CPLEngineScopeFlagsUpdate)initWithFlags:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CPLEngineScopeFlagsUpdate;
  result = [(CPLEngineScopeFlagsUpdate *)&v5 init];
  if (result) {
    result->_int64_t flags = a3;
  }
  return result;
}

- (CPLEngineScopeFlagsUpdate)init
{
  v3.receiver = self;
  v3.super_class = (Class)CPLEngineScopeFlagsUpdate;
  return [(CPLEngineScopeFlagsUpdate *)&v3 init];
}

+ (id)descriptionForFlags:(int64_t)a3
{
  if (a3)
  {
    uint64_t v9 = 0;
    objc_super v3 = [a1 _arrayDescriptionForFlags:a3 remainingFlags:&v9];
    int64_t v4 = v3;
    if (v9)
    {
      id v5 = [NSString alloc];
      int64_t v6 = [v4 componentsJoinedByString:@"|"];
      int64_t v7 = (__CFString *)[v5 initWithFormat:@"%@|???(0x%lx)", v6, v9];
    }
    else
    {
      int64_t v7 = [v3 componentsJoinedByString:@"|"];
    }
  }
  else
  {
    int64_t v7 = @"none";
  }
  return v7;
}

+ (id)_arrayDescriptionForFlags:(int64_t)a3 remainingFlags:(int64_t *)a4
{
  if (a3)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2020000000;
    int64_t v18 = a3;
    uint64_t v8 = [a1 flagsDescriptionMapping];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __70__CPLEngineScopeFlagsUpdate__arrayDescriptionForFlags_remainingFlags___block_invoke;
    v11[3] = &unk_1E60A7498;
    id v13 = &v15;
    int64_t v14 = a3;
    id v9 = v7;
    id v12 = v9;
    [v8 enumerateKeysAndObjectsUsingBlock:v11];

    *a4 = v16[3];
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    *a4 = 0;
    id v9 = &unk_1F0D91610;
  }
  return v9;
}

void __70__CPLEngineScopeFlagsUpdate__arrayDescriptionForFlags_remainingFlags___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  uint64_t v5 = [a2 integerValue];
  if (v5 && (v5 & ~*(void *)(a1 + 48)) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) &= ~v5;
    [*(id *)(a1 + 32) addObject:v6];
  }
}

+ (id)flagsDescriptionMapping
{
  if (flagsDescriptionMapping_onceToken != -1) {
    dispatch_once(&flagsDescriptionMapping_onceToken, &__block_literal_global_5350);
  }
  v2 = (void *)flagsDescriptionMapping_descriptions;
  return v2;
}

void __52__CPLEngineScopeFlagsUpdate_flagsDescriptionMapping__block_invoke()
{
  v3[11] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F0D91190;
  v2[1] = &unk_1F0D911A8;
  v3[0] = @"none";
  v3[1] = @"readonly";
  v2[2] = &unk_1F0D911C0;
  v2[3] = &unk_1F0D911D8;
  v3[2] = @"over-quota";
  v3[3] = @"deleted";
  v2[4] = &unk_1F0D911F0;
  v2[5] = &unk_1F0D91208;
  v3[4] = @"disabled";
  v3[5] = @"inactive";
  v2[6] = &unk_1F0D91220;
  v2[7] = &unk_1F0D91238;
  v3[6] = @"scheduled-for-delete";
  v3[7] = @"staged";
  v2[8] = &unk_1F0D91250;
  v2[9] = &unk_1F0D91268;
  v3[8] = @"client-sync";
  v3[9] = @"push-high-priority";
  v2[10] = &unk_1F0D91280;
  v3[10] = @"feature-disabled";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:11];
  v1 = (void *)flagsDescriptionMapping_descriptions;
  flagsDescriptionMapping_descriptions = v0;
}

@end