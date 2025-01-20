@interface CoreThemeSliceMigrationPolicy
- (BOOL)beginEntityMapping:(id)a3 manager:(id)a4 error:(id *)a5;
- (BOOL)createDestinationInstancesForSourceInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6;
- (BOOL)createRelationshipsForDestinationInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6;
- (BOOL)performCustomValidationForEntityMapping:(id)a3 manager:(id)a4 error:(id *)a5;
@end

@implementation CoreThemeSliceMigrationPolicy

- (BOOL)beginEntityMapping:(id)a3 manager:(id)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)createDestinationInstancesForSourceInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6
{
  v16[1] = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)CoreThemeSliceMigrationPolicy;
  BOOL v9 = [(NSEntityMigrationPolicy *)&v15 createDestinationInstancesForSourceInstance:a3 entityMapping:a4 manager:a5 error:a6];
  uint64_t v10 = [a4 name];
  v16[0] = a3;
  v11 = objc_msgSend((id)objc_msgSend(a5, "destinationInstancesForEntityMappingNamed:sourceInstances:", v10, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v16, 1)), "firstObject");
  v12 = (NSString *)[a3 valueForKey:@"sliceRectString"];
  v13 = (void *)MEMORY[0x263F08D40];
  NSRect v17 = NSRectFromString(v12);
  objc_msgSend(v11, "setValue:forKey:", objc_msgSend(v13, "valueWithRect:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height), @"sliceRect");
  return v9;
}

- (BOOL)createRelationshipsForDestinationInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6
{
  v7.receiver = self;
  v7.super_class = (Class)CoreThemeSliceMigrationPolicy;
  return [(NSEntityMigrationPolicy *)&v7 createRelationshipsForDestinationInstance:a3 entityMapping:a4 manager:a5 error:a6];
}

- (BOOL)performCustomValidationForEntityMapping:(id)a3 manager:(id)a4 error:(id *)a5
{
  return 1;
}

@end