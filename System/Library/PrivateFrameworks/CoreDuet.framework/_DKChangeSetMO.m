@interface _DKChangeSetMO
+ (id)fetchAdditionChangeSetRequest;
+ (id)fetchDeletionChangeSetRequest;
@end

@implementation _DKChangeSetMO

+ (id)fetchAdditionChangeSetRequest
{
  self;
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"AdditionChangeSet"];
  return v0;
}

+ (id)fetchDeletionChangeSetRequest
{
  self;
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"DeletionChangeSet"];
  return v0;
}

@end