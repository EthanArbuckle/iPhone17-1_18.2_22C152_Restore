@interface EKColor
+ (Class)frozenClass;
+ (id)knownIdentityKeysForComparison;
- (BOOL)save:(id *)a3;
- (BOOL)validate:(id *)a3;
- (EKColor)initWithEventStore:(id)a3;
- (EKSource)source;
- (NSData)data;
- (NSString)UUID;
- (NSString)externalID;
- (NSString)providerIdentifier;
- (void)setData:(id)a3;
- (void)setExternalID:(id)a3;
- (void)setProviderIdentifier:(id)a3;
- (void)setSource:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation EKColor

- (EKColor)initWithEventStore:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)EKColor;
  v3 = [(EKObject *)&v6 init];
  if (v3)
  {
    v4 = EKUUIDString();
    [(EKColor *)v3 setUUID:v4];

    [(EKObject *)v3 updatePersistentValueForKeyIfNeeded:*MEMORY[0x1E4F57150]];
  }
  return v3;
}

+ (id)knownIdentityKeysForComparison
{
  if (knownIdentityKeysForComparison_onceToken_5 != -1) {
    dispatch_once(&knownIdentityKeysForComparison_onceToken_5, &__block_literal_global_35);
  }
  v2 = (void *)knownIdentityKeysForComparison_keys_5;

  return v2;
}

void __41__EKColor_knownIdentityKeysForComparison__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = *MEMORY[0x1E4F57150];
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  v1 = (void *)knownIdentityKeysForComparison_keys_5;
  knownIdentityKeysForComparison_keys_5 = v0;
}

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

- (NSData)data
{
  return (NSData *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56EE8]];
}

- (void)setData:(id)a3
{
}

- (NSString)providerIdentifier
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56EF0]];
}

- (void)setProviderIdentifier:(id)a3
{
}

- (NSString)UUID
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57150]];
}

- (void)setUUID:(id)a3
{
}

- (NSString)externalID
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57158]];
}

- (void)setExternalID:(id)a3
{
}

- (EKSource)source
{
  return (EKSource *)[(EKObject *)self meltedAndCachedSingleRelationObjectForKey:*MEMORY[0x1E4F56EF8]];
}

- (void)setSource:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F56EF8];
  id v5 = a3;
  [(EKObject *)self updateMeltedAndCachedSingleRelationObject:v5 forKey:v4 frozenClass:objc_opt_class()];
}

- (BOOL)validate:(id *)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)EKColor;
  BOOL v5 = -[EKObject validate:](&v16, sel_validate_);
  if (v5)
  {
    if (![(EKObject *)self isNew])
    {
      v18[0] = *MEMORY[0x1E4F56EF8];
      objc_super v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      BOOL v7 = [(EKObject *)self hasUnsavedChangesInKeys:v6];

      if (v7)
      {
        if (a3)
        {
          uint64_t v8 = 72;
LABEL_16:
          id v14 = [MEMORY[0x1E4F28C58] errorWithEKErrorCode:v8];
          LOBYTE(v5) = 0;
          *a3 = v14;
          return v5;
        }
        goto LABEL_17;
      }
    }
    if (![(EKObject *)self isNew])
    {
      uint64_t v17 = *MEMORY[0x1E4F57150];
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
      BOOL v10 = [(EKObject *)self hasUnsavedChangesInKeys:v9];

      if (v10)
      {
        if (a3)
        {
          uint64_t v8 = 74;
          goto LABEL_16;
        }
LABEL_17:
        LOBYTE(v5) = 0;
        return v5;
      }
    }
    v11 = [(EKColor *)self externalID];
    if ([v11 length])
    {
      v12 = [(EKColor *)self providerIdentifier];
      uint64_t v13 = [v12 length];

      if (v13)
      {
        LOBYTE(v5) = 1;
        return v5;
      }
    }
    else
    {
    }
    if (a3)
    {
      uint64_t v8 = 75;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  return v5;
}

- (BOOL)save:(id *)a3
{
  BOOL v5 = [(EKObject *)self isNew];
  if (v5)
  {
    if (a3)
    {
      *a3 = [MEMORY[0x1E4F28C58] errorWithEKErrorCode:73];
    }
  }
  else
  {
    [(EKObject *)self updatePersistentObject];
  }
  return !v5;
}

@end