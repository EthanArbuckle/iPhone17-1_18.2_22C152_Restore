@interface EKEventAction
+ (Class)frozenClass;
+ (id)knownIdentityKeysForComparison;
- (NSData)externalRepresentation;
- (NSString)externalFolderID;
- (NSString)externalID;
- (NSString)externalModificationTag;
- (NSString)externalScheduleID;
- (void)setExternalFolderID:(id)a3;
- (void)setExternalID:(id)a3;
- (void)setExternalModificationTag:(id)a3;
- (void)setExternalRepresentation:(id)a3;
- (void)setExternalScheduleID:(id)a3;
@end

@implementation EKEventAction

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (id)knownIdentityKeysForComparison
{
  if (knownIdentityKeysForComparison_onceToken_0 != -1) {
    dispatch_once(&knownIdentityKeysForComparison_onceToken_0, &__block_literal_global_6);
  }
  v2 = (void *)knownIdentityKeysForComparison_keys_0;

  return v2;
}

void __47__EKEventAction_knownIdentityKeysForComparison__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = *MEMORY[0x1E4F57158];
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  v1 = (void *)knownIdentityKeysForComparison_keys_0;
  knownIdentityKeysForComparison_keys_0 = v0;
}

- (NSString)externalID
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57158]];
}

- (void)setExternalID:(id)a3
{
}

- (NSString)externalFolderID
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56F30]];
}

- (void)setExternalFolderID:(id)a3
{
}

- (NSString)externalScheduleID
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56F48]];
}

- (void)setExternalScheduleID:(id)a3
{
}

- (NSString)externalModificationTag
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56F38]];
}

- (void)setExternalModificationTag:(id)a3
{
}

- (NSData)externalRepresentation
{
  return (NSData *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56F40]];
}

- (void)setExternalRepresentation:(id)a3
{
}

@end