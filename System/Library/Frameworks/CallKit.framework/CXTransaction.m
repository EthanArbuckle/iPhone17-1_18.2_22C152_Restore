@interface CXTransaction
+ (BOOL)supportsSecureCoding;
- (BOOL)isComplete;
- (CXTransaction)init;
- (CXTransaction)initWithAction:(CXAction *)action;
- (CXTransaction)initWithActions:(NSArray *)actions;
- (CXTransaction)initWithCoder:(id)a3;
- (NSArray)actions;
- (NSMutableOrderedSet)mutableActions;
- (NSString)description;
- (NSUUID)UUID;
- (id)allowedClassesForMutableActions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sanitizedCopy;
- (id)sanitizedCopyWithZone:(_NSZone *)a3;
- (void)addAction:(CXAction *)action;
- (void)addActionsFromTransaction:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setMutableActions:(id)a3;
- (void)setUUID:(id)a3;
- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4;
- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation CXTransaction

- (CXTransaction)initWithActions:(NSArray *)actions
{
  v4 = actions;
  v11.receiver = self;
  v11.super_class = (Class)CXTransaction;
  v5 = [(CXTransaction *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F29128] UUID];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA70] orderedSetWithArray:v4];
    mutableActions = v5->_mutableActions;
    v5->_mutableActions = (NSMutableOrderedSet *)v8;
  }
  return v5;
}

- (CXTransaction)initWithAction:(CXAction *)action
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9 = action;
  v4 = (void *)MEMORY[0x1E4F1C978];
  v5 = action;
  uint64_t v6 = [v4 arrayWithObjects:&v9 count:1];

  v7 = -[CXTransaction initWithActions:](self, "initWithActions:", v6, v9, v10);
  return v7;
}

- (CXTransaction)init
{
  return [(CXTransaction *)self initWithActions:MEMORY[0x1E4F1CBF0]];
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CXTransaction *)self UUID];
  uint64_t v6 = [v5 UUIDString];
  BOOL v7 = [(CXTransaction *)self isComplete];
  uint64_t v8 = [(CXTransaction *)self actions];
  v9 = [v3 stringWithFormat:@"<%@ %p UUID=%@ isComplete=%d actions=%@>", v4, self, v6, v7, v8];

  return (NSString *)v9;
}

- (BOOL)isComplete
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(CXTransaction *)self actions];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (![*(id *)(*((void *)&v9 + 1) + 8 * i) isComplete])
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (NSArray)actions
{
  v2 = [(CXTransaction *)self mutableActions];
  uint64_t v3 = [v2 array];

  return (NSArray *)v3;
}

- (void)addAction:(CXAction *)action
{
  uint64_t v4 = action;
  id v5 = [(CXTransaction *)self mutableActions];
  [v5 addObject:v4];
}

- (void)addActionsFromTransaction:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = objc_msgSend(a3, "actions", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(CXTransaction *)self addAction:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [(CXTransaction *)self UUID];
  [v5 setUUID:v6];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [(CXTransaction *)self mutableActions];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = [*(id *)(*((void *)&v14 + 1) + 8 * v11) sanitizedCopy];
        if (v12)
        {
          v13 = [v5 mutableActions];
          [v13 addObject:v12];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (id)sanitizedCopy
{
  return [(CXTransaction *)self sanitizedCopyWithZone:0];
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(CXTransaction *)self updateSanitizedCopy:v5 withZone:a3];

  return v5;
}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(CXTransaction *)self updateSanitizedCopy:v6 withZone:a4];
  uint64_t v7 = [v6 mutableActions];
  [v7 removeAllObjects];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [(CXTransaction *)self mutableActions];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = (void *)[*(id *)(*((void *)&v14 + 1) + 8 * v12) copy];
        [v6 addAction:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(CXTransaction *)self updateCopy:v5 withZone:a3];
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)allowedClassesForMutableActions
{
  if (allowedClassesForMutableActions_onceToken != -1) {
    dispatch_once(&allowedClassesForMutableActions_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)allowedClassesForMutableActions_allowedClassesForMutableActions;

  return v2;
}

uint64_t __48__CXTransaction_allowedClassesForMutableActions__block_invoke()
{
  v23 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v22 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  objc_msgSend(v23, "setWithObjects:", v22, v21, v20, v19, v18, v17, v16, v15, v14, v13, v12, v11, v0, v1, v2, v3, v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    objc_opt_class(),
  allowedClassesForMutableActions_allowedClassesForMutableActions = 0);

  return MEMORY[0x1F41817F8]();
}

- (CXTransaction)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CXTransaction *)self init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = NSStringFromSelector(sel_UUID);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v8;

    uint64_t v10 = [(CXTransaction *)v5 allowedClassesForMutableActions];
    uint64_t v11 = NSStringFromSelector(sel_mutableActions);
    uint64_t v12 = [v4 decodeObjectOfClasses:v10 forKey:v11];
    mutableActions = v5->_mutableActions;
    v5->_mutableActions = (NSMutableOrderedSet *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CXTransaction *)self UUID];
  uint64_t v6 = NSStringFromSelector(sel_UUID);
  [v4 encodeObject:v5 forKey:v6];

  id v8 = [(CXTransaction *)self mutableActions];
  uint64_t v7 = NSStringFromSelector(sel_mutableActions);
  [v4 encodeObject:v8 forKey:v7];
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (NSMutableOrderedSet)mutableActions
{
  return self->_mutableActions;
}

- (void)setMutableActions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableActions, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

@end