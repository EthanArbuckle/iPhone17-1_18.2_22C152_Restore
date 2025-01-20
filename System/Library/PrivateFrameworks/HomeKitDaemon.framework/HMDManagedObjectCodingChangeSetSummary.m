@interface HMDManagedObjectCodingChangeSetSummary
- (HMDManagedObjectCodingChangeSetSummary)initWithShortDescriptionForChangeSet:(id)a3 insertedObjectNames:(id)a4 modifiedObjectPropertyNames:(id)a5;
- (NSSet)insertedObjectNames;
- (NSSet)modifiedObjectPropertyNames;
- (NSString)shortDescriptionForChangeSet;
- (id)attributeDescriptions;
@end

@implementation HMDManagedObjectCodingChangeSetSummary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedObjectPropertyNames, 0);
  objc_storeStrong((id *)&self->_insertedObjectNames, 0);
  objc_storeStrong((id *)&self->_shortDescriptionForChangeSet, 0);
}

- (NSSet)modifiedObjectPropertyNames
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (NSSet)insertedObjectNames
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)shortDescriptionForChangeSet
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDManagedObjectCodingChangeSetSummary *)self insertedObjectNames];
  v5 = (void *)[v3 initWithName:@"insertedObjectNames" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDManagedObjectCodingChangeSetSummary *)self modifiedObjectPropertyNames];
  v8 = (void *)[v6 initWithName:@"modifiedObjectPropertyNames" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];

  return v9;
}

- (HMDManagedObjectCodingChangeSetSummary)initWithShortDescriptionForChangeSet:(id)a3 insertedObjectNames:(id)a4 modifiedObjectPropertyNames:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDManagedObjectCodingChangeSetSummary;
  v12 = [(HMDManagedObjectCodingChangeSetSummary *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_shortDescriptionForChangeSet, a3);
    objc_storeStrong((id *)&v13->_insertedObjectNames, a4);
    objc_storeStrong((id *)&v13->_modifiedObjectPropertyNames, a5);
  }

  return v13;
}

@end