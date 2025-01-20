@interface CoreThemeAlignmentMigrationPolicy
- (BOOL)beginEntityMapping:(id)a3 manager:(id)a4 error:(id *)a5;
- (BOOL)createDestinationInstancesForSourceInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6;
- (BOOL)createRelationshipsForDestinationInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6;
- (BOOL)performCustomValidationForEntityMapping:(id)a3 manager:(id)a4 error:(id *)a5;
@end

@implementation CoreThemeAlignmentMigrationPolicy

- (BOOL)beginEntityMapping:(id)a3 manager:(id)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)createDestinationInstancesForSourceInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6
{
  v23[1] = *MEMORY[0x263EF8340];
  v22.receiver = self;
  v22.super_class = (Class)CoreThemeAlignmentMigrationPolicy;
  BOOL v9 = [(NSEntityMigrationPolicy *)&v22 createDestinationInstancesForSourceInstance:a3 entityMapping:a4 manager:a5 error:a6];
  uint64_t v10 = [a4 name];
  v23[0] = a3;
  v11 = objc_msgSend((id)objc_msgSend(a5, "destinationInstancesForEntityMappingNamed:sourceInstances:", v10, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v23, 1)), "firstObject");
  v12 = (void *)[a3 valueForKey:@"production"];
  if (objc_msgSend((id)objc_msgSend(v12, "entity"), "isKindOfEntity:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "sourceModel"), "entitiesByName"), "objectForKey:", @"SimpleArtworkElementProduction")))
  {
    v13 = (NSString *)[v12 valueForKey:@"alignmentRectString"];
    v14 = (void *)MEMORY[0x263F08D40];
    NSRect v24 = NSRectFromString(v13);
    v15 = v14;
  }
  else
  {
    CGFloat v16 = *MEMORY[0x263F08670];
    CGFloat v17 = *(double *)(MEMORY[0x263F08670] + 8);
    CGFloat v18 = *(double *)(MEMORY[0x263F08670] + 16);
    CGFloat v19 = *(double *)(MEMORY[0x263F08670] + 24);
    v25.origin.x = *(CGFloat *)MEMORY[0x263F08670];
    v25.origin.y = v17;
    v25.size.width = v18;
    v25.size.height = v19;
    v13 = NSStringFromRect(v25);
    v15 = (void *)MEMORY[0x263F08D40];
    v24.origin.x = v16;
    v24.origin.y = v17;
    v24.size.width = v18;
    v24.size.height = v19;
  }
  uint64_t v20 = objc_msgSend(v15, "valueWithRect:", v24.origin.x, v24.origin.y, v24.size.width, v24.size.height);
  [v11 setValue:v13 forKey:@"alignmentRectString"];
  [v11 setValue:v20 forKey:@"alignmentRect"];
  return v9;
}

- (BOOL)createRelationshipsForDestinationInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6
{
  v7.receiver = self;
  v7.super_class = (Class)CoreThemeAlignmentMigrationPolicy;
  return [(NSEntityMigrationPolicy *)&v7 createRelationshipsForDestinationInstance:a3 entityMapping:a4 manager:a5 error:a6];
}

- (BOOL)performCustomValidationForEntityMapping:(id)a3 manager:(id)a4 error:(id *)a5
{
  return 1;
}

@end