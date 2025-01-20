@interface HMUserListeningHistoryUpdateControl
- (BOOL)isEqual:(id)a3;
- (HMUserListeningHistoryUpdateControl)initWithAccessories:(id)a3;
- (NSArray)accessories;
- (id)mutableCopyWithZone:(_NSZone *)a3;
@end

@implementation HMUserListeningHistoryUpdateControl

- (void).cxx_destruct
{
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = +[HMMutableUserListeningHistoryUpdateControl allocWithZone:a3];
  v5 = [(HMUserListeningHistoryUpdateControl *)self accessories];
  v6 = [(HMMutableUserListeningHistoryUpdateControl *)v4 initWithAccessories:v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMUserListeningHistoryUpdateControl *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    if (v6)
    {
      v7 = [MEMORY[0x1E4F1CA80] set];
      v8 = [(HMUserListeningHistoryUpdateControl *)self accessories];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __47__HMUserListeningHistoryUpdateControl_isEqual___block_invoke;
      v20[3] = &unk_1E59438E8;
      id v21 = v7;
      id v9 = v7;
      [v8 enumerateObjectsUsingBlock:v20];

      v10 = [MEMORY[0x1E4F1CA80] set];
      v11 = [(HMUserListeningHistoryUpdateControl *)v6 accessories];
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      v17 = __47__HMUserListeningHistoryUpdateControl_isEqual___block_invoke_2;
      v18 = &unk_1E59438E8;
      id v19 = v10;
      id v12 = v10;
      [v11 enumerateObjectsUsingBlock:&v15];

      char v13 = objc_msgSend(v9, "isEqualToSet:", v12, v15, v16, v17, v18);
    }
    else
    {
      char v13 = 0;
    }
  }
  return v13;
}

uint64_t __47__HMUserListeningHistoryUpdateControl_isEqual___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 uuid];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v3 = [*(id *)(a1 + 32) addObject:v3];
    uint64_t v4 = v6;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

uint64_t __47__HMUserListeningHistoryUpdateControl_isEqual___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 uuid];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v3 = [*(id *)(a1 + 32) addObject:v3];
    uint64_t v4 = v6;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (NSArray)accessories
{
  return (NSArray *)[(NSMutableSet *)self->_internalAccessories allObjects];
}

- (HMUserListeningHistoryUpdateControl)initWithAccessories:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMUserListeningHistoryUpdateControl;
  v5 = [(HMUserListeningHistoryUpdateControl *)&v11 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA80];
    v7 = (void *)[v4 copy];
    uint64_t v8 = [v6 setWithArray:v7];
    internalAccessories = v5->_internalAccessories;
    v5->_internalAccessories = (NSMutableSet *)v8;
  }
  return v5;
}

@end