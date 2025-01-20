@interface ENCDGroup
+ (id)fetchRequest;
+ (id)groupFromGroup:(id)a3 insertIntoManagedObjectContext:(id)a4;
+ (id)insertIntoManagedObjectContext:(id)a3;
+ (id)predicateForGroupID:(id)a3;
+ (id)predicateForGroupIDs:(id)a3;
+ (id)predicateForStableGroupID:(id)a3;
@end

@implementation ENCDGroup

+ (id)fetchRequest
{
  id v2 = objc_alloc(MEMORY[0x1E4F1C0D0]);
  self;
  v3 = (objc_class *)objc_claimAutoreleasedReturnValue();
  v4 = NSStringFromClass(v3);
  v5 = (void *)[v2 initWithEntityName:v4];

  return v5;
}

+ (id)insertIntoManagedObjectContext:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1C0A8];
  id v5 = a3;
  self;
  v6 = (objc_class *)objc_claimAutoreleasedReturnValue();
  v7 = NSStringFromClass(v6);
  v8 = [v4 entityForName:v7 inManagedObjectContext:v5];

  v9 = (void *)[objc_alloc((Class)a1) initWithEntity:v8 insertIntoManagedObjectContext:v5];
  return v9;
}

+ (id)groupFromGroup:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  id v5 = a3;
  v6 = +[ENCDGroup insertIntoManagedObjectContext:a4];
  v7 = [v5 groupID];
  [v6 setGroupID:v7];

  v8 = [v5 groupID];
  v9 = [v8 stableGroupID];
  [v6 setStableGroupID:v9];

  v10 = [v5 groupID];
  objc_msgSend(v6, "setGroupIDGeneration:", (int)objc_msgSend(v10, "generation"));

  v11 = [v5 sharedApplicationData];
  [v6 setSharedApplicationData:v11];

  v12 = [v5 cypher];

  [v6 setCypher:v12];
  return v6;
}

+ (id)predicateForGroupID:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = a3;
  id v5 = NSStringFromSelector(sel_groupID);
  v6 = [v3 predicateWithFormat:@"%K == %@", v5, v4];

  return v6;
}

+ (id)predicateForGroupIDs:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = a3;
  id v5 = NSStringFromSelector(sel_groupID);
  v6 = [v3 predicateWithFormat:@"%K IN %@", v5, v4];

  return v6;
}

+ (id)predicateForStableGroupID:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = a3;
  id v5 = NSStringFromSelector(sel_stableGroupID);
  v6 = [v3 predicateWithFormat:@"%K == %@", v5, v4];

  return v6;
}

@end