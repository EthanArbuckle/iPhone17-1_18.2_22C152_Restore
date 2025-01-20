@interface _MKFNotificationRegistrationActionSet
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (BOOL)validateForInsertOrUpdate:(id *)a3;
- (MKFHome)home;
- (MKFNotificationRegistrationActionSetDatabaseID)databaseID;
@end

@implementation _MKFNotificationRegistrationActionSet

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFNotificationRegistrationActionSet"];
}

- (MKFHome)home
{
  v2 = [(_MKFNotificationRegistrationActionSet *)self user];
  v3 = [v2 home];

  return (MKFHome *)v3;
}

- (MKFNotificationRegistrationActionSetDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFNotificationRegistrationActionSetDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

- (BOOL)validateForInsertOrUpdate:(id *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_MKFNotificationRegistrationActionSet;
  BOOL v5 = -[_MKFModel validateForInsertOrUpdate:](&v9, sel_validateForInsertOrUpdate_);
  if (v5)
  {
    v6 = [(_MKFNotificationRegistrationActionSet *)self actionSet];

    if (v6)
    {
      LOBYTE(v5) = 1;
    }
    else if (a3)
    {
      objc_msgSend(MEMORY[0x263F087E8], "hmd_validationErrorWithDescription:", @"action set is required");
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = 0;
      *a3 = v7;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E5C38E0;
}

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  id v7 = NSString;
  v8 = NSStringFromSelector(a2);
  objc_super v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

@end