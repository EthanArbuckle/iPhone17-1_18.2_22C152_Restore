@interface CoreThemeAssetMigrationPolicy
- (BOOL)beginEntityMapping:(id)a3 manager:(id)a4 error:(id *)a5;
- (BOOL)createDestinationInstancesForSourceInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6;
- (BOOL)createRelationshipsForDestinationInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6;
- (BOOL)performCustomValidationForEntityMapping:(id)a3 manager:(id)a4 error:(id *)a5;
@end

@implementation CoreThemeAssetMigrationPolicy

- (BOOL)beginEntityMapping:(id)a3 manager:(id)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)createDestinationInstancesForSourceInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6
{
  v7.receiver = self;
  v7.super_class = (Class)CoreThemeAssetMigrationPolicy;
  return [(NSEntityMigrationPolicy *)&v7 createDestinationInstancesForSourceInstance:a3 entityMapping:a4 manager:a5 error:a6];
}

- (BOOL)createRelationshipsForDestinationInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6
{
  v16[1] = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)CoreThemeAssetMigrationPolicy;
  BOOL v9 = [(NSEntityMigrationPolicy *)&v15 createRelationshipsForDestinationInstance:a3 entityMapping:a4 manager:a5 error:a6];
  uint64_t v10 = [a4 name];
  v16[0] = a3;
  v11 = objc_msgSend((id)objc_msgSend(a5, "sourceInstancesForEntityMappingNamed:destinationInstances:", v10, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v16, 1)), "objectAtIndex:", 0);
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "entity"), "propertiesByName"), "allKeys"), "containsObject:", @"template"))
  {
    int v12 = objc_msgSend((id)objc_msgSend(v11, "valueForKey:", @"template"), "BOOLValue");
    v13 = (void *)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"RenderingMode"];
    objc_msgSend(v13, "setPredicate:", objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"identifier = %d", v12 ^ 1u));
    objc_msgSend(a3, "setValue:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "destinationContext"), "executeFetchRequest:error:", v13, 0), "firstObject"), @"templateRenderingMode");
  }
  return v9;
}

- (BOOL)performCustomValidationForEntityMapping:(id)a3 manager:(id)a4 error:(id *)a5
{
  return 1;
}

@end