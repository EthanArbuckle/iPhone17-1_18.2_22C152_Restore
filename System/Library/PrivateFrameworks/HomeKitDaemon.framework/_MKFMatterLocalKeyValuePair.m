@interface _MKFMatterLocalKeyValuePair
+ (NSPredicate)homeRelation;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
- (BOOL)validateForInsertOrUpdate:(id *)a3;
- (MKFMatterLocalKeyValuePairDatabaseID)databaseID;
@end

@implementation _MKFMatterLocalKeyValuePair

- (MKFMatterLocalKeyValuePairDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFMatterLocalKeyValuePairDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

- (BOOL)validateForInsertOrUpdate:(id *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)_MKFMatterLocalKeyValuePair;
  BOOL v5 = -[HMDManagedObject validateForInsertOrUpdate:](&v11, sel_validateForInsertOrUpdate_);
  if (v5)
  {
    v6 = [(_MKFMatterLocalKeyValuePair *)self valueForKey:@"home"];

    if (v6)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      v7 = (void *)MEMORY[0x263F087E8];
      v8 = [NSString stringWithFormat:@"%@ is required", @"home"];
      v9 = objc_msgSend(v7, "hmd_validationErrorWithDescription:managedObject:attributeName:", v8, self, @"home");

      if (a3) {
        *a3 = v9;
      }

      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E55B648;
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t1 != -1) {
    dispatch_once(&homeRelation__hmf_once_t1, &__block_literal_global_164511);
  }
  v2 = (void *)homeRelation__hmf_once_v2;
  return (NSPredicate *)v2;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFMatterLocalKeyValuePair"];
}

@end