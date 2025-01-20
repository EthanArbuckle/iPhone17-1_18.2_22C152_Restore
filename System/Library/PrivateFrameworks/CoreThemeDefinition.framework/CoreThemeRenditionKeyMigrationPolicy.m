@interface CoreThemeRenditionKeyMigrationPolicy
- (BOOL)beginEntityMapping:(id)a3 manager:(id)a4 error:(id *)a5;
- (BOOL)createDestinationInstancesForSourceInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6;
- (BOOL)createRelationshipsForDestinationInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6;
- (BOOL)performCustomValidationForEntityMapping:(id)a3 manager:(id)a4 error:(id *)a5;
@end

@implementation CoreThemeRenditionKeyMigrationPolicy

- (BOOL)beginEntityMapping:(id)a3 manager:(id)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)createDestinationInstancesForSourceInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6
{
  v7.receiver = self;
  v7.super_class = (Class)CoreThemeRenditionKeyMigrationPolicy;
  return [(NSEntityMigrationPolicy *)&v7 createDestinationInstancesForSourceInstance:a3 entityMapping:a4 manager:a5 error:a6];
}

- (BOOL)createRelationshipsForDestinationInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6
{
  v21.receiver = self;
  v21.super_class = (Class)CoreThemeRenditionKeyMigrationPolicy;
  BOOL v10 = -[NSEntityMigrationPolicy createRelationshipsForDestinationInstance:entityMapping:manager:error:](&v21, sel_createRelationshipsForDestinationInstance_entityMapping_manager_error_);
  uint64_t v11 = [a4 name];
  v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "sourceInstancesForEntityMappingNamed:destinationInstances:", v11, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", a3)), "objectAtIndex:", 0), "valueForKey:", @"tint");
  if (!v12) {
    return 1;
  }
  BOOL v13 = [v12 integerValue] > 0;
  v14 = (void *)[a5 destinationContext];
  uint64_t v15 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"identifier = %d", v13);
  v16 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "destinationEntityForEntityMapping:", a4), "relationshipsByName"), "objectForKey:", @"presentationState"), "destinationEntity");
  v17 = objc_msgSend(MEMORY[0x263EFF260], "fetchRequestWithEntityName:", objc_msgSend(v16, "name"));
  [v17 setPredicate:v15];
  v20 = 0;
  uint64_t v18 = objc_msgSend((id)objc_msgSend(v14, "executeFetchRequest:error:", v17, &v20), "objectAtIndex:", 0);
  if (!v18 || v20)
  {
    BOOL v10 = 0;
    if (a6) {
      *a6 = v20;
    }
  }
  else
  {
    [a3 setValue:v18 forKey:@"presentationState"];
  }
  return v10;
}

- (BOOL)performCustomValidationForEntityMapping:(id)a3 manager:(id)a4 error:(id *)a5
{
  return 1;
}

@end